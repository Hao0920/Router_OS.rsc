#### 处理数据 ####
## misakaio/chnroutes2
mkdir -p ./Cache/Geoip/Process/misakaio/chnroutes2
sed -e '/#/d' ./Cache/Geoip/Upstream/misakaio/chnroutes2/Geoip.txt > ./Cache/Geoip/Process/misakaio/chnroutes2/Geoip.txt

## Loyalsoldier/geoip
mkdir -p ./Cache/Geoip/Process/Loyalsoldier/geoip
# 删除 IPv6
sed -e '/:/d' ./Cache/Geoip/Upstream/Loyalsoldier/geoip/private.txt > ./Cache/Geoip/Process/Loyalsoldier/geoip/private-ipv4.txt
# 删除 IPv4
sed -e '/^(?:(?:\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$/d' ./Cache/Geoip/Upstream/Loyalsoldier/geoip/private.txt > ./Cache/Geoip/Process/Loyalsoldier/geoip/private-ipv6.txt
{
    cat ./Source/Geoip/Apple_Push_Notification_Service/IPv4.txt
#    cat ./Cache/Geoip/Upstream/Hackl0us/GeoIP2-CN/CN-ip-cidr.txt
    cat ./Cache/Geoip/Process/misakaio/chnroutes2/Geoip.txt
    cat ./Cache/Geoip/Upstream/pexcn/daily/chnroute.txt
    cat ./Cache/Geoip/Upstream/Clang.CN/all_cn_cidr.txt
    cat ./Cache/Geoip/Process/Loyalsoldier/geoip/private-ipv4.txt
} > ./Cache/Geoip/Process/IPv4-1.txt
sort -u ./Cache/Geoip/Process/IPv4-1.txt > ./Cache/Geoip/Process/IPv4.txt

{
    cat ./Source/Geoip/Apple_Push_Notification_Service/IPv6.txt
    cat ./Cache/Geoip/Upstream/Clang.CN/all_cn_ipv6.txt
    cat ./Cache/Geoip/Upstream/pexcn/daily/chnroute-v6.txt
    cat ./Cache/Geoip/Process/Loyalsoldier/geoip/private-ipv6.txt
} > ./Cache/Geoip/Process/IPv6-1.txt
sort -u ./Cache/Geoip/Process/IPv6-1.txt > ./Cache/Geoip/Process/IPv6.txt

## Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Geoip/Process/Loyalsoldier/v2ray-rules-dat
sed -e 's/\./\\\\\./g' ./Cache/Geoip/Upstream/Loyalsoldier/v2ray-rules-dat/gfw.txt > ./Cache/Geoip/Process/Loyalsoldier/v2ray-rules-dat/gfw-1.txt
sed -e 's/^/\"\^\(\.\*\\\\\.\)\?/' ./Cache/Geoip/Process/Loyalsoldier/v2ray-rules-dat/gfw-1.txt > ./Cache/Geoip/Process/Loyalsoldier/v2ray-rules-dat/gfw-2.txt
sed -e 's/$/\\\$\"/' ./Cache/Geoip/Process/Loyalsoldier/v2ray-rules-dat/gfw-2.txt > ./Cache/Geoip/Process/Loyalsoldier/v2ray-rules-dat/gfw.txt