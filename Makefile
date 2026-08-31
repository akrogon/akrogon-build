.PHONY: base/stage0 clean dist-clean

base/stage0:
	$(MAKE) -C base/stage0

clean:
	$(MAKE) -C base/stage0 clean

dist-clean: clean
	$(MAKE) -C base/stage0 dist-clean

