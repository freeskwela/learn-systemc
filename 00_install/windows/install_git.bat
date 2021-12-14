@echo off

set TMP=%WS%\.tmp
set GITVERSION=2.34.1
set GITINST=https://github.com/git-for-windows/git/releases/download/v%GITVERSION%.windows.1/PortableGit-%GITVERSION%-64-bit.7z.exe
set GIT=%DEVTOOLS%\git

if not exist %TMP% (
    md %TMP%
)

:: download and extract the installation files
curl -# -L -o %TMP%\git-%GITVERSION%.exe %GITINST%
7z x %TMP%\git-%GITVERSION%.exe -o%GIT%

:: notes
echo.
echo ************************************************************
echo *                         NOTES                            *
echo ************************************************************
echo Add %GIT%\cmd into the user Path environment variable!
echo Note: Restart terminal session to use new path.
echo.
echo ************************************************************
echo.
