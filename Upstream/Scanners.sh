#### 获取 Scanners 列表 ####
### 中国科学技术大学 ###
# IP黑名单
wget --no-check-certificate -c -O ./Cache/Scanners/Upstream/ustc-list.txt "https://blackip.ustc.edu.cn/list.php?txt"
# DNS客户黑名单
wget --no-check-certificate -c -O ./Cache/Scanners/Upstream/ustc-dnsblackip.txt "https://blackip.ustc.edu.cn/dnsblackip.php?txt"
# Mail客户黑名单
wget --no-check-certificate -c -O ./Cache/Scanners/Upstream/ustc-mailblackip.txt "https://blackip.ustc.edu.cn/mailblackip.php?txt"