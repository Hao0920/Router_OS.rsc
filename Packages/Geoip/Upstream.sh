#### 获取上游数据 ####
# Geoip
## misakaio/chnroutes2
mkdir -p ./Cache/Geoip/Upstream/misakaio/chnroutes2
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/misakaio/chnroutes2/Geoip.txt "https://raw.githubusercontent.com/misakaio/chnroutes2/master/Geoip.txt"

## pexcn/daily
mkdir -p ./Cache/Geoip/Upstream/pexcn/daily
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/pexcn/daily/chnroute.txt "https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute.txt"
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/pexcn/daily/chnroute-v6.txt "https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute-v6.txt"

## Clang.CN
mkdir -p ./Cache/Geoip/Upstream/Clang.CN
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Clang.CN/all_cn_cidr.txt "https://ispip.clang.cn/all_cn_cidr.txt"
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Clang.CN/all_cn_ipv6.txt "https://ispip.clang.cn/all_cn_ipv6.txt"

## iwik.org
mkdir -p ./Cache/Geoip/Upstream/iwik.org
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/iwik.org/cn_cidr.txt "http://www.iwik.org/ipcountry/CN.cidr"
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/iwik.org/cn_ipv6.txt "https://www.iwik.org/ipcountry/CN.ipv6"

## Hao0920/Geoip
mkdir -p ./Cache/Geoip/Upstream/Hao0920
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Hao0920/Geoip/games.txt "https://raw.githubusercontent.com/Hao0920/Geoip/release/text/games.txt"
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Hao0920/Geoip/vps.txt "https://raw.githubusercontent.com/Hao0920/Geoip/release/text/vps.txt"


# Forward DNS
## Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Geoip/Upstream/Loyalsoldier/v2ray-rules-dat
wget --no-check-certificate -c -O ./Cache/Geoip/Upstream/Loyalsoldier/v2ray-rules-dat/gfw.txt "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt"