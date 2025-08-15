#$(call inherit-product, device/lenovo/TB350FU/guipatch.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from TB350FU device
$(call inherit-product, device/lenovo/TB350FU/device.mk)

PRODUCT_DEVICE := TB350FU
PRODUCT_NAME := twrp_TB350FU
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := TB350FU
PRODUCT_MANUFACTURER := lenovo

PRODUCT_GMS_CLIENTID_BASE := android-lenovo

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/etc/recovery.fstab:recovery/root/system/etc/recovery.fstab

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ZUIPadLteROWLGSIU-user 12 UP1A.231005.007 305 release-keys"

BUILD_FINGERPRINT := None
