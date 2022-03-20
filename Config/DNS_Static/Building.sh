### 建立缓存 ### 
mkdir -p ./Config/DNS_Static/Cache/Building/

### 整理 ###
find ./Config/DNS_Static/Cache/Source -type f -name "*.txt" | xargs cat > ./Config/DNS_Static/Cache/Building/1.txt
# 删除注释行
sed -e '/^#/d' ./Config/DNS_Static/Cache/Building/1.txt > ./Config/DNS_Static/Cache/Building/2.txt
# 删除 include 行
sed -e '/^include:/d' ./Config/DNS_Static/Cache/Building/2.txt > ./Config/DNS_Static/Cache/Building/3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Config/DNS_Static/Cache/Building/3.txt > ./Config/DNS_Static/Cache/Building/4.txt
# 删除 @ads
sed -e 's/ @ads//' ./Config/DNS_Static/Cache/Building/4.txt > ./Config/DNS_Static/Cache/Building/5.txt
# 删除 full:
sed -e 's/full://' ./Config/DNS_Static/Cache/Building/5.txt > ./Config/DNS_Static/Cache/Building/6.txt
# 删除空格行
sed -e '/^$/d' ./Config/DNS_Static/Cache/Building/6.txt > ./Config/DNS_Static/Cache/Building/7.txt
# 去重
sort -u ./Config/DNS_Static/Cache/Building/7.txt > ./Config/DNS_Static/Cache/Building/8.txt

### 构建 ###
{
  echo "/ip dns static"
  echo "remove [find address=240.0.0.1]"
  for name in $(cat ./Config/DNS_Static/Cache/Building/8.txt) ; do
    echo "add address=240.0.0.1 name=$name"
  done
} > ./Config/DNS_Static/DNS_Static.rsc

### 清除缓存 ###
rm -rf ./Config/DNS_Static/Cache