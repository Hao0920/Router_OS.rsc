### 构建 Direct.rsc ###
mkdir -p ./Releases/Direct
{
echo "/ip dns static"
echo "remove [find forward-to=10.0.0.1]"
for name in $(cat ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat.txt) ; do
  echo "add forward-to=10.0.0.1 name=$name type=FWD"
done
echo "/file remove Direct.rsc"
} > ./Releases/Direct/Direct.rsc