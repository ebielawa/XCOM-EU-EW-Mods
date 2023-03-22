------------------------
INSTALLING - EW and LW
------------------------
PLEASE, READ ALL THE STEPS IN ORDER NOT TO MISS IMPORTANT NOTES.
(IF YOU ARE ONLY UPDATING TO NEW VERSION AND ALREADY MADE CUSTOM CHANGES TO DefaultMiniMods.ini - YOU CAN SKIP COPYING IT, INSTEAD JUST CHECK FOR NEW .INI ENTRIES)

1. Extract the .zip to some folder.
2. Choose LW or EW version and copy the content of 3 folders inside to corresponding folders in your XEW\XComGame folder. 

E.g. on Windows it would be like this:
Copy files from extracted "Config" to "C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Config"
Copy files from extracted "CookedPCConsole" to "C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\CookedPCConsole"
Copy files from "Localization" to "C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Localization"

For other platform the default paths to XEW\XComGame folder are as below (adjust accordingly):
Windows: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame
Linux: ﻿/home/YOURUSERNAME/.steam/steam/steamapps/common/XCom-Enemy-Unknown/xew/xcomgame
MAC: ~/Library/Application Support/Steam/steamapps/common/XCom-Enemy-Unknown/XCOMData/XEW/XComGame

IMPORTANT NOTE: LINUX AND MAC USERS NEED TO RENAME THE FILES TO LOWERCASE BEFORE COPYING
IMPORTANT NOTE: IN CASE YOU ALREADY HAD DefaultMutatorLoader.ini DO NOT OVERWRITE IT - instead see step 3 further below.

3a. Open DefaultMutatorLoader.ini and add these lines:

arrStrategicMutators="MiniModsCollection.MiniModsStrategy"
arrTacticalMutators="MiniModsCollection.MiniModsTactical"

3b. If you wish to enable Mod Manager which accompanies MiniMods open DefaultGame.ini (inside C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Config)

Add these 2 lines at the very begining (just below "BasedOn=...") or at the very end of the file:
[XComGame.XComGameInfo]
+ModNames="XComModShell.UIModManager"

Long Warriors - you are done. Go and play!

IMPORTANT: If you use Line Of Sight Indicator mod by tracktwo you should apply SightlinesCompatibilityFix.txt (use PatcherGUI from UPK Utils tools pack - to be found on nexusmods).

------------------------
EW USERS only
------------------------
Perform steps 1-3 as above (make sure you are dealing with EW version) plus:

4. Go to C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Config and find there the file DefaultGame.ini. 

5. Open it in Notepad or any txt editor. Add additional line under [XComGame.XComGameInfo] section:
[XComGame.XComGameInfo]
+ModNames="XComMutator.BaseMutatorLoader"
+ModNames="XComModShell.UIModManager"

6. Use PatcherGUI (from here https://www.nexusmods.com/xcom/mods/448) and apply XComMutatorEnabler.txt
Short manual to PatcherGUI if you never used it:
1. there are 2 "Browse" buttons to the right (to set two paths as below)
2. click upper "Browse" button and point path to your XCom-Enemy-Unknown\XEW folder. Default: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW
3. click another "Browse" and select .txt file, which you want to apply, that is XComMutatorEnabler.txt
4. click "Apply"

IMPORTANT: If you use Line Of Sight Indicator mod by tracktwo you should ALWAYS apply SightlinesCompatibilityFix.txt after installing Sightlines mod. 
(use PatcherGUI from UPK Utils tools pack - to be found on nexusmods).

Done. Congratulations!  

------------------------
TROUBLE SHOOTING
------------------------
1. Some players reported crashes when loading a tactical save or restarting a mission when using MiniModsTactical.
Solution: Inside the directory for EW version find XComMutator.u (inside EW version\CookedPCConsole\Mutators). Get that file and copy it over your original XComMutator.u delivered by LW team (it is inside CookedPCConsole directory of the game)

2. When starting the game you might get a pop-up message about "Ambiguous package name: Using 'C:\Program Files(x86)\Steam\....\CookedPCConsole\MiniModsCollection.u', not 'C:\Program Files
(x86)\....\CookedPCConsole\Mutators\MiniModsCollection.u". Read the message carefully paying attention to paths. The message tells you that the game has found 2 files MiniModsCollection.u: one in CookedPCConsole folder and the other in its subfolder: \Mutators. You must delete one of them - most probably the one in CookedPCConsole. My mod package puts the file into \Mutators subfolder so this one is most recent. The other one (in CookedPCConsole) is probably from LW Rebalance or some other mod package that incoporated MiniMods. Cause otherwise I have no idea how it could have landed in CookedPCConsole.

3. If playing vanilla EW version and despite following all the steps you still don't see any sign of MiniMods working try these steps:
- go to \Config folder (default path: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Config)
- open DefaultEngine.ini
- find this line: 
GameEngine=XComGame.XComEngine
- comment it out by putting ";" in front (better than deleting - you have a backup this way)
;GameEngine=XComGame.XComEngine
- just below above line add a new line:
GameEngine=MiniModsCollection.MMXComEngine
- launch game, load a save and see if it helped.


------------------------
NOTE FOR Long War MODDERS
----------------------
You might be interested in EW version as well for the reworked XComMutator.u file. It will clean your logs from tons of those.
XComMutator: Current =  
XComMutator: Next =
XComMutator: Current =  
XComMutator: Next =
XComMutator: Current =  
XComMutator: Next =  

I am using bDisableLog variable in DefaultMutatorLoader.ini - you can get the spam back (for debugging?) by setting it to false. 
 
-------------
 CREDITS
-------------
kdm2k6 - for help with test of gamepad support
AzXeus - for introducing me into scripting with UDK
Ucross, fjz - for the ideas and early tests
datar0 - for bug hunting and tests
Snackhound - for help with sorting maps
loriendal - for Russian localization of ClearPerks / MeldHealing and pre-release bug hunting
PawelS - for tests and bug hunting