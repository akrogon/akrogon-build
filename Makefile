.PHONY: base/stage0 clean clean-dist clean-sysroot clean-tools clean-build

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

clean-build: clean clean-sysroot clean-tools

clean-all: clean-build clean-dist

