#!/bin/bash

SYSROOT_PATH="/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/usr"
CROSS_PATH="/opt/gcw0-toolchain/usr"
export PATH="$CROSS_PATH/bin:$SYSROOT_PATH/bin:$PATH"

rm --one-file-system -rf build
mkdir -p build &&
cd build && \
PKG_CONFIG_PATH="$CROSS_PATH/bin/pkgconfig" PKG_CONFIG_LIBDIR="$SYSROOT_PATH/lib/pkgconfig" PATH="$CROSS_PATH/bin:$SYSROOT_PATH/bin:$PATH" CPPFLAGS="-I$CROSS_PATH/include" LDFLAGS="-L$CROSS_PATH/lib" ../../configure --host=mipsel-gcw0-linux-uclibc --disable-jack --with-sdl-prefix="$SYSROOT_PATH" && \
make -j4 V=0 && \
cd ..