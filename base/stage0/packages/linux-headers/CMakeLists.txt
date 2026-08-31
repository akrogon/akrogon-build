set(LINUX_VERSION "6.18.48")
set(LINUX_URL
	"https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${LINUX_VERSION}.tar.xz"
)

set(LINUX_SHA256 "5ebdadb10a4b5708fc6b1c457764a110bc49f8150cc3502c59b921ead8c6fc8c")

ExternalProject_Add(
	akrogon-linux-headers
	URL "${LINUX_URL}"
	URL_HASH "SHA256=${LINUX_SHA256}"

	PREFIX "${CMAKE_CURRENT_BINARY_DIR}/linux"
	DOWNLOAD_DIR "${AKROGON_DISTFILES}"

	CONFIGURE_COMMAND ""

	BUILD_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    -C <SOURCE_DIR>
	    headers_install
	    INSTALL_HDR_PATH=${AKROGON_SYSROOT}
	
	INSTALL_COMMAND ""
)
