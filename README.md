代码取自 [jacyl4/chnroute](https://github.com/jacyl4/chnroute)

ip段信息取自 [Clang.CN](https://ispip.clang.cn)

使用方法:
**.rsc** 是往Firewall - address lists 里生ip段列表。
```
/file remove [find name="isp-all.rsc"]
/tool fetch url="https://cdn.jsdelivr.net/gh/Hao0920/ISP-IP@main/isp-all.rsc"
:if ([:len [/file find name=isp-all.rsc]] > 0) do={
/import isp-all.rsc
}
```

通过Firewall - mangle页，dst-addrss= 引用
