#### 处理数据 ####
## misakaio/chnroutes2
mkdir -p ./Cache/Chnroutes/Process/misakaio/chnroutes2
sed -e '/#/d' ./Cache/Chnroutes/Upstream/misakaio/chnroutes2/chnroutes.txt > ./Cache/Chnroutes/Process/misakaio/chnroutes2/chnroutes.txt

{
    cat ./Cache/Chnroutes/Upstream/Hackl0us/GeoIP2-CN/CN-ip-cidr.txt
    cat ./Cache/Chnroutes/Process/misakaio/chnroutes2/chnroutes.txt
    cat ./Cache/Chnroutes/Upstream/pexcn/daily/chnroute.txt
} > ./Cache/Chnroutes/Process/IPv4-1.txt
sort -u ./Cache/Chnroutes/Process/IPv4-1.txt > ./Cache/Chnroutes/Process/IPv4.txt

## Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat
sed -e 's#.#//.#g' ./Cache/Chnroutes/Upstream/Loyalsoldier/v2ray-rules-dat/gfw.txt > ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat/gfw.txt