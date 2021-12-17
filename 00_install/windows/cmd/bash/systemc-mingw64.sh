#!/bin/bash

export SCRIPTDIR=$(dirname $(realpath $BASH_SOURCE))

# Environment Variables
# common environment variables
export WORKSPACE=$(cygpath -u "$USERPROFILE/.workspace")
export TMP=$WORKSPACE/.tmp 

export DEVTOOLS=$WORKSPACE/devtools
export PROJECTS=$WORKSPACE/projects

export SYSTEMC=$DEVTOOLS/systemc

if [ ! -d "$WORKSPACE" ]; then
    mkdir -p $TMP
    mkdir -p $DEVTOOLS
    mkdir -p $PROJECTS
fi

export CXX=g++
export STDCXX=17
export STDCXX="-std=gnu++$STDCXX"
export STACK_SIZE="-DSC_OVERRIDE_DEFAULT_STACK_SIZE=0x80000"

export SYSTEMC_VERSION=2.3.4_pub_rev_20190614
export CCI_VERSION
export SCC_VERSION

export SYSTEMC_HOME=$SYSTEMC/core-$SYSTEMC_VERSION
export CCI_HOME=$SYSTEMC/cci-$CCI_VERSION
export SCC_HOME=$SYSTEMC/scc-$SCC_VERSION

export SYSTEMC_GIT=https://github.com/accellera-official/systemc.git
export CCI_GIT
export SCC_GIT=https://github.com/Minres/SystemC-Components.git

cd $TMP

# export BUILD=x86_64-linux-gnu
# export TARGET=x86_64-linux-gnu

echo ""
echo "Setup :: Source Folders"
echo "************************************************************"
export SYSTEMC_SOURCE=$TMP/systemc-$SYSTEMC_VERSION
export CCI_SOURCE=$TMP/cci-$CCI_VERSION
export SCC_SOURCE=$VPD/scc-$SCC_VERSION

echo ""
echo "Cloning :: SystemC $SYSTEMC_VERSION Release :: $SYSTEMC_GIT"
echo "************************************************************"
git clone --depth 1 --branch $SYSTEMC_VERSION $SYSTEMC_GIT $SYSTEMC_SOURCE

echo ""
echo "Creating :: SystemC Install Folder :: $SYSTEMC_HOME"
echo "************************************************************"
mkdir -p $SYSTEMC_HOME

echo ""
echo "Entering :: SystemC Source Folder :: $SYSTEMC_SOURCE"
echo "************************************************************"
cd $SYSTEMC_SOURCE
autoreconf configure.ac

echo ""
echo "Configuring :: SystemC :: Release Build"
echo "************************************************************"
mkdir  build && cd build
../configure \
--build=$BUILD \
--target=$TARGET \
--prefix=$SYSTEMC_HOME \
--enable-debug \
CFLAGS="$STDCXX $STACK_SIZE" \
CXXFLAGS="$STDCXX $STACK_SIZE" \
LDFLAGS="$STDCXX $STACK_SIZE"

echo ""
echo "Generating :: Release Build"
echo "************************************************************"
make -j 8 VERBOSE=1
echo ""
echo "Testing :: Release Build"
echo "************************************************************"
make check -j 8 VERBOSE=1
echo ""
echo "Installing :: SystemC"
echo "************************************************************"
make install VERBOSE=0

echo ""
echo "Post Installation :: User Options"
echo "************************************************************"

echo ""
echo "Cleaning :: Source Files"
echo "************************************************************"
# rm -rf $SYSTEMC_SOURCE

# logout
logout
