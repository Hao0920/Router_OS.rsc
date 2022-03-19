save_dir="./Config/ISP-IP/Data/ISPIP"
apnic_ip_info="$save_dir/apnic_ip_info"
apnic_all_ip="$save_dir/apnic_all_ip"
if [ ! -d "$save_dir" ]; then
mkdir "$save_dir"
fi

Local_Dir="/home/ispip"


Old_unicom_cnc=$(date -d -30day +"%Y%m%d")_unicom_cnc.html
Old_chinatelecom=$(date -d -30day +"%Y%m%d")_chinatelecom.html
Old_cernet=$(date -d -30day +"%Y%m%d")_cernet.html
Old_crtc=$(date -d -30day +"%Y%m%d")_crtc.html
Old_cmcc=$(date -d -30day +"%Y%m%d")_cmcc.html
Old_gwbn=$(date -d -30day +"%Y%m%d")_gwbn.html
Old_othernet=$(date -d -30day +"%Y%m%d")_othernet.html

re_unicom_cnc=$(date -d -1day +"%Y%m%d")_unicom_cnc.html
re_chinatelecom=$(date -d -1day +"%Y%m%d")_chinatelecom.html
re_cernet=$(date -d -1day +"%Y%m%d")_cernet.html
re_crtc=$(date -d -1day +"%Y%m%d")_crtc.html
re_cmcc=$(date -d -1day +"%Y%m%d")_cmcc.html
re_gwbn=$(date -d -1day +"%Y%m%d")_gwbn.html
re_othernet=$(date -d -1day +"%Y%m%d")_othernet.html

# delete old exist file.
rm -f $save_dir/*

wget -c --progress=bar:force --prefer-family=IPv4 --no-check-certificate http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest -O $apnic_ip_info
grep "apnic|CN|ipv4|" "$apnic_ip_info" | awk -F'|' '{print $4"/"32-log($5)/log(2)}' > "$apnic_all_ip"
while read line
do
isp_ip=`echo $line | awk -F'/' '{print $1}'`
isp_info=`whois -h whois.apnic.net $isp_ip | grep -E "(mnt-|netname|e-mail)" | awk '{print $2}' | xargs`

# GWBN
into_gwbn=`echo $isp_info | sed -n '/GWBN/p'`
into_gwbl=`echo $isp_info | sed -n '/GXBL/p'`

# CNC
into_cnc=`echo $isp_info | sed -n '/CNC/p'`
into_cnc_small=`echo $isp_info | sed -n '/cnc/p'`

# CHINAUNICOM
into_unicom=`echo $isp_info | sed -n '/UNICOM/p'`

# CHINATELECOM
into_chinatelecom=`echo $isp_info | sed -n '/CHINANET/p'`
into_telecom=`echo $isp_info | sed -n '/TELECOM/p'`
into_bjtel=`echo $isp_info | sed -n '/BJTEL/p'`

# CERNET
into_cernet=`echo $isp_info | sed -n '/CERNET/p'`

# CRTC
into_crtc=`echo $isp_info | sed -n '/CRTC/p'`

# CHINAMOBILE
into_cmcc=`echo $isp_info | sed -n '/CMCC/p'`
into_cmnet=`echo $isp_info | sed -n '/CMNET/p'`

if [ "${into_gwbn}" != "" ];then
   echo "$line<br>" >> ${save_dir}/gwbn.html
elif [ "${into_gwbl}" != "" ];then
   echo "$line<br>" >> ${save_dir}/gwbn.html
elif [ "${into_cnc}" != "" ];then
   echo "$line<br>" >> ${save_dir}/unicom_cnc.html
elif [ "${into_cnc_small}" != "" ];then
     echo "$line<br>" >> ${save_dir}/unicom_cnc.html
elif [ "${into_unicom}" != "" ];then
     echo "$line<br>" >> ${save_dir}/unicom_cnc.html
elif [ "${into_chinatelecom}" != "" ];then
     echo "$line<br>" >> ${save_dir}/chinatelecom.html
elif [ "${into_telecom}" != "" ];then
     echo "$line<br>" >> ${save_dir}/chinatelecom.html
elif [ "${into_bjtel}" != "" ];then
     echo "$line<br>" >> ${save_dir}/chinatelecom.html
elif [ "${into_cernet}" != "" ];then
     echo "$line<br>" >> ${save_dir}/cernet.html
elif [ "${into_crtc}" != "" ];then
     echo "$line<br>" >> ${save_dir}/crtc.html
elif [ "${into_cmcc}" != "" ];then
     echo "$line<br>" >> ${save_dir}/cmcc.html
elif [ "${into_cmnet}" != "" ];then
     echo "$line<br>" >> ${save_dir}/cmcc.html
else
     echo "$line<br>" >> ${save_dir}/othernet.html
fi

done<$apnic_all_ip

sed -i "s/strTime<br>$/$(date +"%Y-%m-%d %H:%M:%S")<br>/g" ${save_dir}/chinatelecom.html
sed -i "s/strTime<br>$/$(date +"%Y-%m-%d %H:%M:%S")<br>/g" ${save_dir}/unicom_cnc.html
sed -i "s/strTime<br>$/$(date +"%Y-%m-%d %H:%M:%S")<br>/g" ${save_dir}/cmcc.html
sed -i "s/strTime<br>$/$(date +"%Y-%m-%d %H:%M:%S")<br>/g" ${save_dir}/crtc.html
sed -i "s/strTime<br>$/$(date +"%Y-%m-%d %H:%M:%S")<br>/g" ${save_dir}/cernet.html
sed -i "s/strTime<br>$/$(date +"%Y-%m-%d %H:%M:%S")<br>/g" ${save_dir}/gwbn.html
sed -i "s/strTime<br>$/$(date +"%Y-%m-%d %H:%M:%S")<br>/g" ${save_dir}/othernet.html

#删除N天前的旧IP文件
rm -f ${Local_Dir}/$Old_unicom_cnc
rm -f ${Local_Dir}/$Old_chinatelecom
rm -f ${Local_Dir}/$Old_cernet
rm -f ${Local_Dir}/$Old_crtc
rm -f ${Local_Dir}/$Old_cmcc
rm -f ${Local_Dir}/$Old_gwbn
rm -f ${Local_Dir}/$Old_othernet
#重命名前一天的IP文件
mv -f ${Local_Dir}/unicom_cnc.html ${Local_Dir}/$re_unicom_cnc
mv -f ${Local_Dir}/chinatelecom.html ${Local_Dir}/$re_chinatelecom
mv -f ${Local_Dir}/cernet.html ${Local_Dir}/$re_cernet
mv -f ${Local_Dir}/crtc.html ${Local_Dir}/$re_crtc
mv -f ${Local_Dir}/cmcc.html ${Local_Dir}/$re_cmcc
mv -f ${Local_Dir}/gwbn.html ${Local_Dir}/$re_gwbn
mv -f ${Local_Dir}/othernet.html ${Local_Dir}/$re_othernet
#复制当天的IP文件
cp -f ${save_dir}/*.html ${Local_Dir}/
#更改权限
chown -R www:www ${Local_Dir}/*