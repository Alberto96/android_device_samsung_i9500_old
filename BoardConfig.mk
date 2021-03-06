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

LOCAL_PATH := device/samsung/i9500

BOARD_VENDOR := samsung

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := ja3g,i9500,GT-I9500

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := universal5410
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_SOC := exynos5410
TARGET_SLSI_VARIANT := insignal

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_ARCH_VARIANT_FPU := neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a15

# Enable QC's libm optimizations
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := cyanogenmod_i9500_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/exynos5410
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a15 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a15 -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Audio
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
BOARD_NEEDS_MEMORYHEAPION := true
TARGET_NEED_CAMERA_ZSL := true
TARGET_NEED_SAMSUNG_MAGIC_ZSL_1508 := true
TARGET_ADD_ISO_MODE_1600 := true
TARGET_ADD_ISO_MODE_HJR := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_DVFS
COMMON_GLOBAL_CFLAGS += -DUSE_CHAR_BUFFERS
COMMON_GLOBAL_CFLAGS += -DUSE_CONVERT_WITH_ROTATE

# Support RSC on PVR
BOARD_USES_PVR_RSC := true

# Samsung OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_CSC_HW := false
BOARD_USE_H264_PREPEND_SPS_PPS := false
BOARD_USE_QOS_CTRL := false

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_NEON_BLITANTIH := true

#G3D
#[HACK] Currently, SGX supports only HAL_PIXEL_FORMAT_BGRA_8888.
BOARD_USE_BGRA_8888 := true

# [HACK] It will be removed after updating s3c-fb driver.
BOARD_USE_WAIT_DEQUEUE_FENCE := false

# [HACK] It will be removed after implementing FENCE SYNC.
BOARD_USE_FENCE_SYNC := true

#SurfaceFlinger
BOARD_USES_SYNC_MODE_FOR_MEDIA := true

# HWCServices
BOARD_USES_HWC_SERVICES := true
BOARD_USES_PRESENTATION_SUBTITLES := true
BOARD_USES_CEC := true

# FIMD
BOARD_USES_FB_PHY_LINEAR := false

# bionic libc options
ARCH_ARM_USE_MEMCPY_ALIGNMENT := true
BOARD_MEMCPY_ALIGNMENT := 64
BOARD_MEMCPY_ALIGN_BOUND := 32768

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
BOARD_EGL_WORKAROUND_BUG_10194508 := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 5

# Media
COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED # use format from fw/native

# Sensors
SENSORS_NEED_SETRATE_ON_ENABLE := true

# NFC
BOARD_NFC_HAL_SUFFIX := universal5410

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Radio
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6360

# Wifi
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4335
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                        := 802_11_ABG

# Webkit
ENABLE_WEBGL := true

# Filesystems
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2898264064
BOARD_USERDATAIMAGE_PARTITION_SIZE := 9604956160
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_FLASH_BLOCK_SIZE := 4096
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.universal5410
RECOVERY_FSTAB_VERSION := 2
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := battery

# Releasetools
#TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)

# inherit from the proprietary version
-include vendor/samsung/i9500/BoardConfigVendor.mk
