#!/bin/bash

rm --one-file-system -rf build
mkdir -p build &&
cd build && ../../configure && make -j4 V=0 && cd ..