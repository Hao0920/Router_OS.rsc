# ros-upgrade

RouterOS 系统自动升级脚本

## 说明

自动检查并升级 RouterOS 系统版本

## 使用方法

### 1. 创建 Script

```routeros
:if ([:len [/system script find name="upgrade-ros"]] = 0) do={
    /system script add \
        name="upgrade-ros" \
        source={
            # 配置变量（请修改为你的实际需求）
            :local channel "stable"      # 升级通道: stable, long-term, testing, development

            :log info "Checking for RouterOS updates..."

            # 检查更新
            /system package update set channel=$channel
            /system package update check-for-updates

            :delay 10s

            :local status [/system package update get status]
            :local installedVersion [/system package update get installed-version]
            :local latestVersion [/system package update get latest-version]

            :log info ("Installed version: " . $installedVersion)
            :log info ("Latest version: " . $latestVersion)
            :log info ("Status: " . $status)

            # 如果有新版本
            :if ($status = "New version is available") do={
                :log info "New version available, downloading..."

                # 下载更新
                /system package update download

                :delay 600s

                # 再次检查下载状态
                :local downloadStatus [/system package update get status]
                :log info ("Download status: " . $downloadStatus)

                :if ($downloadStatus = "Downloaded, please reboot router to upgrade it") do={
                    :log info "Download finished, rebooting..."
                    /system reboot
                } else={
                    :log info "Download failed or timeout."
                }
            } else={
                :log info "RouterOS is up to date."
            }
        } \
        comment="ispconf: upgrade-ros - Auto upgrade RouterOS system version"
}
```

### 2. 创建 Scheduler

```routeros
:if ([:len [/system scheduler find name="upgrade-ros"]] = 0) do={
    /system scheduler add \
        name="upgrade-ros" \
        start-time=03:00:00 \
        interval=7d \
        on-event="/system script run upgrade-ros" \
        comment="ispconf: upgrade-ros - Auto upgrade RouterOS system version"
}
```

## 配置变量

| 变量 | 说明 | 可选值 |
| --- | --- | --- |
| `channel` | 升级通道 | stable, long-term, testing, development |

## 升级流程

1. 检查更新
2. 如果有新版本，下载更新
3. 等待 10 分钟下载完成
4. 再次检查下载状态
5. 如果下载完成，自动重启
6. 如果下载失败，记录日志

## 运行时间

- **每周一 03:00**（低峰时段）
- 避免与数据更新（08:35）冲突

## 文件

- `ros-upgrade.txt` - 完整的升级脚本
