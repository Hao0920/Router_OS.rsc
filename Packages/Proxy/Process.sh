#### 处理数据 ####
### Loyalsoldier/geoip
mkdir -p ./Cache/Proxy/Process/Loyalsoldier
find ./Cache/Proxy/Upstream/Loyalsoldier/geoip -type f -name "*.txt" | xargs cat > ./Cache/Proxy/Process/Loyalsoldier/1.txt
# 删除 IPv6
sed -e '/:/d' ./Cache/Proxy/Process/Loyalsoldier/1.txt > ./Cache/Proxy/Process/Loyalsoldier/2.txt
# 删除空格行
sed -e '/^$/d' ./Cache/Proxy/Process/Loyalsoldier/3.txt > ./Cache/Proxy/Process/Loyalsoldier/4.txt
# 去重
sort -u ./Cache/Proxy/Process/Loyalsoldier/5.txt > ./Cache/Proxy/Process/Loyalsoldier/geoip.txt
