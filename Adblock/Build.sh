### 建立缓存 ### 
mkdir -p ./Adblock/Cache/Build/

### 整理 ###
find ./Adblock/Source -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Build/source.txt
find ./Adblock/Cache/Upstream -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Build/upstream.txt
cat  ./Adblock/Cache/Build/source.txt  ./Adblock/Cache/Build/upstream.txt >  ./Adblock/Cache/Build/adblock.txt
# 删除注释行
sed -e '/^#/d' ./Adblock/Cache/Build/1.txt > ./Adblock/Cache/Build/2.txt
# 删除 include 行
sed -e '/^include:/d' ./Adblock/Cache/Build/2.txt > ./Adblock/Cache/Build/3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Adblock/Cache/Build/3.txt > ./Adblock/Cache/Build/4.txt
# 删除 @ads
sed -e 's/ @ads//' ./Adblock/Cache/Build/4.txt > ./Adblock/Cache/Build/5.txt
# 删除 full:
sed -e 's/full://' ./Adblock/Cache/Build/5.txt > ./Adblock/Cache/Build/6.txt
# 删除 domain:
sed -e 's/domain://' ./Adblock/Cache/Build/6.txt > ./Adblock/Cache/Build/7.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./Adblock/Cache/Build/7.txt > ./Adblock/Cache/Build/8.txt
# 删除空格行
sed -e '/^$/d' ./Adblock/Cache/Build/8.txt > ./Adblock/Cache/Build/9.txt
# 去重
sort -u ./Adblock/Cache/Build/9.txt > ./Adblock/Cache/Build/adblock.txt

### 构建 ###
{
echo "/ip dns static"
echo "remove [find address=240.0.0.1]"
for name in $(cat ./Adblock/Cache/Build/adblock.txt) ; do
  echo "add address=240.0.0.1 name=$name"
done
echo "/file remove Adblock.rsc"
} > ./Adblock/Adblock.rsc

### 清除缓存 ###
rm -rf ./Adblock/Cache