@echo off

%DEVTOOLS%\msys64\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MINGW64 /usr/bin/bash -li %~dp0hello.sh
