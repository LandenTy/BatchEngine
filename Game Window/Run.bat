@echo off
title Screen
chcp 437 > nul
color 3f

set/a width=40
set/a height=20
set/a lastlaw=%width% * %height%
set/a bottombarrier=%lastlaw% - %width%
set/a law=0
set/a sidea=%width% +1
set/a sideb=%width% * 2

set marker=0
set barrier=#
set empty=-
set behind=%empty%
set/a place=222
echo.
title Game Window%
:LawLoop
if %law%==%lastlaw% goto ObjectPlace
set/a law=%law% +1

if %law% LEQ %width% (
set v%law%=%barrier%
goto LawLoop
)

if %law% GTR %bottombarrier% (
set v%law%=%barrier%
goto LawLoop
)

if %law%==%sidea% (
set v%law%=%barrier%
set/a sidea=%sidea% + %width%
goto LawLoop
)

if %law%==%sideb% (
set v%law%=%barrier%
set/a sideb=%sideb% + %width%
echo  *
goto LawLoop
) else (
set v%law%=%empty%
goto LawLoop
)

:ObjectPlace

set v%place%=%marker%

:ScreenLoop
cls
call ./BatchEngine/screen.bat
set shove=y
rem start move.vbs
set/p shove=     

:: Movement Commands
if %shove%==w (
set shove=-%width%
goto Move
)
if %shove%==s (
set shove=+%width%
goto Move
)
if %shove%==d (
set shove=+1
goto Move
)
if %shove%==a (
set shove=-1
goto Move
)
goto ScreenLoop

:Move
set/a spotcheck=%place% %shove%
set checker=%%v%spotcheck%%%
echo set spotcheck=%checker%>spotcheck.bat
call spotcheck.bat
if %spotcheck%==%barrier% goto ScreenLoop
set v%place%=%behind%
set/a place=%place% %shove%
set v%place%=%marker%
rem if %behind%==%symbol% set behind=%symbol%
set behind=%spotcheck%
goto ScreenLoop
