@echo off

chcp 65001

setlocal enabledelayedexpansion enableextensions

setlocal

set "MODE=Release"

:: If the argument is not empty, use it to set the build mode
if "%1" NEQ "" set "MODE=%1"

:: Convert the MODE to lowercase
set "MODE_LOWER="
for /L %%A in (0,1,25) do (
    set "CHAR=!MODE:~%%A,1!"
    if "!CHAR!"=="R" set "CHAR=r"
    if "!CHAR!"=="E" set "CHAR=e"
    if "!CHAR!"=="L" set "CHAR=l"
    if "!CHAR!"=="A" set "CHAR=a"
    if "!CHAR!"=="S" set "CHAR=s"
    if "!CHAR!"=="E" set "CHAR=e"
    set "MODE_LOWER=!MODE_LOWER!!CHAR!"
)

set "BUILD_DIR=build_windows_%MODE_LOWER%"

:: Create the build directory if it doesn't exist
if not exist "%BUILD_DIR%" (
    mkdir "%BUILD_DIR%"
)

:: Change to the build directory
cd "%BUILD_DIR%"

:: Run cmake with the specified build type
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=%MODE% ..

:: Build the project
cmake --build . --config %MODE%

:: Return to the root directory
cd ..
endlocal
