### 构建 Direct.rsc ###
mkdir -p ./Releases/Direct
{
echo "/ip dns static"
echo "remove [find type=FWD]"
for name in $(cat ./Cache/Direct/Process/Process.txt) ; do
  echo "add forward-to=10.0.0.1 name=$name type=FWD"
done
echo "/file remove direct.rsc"
} > ./Releases/Direct/Direct.rsc