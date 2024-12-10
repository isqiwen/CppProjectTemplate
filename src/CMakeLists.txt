# 生成主程序
add_executable(${PROJECT_NAME} main.cpp)

# 包含头文件目录
target_include_directories(${PROJECT_NAME} PRIVATE ${PROJECT_SOURCE_DIR}/include)

# 链接库（如有）
# target_link_libraries(${PROJECT_NAME} <library_name>)
