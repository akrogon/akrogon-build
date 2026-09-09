set(LIBSTDCXX_VERSION 15.2.0)
set(LIBSTDCXX_URL "https://ftp.gnu.org/gnu/gcc/gcc-${LIBSTDCXX_VERSION}/gcc-${LIBSTDCXX_VERSION}.tar.xz")
set(LIBSTDCXX_SHA256 "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e")
set(LIBSTDCXX_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/build")

akrogon_package(
	libstdcxx
	URL "${LIBSTDCXX_URL}"
	URL_HASH "SHA256=${LIBSTDCXX_SHA256}"

	DEPENDS
		glibc

	CONFIGURE_COMMAND
		${CMAKE_COMMAND} -E env
			CXX=${AKROGON_TARGET_CC}
			CC=${AKROGON_TARGET_CC}
			BUILD_CC=${AKROGON_BUILD_CC}
			<SOURCE_DIR>/libstdc++-v3/configure
			--with-gmp-include=${AKROGON_TOOLS}/include
			--with-gmp-lib=${AKROGON_TOOLS}/lib
			--with-mpfr-include=${AKROGON_TOOLS}/include
			--with-mpfr-lib=${AKROGON_TOOLS}/lib
			--with-mpc-include=${AKROGON_TOOLS}/include
			--with-mpc-lib=${AKROGON_TOOLS}/lib
			--host=${AKROGON_TARGET_TRIPLE}
			--build=${AKROGON_BUILD_TRIPLE}
			--target=${AKROGON_TARGET_TRIPLE}
			--prefix=/
			--disable-multilib
			--disable-nls
			--disable-libstdcxx-pch
			--with-gxx-include-dir=/include/c++/15.2.0

	BUILD_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	
	INSTALL_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    DESTDIR=${AKROGON_SYSROOT}
	    install
)

