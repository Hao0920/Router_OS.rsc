#### 获取上游数据 ####
### Clang.CN
mkdir -p ./Cache/ISP/Upstream/Clang.CN
# 中国电信
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt https://ispip.clang.cn/chinatelecom_cidr.txt
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt https://ispip.clang.cn/chinatelecom_ipv6.txt
# 中国联通/网通
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt https://ispip.clang.cn/unicom_cnc_ipv6.txt
# 中国移动
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/cmcc.txt https://ispip.clang.cn/cmcc_cidr.txt
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt https://ispip.clang.cn/cmcc_ipv6.txt
# 中国铁通
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/crtc.txt https://ispip.clang.cn/crtc_cidr.txt
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt https://ispip.clang.cn/crtc_ipv6.txt
# 中国教育网
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/cernet.txt https://ispip.clang.cn/cernet_cidr.txt
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt https://ispip.clang.cn/cernet_ipv6.txt
# 长城宽带/鹏博士
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/gwbn.txt https://ispip.clang.cn/gwbn_cidr.txt
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt https://ispip.clang.cn/gwbn_ipv6.txt
# 中国其他 ISP
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/othernet.txt https://ispip.clang.cn/othernet_cidr.txt
wget --no-check-certificate -c -O ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt https://ispip.clang.cn/othernet_ipv6.txt