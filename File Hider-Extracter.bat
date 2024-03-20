@echo off
setlocal
title File Hider
goto Start

:Start
echo Do you want to-
echo [1] Hide File
echo [2] Extract File
echo [3] Close
set /p input="What do you want to do? (1-3) "
if /i "%input%"=="1" goto 1
if /i "%input%"=="2" goto 2
if /i "%input%"=="2" goto 3
echo Invalid Syntax
goto Main

:1
echo.
set /p DriveLetter="What drive are the files in? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto CheckExist1
if /i "%DriveLetter%"=="B:" goto CheckExist1
if /i "%DriveLetter%"=="C:" goto CheckExist1
if /i "%DriveLetter%"=="D:" goto CheckExist1
if /i "%DriveLetter%"=="E:" goto CheckExist1
if /i "%DriveLetter%"=="F:" goto CheckExist1
if /i "%DriveLetter%"=="G:" goto CheckExist1
if /i "%DriveLetter%"=="H:" goto CheckExist1
if /i "%DriveLetter%"=="I:" goto CheckExist1
if /i "%DriveLetter%"=="J:" goto CheckExist1
if /i "%DriveLetter%"=="K:" goto CheckExist1
if /i "%DriveLetter%"=="L:" goto CheckExist1
if /i "%DriveLetter%"=="M:" goto CheckExist1
if /i "%DriveLetter%"=="N:" goto CheckExist1
if /i "%DriveLetter%"=="O:" goto CheckExist1
if /i "%DriveLetter%"=="P:" goto CheckExist1
if /i "%DriveLetter%"=="Q:" goto CheckExist1
if /i "%DriveLetter%"=="R:" goto CheckExist1
if /i "%DriveLetter%"=="S:" goto CheckExist1
if /i "%DriveLetter%"=="T:" goto CheckExist1
if /i "%DriveLetter%"=="U:" goto CheckExist1
if /i "%DriveLetter%"=="V:" goto CheckExist1
if /i "%DriveLetter%"=="W:" goto CheckExist1
if /i "%DriveLetter%"=="X:" goto CheckExist1
if /i "%DriveLetter%"=="Y:" goto CheckExist1
if /i "%DriveLetter%"=="Z:" goto CheckExist1
echo Invalid Syntax!
goto CheckExist1

:CheckExist1
if not exist "%DriveLetter%" goto NotExist1
%DriveLetter%
goto Path1

:NotExist1
echo "%DriveLetter%" does not exist. Please try again.
goto 1

:Path1
echo.
set /p Path="What is the full path to your folder that contains the files? "
if not exist "%Path%" goto NotExistPath1
cd %Path%
goto Hide

:NotExistPath1
echo "%Path%" does not exist. Please try again.
goto 1

:Hide
echo.
set /p Hide1="Which file are you trying to hide? "
if not exist "%Path%\%Hide1%" goto NotHide1
echo.
set /p Hide2="Which file do you want to hide %Hide1% in? "
if not exist "%Path%\%Hide1%" goto NotHide2
echo.
set /p Hide3="What will you like to name this alternate data stream? "
type %Hide1% > %Hide2%:%Hide3%
echo.
echo Alternate data stream created! Press any key to go to the main menu.
pause >nul
goto Main

:NotHide1
echo "%Path%\%Hide1%" does not exist!
goto 1

:NotHide2
echo "%Path%\%Hide2%" does not exist!
goto 1

:2
echo.
set /p DriveLetter="What drive are the file in? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto CheckExist2
if /i "%DriveLetter%"=="B:" goto CheckExist2
if /i "%DriveLetter%"=="C:" goto CheckExist2
if /i "%DriveLetter%"=="D:" goto CheckExist2
if /i "%DriveLetter%"=="E:" goto CheckExist2
if /i "%DriveLetter%"=="F:" goto CheckExist2
if /i "%DriveLetter%"=="G:" goto CheckExist2
if /i "%DriveLetter%"=="H:" goto CheckExist2
if /i "%DriveLetter%"=="I:" goto CheckExist2
if /i "%DriveLetter%"=="J:" goto CheckExist2
if /i "%DriveLetter%"=="K:" goto CheckExist2
if /i "%DriveLetter%"=="L:" goto CheckExist2
if /i "%DriveLetter%"=="M:" goto CheckExist2
if /i "%DriveLetter%"=="N:" goto CheckExist2
if /i "%DriveLetter%"=="O:" goto CheckExist2
if /i "%DriveLetter%"=="P:" goto CheckExist2
if /i "%DriveLetter%"=="Q:" goto CheckExist2
if /i "%DriveLetter%"=="R:" goto CheckExist2
if /i "%DriveLetter%"=="S:" goto CheckExist2
if /i "%DriveLetter%"=="T:" goto CheckExist2
if /i "%DriveLetter%"=="U:" goto CheckExist2
if /i "%DriveLetter%"=="V:" goto CheckExist2
if /i "%DriveLetter%"=="W:" goto CheckExist2
if /i "%DriveLetter%"=="X:" goto CheckExist2
if /i "%DriveLetter%"=="Y:" goto CheckExist2
if /i "%DriveLetter%"=="Z:" goto CheckExist2
echo Invalid Syntax!
goto 2

:CheckExist2
if not exist "%DriveLetter%" goto NotExist2
%DriveLetter%
goto Path2

:NotExist2
echo "%DriveLetter%" does not exist. Please try again.
goto 2

:Path2
echo.
set /p Path="What is the full path to your folder that contains the files? "
if not exist "%Path%" goto NotExistPath2
cd %Path%
goto Show

:NotExistPath2
echo "%Path%" does not exist. Please try again.
goto 2

:Show
echo.
set /p Show1="Which file that the alternate data stream is hidden in? "
if not exist "%Path%\%Show1%" goto NotShow1
echo.
set /p Show2="What is the name of the alternate data stream? "
if not exist "%Path%\%Show2%" goto NotShow2
echo.
set /p Show3="What will you like to name the extracted file? "
expand %Show1%:%Show2% %Show3%
echo.
echo Alternate data stream exracted! Press any key to go to the main menu.
pause >nul
goto Main

:NotShow1
echo "%Path%\%Show1%" does not exist!
goto 2

:NotShow2
echo "%Path%\%Show2%" does not exist!
goto 1

:Main
echo.
echo Do you want to-
echo [1] Hide File
echo [2] Extract File
echo [3] Close
set /p input="What do you want to do? (1-3) "
if /i "%input%"=="1" goto 1
if /i "%input%"=="2" goto 2
if /i "%input%"=="3" goto 3
echo Invalid Syntax
goto Main

:3
endlocal
exit
