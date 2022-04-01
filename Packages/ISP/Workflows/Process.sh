#### 处理数据 ####
### Loyalsoldier/geoip
mkdir -p ./Cache/ISP/Process/Loyalsoldier
find ./Cache/ISP/Upstream/Loyalsoldier/geoip -type f -name "*.txt" | xargs cat > ./Cache/ISP/Process/Loyalsoldier/1.txt
# 删除注释行
sed -e '/#/d' ./Cache/ISP/Process/Loyalsoldier/1.txt > ./Cache/ISP/Process/Loyalsoldier/2.txt
# 删除 include 行
sed -e '/include:/d' ./Cache/ISP/Process/Loyalsoldier/2.txt > ./Cache/ISP/Process/Loyalsoldier/3.txt
# 删除 regexp 行
sed -e '/regexp:/d' ./Cache/ISP/Process/Loyalsoldier/3.txt > ./Cache/ISP/Process/Loyalsoldier/4.txt
# 删除  @cn
sed -e 's/ @cn//' ./Cache/ISP/Process/Loyalsoldier/4.txt > ./Cache/ISP/Process/Loyalsoldier/5.txt
# 删除 full:
sed -e 's/full://' ./Cache/ISP/Process/Loyalsoldier/5.txt > ./Cache/ISP/Process/Loyalsoldier/6.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./Cache/ISP/Process/Loyalsoldier/6.txt > ./Cache/ISP/Process/Loyalsoldier/7.txt
# 删除domain:
sed -e 's/domain://' ./Cache/ISP/Process/Loyalsoldier/7.txt > ./Cache/ISP/Process/Loyalsoldier/8.txt
# 删除 IPv6
sed -e '/:/d' ./Cache/ISP/Process/Loyalsoldier/8.txt > ./Cache/ISP/Process/Loyalsoldier/9.txt
# 删除空格行
sed -e '/^$/d' ./Cache/ISP/Process/Loyalsoldier/9.txt > ./Cache/ISP/Process/Loyalsoldier/10.txt
# 去重
sort -u ./Cache/ISP/Process/Loyalsoldier/10.txt > ./Cache/ISP/Process/Loyalsoldier/geoip.txt
