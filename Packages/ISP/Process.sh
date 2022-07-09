#### 处理数据 ####
### Loyalsoldier/geoip
mkdir -p ./Cache/ISP/Process/Loyalsoldier
find ./Cache/ISP/Upstream/Loyalsoldier/geoip -type f -name "*.txt" | xargs cat > ./Cache/ISP/Process/Loyalsoldier/ipv4-1.txt
# 删除 IPv6
sed -e '/:/d' ./Cache/ISP/Process/Loyalsoldier/ipv4-1.txt > ./Cache/ISP/Process/Loyalsoldier/ipv4-2.txt
# 删除空格行
sed -e '/^$/d' ./Cache/ISP/Process/Loyalsoldier/ipv4-2.txt > ./Cache/ISP/Process/Loyalsoldier/geoip-ipv4.txt

find ./Cache/ISP/Upstream/Loyalsoldier/geoip -type f -name "*.txt" | xargs cat > ./Cache/ISP/Process/Loyalsoldier/ipv6-1.txt
# 删除 IPv4
sed -e '/^(?:(?:\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$/d' ./Cache/ISP/Process/Loyalsoldier/ipv6-1.txt > ./Cache/ISP/Process/Loyalsoldier/ipv6-2.txt
# 删除空格行
sed -e '/^$/d' ./Cache/ISP/Process/Loyalsoldier/ipv6-2.txt > ./Cache/ISP/Process/Loyalsoldier/geoip-ipv6.txt