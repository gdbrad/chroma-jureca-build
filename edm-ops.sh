#!/bin/bash

source config.sh

PKG=edm-ops

rm -rf $SOURCE_DIR/$PKG
rm -rf $BUILD_DIR/$PKG
rm -rf $INSTALL_DIR/$PKG

mkdir $BUILD_DIR/$PKG
mkdir $INSTALL_DIR/$PKG

pushd $SOURCE_DIR
git clone git@gitlab.com:edm-chroma/edm-ops.git $PKG
popd

pushd $BUILD_DIR/$PKG
$CMAKE -DCMAKE_CXX_FLAGS="-std=c++20 -fconcepts -march=native -fopenmp -fPIC -O2" \
       -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR/$PKG             \
       -DQMP_DIR=$INSTALL_DIR/qmp/lib/cmake/QMP             \
       -DLLVM_DIR=$INSTALL_DIR/llvm/lib/cmake/llvm          \
       -DQUDA_DIR=$INSTALL_DIR/quda/lib/cmake/QUDA          \
       -DQDPXX_DIR=$INSTALL_DIR/qdpjit/lib/cmake/QDPXX      \
       -DChroma_DIR=$INSTALL_DIR/chroma/lib/cmake/Chroma    \
       -DFlowChroma_GPU=ON                                  \
       $SOURCE_DIR/$PKG
$CMAKE --build . $CMAKE_MAKE_FLAGS
$CMAKE --install .
popd
