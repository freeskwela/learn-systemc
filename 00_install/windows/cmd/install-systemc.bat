@echo off

set SYSCBATCH=%~dp0

set MSYS=%DEVTOOLS%\msys64
set SYSCVERSION=2.3.4_pub_rev_20190614

echo.
echo ************************************************************
echo *  SystemC Library Installation                            *
echo ************************************************************
echo Installing SystemC Library
echo.
echo ************************************************************
echo.

:: cmd\bash
set BSH=%1
:: systemc-mingw
set SHSYSC=%BSH%\systemc-mingw64.sh

echo Launching MinGW64 shell and logging in to setup SystemC.
call %MSYS%\usr\bin\env.exe CHERE_INVOKING=1 MSYSTEM=MINGW64 /usr/bin/bash -li %SHSYSC%
pause

setx SYSTEMC_HOME %DEVTOOLS%\systemc\core-%SYSCVERSION%

echo.
echo Setup finished! Logged out.
echo.