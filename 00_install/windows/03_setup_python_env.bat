@echo off

:: project folder
set BATCHDIR=%~dp0
set PROJDIR=%BATCHDIR%..

:: create a conda python environment
echo.
echo Creating a Conda Python environment...
set /p ENVNAME="Enter Python environment name: "
call conda create -n %ENVNAME% python=3.9
call conda activate %ENVNAME%
call pip install conan

echo.
echo Entering project directory
cd /d %PROJDIR%

:end
echo.
pause
