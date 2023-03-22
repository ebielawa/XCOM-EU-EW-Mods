******************************
IMPORTANT NOTICE
******************************
Please, be informed that the manager neither scans your disk drive for any mod files nor is it a sort of "Steam Workshop" capable of installing / uninstalling mods. The manager only works in-game, only with mutator-based mods and only with what you have installed outside of game on your own. It is modders' job to expose options of their mods to the manager so you will only see a mod and its options on the list IF the author of the mod has written appropriate "exposing" code. With Mini Mods Collection you gain access to 20+ mods configurable in-game right off the bat.

******************************
NOTICE TO MODDERS
******************************
All you can be interested in is explained in the "Guide for Modders". How to add a mod to the list, how to add an option for a mod, how to choose a widget for the option (checkbox, spinner, combobox etc.). Most of the above require a single line of code - check the guide. You need to be familiar with using UDK for compiling new code for XCom in a mutator form. Explaining how to write mutators is beyond the scope of the guide.
Examples are best so I have included a few "templates" so that you can see what the "exposing code" should look like.


******************************
INSTALLATION INSTRUCTIONS
******************************
READ WHOLE INSTRUCTION BEFORE DOING ANYTHING :)

Unzip to some folder. Copy the files from \Install_files folder to relevant game folders:

- files from \Install_files\CookedPCConsole should go to ...\XEW\XComGame\CookedPCConsole\  (or better to a subfolder e.g. ...CookedPCConsole\Mods)
- files from \Install_files\Config should go to ...\XEW\XComGame\Config
- files from \Install_files\Localization  should go to ...\XEW\XComGame\Localization\INT

---------------
DefaultGame.ini
---------------
You need to make the top of DefaultGame.ini look like this:

[Configuration]
BasedOn=..\Engine\Config\BaseGame.ini

[XComGame.XComGameInfo]
+ModNames=XComModShell.UIModManager

I have enclosed my _DefaultGame.ini for preview if you need it (the underscore is on purpose so that you do not overwrite anything important by accident).

*************************************
XCOM EW users only (without Long War) 
*************************************
You need mutators enabled. Either install Line of Sight Indicators or MiniMods for Enemy Within and follow the instructions for enabling mutators.
Instruction from MiniMods regarding how to enable mutators (make sure you are dealing with EW version):

1. Go to directory XEW\XComGame\Config and find there the file DefaultGame.ini. 

2. Open it in Notepad or any txt editor. Add additional line under [XComGame.XComGameInfo] section:
[XComGame.XComGameInfo]
+ModNames="XComMutator.BaseMutatorLoader"
+ModNames="XComModShell.UIModManager" (YOU HAVE THIS ONE ALREADY, SO DON'T DUPLICATE)

3. Use PatcherGUI (from here https://www.nexusmods.com/xcom/mods/448) and apply XComMutatorEnabler.txt
Short manual to PatcherGUI if you never used it:
	1. there are 2 "Browse" buttons to the right (to set two paths as below)
	2. click upper "Browse" button and point path to your XCom-Enemy-Unknown\XEW folder. Default: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW
	3. click another "Browse" and select .txt file, which you want to apply, that is XComMutatorEnabler.txt
	4. click "Apply"

Done. Congratulations! 
---------------
XComMutator.u
---------------
You need to overwrite the original file delivered by Long War package. You don't have to if you are already using XComMutator.u from MiniMods package.