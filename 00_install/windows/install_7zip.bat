@echo off

set TMP=%WS%\.tmp
set ZIPVERSION=2106-x64
set ZIPINST=https://www.7-zip.org/a/7z%ZIPVERSION%.exe
set ZIP=%DEVTOOLS%\7zip

if not exist %TMP% (
    md %TMP%
)

:: download and start installation
curl -# -L -o %TMP%\7zip-%ZIPVERSION%.exe %ZIPINST%
call %TMP%\7zip-%ZIPVERSION%.exe /S /D=%ZIP%
