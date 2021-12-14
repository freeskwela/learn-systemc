@echo off

set TMP=%WS%\.tmp
set VSCVERSION=1.63.0
set VSCODEINST=https://update.code.visualstudio.com/%VSCVERSION%/win32-x64-archive/stable
set VSCODE=%DEVTOOLS%\vscode

if not exist %TMP% (
    md %TMP%
)

:: reference: https://code.visualstudio.com/docs/editor/portable
:: TODO: updating to new version

:: download and extract the installation files
curl -# -L -o %TMP%\vscode-win64.zip %VSCODEINST%
7z x %TMP%\vscode-win64.zip -o%VSCODE%
md %VSCODE%\data

:: setup extensions
:: TODO: adding extensions

:: notes
echo.
echo ************************************************************
echo *                         NOTES                            *
echo ************************************************************
echo Add %VSCODE%\bin into the user Path environment variable!
echo Note: Restart terminal session to use new path.
echo.
echo ************************************************************
echo.