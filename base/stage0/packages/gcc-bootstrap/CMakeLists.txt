set(GCC_VERSION 15.2.0)
set(GCC_URL "https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.xz")
set(GCC_SHA256 "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e")
set(GCC_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/build")

akrogon_package(
	gcc
	URL "${GCC_URL}"
	URL_HASH "SHA256=${GCC_SHA256}"

	PATCH
		"${CMAKE_CURRENT_SOURCE_DIR}/akrogon-libdir.patch"

	DEPENDS
	    binutils
	    gmp
	    mpfr
	    mpc

	CONFIGURE_COMMAND
	    <SOURCE_DIR>/configure
	    --target=${AKROGON_TARGET_TRIPLE}
	    --prefix=${AKROGON_TOOLS}
	    --with-sysroot=${AKROGON_SYSROOT}
	    --with-native-system-header-dir=/include
	    --with-gmp-include=${AKROGON_TOOLS}/include
	    --with-gmp-lib=${AKROGON_TOOLS}/lib
	    --with-mpfr-include=${AKROGON_TOOLS}/include
	    --with-mpfr-lib=${AKROGON_TOOLS}/lib
	    --with-mpc-include=${AKROGON_TOOLS}/include
	    --with-mpc-lib=${AKROGON_TOOLS}/lib
	    --with-newlib
	    --without-headers
	    --enable-languages=c,c++
	    --disable-libstdcxx
	    --disable-shared
	    --disable-threads
	    --disable-multilib
	    --disable-libatomic
	    --disable-libgomp
	    --disable-libquadmath
	    --disable-libssp
	    --disable-libvtv
	    --disable-nls
	    --disable-werror
	    --disable-bootstrap

	BUILD_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    -j 1
	    CFLAGS="-O0"
	    CXXFLAGS="-O0"
	
	INSTALL_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    install
)
