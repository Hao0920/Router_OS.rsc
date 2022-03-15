mkdir -p ./ispip
cd ./ispip

#中国大陆所有IP地址
wget --no-check-certificate -c -O all_cn_cidr.txt https://ispip.clang.cn/all_cn_cidr.txt
#中国电信
wget --no-check-certificate -c -O chinatelecom_cidr.txt https://ispip.clang.cn/chinatelecom_cidr.txt
#中国联通/网通
wget --no-check-certificate -c -O unicom_cnc_cidr.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
#中国移动
wget --no-check-certificate -c -O cmcc_cidr.txt https://ispip.clang.cn/cmcc_cidr.txt
#中国铁通
wget --no-check-certificate -c -O crtc_cidr.txt https://ispip.clang.cn/crtc_cidr.txt
#中国教育网
wget --no-check-certificate -c -O cernet_cidr.txt https://ispip.clang.cn/cernet_cidr.txt
#长城宽带/鹏博士
wget --no-check-certificate -c -O gwbn_cidr.txt https://ispip.clang.cn/gwbn_cidr.txt
#中国其他ISP
wget --no-check-certificate -c -O othernet_cidr.txt https://ispip.clang.cn/othernet_cidr.txt

{
echo "/ip firewall address-list 
       remove [find list="china"]
       remove [find list="china_telecom"]
       remove [find list="china_unicom"]
       remove [find list="china_mobile"]
       remove [find list="china_tietong"]
       remove [find list="china_education_and_research_network"]
       remove [find list="great_wall_broadband_network"]
       remove [find list="othernet"]"

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
} > ../isp-all.rsc

cd ..
rm -rf ./ispip