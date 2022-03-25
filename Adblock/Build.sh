### 建立缓存 ### 
mkdir -p ./Adblock/Cache/Build/

### 整理 ###
# find ./Adblock/Source -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Build/source.txt
find ./Adblock/Cache/Upstream -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Build/upstream.txt
# cat  ./Adblock/Cache/Build/source.txt  ./Adblock/Cache/Build/upstream.txt >  ./Adblock/Cache/Build/adblock-1.txt
# 删除注释行
sed -e '/^#/d' ./Adblock/Cache/Build/upstream.txt > ./Adblock/Cache/Build/adblock-2.txt
# 删除 include 行
sed -e '/^include:/d' ./Adblock/Cache/Build/adblock-2.txt > ./Adblock/Cache/Build/adblock-3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Adblock/Cache/Build/adblock-3.txt > ./Adblock/Cache/Build/adblock-4.txt
# 删除 @ads
sed -e 's/ @ads//' ./Adblock/Cache/Build/adblock-4.txt > ./Adblock/Cache/Build/adblock-5.txt
# 删除 :@ads
sed -e 's/:@ads//' ./Adblock/Cache/Build/adblock-5.txt > ./Adblock/Cache/Build/adblock-6.txt
# 删除 full:
sed -e 's/full://' ./Adblock/Cache/Build/adblock-6.txt > ./Adblock/Cache/Build/adblock-7.txt
# 删除 domain:
sed -e 's/domain://' ./Adblock/Cache/Build/adblock-7.txt > ./Adblock/Cache/Build/adblock-8.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./Adblock/Cache/Build/adblock-8.txt > ./Adblock/Cache/Build/adblock-9.txt
# 删除 127.0.0.1
sed -e 's/127.0.0.1 //' ./Adblock/Cache/Build/adblock-9.txt > ./Adblock/Cache/Build/adblock-10.txt
# 删除 非屏蔽
sed -e 's/livew.l.qq.com//' ./Adblock/Cache/Build/adblock-10.txt > ./Adblock/Cache/Build/adblock-11.txt
sed -e 's/t7z.cupid.iqiyi.com//' ./Adblock/Cache/Build/adblock-11.txt > ./Adblock/Cache/Build/adblock-12.txt
sed -e 's/wxsnsdy.wxs.qq.com//' ./Adblock/Cache/Build/adblock-12.txt > ./Adblock/Cache/Build/adblock-13.txt
sed -e 's/is.snssdk.com//' ./Adblock/Cache/Build/adblock-13.txt > ./Adblock/Cache/Build/adblock-14.txt
sed -e 's/adsmind.gdtimg.com//' ./Adblock/Cache/Build/adblock-14.txt > ./Adblock/Cache/Build/adblock-15.txt
sed -e 's/pv.sohu.com//' ./Adblock/Cache/Build/adblock-15.txt > ./Adblock/Cache/Build/adblock-16.txt
sed -e 's/gw.365you.com//' ./Adblock/Cache/Build/adblock-16.txt > ./Adblock/Cache/Build/adblock-17.txt
sed -e 's/x.adnet.qq.com//' ./Adblock/Cache/Build/adblock-17.txt > ./Adblock/Cache/Build/adblock-18.txt
sed -e 's/mi.gdt.qq.com//' ./Adblock/Cache/Build/adblock-18.txt > ./Adblock/Cache/Build/adblock-19.txt
sed -e 's/c.gdt.qq.com//' ./Adblock/Cache/Build/adblock-19.txt > ./Adblock/Cache/Build/adblock-20.txt
sed -e 's/d.gdt.qq.com//' ./Adblock/Cache/Build/adblock-20.txt > ./Adblock/Cache/Build/adblock-21.txt
sed -e 's/i.gdt.qq.com//' ./Adblock/Cache/Build/adblock-21.txt > ./Adblock/Cache/Build/adblock-22.txt
sed -e 's/m.gdt.qq.com//' ./Adblock/Cache/Build/adblock-22.txt > ./Adblock/Cache/Build/adblock-23.txt
sed -e 's/t.gdt.qq.com//' ./Adblock/Cache/Build/adblock-23.txt > ./Adblock/Cache/Build/adblock-24.txt
sed -e 's/v.gdt.qq.com//' ./Adblock/Cache/Build/adblock-24.txt > ./Adblock/Cache/Build/adblock-25.txt
sed -e 's/q.i.gdt.qq.com//' ./Adblock/Cache/Build/adblock-25.txt > ./Adblock/Cache/Build/adblock-26.txt
sed -e 's/v2.gdt.qq.com//' ./Adblock/Cache/Build/adblock-26.txt > ./Adblock/Cache/Build/adblock-27.txt
sed -e 's/ii.gdt.qq.com//' ./Adblock/Cache/Build/adblock-27.txt > ./Adblock/Cache/Build/adblock-28.txt
sed -e 's/rm.gdt.qq.com//' ./Adblock/Cache/Build/adblock-28.txt > ./Adblock/Cache/Build/adblock-29.txt
sed -e 's/nc.gdt.qq.com//' ./Adblock/Cache/Build/adblock-29.txt > ./Adblock/Cache/Build/adblock-30.txt
sed -e 's/vr.gdt.qq.com//' ./Adblock/Cache/Build/adblock-30.txt > ./Adblock/Cache/Build/adblock-31.txt
sed -e 's/rpt.gdt.qq.com//' ./Adblock/Cache/Build/adblock-31.txt > ./Adblock/Cache/Build/adblock-32.txt
sed -e 's/win.gdt.qq.com//' ./Adblock/Cache/Build/adblock-32.txt > ./Adblock/Cache/Build/adblock-33.txt
sed -e 's/ipv4.gdt.qq.com//' ./Adblock/Cache/Build/adblock-33.txt > ./Adblock/Cache/Build/adblock-34.txt
sed -e 's/v6ii.gdt.qq.com//' ./Adblock/Cache/Build/adblock-34.txt > ./Adblock/Cache/Build/adblock-35.txt
# 删除空格行
sed -e '/^$/d' ./Adblock/Cache/Build/adblock-35.txt > ./Adblock/Cache/Build/adblock-36.txt
# 去重
sort -u ./Adblock/Cache/Build/adblock-36.txt > ./Adblock/Cache/Build/adblock.txt

### 构建 ###
{
echo "/ip dns static"
echo "remove [find address=240.0.0.1]"
for name in $(cat ./Adblock/Cache/Build/adblock.txt) ; do
  echo "add address=240.0.0.1 name=$name"
done
echo "/file remove Adblock.rsc"
} > ./Adblock/Adblock.rsc

### 清除缓存 ###
# rm -rf ./Adblock/Cache