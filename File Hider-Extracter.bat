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
if /i "%DriveLetter%"=="A:" goto DriveLetter
if /i "%DriveLetter%"=="B:" goto DriveLetter
if /i "%DriveLetter%"=="C:" goto DriveLetter
if /i "%DriveLetter%"=="D:" goto DriveLetter
if /i "%DriveLetter%"=="E:" goto DriveLetter
if /i "%DriveLetter%"=="F:" goto DriveLetter
if /i "%DriveLetter%"=="G:" goto DriveLetter
if /i "%DriveLetter%"=="H:" goto DriveLetter
if /i "%DriveLetter%"=="I:" goto DriveLetter
if /i "%DriveLetter%"=="J:" goto DriveLetter
if /i "%DriveLetter%"=="K:" goto DriveLetter
if /i "%DriveLetter%"=="L:" goto DriveLetter
if /i "%DriveLetter%"=="M:" goto DriveLetter
if /i "%DriveLetter%"=="N:" goto DriveLetter
if /i "%DriveLetter%"=="O:" goto DriveLetter
if /i "%DriveLetter%"=="P:" goto DriveLetter
if /i "%DriveLetter%"=="Q:" goto DriveLetter
if /i "%DriveLetter%"=="R:" goto DriveLetter
if /i "%DriveLetter%"=="S:" goto DriveLetter
if /i "%DriveLetter%"=="T:" goto DriveLetter
if /i "%DriveLetter%"=="U:" goto DriveLetter
if /i "%DriveLetter%"=="V:" goto DriveLetter
if /i "%DriveLetter%"=="W:" goto DriveLetter
if /i "%DriveLetter%"=="X:" goto DriveLetter
if /i "%DriveLetter%"=="Y:" goto DriveLetter
if /i "%DriveLetter%"=="Z:" goto DriveLetter
echo Invalid Syntax!
goto CheckExist

:CheckExist
if not exist "%DriveLetter%" goto NotExist1
%DriveLetter%
goto Path1

:NotExist1
echo %DriveLetter% does not exist. Please try again.
goto 1

:Path1
echo.
set /p Path="What is the full path to your folder that contains the files?
if not exist "%Path%" goto NotExistPath1
cd %Path%
echo.
set /p Hide1="Which file are you trying to hide? "
echo.
set /p Hide2="Which file do you want to hide %Hide1% in? "
echo.
set /p Hide3="What will you like to name this alternate data stream? "
type  %Hide1% > %Hide2%:%Hide3%
echo.
echo alternate data stream created! Press any key to go to the main menu.
pause >nul
goto Main

:NotExistPath1
echo %Path% does not exist. Please try again.
goto 1

:2
echo.
set /p DriveLetter="What drive are the file in? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto SureDriveLetter
if /i "%DriveLetter%"=="B:" goto SureDriveLetter
if /i "%DriveLetter%"=="C:" goto SureDriveLetter
if /i "%DriveLetter%"=="D:" goto SureDriveLetter
if /i "%DriveLetter%"=="E:" goto SureDriveLetter
if /i "%DriveLetter%"=="F:" goto SureDriveLetter
if /i "%DriveLetter%"=="G:" goto SureDriveLetter
if /i "%DriveLetter%"=="H:" goto SureDriveLetter
if /i "%DriveLetter%"=="I:" goto SureDriveLetter
if /i "%DriveLetter%"=="J:" goto SureDriveLetter
if /i "%DriveLetter%"=="K:" goto SureDriveLetter
if /i "%DriveLetter%"=="L:" goto SureDriveLetter
if /i "%DriveLetter%"=="M:" goto SureDriveLetter
if /i "%DriveLetter%"=="N:" goto SureDriveLetter
if /i "%DriveLetter%"=="O:" goto SureDriveLetter
if /i "%DriveLetter%"=="P:" goto SureDriveLetter
if /i "%DriveLetter%"=="Q:" goto SureDriveLetter
if /i "%DriveLetter%"=="R:" goto SureDriveLetter
if /i "%DriveLetter%"=="S:" goto SureDriveLetter
if /i "%DriveLetter%"=="T:" goto SureDriveLetter
if /i "%DriveLetter%"=="U:" goto SureDriveLetter
if /i "%DriveLetter%"=="V:" goto SureDriveLetter
if /i "%DriveLetter%"=="W:" goto SureDriveLetter
if /i "%DriveLetter%"=="X:" goto SureDriveLetter
if /i "%DriveLetter%"=="Y:" goto SureDriveLetter
if /i "%DriveLetter%"=="Z:" goto SureDriveLetter
echo Invalid Syntax!
goto CheckExist

:CheckExist
if not exist "%DriveLetter%" goto NotExist2
%DriveLetter%
goto Path2

:NotExist2
echo %DriveLetter% does not exist. Please try again.
goto 2

:Path2
echo.
set /p Path="What is the full path to your folder that contains the files? "
if not exist "%Path%" goto NotExistPath2
cd %Path%
echo.
set /p Show1="Which file that the alternate data stream is hidden in? "
echo.
set /p Show2="What is the name of the alternate data stream? "
echo.
set /p Show3="What will you like to name the extracted file? "
expand %Show1%:%Show2% %Show3%
echo.
echo alternate data stream exracted! Press any key to go to the main menu.
pause >nul
goto Main

:NotExistPath2
echo %Path% does not exist. Please try again.
goto 2

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
