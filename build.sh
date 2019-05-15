#!/bin/bash
set +e
cd $(dirname $0)

VERSION=1.0.0
OUTPUT_PATH="dist/unknown"

# TODO: Detect processor architecture
echo ""
echo "Assigning build output for OS: $OSTYPE"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    OUTPUT_PATH=bin/linux/x64
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OUTPUT_PATH=bin/darwin/x64
elif [[ "$OSTYPE" == "cygwin" ]]; then
    OUTPUT_PATH=bin/win32/x64
elif [[ "$OSTYPE" == "msys" ]]; then
    OUTPUT_PATH=bin/win32/x64
elif [[ "$OSTYPE" == "win32" ]]; then
    OUTPUT_PATH=bin/win32/ia32
fi

# Start compiling if OS supported
if [[ "$OUTPUT_PATH" != "dist/unknown" ]]; then
    echo "Compiling static binary for $OSTYPE ..."
    echo ""
    pyinstaller --clean --onefile --paths ./pyproto --paths ./pyproto/packager/media/base --hidden-import pkgutil--hidden-import six --distpath $OUTPUT_PATH pssh-box.py
else
    echo ""
    echo "Unsupported OS: $OSTYPE"
    echo ""
fi

# Cleanup
if [ -f "pssh-box.spec" ]; then
    echo ""
    echo "Deleting pssh-box.spec ..."
    rm -rf pssh-box.spec
fi

if [ -d "./build" ]; then
    echo "Deleting temporary build folder ..."
    echo ""
    rm -rf ./build
fi
