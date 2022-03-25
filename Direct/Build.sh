### 建立缓存 ### 
mkdir -p ./Direct/Cache/Build/

### 整理 ###
find ./Direct/Cache/Upstream -type f -name "*.txt" | xargs cat > ./Direct/Cache/Build/direct-1.txt
# 删除注释行
sed -e '/^#/d' ./Direct/Cache/Build/direct-1.txt > ./Direct/Cache/Build/direct-2.txt
# 删除 include 行
sed -e '/^include:/d' ./Direct/Cache/Build/direct-2.txt > ./Direct/Cache/Build/direct-3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Direct/Cache/Build/direct-3.txt > ./Direct/Cache/Build/direct-4.txt
# 删除  @cn
sed -e 's/ @cn//' ./Direct/Cache/Build/direct-4.txt > ./Direct/Cache/Build/direct-5.txt
# 删除 full:
sed -e 's/full://' ./Direct/Cache/Build/direct-5.txt > ./Direct/Cache/Build/direct-6.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./Direct/Cache/Build/direct-6.txt > ./Direct/Cache/Build/direct-7.txt
# 删除domain:
sed -e 's/domain://' ./Direct/Cache/Build/direct-7.txt > ./Direct/Cache/Build/direct-8.txt
# 删除空格行
sed -e '/^$/d' ./Direct/Cache/Build/direct-8.txt > ./Direct/Cache/Build/direct-9.txt
# 去重
sort -u ./Direct/Cache/Build/direct-9.txt > ./Direct/Cache/Build/direct-10.txt
sed -e 's/\\n/|/' ./Direct/Cache/Build/direct-10.txt > ./Direct/Cache/Build/direct.txt
### 构建 ###
{
echo "/ip firewall layer7-protocol"
echo "remove [find name="direct"]"
for address in $(cat ./Direct/Cache/Build/direct.txt) ; do
  echo "add name=direct regexp=$address"
done
echo "/file remove Direct.rsc"
} > ./Direct/Direct.rsc

### 清除缓存 ###
# rm -rf ./Direct/Cache
