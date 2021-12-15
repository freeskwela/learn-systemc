@echo off

set VSCBATCH=%~dp0

set VSCVERSION=1.63.0
set VSCODEINST=https://update.code.visualstudio.com/%VSCVERSION%/win32-x64-archive/stable
set VSCODE=%DEVTOOLS%\vscode

set CREATEDIRS=%VSCBATCH%create-workspace.bat

:: reference: https://code.visualstudio.com/docs/editor/portable
:: TODO: updating to new version

if not exist %WSTMP% (
    call %CREATEDIRS%
)

:: 7zip
set SZ=%1

:: download and extract the installation files
echo.
echo Downloading Visual Studio Code ver. %VSCVERSION% (Portable Mode)
curl -# -L -o %WSTMP%\vscode-win64.zip %VSCODEINST%
echo.
echo Extracting files
%SZ% x %WSTMP%\vscode-win64.zip -o%VSCODE%
md %VSCODE%\data

:: setup extensions
:: TODO: adding extensions

:: notes
echo.
echo ************************************************************
echo *  NOTES :: Visual Studio Code (Portable Mode)             *
echo ************************************************************
echo Add %VSCODE%\bin into the User Path Environment Variable.
echo Note: Restart terminal session to use new path.
echo.
echo ************************************************************
echo.