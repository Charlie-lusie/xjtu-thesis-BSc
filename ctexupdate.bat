@echo off
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo     ����������Ҫ�ϳ�ʱ�䣬�벻Ҫ�رձ����ڣ�
echo.
echo        ���ļ����Ҽ�������ԱȨ�ޡ����У�
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.


mpm --set-repository http://mirrors.ustc.edu.cn/CTAN/systems/win32/miktex/tm/packages/
::mpm --set-repository ftp://ftp.ctex.org/mirrors/CTAN/systems/win32/miktex/tm/packages/
echo Դ���óɹ�
mpm --admin --update --verbose
mpm --admin --update --verbose
echo �������
mpm --admin --install=amslatex-primer
mpm --admin --install=amsmath
mpm --admin --install=amscls
mpm --admin --install=tex-gyre-math
echo �޸����
mpm --admin --update-db
initexmf --admin --update-fndb
echo ˢ�����ݿ����

pause