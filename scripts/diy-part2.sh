#!/bin/bash
#
# 版权所有 (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 这是一个自由软件，根据 MIT 许可证授权。
# 详细信息请参见 /LICENSE。
#
# https://github.com/P3TERX/Actions-OpenWrt
# 文件名: diy-part2.sh
# 描述: OpenWrt 自定义脚本部分2 (更新源后)
#!/bin/bash
ROOTFS_DIR=$(find $GITHUB_WORKSPACE/openwrt/bin -type d -name "rootfs" | head -1)
FIRMWARE_FILE="$ROOTFS_DIR/lib/firmware/MT7981_iPAiLNA_EEPROM.bin"
if [ ! -f "$FIRMWARE_FILE" ]; then
  echo "Error: Firmware file not found."
  exit 1
fi
echo -n $(printf '\x2B%.0s' {1..20}) > /tmp/tmp.bin
dd if=/tmp/tmp.bin of=$FIRMWARE_FILE bs=1 seek=1093 conv=notrunc
rm /tmp/tmp.bin
echo "Firmware file modified successfully."

# 修改默认 IP
# 将 192.168.6.1 和 192.168.1.1 都替换为 192.168.2.1
sed -i 's/192\.168\.6\.1/192.168.2.1/g; s/192\.168\.1\.1/192.168.2.1/g' package/base-files/files/bin/config_generate
        
