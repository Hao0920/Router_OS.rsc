#### 获取上游数据 ####
### Clang.CN
mkdir -p ./Cache/ISP/Upstream/Clang.CN
# 中国大陆所有 IP 地址
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/all_cn.txt https://ispip.clang.cn/all_cn_cidr.txt
# 中国电信
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt https://ispip.clang.cn/chinatelecom_cidr.txt
# 中国联通/网通
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
# 中国移动
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/cmcc.txt https://ispip.clang.cn/cmcc_cidr.txt
# 中国铁通
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/crtc.txt https://ispip.clang.cn/crtc_cidr.txt
# 中国教育网
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/cernet.txt https://ispip.clang.cn/cernet_cidr.txt
# 长城宽带/鹏博士
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/gwbn.txt https://ispip.clang.cn/gwbn_cidr.txt
# 中国其他 ISP
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/othernet.txt https://ispip.clang.cn/othernet_cidr.txt

### Loyalsoldier/geoip
mkdir -p ./Cache/ISP/Upstream/Loyalsoldier/geoip
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Loyalsoldier/geoip/cn.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Loyalsoldier/geoip/private.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/private.txt

### Hackl0us/GeoIP2-CN
mkdir -p ./Cache/ISP/Upstream/Hackl0us/GeoIP2-CN
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Hackl0us/GeoIP2-CN/CN-ip-cidr.txt https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt
