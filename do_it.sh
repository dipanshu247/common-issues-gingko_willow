#!/bin/bash

# 1. Clean up old files
echo "Cleaning up old files..."
rm -rf .repo/local_manifests
rm -rf {device,vendor,kernel,hardware}/xiaomi
echo "Old files cleaned."

# 3. Resync the repository
echo "Resyncing repository..."
/opt/crave/resync.sh
echo "Repository resynced."

# 4. Clone device-specific repositories
echo "Cloning device repositories..."
git clone https://github.com/LineageOS/android_device_xiaomi_ginkgo -b lineage-20 device/xiaomi/ginkgo
git clone https://github.com/Wrdn28/vendor_xiaomi_ginkgo -b lineage-20 vendor/xiaomi/ginkgo
git clone https://github.com/kutemeikito/android_kernel_xiaomi_ginkgo.git -b fourteen/main kernel/xiaomi/ginkgo
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-20 hardware/xiaomi
echo "Device repositories cloned."

git clone https://github.com/LineageOS/android_device_xiaomi_sm6125-common.git device/xiaomi/sm6125-common/


# 5. Set environment variables
echo "Setting environment variables..."
export BUILD_USERNAME=Dipanshu247
export BUILD_HOSTNAME=crave
export TZ="Asia/New Delhi"
echo "Environment variables set."

# 6. Setup the build environment
echo "Setting up build environment..."
source build/envsetup.sh
echo "Build environment setup."

# 7. Select the build target
echo "Selecting build target..."
lunch lineage_ginkgo-userdebug
echo "Build target selected."

# 8. Start the build
echo "Starting the build..."
mka bacon
echo "Build complete!"
