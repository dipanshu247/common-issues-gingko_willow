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
