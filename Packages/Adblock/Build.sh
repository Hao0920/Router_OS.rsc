### 构建 Adblock.rsc ###
mkdir -p ./Releases/Adblock
{
echo "/ip dns static"
echo "remove [find type=NXDOMAIN]"
for name in $(cat ./Cache/Adblock/Process/Origin.txt) ; do
  echo "add name=$name type=NXDOMAIN"
done
echo "/file remove Adblock.rsc"
} > ./Releases/Adblock/Adblock.rsc