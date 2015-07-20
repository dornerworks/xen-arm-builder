#!/bin/sh -ex

case $BOARD in
cubieboard2) TARG=Cubieboard2_config ;;
cubietruck) TARG=Cubietruck_config ;;
*) echo Unknown board $BOARD; exit 1;;
esac

cp config/Cubietruck_defconfig u-boot/configs/Cubietruck_defconfig
cd u-boot
BUILD_DIR=$(pwd)/build-$BOARD
make O=$BUILD_DIR CROSS_COMPILE=arm-linux-gnueabihf- $TARG
make O=$BUILD_DIR CROSS_COMPILE=arm-linux-gnueabihf- -j 4
