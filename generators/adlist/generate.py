#!/usr/bin/env python3
"""
adlist - Generate adblock domain lists from multiple sources
Output to output/adlist/

RouterOS 7.x can directly load adlist from URL:
  /ip dns adlist add list=adlist url=https://.../adlist.txt

Sources:
  - urlhaus-filter-hosts.txt (恶意软件过滤)
  - neodev.team/host (广告过滤)
  - anti-ad-domains.txt (anti-AD 域名)
  - anti-ad dns.txt (DNS 过滤)
  - anti-ad pcdn.txt (PCDN 过滤)
"""

import urllib.request
import os
import re

OUTPUT_DIR = "output/adlist"

# 数据源配置：名称 -> URL 或 URL 列表
SOURCES = {
    "urlhaus": "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-hosts.txt",
    "neodev": "https://neodev.team/host",
    "anti-ad-domains": "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-domains.txt",
    "anti-ad-dns": "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/refs/heads/master/discretion/dns.txt",
    "anti-ad-pcdn": "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/refs/heads/master/discretion/pcdn.txt",
}


def fetch_list(urls, source_name):
    """从 URL 获取列表，支持多 URL 容错"""
    if isinstance(urls, str):
        urls = [urls]

    for url in urls:
        try:
            req = urllib.request.Request(url, headers={'User-Agent': 'adlist-generator'})
            with urllib.request.urlopen(req, timeout=60) as resp:
                content = resp.read().decode('utf-8', errors='ignore')

            domains = set()
            for line in content.splitlines():
                line = line.strip().lower()
                if not line or line.startswith(('#', '!')):
                    continue

                if line.startswith(('0.0.0.0', '127.0.0.1', '::1')):
                    parts = line.split()
                    for domain in parts[1:]:
                        if is_valid_domain(domain):
                            domains.add(domain)
                else:
                    if is_valid_domain(line):
                        domains.add(line)

            print(f"  {source_name}: {len(domains)} domains (from {url})")
            return domains
        except Exception as e:
            print(f"  Warning: {source_name} failed on {url}: {e}")

    print(f"  Error: {source_name} all sources failed")
    return set()


def is_valid_domain(domain):
    """验证域名是否有效"""
    # 跳过通配符和特殊字符
    if '*' in domain or '?' in domain:
        return False

    # 基本域名验证
    pattern = r'^[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)*$'
    return re.match(pattern, domain) is not None


def generate_adlist_txt(domains, filename="adlist.txt"):
    """生成纯文本域名列表（RouterOS 7.x 可直接加载）"""

    lines = [
        "# Adblock domain list",
        "# Generated from multiple sources",
        f"# Total: {len(domains)} entries",
        "",
    ]

    for domain in sorted(domains):
        lines.append(domain)

    lines.append("")

    filepath = os.path.join(OUTPUT_DIR, filename)
    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Generated {filepath}: {len(domains)} entries")
    return len(domains)


def generate_adlist_rsc(domains, list_name="adlist", description="Adblock domains"):
    """生成 RouterOS address list .rsc 文件（备用）"""

    lines = [
        f"# {list_name} Firewall Address List",
        f"# Generated from multiple sources",
        f"# Description: {description}",
        f"# Total: {len(domains)} entries",
        "",
    ]

    for domain in sorted(domains):
        lines.append(
            f'/ip firewall address-list add list={list_name} '
            f'address={domain} '
            f'comment="adlist: {domain}"'
        )

    lines.append("")

    filepath = os.path.join(OUTPUT_DIR, f"{list_name}.rsc")
    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Generated {filepath}: {len(domains)} entries")
    return len(domains)


def clean_output_dir():
    """清空输出目录"""
    if os.path.exists(OUTPUT_DIR):
        for file in os.listdir(OUTPUT_DIR):
            if file.endswith('.rsc') or file.endswith('.txt'):
                filepath = os.path.join(OUTPUT_DIR, file)
                os.remove(filepath)
                print(f"Removed: {filepath}")
    print(f"Cleaned {OUTPUT_DIR}\n")


def main():
    # 确保输出目录存在
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # 清空旧文件
    clean_output_dir()

    # 获取所有数据源
    all_domains = set()

    print("Fetching adlist sources...")
    for name, urls in SOURCES.items():
        domains = fetch_list(urls, name)
        all_domains.update(domains)

    print(f"\nTotal unique domains: {len(all_domains)}")

    # 生成文件
    print("\nGenerating files...")
    generate_adlist_txt(all_domains, "adlist.txt")  # RouterOS 7.x 直接加载
    generate_adlist_rsc(all_domains, "adlist", "Adblock domains")  # 备用

    print("\nDone!")


if __name__ == "__main__":
    main()
