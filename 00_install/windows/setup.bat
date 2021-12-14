@echo off

set BATCHDIR=%~dp0

:: create .workspace folder under %USERPROFILE% directory
set WS=%USERPROFILE%\.workspace
md %WS%

:: create devtools and projects folders
set DEVTOOLS=%WS%\devtools
set PROJECTS=%WS%\projects

md %DEVTOOLS%
md %PROJECTS%
md %WS%\.tmp

setx DEVTOOLS %DEVTOOLS%
setx PROJECTS %PROJECTS%

:: setup basic development tools

:: archiving tool
call install_7zip.bat

:: git
call install_git.bat

:: msys2-mingw64
call install_msys2.bat

:: vscode-portable
call install_vscode.bat

:: systemc
call install_systemc.bat

:: miniconda


@REM pause
