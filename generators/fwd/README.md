# fwd - 指定域名 DNS 转发

从 MetaCubeX 的 `geosite/gfw.json` 生成 RouterOS DNS Static FWD 规则，将名单内域名及其子域名的 DNS 查询转发到 `172.16.1.2`。

生成文件：`output/fwd/gfw.rsc`

## 规则格式

```routeros
/ip dns static add name="example.com" type=FWD forward-to=172.16.1.2 match-subdomain=yes disabled=no comment="proxyconf: gfw to proxy"
```

- `type=FWD`：只转发匹配域名的 DNS 查询，不直接转发业务流量。
- `forward-to=172.16.1.2`：上游 DNS 为 smbox。
- `match-subdomain=yes`：同时匹配主域名和子域名。
- `comment="proxyconf: gfw to proxy"`：用于更新时识别并替换旧规则。

未列入名单的域名继续使用 RouterOS 的普通上游 DNS，不受本组件影响。

## 手动导入

将 `gfw.rsc` 上传到 RouterOS Files，然后执行：

```routeros
/import file-name=gfw.rsc
```

脚本开头会删除具有相同注释的旧规则，结尾会清空 DNS 缓存，因此可以重复导入。

查看规则数量：

```routeros
/ip dns static print count-only where comment="proxyconf: gfw to proxy"
```

## RouterOS 自动更新

每天 08:40 下载并导入最新版。以下命令只需执行一次：

```routeros
:if ([:len [/system script find name="update-fwd"]] = 0) do={
    /system script add \
        name="update-fwd" \
        source={
            :local addr "https://raw.githubusercontent.com/Hao0920/Router_OS.rsc/main/output/fwd/gfw.rsc"
            :local result ([/tool fetch mode=https output=user url=$addr as-value])
            :if ($result->"status" = "finished") do={
                /file remove [find name="gfw.rsc"]
                /tool fetch url=$addr dst-path=gfw.rsc
                /import file-name=gfw.rsc
            }
        } \
        comment="fwd: update-fwd - Update DNS Static FWD rules"
}

:if ([:len [/system scheduler find name="update-fwd"]] = 0) do={
    /system scheduler add \
        name="update-fwd" \
        start-time=08:40:00 \
        interval=1d \
        on-event="/system script run update-fwd" \
        comment="fwd: update-fwd - Update DNS Static FWD rules"
}
```

手动测试更新：

```routeros
/system script run update-fwd
```

## 本地生成

在仓库根目录执行：

```bash
python generators/fwd/generate.py
```

生成器只接受 `domain` 和 `domain_suffix` 两类规则；如果上游以后加入 `domain_keyword` 或 `domain_regex`，会明确报错，而不是静默生成不完整名单。

## 删除组件规则

```routeros
/ip dns static remove [find comment="proxyconf: gfw to proxy"]
/ip dns cache flush
/system scheduler remove [find name="update-fwd"]
/system script remove [find name="update-fwd"]
```

## 与 FakeIP 分流配合

本组件只负责域名选择。若 `172.16.1.2` 返回 FakeIP，还需要保留 RouterOS 中识别 FakeIP 网段的 mangle/路由规则，业务流量才会进入代理。直接访问 IP 或绕过 RouterOS DNS 的客户端不受 Static FWD 控制。
