#!/bin/bash

rm -rf external/chromium-webview/prebuilt/*
rm -rf .repo/projects/external/chromium-webview/prebuilt/*.git
rm -rf .repo/project-objects/LineageOS/android_external_chromium-webview_prebuilt_*.git



repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs
rm -rf lineage_build_unified
git clone https://github.com/spayke3/lineage_build_unified lineage_build_unified -b patch-2
rm -rf lineage_patches_unified
git clone https://github.com/spayke3/lineage_patches_unified lineage_patches_unified -b patch-2

#git clone https://github.com/AndyCGYan/lineage_build_unified lineage_build_unified -b lineage-21-td
#git clone https://github.com/AndyCGYan/lineage_patches_unified lineage_patches_unified -b lineage-21-td

bash lineage_build_unified/buildbot_unified.sh treble A64VN
