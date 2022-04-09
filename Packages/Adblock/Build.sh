### 构建 Adblock.rsc ###
mkdir -p ./Releases/Adblock
{
echo "/ip dns static"
echo "remove [find address=240.0.0.1]"
for regexp in $(cat ./Cache/Adblock/Process/Basic/ACL4SSR/Regexp.txt) ; do
  echo "add address=240.0.0.1 regexp=$regexp"
done
echo "/ip firewall address-list"
echo "remove [find list="adblock"]"
for address in $(cat ./Cache/Adblock/Process/Basic/ACL4SSR/Regexp.txt) ; do
  echo "add list=adblock address=$address"
done
echo "/file remove Adblock.rsc"
} > ./Releases/Adblock/Adblock.rsc
# {
#echo "/ip dns static"
#echo "remove [find address=240.0.0.1]"
#for name in $(cat ./Cache/Adblock/Process/Origin.txt) ; do
#  echo "add address=240.0.0.1 name=$name"
#done
#echo "/file remove Adblock.rsc"
#} > ./Releases/Adblock/Adblock.rsc

### 清除缓存 ###
# rm -rf ./Adblock/Cache