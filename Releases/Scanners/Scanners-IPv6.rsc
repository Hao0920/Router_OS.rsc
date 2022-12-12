/ipv6 firewall address-list
remove [find list=scanners]
add list=scanners address=2607:ff28:a005:10c:ec4:7aff:feb5:1756
add list=scanners address=2a05:8280:f:431f::1
add list=scanners address=2a05:8280:f:431f::11
add list=scanners address=2a05:8280:f:431f::2
/file remove Scanners-IPv6.rsc
