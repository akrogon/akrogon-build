.PHONY: base/stage0 clean clean-dist clean-sysroot clean-tools

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

clean-all: clean clean-dist clean-sysroot clean-tools

