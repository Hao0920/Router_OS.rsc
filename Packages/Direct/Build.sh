### 构建 Direct.rsc ###
mkdir -p ./Releases/Direct
{
echo "/ip firewall address-list"
for address in $(cat ./Cache/Direct/Process/Process.txt) ; do
  echo "add list=china address=$address"
done
echo "/file remove Direct.rsc"
} > ./Releases/Direct/Direct.rsc
