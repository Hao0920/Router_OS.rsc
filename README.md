IPS-IP
=
> 为 `Router OS` 生成策略路由规则
## 感谢
- 源码 : [jacyl4/chnroute](https://github.com/jacyl4/chnroute)
- 数据源 : [Clang.CN](https://ispip.clang.cn)
- 文件 : [Github Action](https://github.com/features/actions)
## 使用方法
### 通过 `WinBox - System - Scheduler` 添加脚本实现自动更新
- **本规则是在`Firewall - Address List` 导入 IP 列表**
- **Github Action 构建的文件包含删除原 IP 列表命令**
- **如果无法访问域名 `raw.githubusercontent.com`，可以使用第二个地址 `cdn.jsdelivr.net`。**
- **导入完成后通过 `WinBox - IP - Firewall - Mangle` 添加规则，通过 `Dst. Address List` 引用。**
### 脚本
- **`raw.githubusercontent.com`**
```
/file remove [find name="ISP-IP.rsc"]
/tool fetch url="https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/ISP-IP.rsc"
:if ([:len [/file find name=ISP-IP.rsc]] > 0) do={
/import ISP-IP.rsc
}
```
- **`cdn.jsdelivr.net`**
```
/file remove [find name="ISP-IP.rsc"]
/tool fetch url="https://cdn.jsdelivr.net/gh/Hao0920/Router_OS.rsc@main/ISP-IP.rsc"
:if ([:len [/file find name=ISP-IP.rsc]] > 0) do={
/import ISP-IP.rsc
}
```
