@echo off
set SRC_DIR=%~dp0
cd %SRC_DIR%
rd /s /q %SRC_DIR%\output\win\Release
rd /s /q %SRC_DIR%\build
rem "%1 is used by github action for not copy the vendors"
cmake -B build %SRC_DIR%  -DCMAKE_GENERATOR_TOOLSET=v142,host=x64  ^
                 -G"Visual Studio 16 2019" -A "x64"        ^
                 -DCMAKE_SYSTEM_VERSION=10.0.18362.0       ^
				 %1 ^
                 -DCMAKE_BUILD_TYPE=Release
cmake --build %SRC_DIR%/build --target clean
cmake --build %SRC_DIR%/build --config Release --target install -j 12
pause