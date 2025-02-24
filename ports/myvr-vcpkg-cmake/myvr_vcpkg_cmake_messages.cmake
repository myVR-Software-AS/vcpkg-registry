include_guard(GLOBAL)

macro(myvr_vcpkg_cmake_message_example)
    message(STATUS "Just an example of calling a CMake function/macro from a CMake helper port")
endmacro()

macro(myvr_vcpkg_cmake_warning_commercial_license)
    message(
        STATUS
            "[WARNING] This port source code is distributed under a 3rd-party commercial license, "
            "check for details in ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright"
    )
endmacro()
