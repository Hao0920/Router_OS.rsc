#### IPv4 ####

### 构建 ISP.rsc ###
mkdir -p ./Releases/ISP
{
  echo "/ip firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_unicom"]"
  echo "remove [find list="china_mobile"]"
  echo "remove [find list="china_tietong"]"
  echo "remove [find list="china_education_and_research_network"]"
  echo "remove [find list="great_wall_broadband_network"]"
  echo "remove [find list="othernet"]"
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
  echo "/file remove ISP-IPv4.rsc"
} > ./Releases/ISP/ISP-IPv4.rsc

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
  echo "add list=china_mobile address=$address"
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
  echo "/file remove china_telecom-unicom-mobile-IPv4.rsc"
} > ./Releases/ISP/china_telecom-unicom-mobile-IPv4.rsc
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
  echo "add list=china_mobile address=$address"
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
  echo "/file remove china_unicom-mobile-telecom-IPv4.rsc"
} > ./Releases/ISP/china_unicom-mobile-telecom-IPv4.rsc
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
  echo "/file remove china_mobile-telecom-unicom-IPv4.rsc"
} > ./Releases/ISP/china_mobile-telecom-unicom-IPv4.rsc
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
  echo "/file remove china_telecom-unicom-IPv4.rsc"
} > ./Releases/ISP/china_telecom-unicom-IPv4.rsc
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
  echo "add list=china_mobile address=$address"
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
  echo "/file remove china_telecom-mobile-IPv4.rsc"
} > ./Releases/ISP/china_telecom-mobile-IPv4.rsc
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
  echo "/file remove china_unicom-telecom-IPv4.rsc"
} > ./Releases/ISP/china_unicom-telecom-IPv4.rsc
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
  echo "add list=china_mobile address=$address"
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
  echo "/file remove china_unicom-mobile-IPv4.rsc"
} > ./Releases/ISP/china_unicom-mobile-IPv4.rsc
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
  echo "/file remove china_mobile-telecom-IPv4.rsc"
} > ./Releases/ISP/china_mobile-telecom-IPv4.rsc
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
  echo "/file remove china_mobile-unicom-IPv4.rsc"
} > ./Releases/ISP/china_mobile-unicom-IPv4.rsc

#### IPv6 ####

### 构建 ISP.rsc ###
mkdir -p ./Releases/ISP
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_unicom"]"
  echo "remove [find list="china_mobile"]"
  echo "remove [find list="china_tietong"]"
  echo "remove [find list="china_education_and_research_network"]"
  echo "remove [find list="great_wall_broadband_network"]"
  echo "remove [find list="othernet_ipv6"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_tietong address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_education_and_research_network address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=great_wall_broadband_network address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=othernet_ipv6 address=$address"
  done
  echo "/file remove ISP-IPv6.rsc"
} > ./Releases/ISP/ISP-IPv6.rsc

# 电信 + 联通 + 移动
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_unicom"]"
  echo "remove [find list="china_mobile"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  echo "/file remove china_telecom-unicom-mobile-IPv6.rsc"
} > ./Releases/ISP/china_telecom-unicom-mobile-IPv6.rsc
# 联通 + 移动 + 电信
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_unicom"]"
  echo "remove [find list="china_mobile"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  echo "/file remove china_unicom-mobile-telecom-IPv6.rsc"
} > ./Releases/ISP/china_unicom-mobile-telecom-IPv6.rsc
# 移动 + 电信 + 联通
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_unicom"]"
  echo "remove [find list="china_mobile"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  echo "/file remove china_mobile-telecom-unicom-IPv6.rsc"
} > ./Releases/ISP/china_mobile-telecom-unicom-IPv6.rsc
# 电信 + 联通
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_unicom"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  echo "/file remove china_telecom-unicom-IPv6.rsc"
} > ./Releases/ISP/china_telecom-unicom-IPv6.rsc
# 电信 + 移动
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_mobile"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  echo "/file remove china_telecom-mobile-IPv6.rsc"
} > ./Releases/ISP/china_telecom-mobile-IPv6.rsc
# 联通 + 电信
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_unicom"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  echo "/file remove china_unicom-telecom-IPv6.rsc"
} > ./Releases/ISP/china_unicom-telecom-IPv6.rsc
# 联通 + 移动
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_unicom"]"
  echo "remove [find list="china_mobile"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  echo "/file remove china_unicom-mobile-IPv6.rsc"
} > ./Releases/ISP/china_unicom-mobile-IPv6.rsc
# 移动 + 电信
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_telecom"]"
  echo "remove [find list="china_mobile"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_telecom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  echo "/file remove china_mobile-telecom-IPv6.rsc"
} > ./Releases/ISP/china_mobile-telecom-IPv6.rsc
# 移动 + 联通
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="china_unicom"]"
  echo "remove [find list="china_mobile"]"
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/chinatelecom_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/unicom_cnc_ipv6.txt) ; do
  echo "add list=china_unicom address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cmcc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/crtc_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/cernet_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/gwbn_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  for address in $(cat ./Cache/ISP/Upstream/Clang.CN/othernet_ipv6.txt) ; do
  echo "add list=china_mobile address=$address"
  done
  echo "/file remove china_mobile-unicom-IPv6.rsc"
} > ./Releases/ISP/china_mobile-unicom-IPv6.rsc