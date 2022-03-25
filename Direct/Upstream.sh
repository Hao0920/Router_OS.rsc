### 建立缓存 ### 
mkdir -p ./Direct/Cache/Upstream/
#### 获取 Direct 列表 ###
# domain-list-custom
wget --no-check-certificate -c -O ./Direct/Cache/Upstream/geolocation-cn.txt "https://raw.githubusercontent.com/Loyalsoldier/domain-list-custom/release/geolocation-cn.txt"
