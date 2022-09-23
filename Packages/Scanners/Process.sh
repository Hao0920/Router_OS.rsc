#### 处理数据 ####
# 中国科学技术大学
mkdir -p ./Cache/Scanners/Process/USTC
find ./Cache/Scanners/Upstream/USTC -type f -name "*.txt" | xargs cat > ./Cache/Scanners/Process/USTC/Scanners.txt
sed -e '/:/d' ./Cache/Scanners/Process/USTC/Scanners.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv4-1.txt
sed -e '/^#.*/d' ./Cache/Scanners/Process/USTC/Scanners-IPv4-1.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv4-2.txt
sort -u ./Cache/Scanners/Process/USTC/Scanners-IPv4-2.txt > ./Cache/Scanners/Process/USTC/Scanners-IPv4.txt