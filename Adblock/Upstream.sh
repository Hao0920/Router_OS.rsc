### 建立缓存 ### 
mkdir -p ./Adblock/Cache/Upstream/
#### 获取 DNS Static 列表 ###
# alexa
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/alexa.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa"
# apple
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/apple.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple"
# huawei
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/huawei.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/huawei"
# roku
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/roku.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/roku"
# samsung
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/samsung.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/samsung"
# sonos
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/sonos.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/sonos"
# windows
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/windows.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows"
# xiaomi
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/xiaomi.txt "https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/xiaomi"
# category-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/category-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/category-ads"
# category-ads-all
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/category-ads-all.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/category-ads-all"
# acfun-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/acfun-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/acfun-ads"
# adcolony-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/adcolony-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/adcolony-ads"
# adjust-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/adjust-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/adjust-ads"
# alibaba-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/alibaba-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/alibaba-ads"
# amazon-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/amazon-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/amazon-ads"
# apple-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/apple-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/apple-ads"
# applovin-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/applovin-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/applovin-ads"
# atom-data-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/atom-data-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/atom-data-ads"
# baidu-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/baidu-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/baidu-ads"
# bytedance-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/bytedance-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/bytedance-ads"
# clearbitjs-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/clearbitjs-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/clearbitjs-ads"
# dmm-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/dmm-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/dmm-ads"
# emogi-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/emogi-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/emogi-ads"
# flurry-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/flurry-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/flurry-ads"
# google-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/google-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/google-ads"
# growingio-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/growingio-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/growingio-ads"
# hiido-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/hiido-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/hiido-ads"
# hotjar-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/hotjar-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/hotjar-ads"
# hunantv-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/hunantv-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/hunantv-ads"
# inner-active-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/inner-active-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/inner-active-ads"
# iqiyi-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/iqiyi-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/iqiyi-ads"
# jd-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/jd-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/jd-ads"
# kuaishou-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/kuaishou-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/kuaishou-ads"
# leanplum-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/leanplum-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/leanplum-ads"
# letv-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/letv-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/letv-ads"
# mixpanel-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/mixpanel-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/mixpanel-ads"
# mopub-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/mopub-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/mopub-ads"
# mxplayer-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/mxplayer-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/mxplayer-ads"
# netease-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/netease-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/netease-ads"
# newrelic-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/newrelic-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/newrelic-ads"
# ogury-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/ogury-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/ogury-ads"
# onesignal-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/onesignal-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/onesignal-ads"
# ookla-speedtest-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/ookla-speedtest-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/ookla-speedtest-ads"
# pocoiq-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/pocoiq-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/pocoiq-ads"
# pubmatic-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/pubmatic-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/pubmatic-ads"
# segment-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/segment-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/segment-ads"
# sensorsdata-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/sensorsdata-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/sensorsdata-ads"
# sina-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/sina-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/sina-ads"
# sohu-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/sohu-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/sohu-ads"
# spotify-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/spotify-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/spotify-ads"
# supersonic-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/supersonic-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/supersonic-ads"
# taboola
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/taboola.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/taboola"
# tagtic-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/tagtic-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/tagtic-ads"
# tappx-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/tappx-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/tappx-ads"
# tencent-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/tencent-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/tencent-ads"
# uberads-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/uberads-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/uberads-ads"
# umeng-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/umeng-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/umeng-ads"
# unity-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/unity-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/unity-ads"
# wteam-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/wteam-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/wteam-ads"
# xhamster-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/xhamster-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/xhamster-ads"
# xiaomitv-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/xiaomitv-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/xiaomitv-ads"
# yahoo-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/yahoo-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/yahoo-ads"
# youku-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/youku-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/youku-ads"
# zynga-ads
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/zynga-ads.txt "https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/zynga-ads"
# ilpl/ad-hosts
wget --no-check-certificate -c -O ./Adblock/Cache/Upstream/ilpl-hosts.txt "https://raw.githubusercontent.com/ilpl/ad-hosts/master/hosts"