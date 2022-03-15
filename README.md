IPS-IP
=
为Router OS生成策略路由规则

## 感谢
- 代码 : [jacyl4/chnroute](https://github.com/jacyl4/chnroute)
- 数据源 : [Clang.CN](https://ispip.clang.cn)
- 文件 : [Github Action](https://github.com/features/actions)
## 使用方法
### 通过 `WinBox - System - Scheduler` 添加脚本实现自动更新
### Github Action 构建的文件自带删除原 IP 列表命令
`Firewall - Address List` 导入 IP 列表
```
/file remove [find name="isp-all.rsc"]
/tool fetch url="https://cdn.jsdelivr.net/gh/Hao0920/ISP-IP@main/isp-all.rsc"
:if ([:len [/file find name=isp-all.rsc]] > 0) do={
/import isp-all.rsc
}
```
