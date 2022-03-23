### 建立缓存 ### 
mkdir -p ./Scanners/Cache/Build/

### 整理 ###
sed -e '/:/d' ./Scanners/Cache/Upstream/ustc-blackip.txt > ./Scanners/Cache/Upstream/ustc-blackip-1.txt
sed -e '/^#.*/d' ./Scanners/Cache/Upstream/ustc-blackip-1.txt > ./Scanners/Cache/Upstream/ustc-blackip-2.txt

### 构建 ###
{
echo "/ip firewall address-list"
echo "remove [find list="scanners"]"
for address in $(cat ./Scanners/Cache/Upstream/ustc-blackip-2.txt) ; do
  echo "add list=scanners address=$address"
done
echo "/file remove scanners.rsc"
} > ./Scanners/Scanners.rsc

### 清除缓存 ###
#rm -rf ./Scanners/Cache/Build/