@rem ����0: exe
@rem ����1: ����bin�ļ� ,ԭʼ�ļ�����ѹ�����ļ�
@rem ����2: ����ļ�(Ŀ�������ļ���
@rem ����3: �����ļ�����,0�Ǿɲ������ֵ�image�ļ���3���²������ֵ�image�ļ�
@rem ����4: �Ƿ�ѹ���ļ���0��plain�ļ���1��ѹ�������ļ�
@rem ����5: �汾���ļ�
@rem ����6�������ļ���FLASH��Ĵ��λ�ã����λ�ã�
@rem ����7����������ļ�����λ�ã����λ�ã�
@rem ����8��ԭʼbin�ļ�

@echo off

copy WM_W600.map ..\..\..\Bin
copy objs\WM_W600.bin ..\..\..\Bin
cd ..\..\..\Tools

copy ..\Bin\version.txt ..\Bin\version_bk.txt

python wm_gzip.py "..\Bin\WM_W600.bin"
python makeimg.py "..\Bin\WM_W600.bin" "..\Bin\WM_W600.img" 0 0 "..\Bin\version.txt" 90000 10100
python makeimg.py "..\Bin\WM_W600.bin.gz" "..\Bin\WM_W600_GZ.img" 0 1 "..\Bin\version.txt" 90000 10100 "..\Bin\WM_W600.bin" 
python makeimg.py "..\Bin\WM_W600.bin" "..\Bin\WM_W600_SEC.img" 0 0 "..\Bin\version.txt" 90000 10100
python makeimg_fls.py "..\Bin\secboot.img" "..\Bin\WM_W600.img" "..\Bin\WM_W600.FLS"
python makeimg_dbg.py "..\Bin\WM_W600_SEC.img" "..\Bin\WM_W600_DBG.img"
@del "..\Bin\WM_W600.img"
