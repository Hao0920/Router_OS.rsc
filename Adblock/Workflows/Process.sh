#### 处理数据 #### Origin
### NextDNS/metadata
mkdir -p ./Adblock/Cache/Process/NextDNS/
find ./Adblock/Cache/Upstream/NextDNS/metadata -type f -name "*.txt" | sed -e '/^$/d' | sed -e '/#/d' | xargs cat > ./Adblock/Cache/Process/NextDNS/metadata.txt

### PingLin Li/ad-hosts
mkdir -p ./Adblock/Cache/Process/ilpl/ad-hosts
find ./Adblock/Cache/Upstream/ilpl/ad-hosts -type f -name "*.txt" | sed -e '/#/d' | sed -e 's/0.0.0.0 //' | xargs cat > ./Adblock/Cache/Process/ilpl/ad-hosts.txt

### Loyalsoldier/domain-list-custom
mkdir -p ./Adblock/Cache/Process/Loyalsoldier/domain-list-custom
find ./Adblock/Cache/Upstream/Loyalsoldier/domain-list-custom -type f -name "*.txt" | sed -e 's/domain://' | sed -e '/regexp:/d' | sed -e 's/:@ads//' | xargs cat > ./Adblock/Cache/Process/Loyalsoldier/domain-list-custom.txt

### jdlingyu/ad-wars
mkdir -p ./Adblock/Cache/Process/jdlingyu/ad-wars
find ./Adblock/Cache/Upstream/jdlingyu/ad-wars -type f -name "*.txt" | sed -e '/localhost/d' | sed -e '/#/d' | sed -e 's/127.0.0.1 //' | xargs cat > ./Adblock/Cache/Process/jdlingyu/ad-wars.txt
####
find ./Adblock/Cache/Process -type f -name "*.txt"  | sort -u | xargs cat > ./Adblock/Cache/Process/Origin.txt