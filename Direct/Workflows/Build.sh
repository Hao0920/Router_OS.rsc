### 构建 Direct.rsc ###
{
echo "/ip firewall address-list"
echo "remove [find list="direct"]"
for address in $(cat ./Direct/Cache/Process/Origin.txt) ; do
  echo "add list=direct address=$address"
done
echo "/file remove Direct.rsc"
} > ./Direct/Direct.rsc