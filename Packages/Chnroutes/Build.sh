### 构建 Chnroutes.rsc ###
mkdir -p ./Releases/Chnroutes
{
    echo "/ip firewall address-list"
    echo "remove [find list="china"]"
    for address in $(cat ./Cache/Chnroutes/Process/IPv4.txt) ; do
    echo "add list=china address=$address"
    done
    echo "/file remove Chnroutes-IPv4.rsc"
} > ./Releases/Chnroutes/Chnroutes-IPv4.rsc

{
    echo "/ipv6 firewall address-list"
    echo "remove [find list="china"]"
    for address in $(cat ./Cache/Chnroutes/Upstream/pexcn/daily/chnroute-v6.txt) ; do
    echo "add list=china address=$address"
    done
    echo "/file remove Chnroutes-IPv6.rsc"
} > ./Releases/Chnroutes/Chnroutes-IPv6.rsc

{
    echo ":global gfwdns"
    echo "/ip dns static remove numbers=[find forward-to=\$gfwdns]"
    echo "/ip dns static"
    for regexp in $(cat ./Cache/Chnroutes/Process/Loyalsoldier/v2ray-rules-dat/gfw.txt) ; do
    echo "add regexp=$regexp type=FWD forward-to=\$gfwdns"
    done
    echo "/ip dns cache flush"
    echo "/file remove GFWFWD.rsc"
} > ./Releases/Chnroutes/GFWFWD.rsc