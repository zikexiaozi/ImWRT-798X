以下是一个简洁的 README 示例，适用于你的 ImmortalWrt 编译项目。它包含项目简介、使用说明和下载链接，简明扼要：

---

# ImmortalWrt Builder

自动编译 ImmortalWrt 24.10 固件的 GitHub Actions 工作流，支持多种 MT7981 设备型号。

## 功能
- **支持设备**：CMCC RAX3000M、Xiaomi AX3000T 等 19 种型号。
- **自定义**：可选 5G 25dB 高功率模式。
- **输出**：
  - GitHub Releases：`sysupgrade.bin` 和 `factory.bin`。
  - WebDAV：固件 ZIP 文件。
- **自动化**：每天定时编译，清理旧版本。

## 使用方法
1. **触发编译**：
   - 手动：在 GitHub Actions 页面选择设备型号和选项。
   - 定时：每天 UTC 21:00（北京时间次日 05:00）。
2. **下载固件**：
   - [Releases 页面](https://github.com/你的用户名/你的仓库/releases)
   - WebDAV（需配置）。
3. **刷机**：
   - 确认设备型号匹配。
   - 备份原始固件。
   - 通过 Web 或 SSH 刷入。

## 注意
- 使用前请仔细阅读固件版本和设备信息。
- 刷机有风险，请谨慎操作！

## 源码
- [immortalwrt-mt798x-24.10](https://github.com/padavanonly/immortalwrt-mt798x-24.10)

---

### 使用说明
1. 将 `你的用户名/你的仓库` 替换为实际的 GitHub 仓库地址。
2. 如果需要添加更多细节（例如支持的设备列表或配置 WebDAV 的说明），可以告诉我，我再扩展。
3. 保存为 `README.md`，放在仓库根目录。

简洁明了，适合快速上手。如果需要调整风格或内容，请随时说！
