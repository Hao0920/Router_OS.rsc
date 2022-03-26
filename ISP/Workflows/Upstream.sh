

#### 获取 IP 列表 ####
### Clang.CN
mkdir -p ./ISP/Cache/Upstream/Clang.CN
# 中国大陆所有 IP 地址
wget --no-check-certificate -c -O ./ISP/Cache/Upstream/Clang.CN/all_cn.txt https://ispip.clang.cn/all_cn_cidr.txt
# 中国电信
wget --no-check-certificate -c -O ./ISP/Cache/Upstream/Clang.CN/chinatelecom.txt https://ispip.clang.cn/chinatelecom_cidr.txt
# 中国联通/网通
wget --no-check-certificate -c -O ./ISP/Cache/Upstream/Clang.CN/unicom_cnc.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
# 中国移动
wget --no-check-certificate -c -O ./ISP/Cache/Upstream/Clang.CN/cmcc.txt https://ispip.clang.cn/cmcc_cidr.txt
# 中国铁通
wget --no-check-certificate -c -O ./ISP/Cache/Upstream/Clang.CN/crtc.txt https://ispip.clang.cn/crtc_cidr.txt
# 中国教育网
wget --no-check-certificate -c -O ./ISP/Cache/Upstream/Clang.CN/cernet.txt https://ispip.clang.cn/cernet_cidr.txt
# 长城宽带/鹏博士
wget --no-check-certificate -c -O ./ISP/Cache/Upstream/Clang.CN/gwbn.txt https://ispip.clang.cn/gwbn_cidr.txt
# 中国其他 ISP
wget --no-check-certificate -c -O ./ISP/Cache/Upstream/Clang.CN/othernet.txt https://ispip.clang.cn/othernet_cidr.txt

### Loyalsoldier/geoip
mkdir -p ./ISP/Cache/Upstream/Loyalsoldier/geoip/cn.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt