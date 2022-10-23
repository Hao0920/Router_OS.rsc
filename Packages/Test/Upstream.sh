#### 获取上游数据 ####
# Hurricane Electric
mkdir -p ./Cache/Test/Upstream/Hurricane_Electric/IPv4
mkdir -p ./Cache/Test/Upstream/Hurricane_Electric/IPv6
wget --no-check-certificate -c -O ./Cache/Test/Upstream/Hurricane_Electric/IPv4/Valve_Corporation.txt "https://bgp.he.net/AS32590#_prefixes"
wget --no-check-certificate -c -O ./Cache/Test/Upstream/Hurricane_Electric/IPv6/Valve_Corporation.txt "https://bgp.he.net/AS32590#_prefixes6"