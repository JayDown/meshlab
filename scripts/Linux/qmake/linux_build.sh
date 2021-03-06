#!/bin/bash
# this is a script shell for compiling meshlab in a Linux environment.
# Requires a Qt environment which is set-up properly, and an accessible
# qmake binary.
#
# Without given arguments, MeshLab will be built in the meshlab/src
# directory, and binaries will be placed in meshlab/distrib.
# 
# You can give as argument the BUILD_PATH, and meshlab binaries will be
# then placed inside BUILD_PATH/distrib.

#checking for parameters
if [ "$#" -eq 0 ]
then
    BUILD_PATH="../../../src"
else
    BUILD_PATH=$(realpath $1)
fi

cd "$(dirname "$(realpath "$0")")"; #move to script directory

if ! [ -d $BUILD_PATH ]
then
    mkdir $BUILD_PATH
fi

echo "Build path is: " $BUILD_PATH
SOURCE_PATH=$PWD/../../../src

cd $BUILD_PATH
qmake $SOURCE_PATH/meshlab.pro
make -j4
