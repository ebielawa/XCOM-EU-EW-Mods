THIS MOD IS ONLY MEANT TO BE USED WITH EW LONG WAR B14, NO GUARANTEES ON OTHER VERSIONS
Big thanks to the Long War team for making an awesome mod, and to Amineri specifically for all the help getting started.

How to install:

1.If you don't have it, download PatcherGUI from http://www.nexusmods.com/xcom/mods/448/?tab=2&navtag=http%3A%2F%2Fwww.nexusmods.com%2Fxcom%2Fajax%2Fmodfiles%2F%3Fid%3D448&pUp=1
2.Set the first path to your XEW directory inside your XCOM folder
3.Set the second path to which STD you would like (for example, ModFileSTD4 uses a STD of 1/4).
4.Apply the patch
5.IF YOU WANT TO CHANGE THE STD, UNINSTALL THE PREVIOUS ONE FIRST (Show Log -> Select the patch you want to uninstall -> uninstall)
6.If things get messed up, PatcherGUI should automatically make a backup of any changed files

Notes:

A good combination seems to be 50 max aim penalty and an STD of 1/8, but it's recommended to play around with the numbers to figure out what's best for your play style.
/----------------------------------------------------------/
Does not require a campaign restart.
/----------------------------------------------------------/
High health units may not lose any aim for the first few health blocks lost, as it would be under -1 Aim.
/----------------------------------------------------------/
Cybernetic units view their health ratio (health/maxHealth) to be twice what it really is (as in default Long War).
/----------------------------------------------------------/
The equation for the mobility penalty has also been changed to gaussian in the same manner as that of aim penalty.
/----------------------------------------------------------/
You can change the maximum penalty the same as in default Long War(go to XCom-Enemy-Unknown\XEW\XComGame\Config\DefaultGameCore.ini, search for Red Fog). Comparison of curves is included in GraphCurves_Max60 for when the penalty is set to max 60 aim.
/----------------------------------------------------------/
The function used is Aim_Penalty = exp(-(1/STD)*x^2)*maxPenalty where x = health/maxHealth of a unit. If you would like to check what the curve looks like compared to vanilla, then, using your favorite plotting tool (for example: Wolfram Alpha) for XComGameSTD7 you would plot:

exp(-7*x^2)*maxPenalty from x = 0 to 1

and

(1-x)*maxPenalty from x = 0 to 1
/----------------------------------------------------------/

The function changes was XComGame.upk->XGUnit.ApplyHPStatPenalties

Original Hex:

BB C9 00 00 51 60 00 00 00 00 00 00 A3 C9 00 00 00 00 00 00 00 00 00 00 A4 C9 00 00 00 00 00 00 EA 19 00 00 86 38 03 00 C1 02 00 00 29 02 00 00 A1 1A 26 01 63 3A 00 00 8F 01 C6 C4 00 00 16 16 A1 1A 2C 03 01 63 3A 00 00 8F 01 C5 C4 00 00 16 16 0F 00 A4 C9 00 00 AC 38 3F 1B 01 3C 00 00 00 00 00 00 16 38 3F 1B 04 3C 00 00 00 00 00 00 16 16 07 06 01 19 19 2E 54 32 00 00 19 12 20 35 FE FF FF 0A 00 92 F9 FF FF 00 1C D5 FB FF FF 16 09 00 50 F9 FF FF 00 01 50 F9 FF FF 09 00 46 32 00 00 00 01 46 32 00 00 3E 00 14 10 00 00 00 1B 27 12 00 00 00 00 00 00 35 56 0F 00 00 58 0F 00 00 00 00 19 1B E5 37 00 00 00 00 00 00 16 09 00 03 B8 00 00 00 01 03 B8 00 00 2C 03 16 B6 00 A4 C9 00 00 38 3F 2C 02 16 06 37 01 B6 00 A4 C9 00 00 AE 38 3F 2C 01 F5 38 3F 2C 00 AF 38 3F 2C 01 AC 38 3F 2C 3C 38 3F 1A 2C 07 01 63 3A 00 00 16 16 16 16 16 07 61 01 B3 00 A4 C9 00 00 38 3F 26 16 0F 01 C6 C4 00 00 25 0F 01 C5 C4 00 00 25 06 D5 01 0F 01 C6 C4 00 00 38 44 AB AF 00 A4 C9 00 00 38 3F 26 16 12 20 32 87 00 00 09 00 1D 11 00 00 00 02 1D 11 00 00 16 0F 01 C5 C4 00 00 38 44 AB AF 00 A4 C9 00 00 38 3F 26 16 12 20 32 87 00 00 09 00 21 11 00 00 00 02 21 11 00 00 16 A1 1A 26 01 63 3A 00 00 01 C6 C4 00 00 16 A1 1A 2C 03 01 63 3A 00 00 01 C5 C4 00 00 16 04 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 53 00 00 00 02 00 02 00 78 04 00 00 00 00 00 00

Edited Hex (XComGameSTD6):

BB C9 00 00 51 60 00 00 00 00 00 00 A3 C9 00 00 00 00 00 00 00 00 00 00 A4 C9 00 00 00 00 00 00 EA 19 00 00 86 38 03 00 C8 02 00 00 29 02 00 00 A1 1A 26 01 63 3A 00 00 8F 01 C6 C4 00 00 16 16 A1 1A 2C 03 01 63 3A 00 00 8F 01 C5 C4 00 00 16 16 0F 00 A4 C9 00 00 AC 38 3F 1B 01 3C 00 00 00 00 00 00 16 38 3F 1B 04 3C 00 00 00 00 00 00 16 16 07 06 01 19 19 2E 54 32 00 00 19 12 20 35 FE FF FF 0A 00 92 F9 FF FF 00 1C D5 FB FF FF 16 09 00 50 F9 FF FF 00 01 50 F9 FF FF 09 00 46 32 00 00 00 01 46 32 00 00 3E 00 14 10 00 00 00 1B 27 12 00 00 00 00 00 00 35 56 0F 00 00 58 0F 00 00 00 00 19 1B E5 37 00 00 00 00 00 00 16 09 00 03 B8 00 00 00 01 03 B8 00 00 2C 03 16 B6 00 A4 C9 00 00 38 3F 2C 02 16 06 37 01 B6 00 A4 C9 00 00 AE 38 3F 2C 01 F5 38 3F 2C 00 AF 38 3F 2C 01 AC 38 3F 2C 3C 38 3F 1A 2C 07 01 63 3A 00 00 16 16 16 16 16 07 61 01 B3 00 A4 C9 00 00 38 3F 26 16 0F 01 C6 C4 00 00 25 0F 01 C5 C4 00 00 25 06 F9 01 0F 01 C6 C4 00 00 8F 38 44 AB BF AB AB 00 A4 C9 00 00 00 A4 C9 00 00 16 38 3F 8F 2C 06 16 16 16 12 20 32 87 00 00 09 00 1D 11 00 00 00 02 1D 11 00 00 16 16 0F 01 C5 C4 00 00 8F 38 44 AB BF AB AB 00 A4 C9 00 00 00 A4 C9 00 00 16 38 3F 8F 2C 06 16 16 16 12 20 32 87 00 00 09 00 21 11 00 00 00 02 21 11 00 00 16 16 A1 1A 26 01 63 3A 00 00 01 C6 C4 00 00 16 A1 1A 2C 03 01 63 3A 00 00 01 C5 C4 00 00 16 04 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 53 00 00 00 02 00 02 00 78 04 00 00 00 00 00 00

//m_iBWAimPenalty = -int(Exp((fPct * fPct) * float(-6)) * class'XGTacticalGameCore'.default.SW_ABDUCTION_SITES);
0F 01 C6 C4 00 00 8F 38 44 AB BF AB AB 00 A4 C9 00 00 00 A4 C9 00 00 16 38 3F 8F 2C 06 16 16 16 12 20 32 87 00 00 09 00 1D 11 00 00 00 02 1D 11 00 00 16 16

//m_iBWMobPenalty = -int(Exp((fPct * fPct) * float(-6)) * class'XGTacticalGameCore'.default.SW_COVER_INCREASE);
0F 01 C5 C4 00 00 8F 38 44 AB BF AB AB 00 A4 C9 00 00 00 A4 C9 00 00 16 38 3F 8F 2C 06 16 16 16 12 20 32 87 00 00 09 00 21 11 00 00 00 02 21 11 00 00 16 16