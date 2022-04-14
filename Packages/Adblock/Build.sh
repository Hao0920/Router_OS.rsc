### 构建 Adblock.rsc ###
mkdir -p ./Releases/Adblock
{
echo "/ip dns static"
echo "remove [find address=240.0.0.1]"
for name in $(cat ./Cache/Adblock/Process/Origin.txt) ; do
  echo "add address=240.0.0.1 name=$name"
done
echo "/file remove Adblock.rsc"
} > ./Releases/Adblock/Adblock.rsc
