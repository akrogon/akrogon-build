set(GMP_VERSION 6.3.0)
set(GMP_URL "https://ftp.gnu.org/gnu/gmp/gmp-${GMP_VERSION}.tar.xz")
set(GMP_SHA256 "a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898")
set(GMP_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/build")

akrogon_package(
	gmp
	URL "${GMP_URL}"
	URL_HASH "SHA256=${GMP_SHA256}"

	DEPENDS binutils

	CONFIGURE_COMMAND
	    <SOURCE_DIR>/configure
	    --build=${AKROGON_TARGET_TRIPLE}
	    --prefix=${AKROGON_TOOLS}
	    --with-sysroot=${AKROGON_SYSROOT}

	BUILD_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    -j
	
	INSTALL_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    install
)

