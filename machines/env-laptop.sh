#!/bin/bash

export GPU_ARCH=sm_61

export CC=mpicc
export CXX=mpicxx

export CMAKE=cmake
export CMAKE_EXTRA_FLAGS="-DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DHDF5_ROOT=/usr/lib/x86_64-linux-gnu/hdf5/openmpi -DHDF5_PREFER_PARALLEL=1" # -DHDF5_LIBRARIES=/usr/lib/x86_64-linux-gnu/hdf5/openmpi/libhdf5.so
export CMAKE_MAKE_FLAGS="--parallel $(nproc)"

export LD_LIBRARY_PATH="$BASE_DIR/install/chroma/lib:$BASE_DIR/install/quda/lib:$BASE_DIR/install/qdpjit/lib:$BASE_DIR/install/qmp/lib:$BASE_DIR/install/llvm/lib:$LD_LIBRARY_PATH"
export QUDA_RESOURCE_PATH="$BASE_DIR/quda-resources"
export QUDA_TUNE_VERSION_CHECK=0

