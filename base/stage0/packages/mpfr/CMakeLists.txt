set(MPFR_VERSION 4.2.2)
set(MPFR_URL "https://ftp.gnu.org/gnu/mpfr/mpfr-${MPFR_VERSION}.tar.xz")
set(MPFR_SHA256 "b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01")
set(MPFR_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/build")

akrogon_package(
	mpfr
	URL "${MPFR_URL}"
	URL_HASH "SHA256=${MPFR_SHA256}"

	DEPENDS gmp

	CONFIGURE_COMMAND
	    <SOURCE_DIR>/configure
	    --build=${AKROGON_BUILD_TRIPLE}
	    --prefix=${AKROGON_TOOLS}
	    --with-sysroot=${AKROGON_SYSROOT}

	BUILD_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    -j
	
	INSTALL_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    install
)


