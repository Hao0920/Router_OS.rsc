### 建立缓存 ### 
mkdir -p ./Config/DNS_Static/Cache
#### 获取 DNS Static 列表 ###
# alexa
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/alexa.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa"
# apple
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/apple.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple"
# huawei
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/huawei.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei"
# roku
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/roku.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku"
# samsung
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/samsung.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung"
# sonos
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/sonos.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos"
# windows
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/windows.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows"
# xiaomi
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/xiaomi.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi"
# category-ads
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/category-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/category-ads"
# category-ads-all
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/category-ads-all.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/category-ads-all"
# acfun-ads
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/acfun-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/acfun-ads"
# adcolony-ads
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/adcolony-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/adcolony-ads"
# adjust-ads
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/adjust-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/adjust-ads"
# alibaba-ads
wget --no-check-certificate -c -O ./Config/DNS_Static/Cache/Source/alibaba-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/alibaba-ads"