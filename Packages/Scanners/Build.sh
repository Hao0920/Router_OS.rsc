### 构建 Scanners.rsc ###
mkdir -p ./Releases/Scanners
{
echo "/ip firewall address-list"
echo "remove [find list="scanners"]"
for address in $(cat ./Cache/Scanners/Process/USTC/scanners.txt) ; do
  echo "add list=scanners address=$address"
done
echo "/file remove Scanners.rsc"
} > ./Releases/Scanners/Scanners.rsc