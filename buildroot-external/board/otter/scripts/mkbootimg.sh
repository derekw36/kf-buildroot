#!/bin/sh

# Script to create a boot.img from buildroot-generated kernel image.
# boot.img can then be used to flash to the boot partition with TWRP.
# Note this depends on BR2_PACKAGE_HOST_MKBOOTIMG! But there's no way
# for this script to depend on that, so just make sure it's in your
# buildroot config. This script will do nothing if it's not there.

MKBOOTIMG="$HOST_DIR/bin/mkbootimg"
KERNEL_IMAGE="zImage.omap4-kc1"
BOOTIMG_NAME="boot.img"

if [ ! -f $MKBOOTIMG ]; then
    echo "mkbootimg not built, add \"BR2_PACKAGE_HOST_MKBOOTIMG=y\" to your config!"
    exit 1
fi

if [ ! -f $BINARIES_DIR/$KERNEL_IMAGE ]; then
    echo "$KERNEL_IMAGE doesn't exist in $BINARIES_DIR, exiting"
    exit 1
fi

$MKBOOTIMG --kernel $BINARIES_DIR/$KERNEL_IMAGE \
    --pagesize 4096 --base 0x80000000 \
    -o $BINARIES_DIR/$BOOTIMG_NAME

RET=$?
if [ $RET -eq 0 ]; then
    echo "$BOOTIMG_NAME created successfully!"
    exit 0
else
    echo "mkbootimg failed, ret=$RET"
    exit $RET
fi
