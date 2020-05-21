#!/bin/sh
#rm -rf build
mkdir -p build
#(cd build && emconfigure cmake -DCMAKE_BUILD_TYPE=Debug ..) &&
(cd build && emconfigure cmake ..) &&
(cd build && emmake make VERBOSE=1 -j 16)
cp ./build/src/libjpegturbowasm.js ./dist && 
cp ./build/src/libjpegturbowasm.wasm ./dist && 
cp ./build/src/libjpegturbojs.js.mem ./dist &&
cp ./build/src/libjpegturbojs.js ./dist &&
(cd test/node; npm run test)