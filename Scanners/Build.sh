### 建立缓存 ### 
mkdir -p ./Scanners/Cache/Build/

### 整理 ###
find ./Scanners/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Build/Upstream-1.txt
sed -e '/:/d' ./Adblock/Cache/Build/Upstream-1.txt > ./Adblock/Cache/Build/Upstream-2.txt
sed -e '/^#.*/d' ./Adblock/Cache/Build/Upstream-2.txt > ./Adblock/Cache/Build/Upstream-3.txt

### 构建 ###
{
echo "/ip firewall address-list"
echo "remove [find list="scanners"]"
for address in $(cat ./Adblock/Cache/Build/Upstream-3.txt) ; do
  echo "add list=scanners address=$address"
done
echo "/file remove scanners.rsc"
} > ./Scanners/Scanners.rsc

### 清除缓存 ###
#rm -rf ./Scanners/Cache/Build/