@echo off
:: BatchGotAdmin  
::-------------------------------------  
REM  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
  
REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (  
    echo Requesting administrative privileges...  
    goto UACPrompt  
) else ( goto gotAdmin )  
  
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
  
    "%temp%\getadmin.vbs"  
    exit /B  
  
:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  
    pushd "%CD%"  
    CD /D "%~dp0"  
::--------------------------------------  
set nStep=0
:cleanTemp
dir %temp%\mik* /a /b > %temp%\dirlist.txt 2>nul
for /f %%i in (%temp%\dirlist.txt) do rd /S /Q %temp%\%%i 2>nul
del %temp%\dirlist.txt
if %nStep%==9 goto 1stup
if %nStep%==1 goto 2edup
if %nStep%==2 goto repairPack
if %nStep%==3 goto DBRen

echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo     ����������Ҫ�ϳ�ʱ�䣬�벻Ҫ�رձ����ڣ�
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.

mpm --set-repository http://mirrors.ustc.edu.cn/CTAN/systems/win32/miktex/tm/packages/
::mpm --set-repository ftp://ftp.ctex.org/mirrors/CTAN/systems/win32/miktex/tm/packages/
echo Դ���óɹ�
start miktex-update_admin
:isGuiUpdate1
ping -n 5 127.0.0.1 1>nul 2>nul
tasklist /nh | find /i "miktex-update_admin" 2>nul 1>nul
if %ERRORLEVEL% EQU 0 goto isGuiUpdate1
echo up1complete
set nStep=9
goto cleanTemp


:1stup
ping -n 10 127.0.0.1 1>nul 2>nul
start miktex-update_admin
:isGuiUpdate2
ping -n 5 127.0.0.1 1>nul 2>nul
tasklist /nh | find /i "miktex-update_admin" 1>nul 2>nul
if %ERRORLEVEL% EQU 0 goto isGuiUpdate2
echo up2complete
set nStep=1
goto cleanTemp

:2edup
ping -n 10 127.0.0.1 1>nul 2>nul
mpm --admin --update --verbose
echo �������
set nStep=2
goto cleanTemp

:repairPack
mpm --admin --install=amslatex-primer
mpm --admin --install=amsmath
mpm --admin --install=amscls
mpm --admin --install=tex-gyre-math
echo �޸����
set nStep=3
goto cleanTemp


:DBRen
mpm --admin --update-db
initexmf --admin --update-fndb
echo ˢ�����ݿ����


pause