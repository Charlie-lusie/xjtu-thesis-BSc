@echo off
::����ļ������û����棬����ô���ľ�����~~
set mainpath=%~dp0
:init
cd %mainpath%
cls
echo  ----------------------------------------
echo          ����������~~~������
echo  ----------------------------------------
echo.
echo         1���鿴�����ĵ�
echo         2����������
echo         3������CTEX
echo         4����Ҫ���ˣ����Լ����T_T
echo.
echo  ----------------------------------------
set /p choice= ���ְ�( �� o �� )��
if not "%choice%"=="" set choice=%choice:~0,1%
if /i %choice%==1 goto help
if /i %choice%==2 goto makepdf
if /i %choice%==3 goto updatectex
if /i %choice%==4 goto end
echo ��Ҫ������
pause
echo.
goto init

:makepdf
xelatex main.tex
bibtex  main.tex
xelatex main.tex
xelatex main.tex
goto clean

:help
if not exist doc\main.pdf goto makehelp
start doc\main.pdf
goto init

:makehelp
cd doc
xelatex main.tex
bibtex  main.tex
xelatex main.tex
xelatex main.tex
goto clean


:clean
del *.aux
del *.log
del *.out
del *.toc
goto read

:read
start main.pdf
goto init


:updatectex
call ctexupdate.bat
goto init

:end
