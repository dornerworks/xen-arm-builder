#!/bin/sh -ex

cp linux/arch/arm/boot/zImage FIT/vmlinuz
cp xen/xen/xen FIT/xen

dtc -I dts -O dtb -o FIT/sun7i-a20-cubietruck.dtb FIT/sun7i-a20-cubietruck.dts
dtc -I dts -O dtb -o FIT/xen.dtb FIT/xen.dts

mkimage -f cubietruck-xen.its cubietruck-xen.itb
