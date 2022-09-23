#### 处理数据 ####
## misakaio/chnroutes2
mkdir -p ./Cache/Chnroutes/Process/misakaio/chnroutes2
sed -e '/#/d' ./Cache/Chnroutes/Upstream/misakaio/chnroutes2/chnroutes.txt > ./Cache/Chnroutes/Process/misakaio/chnroutes2/chnroutes.txt

{
#    cat ./Cache/Chnroutes/Upstream/Hackl0us/GeoIP2-CN/CN-ip-cidr.txt
    cat ./Cache/Chnroutes/Process/misakaio/chnroutes2/chnroutes.txt
    cat ./Cache/Chnroutes/Upstream/pexcn/daily/chnroute.txt
    cat ./Cache/Chnroutes/Upstream/Clang.CN/all_cn_cidr.txt
} > ./Cache/Chnroutes/Process/IPv4-1.txt
sort -u ./Cache/Chnroutes/Process/IPv4-1.txt > ./Cache/Chnroutes/Process/IPv4.txt

{
    cat ./Cache/Chnroutes/Upstream/Clang.CN/all_cn_ipv6.txt
    cat ./Cache/Chnroutes/Upstream/pexcn/daily/chnroute-v6.txt
} > ./Cache/Chnroutes/Process/IPv6-1.txt
sort -u ./Cache/Chnroutes/Process/IPv6-1.txt > ./Cache/Chnroutes/Process/IPv6.txt

## Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat
sed -e 's/\./\\\\\./g' ./Cache/Chnroutes/Upstream/Loyalsoldier/v2ray-rules-dat/gfw.txt > ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat/gfw-1.txt
sed -e 's/^/\"\^\(\.\*\\\\\.\)\?/' ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat/gfw-1.txt > ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat/gfw-2.txt
sed -e 's/$/\\\$\"/' ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat/gfw-2.txt > ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat/gfw.txt