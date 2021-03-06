#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/samsung/i9500

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.universal5410 \
    init.universal5410.rc \
    init.universal5410.usb.rc \
    init.universal5410.wifi.rc \
    lpm.rc \
    ueventd.universal5410.rc

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.universal5410.rc

# Synapse Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/res/synapse:root/res/synapse \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate.io:root/res/synapse/config.json.generate.io \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate.qos:root/res/synapse/config.json.generate.qos \
    $(LOCAL_PATH)/rootdir/res/synapse/actions:root/res/synapse/actions \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/voltage:root/res/synapse/actions/voltage \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/gpuvolt:root/res/synapse/actions/gpuvolt \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/colour:root/res/synapse/actions/colour \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/cpuvolt:root/res/synapse/actions/cpuvolt \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/charge-source:root/res/synapse/actions/charge-source \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/bracket-option:root/res/synapse/actions/bracket-option \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/led:root/res/synapse/actions/led \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/generic.native:root/res/synapse/actions/generic.native \
    $(LOCAL_PATH)/rootdir/res/synapse/actions/generic:root/res/synapse/actions/generic \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate.cpu:root/res/synapse/config.json.generate.cpu \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate.battery:root/res/synapse/config.json.generate.battery \
    $(LOCAL_PATH)/rootdir/res/synapse/uci:root/res/synapse/uci \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate.audio:root/res/synapse/config.json.generate.audio \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate.gpu:root/res/synapse/config.json.generate.gpu \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate.led:root/res/synapse/config.json.generate.led \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate.screen:root/res/synapse/config.json.generate.screen \
    $(LOCAL_PATH)/rootdir/res/synapse/config.json.generate:root/res/synapse/config.json.generate \
    $(LOCAL_PATH)/rootdir/sbin/perseus.sh:root/sbin/perseus.sh


# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.universal5410 \
    audio.usb.default \
    mixer_paths.xml \
    tinymix

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bcm4335_prepatch.hcd:system/vendor/firmware/bcm4335_prepatch.hcd

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.exynos.cam.sh:system/etc/init.exynos.cam.sh

PRODUCT_PACKAGES += \
    camera.universal5410 \
    libhwjpeg

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# HW composer
PRODUCT_PACKAGES += \
    hwcomposer.exynos5 \
    libion

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/Atmel_maXTouch_Touchscreen.idc:system/usr/idc/Atmel_maXTouch_Touchscreen.idc \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Keystore
PRODUCT_PACKAGES += \
    keystore.exynos5

PRODUCT_TAGS += dalvik.gc.type-precise

# Lights
PRODUCT_PACKAGES += \
    lights.universal5410

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# MobiCore
PRODUCT_PACKAGES += \
    mcDriverDaemon

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    nfc_nci.universal5410 \
    NfcNci \
    Tag \
    com.android.nfc_extras

# IR packages
PRODUCT_PACKAGES += \
    consumerir.universal5410
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# NFCEE access control + configuration
NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access.xml
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# OMX
PRODUCT_PACKAGES += \
    libExynosOMX_Core \
    libOMX.Exynos.MPEG4.Decoder \
    libOMX.Exynos.AVC.Decoder \
    libOMX.Exynos.MPEG4.Encoder \
    libOMX.Exynos.AVC.Encoder \
    libstagefrighthw

# Radio
PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-client-sap

# Samsung
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Torch
PRODUCT_PACKAGES += \
    Torch

# Wifi
PRODUCT_PACKAGES += \
    libnetcmdiface \
    macloader

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# Props from Samsung ROM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10

# dex-opt to cache
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=0

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    wifi.interface=wlan0

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi xxhdpi

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/i9500/i9500-vendor.mk)
