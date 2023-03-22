*********************************************************
		POD REVEAL MODS COLLECTION
		
		by tracktwo and szmind
*********************************************************

LEGAL NOTE

Code for this mod has been compiled with Unreal Development Kit v. 2011-09 by EpicGames.
By downloading and using this mod you agree to use it in compliance with EULA available here:
https://www.unrealengine.com/en-US/previous-versions/udk-licensing-resources#eula
So by all means for non-commercial use.

*********************************************************
INSTALL INSTRUCTIONS - LONG WAR versions
*********************************************************

Instructions for PC are quite precise and tested.
Instructions for other platforms are just my (szmind's) best guidance base on other platform user's advice.

---------------
PC/Windows
---------------
1. Copy RevealMod.u to CookedPCConsole directory (folder) of the game. Default path:
..\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\CookedPCConsole

2. Copy DefaultRevealMod.ini to Config directory (folder) of the game. Default path:
..\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Config

3. Open DefaultMutatorLoader.ini in the directory above. Add this line at the end:
arrTacticalMutators="RevealMod.RevealModMutator"

4. Apply RevealMod.txt with PatcherGUI.

5. Play the game!

---------------
MAC
---------------
1. Copy RevealMod.u to CookedPCConsole directory (folder) of the game. Default path:
Users/mac/Library/Application Support/Steam/steamapps/common/XCom-Enemy-Unknown/XCOMData/XEW/XComGame/CookedPCConsole

2. Copy DefaultRevealMod.ini to Config directory (folder) of the game. Default path:
Users/mac/Library/Application Support/Steam/steamapps/common/XCom-Enemy-Unknown/XCOMData/XEW/XComGame/Config

3. Open DefaultMutatorLoader.ini in the directory above. Add this line at the end:
arrTacticalMutators="RevealMod.RevealModMutator"

4. Apply RevealMod.txt with PatcherGUI or LongWar Mod Manager. https://www.nexusmods.com/xcom/mods/620

5. Play the game!

--------------
LINUX
--------------
1. Copy RevealMod.u to CookedPCConsole directory (folder) of the game. Rename the file there to lower case (revealmod.u). 
Default path:
~/.steam/steam/steamapps/common/XCom-Enemy-Unknown/xew/xcomgame/cookedpcconsole/

2. Copy DefaultRevealMod.ini to Config directory (folder) of the game. Rename the file there to lowercase (defaultrevealmod.ini)
Default path:
~/.steam/steam/steamapps/common/XCom-Enemy-Unknown/xew/xcomgame/config/

3. Open defaultmutatorloader.ini in the directory above. Add this line at the end:
arrTacticalMutators="RevealMod.RevealModMutator"

4. Apply RevealMod.txt with PatcherGUI or LongWar Mod Manager. https://www.nexusmods.com/xcom/mods/620

5. Play the game!

6. In case of the mod not working - you might need to:
a. copy defaultrevealmod.ini to:
	~/.local/share/feral-interactive/XCOM/XEW/WritableFiles/
b. rename the file there to xcomrevealmod.ini


*********************************************************
INSTALL INSTRUCTIONS - ENEMY WITHIN version
*********************************************************
The mod should work fine with basic Enemy Within version. 
Install procedures are similar as those for Long War version - just you have one more .u file and one more .ini file to proceed with.
These are XComMutator.u and DefaultMutatorLoader.ini.

You must also use RevealMod_EW.txt with PatcherGUI INSTEAD OF RevealMod.txt stated in instructions for LW.

***********************************************************
DESCRIPTION OF FEATURES
***********************************************************

--------------------------------------------------------
BAILOUT MOVE ON POD REVEAL (CALLED ALSO 'SCAMPER MOVE')
--------------------------------------------------------
Turn this option ON in DefaultRevealMod.ini by setting:
bBailOutOnPodReveal=true
Turn off by using =false instead.

Whenever XCOM unit reveals a new pod all other XCOM units that have already ended their turns are granted 1 yellow move to reposition. 
It will not work for hunkered down, suppressing or overwatching units though. At least for the time being.

--------------------------------------------------------
CALL (ALIEN) FRIENDS ON POD REVEAL
--------------------------------------------------------
Turn this option ON in DefaultRevealMod.ini by setting:
bCallFriendsOnPodReveal=true
Turn off by using =false instead.

Whenever a new pod is revealed it will trigger/reveal all pod in its line of sight. There is no further chaining - only the line of sight of the very first spotted pod is checked.
The feature might lead to swarming pod reveal on small maps or with unlucky pod placement. On the other hand it makes you be sure that there are no more hidden pods in line of sight of just activated pod. Therefore you can quite safely cut distance to that pod without being surprised by unexpected pod reveal while approaching. 

KNOWN ISSUES
Line of sight is checked at start of pod reveal, from the very initial position and it is checked alien-to-pod not alien-to-alien. Location of 'another' pod is probably (my guess) determined with location of its leader. So if the leader of another pod is not seen by members of 'just revealed' pod - the another pod will not be triggered. Despite the fact that other members of that 'other' pod might have been 'seen' by members of 'just activated' pods. That is hardly fixable. At least for the time being.

--------------------------------------------------------
CALL (ALIEN) FRIENDS AT END OF TURN
--------------------------------------------------------
Turn this option ON in DefaultRevealMod.ini by setting:
bCallFriendsEndOfTurn=true
Turn off by using =false instead.

This is similar to Call Friends On Pod Reveal. At the end of each alien's turn all active aliens will trigger/reveal any other pod within its line of sight. The check for line of sight is performed alien-to-alien. So it is enough that active alien can see at least one member of another 'dormant' pod to trigger that other pod. The feature is supposed to bring on some realism, so that aliens who can see their commrades fighting XCOM do not sit like ducks. On the other hand - on swarming missions - this might lead to relatively quick mass-reveal.

***********************
CREDITS
***********************
Ucross - for filing in humble requests to me and tracktwo for that stuff, and for initial tests and bug hunting