;InnoSetupVersion=5.5.0

[Setup]
AppName=XCom Long War EW Mod
AppVersion=1.0
AppPublisher=JohnnyLump
AppPublisherURL=http://www.nexusmods.com/xcom/mods/88
AppSupportURL=http://www.nexusmods.com/xcom/mods/88
AppUpdatesURL=http://www.nexusmods.com/xcom/mods/88
DefaultDirName={reg:HKCU\SOFTWARE\Valve\Steam,SteamPath}\steamapps\common\XCom-Enemy-Unknown\XEW
OutputBaseFilename=Long War EW 1.0 for PC-88-1-0
Compression=lzma
AllowNoIcons=yes

[Files]
; Source: "{app}\Binaries\Win32\XComEW.exe"; DestDir: "{app}\Binaries\Win32"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall skipifsourcedoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComEW.exe"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComGame.upk"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComStrategyGame.upk"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) Engine.upk"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) UICollection_Strategy_SF.upk"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) UICollection_Tactical_SF.upk"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) UICollection_Common_SF.upk"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) gfxInterception_SF.upk"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComGame.upk.uncompressed_size"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComStrategyGame.upk.uncompressed_size"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) Engine.upk.uncompressed_size"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultEngine.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultGameCore.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultMaps.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultInput.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultContent.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultGameData.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultGame.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultLoadouts.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) DefaultNameList.ini"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComGame.int"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComStrategyGame.int"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) Subtitles.int"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComUIShell.int"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComGame.esn"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComStrategyGame.esn"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) Subtitles.esn"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComUIShell.esn"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComGame.fra"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComStrategyGame.fra"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) Subtitles.fra"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComUIShell.fra"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComGame.pol"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComStrategyGame.pol"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) Subtitles.pol"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComUIShell.pol"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComGame.ita"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) XComStrategyGame.ita"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
; Source: "{app}\Long War Files\(LW Backup) Subtitles.ita"; DestDir: "{app}\Long War Files"; Check: "MyFileCheck(ExpandConstant('{app}\Long War Files\res_backup.bat'))"; MinVersion: 0.0,5.0; Flags: skipifsourcedoesntexist onlyifdoesntexist ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\XComGame.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\XComStrategyGame.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Engine.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\UICollection_Strategy_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\UICollection_Tactical_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\UICollection_Common_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\gfxInterception_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\LongWar.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\XComMutator.u"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\XComLZMutator.u"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Deployment.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultGameCore.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultEngine.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultMaps.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultInput.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultContent.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultGameData.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultGame.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultLoadouts.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultNameList.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultLZMutator.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultRandomSpawns.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultMutatorLoader.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Config\DefaultGameCore - Training.ini"; DestDir: "{app}\XComGame\Config"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_clean_exaltprops.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_clean_overseer_deepwoods.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_clean_overseer_trench.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_clean_overseer_stonewall.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_clean_overseer_barrens.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_clean_nukedcity.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_clean_hive.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_terrorize_piera.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_hide_randomized_objects.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_clean_battleship.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_alienbase1.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_alienbase2.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_convstore.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_liquorestore.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_barrens.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_truckstop_door.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_forest_trench.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_convstore_terror.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_deepwoods.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_marshlands.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_scoutriver.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_scoutrivervalley.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_officepaper2.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_xcomhq-mp.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_xcomhq.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_commercialstreet.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_commercialstreet2.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_commercialstreet2_terror.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_smallcemetery.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_quagmire.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_piera.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_piera_warehousefix.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_lidhive.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_highwayconstruction_ewi.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_streetoverpassewi.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_commercialalley.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_commercialalley_ewi.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_commercialalley_carflank.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_pickuptruckfix.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_farm.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_gasstationewi.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_officepaper_ewi.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_fastfood_ewi.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_roadhouse.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_deluge.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_portent.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_cnfndlight.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_lowfriends.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_rooftopconstr.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_trainyard.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_streetoverpass.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_highwayconstruction.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_commercialrestaurant.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_pier_terror.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_nukedcity.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_truckstop.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_exalthq.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_abductor_windingstream.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_streethurricane.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_slaughterhouse.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_researchoutpost.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_officepaper.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_officepaper_terror.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_bar.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_highwaybridge.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_highway1.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_fastfood.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_boulevard.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_icecreamshop.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_abductor_farm.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_battleship.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_battleship_roof.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_ship_grove.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_ship_gorge.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_ship_overlook.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_ship_wildfire.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_forestgrove_computerfix.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_rockygorge_computerfix.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_overseer_deepwoods.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_overseer_trench.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_overseer_stonewall.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_overseer_barrens.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_dirtroad.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_policestation.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_scoutcity.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_furies.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\patch_militaryammo.upk"; DestDir: "{app}\XComGame\CookedPCConsole"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\INT\XComGame.int"; DestDir: "{app}\XComGame\Localization\INT"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\INT\XComStrategyGame.int"; DestDir: "{app}\XComGame\Localization\INT"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\INT\Subtitles.int"; DestDir: "{app}\XComGame\Localization\INT"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\INT\XComUIShell.int"; DestDir: "{app}\XComGame\Localization\INT"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\ESN\XComGame.esn"; DestDir: "{app}\XComGame\Localization\ESN"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\ESN\XComStrategyGame.esn"; DestDir: "{app}\XComGame\Localization\ESN"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\ESN\Subtitles.esn"; DestDir: "{app}\XComGame\Localization\ESN"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\ESN\XComUIShell.esn"; DestDir: "{app}\XComGame\Localization\ESN"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\FRA\XComGame.fra"; DestDir: "{app}\XComGame\Localization\FRA"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\FRA\XComStrategyGame.fra"; DestDir: "{app}\XComGame\Localization\FRA"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\FRA\Subtitles.fra"; DestDir: "{app}\XComGame\Localization\FRA"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\FRA\XComUIShell.fra"; DestDir: "{app}\XComGame\Localization\FRA"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\POL\XComGame.pol"; DestDir: "{app}\XComGame\Localization\POL"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\POL\XComStrategyGame.pol"; DestDir: "{app}\XComGame\Localization\POL"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\POL\Subtitles.pol"; DestDir: "{app}\XComGame\Localization\POL"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\POL\XComUIShell.pol"; DestDir: "{app}\XComGame\Localization\POL"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\ITA\XComGame.ita"; DestDir: "{app}\XComGame\Localization\ITA"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\ITA\XComStrategyGame.ita"; DestDir: "{app}\XComGame\Localization\ITA"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\Localization\ITA\Subtitles.ita"; DestDir: "{app}\XComGame\Localization\ITA"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\Long_War_EW_ReadMe.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long_War_EW_Armor_Kit_Codes.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long_War_EW_Detailed_Install_Troubleshooting.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long_War_3_perk_tree.jpg"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long_War_3_tech_tree.png"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long_War_EW_ReadMe_Francais.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long_War_EW_Installation_Detaillee_et_Resolution_Problemes.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\LW3pt_FR.pdf"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\LW3tt_FR.pdf"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long_War_EW_ReadMe_Spanish.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\CommandLine.dll"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\CommandLine.xml"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\Long_War_EW_Config_exe.xml"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\XCOMModHelper.exe"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\XCOMModHelper.pdb"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\XCOMModHelper.vshost.exe"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\XCOMModHelper.vshost.exe.manifest"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\NLog.dll"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\NLog.xml"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Long War Files\run_init.bat"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_SouthAfrican_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_GermanAccent_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_GermanAccent_Bank_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_British_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_British_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_SouthAfrican_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_SouthAfrican_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_British_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_SouthAfrican_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_SouthAfrican_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Swiss_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_PolishAccent_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_British_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Singaporean_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice3_Australian_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Irish_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Australian_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice2_Australian_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Irish_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Dutch_Pkg_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Dutch_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\FemaleVoice1_Malaysian_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank0_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank1_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank2_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank3_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank4_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank5_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank6_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank7_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank8_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank9_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank10_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank11_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank12_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank13_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Australian_Bank14_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Scottish_Bank_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_Scottish_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\XComGame\CookedPCConsole\Voice\MaleVoice1_TheGeneral_SF.upk"; DestDir: "{app}\XComGame\CookedPCConsole\Voice"; MinVersion: 0.0,5.0; Flags: uninsneveruninstall ignoreversion 
Source: "{app}\Long War Files\res_backup.bat"; DestDir: "{app}\Long War Files"; MinVersion: 0.0,5.0; Flags: ignoreversion 

[Run]
Filename: "{app}\Long War Files\run_init.bat"; StatusMsg: "Deleting uncompressed_size files."; MinVersion: 0.0,5.0; 
Filename: "{app}\Long War Files\XCOMModHelper.exe"; Parameters: "-c Long_War_EW_Config_exe.xml -x ""{app}\.."""; StatusMsg: "Patching exe."; MinVersion: 0.0,5.0; 
Filename: "{app}\Long_War_EW_ReadMe.txt"; Description: "View the ReadMe for gameplay guidance and installation troubleshooting. MAKE SURE YOU READ THIS OR ELSE EVENTS IN THE MOD WILL NOT MAKE SENSE."; MinVersion: 0.0,5.0; Flags: shellexec postinstall skipifsilent nowait

[UninstallRun]
Filename: "{app}\Long War Files\res_backup.bat"; RunOnceId: "DelService"; StatusMsg: "Uninstalling..."; MinVersion: 0.0,5.0; 

[Components]
Name: "main"; Description: "Long War mod"; Types: "main"; MinVersion: 0.0,5.0; 
Name: "gameversion"; Description: "Game Version"; Types: "main"; MinVersion: 0.0,5.0; 
Name: "gameversion\original"; Description: "Enemy Within"; MinVersion: 0.0,5.0; 
Name: "language"; Description: "Game Language"; Types: "main"; MinVersion: 0.0,5.0; 
Name: "language\english"; Description: "English"; MinVersion: 0.0,5.0; 
Name: "language\spanish"; Description: "Spanish"; MinVersion: 0.0,5.0; 
Name: "language\french"; Description: "French"; MinVersion: 0.0,5.0; 
Name: "language\italian"; Description: "Italian"; MinVersion: 0.0,5.0; 
Name: "language\polish"; Description: "Polish"; MinVersion: 0.0,5.0; 

[Types]
Name: "main"; Description: "Long War"; MinVersion: 0.0,5.0; 

[CustomMessages]
english.NameAndVersion=%1 version %2
english.AdditionalIcons=Additional icons:
english.CreateDesktopIcon=Create a &desktop icon
english.CreateQuickLaunchIcon=Create a &Quick Launch icon
english.ProgramOnTheWeb=%1 on the Web
english.UninstallProgram=Uninstall %1
english.LaunchProgram=Launch %1
english.AssocFileExtension=&Associate %1 with the %2 file extension
english.AssocingFileExtension=Associating %1 with the %2 file extension...
english.AutoStartProgramGroupDescription=Startup:
english.AutoStartProgram=Automatically start %1
english.AddonHostProgramNotFound=%1 could not be located in the folder you selected.%n%nDo you want to continue anyway?

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "english"; MessagesFile: "embedded\english.isl"; 
