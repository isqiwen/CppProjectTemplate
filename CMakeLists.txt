cmake_minimum_required(VERSION 3.15)

# 项目名称和语言
project(CppProjectTemplate LANGUAGES CXX)

# C++ 标准设置
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_BUILD_TYPE "${CMAKE_BUILD_TYPE}" CACHE STRING "Choose the build type (Debug or Release)")

# 启用警告作为错误的选项（可选）
option(ENABLE_WARNINGS "Enable compiler warnings" ON)

# 包含自定义 CMake 脚本
include(cmake/CompilerWarnings.cmake)
set_project_warnings()

# import conan
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

# 添加子目录
add_subdirectory(src)

# 添加测试目录
option(ENABLE_TESTS "Enable unit tests" OFF)
if(ENABLE_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()
