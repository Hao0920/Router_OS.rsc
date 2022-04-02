#### 处理数据 ####
### NextDNS/metadata
mkdir -p ./Cache/Adblock/Process/NextDNS/
find ./Cache/Adblock/Upstream/NextDNS/metadata -type f -name "*.txt" | xargs cat > ./Cache/Adblock/Process/NextDNS/1.txt
sed -e '/#/d' ./Cache/Adblock/Process/NextDNS/1.txt > ./Cache/Adblock/Process/NextDNS/2.txt
sed -e '/^$/d' ./Cache/Adblock/Process/NextDNS/2.txt > ./Cache/Adblock/Process/NextDNS/metadata.txt

### PingLin Li/ad-hosts
mkdir -p ./Cache/Adblock/Process/ilpl
find ./Cache/Adblock/Upstream/ilpl/ad-hosts -type f -name "*.txt" | xargs cat > ./Cache/Adblock/Process/ilpl/1.txt
sed -e '/#/d' ./Cache/Adblock/Process/ilpl/1.txt > ./Cache/Adblock/Process/ilpl/2.txt
sed -e 's/0.0.0.0 //' ./Cache/Adblock/Process/ilpl/2.txt > ./Cache/Adblock/Process/ilpl/ad-hosts.txt

### Loyalsoldier/domain-list-custom
mkdir -p ./Cache/Adblock/Process/Loyalsoldier
find ./Cache/Adblock/Upstream/Loyalsoldier/domain-list-custom -type f -name "*.txt" | xargs cat > ./Cache/Adblock/Process/Loyalsoldier/1.txt
grep "domain:" ./Cache/Adblock/Process/Loyalsoldier/1.txt > ./Cache/Adblock/Process/Loyalsoldier/2.txt
sed -e 's/domain://' ./Cache/Adblock/Process/Loyalsoldier/2.txt > ./Cache/Adblock/Process/Loyalsoldier/3.txt
sed -e 's/:@ads//' ./Cache/Adblock/Process/Loyalsoldier/3.txt > ./Cache/Adblock/Process/Loyalsoldier/domain-list-custom.txt

### jdlingyu/ad-wars
mkdir -p ./Cache/Adblock/Process/jdlingyu
find ./Cache/Adblock/Upstream/jdlingyu/ad-wars -type f -name "*.txt" | xargs cat > ./Cache/Adblock/Process/jdlingyu/1.txt
grep "127.0.0.1 " ./Cache/Adblock/Process/jdlingyu/1.txt > ./Cache/Adblock/Process/jdlingyu/2.txt
sed -e '/localhost/d' ./Cache/Adblock/Process/jdlingyu/2.txt > ./Cache/Adblock/Process/jdlingyu/3.txt
sed -e 's/127.0.0.1 //' ./Cache/Adblock/Process/jdlingyu/3.txt > ./Cache/Adblock/Process/jdlingyu/ad-wars.txt


{
    cat ./Cache/Adblock/Process/NextDNS/metadata.txt
    cat ./Cache/Adblock/Process/ilpl/ad-hosts.txt
    cat ./Cache/Adblock/Process/Loyalsoldier/domain-list-custom.txt
    cat ./Cache/Adblock/Process/jdlingyu/ad-wars.txt
} > ./Cache/Adblock/Process/1.txt
sed -e '/livew.l.qq.com/d' ./Cache/Adblock/Process/1.txt > ./Cache/Adblock/Process/2.txt
sed -e '/t7z.cupid.iqiyi.com/d' ./Cache/Adblock/Process/2.txt > ./Cache/Adblock/Process/3.txt
sed -e '/wxsnsdy.wxs.qq.com/d' ./Cache/Adblock/Process/3.txt > ./Cache/Adblock/Process/4.txt
sed -e '/is.snssdk.com/d' ./Cache/Adblock/Process/4.txt > ./Cache/Adblock/Process/5.txt
sed -e '/adsmind.gdtimg.com/d' ./Cache/Adblock/Process/5.txt > ./Cache/Adblock/Process/6.txt
sed -e '/pv.sohu.com/d' ./Cache/Adblock/Process/6.txt > ./Cache/Adblock/Process/7.txt
sed -e '/gw.365you.com/d' ./Cache/Adblock/Process/7.txt > ./Cache/Adblock/Process/8.txt
sed -e '/x.adnet.qq.com/d' ./Cache/Adblock/Process/8.txt > ./Cache/Adblock/Process/9.txt
sed -e '/mi.gdt.qq.com/d' ./Cache/Adblock/Process/9.txt > ./Cache/Adblock/Process/10.txt
sed -e '/c.gdt.qq.com/d' ./Cache/Adblock/Process/10.txt > ./Cache/Adblock/Process/11.txt
sed -e '/d.gdt.qq.com/d' ./Cache/Adblock/Process/11.txt > ./Cache/Adblock/Process/12.txt
sed -e '/i.gdt.qq.com/d' ./Cache/Adblock/Process/12.txt > ./Cache/Adblock/Process/13.txt
sed -e '/m.gdt.qq.com/d' ./Cache/Adblock/Process/13.txt > ./Cache/Adblock/Process/14.txt
sed -e '/t.gdt.qq.com/d' ./Cache/Adblock/Process/14.txt > ./Cache/Adblock/Process/15.txt
sed -e '/v.gdt.qq.com/d' ./Cache/Adblock/Process/15.txt > ./Cache/Adblock/Process/16.txt
sed -e '/q.i.gdt.qq.com/d' ./Cache/Adblock/Process/16.txt > ./Cache/Adblock/Process/17.txt
sed -e '/v2.gdt.qq.com/d' ./Cache/Adblock/Process/17.txt > ./Cache/Adblock/Process/18.txt
sed -e '/ii.gdt.qq.com/d' ./Cache/Adblock/Process/18.txt > ./Cache/Adblock/Process/19.txt
sed -e '/rm.gdt.qq.com/d' ./Cache/Adblock/Process/19.txt > ./Cache/Adblock/Process/20.txt
sed -e '/nc.gdt.qq.com/d' ./Cache/Adblock/Process/20.txt > ./Cache/Adblock/Process/21.txt
sed -e '/vr.gdt.qq.com/d' ./Cache/Adblock/Process/21.txt > ./Cache/Adblock/Process/22.txt
sed -e '/rpt.gdt.qq.com/d' ./Cache/Adblock/Process/22.txt > ./Cache/Adblock/Process/23.txt
sed -e '/win.gdt.qq.com/d' ./Cache/Adblock/Process/23.txt > ./Cache/Adblock/Process/24.txt
sed -e '/ipv4.gdt.qq.com/d' ./Cache/Adblock/Process/24.txt > ./Cache/Adblock/Process/25.txt
sed -e '/v6ii.gdt.qq.com/d' ./Cache/Adblock/Process/25.txt > ./Cache/Adblock/Process/26.txt
sort -u ./Cache/Adblock/Process/26.txt > ./Cache/Adblock/Process/Origin.txt
