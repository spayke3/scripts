#!/bin/bash

repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs
rm -rf lineage_build_unified
git clone https://github.com/spayke3/lineage_build_unified lineage_build_unified -b patch-1
git clone https://github.com/AndyCGYan/lineage_patches_unified lineage_patches_unified -b lineage-21-td

bash lineage_build_unified/buildbot_unified.sh treble A64VN
