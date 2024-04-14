@echo off
setlocal
title File Hider/Extracter
echo File Hider/Extracter v1.0.2
goto Start

:Start
echo.
echo [1] Hide File
echo [2] Extract File
echo [3] Close
set Input=
set /p Input="What do you want to do? (1-3) "
if /i "%Input%"=="1" goto 1
if /i "%Input%"=="2" goto 2
if /i "%Input%"=="2" goto 3
echo Invalid Syntax!
goto Start

:1
echo.
set Hide1=
set /p Hide1="What is the full path to the file are you trying to hide? "
if not exist "%Hide1%" goto NotHide1
echo.
set Hide2=
set /p Hide2="What is the full path to the file that you want to hide "%Hide1%" in? "
if not exist "%Hide2%" goto NotHide2
echo.
set Hide3=
set /p Hide3="What will you like to name this alternate data stream? "
type "%Hide1%" > "%Hide2%":"%Hide3%"
echo.
echo Alternate data stream created! Press any key to go to the main menu.
pause > nul
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
set /p Show3="What do you want the full path to the folder of the extracted file to be? "
if not exist "%Show3%" goto Error1
echo.
set Show4=
set /p Show4="What to you want the extracted file do be named? "
if exist "%Show3%\%Show4%" goto Error2
expand "%Show1%":"%Show2%" "%Show3%\%Show4%"
if exist "%Show3%\%Show4%" goto Success
echo Error! Invalid file name. Please try again.
goto 2

:NotShow1
echo "%Show1%" does not exist!
goto 2

:Error1
echo.
echo Error! Path not found. Please try again.
goto 2

:Error2
echo.
echo Error! File already exists. Please try again.
goto 2

:Success
echo.
echo Alternate data stream exracted! Your extracted file is at "%Show3%\%Show4%". Press any key to go to the main menu.
pause > nul
goto Start

:3
endlocal
exit
