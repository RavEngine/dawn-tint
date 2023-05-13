#!/bin/bash

# get depot tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git --depth=1
export PATH=`pwd`/depot_tools:$PATH

# get tint and its deps
git clone https://dawn.googlesource.com/tint --depth=1
cd tint
cp standalone.gclient .gclient
gclient sync

# delete everything we don't need
rm -rf build third_party buildtools tools testing testing scripts kokoro infra .vscode .cipd build_overrides .clang-format .gclient*  
cd ..

# remove git folders
find . -name .git -type d -exec rm -rf {} \;
find . -name .git -exec rm {} \;

# need to do it twice for some reason
find . -name .git -type d -exec rm -rf {} \;
find . -name .git -exec rm {} \;
