@echo off

set MSYSBATCH=%~dp0

set MSYSTAR=https://repo.msys2.org/distrib/x86_64/msys2-base-x86_64-20211130.tar.xz
set MSYSINST=https://repo.msys2.org/distrib/x86_64/msys2-x86_64-20211130.exe
set MSYS=%DEVTOOLS%\msys

set CREATEDIRS=%MSYSBATCH%create-workspace.bat

if not exist %WSTMP% (
    call %CREATEDIRS%
)

:: 7zip
set SZ=%1

:: download and extract the installation files
echo.
echo Downloading MSYS2 Base Archive
curl -# -L -o %WSTMP%\msys2-base.tar.xz %MSYSTAR%
echo.
echo Extracting files
%SZ% x %WSTMP%\msys2-base.tar.xz -o%WSTMP%
%SZ% x %WSTMP%\msys2-base.tar -o%DEVTOOLS%
rename %DEVTOOLS%\msys64 msys

:: setup packages
call %MSYS%\msys2_shell.cmd

:: notes
echo.
echo ************************************************************
echo *  NOTES :: MSYS2-MinGW64                                  *
echo ************************************************************
echo Start an MSYS2 shell with this command:
echo    - %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MSYS /usr/bin/bash -li
echo.
echo Install packages (follow instructions in the link below):
echo    - Step 5 ~ 7 of https://www.msys2.org/ [mingw-w64-x86_64-gdb]
echo    - Package index site: https://packages.msys2.org/
echo.
echo Optional: Setup MSYS2 shells to integrate with Windows Terminal App
echo.
echo ************************************************************
echo.
