# adlist

广告过滤列表生成器

## 数据源

| 名称 | URL | 说明 |
| --- | --- | --- |
| urlhaus | https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-hosts.txt | 恶意软件过滤 |
| neodev | https://neodev.team/host | 广告过滤 |
| anti-ad-domains | https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-domains.txt | anti-AD 域名 |
| anti-ad-dns | https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/refs/heads/master/discretion/dns.txt | DNS 过滤 |
| anti-ad-pcdn | https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/refs/heads/master/discretion/pcdn.txt | PCDN 过滤 |

## 输出文件

| 文件 | 说明 |
| --- | --- |
| `adlist.txt` | 纯文本域名列表（RouterOS 7.x 直接加载） |
| `adlist.rsc` | Firewall Address List（备用） |

## 使用方法

### 1. RouterOS 7.x 直接加载（推荐）

```routeros
# ============================================
# 广告过滤 - DNS Adlist (RouterOS 7.x)
# ============================================

# 创建 Script
:if ([:len [/system script find name="update-adlist"]] = 0) do={
    /system script add \
        name="update-adlist" \
        source={
            :local addr "https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/adlist/adlist.txt"
            :local result ([/tool fetch mode=https output=user url=$addr as-value])
            :if ($result->"status" = "finished") do={
                /ip dns adlist remove [find list="adlist"]
                /ip dns adlist add list=adlist url=$addr
            }
        } \
        comment="adlist: update-adlist - Update adblock DNS adlist"
}

# 创建 Scheduler
:if ([:len [/system scheduler find name="update-adlist"]] = 0) do={
    /system scheduler add \
        name="update-adlist" \
        start-time=08:40:00 \
        interval=1d \
        on-event="/system script run update-adlist" \
        comment="adlist: update-adlist - Update adblock DNS adlist"
}
```

### 2. Firewall Address List（备用）

```routeros
# ============================================
# 广告过滤 - Firewall Address List
# ============================================

# 创建 Script
:if ([:len [/system script find name="update-adlist-fw"]] = 0) do={
    /system script add \
        name="update-adlist-fw" \
        source={
            :local addr "https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/adlist/adlist.rsc"
            :local result ([/tool fetch mode=https output=user url=$addr as-value])
            :if ($result->"status" = "finished") do={
                /file remove [find name="adlist.rsc"]
                /tool fetch url=$addr
                /ip firewall address-list remove [find list="adlist"]
                /import adlist.rsc
            }
        } \
        comment="adlist: update-adlist-fw - Update adblock address list"
}

# 创建 Scheduler
:if ([:len [/system scheduler find name="update-adlist-fw"]] = 0) do={
    /system scheduler add \
        name="update-adlist-fw" \
        start-time=08:40:00 \
        interval=1d \
        on-event="/system script run update-adlist-fw" \
        comment="adlist: update-adlist-fw - Update adblock address list"
}
```

## 本地生成

```bash
python generators/adlist/generate.py
```

## 定时任务

| 任务 | 时间 | 频率 |
| --- | --- | --- |
| GitHub Actions 生成 | 08:30 | 每天 |
| RouterOS 更新 | 08:40 | 每天 |
