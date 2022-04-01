#### 处理数据 ####
### Loyalsoldier/geoip
mkdir -p ./ISP/Cache/Process/Loyalsoldier
find ./ISP/Cache/Upstream/Loyalsoldier/geoip -type f -name "*.txt" | xargs cat > ./ISP/Cache/Process/Loyalsoldier/1.txt
# 删除注释行
sed -e '/#/d' ./ISP/Cache/Process/Loyalsoldier/1.txt > ./ISP/Cache/Process/Loyalsoldier/2.txt
# 删除 include 行
sed -e '/include:/d' ./ISP/Cache/Process/Loyalsoldier/2.txt > ./ISP/Cache/Process/Loyalsoldier/3.txt
# 删除 regexp 行
sed -e '/regexp:/d' ./ISP/Cache/Process/Loyalsoldier/3.txt > ./ISP/Cache/Process/Loyalsoldier/4.txt
# 删除  @cn
sed -e 's/ @cn//' ./ISP/Cache/Process/Loyalsoldier/4.txt > ./ISP/Cache/Process/Loyalsoldier/5.txt
# 删除 full:
sed -e 's/full://' ./ISP/Cache/Process/Loyalsoldier/5.txt > ./ISP/Cache/Process/Loyalsoldier/6.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./ISP/Cache/Process/Loyalsoldier/6.txt > ./ISP/Cache/Process/Loyalsoldier/7.txt
# 删除domain:
sed -e 's/domain://' ./ISP/Cache/Process/Loyalsoldier/7.txt > ./ISP/Cache/Process/Loyalsoldier/8.txt
# 删除 IPv6
sed -e '/:/d' ./ISP/Cache/Process/Loyalsoldier/8.txt > ./ISP/Cache/Process/Loyalsoldier/9.txt
# 删除空格行
sed -e '/^$/d' ./ISP/Cache/Process/Loyalsoldier/9.txt > ./ISP/Cache/Process/Loyalsoldier/10.txt
# 去重
sort -u ./ISP/Cache/Process/Loyalsoldier/10.txt > ./ISP/Cache/Process/Loyalsoldier/geoip.txt
