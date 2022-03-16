mkdir -p ./DNS_Static/Cache

# 获取 DNS_Static 列表
# 亚马逊 Alexa 助手
wget --no-check-certificate -c -O ./DNS_Static/Cache/alexa.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa
sed -i -e '/#/d;/^$/d' ./DNS_Static/Cache/alexa.txt

# 苹果
wget --no-check-certificate -c -O ./DNS_Static/Cache/apple.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple
sed -i -e '/#/d;/^$/d' ./DNS_Static/Cache/apple.txt

# 华为
wget --no-check-certificate -c -O ./DNS_Static/Cache/huawei.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei
sed -i -e '/#/d;/^$/d' ./DNS_Static/Cache/huawei.txt

# Roku
wget --no-check-certificate -c -O ./DNS_Static/Cache/roku.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku
sed -i -e '/#/d;/^$/d' ./DNS_Static/Cache/roku.txt

# 三星
wget --no-check-certificate -c -O ./DNS_Static/Cache/samsung.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung
sed -i -e '/#/d;/^$/d' ./DNS_Static/Cache/samsung.txt

# Sonos
wget --no-check-certificate -c -O ./DNS_Static/Cache/sonos.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos
sed -i -e '/#/d;/^$/d' ./DNS_Static/Cache/sonos.txt

# Windows
wget --no-check-certificate -c -O ./DNS_Static/Cache/windows.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows
sed -i -e '/#/d;/^$/d' ./DNS_Static/Cache/windows.txt

# 小米
wget --no-check-certificate -c -O ./DNS_Static/Cache/xiaomi.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi
sed -i -e '/#/d;/^$/d' ./DNS_Static/Cache/xiaomi.txt


#构建 DNS Static
{
echo "/ip dns static"
echo "remove [find address="240.0.0.1"]"

for name in $(cat ./DNS_Static/Cache/alexa.txt) ; do
  
  echo "add address="240.0.0.1" name=$name"
done

for name in $(cat ./DNS_Static/Cache/apple.txt) ; do
  echo "add address="240.0.0.1" name=$name"
done

for name in $(cat ./DNS_Static/Cache/huawei.txt) ; do
  echo "add address="240.0.0.1" name=$name"
done

for name in $(cat ./DNS_Static/Cache/roku.txt) ; do
  echo "add address="240.0.0.1" name=$name"
done

for name in $(cat ./DNS_Static/Cache/samsung.txt) ; do
  echo "add address="240.0.0.1" name=$name"
done

for name in $(cat ./DNS_Static/Cache/sonos.txt) ; do
  echo "add address="240.0.0.1" name=$name"
done

for name in $(cat ./DNS_Static/Cache/windows.txt) ; do
  echo "add address="240.0.0.1" name=$name"
done

for name in $(cat ./DNS_Static/Cache/xiaomi.txt) ; do
  echo "add address="240.0.0.1" name=$name"
done
} > ./DNS_Static.rsc

rm -rf ./DNS_Static/Cache
