### 构建 Proxy.rsc ###
mkdir -p ./Releases/Proxy
{
echo "/ip dns static"
echo "remove [find type=FWD]"
for name in $(cat ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat/proxy-list.txt) ; do
  echo "add forward-to=10.0.0.2 name=$name type=FWD"
done
echo "/file remove Proxy.rsc"
} > ./Releases/Proxy/Proxy.rsc