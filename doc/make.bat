@echo off
:init
if /i {%1}=={all} goto makepdf
if /i {%1}=={help} goto help
@echo off
:init
if /i {%1}=={all} goto makepdf
if /i {%1}=={help} goto help
if /i {%1}=={clean} goto clean
if /i {%1}=={} goto all
goto help

:all
goto makepdf
pause
goto clean
goto end

:makepdf
if not exist xjtubsc.cls goto clsmissing
xelatex main.tex -synctex=1 -undump=xelatex --shell-escape
bibtex example.tex
xelatex main.tex -synctex=1 -undump=xelatex --shell-escape
xelatex main.tex -synctex=1 -undump=xelatex --shell-escape

:help
echo ���������밴1�����������밴2, ......

:clean
del *.aux
del *.log
del *.out
del *.toc

:clsmissing
echo "��ʧ cls"

:end