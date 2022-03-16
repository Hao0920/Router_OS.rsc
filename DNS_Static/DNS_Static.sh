mkdir -p ./DNS_Static/Cache
cd ./DNS_Static/Cache
# 获取 DNS_Static 列表
native.txt=(
  # 亚马逊 Alexa 助手
  "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa"
  # 苹果
  "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple"
  # 华为
  "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei"
  # Roku
  "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku"
  # 三星
  "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung"
  # Sonos
  "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos"
  # Windows
  "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows"
  # 小米
  "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi"
  )

# 整理

cat native.txt | grep -v "^#" \
 | grep -v "^$" \
 | sort \
 | uniq >native.txt

