#### 处理数据 ####
### Basic
mkdir -p ./Cache/Direct/Process/Basic
find ./Packages/Direct/Basic -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Basic-1.txt
sed -e '/^$/d' ./Cache/Direct/Process/Basic-1.txt > ./Cache/Direct/Process/Basic-2.txt
sed -e '/#/d' ./Cache/Direct/Process/Basic-2.txt > ./Cache/Direct/Process/Basic.txt