#### 处理数据 ####
### Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Direct/Process/Loyalsoldier
find ./Cache/Direct/Upstream/Loyalsoldier/ -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Loyalsoldier/1.txt
# 删除 full:
sed -e 's/full://' ./Cache/Direct/Process/Loyalsoldier/1.txt > ./Cache/Direct/Process/Loyalsoldier/2.txt
# 删除regexp
sed -e '/regexp:/d' ./Cache/Direct/Process/Loyalsoldier/2.txt > ./Cache/Direct/Process/Loyalsoldier/v2ray-rules-dat.txt