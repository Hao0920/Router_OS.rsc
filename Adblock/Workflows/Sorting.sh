### 建立缓存 ### 
mkdir -p ./Adblock/Cache/Sorting
# find ./Adblock/Basic -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/source.txt
find ./Adblock/Cache/Upstream -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/adblock-1.txt
# cat  ./Adblock/Cache/Sorting/source.txt  ./Adblock/Cache/Sorting/upstream.txt >  ./Adblock/Cache/Sorting/adblock-1.txt
# 删除 非屏蔽
sed -e '/(livew.l.qq.com|t7z.cupid.iqiyi.com|wxsnsdy.wxs.qq.com|is.snssdk.com|adsmind.gdtimg.com|pv.sohu.com|gw.365you.com|x.adnet.qq.com|mi.gdt.qq.com|c.gdt.qq.com|d.gdt.qq.com|i.gdt.qq.com|m.gdt.qq.com|t.gdt.qq.com|v.gdt.qq.com|q.i.gdt.qq.com|v2.gdt.qq.com|ii.gdt.qq.com|rm.gdt.qq.com|nc.gdt.qq.com|vr.gdt.qq.com|rpt.gdt.qq.com|win.gdt.qq.com|ipv4.gdt.qq.com|v6ii.gdt.qq.com
)/d' ./Adblock/Cache/Sorting/adblock-1.txt > ./Adblock/Cache/Sorting/adblock-2.txt
# 删除注释行
sed -e '/^#/d' ./Adblock/Cache/Sorting/adblock-2.txt > ./Adblock/Cache/Sorting/adblock-3.txt
# 删除 include 行
sed -e '/^include:/d' ./Adblock/Cache/Sorting/adblock-3.txt > ./Adblock/Cache/Sorting/adblock-4.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Adblock/Cache/Sorting/adblock-4.txt > ./Adblock/Cache/Sorting/adblock-5.txt
# 删除 @ads
sed -e 's/ @ads//' ./Adblock/Cache/Sorting/adblock-5.txt > ./Adblock/Cache/Sorting/adblock-6.txt
# 删除 :@ads
sed -e 's/:@ads//' ./Adblock/Cache/Sorting/adblock-6.txt > ./Adblock/Cache/Sorting/adblock-7.txt
# 删除 full:
sed -e 's/full://' ./Adblock/Cache/Sorting/adblock-7.txt > ./Adblock/Cache/Sorting/adblock-8.txt
# 删除 domain:
sed -e 's/domain://' ./Adblock/Cache/Sorting/adblock-8.txt > ./Adblock/Cache/Sorting/adblock-9.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./Adblock/Cache/Sorting/adblock-9.txt > ./Adblock/Cache/Sorting/adblock-10.txt
# 删除 127.0.0.1
sed -e 's/127.0.0.1 //' ./Adblock/Cache/Sorting/adblock-10.txt > ./Adblock/Cache/Sorting/adblock-11.txt
# 删除空格行
sed -e '/^$/d' ./Adblock/Cache/Sorting/adblock-11.txt > ./Adblock/Cache/Sorting/adblock-12.txt
# 去重
sort -u ./Adblock/Cache/Sorting/adblock-12.txt > ./Adblock/Cache/Sorting/adblock.txt