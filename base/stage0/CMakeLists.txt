cmake_minimum_required(VERSION 3.25)

project(akrogon-stage0 NONE)

set(AKROGON_TARGET_TRIPLE
	"x86_64-akrogon-linux-gnu"
	CACHE STRING "Akrogon target triple"
)

set(AKROGON_STAGE 0)
set(AKROGON_SYSROOT "${CMAKE_CURRENT_SOURCE_DIR}/sysroot")
set(AKROGON_TOOLS "${CMAKE_CURRENT_SOURCE_DIR}/tools")
set(AKROGON_DISTFILES "${CMAKE_CURRENT_SOURCE_DIR}/distfiles")

message(STATUS "Akrogon Stage: ${AKROGON_STAGE}")
message(STATUS "Akrogon Sysroot: ${AKROGON_SYSROOT}")
message(STATUS "Akrogon Tools: ${AKROGON_TOOLS}")
message(STATUS "Akrogon Distfiles: ${AKROGON_DISTFILES}")

file(MAKE_DIRECTORY
	"${AKROGON_SYSROOT}"
	"${AKROGON_TOOLS}"
	"${AKROGON_DISTFILES}"
)

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/Akrogon.cmake")

add_subdirectory(packages/binutils)
add_subdirectory(packages/linux-headers)
add_subdirectory(packages/gmp)
add_subdirectory(packages/mpfr)
add_subdirectory(packages/mpc)
add_subdirectory(packages/gcc-bootstrap)

