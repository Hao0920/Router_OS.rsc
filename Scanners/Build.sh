### 建立缓存 ### 
mkdir -p ./Scanners/Cache/Build/

### 整理 ###
find ./Scanners/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Scanners/Cache/Build/Upstream-1.txt
sed -e '/:/d' ./Scanners/Cache/Build/Upstream-1.txt > ./Scanners/Cache/Build/Upstream-2.txt
sed -e '/^#.*/d' ./Scanners/Cache/Build/Upstream-2.txt > ./Scanners/Cache/Build/Upstream-3.txt

### 构建 ###
{
echo "/ip firewall address-list"
echo "remove [find list="scanners"]"
for address in $(cat ./Scanners/Cache/Build/Upstream-3.txt) ; do
  echo "add list=scanners address=$address"
done
echo "/file remove scanners.rsc"
} > ./Scanners/Scanners.rsc
