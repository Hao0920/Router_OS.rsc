#### 处理数据 ####
### Basic
mkdir -p ./Cache/Direct/Process/Basic
find ./Packages/Direct/Basic -type f -name "*.txt" | xargs cat > ./Cache/Direct/Process/Basic.txt