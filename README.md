# TWRP for Xiaomi Pad 5 Pro 12.4 (dagu)

[![Build TWRP](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME/actions/workflows/build-twrp.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME/actions/workflows/build-twrp.yml)

This repository contains the device tree and GitHub Actions workflow to build TWRP Recovery for Xiaomi Pad 5 Pro 12.4 (codename: dagu).

## Device Specifications

| Feature | Specification |
|---------|--------------|
| Device | Xiaomi Pad 5 Pro 12.4 |
| Codename | dagu |
| SoC | Qualcomm Snapdragon 870 (SM8150-AC) |
| Display | 12.4" 2560x1600 |
| RAM | 6GB/8GB/12GB |
| Storage | 128GB/256GB/512GB |
| Battery | 10000 mAh |

## Features

- **Touchscreen**: Works
- **Display**: 2560x1600 resolution
- **Storage**: Full support
- **USB**: OTG and MTP support
- **Backup/Restore**: Full support
- **Encryption**: FBE (File Based Encryption) support

## Building TWRP

### Method 1: GitHub Actions (Recommended)

1. **Fork this repository** to your GitHub account

2. **Go to Actions tab** → "Build TWRP for Xiaomi Pad 5 Pro 12.4 (dagu)"

3. **Click "Run workflow"** and configure:
   - Device codename: `dagu` (default)
   - Build target: `recoveryimage` (default)

4. **Wait for build to complete** (approximately 30-60 minutes)

5. **Download the build artifacts** from the workflow run or Releases page

### Method 2: Local Build

```bash
# Download TWRP source
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync

# Copy device tree
cp -r device/xiaomi/dagu /path/to/twrp/source/device/xiaomi/

# Build
cd /path/to/twrp/source
source build/envsetup.sh
lunch twrp_dagu-eng
mka recoveryimage
```

## Installation

### Prerequisites
- Unlocked bootloader
- ADB and Fastboot tools installed
- Backup of important data

### Steps

1. **Boot to fastboot mode:**
   ```bash
   adb reboot bootloader
   ```

2. **Flash TWRP:**
   ```bash
   fastboot flash recovery twrp-dagu-*.img
   ```

3. **Boot to TWRP:**
   ```bash
   fastboot boot twrp-dagu-*.img
   ```

## Troubleshooting

### If TWRP doesn't boot:
- Try temporary boot first: `fastboot boot twrp-dagu-*.img`
- Check if bootloader is unlocked
- Verify the downloaded image is not corrupted

### If touch doesn't work:
- This is a known issue with some builds
- Try different TWRP versions

### If encryption doesn't work:
- Set a lock screen password in Android first
- Then boot to TWRP

## Credits

- TWRP Team
- Xiaomi Pad 5 Pro community
- Device tree contributors

## License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details.

## Disclaimer

- This is an unofficial build
- Use at your own risk
- The authors are not responsible for any damage to your device
- Always backup your data before flashing
