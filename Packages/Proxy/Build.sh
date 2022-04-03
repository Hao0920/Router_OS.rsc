### 构建 Proxy.rsc ###
mkdir -p ./Releases/Proxy
{
echo "/ip firewall address-list"
echo "remove [find list="proxy"]"
for address in $(cat ./Cache/Proxy/Upstream/Loyalsoldier/geoip/cn.txt) ; do
  echo "add list=proxy address=$address"
done
echo "/file remove Proxy.rsc"
} > ./Releases/Proxy/Proxy.rsc