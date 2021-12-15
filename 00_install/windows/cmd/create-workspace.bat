@echo off

:: create .workspace folder under %USERPROFILE% directory
set WS=%USERPROFILE%\.workspace

:: create folders
set DEVTOOLS=%WS%\devtools
set PROJECTS=%WS%\projects
set WSTMP=%WS%\.tmp

if not exist %DEVTOOLS% (
    echo.
    echo Adding .workspace/devtools folder to user environment variables.
    md %DEVTOOLS%
    setx DEVTOOLS %DEVTOOLS%
)

if not exist %PROJECTS% (
    echo.
    echo Adding .workspace/projects folder to user environment variables.
    md %PROJECTS%
    setx PROJECTS %PROJECTS%
)

if not exist %WSTMP% (
    md %WSTMP%
)
