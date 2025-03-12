cmake_minimum_required(VERSION 3.22)

project("ImGuiNodeEditor"
    VERSION 0.9.4
)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

add_library(${PROJECT_NAME})

set(sources
    crude_json.cpp
    imgui_canvas.cpp
    imgui_node_editor.cpp
    imgui_node_editor_api.cpp
)
set(public_headers
    crude_json.h
    imgui_canvas.h
    imgui_node_editor.h
)

target_sources(${PROJECT_NAME}
    PRIVATE
        ${sources}
        #${public_headers}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        # where the library itself will look for its internal headers
        ${CMAKE_CURRENT_SOURCE_DIR}
    PUBLIC
        # where top-level project will look for the library's public headers
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        # where external projects will look for the library's public headers
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${public_headers}")

find_package(DearImGui CONFIG REQUIRED)
target_link_libraries(${PROJECT_NAME}
    PRIVATE
        DearImGui::DearImGui
)

#set(PROJECT_INCLUDES_NAME_FOR_PACKAGE "imgui-node-editor")
set(PROJECT_NAMESPACE_FOR_PACKAGE "DearImGui")
include("${CMAKE_CURRENT_SOURCE_DIR}/Installing.cmake")
