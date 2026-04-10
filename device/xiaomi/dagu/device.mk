# 小米平板5 Pro 12.4英寸 (dagu) 设备配置

# 设备标识
PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := dagu
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := "Xiaomi Pad 5 Pro 12.4"
PRODUCT_NAME := dagu
PRODUCT_SYSTEM_NAME := dagu
PRODUCT_SYSTEM_DEVICE := dagu

# 继承配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# 设备属性
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=dagu \
    ro.product.name=dagu \
    ro.build.product=dagu \
    ro.product.model=22071216C \
    ro.build.fingerprint=Xiaomi/dagu/dagu:13/TP1A.220624.014/V14.0.22.12.20.DEV:user/release-keys

# TWRP特定配置
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/twrp.fstab

# 复制恢复模式配置文件
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/etc/recovery.fstab:recovery/root/etc/recovery.fstab

# 复制bootloader message
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.qcom.rc:root/init.recovery.qcom.rc

# 设备特定库文件（如果需要）
# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/prebuilt/vendor/lib64/libmmcamera2_pproc_modules.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libmmcamera2_pproc_modules.so

# 触控驱动（如果需要）
# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/prebuilt/touchscreen/novatek_nt36523.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/novatek_nt36523.ko

# 继承高通sm8150平台配置（如果可用）
# $(call inherit-product-if-exists, hardware/qcom/sm8150/sm8150.mk)

# 构建属性
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=dagu \
    PRODUCT_NAME=dagu \
    TARGET_VENDOR_PRODUCT_NAME=dagu \
    TARGET_VENDOR_DEVICE_NAME=dagu \
    PRIVATE_BUILD_DESC="dagu-user 13 TP1A.220624.014 V14.0.22.12.20.DEV release-keys"

BUILD_FINGERPRINT := "Xiaomi/dagu/dagu:13/TP1A.220624.014/V14.0.22.12.20.DEV:user/release-keys"

# 产品配置
PRODUCT_CHARACTERISTICS := tablet

# A/B分区支持
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    product \
    system_ext \
    odm

# 加密支持
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# 存储配置
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.config.zram=true

# 性能配置
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# 触控配置
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.touch.disable.calibration=false \
    persist.vendor.touch.orientation=0 \
    persist.vendor.touch.pressure.scale=1.0

# 显示配置
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    ro.vendor.display.sensortype=2

# 音频配置
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio.adm.buffering.ms=6

# WiFi配置
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# 蓝牙配置
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.device.class_of_device=2360344 \
    bluetooth.profile.a2dp.source.enabled?=true \
    bluetooth.profile.asha.central.enabled?=true \
    bluetooth.profile.gatt.enabled?=true

# 恢复模式属性
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,adb

# 继承TWRP通用配置（需要从TWRP源码中继承）
# $(call inherit-product, vendor/twrp/config/common.mk)