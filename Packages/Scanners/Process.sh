#### 处理数据 ####
# 中国科学技术大学
mkdir -p ./Cache/Scanners/Process/USTC
find ./Cache/Scanners/Upstream/USTC -type f -name "*.txt" | xargs cat > ./Cache/Scanners/Process/USTC/Scanners.txt
sed -e '/:/d' ./Cache/Scanners/Process/USTC/Scanners.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv4-1.txt
sed -e '/^#.*/d' ./Cache/Scanners/Process/USTC/Scanners-IPv4-1.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv4-2.txt
sort -u ./Cache/Scanners/Process/USTC/Scanners-IPv4-2.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv4.txt

grep --regexp='^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$' ./Cache/Scanners/Process/USTC/Scanners.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv6-1.txt
sed -e '/^#.*/d' ./Cache/Scanners/Process/USTC/Scanners-IPv6-1.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv6-2.txt
sort -u ./Cache/Scanners/Process/USTC/Scanners-IPv6-2.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv6.txt