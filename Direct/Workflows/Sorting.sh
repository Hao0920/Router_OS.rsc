### 建立缓存 ### 
mkdir -p ./Direct/Cache/Sorting/

### 整理 ###
find ./Direct/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Direct/Cache/Sorting/1.txt
sed -e 's/server=///' ./Direct/Cache/Sorting/1.txt > ./Direct/Cache/Sorting/2.txt
sed -e 's//114.114.114.114//' ./Direct/Cache/Sorting/2.txt > ./Direct/Cache/Sorting/Direct.txt