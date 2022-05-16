### 构建 Direct.rsc ###
mkdir -p ./Releases/Direct
{
echo "/ip firewall address-list"
echo "remove [find list="direct"]"
for address in $(cat ./Cache/Direct/Process/Process.txt) ; do
  echo "add list=direct address=$address"
done
echo "/file remove Direct.rsc"
} > ./Releases/Direct/Direct.rsc