### 构建 Direct.rsc ###
mkdir -p ./Releases/Direct
{
echo "/ip firewall address-list"
echo "remove [find list="direct"]"
for name in $(cat ./Cache/Direct/Process/Origin.txt) ; do
  echo "add name=$name"  type=FWD forward-to= 114.114.114.114,114.114.115.115,119.29.29.29,119.28.28.28,223.5.5.5,223.6.6.6
done
echo "/file remove Direct.rsc"
} > ./Releases/Direct/Direct.rsc
