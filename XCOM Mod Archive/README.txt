In this folder are 3 subfolders for XCOM: Enemy Unknown.

"Mods" contain txt file mods that need to be applied via PatcherGUI (in another folder). The list of mods are:

QE-Free-Rotation (gives free camera rotation with Q and E)
Revenge of the Sleeves (allows for sleeves on Gene Modded soldiers)
Cleanse of the Clones (NOT Working for Long War 1.1)
GenderAndRaceAwareCustomNameList (NOT Working for Long War 1.1)
SoldierGender sets gender ratios to 60:40 for Male:Female
Covert Extraction Squad Size allows you to bring Squadsize - 2 soldiers on extractions (so upgrades will apply) (Does not work with 1.1)
Custom Fatigue allows you to change Fatigue levels -- I like to use the default Long War fatigue levels instead of 1.1
Campaign summary adds a campaign summary (described here: https://www.nexusmods.com/xcom/mods/626?tab=description)
	Campaign summary also requires some additional files and adding 	arrStrategicMutators="XComCampaignSummary.CampaignSummaryMutator"
	to XComGame\Config\DefaultMutatorLoader.ini

It also contains two mods that use their own installers, Long War and Long War 1.1

There are also folders containing backups of original config files and config files with my changes.
The changes for each file can be found in each subfolder.

DefaultNameList contains a new set of names for soldiers
XCOMStrategyGame contains a list of pilot names for interceptors, as well as additional operation names
XCOMGame contains a list of new nicknames
defaultstrategyaimod contains increased pod counts per mission
DefaultGameCore contains many many changes, listed below

--------------------------------------------------------------------------

Changes for DefaultGameData:
MEC Augmentation Costs changed to 60 credits and 30 meld
Officers only need to lead 3 missions before their next promotion (instead of 5)
After 1 mission, ranks of dead officers can be re-assigned
The game now starts on March 1, 2035

Changes for DefaultGameCore:

Soldier countries reweighted according to: https://www.reddit.com/r/Xcom/comments/2y1spu/lw_beta_15realistic_soldier_country_probabilities/

Cyberdisks and Mechtoids get +2 DR.
Sectopods get +3 DR (I think)

Changed default soldier appearance to use:
	Hooded vest (armor deco 3, package 69)
	Kevlar helmet (helmet 20, package 403)
	Armor tint 32 (black on black)

Will penalty for critical wounds reduced to 0

Fatigue set to 120% of its original value (dunno if this does anything)

Starting soldiers increased to 48, soldier cost down to 20

XCOM will start with 2 SHIVs unless "On Our Own" country bonus is selected.

Increased EXP requirements for ranks and OTS ranks for projects
Exception: SPEC rank now only requires 80 EXP (completed mission)

Master Sergeants gain additional stats every 3rd mission rather than every 4th mission

Increased low cover bonus to 35% and high cover to 50%

Into the Breach officer perk grants 50% bonus EXP rather than 25%
Sharpshooter now grants +15% aim to high cover targets
HEAT Ammo and Warheads bonus increased to +100%

Gene Mods now cost less meld (~25%)
Jellied Elerium project cost significantly reduced
Advanced Servomotors, Shaped Armor, and MEC Close Combat cost reduced by 10 meld

Arc Thrower added to pistol slot
Elerium Turbos now (re)usuable for MECs
Alloy Carbide Plating now adds +1 HP (nerf) and +1 DR (buff)
Increased MEC Proximity Mine and Grenade Launcher range to 21
Increased Flamethrower damage to 7 (from 5)
Increased Kinetic Strike Module damage to 14 (from 12)
Tanky MECs (MEC-2, MEC-4, and MEC-5) now grant Damage Control instead of Body Shield
All MEC suits get +1 DR
SHIVs get +1 DR
Gauss weapons now negate 0.5 DR instead of 0.34 (Quenchguns doubles this to 1)
SHIV rebuild time changed to twice SHIV build time
Respirator Implants cost 30 Meld (up from 8)

"Fatigue for gear" -- https://pastebin.com/3zuMVfwq
(Meant to be played with Wear and Tear, Miracle Workers, and Total Loss)
Gear will require repair 75% of the time (up from 20%)
Repairs take 75% of build time
All repairable items (so not interceptors or facilities) cost 25% of their original cost in credits (rounded up), alloys, elerium, and meld (rounded up)
To compensate for this, UFO Power Sources and UFO Flight Computers have a 30% and 35% chance to survive from crashes (up 10% each)
The EMP Cannon increases this chance by 25%.

Aiming angle second wave bonuses have been changed to minimum +10% and maximum (cover bonus - 10)%

Fission Generators provide 12 power and cost $180

Quick and Dirty Second Wave option tries to increase enemies to 150% of their normal amount (I think editing pod deployment allows for this now)

Changed perk trees and stat level ups according to spreadsheet