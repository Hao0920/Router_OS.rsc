#### 处理数据 ####
# 中国科学技术大学
mkdir -p ./Cache/Scanners/Process/USTC
find ./Cache/Scanners/Upstream/USTC -type f -name "*.txt" | xargs cat > ./Cache/Scanners/Process/USTC/1.txt
sed -e '/:/d' ./Cache/Scanners/Process/USTC/1.txt > ./Cache/Scanners/Process/USTC/2.txt
sed -e '/^#.*/d' ./Cache/Scanners/Process/USTC/2.txt > ./Cache/Scanners/Process/USTC/scanners.txt