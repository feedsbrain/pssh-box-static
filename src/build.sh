#!/bin/bash
set +e
cd $(dirname $0)

VERSION=1.0.0
OUTPUT_PATH="unknown"

# TODO: Detect processor architecture
# For the moment we only support x64
echo ""
echo "Assigning build output for OS: $OSTYPE"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    OUTPUT_PATH=../bin/linux/x64
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OUTPUT_PATH=../bin/darwin/x64
elif [[ "$OSTYPE" == "cygwin" ]]; then
    OUTPUT_PATH=../bin/win32/x64
elif [[ "$OSTYPE" == "msys" ]]; then
    OUTPUT_PATH=../bin/win32/x64
elif [[ "$OSTYPE" == "win32" ]]; then
    OUTPUT_PATH=../bin/win32/x64
fi

# Start compiling if OS supported
if [[ "$OUTPUT_PATH" != "unknown" ]]; then
    echo "Compiling static binary for $OSTYPE ..."
    echo ""
    pyinstaller --clean --onefile --paths ./pyproto --paths ./pyproto/packager/media/base --hidden-import pkgutil --hidden-import six --distpath $OUTPUT_PATH pssh-box.py
else
    echo ""
    echo "Unsupported OS: $OSTYPE"
    echo ""
fi
