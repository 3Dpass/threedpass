#!/bin/bash
# To run ./scriptFile arm64-v8a x86 etc

echo "Build for Android"
APP_ABI="android-21"
OUTPUT_DIR=${PWD}
NDK_ROOT="~/Android/Sdk/ndk/21.3.6528147" # $(locate ndk-bundle | head -1)
echo "NDK_ROOT=$NDK_ROOT"
PATHI=$PATH
if [ ! -d "OpenBLAS" ]; then
git clone https://github.com/xianyi/OpenBLAS.git
fi

if [ -d "OpenBLAS" ]; then
cd OpenBLAS
else
echo "Could not find OpenBLAS directory"
exit -1
fi
#architectureList=(armeabi armv7a arm64-v8a mips mips64 arm64-v8a x86 x86_64 )
architectureList=("$@")
for architecture in ${architectureList[@]}; do
echo ${architecture}
case ${architecture} in
"armeabi")
target="ARMV5"
arch="arch-arm"
CCFolder="arm-linux-androideabi-4.9"
CC="arm-linux-androideabi-gcc"
;;
"armv7a")
target="ARMV7"
arch="arch-arm"
CCFolder="arm-linux-androideabi-4.9"
CC="arm-linux-androideabi-gcc"
;;
"arm64-v8a")
target="ARMV8 BINARY=64"
arch="arch-arm64"
CCFolder="aarch64-linux-android-4.9"
CC="aarch64-linux-android-gcc"
;;
"mips")
target="LOONGSON3A"
arch="arch-mips"
CCFolder="mipsel-linux-android-4.9"
CC="mipsel-linux-android-gcc" ;;
"mips64")
target="LOONGSON3A BINARY=64"
arch="arch-mips64"
CCFolder="mips64el-linux-android-4.9"
CC="mips64el-linux-android-gcc" ;;
"x86")
target="ATOM"
arch="arch-x86"
CCFolder="x86-4.9"
CC="i686-linux-android-gcc"
;;
"x86_64")
target="ATOM BINARY=64"
arch="arch-x86_64"
CCFolder="x86_64-4.9"
CC="x86_64-linux-android-gcc" ;;
*)
echo "UNKNOWN"
continue
;;
esac

echo ${NDK_ROOT}/toolchains/${CCFolder}/prebuilt/linux-x86_64/bin
export PATH=${NDK_ROOT}/toolchains/${CCFolder}/prebuilt/linux-x86_64/bin:${PATHI}
command="make TARGET=${target} HOSTCC=gcc CC=${CC} NOFORTRAN=1 CFLAGS=--sysroot=${NDK_ROOT}/platforms/${APP_ABI}/${arch}"

echo $command
mkdir -p ../${architecture}
make clean
$command
make PREFIX=${OUTPUT_DIR}/${architecture} install
mv ${OUTPUT_DIR}/${architecture}/lib/*.a ${OUTPUT_DIR}/${architecture}/
rm -rf ${OUTPUT_DIR}/${architecture}/lib
rm -rf ${OUTPUT_DIR}/${architecture}/bin
if [ ! -d "${OUTPUT_DIR}/include" ]; then
mv ${OUTPUT_DIR}/${architecture}/include ${OUTPUT_DIR}/
else
rm -rf ${OUTPUT_DIR}/${architecture}/include
fi

done
