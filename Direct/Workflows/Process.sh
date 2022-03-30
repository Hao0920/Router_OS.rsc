#### 处理数据 ####
# felixonmars/dnsmasq-china-list
mkdir -p ./Direct/Cache/Process/felixonmars
find ./Direct/Cache/Upstream/felixonmars/dnsmasq-china-list -type f -name "*.txt" | xargs cat > ./Direct/Cache/Process/felixonmars/1.txt
sed -e 's/server=\///' ./Direct/Cache/Process/felixonmars/1.txt > ./Direct/Cache/Process/felixonmars/2.txt
sed -e 's/\/114.114.114.114//' ./Direct/Cache/Process/felixonmars/2.txt > ./Direct/Cache/Process/felixonmars/dnsmasq-china-list.txt

# v2fly/domain-list-community
mkdir -p ./Direct/Cache/Process/v2fly
find ./Direct/Cache/Upstream/v2fly/domain-list-community -type f -name "*.txt" | xargs cat > ./Direct/Cache/Process/v2fly/1.txt
grep -F '@cn' ./Direct/Cache/Process/v2fly/1.txt > ./Direct/Cache/Process/v2fly/2.txt