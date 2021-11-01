
 #Copyright (C) 2021 The Android Open Source Project
 #Copyright (C) 2021 SebaUbuntu's TWRP device tree generator

 #SPDX-License-Identifier: Apache-2.0


LOCAL_PATH := device/lenovo/J607F
# A/B
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Apex libraries
PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/J607F/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so \
    $(OUT_DIR)/target/product/J607F/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libicui18n.so \
    $(OUT_DIR)/target/product/J607F/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libcuuc.so

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd \
    resetprop
    
# qcom decryption
PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe
    
 # Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
 
 # tzdata
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

    
# Apex libraries
PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so
    
#Boot control HAL
PRODUCT_PACKAGES += \
     android.hardware.boot@1.0-impl \
     android.hardware.boot@1.0-service\
     android.hardware.boot@1.0-impl-wrapper \
     android.hardware.boot@1.0-impl-recovery \
     android.hardware.boot@1.0-impl-wrapper.recovery 

PRODUCT_PACKAGES += \
    bootctrl.$(TARGET_BOARD_PLATFORM)\
    libgptutils \
    libz \
    libcutils
#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    bootctrl.$(TARGET_BOARD_PLATFORM) \
    
    
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# ADB Fix
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.ffs.aio_compat=true

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    persist.sys.usb.config=mtp \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.allow.mock.location=0
