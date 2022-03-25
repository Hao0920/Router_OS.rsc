### 建立缓存 ### 
mkdir -p ./Scanners/Cache/Build/

### 整理 ###
find ./Scanners/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Scanners/Cache/Build/1.txt
sed -e '/:/d' ./Scanners/Cache/Build/1.txt > ./Scanners/Cache/Build/2.txt
sed -e '/^#.*/d' ./Scanners/Cache/Build/2.txt > ./Scanners/Cache/Build/scanners.txt

### 构建 ###
{
echo "/ip firewall address-list"
echo "remove [find list="scanners"]"
for address in $(cat ./Scanners/Cache/Build/scanners.txt) ; do
  echo "add list=scanners address=$address"
done
echo "/file remove Scanners.rsc"
} > ./Scanners/Scanners.rsc