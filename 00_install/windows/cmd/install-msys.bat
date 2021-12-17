@echo off

set MSYSBATCH=%~dp0

set MSYSVERSION=x86_64-20211130
set MSYSTAR=https://repo.msys2.org/distrib/x86_64/msys2-base-%MSYSVERSION%.tar.xz
set MSYSINST=https://repo.msys2.org/distrib/x86_64/msys2-%MSYSVERSION%.exe
set MSYS=%DEVTOOLS%\msys64

set CREATEDIRS=%MSYSBATCH%create-workspace.bat

if not exist %WSTMP% (
    call %CREATEDIRS%
)

:: 7zip
set SZ=%1
:: cmd\bash
set BSH=%2

echo.
echo ************************************************************
echo *  ATTENTION :: MSYS2 Package Installation                 *
echo ************************************************************
echo Please interact with the process accordingly.
echo.
echo ************************************************************
echo.

:: download and extract the installation files
echo.
echo Downloading MSYS2 Base Archive
curl -# -L -o %WSTMP%\msys2-base.tar.xz %MSYSTAR%
echo.
echo Extracting files
%SZ% x %WSTMP%\msys2-base.tar.xz -o%WSTMP%
%SZ% x %WSTMP%\msys2-base.tar -o%DEVTOOLS%

:: if exist "%DEVTOOLS%\msys64" (
::     echo Renaming installation folder
::     rename %DEVTOOLS%\msys64 msys
:: )

:: initialize installation and setup needed packages
echo.
echo ************************************************************
echo *  IMPORTANT :: MSYS2 Initialization                       *
echo ************************************************************
echo 1. MSYS2 shell will launch and shall initialize.
echo 2. Wait until initialization process is finished.
echo 3. Logout from the MSYS2 shell after the process.
echo    - type 'logout' and press 'Enter' in the MSYS shell
echo 4. Close MSYS2 shell window.
echo.
echo Starting MSYS2 for the first time!
echo It is very important to initialize MSYS2 properly.
echo Startup may take longer time, please be patient.
echo Close the MSYS2 shell before proceeding!
echo Press Ctrl+C to abort the process.
echo.
echo ************************************************************
echo.

call %MSYS%\msys2_shell.cmd
pause

set SHMINGW1=%BSH%\msys-init-pack.sh
set SHMINGW2=%BSH%\msys-mingw64-install.sh
set SHMINGW3=%BSH%\verify-mingw.sh

echo Restarting MSYS2 and logging in to initialize MSYS2 default packages.
echo 1st pass...
call %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MSYS /usr/bin/bash -li %SHMINGW1%
echo.
echo Restarting MSYS2 and logging in to initialize MSYS2 default packages.
echo 2nd pass...
call %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MSYS /usr/bin/bash -li %SHMINGW1%
echo.
echo Setup finished! Logged out.
echo.

echo Restarting MSYS2 and logging in to install MINGW64 packages.
echo Suggested base-devel package option: "all"
echo Suggested toolchain packages option: "mingw-w64-x86_64-gcc", "mingw-w64-x86_64-gdb"
call %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MSYS /usr/bin/bash -li %SHMINGW2%
echo.
echo MinGW64 toolchain setup finished! Logged out.
echo.

echo Launching MinGW64 shell and logging in.
call %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MINGW64 /usr/bin/bash -li %SHMINGW3%
echo.

:: notes
echo.
echo ************************************************************
echo *  NOTES :: MSYS2 - MSYS / MinGW64                         *
echo ************************************************************
echo 1. Start an MSYS2 MSYS shell with this command:
echo    - %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MSYS /usr/bin/bash -li
echo 2. Start an MSYS2 MINGW64 shell with this command:
echo    - %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MINGW64 /usr/bin/bash -li
echo.
echo Package index site: https://packages.msys2.org/
echo.
echo Optional: Setup MSYS2 shells to integrate with Windows Terminal App
echo.
echo ************************************************************
echo.
