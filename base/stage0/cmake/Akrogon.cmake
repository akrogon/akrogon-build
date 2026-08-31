function(akrogon_package name)
	cmake_parse_arguments(
		PACKAGE
		""
		"SOURCE_DIR"
		"DEPENDS"
		${ARGN}
	)

	set(target "akrogon-${name}")

	add_custom_target(
		${target}
		DEPENDS ${PACKAGE_DEPENDS}
	)

	set(
		AKROGON_PACKAGE_TARGET_${name}
		${target}
		PARENT_SCOPE
	)
endfunction()
