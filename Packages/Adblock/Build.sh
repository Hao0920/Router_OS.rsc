### 构建 Adblock.rsc ###
mkdir -p ./Releases/Adblock
{
echo "/ip dns static"
echo "remove [find type=NXDOMAIN]"
for regexp in $(cat ./Cache/Adblock/Process/Basic/regexp.txt) ; do
  echo "add type=NXDOMAIN regexp=\"$regexp\""
done
echo "/file remove Adblock.rsc"
} > ./Releases/Adblock/Adblock.rsc

### 清除缓存 ###
# rm -rf ./Adblock/Cache
