#### 建立缓存 #### 
mkdir -p ./Adblock/Cache/Sorting
find ./Adblock/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/Upstream-source.txt

#### 整理 ####
sed -e 's/^0.0.0.0 //' | \
sed -e 's/:@ads$//' | \
sed -e 's/^domain://' | \
sed -e 's/^full://' | \
sed -e 's/^127.0.0.1 //'
sed -e '/livew.l.qq.com/d' | \ 
sed -e '/t7z.cupid.iqiyi.com/d' | \ 
sed -e '/wxsnsdy.wxs.qq.com/d' | \ 
sed -e '/is.snssdk.com/d' | \ 
sed -e '/adsmind.gdtimg.com/d' | \ 
sed -e '/pv.sohu.com/d' | \ 
sed -e '/gw.365you.com/d' | \ 
sed -e '/x.adnet.qq.com/d' | \ 
sed -e '/mi.gdt.qq.com/d' | \ 
sed -e '/c.gdt.qq.com/d' | \ 
sed -e '/d.gdt.qq.com/d' | \ 
sed -e '/i.gdt.qq.com/d' | \ 
sed -e '/m.gdt.qq.com/d' | \ 
sed -e '/t.gdt.qq.com/d' | \ 
sed -e '/v.gdt.qq.com/d' | \ 
sed -e '/q.i.gdt.qq.com/d' | \ 
sed -e '/v2.gdt.qq.com/d' | \ 
sed -e '/ii.gdt.qq.com/d' | \ 
sed -e '/rm.gdt.qq.com/d' | \ 
sed -e '/nc.gdt.qq.com/d' | \ 
sed -e '/vr.gdt.qq.com/d' | \ 
sed -e '/rpt.gdt.qq.com/d' | \ 
sed -e '/win.gdt.qq.com/d' | \ 
sed -e '/ipv4.gdt.qq.com/d' | \ 
sed -e '/v6ii.gdt.qq.com/d' | \ 
sed -e '/^#/d' | \ 
sed -e '/^regexp:/d' | \ 
sed -e '/^#|localhost$/d' | \ 
sed -e '/^$/d' | \ 
./Adblock/Cache/Sorting/Upstream-source.txt > ./Adblock/Cache/Sorting/Upstream-sorting.txt