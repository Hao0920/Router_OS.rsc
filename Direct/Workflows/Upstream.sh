#### 获取 Direct 列表 ###
# felixonmars/dnsmasq-china-list
mkdir -p ./Direct/Cache/Upstream/felixonmars
wget --no-check-certificate -c -O ./Direct/Cache/Upstream/felixonmars/apple.china.txt "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/apple.china.conf"
wget --no-check-certificate -c -O ./Direct/Cache/Upstream/felixonmars/google.china.txt "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/google.china.conf"