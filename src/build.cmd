@ECHO OFF
CD %~dp0

SET VERSION=1.0.0
SET OUTPUT_PATH="unknown"

REM TODO: Detect processor architecture
REM For the moment we only support x64
ECHO .
ECHO "Assigning build output for Windows"
SET OUTPUT_PATH=../bin/win32/x64

REM Compiling static binary for Windows
pyinstaller --clean --onefile --paths ./pyproto --paths ./pyproto/packager/media/base --hidden-import pkgutil --hidden-import six --distpath %OUTPUT_PATH% pssh-box.py