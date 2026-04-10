# TWRP Device Tree for Xiaomi Pad 5 Pro 12.4 (dagu)

## 📱 Device Information
- **Device**: Xiaomi Pad 5 Pro 12.4 (codenamed `dagu`)
- **Model**: 22071216C
- **Platform**: Qualcomm SM8150 (Snapdragon 870)
- **Display**: 12.4" 1600x2560 LCD
- **Touch**: Novatek NT36523
- **Android Version**: 13 (TP1A.220624.014)
- **MIUI Version**: V14.0.22.12.20.DEV

## 📁 Files Overview

### Required Files
- `AndroidProducts.mk` - Product definitions
- `BoardConfig.mk` - **Main configuration file**
- `device.mk` - Device properties
- `recovery.fstab` - **Partition table**
- `twrp_dagu.mk` - TWRP product configuration
- `vendorsetup.sh` - Adds device to lunch menu

### Prebuilt Files
- `prebuilt/kernel` - Extracted from official boot.img

### Optional Files
- `overlays/` - UI customization
- `kernel/` - Kernel source (optional)
- `recovery/` - Recovery-specific configurations

## ⚙️ Key Configuration

### BoardConfig.mk Highlights
```makefile
# Platform
TARGET_BOARD_PLATFORM := sm8150
DEVICE_RESOLUTION := 1600x2560
TW_THEME := portrait_hdpi

# Touch
TW_TOUCH_DRIVER := NT36523
TW_USE_NT36523_TOUCH := true

# Brightness
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 2000

# Encryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
```

### Partition Sizes
```
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296        # 96 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864     # 64 MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384     # 3.5 GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114898763776 # 107 GB
```

## 🚀 Building TWRP

### Prerequisites
- Ubuntu 20.04/22.04 or WSL2
- 16GB+ RAM, 100GB+ free space
- Java 8 (OpenJDK)
- Standard Android build tools

### Quick Start
```bash
# 1. Initialize TWRP source
mkdir ~/twrp && cd ~/twrp
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j$(nproc)

# 2. Copy device tree
cp -r /path/to/dagu/device/xiaomi/dagu ~/twrp/device/xiaomi/

# 3. Build
cd ~/twrp
source build/envsetup.sh
lunch twrp_dagu-eng
mka recoveryimage
```

### Output
The compiled TWRP image will be at:
```
~/twrp/out/target/product/dagu/recovery.img
```

## 🔧 Testing

### Safe Test (No Flashing)
```bash
fastboot boot recovery.img
```

### Permanent Installation
```bash
fastboot flash recovery recovery.img
fastboot reboot recovery
```

## 🐛 Known Issues & Solutions

### Touch Not Working
Try different touch drivers in `BoardConfig.mk`:
```makefile
TW_TOUCH_DRIVER := ft5x06_720p
# or
TW_TOUCH_DRIVER := synaptics_dsx
```

### Screen Display Issues
Adjust DPI in `BoardConfig.mk`:
```makefile
TARGET_SCREEN_DENSITY := 320  # Try 240, 280, 320, 400
```

### Partition Mounting Failures
Check actual partition paths on device:
```bash
adb shell ls -la /dev/block/platform/soc/by-name/
```
Update `recovery.fstab` accordingly.

## 📊 Device Tree Structure
```
dagu/
├── AndroidProducts.mk
├── BoardConfig.mk          # Hardware configuration
├── device.mk              # Device properties
├── recovery.fstab         # Partition mapping
├── twrp_dagu.mk          # TWRP product config
├── vendorsetup.sh        # Lunch menu entry
├── prebuilt/
│   └── kernel           # Kernel from boot.img
├── overlays/
│   └── recovery/
│       └── res/
│           └── images/  # Custom themes
├── kernel/              # Kernel source (optional)
└── recovery/            # Recovery configs
```

## 🤝 Contributing

### Testing
1. Test all basic TWRP functions
2. Test touch responsiveness
3. Test partition mounting
4. Test backup/restore
5. Test ADB/MTP connectivity

### Reporting Issues
When reporting issues, please include:
1. Device model and Android version
2. TWRP version and build date
3. Steps to reproduce
4. Logcat output if available
5. Screenshots if relevant

### Pull Requests
- Follow TWRP coding standards
- Test changes thoroughly
- Update documentation if needed
- Reference related issues

## 📞 Support

### Online Communities
- **XDA Forum**: [Xiaomi Mi Pad 5](https://forum.xda-developers.com/c/xiaomi-mi-pad-5.12371/)
- **Telegram**: Search for "dagu TWRP" groups
- **GitHub**: [TWRP Issues](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp/issues)

### Debug Commands
```bash
# Check device connection
fastboot devices
adb devices

# Get kernel logs
adb shell dmesg | grep -i touch
adb shell dmesg | grep -i display

# Check partitions
adb shell ls -la /dev/block/platform/soc/by-name/
adb shell cat /proc/partitions
```

## ⚠️ Disclaimer
- This device tree is provided as-is
- No warranty of any kind
- Use at your own risk
- Always backup your data
- Always test with `fastboot boot` before flashing

## 📄 License
This device tree is licensed under the Apache License 2.0.

## 🙏 Credits
- Team Win Recovery Project (TWRP)
- Xiaomi for device firmware
- The Android Open Source Project
- All contributors and testers

---
**Maintainer**: [Your Name Here]  
**Device**: Xiaomi Pad 5 Pro 12.4 (dagu)  
**Status**: Initial release  
**Last Updated**: 2026-03-30