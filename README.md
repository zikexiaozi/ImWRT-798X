# ImmortalWrt-Builder-24.10

这是一个用于自动编译 [ImmortalWrt 24.10](https://github.com/padavanonly/immortalwrt-mt798x-24.10) 固件的 GitHub Actions 工作流，专为 CMCC 系列设备（基于 MediaTek MT7981）设计。支持每天检查源码更新、自动编译固件，并将 `sysupgrade.bin` 文件上传到 GitHub Release 和 WebDAV。

## 功能
- **支持的设备**：
  - cmcc_a10
  - cmcc_rax3000m
  - cmcc_rax3000m-emmc
  - cmcc_rax3000m-emmc-usboffload
  - cmcc_rax3000m-usboffload
  - cmcc_rax3000me
  - cmcc_xr30
  - cmcc_xr30-emmc
- **自动编译**：每天（北京时间 08:00）检查源仓库更新，若有新提交，自动为所有 CMCC 机型编译固件。
- **5G 25dB 增强**：支持启用 5G 高功率模式（默认启用，定时编译时固定启用，手动编译可选）。
- **固件上传**：仅上传 `sysupgrade.bin` 文件到 GitHub Release 和 WebDAV，无 ZIP 压缩。
- **清理机制**：保留最近 30 个 GitHub Release 和 30 次工作流运行，自动删除旧记录以节省空间。

## 使用方法

### 1. 配置仓库
- Fork 或克隆本仓库到你的 GitHub 账户。
- 在仓库的 **Settings > Secrets and variables > Actions** 中添加以下 Secrets：
  - `WEBDAV_URL`：WebDAV 服务器地址（例如：`https://dav.example.com/firmware/`）。
  - `WEBDAV_USERNAME`：WebDAV 用户名。
  - `WEBDAV_PASSWORD`：WebDAV 密码。

### 2. 手动触发编译
- 进入仓库的 **Actions** 页面，选择 `ImmortalWrt-Builder-24.10` 工作流。
- 点击 **Run workflow**，选择：
  - `device_model`：目标 CMCC 设备型号。
  - `enable_5g_25db`：是否启用 5G 25dB 增强（默认：启用）。
- 运行后，固件将上传到 GitHub Release 和 WebDAV。

### 3. 定时触发
- 无需手动操作，工作流每天（UTC 00:00，北京时间 08:00）检查源仓库 `padavanonly/immortalwrt-mt798x-24.10` 的 `2410` 分支。
- 如果有更新，自动为所有 CMCC 机型编译固件，并上传 `sysupgrade.bin`。

### 4. 下载固件
- **GitHub Release**：在仓库的 **Releases** 页面查找 `v24.10-<device_model>` 标签，下载 `sysupgrade.bin`。
- **WebDAV**：通过配置的 WebDAV 服务器访问固件，文件名为 `<device_model>_25dB-<on/off>_<version>_sysupgrade.bin`。

### 5. 刷写固件
- 确认设备型号与固件匹配。
- 备份设备原有固件。
- 使用 Web 界面或 SSH 刷入 `sysupgrade.bin` 文件。

## 注意事项
- **风险提示**：刷写固件可能导致设备变砖，请谨慎操作，确保固件与设备型号完全匹配。
- **WebDAV 配置**：确保 WebDAV 服务器可访问，且 Secrets 配置正确，否则上传可能失败。
- **编译时间**：单设备编译可能需要 1-2 小时，视 GitHub Actions 资源而定。
- **5G 25dB 增强**：高功率模式可能受当地法规限制，请确认合法性后再使用。

## 源码
- 本工作流基于 [padavanonly/immortalwrt-mt798x-24.10](https://github.com/padavanonly/immortalwrt-mt798x-24.10)。
- 分支：`2410`。

## 贡献
欢迎提交 Issue 或 Pull Request，优化工作流或添加新功能！

## 许可证
本项目遵循 MIT 许可证，详情见 [LICENSE](LICENSE)。
