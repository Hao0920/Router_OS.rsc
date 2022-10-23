### 构建 Geoip.rsc ###
mkdir -p ./Releases/Geoip
# IPv4
{
    echo "/ip firewall address-list"
    echo "remove [find list="china"]"
    for address in $(cat ./Cache/Geoip/Process/IPv4.txt) ; do
    echo "add list=china address=$address"
    done
    echo "/file remove Geoip-IPv4.rsc"
} > ./Releases/Geoip/Geoip-IPv4.rsc
# IPv6
{
    echo "/ipv6 firewall address-list"
    echo "remove [find list="china"]"
    for address in $(cat ./Cache/Geoip/Process/IPv6.txt) ; do
    echo "add list=china address=$address"
    done
    echo "/file remove Geoip-IPv6.rsc"
} > ./Releases/Geoip/Geoip-IPv6.rsc
# Forward DNS
{
    echo ":global FWDgfw"
    echo "/ip dns static"
    echo "remove numbers=[find forward-to=\$FWDgfw]"
    for regexp in $(cat ./Cache/Geoip/Process/Loyalsoldier/v2ray-rules-dat/gfw.txt) ; do
    echo "add regexp=$regexp type=FWD forward-to=\$FWDgfw"
    done
    echo "/ip dns cache flush"
    echo "/file remove Forward_DNS.rsc"
} > ./Releases/Geoip/Forward_DNS.rsc