BUILD_DIR := build
DISTFILES_DIR := distfiles
SYSROOT_DIR := sysroot
TOOLS_DIR := tools

.PHONY: all configure clean

all: configure
	cmake --build $(BUILD_DIR) --parallel

configure:
	cmake -S . -B $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

clean-dist:
	rm -rf $(DISTFILES_DIR)

clean-tools:
	rm -rf $(TOOLS_DIR)

clean-sysroot:
	rm -rf $(SYSROOT_DIR)
