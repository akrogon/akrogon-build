set(GLIBC_VERSION 2.42)
set(GLIBC_URL "https://ftpmirror.gnu.org/gnu/glibc/glibc-${GLIBC_VERSION}.tar.xz")
set(GLIBC_SHA256 "d1775e32e4628e64ef930f435b67bb63af7599acb6be2b335b9f19f16509f17f")
set(GLIBC_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/build")

file(MAKE_DIRECTORY "{GLIBC_BUILD_DIR}")
file(WRITE
	"${GLIBC_BUILD_DIR}/configparams"
	"rootsbindir=/sbin\n"
)

akrogon_package(glibc
	URL "${GLIBC_URL}"
	URL_HASH "SHA256=${GLIBC_SHA256}"

	DEPENDS gcc
		linux-headers
	
	CONFIGURE_COMMAND
		<SOURCE_DIR>/configure
		--prefix=/
		--build=${AKROGON_BUILD_TRIPLE}
		--host=${AKROGON_TARGET_TRIPLE}
		--disable-nscd
		--disable-werror
		--enable-kernel=5.4
		libc_cv_slibdir=/lib
		CC=${AKROGON_TARGET_CC}
		BUILD_CC=${AKROGON_BUILD_CC}

	BUILD_COMMAND
		${CMAKE_MAKE_PROGRAM}
	
	INSTALL_COMMAND
		${CMAKE_MAKE_PROGRAM}
		DESTDIR=${AKROGON_SYSROOT}
		install
)
