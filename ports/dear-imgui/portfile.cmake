# does not export symbols for making a DLL
if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL git@github.com:ocornut/imgui.git
    REF 11b3a7c8ca23201294464c7f368614a9106af2a1 # version tag commit from `docking` branch
    PATCHES
        001-define-math-operators.patch
        002-want-render.patch
        003-index32.patch
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt"   DESTINATION "${SOURCE_PATH}")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/Config.cmake.in"  DESTINATION "${SOURCE_PATH}")
file(COPY
    "${CURRENT_HOST_INSTALLED_DIR}/share/myvr-vcpkg-cmake/common/Installing.cmake"
    DESTINATION "${SOURCE_PATH}"
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        with-internal WITH_INTERNAL
        with-stb-textedit WITH_STB_TEXTEDIT
        backend-opengl BACKEND_OPENGL3
        backend-vulkan BACKEND_VULKAN
        backend-glfw BACKEND_GLFW
        platform-win32 PLATFORM_WIN32
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME "DearImGui"
    CONFIG_PATH "share/DearImGui"
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
