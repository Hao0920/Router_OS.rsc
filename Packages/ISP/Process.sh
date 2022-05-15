#### 处理数据 ####
### Loyalsoldier/geoip
mkdir -p ./Cache/ISP/Process/Loyalsoldier
find ./Cache/ISP/Upstream/Loyalsoldier/geoip -type f -name "*.txt" | xargs cat > ./Cache/ISP/Process/Loyalsoldier/1.txt
# 删除 IPv6
sed -e '/:/d' ./Cache/ISP/Process/Loyalsoldier/1.txt > ./Cache/ISP/Process/Loyalsoldier/2.txt
# 删除空格行
sed -e '/^$/d' ./Cache/ISP/Process/Loyalsoldier/2.txt > ./Cache/ISP/Process/Loyalsoldier/geoip.txt
