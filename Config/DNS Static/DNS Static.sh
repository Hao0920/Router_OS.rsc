### 建立缓存 ### 
mkdir -p ./Config/DNS Static/Cache
#### 获取 DNS Static 列表 ###
# 亚马逊 Alexa 助手
wget --no-check-certificate -c -O ./Config/DNS Static/Cache/alexa1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa"
# 苹果
wget --no-check-certificate -c -O ./Config/DNS Static/Cache/apple1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple"
# 华为
wget --no-check-certificate -c -O ./Config/DNS Static/Cache/huawei1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei"
# Roku
wget --no-check-certificate -c -O ./Config/DNS Static/Cache/roku1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku"
# 三星
wget --no-check-certificate -c -O ./Config/DNS Static/Cache/samsung1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung"
# Sonos
wget --no-check-certificate -c -O ./Config/DNS Static/Cache/sonos1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos"
# Windows
wget --no-check-certificate -c -O ./Config/DNS Static/Cache/windows1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows"
# 小米
wget --no-check-certificate -c -O ./Config/DNS Static/Cache/xiaomi1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi"

### 整理 ###
sed -e '/^#/d' ./Config/DNS Static/Cache/alexa1.txt > ./Config/DNS Static/Cache/alexa2.txt
sort ./Config/DNS Static/Cache/alexa2.txt -u > ./Config/DNS Static/Cache/alexa.txt
sed -e '/^#/d' ./Config/DNS Static/Cache/apple1.txt > ./Config/DNS Static/Cache/apple2.txt
sort ./Config/DNS Static/Cache/apple2.txt -u > ./Config/DNS Static/Cache/apple.txt
sed -e '/^#/d' ./Config/DNS Static/Cache/huawei1.txt > ./Config/DNS Static/Cache/huawei2.txt
sort ./Config/DNS Static/Cache/huawei2.txt -u > ./Config/DNS Static/Cache/huawei.txt
sed -e '/^#/d' ./Config/DNS Static/Cache/roku1.txt > ./Config/DNS Static/Cache/roku2.txt
sort ./Config/DNS Static/Cache/roku2.txt -u > ./Config/DNS Static/Cache/roku.txt
sed -e '/^#/d' ./Config/DNS Static/Cache/samsung1.txt > ./Config/DNS Static/Cache/samsung2.txt
sort ./Config/DNS Static/Cache/samsung2.txt -u > ./Config/DNS Static/Cache/samsung.txt
sed -e '/^#/d' ./Config/DNS Static/Cache/sonos1.txt > ./Config/DNS Static/Cache/sonos2.txt
sort ./Config/DNS Static/Cache/sonos2.txt -u > ./Config/DNS Static/Cache/sonos.txt
sed -e '/^#/d' ./Config/DNS Static/Cache/windows1.txt > ./Config/DNS Static/Cache/windows2.txt
sort ./Config/DNS Static/Cache/windows2.txt -u > ./Config/DNS Static/Cache/windows.txt
sed -e '/^#/d' ./Config/DNS Static/Cache/xiaomi1.txt > ./Config/DNS Static/Cache/xiaomi2.txt
sort ./Config/DNS Static/Cache/xiaomi2.txt -u > ./Config/DNS Static/Cache/xiaomi.txt

### 构建 ###
{
  echo "/ip dns static"
  echo "remove [find address=240.0.0.1]"
  for name in $(cat ./Config/DNS Static/Cache/alexa.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS Static/Cache/apple.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS Static/Cache/huawei.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS Static/Cache/roku.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS Static/Cache/samsung.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS Static/Cache/sonos.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS Static/Cache/windows.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./Config/DNS Static/Cache/xiaomi.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
} > ./Config/DNS_Static/DNS_Static.rsc

### 清除缓存 ###
rm -rf ./Config/DNS Static/Cache
