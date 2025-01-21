#!/bin/bash

module purge
module load PrgEnv-cray
module load daint-gpu
module swap PrgEnv-cray PrgEnv-gnu
module load cray-mpich
module load cudatoolkit
module load cray-hdf5-parallel
module swap gcc/10.1.0 gcc/8.3.0

export HOST=x86_64-linux-gnu
export GPU_ARCH=sm_60

export CC=cc
export CXX=CC

export CMAKE=/users/gpederiv/cmake-3.20.2/bin/cmake
export MAKE="make -j$(nproc)"

