### 构建 Adblock.rsc ###
{
echo "/ip dns static"
echo "remove [find address=240.0.0.1]"
for name in $(cat ./Adblock/Cache/Process/Origin.txt) ; do
  echo "add address=240.0.0.1 name=$name"
done
echo "/file remove Adblock.rsc"
} > ./Adblock/Adblock.rsc

### 清除缓存 ###
# rm -rf ./Adblock/Cache