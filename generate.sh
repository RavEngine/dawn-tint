#!/bin/bash

# get depot toosl
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git --depth=1
export PATH=`pwd`/depot_tools:$PATH

# get tint and its deps
git clone https://dawn.googlesource.com/tint --depth=1
cd tint
cp standalone.gclient .gclient
gclient sync
cd ..

# remove git folders
find . -name .git -type d -exec rm -rf {} \;
find . -name .git -exec rm {} \;
