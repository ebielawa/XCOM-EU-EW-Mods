Long War Mod Manager 1.0c by eclipse666
=======================================

This program makes use of PatchUPK to patch UPK files (written by WGhost81) - http://www.nexusmods.com/xcom/mods/448/?
It uses innounp to extract files from the Long War Installation file - http://innounp.sourceforge.net/

This utility simplies the installation and removal of Long War mods and can be used as a replacement for PatcherGUI.
It also supports some new mod files extensions that allow for the automatic updating of configuration files. This 
can be used to automatically define keyboard commands, add second wave options, or anything else that involves
adding lines to a config file. See "AUTOMATIC CONFIGURATION FILE UPDATES (FOR MOD AUTHORS)" section below for more information.

HOW TO USE IT:
==============

Start the mod manager by running "LWModManager.exe".

XCom Enemy Within Folder:
=========================
Select the XCom Enemy within folder on your PC. If you use Steam it should be detected automatically. It should look something like this:
C:\Program Files (x86)\steam\SteamApps\common\XCom-Enemy-Unknown\XEW

Long War Installation File:
===========================
Select the location of your Long War installation file. This should be for the version of Long War that you are currently using. 
LWModManager will extract the original unmodded files from this setup file and update the game files before applying any selected mods.
You can download the latest Long War installation file from http://www.nexusmods.com/xcom/mods/88/?

Use Dev Console enable ENGINE.UPK file:
=======================================
Enable this option if you want to use the special "dev console" enabled version of the ENGINE.UPK file. Using this special version of the
ENGINE.UPK file will enable you to access the "developer console" while playing the game. (Press "\" on your keyboard while in the game
to access it). You'll have to download this special file from the Long War Mod page, unzip it somewhere on your PC and then select it
so that LWModManager knows where to find it.

Copy Long War mod files into this folder:
=========================================
LWModManager will create a Mods sub folder inside the folder it is launched from. You should copy any mod files you'd like to install here.
Mod files are plain text (*.txt) files. Click on the "Browse folder" button to explore this folder with Windows Explorer.

Select All the Mods that should be enabled below:
=================================================
LWModManager will scan the Mods folder for any mod txt files and display them in a list. Simply select the mods you'd like to be installed
by placing a tick in each checkbox. Any mods that are not ticked will automatically be removed by the update process. Click on the "Refresh"
button to rescan the folder and update the list. The "Select All" and "Select None" buttons will tick or untick all the mods in the list.

Preserve Current Configuration (no config files will be updated)
================================================================
Enable this option if you don't want any of your existing Long War config files to be updated. This is handy if you've modded certain
files and don't want to lose your changes. If this option is not selected then all config files will be reverted to the original
"installed" version by the update process.

Update LongWar!
===============
Click this button to update Long War with your selected mods. It will do the following:
1. The original Long War installation files will be extracted from the Long War installation file into a temporary folder
2. These original files will replace your current Long War game files (except for config files if you've chosen to preserve them).
   This effectively reverts Long War back to it's original installed state, removing all mods.
3. Each selected mod will be installed in sequence.
4. When it completes, you can close LWModManager. It will remember your settings the next time you start it.


AUTOMATIC CONFIGURATION FILE UPDATES (FOR MOD AUTHORS)
======================================================

To make use of the configuration file update feature, you must add a special /*<CONFIG> ... </CONFIG>*/ block somewhere in the mod text.

The config block start is marked by 

/*<CONFIG>

and ends with

</CONFIG>*/


These markers should be on their own lines. Here's an example that adds a "Second Wave" option to the XComGame.int file:

/*<CONFIG>
FILENAME=XComGame\Localization\INT\XComGame.int
SECTION=UIGameplayToggles
ADDLINE=m_arrGameplayToggleTitle[35]="Omega 13 (#35)"
ADDLINE=m_arrGameplayToggleDesc[35]="Restarting a mission using the Omega 13 time travel device will cost credits for each soldier. Requires Bronzeman option if Ironman mode is enabled."
</CONFIG>*/

FILENAME=xxx
This specifies the configuration file to be updated. It is relative to the selected "XCom Enemy Within" folder.

SECTION=xxx
This specifies the section of the configuration file to be updated. Sections appear in config files as [SectionName]. Don't include the square brackets.

ADDLINE=xxx
This will add the text "xxx" to the end of the specified section. You can have as many of these as you like. If an exact matching line is already found in the config file it will be removed and the line added to the end again. This prevents any conflict with the "preserve config files" option.

It's possible to define lines that replace or delete earlier lines in a config file by using special characters at the start of each line that is added.

+ - Adds a line if that property does not exist yet (from a previous configuration file or earlier in the same configuration file).
- - Removes a line (but it has to be an exact match).
. - Adds a new property.
! - Removes a property; but you do not have to have an exact match, just the name of the property.

See https://docs.unrealengine.com/latest/INT/Programming/Basics/ConfigurationFiles/index.html for more info. 

Unfortunately the patchupk.exe utility cannot handle anything but plain ASCII text, so trying to use special or accented characters will cause 
the patcher to fail. To work around this you can "escape" any special characters as \## where ## is a 2 digit hex value.

For example:
ADDLINE=R\e9publique

Will add the line "République". (Ascii $e9 = é)
