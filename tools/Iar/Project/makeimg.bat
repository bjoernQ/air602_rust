@rem ����0: exe
@rem ����1: ����bin�ļ� ,ԭʼ�ļ�����ѹ�����ļ�
@rem ����2: ����ļ�(Ŀ�������ļ���
@rem ����3: �����ļ�����,0��image�ļ���1��FLASHBOOT�ļ� 2��secboot�ļ�
@rem ����4: �Ƿ�ѹ���ļ���0��plain�ļ���1��ѹ�������ļ�
@rem ����5: �汾���ļ�
@rem ����6�������ļ���FLASH��Ĵ��λ�ã����λ�ã�
@rem ����7����������ļ�����λ�ã����λ�ã�
@rem ����8��ԭʼbin�ļ�

@echo off

set BINPATH=%1\..\..\..\bin
set TOOLSPATH=%1\..\..

copy %1\Release\List\w60x.map %BINPATH%\WM_W600.map
copy %1\Release\Exe\WM_W600.bin %BINPATH%\WM_W600.bin

copy %BINPATH%\version.txt %BINPATH%\version_bk.txt

%TOOLSPATH%\wm_gzip.exe "%BINPATH%\WM_W600.bin"
%TOOLSPATH%\makeimg.exe "%BINPATH%\WM_W600.bin" "%BINPATH%\WM_W600.img" 0 0 "%BINPATH%\version.txt" 90000 10100
%TOOLSPATH%\makeimg.exe "%BINPATH%\WM_W600.bin.gz" "%BINPATH%\WM_W600_GZ.img" 0 1 "%BINPATH%\version.txt" 90000 10100 "%BINPATH%\WM_W600.bin" 
%TOOLSPATH%\makeimg.exe "%BINPATH%\WM_W600.bin" "%BINPATH%\WM_W600_SEC.img" 0 0 "%BINPATH%\version.txt" 90000 10100
%TOOLSPATH%\makeimg_all.exe "%BINPATH%\secboot.img" "%BINPATH%\WM_W600.img" "%BINPATH%\WM_W600.FLS"
@del "%BINPATH%\WM_W600.img"