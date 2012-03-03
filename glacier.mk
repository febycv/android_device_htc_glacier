#
# Copyright (C) 2011 The CyanogenMod Project
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

# The gps config appropriate for this device
## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/glacier/init.glacier.rc:root/init.glacier.rc \
    device/htc/glacier/init.glacier.usb.rc:root/init.glacier.usb.rc \
    device/htc/glacier/ueventd.glacier.rc:root/ueventd.glacier.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/glacier/glacier-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Script for telling ICS boot is complete - needed for init.d support
PRODUCT_COPY_FILES += \
    device/htc/glacier/init.d/100complete:system/etc/init.d/100complete

# Nexus Prime bootanimation
PRODUCT_COPY_FILES += \
    device/htc/glacier/media/bootanimation.zip:system/media/bootanimation.zip

# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += \
persist.sys.strictmode.visual=0

DEVICE_PACKAGE_OVERLAYS += device/htc/glacier/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/glacier/voicemail-conf.xml:system/etc/voicemail-conf.xml

PRODUCT_PACKAGES += \
    lights.glacier \
    sensors.glacier \
    audio.a2dp.default \
    gps.glacier \
    hwcomposer.msm7x30 \
    gralloc.msm7x30 \
    copybit.msm7x30 \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libaudioutils \
    libtinyalsa \
    libcyanogen-dsp \
    com.android.future.usb.accessory \
    libQcomUI \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    librs_jni

# missing packages
PRODUCT_PACKAGES += \
    Mms \
    Stk \
    Superuser

# Live Wallpapers
PRODUCT_PACKAGES += \
	Basic \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
	MagicSmoke \
	NoiseField \
	PhaseBeam \
	LivePicker \
	HoloSpiral \
	Galaxy4 \
	DSPManager \
	Gallery2 \
	FileManager \
	Torch \
	CMSettings \
	Trebuchet \
	VoiceDialer


# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/glacier/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/glacier/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/glacier/keychars/spade-keypad.kcm.bin:system/usr/keychars/glacier-keypad.kcm.bin \
    device/htc/glacier/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/glacier/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/glacier/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/glacier/keylayout/glacier-keypad.kl:system/usr/keylayout/glacier-keypad.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/glacier/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/glacier/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/glacier/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/glacier/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/glacier/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/glacier/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/glacier/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/glacier/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/glacier/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/glacier/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/glacier/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/glacier/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/glacier/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/htc/glacier/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/glacier/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/glacier/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/glacier/dsp/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/glacier/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/glacier/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/glacier/dsp/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/glacier/dsp/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/glacier/dsp/SPK_Combination.csv:system/etc/SPK_Combination.csv \
    device/htc/glacier/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/glacier/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/glacier/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/glacier/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/glacier/dsp/soundimage/Sound_Dolby_A_HP.txt:system/etc/soundimage/Sound_Dolby_A_HP.txt \
    device/htc/glacier/dsp/soundimage/Sound_Dolby_A_SPK.txt:system/etc/soundimage/Sound_Dolby_A_SPK.txt \
    device/htc/glacier/dsp/soundimage/Sound_Dolby_V_HP.txt:system/etc/soundimage/Sound_Dolby_V_HP.txt \
    device/htc/glacier/dsp/soundimage/Sound_Dolby_V_SPK.txt:system/etc/soundimage/Sound_Dolby_V_SPK.txt \
    device/htc/glacier/dsp/soundimage/Sound_Dualmic.txt:system/etc/soundimage/Sound_Dualmic.txt \
    device/htc/glacier/dsp/soundimage/Sound_Dualmic_EP.txt:system/etc/soundimage/Sound_Dualmic_EP.txt \
    device/htc/glacier/dsp/soundimage/Sound_Dualmic_SPK.txt:system/etc/soundimage/Sound_Dualmic_SPK.txt \
    device/htc/glacier/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/glacier/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/glacier/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/glacier/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/glacier/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/glacier/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/glacier/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/glacier/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/glacier/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/glacier/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/glacier/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/glacier/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/glacier/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/glacier/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/glacier/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt \
    device/htc/glacier/dsp/gps.conf:/system/etc/gps.conf

# Additional NAM Audio DSP Profiles to NAM Package
PRODUCT_COPY_FILES += \
    device/htc/glacier/nam/default.acdb:system/etc/nam/default.acdb \
    device/htc/glacier/nam/default_org.acdb:system/etc/nam/default_org.acdb \
    device/htc/glacier/nam/AdieHWCodec.csv:system/etc/nam/AdieHWCodec.csv \
    device/htc/glacier/nam/AIC3254_REG_DualMic_MCLK.csv:system/etc/nam/AIC3254_REG_DualMic_MCLK.csv \
    device/htc/glacier/nam/CodecDSPID_MCLK.txt:system/etc/nam/CodecDSPID_MCLK.txt \
    device/htc/glacier/nam/Sound_Treble_Booster_MCLK.txt:system/etc/nam/Sound_Treble_Booster_MCLK.txt \
    device/htc/glacier/nam/Sound_Vocal_Booster_MCLK.txt:system/etc/nam/Sound_Vocal_Booster_MCLK.txt \
    device/htc/glacier/nam/Sound_SRS_A_SPK_MCLK.txt:system/etc/nam/Sound_SRS_A_SPK_MCLK.txt \
    device/htc/glacier/nam/Sound_SRS_V_HP_MCLK.txt:system/etc/nam/Sound_SRS_V_HP_MCLK.txt \
    device/htc/glacier/nam/Sound_SRS_V_SPK_MCLK.txt:system/etc/nam/Sound_SRS_V_SPK_MCLK.txt \
    device/htc/glacier/nam/Sound_Jazz_MCLK.txt:system/etc/nam/Sound_Jazz_MCLK.txt \
    device/htc/glacier/nam/Sound_Latin_MCLK.txt:system/etc/nam/Sound_Latin_MCLK.txt \
    device/htc/glacier/nam/Sound_New_Age_MCLK.txt:system/etc/nam/Sound_New_Age_MCLK.txt \
    device/htc/glacier/nam/Sound_Original_MCLK.txt:system/etc/nam/Sound_Original_MCLK.txt \
    device/htc/glacier/nam/Sound_Piano_MCLK.txt:system/etc/nam/Sound_Piano_MCLK.txt \
    device/htc/glacier/nam/Sound_Pop_MCLK.txt:system/etc/nam/Sound_Pop_MCLK.txt \
    device/htc/glacier/nam/Sound_R_B_MCLK.txt:system/etc/nam/Sound_R_B_MCLK.txt \
    device/htc/glacier/nam/Sound_Rock_MCLK.txt:system/etc/nam/Sound_Rock_MCLK.txt \
    device/htc/glacier/nam/Sound_SRS_A_HP_MCLK.txt:system/etc/nam/Sound_SRS_A_HP_MCLK.txt \
    device/htc/glacier/nam/Sound_Dualmic_SPK_MCLK.txt:system/etc/nam/Sound_Dualmic_SPK_MCLK.txt \
    device/htc/glacier/nam/Sound_Dualmic_EP_MCLK.txt:system/etc/nam/Sound_Dualmic_EP_MCLK.txt \
    device/htc/glacier/nam/Sound_Dualmic_MCLK.txt:system/etc/nam/Sound_Dualmic_MCLK.txt \
    device/htc/glacier/nam/Sound_Dolby_A_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_A_SPK_MCLK.txt \
    device/htc/glacier/nam/Sound_Dolby_HP_MCLK.txt:system/etc/nam/Sound_Dolby_HP_MCLK.txt \
    device/htc/glacier/nam/Sound_Dolby_Spk_MCLK.txt:system/etc/nam/Sound_Dolby_Spk_MCLK.txt \
    device/htc/glacier/nam/Sound_Dolby_V_HP_MCLK.txt:system/etc/nam/Sound_Dolby_V_HP_MCLK.txt \
    device/htc/glacier/nam/Sound_Dolby_V_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_V_SPK_MCLK.txt \
    device/htc/glacier/nam/Sound_Dolby_A_HP_MCLK.txt:system/etc/nam/Sound_Dolby_A_HP_MCLK.txt \
    device/htc/glacier/nam/Sound_Bass_Booster_MCLK.txt:system/etc/nam/Sound_Bass_Booster_MCLK.txt \
    device/htc/glacier/nam/Sound_Blues_MCLK.txt:system/etc/nam/Sound_Blues_MCLK.txt \
    device/htc/glacier/nam/Sound_Classical_MCLK.txt:system/etc/nam/Sound_Classical_MCLK.txt \
    device/htc/glacier/nam/Sound_Country_MCLK.txt:system/etc/nam/Sound_Country_MCLK.txt \
    device/htc/glacier/nam/gps.conf:system/etc/nam/gps.conf

PRODUCT_COPY_FILES += \
    device/htc/glacier/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/glacier/kernel/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/glacier/kernel/modules/qc_pcm_in.ko:system/lib/modules/qc_pcm_in.ko
#   device/htc/glacier/kernel/modules/cifs.ko:system/lib/modules/cifs.ko 
#   device/htc/glacier/kernel/modules/tun.ko:system/lib/modules/tun.ko

LOCAL_KERNEL := device/htc/glacier/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
#$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# High-density art, but English locale
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media profiles and capabilities spec
#$(call inherit-product, device/htc/glacier/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/glacier/media_htcaudio.mk)

#$(call inherit-product-if-exists, vendor/htc/glacier/glacier-vendor.mk)


# prop

PRODUCT_COPY_FILES += \
    device/htc/glacier/proprietary/libaudioalsa.so:obj/lib/libaudioalsa.so

# Proprietary files for glacier
PRODUCT_COPY_FILES += \
    device/htc/glacier/proprietary/akmd:/system/bin/akmd \
    device/htc/glacier/proprietary/bma150_usr:/system/bin/bma150_usr \
    device/htc/glacier/proprietary/htc_ebdlogd:/system/bin/htc_ebdlogd \
    device/htc/glacier/proprietary/logcat2:/system/bin/logcat2 \
    device/htc/glacier/proprietary/rmt_storage:/system/bin/rmt_storage \
    device/htc/glacier/proprietary/snd3254:/system/bin/snd3254 \
    device/htc/glacier/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \
    device/htc/glacier/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/htc/glacier/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/glacier/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/htc/glacier/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/htc/glacier/proprietary/libaudioalsa.so:/system/lib/libaudioalsa.so \
    device/htc/glacier/proprietary/libgemini.so:/system/lib/libgemini.so \
    device/htc/glacier/proprietary/libgsl.so:/system/lib/libgsl.so \
    device/htc/glacier/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
    device/htc/glacier/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \
    device/htc/glacier/proprietary/libmmipl.so:/system/lib/libmmipl.so \
    device/htc/glacier/proprietary/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
    device/htc/glacier/proprietary/libC2D2.so:/system/lib/libC2D2.so \
    device/htc/glacier/proprietary/libOpenVG.so:/system/lib/libOpenVG.so \
    device/htc/glacier/proprietary/libsc-a2xx.so:/system/lib/libsc-a2xx.so

# idc
PRODUCT_COPY_FILES += \
    device/htc/glacier/idc/synaptics-rmi-touchscreen.idc:/system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/glacier/idc/synaptics-rmi-touchscreen.idc:/system/usr/idc/atmel-touchscreen.idc

PRODUCT_NAME := htc_glacier
PRODUCT_DEVICE := glacier
PRODUCT_MODEL := HTC Glacier
PRODUCT_MANUFACTURER := HTC

PRODUCT_PROPERTY_OVERRIDES += \
 ro.telephony.ril.v3=signalstrength
