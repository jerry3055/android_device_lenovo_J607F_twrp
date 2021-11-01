#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lenovo/J607F

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := J607F

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 1006653296 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# A/B
AB_OTA_UPDATER := true
TW_INCLUDE_REPACKTOOLS := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.console=ttyMSM0 \
                        androidboot.hardware=qcom \
                        androidboot.memcg=1 \
                        lpm_levels.sleep_disabled=1 \
                        video=vfb:640x400,bpp=32,memsize=3072000 \
                        msm_rtb.filter=0x237 \
                        service_locator.enable=1 \
                        androidboot.usbcontroller=a600000.dwc3 \
                        swiotlb=2048 \
                        cgroup.memory=nokmem,nosocket \
                        loop.max_part=7 
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00008000
BOARD_DTB_SIZE:= 2017086
BOARD_DTB_OFFSET:= 0x01f00000
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_CMDLINE += androidboot.fastboot=1 \
                        twrpfastboot=1
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/lenovo/J607F
TARGET_KERNEL_CONFIG := vendor/lito_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r353983c

# Platform
TARGET_BOARD_PLATFORM := lito
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true

# A/B OTA
AB_OTA_UPDATER := true
BOARD_USES_RECOVERY_AS_BOOT := true
#BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

PRODUCT_ENFORCE_VINTF_MANIFEST := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
#BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 1000663296

# Dynamic/Logical Partitions
BOARD_LENOVO_DYNAMIC_PARTITIONS_PARTITION_LIST := product system system_ext vendor
BOARD_LENOVO_DYNAMIC_PARTITIONS_SIZE := 6442450944
BOARD_SUPER_PARTITION_GROUPS := lenovo_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 10737418240

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe

# Extras
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true







#加解密
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true
USE_FSCRYPT := true







# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXTRA_LANGUAGES := true
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
BOARD_HAS_FLIPPED_SCREEN:= true
TW_DEFAULT_BRIGHTNESS := 155 # 设置最低亮度
TW_EXTRA_LANGUAGES := ture # 设置是否添加亚洲语言
TW_IGNORE_MISC_WIPE_DATA := true # 是否在 wipe data 时忽略 misc
TW_SCREEN_BLANK_ON_BOOT := true # 这个我也不知道什么作用
TW_NO_EXFAT_FUSE := true # 这个我也不知道什么作用
#TW_INCLUDE_CRYPTO := true #是否添加加密支持
#TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw # 解密所需依赖的源码路径
RECOVERY_SDCARD_ON_DATA := true # 设置内部存储的数据是否在 data 分区
BOARD_HAS_NO_REAL_SDCARD := true # 这个我也不知道什么作用
BOARD_PROVIDES_GPTUTILS := true # 这个我也不知道什么作用
TW_USE_TOOLBOX := true # 是否使用 ToolBox
TARGET_USES_LOGD := true
TWRP_EVENT_LOGGING := true
TWRP_INCLUDE_LOGCAT := true

TW_RECOVERY_ADDITIONAL_RELINK_BINARY_FILES += \
    $(TARGET_OUT_EXECUTABLES)/ashmemd
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.base@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpcrecpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so
    
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd

