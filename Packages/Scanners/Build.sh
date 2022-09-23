### 构建 Scanners.rsc ###
mkdir -p ./Releases/Scanners
{
  echo "/ip firewall address-list"
  echo "remove [find list="scanners"]"
  for address in $(cat ./Cache/Scanners/Process/USTC/Scanners-IPv4.txt) ; do
  echo "add list=scanners address=$address"
  done
  echo "/file remove Scanners-IPv4.rsc"
} > ./Releases/Scanners/Scanners-IPv4.rsc
{
  echo "/ipv6 firewall address-list"
  echo "remove [find list="scanners"]"
  for address in $(cat ./Cache/Scanners/Process/USTC/Scanners-IPv6.txt) ; do
  echo "add list=scanners address=$address"
  done
  echo "/file remove Scanners-IPv6.rsc"
} > ./Releases/Scanners/Scanners-IPv6.rsc