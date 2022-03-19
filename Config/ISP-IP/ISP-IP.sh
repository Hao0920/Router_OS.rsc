# 建立缓存
mkdir -p ./Config/ISP-IP/Cache

# 获取 IP 列表
# 中国大陆所有 IP 地址
wget --no-check-certificate -c -O ./Config/ISP-IP/Cache/all_cn_cidr.txt https://ispip.clang.cn/all_cn_cidr.txt
# 中国电信
wget --no-check-certificate -c -O ./Config/ISP-IP/Cache/chinatelecom_cidr.txt https://ispip.clang.cn/chinatelecom_cidr.txt
# 中国联通/网通
wget --no-check-certificate -c -O ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
# 中国移动
wget --no-check-certificate -c -O ./Config/ISP-IP/Cache/cmcc_cidr.txt https://ispip.clang.cn/cmcc_cidr.txt
# 中国铁通
wget --no-check-certificate -c -O ./Config/ISP-IP/Cache/crtc_cidr.txt https://ispip.clang.cn/crtc_cidr.txt
# 中国教育网
wget --no-check-certificate -c -O ./Config/ISP-IP/Cache/cernet_cidr.txt https://ispip.clang.cn/cernet_cidr.txt
# 长城宽带/鹏博士
wget --no-check-certificate -c -O ./Config/ISP-IP/Cache/gwbn_cidr.txt https://ispip.clang.cn/gwbn_cidr.txt
# 中国其他 ISP
wget --no-check-certificate -c -O ./Config/ISP-IP/Cache/othernet_cidr.txt https://ispip.clang.cn/othernet_cidr.txt

# 构建 Address List
{
echo "/ip firewall address-list"
echo "remove [find list="china"]"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
echo "remove [find list="china_tietong"]"
echo "remove [find list="china_education_and_research_network"]"
echo "remove [find list="great_wall_broadband_network"]"
echo "remove [find list="othernet"]"
for address in $(cat ./Config/ISP-IP/Cache/all_cn_cidr.txt) ; do
  echo "add list=china address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_tietong address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_education_and_research_network address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=great_wall_broadband_network address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=othernet address=$address"
done
} > ./Config/ISP-IP/ISP-IP.rsc

# 中国大陆所有 IP 地址 (VPN借线)
{
echo "/ip firewall address-list"
echo "remove [find list="china"]"
for address in $(cat ./Config/ISP-IP/Cache/all_cn_cidr.txt) ; do
  echo "add list=china address=$address"
} > ./Config/ISP-IP/china.rsc

# 电信 + 联通 + 移动
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
} > ./Config/ISP-IP/china_telecom-unicom-mobile.rsc

# 联通 + 移动 + 电信
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
} > ./Config/ISP-IP/china_unicom-mobile-telecom.rsc

# 移动 + 电信 + 联通
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
} > ./Config/ISP-IP/china_mobile-telecom-unicom.rsc

# 电信 + 联通
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
} > ./Config/ISP-IP/china_telecom-unicom.rsc

# 电信 + 移动
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
} > ./Config/ISP-IP/china_telecom-mobile.rsc

# 联通 + 电信
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
} > ./Config/ISP-IP/china_unicom-telecom.rsc

# 联通 + 移动
{
echo "/ip firewall address-list"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
} > ./Config/ISP-IP/china_unicom-mobile.rsc

# 移动 + 电信
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
} > ./Config/ISP-IP/china_mobile-telecom.rsc

# 移动 + 联通
{
echo "/ip firewall address-list"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Config/ISP-IP/Cache/chinatelecom_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/crtc_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/cernet_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/gwbn_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Config/ISP-IP/Cache/othernet_cidr.txt) ; do
  echo "add list=china_mobile address=$address"
done
} > ./Config/ISP-IP/china_mobile-unicom.rsc


# 清除缓存
rm -rf ./Config/ISP-IP/Cache
