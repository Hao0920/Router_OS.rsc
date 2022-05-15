#### 处理数据 ####
### Loyalsoldier/geoip
mkdir -p ./Cache/ISP/Process/Loyalsoldier
find ./Cache/ISP/Upstream/Loyalsoldier/geoip -type f -name "*.txt" | xargs cat > ./Cache/ISP/Process/Loyalsoldier/1.txt
# 删除 IPv6
sed -e '/:/d' ./Cache/ISP/Process/Loyalsoldier/1.txt > ./Cache/ISP/Process/Loyalsoldier/2.txt
# 删除空格行
sed -e '/^$/d' ./Cache/ISP/Process/Loyalsoldier/2.txt > ./Cache/ISP/Process/Loyalsoldier/geoip.txt

### Basic/geoip
mkdir -p ./Cache/ISP/Process/Basic
find ./Packages/ISP/Basic -type f -name "*.txt" | xargs cat > ./Cache/ISP/Process/Basic/1.txt
# 删除 #
sed -e '/#/d' ./Cache/ISP/Process/Basic/1.txt > ./Cache/ISP/Process/Basic/geoip.txt

{
    cat ./Cache/ISP/Process/Basic/geoip.txt
    cat ./Cache/ISP/Process/Loyalsoldier/geoip.txt
} > ./Cache/ISP/Process/Process-1.txt
sort -u ./Cache/ISP/Process/Process-1.txt > ./Cache/ISP/Process/Process.txt

