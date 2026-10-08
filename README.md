# Router_OS.rsc

RouterOS 脚本生成器集合

由 GitHub Actions 自动构建

## 生成器

| 名称 | 说明 | 输出目录 |
| --- | --- | --- |
| [chnroute](generators/chnroute/) | 中国大陆运营商策略路由 | `output/chnroute/` |

## 数据说明

- **IPNetDB**: 更精确的运营商分类
- **APNIC**: 官方数据，更完整
- 两个数据源合并去重，生成最终文件

## 文件命名规则

| 类型 | 文件名后缀 | List/Table 名称 | 说明 |
| --- | --- | --- | --- |
| IPv4 Address List | `_ipv4.rsc` | 不带后缀 | 防火墙地址列表 |
| IPv6 Address List | `_ipv6.rsc` | 不带后缀 | IPv6 防火墙地址列表 |
| IPv4 Route Rules | `_ipv4.rsc` | 不带后缀 | IPv4 策略路由 |
| IPv6 Route Rules | `_ipv6.rsc` | 不带后缀 | IPv6 策略路由 |

## ISP 列表

- `chinatelecom` - 中国电信
- `unicom_cnc` - 中国联通
- `cmcc` - 中国移动
- `chinabtn` - 中国广电
- `cernet` - 中国教育网
- `gwbn` - 长城宽带
- `othernet` - 其他 ISP

## 使用方法

### 1. IPv4 策略路由（全覆盖）

```routeros
# ============================================
# IPv4 策略路由 - 全覆盖版本
# 包含: 电信+联通+移动+广电+教育网+长城宽带+其他
# ============================================

# 请修改以下变量为你的实际内网 IP
:local MAIN_IP "10.0.0.14"
:local CHINATELECOM_IP "10.0.101.2"
:local UNICOM_IP "10.0.102.2"
:local CMCC_IP "10.0.2.2"
:local CHINABTN_IP "10.0.3.2"
:local CERNET_IP "10.0.4.2"
:local GWBN_IP "10.0.5.2"
:local OTHERNET_IP "10.0.6.2"

:local addr "https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/chnroute/chinatelecom-unicom_cnc-cmcc-chinabtn-cernet-gwbn-othernet_ipv4.rsc"
:local result ([/tool fetch mode=https output=user url=$addr as-value])
:if ($result->"status" = "finished") do={
    /file remove [find name="chinatelecom-unicom_cnc-cmcc-chinabtn-cernet-gwbn-othernet_ipv4.rsc"]
    /tool fetch url=$addr
    /ip route rule remove [find table=main]
    /ip route rule remove [find table=chinatelecom]
    /ip route rule remove [find table=unicom_cnc]
    /ip route rule remove [find table=cmcc]
    /ip route rule remove [find table=chinabtn]
    /ip route rule remove [find table=cernet]
    /ip route rule remove [find table=gwbn]
    /ip route rule remove [find table=othernet]
    /ip route rule add src-address=$MAIN_IP/32 action=lookup table=main
    /ip route rule add src-address=$CHINATELECOM_IP/32 action=lookup table=chinatelecom
    /ip route rule add src-address=$UNICOM_IP/32 action=lookup table=unicom_cnc
    /ip route rule add src-address=$CMCC_IP/32 action=lookup table=cmcc
    /ip route rule add src-address=$CHINABTN_IP/32 action=lookup table=chinabtn
    /ip route rule add src-address=$CERNET_IP/32 action=lookup table=cernet
    /ip route rule add src-address=$GWBN_IP/32 action=lookup table=gwbn
    /ip route rule add src-address=$OTHERNET_IP/32 action=lookup table=othernet
    /import chinatelecom-unicom_cnc-cmcc-chinabtn-cernet-gwbn-othernet_ipv4.rsc
}
```

### 2. IPv4 地址列表

```routeros
# ============================================
# IPv4 地址列表 - 中国大陆全覆盖
# ============================================

:local addr "https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/chnroute/all_cn_ipv4.rsc"
:local result ([/tool fetch mode=https output=user url=$addr as-value])
:if ($result->"status" = "finished") do={
    /file remove [find name="all_cn_ipv4.rsc"]
    /tool fetch url=$addr
    /ip firewall address-list remove [find list="all_cn"]
    /import all_cn_ipv4.rsc
}
```

### 3. IPv6 策略路由（全覆盖）

```routeros
# ============================================
# IPv6 策略路由 - 全覆盖版本
# 包含: 电信+联通+移动+广电+教育网+长城宽带+其他
# ============================================

# 请修改以下变量为你的实际内网 IPv6
:local MAIN_IPV6 "2001:db8::1"
:local CHINATELECOM_IPV6 "2001:db8::101"
:local UNICOM_IPV6 "2001:db8::102"
:local CMCC_IPV6 "2001:db8::2"
:local CHINABTN_IPV6 "2001:db8::3"
:local CERNET_IPV6 "2001:db8::4"
:local GWBN_IPV6 "2001:db8::5"
:local OTHERNET_IPV6 "2001:db8::6"

:local addr "https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/chnroute/chinatelecom-unicom_cnc-cmcc-chinabtn-cernet-gwbn-othernet_ipv6.rsc"
:local result ([/tool fetch mode=https output=user url=$addr as-value])
:if ($result->"status" = "finished") do={
    /file remove [find name="chinatelecom-unicom_cnc-cmcc-chinabtn-cernet-gwbn-othernet_ipv6.rsc"]
    /tool fetch url=$addr
    /ipv6 route rule remove [find table=main]
    /ipv6 route rule remove [find table=chinatelecom]
    /ipv6 route rule remove [find table=unicom_cnc]
    /ipv6 route rule remove [find table=cmcc]
    /ipv6 route rule remove [find table=chinabtn]
    /ipv6 route rule remove [find table=cernet]
    /ipv6 route rule remove [find table=gwbn]
    /ipv6 route rule remove [find table=othernet]
    /ipv6 route rule add src-address=$MAIN_IPV6/128 action=lookup table=main
    /ipv6 route rule add src-address=$CHINATELECOM_IPV6/128 action=lookup table=chinatelecom
    /ipv6 route rule add src-address=$UNICOM_IPV6/128 action=lookup table=unicom_cnc
    /ipv6 route rule add src-address=$CMCC_IPV6/128 action=lookup table=cmcc
    /ipv6 route rule add src-address=$CHINABTN_IPV6/128 action=lookup table=chinabtn
    /ipv6 route rule add src-address=$CERNET_IPV6/128 action=lookup table=cernet
    /ipv6 route rule add src-address=$GWBN_IPV6/128 action=lookup table=gwbn
    /ipv6 route rule add src-address=$OTHERNET_IPV6/128 action=lookup table=othernet
    /import chinatelecom-unicom_cnc-cmcc-chinabtn-cernet-gwbn-othernet_ipv6.rsc
}
```

### 4. IPv6 地址列表

```routeros
# ============================================
# IPv6 地址列表 - 中国大陆全覆盖
# ============================================

:local addr "https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/chnroute/all_cn_ipv6.rsc"
:local result ([/tool fetch mode=https output=user url=$addr as-value])
:if ($result->"status" = "finished") do={
    /file remove [find name="all_cn_ipv6.rsc"]
    /tool fetch url=$addr
    /ipv6 firewall address-list remove [find list="all_cn"]
    /import all_cn_ipv6.rsc
}
```

## 本地生成

```bash
python generators/chnroute/generate.py
```

## 添加新版生成器

1. 在 `generators/` 下创建新目录
2. 编写 `generate.py` 脚本
3. 在 `.github/workflows/` 中添加 workflow
4. 输出到 `output/你的生成器名称/`
