### 建立缓存 ### 
mkdir -p ./Config/DNS_Static/Cache
#### 获取 DNS Static 列表 ###
# 亚马逊 Alexa 助手
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/alexa1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa"
# 苹果
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/apple1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple"
# 华为
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/huawei1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei"
# Roku
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/roku1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku"
# 三星
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/samsung1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung"
# Sonos
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/sonos1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos"
# Windows
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/windows1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows"
# 小米
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/xiaomi1.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi"