#### 建立缓存 #### 
mkdir -p ./Adblock/Cache/Sorting
find ./Adblock/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/Upstream-source.txt

#### 整理 ####
sed -e 's/^0.0.0.0 //' \
| sed -e 's/:@ads$//' \
| sed -e 's/^domain://' \
| sed -e 's/^full://' \
| sed -e 's/^127.0.0.1 //' \
| sed -e 's/livew.l.qq.com//' \ 
| sed -e 's/t7z.cupid.iqiyi.com//' \ 
| sed -e 's/wxsnsdy.wxs.qq.com//' \ 
| sed -e 's/is.snssdk.com//' \ 
| sed -e 's/adsmind.gdtimg.com//' \ 
| sed -e 's/pv.sohu.com//' \ 
| sed -e 's/gw.365you.com//' \ 
| sed -e 's/x.adnet.qq.com//' \ 
| sed -e 's/mi.gdt.qq.com//' \ 
| sed -e 's/c.gdt.qq.com//' \ 
| sed -e 's/d.gdt.qq.com//' \ 
| sed -e 's/i.gdt.qq.com//' \ 
| sed -e 's/m.gdt.qq.com//' \ 
| sed -e 's/t.gdt.qq.com//' \ 
| sed -e 's/v.gdt.qq.com//' \ 
| sed -e 's/q.i.gdt.qq.com//' \ 
| sed -e 's/v2.gdt.qq.com//' \ 
| sed -e 's/ii.gdt.qq.com//' \ 
| sed -e 's/rm.gdt.qq.com//' \ 
| sed -e 's/nc.gdt.qq.com//' \ 
| sed -e 's/vr.gdt.qq.com//' \ 
| sed -e 's/rpt.gdt.qq.com//' \ 
| sed -e 's/win.gdt.qq.com//' \ 
| sed -e 's/ipv4.gdt.qq.com//' \ 
| sed -e 's/v6ii.gdt.qq.com//' \ 
| sed -e '/^#/d' \ 
| sed -e '/^regexp:/d' \ 
| sed -e '/^#|localhost$/d' \ 
| sed -e '/^$/d' ./Adblock/Cache/Sorting/Upstream-source.txt > ./Adblock/Cache/Sorting/Upstream-sorting.txt