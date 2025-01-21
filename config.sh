#!/bin/bash

# Set the proper environment file depending on the machine
source ./machines/env-new-jureca-gpu.sh

# Base directory for installation
export BASE_DIR=/p/scratch/exotichadrons/chroma-distillation

# Make required paths
export SOURCE_DIR=$BASE_DIR/source
export BUILD_DIR=$BASE_DIR/build
export INSTALL_DIR=$BASE_DIR/install

mkdir -p $SOURCE_DIR $BUILD_DIR $INSTALL_DIR
