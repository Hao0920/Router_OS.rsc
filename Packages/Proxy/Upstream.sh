#### 获取上游数据 ####
### Loyalsoldier/geoip
mkdir -p ./Cache/Proxy/Upstream/Loyalsoldier/geoip
wget --no-check-certificate -c -O ./Cache/Proxy/Upstream/Loyalsoldier/geoip/facebook.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/facebook.txt
wget --no-check-certificate -c -O ./Cache/Proxy/Upstream/Loyalsoldier/geoip/google.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/google.txt
wget --no-check-certificate -c -O ./Cache/Proxy/Upstream/Loyalsoldier/geoip/netflix.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/netflix.txt
wget --no-check-certificate -c -O ./Cache/Proxy/Upstream/Loyalsoldier/geoip/telegram.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/telegram.txt
wget --no-check-certificate -c -O ./Cache/Proxy/Upstream/Loyalsoldier/geoip/twitter.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/twitter.txt