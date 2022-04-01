#### 处理数据 ####
# 中国科学技术大学
mkdir -p ./Scanners/Cache/Process/USTC
find ./Scanners/Cache/Upstream/USTC -type f -name "*.txt" | xargs cat > ./Scanners/Cache/Process/USTC/1.txt
sed -e '/:/d' ./Scanners/Cache/Process/USTC/1.txt > ./Scanners/Cache/Process/USTC/2.txt
sed -e '/^#.*/d' ./Scanners/Cache/Process/USTC/2.txt > ./Scanners/Cache/Process/USTC/scanners.txt