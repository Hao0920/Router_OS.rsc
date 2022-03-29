### 建立缓存 ### 
mkdir -p ./Scanners/Cache/Sorting/

### 整理 ###
find ./Scanners/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Scanners/Cache/Sorting/1.txt
sed -e '/:/d' ./Scanners/Cache/Sorting/1.txt > ./Scanners/Cache/Sorting/2.txt
sed -e '/^#.*/d' ./Scanners/Cache/Sorting/2.txt > ./Scanners/Cache/Sorting/scanners.txt