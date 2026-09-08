cmake_minimum_required(VERSION 3.25)

project(akrogon-stage0 NONE)

include(conf/default.cmake)

if (EXISTS "conf/local.cmake")
	message(STATUS "Including local configuration...")
	include(conf/local.cmake)
endif()

set(AKROGON_STAGE 0)
set(AKROGON_SYSROOT "${CMAKE_CURRENT_SOURCE_DIR}/sysroot")
set(AKROGON_TOOLS "${CMAKE_CURRENT_SOURCE_DIR}/tools")
set(AKROGON_DISTFILES "${CMAKE_CURRENT_SOURCE_DIR}/distfiles")

set(AKROGON_BUILD_CC "${CMAKE_C_COMPILER}")
set(AKROGON_TARGET_CC "${AKROGON_TOOLS}/bin/${AKROGON_TARGET_TRIPLE}-gcc")

message(STATUS "Akrogon Stage: ${AKROGON_STAGE}")
message(STATUS "Akrogon Sysroot: ${AKROGON_SYSROOT}")
message(STATUS "Akrogon Tools: ${AKROGON_TOOLS}")
message(STATUS "Akrogon Distfiles: ${AKROGON_DISTFILES}")
message(STATUS "Building Akrogon on: ${AKROGON_BUILD_TRIPLE}")
message(STATUS "Targeting Akrogon to: ${AKROGON_TARGET_TRIPLE}")

file(MAKE_DIRECTORY
	"${AKROGON_SYSROOT}"
	"${AKROGON_TOOLS}"
	"${AKROGON_DISTFILES}"
)

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/Akrogon.cmake")

add_subdirectory(packages/binutils)
add_subdirectory(packages/gmp)
add_subdirectory(packages/mpfr)
add_subdirectory(packages/mpc)
add_subdirectory(packages/linux-headers)
add_subdirectory(packages/gcc-bootstrap)
add_subdirectory(packages/glibc)

