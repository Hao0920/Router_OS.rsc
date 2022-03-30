#### 处理数据 #### Origin
### NextDNS/metadata
mkdir -p ./Adblock/Cache/Process/NextDNS/
find ./Adblock/Cache/Upstream/NextDNS/metadata -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Process/NextDNS/1.txt
sed -e '/#/d' ./Adblock/Cache/Process/NextDNS/1.txt > ./Adblock/Cache/Process/NextDNS/2.txt
sed -e '/^$/d' ./Adblock/Cache/Process/NextDNS/2.txt > ./Adblock/Cache/Process/NextDNS/metadata.txt

### PingLin Li/ad-hosts
mkdir -p ./Adblock/Cache/Process/ilpl/ad-hosts
find ./Adblock/Cache/Upstream/ilpl/ad-hosts -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Process/ilpl/1.txt
sed -e '/#/d' ./Adblock/Cache/Process/ilpl/1.txt > ./Adblock/Cache/Process/ilpl/2.txt
sed -e 's/0.0.0.0 //' ./Adblock/Cache/Process/ilpl/2.txt > ./Adblock/Cache/Process/ilpl/ad-hosts.txt

### Loyalsoldier/domain-list-custom
mkdir -p ./Adblock/Cache/Process/Loyalsoldier/domain-list-custom
find ./Adblock/Cache/Upstream/Loyalsoldier/domain-list-custom -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Process/Loyalsoldier/1.txt
sed -e 's/domain://' ./Adblock/Cache/Process/Loyalsoldier/1.txt > ./Adblock/Cache/Process/Loyalsoldier/2.txt
sed -e '/regexp:/d' ./Adblock/Cache/Process/Loyalsoldier/2.txt > ./Adblock/Cache/Process/Loyalsoldier/3.txt
sed -e 's/:@ads//' ./Adblock/Cache/Process/Loyalsoldier/3.txt > ./Adblock/Cache/Process/Loyalsoldier/domain-list-custom.txt

### jdlingyu/ad-wars
mkdir -p ./Adblock/Cache/Process/jdlingyu/ad-wars
find ./Adblock/Cache/Upstream/jdlingyu/ad-wars -type f -name "*.txt" | xargs cat > ./Adblock/Cache/Process/jdlingyu/1.txt
sed -e '/localhost/d' ./Adblock/Cache/Process/jdlingyu/1.txt > ./Adblock/Cache/Process/jdlingyu/2.txt
sed -e '/#/d' ./Adblock/Cache/Process/jdlingyu/2.txt > ./Adblock/Cache/Process/jdlingyu/3.txt
sed -e 's/127.0.0.1 //' ./Adblock/Cache/Process/jdlingyu/3.txt > ./Adblock/Cache/Process/jdlingyu/ad-wars.txt


{
    cat ./Adblock/Cache/Process/NextDNS/metadata.txt
    cat ./Adblock/Cache/Process/ilpl/ad-hosts.txt
    cat ./Adblock/Cache/Process/Loyalsoldier/domain-list-custom.txt
    cat ./Adblock/Cache/Process/jdlingyu/ad-wars.txt
} > ./Adblock/Cache/Process/1.txt
sed -e '/livew.l.qq.com/d' ./Adblock/Cache/Process/1.txt > ./Adblock/Cache/Process/2.txt
sed -e '/t7z.cupid.iqiyi.com/d' ./Adblock/Cache/Process/2.txt > ./Adblock/Cache/Process/3.txt
sed -e '/wxsnsdy.wxs.qq.com/d' ./Adblock/Cache/Process/3.txt > ./Adblock/Cache/Process/4.txt
sed -e '/is.snssdk.com/d' ./Adblock/Cache/Process/4.txt > ./Adblock/Cache/Process/5.txt
sed -e '/adsmind.gdtimg.com/d' ./Adblock/Cache/Process/5.txt > ./Adblock/Cache/Process/6.txt
sed -e '/pv.sohu.com/d' ./Adblock/Cache/Process/6.txt > ./Adblock/Cache/Process/7.txt
sed -e '/gw.365you.com/d' ./Adblock/Cache/Process/7.txt > ./Adblock/Cache/Process/8.txt
sed -e '/x.adnet.qq.com/d' ./Adblock/Cache/Process/8.txt > ./Adblock/Cache/Process/9.txt
sed -e '/mi.gdt.qq.com/d' ./Adblock/Cache/Process/9.txt > ./Adblock/Cache/Process/10.txt
sed -e '/c.gdt.qq.com/d' ./Adblock/Cache/Process/10.txt > ./Adblock/Cache/Process/11.txt
sed -e '/d.gdt.qq.com/d' ./Adblock/Cache/Process/11.txt > ./Adblock/Cache/Process/12.txt
sed -e '/i.gdt.qq.com/d' ./Adblock/Cache/Process/12.txt > ./Adblock/Cache/Process/13.txt
sed -e '/m.gdt.qq.com/d' ./Adblock/Cache/Process/13.txt > ./Adblock/Cache/Process/14.txt
sed -e '/t.gdt.qq.com/d' ./Adblock/Cache/Process/14.txt > ./Adblock/Cache/Process/15.txt
sed -e '/v.gdt.qq.com/d' ./Adblock/Cache/Process/15.txt > ./Adblock/Cache/Process/16.txt
sed -e '/q.i.gdt.qq.com/d' ./Adblock/Cache/Process/16.txt > ./Adblock/Cache/Process/17.txt
sed -e '/v2.gdt.qq.com/d' ./Adblock/Cache/Process/17.txt > ./Adblock/Cache/Process/18.txt
sed -e '/ii.gdt.qq.com/d' ./Adblock/Cache/Process/18.txt > ./Adblock/Cache/Process/19.txt
sed -e '/rm.gdt.qq.com/d' ./Adblock/Cache/Process/19.txt > ./Adblock/Cache/Process/20.txt
sed -e '/nc.gdt.qq.com/d' ./Adblock/Cache/Process/20.txt > ./Adblock/Cache/Process/21.txt
sed -e '/vr.gdt.qq.com/d' ./Adblock/Cache/Process/21.txt > ./Adblock/Cache/Process/22.txt
sed -e '/rpt.gdt.qq.com/d' ./Adblock/Cache/Process/22.txt > ./Adblock/Cache/Process/23.txt
sed -e '/win.gdt.qq.com/d' ./Adblock/Cache/Process/23.txt > ./Adblock/Cache/Process/24.txt
sed -e '/ipv4.gdt.qq.com/d' ./Adblock/Cache/Process/24.txt > ./Adblock/Cache/Process/25.txt
sed -e '/v6ii.gdt.qq.com/d' ./Adblock/Cache/Process/25.txt > ./Adblock/Cache/Process/26.txt
sort -u ./Adblock/Cache/Process/26.txt > ./Adblock/Cache/Process/Origin.txt
