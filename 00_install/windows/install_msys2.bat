@echo off

set TMP=%WS%\.tmp
set MSYSTAR=https://repo.msys2.org/distrib/x86_64/msys2-base-x86_64-20211130.tar.xz
set MSYSINST=https://repo.msys2.org/distrib/x86_64/msys2-x86_64-20211130.exe
set MSYS=%DEVTOOLS%\msys

if not exist %TMP% (
    md %TMP%
)

:: download and extract the installation files
curl -# -L -o %TMP%\msys2-base.tar.xz %MSYSTAR%
7z x %TMP%\msys2-base.tar.xz -o%TMP%
7z x %TMP%\msys2-base.tar -o%DEVTOOLS%
rename %DEVTOOLS%\msys64 msys

:: setup packages
:: TODO: adding packages (mingw64, clang64)

:: notes
echo.
echo ************************************************************
echo *                         NOTES                            *
echo ************************************************************
echo Start an MSYS2 shell with this command:
echo    - %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MSYS /usr/bin/bash -li
echo.
echo Install packages (follow instructions in the link below):
echo    - Step 5 ~ 7 of https://www.msys2.org/
echo        - toolchain choices: [mingw-w64-x86_64-gdb, mingw-w64-x86_64-make, mingw-w64-x86_64-tools-git]
echo    - Package index site: https://packages.msys2.org/
echo.
echo Optional: Setup MSYS2 shells to integrate with Windows Terminal App
echo.
echo ************************************************************
echo.
