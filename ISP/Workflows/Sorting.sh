### 建立缓存 ### 
mkdir -p ./ISP/Cache/Sorting/

### 整理 ###
find ./ISP/Cache/Upstream/Loyalsoldier/ -type f -name "*.txt" | xargs cat > ./ISP/Cache/Sorting/ISP-1.txt
# 删除注释行
sed -e '/^#/d' ./ISP/Cache/Sorting/ISP-1.txt > ./ISP/Cache/Sorting/ISP-2.txt
# 删除 include 行
sed -e '/^include:/d' ./ISP/Cache/Sorting/ISP-2.txt > ./ISP/Cache/Sorting/ISP-3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./ISP/Cache/Sorting/ISP-3.txt > ./ISP/Cache/Sorting/ISP-4.txt
# 删除  @cn
sed -e 's/ @cn//' ./ISP/Cache/Sorting/ISP-4.txt > ./ISP/Cache/Sorting/ISP-5.txt
# 删除 full:
sed -e 's/full://' ./ISP/Cache/Sorting/ISP-5.txt > ./ISP/Cache/Sorting/ISP-6.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./ISP/Cache/Sorting/ISP-6.txt > ./ISP/Cache/Sorting/ISP-7.txt
# 删除domain:
sed -e 's/domain://' ./ISP/Cache/Sorting/ISP-7.txt > ./ISP/Cache/Sorting/ISP-8.txt
# 删除 IPv6
sed -e '/:/d' ./ISP/Cache/Sorting/ISP-8.txt > ./ISP/Cache/Sorting/ISP-9.txt
# 删除空格行
sed -e '/^$/d' ./ISP/Cache/Sorting/ISP-9.txt > ./ISP/Cache/Sorting/ISP-10.txt
# 去重
sort -u ./ISP/Cache/Sorting/ISP-10.txt > ./ISP/Cache/Sorting/ISP.txt
