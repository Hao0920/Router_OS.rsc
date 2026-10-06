#!/usr/bin/env python3
"""
chnroute - Generate RouterOS PBR rules from ispip.clang.cn
Output to output/chnroute/
"""

import urllib.request
import os
from itertools import combinations

BASE_URL = "https://ispip.clang.cn"
OUTPUT_DIR = "output/chnroute"

# ISP 配置：路由表名 -> (源文件, 描述)
ISPS = {
    "chinatelecom": ("chinatelecom.txt", "China Telecom"),
    "unicom_cnc": ("unicom_cnc.txt", "China Unicom"),
    "cmcc": ("cmcc.txt", "China Mobile"),
    "chinabtn": ("chinabtn.txt", "China Broadcast Network"),
    "othernet": ("othernet.txt", "Other ISPs"),
}

# all_cn 单独处理
ALL_CN = ("all_cn.txt", "All China Networks")


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


def generate_single_rsc(table_name, src_file, description):
    """生成单个运营商的 .rsc 文件"""
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


def generate_combo_rsc(isp_list):
    """生成组合 .rsc 文件"""
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


def main():
    # 确保输出目录存在
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # 1. 生成 all_cn.rsc
    all_cn_name, all_cn_desc = ALL_CN
    generate_single_rsc("all_cn", all_cn_name, all_cn_desc)

    # 2. 生成所有组合（必须包含 othernet）
    isp_names = list(ISPS.keys())
    non_othernet = [isp for isp in isp_names if isp != "othernet"]

    # 从 non_othernet 中选 1-4 个，加上 othernet
    for i in range(1, len(non_othernet) + 1):
        for combo in combinations(non_othernet, i):
            isp_list = list(combo) + ["othernet"]
            generate_combo_rsc(isp_list)

    print("\nDone!")


if __name__ == "__main__":
    main()
