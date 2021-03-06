#!/bin/bash

export TEST_MPI_COMMAND="mpirun -n 1"

./cmake_clean.sh

cmake -DCMAKE_CXX_COMPILER=mpic++                   \
      -DPNETCDF_PATH=${PNETCDF_PATH}                \
      -DYAKL_CUB_HOME=`pwd`/../cub                  \
      -DCXXFLAGS="-O3 -std=c++11"                   \
      -DCUDA_FLAGS="-arch sm_50 -ccbin mpic++"      \
      -DNX=200                                      \
      -DNZ=100                                      \
      -DSIM_TIME=5                                  \
      -DARCH="CUDA"                                 \
      ..

