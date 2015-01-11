#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

USE_CAMERA_STUB := true
#BOARD_CAMERA_USE_GETBUFFERINFO := true
#BOARD_USE_FROYO_LIBCAMERA := true
#BOARD_USE_CAF_LIBCAMERA := false

# inherit from common msm8226-common
-include device/samsung/msm8226-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/matisse

# Assert
#TARGET_OTA_ASSERT_DEVICE := matissewifi

# Kernel
#TARGET_KERNEL_SOURCE := kernel/samsung/matissewifi
#TARGET_KERNEL_CONFIG := twrp_matissewifi_defconfig
#TARGET_KERNEL_VARIANT_CONFIG := msm8226-twrp_matissewifi_defconfig

TARGET_KERNEL_SOURCE := kernel/samsung/ms013g
TARGET_KERNEL_CONFIG := msm8226-sec_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8226-sec_matissewifi_defconfig
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg-matissewifi.mk

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_matisse.c
TARGET_UNIFIED_DEVICE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 19485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1866465280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5555010560
BOARD_CACHEIMAGE_PARTITION_SIZE := 218103808
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Radio
#BOARD_RIL_CLASS := ../../../device/samsung/matisse/ril/

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/matisse

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

#TARGET_PREBUILT_KERNEL := device/samsung/matisse/kernel_matissewifi

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom

#TWRP
TW_USE_TOOLBOX := true
DEVICE_RESOLUTION := 1280x800
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := /sys/class/backlight/lcd-backlight/brightness
#TW_MAX_BRIGHTNESS := 126
TW_IGNORE_MAJOR_AXIS_0 := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_SCREEN_BLANK := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
BOARD_HAS_NO_REAL_SDCARD := false
RECOVERY_SDCARD_ON_DATA := true
HAVE_SELINUX := true
TW_INCLUDE_L_CRYPTO := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/matisse/kernel_matissewifi
RECOVERY_SDCARD_ON_DATA := true 
BOARD_HAS_NO_REAL_SDCARD := true
SP1_NAME := "pds"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1

PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

#MultiROM config. MultiROM also uses parts of TWRP config
#MR_INPUT_TYPE := type_b
#MR_INIT_DEVICES := device/motorola/falcon/init/mr_init_devices.c
#MR_DPI := hdpi
#MR_DPI_FONT := 160
#MR_FSTAB := $(LOCAL_PATH)/twrp.fstab
#MR_KEXEC_MEM_MIN := 0x05000000
#MR_KEXEC_DTB := true
#MR_INFOS := device/motorola/falcon/mrom_infos
#MR_CONTINUOUS_FB_UPDATE := true

# Enable dex-preoptimization to speed up first boot sequence
#ifeq ($(HOST_OS),linux)
#ifeq ($(TARGET_BUILD_VARIANT),user)
#ifeq ($(WITH_DEXPREOPT),)
#WITH_DEXPREOPT := true
#WITH_DEXPREOPT_BOOT_IMG_ONLY := false
#endif
#endif
#endif
#WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true

# inherit from the proprietary version
-include vendor/samsung/matisse/BoardConfigVendor.mk
