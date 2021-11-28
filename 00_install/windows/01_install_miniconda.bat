@echo off

:: project folder
set BATCHDIR=%~dp0
set PROJDIR=%BATCHDIR%..

:: setup build directory
set TMPDIR=%BATCHDIR%.tmp

if not exist %TMPDIR% (
    echo.
    echo Creating temporary file directory
    md %TMPDIR%
)

echo.
echo Entering temporary file directory
cd /d %TMPDIR%

:: download miniconda latest version
echo.
echo Downloading latest version of Miniconda for Windows x86_64...
curl -# -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe

:: start the miniconda installation
echo.
if exist "Miniconda3-latest-Windows-x86_64.exe" (
    echo Launching Miniconda installation...
    call Miniconda3-latest-Windows-x86_64.exe
)

echo.
echo Entering project directory
cd /d %PROJDIR%

:end
echo.
pause
