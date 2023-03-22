REM This restores files. Do not run manually!
copy "(LW Backup) XComEW.exe" "..\Binaries\Win32\XComEW.exe"

copy "(LW Backup) XComGame.upk" "..\XComGame\CookedPCConsole\XComGame.upk"
copy "(LW Backup) XComStrategyGame.upk" "..\XComGame\CookedPCConsole\XComStrategyGame.upk"
copy "(LW Backup) UICollection_Strategy_SF.upk" "..\XComGame\CookedPCConsole\UICollection_Strategy_SF.upk"
copy "(LW Backup) UICollection_Tactical_SF.upk" "..\XComGame\CookedPCConsole\UICollection_Tactical_SF.upk"
copy "(LW Backup) UICollection_Common_SF.upk" "..\XComGame\CookedPCConsole\UICollection_Common_SF.upk"
copy "(LW Backup) gfxInterception_SF.upk" "..\XComGame\CookedPCConsole\gfxInterception_SF.upk"
copy "(LW Backup) Engine.upk" "..\XComGame\CookedPCConsole\Engine.upk"
copy "(LW Backup) XComGame.upk.uncompressed_size" "..\XComGame\CookedPCConsole\XComGame.upk.uncompressed_size"
copy "(LW Backup) XComStrategyGame.upk.uncompressed_size" "..\XComGame\CookedPCConsole\XComStrategyGame.upk.uncompressed_size"
copy "(LW Backup) Engine.upk.uncompressed_size" "..\XComGame\CookedPCConsole\Engine.upk.uncompressed_size"

copy "(LW Backup) XComGame.int" "..\XComGame\Localization\INT\XComGame.int"
copy "(LW Backup) XComStrategyGame.int" "..\XComGame\Localization\INT\XComStrategyGame.int"
copy "(LW Backup) Subtitles.int" "..\XComGame\Localization\INT\Subtitles.int"
copy "(LW Backup) XComUIShell.int" "..\XComGame\Localization\INT\XComUIShell.int"
copy "(LW Backup) XComGame.esn" "..\XComGame\Localization\ESN\XComGame.esn"
copy "(LW Backup) XComStrategyGame.esn" "..\XComGame\Localization\ESN\XComStrategyGame.esn"
copy "(LW Backup) Subtitles.esn" "..\XComGame\Localization\ESN\Subtitles.esn"
copy "(LW Backup) XComUIShell.esn" "..\XComGame\Localization\ESN\XComUIShell.esn"

copy "(LW Backup) XComGame.fra" "..\XComGame\Localization\FRA\XComGame.fra"
copy "(LW Backup) XComStrategyGame.fra" "..\XComGame\Localization\FRA\XComStrategyGame.fra"
copy "(LW Backup) Subtitles.fra" "..\XComGame\Localization\FRA\Subtitles.fra"
copy "(LW Backup) XComUIShell.fra" "..\XComGame\Localization\FRA\XComUIShell.fra"

copy "(LW Backup) DefaultGameCore.ini" "..\XComGame\Config\DefaultGameCore.ini"
copy "(LW Backup) DefaultEngine.ini" "..\XComGame\Config\DefaultEngine.ini"
copy "(LW Backup) DefaultMaps.ini" "..\XComGame\Config\DefaultMaps.ini"
copy "(LW Backup) DefaultGameData.ini" "..\XComGame\Config\DefaultGameData.ini"
copy "(LW Backup) DefaultContent.ini" "..\XComGame\Config\DefaultContent.ini"
copy "(LW Backup) DefaultInput.ini" "..\XComGame\Config\DefaultInput.ini"
copy "(LW Backup) DefaultGame.ini" "..\XComGame\Config\DefaultGame.ini"
copy "(LW Backup) DefaultLoadouts.ini" "..\XComGame\Config\DefaultLoadouts.ini"
copy "(LW Backup) DefaultNameList.ini" "..\XComGame\Config\DefaultNameList.ini"

REM Moving stuff to the My Docs folder. Should work for all users because it fetches the data from the Registry.
REM For users with old Windows. Note the single TAB as a delim.
REM FOR /F "tokens=3 delims=	" %%G IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') DO (SET docsdir=%%G)
REM del "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComStrategyGame.INT"
REM del "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComGame.INT"
REM copy "(LW Backup My Docs) XComStrategyGame.INT" "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComStrategyGame.INT"
REM copy "(LW Backup My Docs) XComGame.INT" "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComGame.INT"


REM For users with new Windows. Note the SPACE as a delim (default action in new Windows).
REM For users with no space in the actual path.
REM FOR /F "tokens=3*" %%G IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') DO (SET docsdir=%%G)
REM del "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComStrategyGame.INT"
REM del "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComGame.INT"
REM copy "(LW Backup My Docs) XComStrategyGame.INT" "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComStrategyGame.INT"
REM copy "(LW Backup My Docs) XComGame.INT" "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComGame.INT"


REM For users with 1 space in the actual path.
REM FOR /F "tokens=3*" %%G IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') DO (SET docsdir=%%G %%H)
REM del "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComStrategyGame.INT"
REM del "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComGame.INT"
REM copy "(LW Backup My Docs) XComStrategyGame.INT" "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComStrategyGame.INT"
REM copy "(LW Backup My Docs) XComGame.INT" "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComGame.INT"


REM For users with 2 spaces in the actual path.
REM FOR /F "tokens=3*" %%G IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') DO (SET docsdir=%%G %%H %%I)
REM del "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComStrategyGame.INT"
REM del "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComGame.INT"
REM copy "(LW Backup My Docs) XComStrategyGame.INT" "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComStrategyGame.INT"
REM copy "(LW Backup My Docs) MyDocs XComGame.INT" "%docsdir%\My Games\XCOM - Enemy Unknown\XComGame\Localization\INT\XComGame.INT"
