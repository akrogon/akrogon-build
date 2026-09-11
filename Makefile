.PHONY: base/stage0 clean clean-dist clean-sysroot clean-tools clean-build clean-cmake-cache

base/stage0:
	$(MAKE) -C base/stage0

clean:
	$(MAKE) -C base/stage0 clean

clean-dist:
	$(MAKE) -C base/stage0 clean-dist

clean-sysroot:
	$(MAKE) -C base/stage0 clean-sysroot

clean-tools:
	$(MAKE) -C base/stage0 clean-tools

clean-cmake-cache:
	rm -rf base/stage0/build/Makefile
	rm -rf base/stage0/build/CMakeFiles
	rm -rf base/stage0/build/CMakeCache.txt
	rm -rf base/stage0/build/cmake_install.cmake

clean-build: clean clean-sysroot clean-tools

clean-all: clean-build clean-dist

