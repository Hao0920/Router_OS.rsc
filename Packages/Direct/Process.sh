#### 处理数据 ####
### Basic
## Domains
mkdir -p ./Cache/Direct/Process/Basic
find ./Packages/Direct/Basic/Domains -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Basic/Domains-1.txt
sed -e '/#/d' ./Cache/Direct/Process/Basic/Domains-1.txt > ./Cache/Direct/Process/Basic/Domains-2.txt
sed -e '/^$/d' ./Cache/Direct/Process/Basic/Domains-2.txt > ./Cache/Direct/Process/Basic/Domains-3.txt
dig -f ./Cache/Direct/Process/Basic/Domains-3.txt +noall +answer @114.114.114.114 +short > ./Cache/Direct/Process/Basic/Domains-114DNS-1.txt
grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ./Cache/Direct/Process/Basic/Domains-114DNS-2.txt > ./Cache/Direct/Process/Basic/Domains.txt
## IPv4
find ./Packages/Direct/Basic/IPv4 -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Basic/IPv4-1.txt
sed -e '/#/d' ./Cache/Direct/Process/Basic/IPv4-1.txt > ./Cache/Direct/Process/Basic/IPv4-2.txt
sed -e '/^$/d' ./Cache/Direct/Process/Basic/IPv4-2.txt > ./Cache/Direct/Process/Basic/IPv4.txt

### v2fly/domain-list-community
mkdir -p ./Cache/Direct/Process/v2fly/domain-list-community
find ./Cache/Direct/Upstream/v2fly/domain-list-community -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-1.txt
grep "@cn" ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-1.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-2.txt
sed -e 's/ @cn//' ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-2.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-3.txt
sed -e 's/full://' ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-3.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-4.txt
sed -e '/#/d' ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-4.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-5.txt
sed -e '/regexp:/d' ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-5.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-6.txt


{
    cat ./Cache/Direct/Process/Basic/Domains.txt
    cat ./Cache/Direct/Process/Basic/IPv4.txt
} > ./Cache/Direct/Process/Basic/Basic-1.txt
sort -u ./Cache/Direct/Process/Basic/Basic-1.txt > ./Cache/Direct/Process/Process.txt