### 建立缓存 ### 
mkdir -p ./Scanners/Cache/Build/

### 整理 ###
find ./Scanners/Cache/Source -type f -name "*.txt" | xargs cat > ./Scanners/Cache/Build/1.txt
# 删除注释行
sed -e '/^#/d' ./Scanners/Cache/Build/1.txt > ./Scanners/Cache/Build/2.txt
# 删除空格行
sed -e '/^$/d' ./Scanners/Cache/Build/2.txt > ./Scanners/Cache/Build/3.txt
# 去重
sort -u ./Scanners/Cache/Build/3.txt > ./Scanners/Cache/Build/4.txt

### 构建 ###
{
echo "/ip firewall address-list"
echo "remove [find list="scanners"]"
for address in $(cat ./Scanners/Cache/Build/4.txt) ; do
  echo "add list=scanners address=$address"
done
} > ./Scanners/Scanners.rsc

### 清除缓存 ###
rm -rf ./Scanners/Cache/Build/