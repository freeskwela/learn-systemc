#!/bin/bash

export SCRIPTDIR=$(dirname $(realpath $BASH_SOURCE))

STDCXX=17
SYSTEMC_INCLUDE=$SYSTEMC_HOME/include
SYSTEMC_LIBRARY=$SYSTEMC_HOME/lib-linux64

HELLO=$SCRIPTDIR/hello.exe

export LD_LIBRARY_PATH=$SYSTEMC_LIBRARY:$LD_LIBRARY_PATH

if [ -f "$HELLO" ]; then
    rm -f $HELLO
fi

g++ --std=gnu++$STDCXX -I$SYSTEMC_INCLUDE -L$SYSTEMC_LIBRARY -lsystemc hello.cpp -o $HELLO
$HELLO
