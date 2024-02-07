@echo off
color 0a
title KeyStrokeSim
set shove=y
goto Start

:Start
cls
choice /C WASD /M "Do you want to proceed? (Y/N)"
set "shove=%ERRORLEVEL%"
if %errorlevel%==1 goto Finished
if %errorlevel%==2 goto Finished
if %errorlevel%==3 goto Finished
if %errorlevel%==4 goto Finished

:Finished
echo %shove%
pause
goto Start
