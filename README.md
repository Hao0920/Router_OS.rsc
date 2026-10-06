# Router_OS.rsc

RouterOS 脚本生成器集合

由 GitHub Actions 自动构建

## 生成器

| 名称 | 说明 | 输出目录 |
| --- | --- | --- |
| [chnroute](generators/chnroute/) | 中国大陆运营商策略路由 | `output/chnroute/` |

## 使用方法

### 下载单个文件

```javascript
https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/chnroute/all_cn.rsc
```

### RouterOS 导入示例

```routeros
:local baseUrl "https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/chnroute"

# 清理旧规则
/ip route rule remove [find comment~"ispconf:"]

# 下载并导入
/tool fetch url="$baseUrl/chinatelecom-othernet.rsc"
/import chinatelecom-othernet.rsc
```

## 本地生成

```bash
python generators/chnroute/generate.py
```

## 添加新生成器

1. 在 `generators/` 下创建新目录
2. 编写 `generate.py` 脚本
3. 在 `.github/workflows/` 创建对应 workflow
4. 输出到 `output/你的生成器名/`
