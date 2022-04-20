#### 获取上游数据 ####
### NextDNS/metadata
mkdir -p ./Cache/Adblock/Upstream/NextDNS/metadata
# alexa
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/NextDNS/metadata/alexa.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa"
# apple
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/NextDNS/metadata/apple.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple"
# huawei
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/NextDNS/metadata/huawei.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei"
# roku
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/NextDNS/metadata/roku.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku"
# samsung
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/NextDNS/metadata/samsung.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung"
# sonos
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/NextDNS/metadata/sonos.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos"
# windows
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/NextDNS/metadata/windows.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows"
# xiaomi
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/NextDNS/metadata/xiaomi.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi"

### PingLin Li/ad-hosts
mkdir -p ./Cache/Adblock/Upstream/ilpl/ad-hosts
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/ilpl/ad-hosts/hosts.txt "https://raw.githubusercontent.com/ilpl/ad-hosts/master/hosts"

### Loyalsoldier/domain-list-custom
mkdir -p ./Cache/Adblock/Upstream/Loyalsoldier/domain-list-custom
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/Loyalsoldier/domain-list-custom/category-ads-all.txt "https://raw.githubusercontent.com/Loyalsoldier/domain-list-custom/release/category-ads-all.txt"

### jdlingyu/ad-wars
mkdir -p ./Cache/Adblock/Upstream/jdlingyu/ad-wars
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/jdlingyu/ad-wars/hosts.txt "https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts"

### Ewpratten/youtube_ad_blocklist
mkdir -p ./Cache/Adblock/Upstream/Ewpratten/youtube_ad_blocklist
wget --no-check-certificate -c -O ./Cache/Adblock/Upstream/Ewpratten/youtube_ad_blocklist.txt "https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt"