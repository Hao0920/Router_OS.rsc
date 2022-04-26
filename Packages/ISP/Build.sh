### 构建 ISP.rsc ###
mkdir -p ./Releases/ISP
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
for address in $(cat ./Cache/ISP/Upstream/Hackl0us/GeoIP2-CN/CN-ip-cidr.txt) ; do
  echo "add list=china address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_tietong address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_education_and_research_network address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=great_wall_broadband_network address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=othernet address=$address"
done
echo "/file remove ISP.rsc"
} > ./Releases/ISP/ISP.rsc
# VPN借线
{
echo "/ip firewall address-list"
echo "remove [find list="china"]"
for address in $(cat ./Cache/ISP/Upstream/Hackl0us/GeoIP2-CN/CN-ip-cidr.txt) ; do
  echo "add list=china address=$address"
done
echo "/file remove china.rsc"
} > ./Releases/ISP/china.rsc
# 电信 + 联通 + 移动
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_telecom address=$address"
done
echo "/file remove china_telecom-unicom-mobile.rsc"
} > ./Releases/ISP/china_telecom-unicom-mobile.rsc
# 联通 + 移动 + 电信
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_unicom address=$address"
done
echo "/file remove china_unicom-mobile-telecom.rsc"
} > ./Releases/ISP/china_unicom-mobile-telecom.rsc
# 移动 + 电信 + 联通
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_mobile address=$address"
done
echo "/file remove china_mobile-telecom-unicom.rsc"
} > ./Releases/ISP/china_mobile-telecom-unicom.rsc
# 电信 + 联通
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_telecom address=$address"
done
echo "/file remove china_telecom-unicom.rsc"
} > ./Releases/ISP/china_telecom-unicom.rsc
# 电信 + 移动
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_telecom address=$address"
done
echo "/file remove china_telecom-mobile.rsc"
} > ./Releases/ISP/china_telecom-mobile.rsc
# 联通 + 电信
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_unicom"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_unicom address=$address"
done
echo "/file remove china_unicom-telecom.rsc"
} > ./Releases/ISP/china_unicom-telecom.rsc
# 联通 + 移动
{
echo "/ip firewall address-list"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_unicom address=$address"
done
echo "/file remove china_unicom-mobile.rsc"
} > ./Releases/ISP/china_unicom-mobile.rsc
# 移动 + 电信
{
echo "/ip firewall address-list"
echo "remove [find list="china_telecom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_telecom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_mobile address=$address"
done
echo "/file remove china_mobile-telecom.rsc"
} > ./Releases/ISP/china_mobile-telecom.rsc
# 移动 + 联通
{
echo "/ip firewall address-list"
echo "remove [find list="china_unicom"]"
echo "remove [find list="china_mobile"]"
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc.txt) ; do
  echo "add list=china_unicom address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn.txt) ; do
  echo "add list=china_mobile address=$address"
done
for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet.txt) ; do
  echo "add list=china_mobile address=$address"
done
echo "/file remove china_mobile-unicom.rsc"
} > ./Releases/ISP/china_mobile-unicom.rsc