set(BINUTILS_VERSION 2.45)
set(BINUTILS_URL "https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VERSION}.tar.xz")
set(BINUTILS_SHA256 "c50c0e7f9cb188980e2cc97e4537626b1672441815587f1eab69d2a1bfbef5d2")
set(BINUTILS_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/build")

akrogon_package(
	binutils
	URL "${BINUTILS_URL}"
	URL_HASH "SHA256=${BINUTILS_SHA256}"

	CONFIGURE_COMMAND
	    <SOURCE_DIR>/configure
	    --target=${AKROGON_TARGET_TRIPLE}
	    --prefix=${AKROGON_TOOLS}
	    --with-sysroot=${AKROGON_SYSROOT}
	    --disable-nls
	    --disable-werror

	BUILD_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    -j
	
	INSTALL_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    install
)
