mkdir -p ./Config/DNS_Static/Cache
# 获取 DNS_Static 列表
# 亚马逊 Alexa 助手
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/alexa1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa"
# 苹果
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/apple1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple"
# 华为
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/huawei1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei"
# Roku
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/roku1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku"
# 三星
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/samsung1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung"
# Sonos
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/sonos1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos"
# Windows
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/windows1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows"
# 小米
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/xiaomi1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi"

# 整理
sed -e '/^#/d' ./Config/DNS_Static/Cache/alexa1.txt > ./Config/DNS_Static/Cache/alexa2.txt
sort ./Config/DNS_Static/Cache/alexa2.txt -u > ./Config/DNS_Static/Cache/alexa3.txt
sed -e '/^#/d' ./Config/DNS_Static/Cache/apple1.txt > ./Config/DNS_Static/Cache/apple2.txt
sort ./Config/DNS_Static/Cache/apple2.txt -u > ./Config/DNS_Static/Cache/apple3.txt
sed -e '/^#/d' ./Config/DNS_Static/Cache/huawei1.txt > ./Config/DNS_Static/Cache/huawei2.txt
sort ./Config/DNS_Static/Cache/huawei2.txt -u > ./Config/DNS_Static/Cache/huawei3.txt
sed -e '/^#/d' ./Config/DNS_Static/Cache/roku1.txt > ./Config/DNS_Static/Cache/roku2.txt
sort ./Config/DNS_Static/Cache/roku2.txt -u > ./Config/DNS_Static/Cache/roku3.txt
sed -e '/^#/d' ./Config/DNS_Static/Cache/samsung1.txt > ./Config/DNS_Static/Cache/samsung2.txt
sort ./Config/DNS_Static/Cache/samsung2.txt -u > ./Config/DNS_Static/Cache/samsung3.txt
sed -e '/^#/d' ./Config/DNS_Static/Cache/sonos1.txt > ./Config/DNS_Static/Cache/sonos2.txt
sort ./Config/DNS_Static/Cache/sonos2.txt -u > ./Config/DNS_Static/Cache/sonos3.txt
sed -e '/^#/d' ./Config/DNS_Static/Cache/windows1.txt > ./Config/DNS_Static/Cache/windows2.txt
sort ./Config/DNS_Static/Cache/windows2.txt -u > ./Config/DNS_Static/Cache/windows3.txt
sed -e '/^#/d' ./Config/DNS_Static/Cache/xiaomi1.txt > ./Config/DNS_Static/Cache/xiaomi2.txt
sort ./Config/DNS_Static/Cache/xiaomi2.txt -u > ./Config/DNS_Static/Cache/xiaomi3.txt

#构建
{
  echo "/ip dns static"
  echo "remove [find address=240.0.0.1]"
  for name in $(cat ./Config/DNS_Static/Cache/alexa3.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS_Static/Cache/apple3.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS_Static/Cache/huawei3.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS_Static/Cache/roku3.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS_Static/Cache/samsung3.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS_Static/Cache/sonos3.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS_Static/Cache/windows3.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS_Static/Cache/xiaomi3.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
} > ./DNS_Static.rsc
rm -rf ./Config/DNS_Static/Cache