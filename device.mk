# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

LOCAL_PATH := device/lenovo/TB350FU

# A/B
ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    dtbo \
    system \
    product \
    system_ext \
    boot \
    vendor \
    vendor_boot \
    vendor_dlkm \
    vbmeta \
    vbmeta_vendor \
    vbmeta_system 
    

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \
    bootctrl.mt6789 \
    bootctrl.mt6789.recovery \
    android.hardware.boot@1.0-service
    
PRODUCT_PACKAGES += \
    bootctrl \
    bootctrl.recovery 

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# MTK plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Keystore Hal
PRODUCT_PACKAGES += \
    android.system.keystore2

 Security
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
	android.hardware.security.secureclock \
    android.hardware.security.sharedsecret
	
# Drm
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1

# Additional target Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    update_engine_client

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1.so