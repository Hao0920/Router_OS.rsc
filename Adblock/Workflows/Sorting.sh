#### 建立缓存 #### 
mkdir -p ./Adblock/Cache/Sorting
find ./Adblock/Cache/Upstream/ -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Sorting/Upstream-source-1.txt

#### 整理 ####
sed -e 's/0.0.0.0 //' ./Adblock/Cache/Sorting/Upstream-source-1.txt > ./Adblock/Cache/Sorting/Upstream-source-2.txt
sed -e 's/:@ads//' ./Adblock/Cache/Sorting/Upstream-source-2.txt > ./Adblock/Cache/Sorting/Upstream-source-3.txt
sed -e 's/domain://' ./Adblock/Cache/Sorting/Upstream-source-3.txt > ./Adblock/Cache/Sorting/Upstream-source-4.txt
sed -e 's/full://' ./Adblock/Cache/Sorting/Upstream-source-4.txt > ./Adblock/Cache/Sorting/Upstream-source-5.txt
sed -e 's/127.0.0.1 //' ./Adblock/Cache/Sorting/Upstream-source-5.txt > ./Adblock/Cache/Sorting/Upstream-source-6.txt
sed -e 's/livew.l.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-6.txt > ./Adblock/Cache/Sorting/Upstream-source-7.txt
sed -e 's/t7z.cupid.iqiyi.com//' ./Adblock/Cache/Sorting/Upstream-source-7.txt > ./Adblock/Cache/Sorting/Upstream-source-8.txt
sed -e 's/wxsnsdy.wxs.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-8.txt > ./Adblock/Cache/Sorting/Upstream-source-9.txt
sed -e 's/is.snssdk.com//' ./Adblock/Cache/Sorting/Upstream-source-9.txt > ./Adblock/Cache/Sorting/Upstream-source-10.txt
sed -e 's/adsmind.gdtimg.com//' ./Adblock/Cache/Sorting/Upstream-source-10.txt > ./Adblock/Cache/Sorting/Upstream-source-11.txt
sed -e 's/pv.sohu.com//' ./Adblock/Cache/Sorting/Upstream-source-11.txt > ./Adblock/Cache/Sorting/Upstream-source-12.txt
sed -e 's/gw.365you.com//' ./Adblock/Cache/Sorting/Upstream-source-12.txt > ./Adblock/Cache/Sorting/Upstream-source-13.txt
sed -e 's/x.adnet.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-13.txt > ./Adblock/Cache/Sorting/Upstream-source-14.txt
sed -e 's/mi.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-14.txt > ./Adblock/Cache/Sorting/Upstream-source-15.txt
sed -e 's/c.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-15.txt > ./Adblock/Cache/Sorting/Upstream-source-16.txt
sed -e 's/d.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-16.txt > ./Adblock/Cache/Sorting/Upstream-source-17.txt
sed -e 's/i.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-17.txt > ./Adblock/Cache/Sorting/Upstream-source-18.txt
sed -e 's/m.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-18.txt > ./Adblock/Cache/Sorting/Upstream-source-19.txt
sed -e 's/t.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-19.txt > ./Adblock/Cache/Sorting/Upstream-source-20.txt
sed -e 's/v.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-20.txt > ./Adblock/Cache/Sorting/Upstream-source-21.txt
sed -e 's/q.i.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-21.txt > ./Adblock/Cache/Sorting/Upstream-source-22.txt
sed -e 's/v2.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-22.txt > ./Adblock/Cache/Sorting/Upstream-source-23.txt
sed -e 's/ii.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-23.txt > ./Adblock/Cache/Sorting/Upstream-source-24.txt
sed -e 's/rm.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-24.txt > ./Adblock/Cache/Sorting/Upstream-source-25.txt
sed -e 's/nc.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-25.txt > ./Adblock/Cache/Sorting/Upstream-source-26.txt
sed -e 's/vr.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-26.txt > ./Adblock/Cache/Sorting/Upstream-source-27.txt
sed -e 's/rpt.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-27.txt > ./Adblock/Cache/Sorting/Upstream-source-28.txt
sed -e 's/win.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-28.txt > ./Adblock/Cache/Sorting/Upstream-source-29.txt
sed -e 's/ipv4.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-29.txt > ./Adblock/Cache/Sorting/Upstream-source-30.txt
sed -e 's/v6ii.gdt.qq.com//' ./Adblock/Cache/Sorting/Upstream-source-30.txt > ./Adblock/Cache/Sorting/Upstream-source-31.txt
sed -e '/regexp:/d' ./Adblock/Cache/Sorting/Upstream-source-31.txt > ./Adblock/Cache/Sorting/Upstream-source-32.txt 
sed -e '/localhost/d' ./Adblock/Cache/Sorting/Upstream-source-32.txt > ./Adblock/Cache/Sorting/Upstream-source-33.txt 
sed -e '/#/d' ./Adblock/Cache/Sorting/Upstream-source-33.txt > ./Adblock/Cache/Sorting/Upstream-source-34.txt 
sed -e '/^$/d' ./Adblock/Cache/Sorting/Upstream-source-34.txt > ./Adblock/Cache/Sorting/Upstream-source-35.txt 
sort -u ./Adblock/Cache/Sorting/Upstream-source-35.txt > ./Adblock/Cache/Sorting/adblock.txt