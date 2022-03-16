mkdir -p ./DNS_Static/Cache
cd ./DNS_Static/Cache
# 获取 DNS_Static 列表
# 亚马逊 Alexa 助手
wget --no-check-certificate -c -O "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa" \
| sed -i -c -e '/^#/d' | sort | uniq >alexa.txt
# 苹果
wget --no-check-certificate -c -O "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple" \
| sed -i -c -e '/^#/d' | sort | uniq >apple.txt
# 华为
wget --no-check-certificate -c -O "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei" \
| sed -i -c -e '/^#/d' | sort | uniq >huawei.txt
# Roku
wget --no-check-certificate -c -O "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku" \
| sed -i -c -e '/^#/d' | sort | uniq >roku.txt
# 三星
wget --no-check-certificate -c -O "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung" \
| sed -i -c -e '/^#/d' | sort | uniq >samsung.txt
# Sonos
wget --no-check-certificate -c -O "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos" \
| sed -i -c -e '/^#/d' | sort | uniq >sonos.txt
# Windows
wget --no-check-certificate -c -O "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows" \
| sed -i -c -e '/^#/d' | sort | uniq >windows.txt
# 小米
wget --no-check-certificate -c -O "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi" \
| sed -i -c -e '/^#/d' | sort | uniq >xiaomi.txt


