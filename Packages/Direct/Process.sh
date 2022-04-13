#### 处理数据 ####
### Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat
find ./Cache/Direct/Upstream/Loyalsoldier/v2ray-rules-dat -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat/1.txt
# 删除 full:
sed -e 's/full://' ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat/1.txt > ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat.txt

### v2fly/domain-list-community
mkdir -p ./Cache/Direct/Process/v2fly/domain-list-community
find ./Cache/Direct/Upstream/v2fly/domain-list-community -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/v2fly/domain-list-community.txt
grep "@cn" ./Cache/Direct/Process/v2fly/domain-list-community.txt > ./Cache/Direct/Process/v2fly/cn.txt
# domain
sed -e 's/ @cn//'./Cache/Direct/Process/v2fly/cn.txt > ./Cache/Direct/Process/v2fly/domain-1.txt
sed -e 's/full://' ./Cache/Direct/Process/v2fly/domain-1.txt > ./Cache/Direct/Process/v2fly/domain-2.txt
sed -e '/#/d' ./Cache/Direct/Process/v2fly/domain-2.txt > ./Cache/Direct/Process/v2fly/domain-3.txt
sed -e '/regexp:/d' ./Cache/Direct/Process/v2fly/domain-3.txt > ./Cache/Direct/Process/v2fly/domain-4.txt
sort -u ./Cache/Direct/Process/v2fly/domain-4.txt > ./Cache/Direct/Process/v2fly/domain.txt
# regexp
grep "regexp:" ./Cache/Direct/Process/v2fly/cn.txt > ./Cache/Direct/Process/v2fly/regexp-1.txt
sed -e 's/ @cn//' ./Cache/Direct/Process/v2fly/regexp-1.txt > ./Cache/Direct/Process/v2fly/regexp-2.txt
sed -e 's/regexp://' ./Cache/Direct/Process/v2fly/regexp-2.txt > ./Cache/Direct/Process/v2fly/regexp.txt