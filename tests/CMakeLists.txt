# 查找 GTest
find_package(GTest REQUIRED)
include(GoogleTest)

# 测试可执行文件
add_executable(${PROJECT_NAME}_tests test_main.cpp)
target_link_libraries(${PROJECT_NAME}_tests GTest::GTest GTest::Main)

# 注册测试
gtest_discover_tests(${PROJECT_NAME}_tests)
