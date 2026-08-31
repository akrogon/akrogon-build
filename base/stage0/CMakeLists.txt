cmake_minimum_required(VERSION 3.25)

project(akrogon-stage0 NONE)

set(AKROGON_STAGE 0)
set(AKROGON_SYSROOT "${CMAKE_CURRENT_SOURCE_DIR}/sysroot")

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/Akrogon.cmake")

message(STATUS "Akrogon Stage: ${AKROGON_STAGE}")
message(STATUS "Akrogon Sysroot: ${AKROGON_SYSROOT}")

file(MAKE_DIRECTORY "${AKROGON_SYSROOT}")

add_subdirectory(packages/binutils)

