#!/bin/bash
# ANDROID_SIMPLE_LMK conflicts with MEMCG and PSI;
# this script disables CONFIG_ANDROID_SIMPLE_LMK in favor of
# the standard Android memory management scheme using lmkd, MEMCG, and PSI.
scripts/config --file arch/arm64/configs/${DEVICE}_defconfig \
    -e CONFIG_PSI \
    -e CONFIG_MEMCG \
    -e CONFIG_MEMCG_SWAP \
    -d CONFIG_PSI_DEFAULT_DISABLED \
    -d CONFIG_ANDROID_SIMPLE_LMK \
    -d CONFIG_ANDROID_LOW_MEMORY_KILLER \
    \
    -e CONFIG_BINFMT_MISC \
    -d CONFIG_KSU
# Also enable BINFMT_MISC and disable KSU
