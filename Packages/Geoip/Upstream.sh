#### 获取上游数据 ####
## Hackl0us/GeoIP2-CN
mkdir -p ./Cache/Geoip/Upstream/Hackl0us/GeoIP2-CN
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Hackl0us/GeoIP2-CN/CN-ip-cidr.txt "https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt"

## misakaio/chnroutes2
mkdir -p ./Cache/Geoip/Upstream/misakaio/chnroutes2
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/misakaio/chnroutes2/Geoip.txt "https://raw.githubusercontent.com/misakaio/chnroutes2/master/Geoip.txt"

## pexcn/daily
mkdir -p ./Cache/Geoip/Upstream/pexcn/daily
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/pexcn/daily/chnroute.txt "https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute.txt"
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/pexcn/daily/chnroute-v6.txt "https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute-v6.txt"

## Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Geoip/Upstream/Loyalsoldier/v2ray-rules-dat
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Loyalsoldier/v2ray-rules-dat/gfw.txt "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt"

## Clang.CN
mkdir -p ./Cache/Geoip/Upstream/Clang.CN
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Clang.CN/all_cn_cidr.txt https://ispip.clang.cn/all_cn_cidr.txt
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Clang.CN/all_cn_ipv6.txt https://ispip.clang.cn/all_cn_ipv6.txt