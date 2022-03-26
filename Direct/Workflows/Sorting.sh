### 建立缓存 ### 
mkdir -p ./Direct/Cache/Sorting/

### 整理 ###
find ./Direct/Cache/Upstream -type f -name "*.txt" | xargs cat > ./Direct/Cache/Sorting/direct-1.txt
# 删除注释行
sed -e '/^#/d' ./Direct/Cache/Sorting/direct-1.txt > ./Direct/Cache/Sorting/direct-2.txt
# 删除 include 行
sed -e '/^include:/d' ./Direct/Cache/Sorting/direct-2.txt > ./Direct/Cache/Sorting/direct-3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Direct/Cache/Sorting/direct-3.txt > ./Direct/Cache/Sorting/direct-4.txt
# 删除  @cn
sed -e 's/ @cn//' ./Direct/Cache/Sorting/direct-4.txt > ./Direct/Cache/Sorting/direct-5.txt
# 删除 full:
sed -e 's/full://' ./Direct/Cache/Sorting/direct-5.txt > ./Direct/Cache/Sorting/direct-6.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./Direct/Cache/Sorting/direct-6.txt > ./Direct/Cache/Sorting/direct-7.txt
# 删除domain:
sed -e 's/domain://' ./Direct/Cache/Sorting/direct-7.txt > ./Direct/Cache/Sorting/direct-8.txt
# 删除空格行
sed -e '/^$/d' ./Direct/Cache/Sorting/direct-8.txt > ./Direct/Cache/Sorting/direct-9.txt
# 去重
sort -u ./Direct/Cache/Sorting/direct-9.txt > ./Direct/Cache/Sorting/direct.txt
