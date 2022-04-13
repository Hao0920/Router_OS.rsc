#### 处理数据 ####
### Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat
find ./Cache/Direct/Upstream/Loyalsoldier/v2ray-rules-dat -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat/1.txt
# 删除 full:
sed -e 's/full://' ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat/1.txt > ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat.txt

### v2fly/domain-list-community
mkdir -p ./Cache/Direct/Process/v2fly/domain-list-community
find ./Cache/Direct/Upstream/v2fly/domain-list-community -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/v2fly/domain-list-community/1.txt
grep "@cn" ./Cache/Direct/Process/v2fly/domain-list-community/1.txt > ./Cache/Direct/Process/v2fly/domain-list-community/2.txt