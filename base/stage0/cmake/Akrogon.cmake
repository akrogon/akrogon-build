include(ExternalProject)

function(akrogon_package name)
	cmake_parse_arguments(
		PACKAGE
		""
		"URL;URL_HASH;SOURCE_SUBDIR"
		"DEPENDS;CONFIGURE_COMMAND;BUILD_COMMAND;INSTALL_COMMAND"
		${ARGN}
	)

	set(target "${name}")
	set(args)

	if(NOT PACKAGE_CONFIGURE_COMMAND)
		message(FATAL_ERROR
			"${name}: CONFIGURE_COMMAND is required"
		)
	endif()

	if(NOT PACKAGE_INSTALL_COMMAND)
		message(FATAL_ERROR
			"${name}: INSTALL_COMMAND is required"
		)
	endif()

	if(PACKAGE_CONFIGURE_COMMAND STREQUAL "NONE")
		list(APPEND args
			CONFIGURE_COMMAND
			    ${CMAKE_COMMAND} -E true
		)
	else()
		list(APPEND args
			CONFIGURE_COMMAND ${PACKAGE_CONFIGURE_COMMAND}
		)
	endif()

	if(PACKAGE_INSTALL_COMMAND STREQUAL "NONE")
		list(APPEND args
			INSTALL_COMMAND
			    ${CMAKE_COMMAND} -E true
		)
	else()
		list(APPEND args
			INSTALL_COMMAND ${PACKAGE_INSTALL_COMMAND}
		)
	endif()

	message(STATUS "${name} CONFIGURE_COMMAND: ${PACKAGE_CONFIGURE_COMMAND}")
	message(STATUS "${name} BUILD_COMMAND: ${PACKAGE_BUILD_COMMAND}")
	message(STATUS "${name} INSTALL_COMMAND: ${PACKAGE_INSTALL_COMMAND}")
	message(STATUS "{name} args: ${args}")

	ExternalProject_Add(${target}
		URL "${PACKAGE_URL}"
		URL_HASH "${PACKAGE_URL_HASH}"
		PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${name}"
		DOWNLOAD_DIR "${AKROGON_DISTFILES}"

		${args}

		BUILD_COMMAND ${PACKAGE_BUILD_COMMAND}
		DEPENDS ${PACKAGE_DEPENDS}
	)
endfunction()
