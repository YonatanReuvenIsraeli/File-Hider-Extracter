@echo off
setlocal
title File Hider/Extracter
echo Program Name: File Hider/Extracter
echo Version: 1.3.0
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
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
goto Overwrite

:NotHide1
echo "%Hide1%" does not exist!
goto 1

:NotHide2
echo "%Hide2%" does not exist!
goto 1

:Overwrite
set overwrite=
set /p overwrite="This will overwrite an alternate data stream with the same name at "%Hide1%" if it exists. Are you sure you want to continue? (Yes/No)
if /i "%overwrite%"=="Yes" goto Hide
if /i "%overwrite%"=="No" goto Start
echo Invalid Syntax!
goto Overwrite

:Hide
type "%Hide1%" > "%Hide2%":"%Hide3%" > nul 2>&1
if not "%errorlevel%"=="0" goto HideError
echo.
echo Alternate data stream created! Press any key to go to the main menu.
pause > nul 2>&1
goto Start

:HideError
echo There has been an error you can try again.
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
if not exist "%Show3%" goto ShowError1
echo.
set Show4=
set /p Show4="What to you want the extracted file do be named? "
if exist "%Show3%\%Show4%" goto ShowError2
expand "%Show1%":"%Show2%" "%Show3%\%Show4%" > nul 2>&1
if not "%errorlevel%"=="0" goto ShowError3
echo.
echo Alternate data stream exracted! Your extracted file is at "%Show3%\%Show4%". Press any key to go to the main menu.
goto Start

:NotShow1
echo "%Show1%" does not exist!
goto 2

:ShowError1
echo Error! Path not found. Please try again.
goto 2

:ShowError2
echo Error! File already exists. Please rename "%Show3%\%Show4%" or move "%Show3%\%Show4%" to another location and try again.
goto 2


:ShowError3
echo Error! Invalid file name. Please try again.
goto 2

:3
endlocal
exit
