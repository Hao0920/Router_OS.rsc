#### 处理数据 ####
# felixonmars/dnsmasq-china-list
mkdir -p ./Cache/Direct/Process/felixonmars
find ./Cache/Direct/Upstream/felixonmars/dnsmasq-china-list -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/felixonmars/1.txt
sed -e 's/server=\///' ./Cache/Direct/Process/felixonmars/1.txt > ./Cache/Direct/Process/felixonmars/2.txt
sed -e 's/\/114.114.114.114//' ./Cache/Direct/Process/felixonmars/2.txt > ./Cache/Direct/Process/felixonmars/dnsmasq-china-list.txt

# v2fly/domain-list-community
mkdir -p ./Cache/Direct/Process/v2fly
find ./Cache/Direct/Upstream/v2fly/domain-list-community -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/v2fly/1.txt
grep -F '@cn' ./Cache/Direct/Process/v2fly/1.txt > ./Cache/Direct/Process/v2fly/2.txt
sed -e '/#/d' ./Cache/Direct/Process/v2fly/2.txt > ./Cache/Direct/Process/v2fly/3.txt
sed -e 's/full://' ./Cache/Direct/Process/v2fly/3.txt > ./Cache/Direct/Process/v2fly/4.txt
sed -e 's/ @cn//' ./Cache/Direct/Process/v2fly/4.txt > ./Cache/Direct/Process/v2fly/5.txt
sed -e '/regexp:/d' ./Cache/Direct/Process/v2fly/5.txt > ./Cache/Direct/Process/v2fly/domain-list-community.txt
{
    cat ./Cache/Direct/Process/felixonmars/dnsmasq-china-list.txt
    cat ./Cache/Direct/Process/v2fly/domain-list-community.txt
} > ./Cache/Direct/Process/1.txt
sort -u ./Cache/Direct/Process/1.txt > ./Cache/Direct/Process/Origin.txt