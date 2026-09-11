set(GCC_PASS2_VERSION 15.2.0)
set(GCC_PASS2_URL "https://ftp.gnu.org/gnu/gcc/gcc-${GCC_PASS2_VERSION}/gcc-${GCC_PASS2_VERSION}.tar.xz")
set(GCC_PASS2_SHA256 "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e")
set(GCC_PASS2_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/build")

akrogon_package(
	gcc-pass2
	URL "${GCC_PASS2_URL}"
	URL_HASH "SHA256=${GCC_PASS2_SHA256}"

	PATCH
		"${CMAKE_CURRENT_SOURCE_DIR}/akrogon-libdir.patch"

	DEPENDS
		gcc-cross
		libstdcxx

	CONFIGURE_COMMAND
		${CMAKE_COMMAND} -E env
			PATH=${AKROGON_TOOLS}/bin:$ENV{PATH}
			<SOURCE_DIR>/configure
			--build=${AKROGON_BUILD_TRIPLE}
			--host=${AKROGON_BUILD_TRIPLE}
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
			--disable-nls
			--disable-multilib
			--disable-libatomic
			--disable-libgomp
			--disable-libquadmath
			--disable-libssp
			--disable-libsanitizer
			--disable-libvtv
			--enable-languages=c,c++
			LDFLAGS_FOR_TARGET=-L${AKROGON_TOOLS}/lib/gcc/${AKROGON_TARGET_TRIPLE}/15.2.0

	BUILD_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    -j 1
	    CFLAGS="-O0"
	    CXXFLAGS="-O0"
	
	INSTALL_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    install
)

