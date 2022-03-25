### 建立缓存 ### 
mkdir -p ./Direct/Cache/Build/

### 整理 ###
find ./Direct/Cache/Upstream -type f -name "*.txt" | xargs cat > ./Direct/Cache/Build/upstream.txt
# 删除注释行
sed -e '/^#/d' ./Direct/Cache/Build/upstream.txt > ./Direct/Cache/Build/2.txt
# 删除 include 行
sed -e '/^include:/d' ./Direct/Cache/Build/2.txt > ./Direct/Cache/Build/3.txt
# 删除 regexp 行
sed -e '/^regexp:/d' ./Direct/Cache/Build/3.txt > ./Direct/Cache/Build/4.txt
# 找出  @cn行
<<<<<<< Updated upstream
sed -n ' @cn/p' ./Direct/Cache/Build/4.txt > ./Direct/Cache/Build/5.txt
=======
sed -e ' @cn/p' ./Direct/Cache/Build/4.txt > ./Direct/Cache/Build/5.txt
>>>>>>> Stashed changes
# 删除  @cn
sed -e 's/ @cn//' ./Direct/Cache/Build/5.txt > ./Direct/Cache/Build/6.txt
# 删除 full:
sed -e 's/full://' ./Direct/Cache/Build/6.txt > ./Direct/Cache/Build/7.txt
# 删除 0.0.0.0
sed -e 's/0.0.0.0 //' ./Direct/Cache/Build/7.txt > ./Direct/Cache/Build/8.txt
# 删除空格行
sed -e '/^$/d' ./Direct/Cache/Build/8.txt > ./Direct/Cache/Build/9.txt
# 去重
sort -u ./Direct/Cache/Build/9.txt > ./Direct/Cache/Build/10.txt

### 构建 ###
{
echo "/ip dns static"
echo "remove [find address=240.0.0.1]"
for name in $(cat ./Direct/Cache/Build/10.txt) ; do
  echo "add address=240.0.0.1 name=$name"
done
echo "/file remove Direct.rsc"
} > ./Direct/Direct.rsc

### 清除缓存 ###
# rm -rf ./Direct/Cache
