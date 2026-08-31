BUILD_DIR := build
DISTFILES_DIR := distfiles

.PHONY: all configure clean

all: configure
	cmake --build $(BUILD_DIR) --parallel

configure:
	cmake -S . -B $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

dist-clean: clean
	rm -rf $(DISTFILES_DIR)
