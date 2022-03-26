### 建立缓存 ### 
mkdir -p ./Adblock/Cache/Build/

### 构建 ###
{
echo "/ip dns static"
echo "remove [find address=240.0.0.1]"
for name in $(cat ./Adblock/Cache/Sorting/adblock.txt) ; do
  echo "add address=240.0.0.1 name=$name"
done
echo "/file remove Adblock.rsc"
} > ./Adblock/Adblock.rsc

### 清除缓存 ###
# rm -rf ./Adblock/Cache