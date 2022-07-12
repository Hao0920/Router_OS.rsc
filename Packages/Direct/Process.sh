#### 处理数据 ####
### Basic
mkdir -p ./Cache/Direct/Process/Basic
find ./Packages/Direct/Basic -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Basic/Basic-1.txt
sed -e '/^$/d' ./Cache/Direct/Process/Basic/Basic-1.txt > ./Cache/Direct/Process/Basic/Basic-2.txt
sed -e '/#/d' ./Cache/Direct/Process/Basic/Basic-2.txt > ./Cache/Direct/Process/Basic/Basic.txt

### v2fly/domain-list-community
mkdir -p ./Cache/Direct/Process/v2fly/domain-list-community
find ./Cache/Direct/Upstream/v2fly/domain-list-community -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-1.txt
grep "@cn" ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-1.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-2.txt
sed -e 's/ @cn//' ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-2.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-3.txt
sed -e 's/full://' ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-3.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-4.txt
sed -e '/#/d' ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-4.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-5.txt
sed -e '/regexp:/d' ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-5.txt > ./Cache/Direct/Process/v2fly/domain-list-community/domain-list-community-6.txt

{
    cat ./Cache/Direct/Process/Basic/Basic.txt
} > ./Cache/Direct/Process/Process-1.txt
sort -u ./Cache/Direct/Process/Process-1.txt > ./Cache/Direct/Process/Process.txt


### Basic
mkdir -p ./Cache/Direct/Process/Basic
find ./Packages/Direct/Basic/Domains -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Basic/Domains-1.txt
sed -e '/#/d' ./Cache/Direct/Process/Basic/Domains-1.txt > ./Cache/Direct/Process/Basic/Domains-2.txt
sed -e '/^$/d' ./Cache/Direct/Process/Basic/Domains-2.txt > ./Cache/Direct/Process/Basic/Domains-3.txt
dig -f -t A ./Cache/Direct/Process/Basic/Domains-3.txt @114.114.114.114,223.5.5.5,119.29.29.29 +short > ./Cache/Direct/Process/Basic/Domains-4.txt