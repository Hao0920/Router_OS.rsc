#### 获取 Scanners 列表 ###
# 中国科学技术大学
mkdir -p ./Scanners/Cache/Upstream/USTC
wget --no-check-certificate -c -O ./Scanners/Cache/Upstream/USTC/list.txt "https://blackip.ustc.edu.cn/list.php?txt"
wget --no-check-certificate -c -O ./Scanners/Cache/Upstream/USTC/dnsblackip.txt "https://blackip.ustc.edu.cn/dnsblackip.php?txt"
wget --no-check-certificate -c -O ./Scanners/Cache/Upstream/USTC/mailblackip.txt "https://blackip.ustc.edu.cn/mailblackip.php?txt"