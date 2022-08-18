#### 获取上游数据 ####
## Hackl0us/GeoIP2-CN
mkdir -p ./Cache/Chnroutes/Upstream/Hackl0us/GeoIP2-CN
wget --no-check-certificate -c -O ./Cache/Chnroutes/Upstream/Hackl0us/GeoIP2-CN/CN-ip-cidr.txt "https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt"

## misakaio/chnroutes2
mkdir -p ./Cache/Chnroutes/Upstream/misakaio/chnroutes2
wget --no-check-certificate -c -O ./Cache/Chnroutes/Upstream/misakaio/chnroutes2/chnroutes.txt "https://raw.githubusercontent.com/misakaio/chnroutes2/master/chnroutes.txt"

## pexcn/daily
mkdir -p ./Cache/Chnroutes/Upstream/pexcn/daily
wget --no-check-certificate -c -O ./Cache/Chnroutes/Upstream/pexcn/daily/chnroute.txt "https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute.txt"
wget --no-check-certificate -c -O ./Cache/Chnroutes/Upstream/pexcn/daily/chnroute-v6.txt "https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute-v6.txt"

## Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Chnroutes/Upstream/Loyalsoldier/v2ray-rules-dat
wget --no-check-certificate -c -O ./Cache/Chnroutes/Upstream/Loyalsoldier/v2ray-rules-dat/gfw.txt "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt"