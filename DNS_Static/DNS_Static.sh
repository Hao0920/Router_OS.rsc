mkdir -p ./DNS_Static/Cache
# 获取 DNS_Static 列表
# 亚马逊 Alexa 助手
wget --no-check-certificate -c -O ./DNS_Static/Cache/alexa.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa"
# 苹果
wget --no-check-certificate -c -O ./DNS_Static/Cache/apple.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple"
# 华为
wget --no-check-certificate -c -O ./DNS_Static/Cache/huawei.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei"
# Roku
wget --no-check-certificate -c -O ./DNS_Static/Cache/roku.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku"
# 三星
wget --no-check-certificate -c -O ./DNS_Static/Cache/samsung.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung"
# Sonos
wget --no-check-certificate -c -O ./DNS_Static/Cache/sonos.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos"
# Windows
wget --no-check-certificate -c -O ./DNS_Static/Cache/windows.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows"
# 小米
wget --no-check-certificate -c -O ./DNS_Static/Cache/xiaomi.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi"

#构建
{
  echo "/ip dns static"
  echo "remove [find address=240.0.0.1]"
  for name in $(cat ./DNS_Static/Cache/alexa.txt) ; do
    sort | sort | grep -Ev '(#.*$)|(^$)' | echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./DNS_Static/Cache/apple.txt) ; do
    sort | sort | grep -Ev '(#.*$)|(^$)' | echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./DNS_Static/Cache/huawei.txt) ; do
    sort | sort | grep -Ev '(#.*$)|(^$)' | echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./DNS_Static/Cache/roku.txt) ; do
    sort | sort | grep -Ev '(#.*$)|(^$)' | echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./DNS_Static/Cache/samsung.txt) ; do
    sort | sort | grep -Ev '(#.*$)|(^$)' | echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./DNS_Static/Cache/sonos.txt) ; do
    sort | sort | grep -Ev '(#.*$)|(^$)' | echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./DNS_Static/Cache/windows.txt) ; do
    sort | sort | grep -Ev '(#.*$)|(^$)' | echo "add address=240.0.0.1 name=$name"
  done
  for name in $(cat ./DNS_Static/Cache/xiaomi.txt) ; do
    sort | sort | grep -Ev '(#.*$)|(^$)' | echo "add address=240.0.0.1 name=$name"
  done

} > ./DNS_Static.rsc