# Router_OS.rsc

RouterOS 脚本生成器集合

由 GitHub Actions 自动构建

## 组件

| 名称 | 说明 | 目录 |
| --- | --- | --- |
| [chnroute](generators/chnroute/) | 中国大陆运营商策略路由 | [文档](generators/chnroute/README.md) |
| [ros-upgrade](generators/ros-upgrade/) | RouterOS 系统自动升级 | [文档](generators/ros-upgrade/README.md) |

## 仓库结构

```javascript
Router_OS.rsc/
├── README.md                    # 本文件
├── generators/
│   ├── chnroute/               # 数据路由生成器
│   │   ├── generate.py
│   │   └── README.md           # chnroute 文档
│   └── ros-upgrade/            # 系统升级
│       ├── ros-upgrade.txt     # 升级脚本
│       └── README.md           # ros-upgrade 文档
├── output/
│   └── chnroute/               # 生成的 .rsc 文件
└── .github/workflows/          # GitHub Actions
```

## 快速开始

### chnroute - 数据路由更新

每天 08:35 自动更新中国大陆 IP 路由数据

详见 [chnroute 文档](generators/chnroute/README.md)

### ros-upgrade - 系统版本升级

每周一 03:00 自动检查并升级 RouterOS 系统

详见 [ros-upgrade 文档](generators/ros-upgrade/README.md)

## 本地生成

```bash
# 生成 chnroute
python generators/chnroute/generate.py

# ros-upgrade 无需生成，直接使用
```

## 添加新版生成器

1. 在 `generators/` 下创建新目录
2. 编写 `generate.py` 脚本（如需要）
3. 创建 `README.md` 说明文档
4. 在 `.github/workflows/` 中添加 workflow
5. 输出到 `output/你的生成器名称/`（如需要）
