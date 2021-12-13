@echo off

set TMP=%WS%\.tmp
set MSYSTAR=https://repo.msys2.org/distrib/x86_64/msys2-base-x86_64-20211130.tar.xz
set MSYSINST=https://repo.msys2.org/distrib/x86_64/msys2-x86_64-20211130.exe

if not exist %TMP% (
    md %TMP%
)

:: download and extract the installation files
curl -# -o %TMP%\msys2-base.tar.xz %MSYSTAR%
7z x %TMP%\msys2-base.tar.xz -o%TMP%
7z x %TMP%\msys2-base.tar -o%DEVTOOLS%
rename %DEVTOOLS%\msys64 msys

