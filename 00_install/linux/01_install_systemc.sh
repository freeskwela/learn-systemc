#!/bin/bash

export SCRIPTDIR=$(dirname $(realpath $BASH_SOURCE))

# project folder
cd $SCRIPTDIR && cd ../..
export PROJECTDIR=$(pwd)

# create a build folder
cd $SCRIPTDIR
if test ! -d ".build"; then
    mkdir .build
fi

# work inside build folder
cd .build

# Environment Variables
# common environment variables
export DEVTOOLS=$HOME/devtools
export PROJECTS=$HOME/projects

export CXX=g++
export STDCXX=17
export STDCXX="-std=gnu++$STDCXX"
export STACK_SIZE="-DSC_OVERRIDE_DEFAULT_STACK_SIZE=0x80000"

# export BUILD=x86_64-linux-gnu
# export TARGET=x86_64-linux-gnu

export SYSTEMC_VERSION=2.3.3
export SCC_VERSION

export SYSTEMC_HOME=$DEVTOOLS/systemc/systemc-$SYSTEMC_VERSION
export SYSTEMC_GIT=https://github.com/accellera-official/systemc.git
export SCC_HOME=$DEVTOOLS/systemc/scc
export SCC_GIT=https://github.com/Minres/SystemC-Components.git

export VPD=$PWD
echo ""
echo "Setup :: Source Folders"
echo "************************************************************"
export SYSTEMC_SOURCE=$VPD/systemc-$SYSTEMC_VERSION
export SCC_SOURCE=$VPD/scc

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
--enable-pthreads \
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
# echo -e "# SystemC\nexport SYSTEMC_HOME=$SYSTEMC_HOME" >> $HOME/.bashrc
printf " - to initialize SystemC variables\\n"
printf "\\t command: source ~/.bashrc\\n"

echo ""
echo "Cleaning :: Source Files"
echo "************************************************************"
rm -rf $SYSTEMC_SOURCE
