@echo off

set BATCHDIR=%~dp0

:: create .workspace folder under %USERPROFILE% directory
set WS=%USERPROFILE%\.workspace
md %WS%

:: create a virtual drive W: from this .workspace folder
:: set WSDRV=W:
:: subst %WSDRV% %WS%
:: subst script into Startup folder
:: set WSDRV_STARTUP="%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\wsdrive.bat"
:: if exist %WSDRV_STARTUP% (
::     del %WSDRV_STARTUP%
::     echo @subst %WSDRV% %WS% > %WSDRV_STARTUP%
:: )

:: create devtools and projects folders
setx DEVTOOLS %WS%\devtools
setx PROJECTS %WS%\projects

md %DEVTOOLS%
md %PROJECTS%
md %WS%\.tmp

:: setup basic development tools

:: msys2-mingw64
call install_msys2-base.bat


pause
