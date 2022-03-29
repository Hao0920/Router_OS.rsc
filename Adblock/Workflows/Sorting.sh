#### 建立缓存 #### 
mkdir -p ./Adblock/Cache/Sorting
find ./Adblock/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/Upstream-source.txt

#### 整理 ####
sed s/^0.0.0.0 //g \
| sed s/:@ads$//g \
| sed s/^domain://g \
| sed s/^full://g \
| sed s/^127.0.0.1 //g \
| sed s/livew.l.qq.com//g \ 
| sed s/t7z.cupid.iqiyi.com//g \ 
| sed s/wxsnsdy.wxs.qq.com//g \ 
| sed s/is.snssdk.com//g \ 
| sed s/adsmind.gdtimg.com//g \ 
| sed s/pv.sohu.com//g \ 
| sed s/gw.365you.com//g \ 
| sed s/x.adnet.qq.com//g \ 
| sed s/mi.gdt.qq.com//g \ 
| sed s/c.gdt.qq.com//g \ 
| sed s/d.gdt.qq.com//g \ 
| sed s/i.gdt.qq.com//g \ 
| sed s/m.gdt.qq.com//g \ 
| sed s/t.gdt.qq.com//g \ 
| sed s/v.gdt.qq.com//g \ 
| sed s/q.i.gdt.qq.com//g \ 
| sed s/v2.gdt.qq.com//g \ 
| sed s/ii.gdt.qq.com//g \ 
| sed s/rm.gdt.qq.com//g \ 
| sed s/nc.gdt.qq.com//g \ 
| sed s/vr.gdt.qq.com//g \ 
| sed s/rpt.gdt.qq.com//g \ 
| sed s/win.gdt.qq.com//g \ 
| sed s/ipv4.gdt.qq.com//g \ 
| sed s/v6ii.gdt.qq.com//g \ 
| sed /^#/d \ 
| sed -e /^regexp:/d \ 
| sed -e /localhost$/d \ 
| sed -e /^$/d ./Adblock/Cache/Sorting/Upstream-source.txt > ./Adblock/Cache/Sorting/Upstream-sorting.txt