set(MPC_VERSION 1.3.1)
set(MPC_URL "https://ftpmirror.gnu.org/gnu/mpc/mpc-${MPC_VERSION}.tar.gz")
set(MPC_SHA256 "ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8")
set(MPC_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/build")

set(MPC_LIBS "-lmpfr -lgmp")
set(MPC_CPPFLAGS "-I${AKROGON_TOOLS}/include")
set(MPC_LDFLAGS "-L${AKROGON_TOOLS}/lib")

akrogon_package(
	mpc
	URL "${MPC_URL}"
	URL_HASH "SHA256=${MPC_SHA256}"

	DEPENDS gmp
	    mpfr

	CONFIGURE_COMMAND
	    <SOURCE_DIR>/configure
	    --build=${AKROGON_TARGET_TRIPLE}
	    --prefix=${AKROGON_TOOLS}
	    --with-sysroot=${AKROGON_SYSROOT}
	    CPPFLAGS=${MPC_CPPFLAGS}
	    LDFLAGS=${MPC_LDFLAGS}
	    LIBS=${MPC_LIBS}

	BUILD_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    -j
	
	INSTALL_COMMAND
	    ${CMAKE_MAKE_PROGRAM}
	    install
)

