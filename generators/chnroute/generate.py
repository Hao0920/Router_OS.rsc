#!/usr/bin/env python3
"""
chnroute - Generate RouterOS PBR rules and firewall address lists from ispip.clang.cn
Output to output/chnroute/

IPv4:
  - all_cn.txt -> /ip firewall address-list add (Firewall Address Lists)
  - Other ISP  -> /ip route rule add (Route Rules)

IPv6:
  - all_cn_ipv6.txt -> /ipv6 firewall address-list add (Firewall Address Lists)
  - Other ISP IPv6  -> /ipv6 route rule add (Route Rules)
"""

import urllib.request
import os
from itertools import combinations

BASE_URL = "https://ispip.clang.cn"
OUTPUT_DIR = "output/chnroute"

# ==================== IPv4 配置 ====================

# ISP 配置：路由表名 -> (源文件, 描述)
ISPS = {
    "chinatelecom": ("chinatelecom.txt", "China Telecom"),
    "unicom_cnc": ("unicom_cnc.txt", "China Unicom"),
    "cmcc": ("cmcc.txt", "China Mobile"),
    "chinabtn": ("chinabtn.txt", "China Broadcast Network"),
    "othernet": ("othernet.txt", "Other ISPs"),
}

# all_cn 单独处理 -> Firewall Address List
ALL_CN = ("all_cn.txt", "All China Networks")

# ==================== IPv6 配置 ====================

# ISP IPv6 配置：路由表名 -> (源文件, 描述)
ISPS_IPV6 = {
    "chinatelecom": ("chinatelecom_ipv6.txt", "China Telecom IPv6"),
    "unicom_cnc": ("unicom_cnc_ipv6.txt", "China Unicom IPv6"),
    "cmcc": ("cmcc_ipv6.txt", "China Mobile IPv6"),
    "chinabtn": ("chinabtn_ipv6.txt", "China Broadcast Network IPv6"),
    "othernet": ("othernet_ipv6.txt", "Other ISPs IPv6"),
}

# all_cn IPv6 单独处理 -> Firewall Address List
ALL_CN_IPV6 = ("all_cn_ipv6.txt", "All China Networks IPv6")


def fetch_ip_list(filename):
    """从 ispip.clang.cn 获取 IP 段列表"""
    url = f"{BASE_URL}/{filename}"
    try:
        req = urllib.request.Request(url, headers={'User-Agent': 'chnroute-generator'})
        with urllib.request.urlopen(req, timeout=30) as resp:
            content = resp.read().decode('utf-8')
        lines = [l.strip() for l in content.splitlines()
                if l.strip() and not l.startswith('#')]
        return lines
    except Exception as e:
        print(f"Error fetching {filename}: {e}")
        return []


# ==================== IPv4 生成函数 ====================

def generate_address_list_rsc(list_name, src_file, description):
    """生成 Firewall Address List .rsc 文件 (IPv4)"""
    ip_list = fetch_ip_list(src_file)

    lines = [
        f"# {list_name} Firewall Address List",
        f"# Generated from {BASE_URL}/{src_file}",
        f"# Description: {description}",
        f"# Total: {len(ip_list)} entries",
        "",
    ]

    for ip in ip_list:
        lines.append(
            f'/ip firewall address-list add list={list_name} '
            f'address={ip} '
            f'comment="ispconf: {list_name} - {description}"'
        )

    lines.append("")

    filepath = os.path.join(OUTPUT_DIR, f"{list_name}.rsc")
    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Generated {filepath}: {len(ip_list)} address-list entries")
    return len(ip_list)


def generate_single_route_rsc(table_name, src_file, description):
    """生成单个 ISP 的 Route Rule .rsc 文件 (IPv4)"""
    ip_list = fetch_ip_list(src_file)

    lines = [
        f"# {table_name} PBR rules",
        f"# Generated from {BASE_URL}/{src_file}",
        f"# Description: {description}",
        f"# Total: {len(ip_list)} entries",
        "",
    ]

    for ip in ip_list:
        lines.append(
            f'/ip route rule add dst-address={ip} '
            f'action=lookup table={table_name} '
            f'comment="ispconf: {table_name} - {description}"'
        )

    lines.append("")

    filepath = os.path.join(OUTPUT_DIR, f"{table_name}.rsc")
    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Generated {filepath}: {len(ip_list)} rules")
    return len(ip_list)


def generate_combo_route_rsc(isp_list):
    """生成组合 Route Rule .rsc 文件 (IPv4)"""
    all_ips = []
    total = 0

    for isp in isp_list:
        src_file, description = ISPS[isp]
        ip_list = fetch_ip_list(src_file)
        total += len(ip_list)
        for ip in ip_list:
            all_ips.append((ip, isp, description))

    combo_name = "-".join(isp_list)
    desc_parts = [ISPS[isp][1] for isp in isp_list]
    combo_desc = " + ".join(desc_parts)

    lines = [
        f"# {combo_name} PBR rules",
        f"# Generated from {BASE_URL}",
        f"# Description: {combo_desc}",
        f"# Total: {total} entries",
        "",
    ]

    for ip, isp, description in all_ips:
        lines.append(
            f'/ip route rule add dst-address={ip} '
            f'action=lookup table={isp} '
            f'comment="ispconf: {isp} - {description}"'
        )

    lines.append("")

    filepath = os.path.join(OUTPUT_DIR, f"{combo_name}.rsc")
    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Generated {filepath}: {total} rules")
    return total


# ==================== IPv6 生成函数 ====================

def generate_address_list_v6_rsc(list_name, src_file, description):
    """生成 Firewall Address List .rsc 文件 (IPv6)"""
    ip_list = fetch_ip_list(src_file)

    lines = [
        f"# {list_name} Firewall Address List (IPv6)",
        f"# Generated from {BASE_URL}/{src_file}",
        f"# Description: {description}",
        f"# Total: {len(ip_list)} entries",
        "",
    ]

    for ip in ip_list:
        lines.append(
            f'/ipv6 firewall address-list add list={list_name} '
            f'address={ip} '
            f'comment="ispconf: {list_name} - {description}"'
        )

    lines.append("")

    filepath = os.path.join(OUTPUT_DIR, f"{list_name}.rsc")
    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Generated {filepath}: {len(ip_list)} address-list entries (IPv6)")
    return len(ip_list)


def generate_single_route_v6_rsc(table_name, src_file, description):
    """生成单个 ISP 的 Route Rule .rsc 文件 (IPv6)"""
    ip_list = fetch_ip_list(src_file)

    lines = [
        f"# {table_name} PBR rules (IPv6)",
        f"# Generated from {BASE_URL}/{src_file}",
        f"# Description: {description}",
        f"# Total: {len(ip_list)} entries",
        "",
    ]

    for ip in ip_list:
        lines.append(
            f'/ipv6 route rule add dst-address={ip} '
            f'action=lookup table={table_name} '
            f'comment="ispconf: {table_name} - {description}"'
        )

    lines.append("")

    filepath = os.path.join(OUTPUT_DIR, f"{table_name}.rsc")
    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Generated {filepath}: {len(ip_list)} rules (IPv6)")
    return len(ip_list)


def generate_combo_route_v6_rsc(isp_list):
    """生成组合 Route Rule .rsc 文件 (IPv6)"""
    all_ips = []
    total = 0

    for isp in isp_list:
        src_file, description = ISPS_IPV6[isp]
        ip_list = fetch_ip_list(src_file)
        total += len(ip_list)
        for ip in ip_list:
            all_ips.append((ip, isp, description))

    combo_name = "-".join(isp_list) + "_ipv6"
    desc_parts = [ISPS_IPV6[isp][1] for isp in isp_list]
    combo_desc = " + ".join(desc_parts)

    lines = [
        f"# {combo_name} PBR rules (IPv6)",
        f"# Generated from {BASE_URL}",
        f"# Description: {combo_desc}",
        f"# Total: {total} entries",
        "",
    ]

    for ip, isp, description in all_ips:
        lines.append(
            f'/ipv6 route rule add dst-address={ip} '
            f'action=lookup table={isp} '
            f'comment="ispconf: {isp} - {description}"'
        )

    lines.append("")

    filepath = os.path.join(OUTPUT_DIR, f"{combo_name}.rsc")
    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Generated {filepath}: {total} rules (IPv6)")
    return total


# ==================== 主函数 ====================

def main():
    # 确保输出目录存在
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # ==================== IPv4 ====================

    # 1. 生成 all_cn.rsc -> Firewall Address List
    all_cn_name, all_cn_desc = ALL_CN
    generate_address_list_rsc("all_cn", all_cn_name, all_cn_desc)

    # 2. 生成单个 ISP Route Rules (IPv4)
    for isp, (src_file, description) in ISPS.items():
        generate_single_route_rsc(isp, src_file, description)

    # 3. 生成所有组合 Route Rules (IPv4)
    isp_names = list(ISPS.keys())
    non_othernet = [isp for isp in isp_names if isp != "othernet"]

    # 从 non_othernet 中选 1-4 个，加上 othernet
    for i in range(1, len(non_othernet) + 1):
        for combo in combinations(non_othernet, i):
            isp_list = list(combo) + ["othernet"]
            generate_combo_route_rsc(isp_list)

    # ==================== IPv6 ====================

    # 4. 生成 all_cn_ipv6.rsc -> Firewall Address List (IPv6)
    all_cn_v6_name, all_cn_v6_desc = ALL_CN_IPV6
    generate_address_list_v6_rsc("all_cn_ipv6", all_cn_v6_name, all_cn_v6_desc)

    # 5. 生成单个 ISP Route Rules (IPv6)
    for isp, (src_file, description) in ISPS_IPV6.items():
        generate_single_route_v6_rsc(f"{isp}_ipv6", src_file, description)

    # 6. 生成所有组合 Route Rules (IPv6)
    isp_names_v6 = list(ISPS_IPV6.keys())
    non_othernet_v6 = [isp for isp in isp_names_v6 if isp != "othernet"]

    # 从 non_othernet_v6 中选 1-4 个，加上 othernet
    for i in range(1, len(non_othernet_v6) + 1):
        for combo in combinations(non_othernet_v6, i):
            isp_list = list(combo) + ["othernet"]
            generate_combo_route_v6_rsc(isp_list)

    print("\nDone!")


if __name__ == "__main__":
    main()
