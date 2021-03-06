#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

# Add BlackShark things
cp -fpr $thispath/lib/* $1/lib/
cp -fpr $thispath/lib64/* $1/lib64/
cp -fpr $thispath/etc/* $1/etc/
cp -fpr $thispath/bin/* $1/bin/
cp -fpr $thispath/product/* $1/product/

# Force provision on build.prop and forceprovision.rc
echo "DEVICE_PROVISIONED=1" >> $1/build.prop

# Set locale to en-US
sed -i 's/zh-CN/en-US/g' $1/build.prop

# Custom Manifest   
python $thispath/../../../scripts/custom_manifest.py $thispath/../../../tmp/manifest.xml $thispath/manifest.xml $1/etc/vintf/manifest.xml
cp -fpr $thispath/../../../tmp/manifest.xml $1/etc/vintf/manifest.xml

# Blackshark Q FOD Workaround
echo "ro.hardware.fp.fod=true" >> $1/build.prop
echo "persist.vendor.sys.fp.fod.location.X_Y=445,1260" >> $1/build.prop
echo "persist.vendor.sys.fp.fod.size.width_height=190,190" >> $1/build.prop
echo "DEVICE_PROVISIONED=1" >> $1/build.prop
