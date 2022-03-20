### 建立缓存 ### 
mkdir -p ./Config/DNS_Static/Cache/Building/
#
find ./Config/DNS_Static/Cache/Source -type f -name "*.txt" | xargs cat > ./Config/DNS_Static/Cache/Building/1.txt
sed -e '/^#/d' ./Config/DNS_Static/Cache/Building/1.txt > ./Config/DNS_Static/Cache/Building/2.txt
sed -e '/ @ads/d' ./Config/DNS_Static/Cache/Building/2.txt > ./Config/DNS_Static/Cache/Building/3.txt