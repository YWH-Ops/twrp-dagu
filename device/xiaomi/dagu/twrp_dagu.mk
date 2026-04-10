# 小米平板5 Pro 12.4英寸 (dagu) 的TWRP产品配置

# 继承设备配置
$(call inherit-product, device/xiaomi/dagu/device.mk)

# 继承TWRP通用配置
# 注意：这里假设TWRP源码中的common.mk路径正确
# $(call inherit-product, vendor/twrp/config/common.mk)

# 如果没有找到common.mk，我们手动定义一些TWRP配置
PRODUCT_PACKAGES += \
    twrp \
    busybox \
    strace \
    pigz

# 设备标识
PRODUCT_DEVICE := dagu
PRODUCT_NAME := twrp_dagu
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := "Xiaomi Pad 5 Pro 12.4"
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# 构建属性
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=dagu \
    PRODUCT_NAME=dagu \
    TARGET_VENDOR_PRODUCT_NAME=dagu \
    TARGET_VENDOR_DEVICE_NAME=dagu \
    PRIVATE_BUILD_DESC="dagu-user 13 TP1A.220624.014 V14.0.22.12.20.DEV release-keys"

BUILD_FINGERPRINT := "Xiaomi/dagu/dagu:13/TP1A.220624.014/V14.0.22.12.20.DEV:user/release-keys"

# 产品特性
PRODUCT_CHARACTERISTICS := tablet

# 恢复模式属性
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,adb \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    ro.adb.secure=0

# TWRP特定属性
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.twrp.boot=1 \
    ro.twrp.version=3.7.0 \
    persist.sys.root_access=1

# 恢复模式服务
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.dagu.rc:root/init.recovery.dagu.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.dagu.rc:root/ueventd.dagu.rc

# 权限文件
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# 恢复模式密钥
PRODUCT_PACKAGES += \
    recovery_key

# 系统工具
PRODUCT_PACKAGES += \
    toolbox \
    toybox \
    mke2fs \
    e2fsck \
    resize2fs \
    tune2fs \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# 分区工具
PRODUCT_PACKAGES += \
    sgdisk \
    gpttool \
    simg2img \
    img2simg

# 文件系统支持
PRODUCT_PACKAGES += \
    ntfs-3g \
    exfat-fuse \
    fuse-exfat

# 恢复模式服务
PRODUCT_PACKAGES += \
    recovery \
    recovery-res \
    adbd \
    minadbd \
    minui \
    libminuitwrp \
    libpixelflinger_static \
    libpng \
    libz \
    libm \
    libc

# 加密支持
PRODUCT_PACKAGES += \
    libcryptfs_hw \
    qseecomd \
    libQSEEComAPI

# 触控支持
PRODUCT_PACKAGES += \
    inputflinger \
    libinputflinger \
    libinputservice

# MTP支持
PRODUCT_PACKAGES += \
    mtp \
    mtp-server

# 语言支持
PRODUCT_LOCALES := \
    en_US \
    zh_CN \
    zh_TW

# 覆盖默认属性
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=dagu \
    ro.product.manufacturer=Xiaomi \
    ro.product.model="Xiaomi Pad 5 Pro 12.4" \
    ro.build.product=dagu \
    ro.build.description="dagu-user 13 TP1A.220624.014 V14.0.22.12.20.DEV release-keys" \
    ro.build.fingerprint="Xiaomi/dagu/dagu:13/TP1A.220624.014/V14.0.22.12.20.DEV:user/release-keys"