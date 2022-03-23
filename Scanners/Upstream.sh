### 建立缓存 ###
mkdir -p ./Scanners/Cache/Upstream/

#### 获取 Scanners 列表 ###
# 中国科学技术大学
wget --no-check-certificate -c -O ./Scanners/Cache/Upstream/ustc-list.txt "https://blackip.ustc.edu.cn/list.php?txt"