@echo off

set GITBATCH=%~dp0

set GITVERSION=2.34.1
set GITINST=https://github.com/git-for-windows/git/releases/download/v%GITVERSION%.windows.1/PortableGit-%GITVERSION%-64-bit.7z.exe
set GIT=%DEVTOOLS%\git

set CREATEDIRS=%GITBATCH%create-workspace.bat

if not exist %WSTMP% (
    call %CREATEDIRS%
)

:: 7zip
set SZ=%1

:: download and extract the installation files
echo.
echo Downloading Git for Windows ver. %GITVERSION%
curl -# -L -o %WSTMP%\git-%GITVERSION%.exe %GITINST%
echo.
echo Extracting files
%SZ% x %WSTMP%\git-%GITVERSION%.exe -o%GIT%

:: notes
echo.
echo ************************************************************
echo *  NOTES :: Git for Windows                                *
echo ************************************************************
echo Add %GIT%\cmd into the User Path Environment Variable.
echo Note: Restart terminal session to use new path.
echo.
echo ************************************************************
echo.
