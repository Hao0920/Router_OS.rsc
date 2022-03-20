### 建立缓存 ### 
mkdir -p ./Config/DNS_Static/Cache/Building/
### 整理 ###
find ./Config/DNS_Static/Cache/Source -type f -name "*.txt" | xargs cat > ./Config/DNS_Static/Cache/Building/1.txt
# 删除注释行
sed -e '/^#/d' ./Config/DNS_Static/Cache/Building/1.txt > ./Config/DNS_Static/Cache/Building/2.txt
# 删除 @ads
sed -e 's/ @ads//' ./Config/DNS_Static/Cache/Building/2.txt > ./Config/DNS_Static/Cache/Building/3.txt