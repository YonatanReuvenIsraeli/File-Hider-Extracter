@echo off
setlocal
title File Hider/Extracter
goto Start

:Start
echo Do you want to-
echo [1] Hide File
echo [2] Extract File
echo [3] Close
set Input=
set /p Input="What do you want to do? (1-3) "
if /i "%Input%"=="1" goto 1
if /i "%Input%"=="2" goto 2
if /i "%Input%"=="2" goto 3
echo Invalid Syntax!
echo.
goto Start

:1
echo.
set Hide1=
set /p Hide1="What is the full path to the file are you trying to hide? "
if not exist "%Hide1%" goto NotHide1
echo.
set Hide2=
set /p Hide2="What is the full path to the file that you want to hide %Hide1% in? "
if not exist "%Hide2%" goto NotHide2
echo.
set Hide3=
set /p Hide3="What will you like to name this alternate data stream? "
type "%Hide1%" > "%Hide2%":"%Hide3%"
echo.
echo Alternate data stream created! Press any key to go to the main menu.
pause >nul
echo.
goto Start

:NotHide1
echo "%Hide1%" does not exist!
goto 1

:NotHide2
echo "%Hide2%" does not exist!
goto 1

:2
echo.
set Show1=
set /p Show1="What is the full path to the file that the alternate data stream is hidden in? "
if not exist "%Show1%" goto NotShow1
echo.
set Show2=
set /p Show2="What is the name of the alternate data stream? "
echo.
set Show3=
set /p Show3="What do you want the full path of the extracted file to be? "
expand "%Show1%":"%Show2%" "%Show3%"
if errorlevel 1 goto Error
echo.
echo Alternate data stream exracted! Your extracted file is at "%Show3%". Press any key to go to the main menu.
pause >nul
echo.
goto Start

:NotShow1
echo "%Show1%" does not exist!
goto 2

:Error
echo.
echo Error! File not found. Please try again.
goto 2

:3
endlocal
exit
