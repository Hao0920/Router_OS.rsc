#### 建立缓存 #### 
mkdir -p ./Adblock/Cache/Sorting
### NextDNS/metadata
find ./Adblock/Cache/Upstream/NextDNS/metadata -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/NextDNS-source.txt
### PingLin Li/ad-hosts
find ./Adblock/Cache/Upstream/ilpl/ad-hosts/ -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/ilpl-source.txt
### Loyalsoldier/domain-list-custom
find ./Adblock/Cache/Upstream/Loyalsoldier/domain-list-custom/ -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/Loyalsoldier-source.txt
### jdlingyu/ad-wars
find ./Adblock/Cache/Upstream/jdlingyu/ad-wars/ -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/jdlingyu-source.txt


#### 整理 ####
### NextDNS/metadata
# 删除注释行
sed -e '/^#/d' ./Adblock/Cache/Sorting/NextDNS-source.txt > ./Adblock/Cache/Sorting/Upstream-1.txt

### PingLin Li/ad-hosts
# 删除注释行
sed -e '/^#/d' ./Adblock/Cache/Sorting/ilpl-source.txt > ./Adblock/Cache/Sorting/ilpl-1.txt
# 删除 ^0.0.0.0 
sed -e 's/^0.0.0.0 //' ./Adblock/Cache/Sorting/ilpl-1.txt > ./Adblock/Cache/Sorting/Upstream-2.txt

### Loyalsoldier/domain-list-custom
# 删除 regexp 行
sed -e '/^regexp:/d' ./Adblock/Cache/Sorting/Loyalsoldier-source.txt > ./Adblock/Cache/Sorting/Loyalsoldier-1.txt
# 删除 :@ads$,^domain:,^full:
sed -e 's/:@ads$/,/^domain:/,/^full://' ./Adblock/Cache/Sorting/Loyalsoldier-1.txt > ./Adblock/Cache/Sorting/Upstream-3.txt

### jdlingyu/ad-wars
# 删除注释|localhost$行
sed -e '/^#|localhost$/d' ./Adblock/Cache/Sorting/jdlingyu-source.txt > ./Adblock/Cache/Sorting/jdlingyu-1.txt
# 删除 127.0.0.1 
sed -e 's/^127.0.0.1 //' ./Adblock/Cache/Sorting/jdlingyu-1.txt > ./Adblock/Cache/Sorting/Upstream-4.txt

#### 合并 ####
cat ./Adblock/Cache/Sorting/Upstream-1.txt \
    ./Adblock/Cache/Sorting/Upstream-2.txt \
    ./Adblock/Cache/Sorting/Upstream-3.txt \
    ./Adblock/Cache/Sorting/Upstream-4.txt > ./Adblock/Cache/Sorting/Upstream-5.txt
# 删除 非屏蔽
sed -e '/livew.l.qq.com|t7z.cupid.iqiyi.com|wxsnsdy.wxs.qq.com|is.snssdk.com|adsmind.gdtimg.com|pv.sohu.com|gw.365you.com|x.adnet.qq.com|mi.gdt.qq.com|c.gdt.qq.com|d.gdt.qq.com|i.gdt.qq.com|m.gdt.qq.com|t.gdt.qq.com|v.gdt.qq.com|q.i.gdt.qq.com|v2.gdt.qq.com|ii.gdt.qq.com|rm.gdt.qq.com|nc.gdt.qq.com|vr.gdt.qq.com|rpt.gdt.qq.com|win.gdt.qq.com|ipv4.gdt.qq.com|v6ii.gdt.qq.com/d' ./Adblock/Cache/Sorting/Upstream-5.txt > ./Adblock/Cache/Sorting/Upstream-6.txt
# 删除空格行
sed -e '/^$/d' ./Adblock/Cache/Sorting/Upstream-6.txt > ./Adblock/Cache/Sorting/Upstream-7.txt
# 去重
sort -u ./Adblock/Cache/Sorting/Upstream-7.txt > ./Adblock/Cache/Sorting/adblock.txt
