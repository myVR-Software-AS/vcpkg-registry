include_guard(GLOBAL)

macro(myvr_vcpkg_cmake_message_example)
    message(STATUS "Just an example of calling a CMake function/macro from a CMake helper port")
endmacro()

macro(myvr_vcpkg_cmake_warning_commercial_license)
    message(
        STATUS
            "[WARNING] The [${PORT}] source code is distributed under a 3rd-party commercial license, "
            "check for details in ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright"
    )
endmacro()

macro(myvr_vcpkg_cmake_warning_problematic_license LICENSE_NAME)
    message(
        STATUS
            "[WARNING] The [${PORT}] source code is distributed under a potentially problematic license: "
            "${LICENSE_NAME} (${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright). Make sure that using "
            "this port has been approved before committing it as a dependency in any of myVR projects."
    )
endmacro()

macro(myvr_vcpkg_cmake_info_openmp)
    if(VCPKG_TARGET_IS_OSX) # OR VCPKG_TARGET_IS_IOS
        message(
            STATUS
                "For building [${PORT}] on Apple platforms you need to have OpenMP already installed "
                "in the system, and OpenMP_ROOT environment variable should point to its prefix. "
                "So, for example:\n"
                "```\n"
                "$ brew install libomp\n"
                "$ export OpenMP_ROOT=$(brew --prefix)/opt/libomp\n"
                "```"
        )
    endif()
endmacro()
