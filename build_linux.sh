#!/bin/bash

# 默认构建模式
MODE=${1:-Release}

# 将 MODE 转换为小写
MODE=$(echo "$MODE" | tr '[:upper:]' '[:lower:]')

# 构建目录
BUILD_DIR="build_linux_$MODE"

# 创建构建目录
if [ ! -d "$BUILD_DIR" ]; then
    mkdir "$BUILD_DIR"
fi

# 进入构建目录
cd "$BUILD_DIR"

# 配置 CMake 项目
cmake -DCMAKE_BUILD_TYPE=$MODE ..

# 编译项目
make -j$(nproc)

# 返回根目录
cd ..
