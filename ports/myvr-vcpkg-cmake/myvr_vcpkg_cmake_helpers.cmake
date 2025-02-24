include_guard(GLOBAL)

# might want to add an argument for passing a desired CMake generator
macro(myvr_vcpkg_cmake_determine_generator)
    message(STATUS "Determining a suitable CMake generator for building with ${TARGET_TRIPLET} triplet...")

    list(APPEND CMAKE_MESSAGE_INDENT "+ ")

    set(CMAKE_GENERATOR "Ninja") # unless a specific CMake generator has been passed as an argument?
    if(NOT DEFINED ENV{CMAKE_GENERATOR})
        if(VCPKG_TARGET_IS_OSX)
            message(STATUS "target platform is Mac OS")
            set(CMAKE_GENERATOR "Xcode") # mMap builds only with Xcode generator ("ARC is off" error)
        endif()
    else()
        set(CMAKE_GENERATOR "$ENV{CMAKE_GENERATOR}")
    endif()

    message(STATUS "determined CMake generator: ${CMAKE_GENERATOR}")

    list(POP_BACK CMAKE_MESSAGE_INDENT)
endmacro()
