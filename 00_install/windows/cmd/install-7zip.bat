@echo off

set ZIPBATCH=%~dp0

set ZIPVERSION=2106-x64
set ZIPINST=%1\7z-%ZIPVERSION%.zip
set ZIP=%DEVTOOLS%\7zip

set CREATEDIRS=%ZIPBATCH%create-workspace.bat

if not exist %WSTMP% (
    call %CREATEDIRS%
)

:: extract files
echo.
echo Extracting 7-zip Archiving Tool ver. %ZIPVERSION%
md %ZIP%
call tar -xf %ZIPINST% -C %ZIP%

:: notes
echo.
echo ************************************************************
echo *  NOTES :: 7-zip Archiving Tool                           *
echo ************************************************************
echo Add %ZIP% into the User Path Environment Variable.
echo Note: Restart terminal session to use new path.
echo.
echo ************************************************************
echo.
