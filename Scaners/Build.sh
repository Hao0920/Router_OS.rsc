### 建立缓存 ### 
mkdir -p ./Scaners/Cache/Building/

### 整理 ###
find ./Scaners/Cache/Source -type f -name "*.txt" | xargs cat > ./Scaners/Cache/Building/1.txt
# 删除注释行
sed -e '/^#/d' ./Scaners/Cache/Building/1.txt > ./Scaners/Cache/Building/2.txt
# 删除 include 行
sed -e '/^include:/d' ./Scaners/Cache/Building/2.txt > ./Scaners/Cache/Building/3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Scaners/Cache/Building/3.txt > ./Scaners/Cache/Building/4.txt
# 删除 @ads
sed -e 's/ @ads//' ./Scaners/Cache/Building/4.txt > ./Scaners/Cache/Building/5.txt
# 删除 full:
sed -e 's/full://' ./Scaners/Cache/Building/5.txt > ./Scaners/Cache/Building/6.txt
# 删除空格行
sed -e '/^$/d' ./Scaners/Cache/Building/6.txt > ./Scaners/Cache/Building/7.txt
# 去重
sort -u ./Scaners/Cache/Building/7.txt > ./Scaners/Cache/Building/8.txt

### 构建 ###
{
  echo "/ip dns static"
  echo "remove [find address=240.0.0.1]"
  for name in $(cat ./Scaners/Cache/Building/8.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
} > ./Scaners/Scaners.rsc

### 清除缓存 ###
rm -rf ./Scaners/Cache