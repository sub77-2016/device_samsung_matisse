#
# Copyright (C) 2013 The CyanogenMod Project
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
#

#
# This file is the build configuration for a full Android
# build for matisse hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and matisse, hence its name.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from our omni product configuration
$(call inherit-product, vendor/omni/config/common_tablet.mk)

# Pull in GSM-specific stuff such as APNs
#$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from matisse device
$(call inherit-product, device/samsung/matisse/device_matisse.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := matisse
PRODUCT_NAME := omni_matisse
PRODUCT_BRAND := samsung
PRODUCT_MODEL := matisse
PRODUCT_MANUFACTURER := samsung

