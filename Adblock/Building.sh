### 建立缓存 ### 
mkdir -p ./Adblock/Cache/Building/

### 整理 ###
find ./Adblock/Cache/Source -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Building/1.txt
# 删除注释行
sed -e '/^#/d' ./Adblock/Cache/Building/1.txt > ./Adblock/Cache/Building/2.txt
# 删除 include 行
sed -e '/^include:/d' ./Adblock/Cache/Building/2.txt > ./Adblock/Cache/Building/3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Adblock/Cache/Building/3.txt > ./Adblock/Cache/Building/4.txt
# 删除 @ads
sed -e 's/ @ads//' ./Adblock/Cache/Building/4.txt > ./Adblock/Cache/Building/5.txt
# 删除 full:
sed -e 's/full://' ./Adblock/Cache/Building/5.txt > ./Adblock/Cache/Building/6.txt
# 删除空格行
sed -e '/^$/d' ./Adblock/Cache/Building/6.txt > ./Adblock/Cache/Building/7.txt
# 去重
sort -u ./Adblock/Cache/Building/7.txt > ./Adblock/Cache/Building/8.txt

### 构建 ###
{
  echo "/ip dns static"
  echo "remove [find address=240.0.0.1]"
  for name in $(cat ./Adblock/Cache/Building/8.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
} > ./Adblock/Adblock.rsc

### 清除缓存 ###
rm -rf ./Adblock/Cache