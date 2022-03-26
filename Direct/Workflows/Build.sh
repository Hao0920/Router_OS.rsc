### 构建 ###
{
echo "/ip firewall address-list"
echo "remove [find name="direct"]"
for address in $(cat ./Direct/Cache/Sorting/direct.txt) ; do
  echo "add list=direct address=$address"
done
echo "/file remove Direct.rsc"
} > ./Direct/Direct.rsc

### 清除缓存 ###
# rm -rf ./Direct/Cache
