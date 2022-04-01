### 构建 Scanners.rsc ###
{
echo "/ip firewall address-list"
echo "remove [find list="scanners"]"
for address in $(cat ./Scanners/Cache/Process/USTC/scanners.txt) ; do
  echo "add list=scanners address=$address"
done
echo "/file remove Scanners.rsc"
} > ./Scanners/Scanners.rsc