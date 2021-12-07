#!/bin/bash

export SCRIPTDIR=$(dirname $(realpath $BASH_SOURCE))

# project folder
cd $SCRIPTDIR && cd ../..
export PROJECTDIR=$(pwd)

export CXX=g++
export STDCXX=17

export PYSYSC_GIT=https://github.com/accellera-official/PySysC.git
export PYSYSC_SC_GIT=https://git.minres.com/SystemC/PySysC-SC.git
export PYSYSC_SOURCE=$DEVTOOLS/pysysc
export PYSYSC_SC_SOURCE=$DEVTOOLS/pysysc-sc

echo ""
echo "Cloning :: PySysC"
echo "************************************************************"
git clone $PYSYSC_GIT $PYSYSC_SOURCE

# activate python environment
# install dependency libraries
# install pysysc
# install pysysc-sc
