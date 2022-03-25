### 建立缓存 ### 
mkdir -p ./Cache/Adblock/Build/
mkdir -p ./Cache/Adblock/Upstream/
### 获取上游文件 ###
chmod +x ./Packages/Adblock/Upstream.sh
./Packages/Adblock/Upstream.sh
### 整理 ###
find ./Packages/Adblock/Source -type f -name "*.txt" | xargs cat > ./Cache/Adblock/Build/source.txt
find ./Cache/Adblock/Upstream -type f -name "*.txt" | xargs cat > ./Cache/Adblock/Build/upstream.txt
cat  ./Cache/Adblock/Build/source.txt  ./Cache/Adblock/Build/upstream.txt >  ./Cache/Adblock/Build/1.txt
# 删除注释行
sed -e '/^#/d' ./Cache/Adblock/Build/1.txt > ./Cache/Adblock/Build/2.txt
# 删除 include 行
sed -e '/^include:/d' ./Cache/Adblock/Build/2.txt > ./Cache/Adblock/Build/3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Cache/Adblock/Build/3.txt > ./Cache/Adblock/Build/4.txt
# 删除 @ads
sed -e 's/ @ads//' ./Cache/Adblock/Build/4.txt > ./Cache/Adblock/Build/5.txt
# 删除 full:
sed -e 's/full://' ./Cache/Adblock/Build/5.txt > ./Cache/Adblock/Build/6.txt
# 删除 domain:
sed -e 's/domain://' ./Cache/Adblock/Build/6.txt > ./Cache/Adblock/Build/7.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./Cache/Adblock/Build/7.txt > ./Cache/Adblock/Build/8.txt
# 删除空格行
sed -e '/^$/d' ./Cache/Adblock/Build/8.txt > ./Cache/Adblock/Build/9.txt
# 去重
sort -u ./Cache/Adblock/Build/9.txt > ./Cache/Adblock/Build/adblock.txt

### 构建 ###
{
echo "/ip dns static"
echo "remove [find address=240.0.0.1]"
for name in $(cat ./Cache/Adblock/Build/adblock.txt) ; do
  echo "add address=240.0.0.1 name=$name"
done
echo "/file remove Adblock.rsc"
} > ./Releases/Adblock/Adblock.rsc