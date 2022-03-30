#### 获取 Direct 列表 ###
# felixonmars/dnsmasq-china-list
mkdir -p ./Direct/Cache/Upstream/felixonmars/dnsmasq-china-list/
wget --no-check-certificate -c -O ./Direct/Cache/Upstream/felixonmars/dnsmasq-china-list/apple.china.txt "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/apple.china.conf"
wget --no-check-certificate -c -O ./Direct/Cache/Upstream/felixonmars/dnsmasq-china-list/google.china.txt "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/google.china.conf"
# v2fly/domain-list-community
mkdir -p ./Direct/Cache/Upstream/v2fly/domain-list-community
wget --no-check-certificate -c -O  "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/apple" \
| grep -F '@cn' > ./Direct/Cache/Upstream/v2fly/domain-list-community/apple.txt