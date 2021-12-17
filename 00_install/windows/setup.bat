@echo off

set BATCHDIR=%~dp0
set CMDIR=%BATCHDIR%cmd
set UTDIR=%BATCHDIR%utils

:: create .workspace folder under %USERPROFILE% directory
call %CMDIR%\create-workspace.bat

:: setup basic development tools

:: archiving tool
@REM call %CMDIR%\install-7zip.bat %UTDIR%

:: git
@REM call %CMDIR%\install-git.bat %ZIP%\7z.exe

:: vscode-portable
@REM call %CMDIR%\install-vscode.bat %ZIP%\7z.exe

:: msys2-mingw64
@REM call %CMDIR%\install-msys.bat %ZIP%\7z.exe %CMDIR%\bash

:: systemc
call %CMDIR%\install-systemc.bat %CMDIR%\bash

:: miniconda


@REM pause
