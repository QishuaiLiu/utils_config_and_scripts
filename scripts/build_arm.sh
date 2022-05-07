#! /usr/bin/zsh


## build python3 in arm andorid, change some variables for other arm board
#
#define TOOLCHINA first
export TOOLCHINA=where/toolchain/at

export PATH=$PATH:$TOOLCHINA/bin                                                                                        
export CC=$TOOLCHINA/bin/aarch64-linux-android-gcc 
export CXX=$TOOLCHINA/bin/aarch64-linux-android-g++ 
export RANLIB=$TOOLCHINA/bin/aarch64-linux-android-ranlib 
export AR=$TOOLCHINA/bin/aarch64-linux-android-ar 
export LD=$TOOLCHINA/bin/aarch64-linux-android-ld 
export STRIP=$TOOLCHINA/bin/aarch64-linux-android-strip

../configure --build=x86-linux-gnu --disable-ipv6 \
	 ac_cv_file__dev_ptmx=no \
	 ac_cv_file__dev_ptc=no \
	 --enable-optimizations \
	--host=aarch64-linux-android \
	--enable-loadable-sqlite-extensions \
	--enable-option-checking=fatal \
	--enable-shared \
	--with-system-expat \
  --with-system-ffi \
  --without-ensurepip

