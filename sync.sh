#!/bin/bash
# Set default values for device and command
DEVICE="${1:-all}"  # If no value is provided, default to "all"
COMMAND="${2:-build}"  # If no value is provided, default to "build"
DELZIP="${3}"
echo $PWD
echo $PWD

# Update and install ccache
sudo apt-get update -y
sudo apt-get install -y apt-utils
sudo apt-get install -y ccache
export USE_CCACHE=1
ccache -M 100G
export CCACHE_DIR=/tmp/src/android/cc
echo $CCACHE_DIR
## Remove existing build artifactsa
if [ "$DELZIP" == "delzip" ]; then
    rm -rf out/target/product/*/*.zip
fi

#git clean -fdX
rm -rf frameworks/base/
rm -rf .repo/local_manifests
rm -rf device/lge/
#rm -rf kernel/lge/msm8996
mkdir -p .repo/local_manifests
cp scripts/roomservice.xml .repo/local_manifests
repo sync -c -j16 --force-sync --no-clone-bundle --no-tags
#wget -O a.py https://raw.githubusercontent.com/xc112lg/crdroid10.1/main/a.py
chmod +x scripts/export.sh
#python3 a.py
source scripts/fixes.sh
source scripts/export.sh
source build/envsetup.sh


# Check if command is "clean"
if [ "$COMMAND" == "clean" ]; then
    echo "Cleaning..."
    m clean
fi

# Check if device is set to "all"
if [ "$DEVICE" == "all" ]; then
    echo "Building for all devices..."
    m installclean
    lunch lineage_us997-userdebug
    export DEVICE="us997"
    m -j16 bacon
    lunch lineage_h870-userdebug
export DEVICE="h870"
    m -j16 bacon
    lunch lineage_h872-userdebug
export DEVICE="h872"
    m -j16 bacon
 
elif [ "$DEVICE" == "h872" ]; then
    echo "Building for h872..."
    lunch lineage_h872-userdebug
    m -j16 bacon
else
    echo "Building for the specified device: $DEVICE..."
    # Build for the specified device
    lunch "$DEVICE"
    m -j16 bacon
fi