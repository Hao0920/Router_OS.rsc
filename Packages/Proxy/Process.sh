#### 处理数据 ####
### Loyalsoldier/v2ray-rules-dat
mkdir -p ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat
find ./Cache/Proxy/Upstream/Loyalsoldier/v2ray-rules-dat -type f -name "*.txt" | xargs cat > ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat/proxy-list-1.txt
sed -e '/regexp:/d' ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat/proxy-list-1.txt > ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat/proxy-list-2.txt
sed -e 's/full://' ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat/proxy-list-2.txt > ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat/proxy-list-3.txt
sort -u ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat/proxy-list-3.txt > ./Cache/Proxy/Process/Loyalsoldier/v2ray-rules-dat/proxy-list.txt