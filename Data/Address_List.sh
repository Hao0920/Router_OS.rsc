mkdir -p ./Data/ISP-IP
cd ./Data/ISP-IP

# 获取 IP 列表
# 中国大陆所有 IP 地址
wget --no-check-certificate -c -O all_cn_cidr.txt https://ispip.clang.cn/all_cn_cidr.txt
# 中国电信
wget --no-check-certificate -c -O chinatelecom_cidr.txt https://ispip.clang.cn/chinatelecom_cidr.txt
# 中国联通/网通
wget --no-check-certificate -c -O unicom_cnc_cidr.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
# 中国移动
wget --no-check-certificate -c -O cmcc_cidr.txt https://ispip.clang.cn/cmcc_cidr.txt
# 中国铁通
wget --no-check-certificate -c -O crtc_cidr.txt https://ispip.clang.cn/crtc_cidr.txt
# 中国教育网
wget --no-check-certificate -c -O cernet_cidr.txt https://ispip.clang.cn/cernet_cidr.txt
# 长城宽带/鹏博士
wget --no-check-certificate -c -O gwbn_cidr.txt https://ispip.clang.cn/gwbn_cidr.txt
# 中国其他 ISP
wget --no-check-certificate -c -O othernet_cidr.txt https://ispip.clang.cn/othernet_cidr.txt

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

for net in $(cat all_cn_cidr.txt) ; do
  echo "add list=china address=$net"
done

for net in $(cat chinatelecom_cidr.txt) ; do
  echo "add list=china_telecom address=$net"
done

for net in $(cat unicom_cnc_cidr.txt) ; do
  echo "add list=china_unicom address=$net"
done

for net in $(cat cmcc_cidr.txt) ; do
  echo "add list=china_mobile address=$net"
done

for net in $(cat crtc_cidr.txt) ; do
  echo "add list=china_tietong address=$net"
done

for net in $(cat cernet_cidr.txt) ; do
  echo "add list=china_education_and_research_network address=$net"
done

for net in $(cat gwbn_cidr.txt) ; do
  echo "add list=great_wall_broadband_network address=$net"
done

for net in $(cat othernet_cidr.txt) ; do
  echo "add list=othernet address=$net"
done
} > ../Address_List.rsc

cd ..
mv ./Data/Address_List.rsc ./