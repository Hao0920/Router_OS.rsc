#### 获取上游数据 ####
# 中国科学技术大学
mkdir -p ./Cache/Scanners/Upstream/USTC
wget --no-check-certificate -c -O ./Cache/Scanners/Upstream/USTC/list.txt "https://blackip.ustc.edu.cn/list.php?txt"
wget --no-check-certificate -c -O ./Cache/Scanners/Upstream/USTC/dnsblackip.txt "https://blackip.ustc.edu.cn/dnsblackip.php?txt"
wget --no-check-certificate -c -O ./Cache/Scanners/Upstream/USTC/mailblackip.txt "https://blackip.ustc.edu.cn/mailblackip.php?txt"