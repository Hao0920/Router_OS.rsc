mkdir -p ./ISP-IP/Cache

# 获取 IP 列表
# 中国大陆所有 IP 地址
wget --no-check-certificate -c -O ./ISP-IP/Cache/all_cn_cidr.txt https://ispip.clang.cn/all_cn_cidr.txt
# 中国电信
wget --no-check-certificate -c -O ./ISP-IP/Cache/chinatelecom_cidr.txt https://ispip.clang.cn/chinatelecom_cidr.txt
# 中国联通/网通
wget --no-check-certificate -c -O ./ISP-IP/Cache/unicom_cnc_cidr.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
# 中国移动
wget --no-check-certificate -c -O ./ISP-IP/Cache/cmcc_cidr.txt https://ispip.clang.cn/cmcc_cidr.txt
# 中国铁通
wget --no-check-certificate -c -O ./ISP-IP/Cache/crtc_cidr.txt https://ispip.clang.cn/crtc_cidr.txt
# 中国教育网
wget --no-check-certificate -c -O ./ISP-IP/Cache/cernet_cidr.txt https://ispip.clang.cn/cernet_cidr.txt
# 长城宽带/鹏博士
wget --no-check-certificate -c -O ./ISP-IP/Cache/gwbn_cidr.txt https://ispip.clang.cn/gwbn_cidr.txt
# 中国其他 ISP
wget --no-check-certificate -c -O ./ISP-IP/Cache/othernet_cidr.txt https://ispip.clang.cn/othernet_cidr.txt

#构建 Address List
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

for net in $(cat ./ISP-IP/Data/all_cn_cidr.txt) ; do
  echo "add list=china address=$net"
done

for net in $(cat ./ISP-IP/Data/chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$net"
done

for net in $(cat ./ISP-IP/Data/unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$net"
done

for net in $(cat ./ISP-IP/Data/cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$net"
done

for net in $(cat ./ISP-IP/Data/crtc_cidr.txt) ; do
  echo "add list=china_tietong address=$net"
done

for net in $(cat ./ISP-IP/Data/cernet_cidr.txt) ; do
  echo "add list=china_education_and_research_network address=$net"
done

for net in $(cat ./ISP-IP/Data/gwbn_cidr.txt) ; do
  echo "add list=great_wall_broadband_network address=$net"
done

for net in $(cat ./ISP-IP/Data/othernet_cidr.txt) ; do
  echo "add list=othernet address=$net"
done
} > ./ISP-IP.rsc

rm -rf ./ISP-IP/Cache