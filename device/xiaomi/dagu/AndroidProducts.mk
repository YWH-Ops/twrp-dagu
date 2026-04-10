# 小米平板5 Pro 12.4英寸 (dagu) 产品定义

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_dagu.mk

COMMON_LUNCH_CHOICES := \
    twrp_dagu-eng

# 产品描述
PRODUCT_NAME := dagu
PRODUCT_DEVICE := dagu
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := "Xiaomi Pad 5 Pro 12.4"
PRODUCT_MANUFACTURER := Xiaomi

# 产品版本信息
PRODUCT_VERSION_MAJOR := 1
PRODUCT_VERSION_MINOR := 0
PRODUCT_VERSION_PATCH := 0

# 设备分类
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi

# 语言支持
PRODUCT_LOCALES := \
    en_US \
    zh_CN \
    zh_TW

# 权限配置
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml

# 系统属性
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.type=eng \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,adb

# 设备特性
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/device_features.xml:$(TARGET_COPY_OUT_VENDOR)/etc/device_features.xml

# 恢复模式配置
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.dagu.rc:root/init.recovery.dagu.rc