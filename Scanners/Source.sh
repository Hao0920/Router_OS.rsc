### 建立缓存 ### 
mkdir -p ./Scanners/Cache/Source/
#### 获取 Scanners 列表 ###
DATE="$(echo $(date +%Y%m%d%H%M%S))"
# 东北大学网络中心
wget --no-check-certificate -c -O ./Scanners/Cache/Source/$DATE.txt "http://antivirus.neu.edu.cn/ssh/lists/neu.txt"