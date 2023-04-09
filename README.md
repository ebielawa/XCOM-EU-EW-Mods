# Overview
This repository contains several modifications for XCOM Enemy Unknown, specifically the with the Enemy Within DLC and [Long War](https://www.nexusmods.com/xcom/mods/88?tab=description) mod. Most text-based mods can be installed via [Long War Mod Manager](https://www.nexusmods.com/xcom/mods/620). Other mods effect the game's configuration files and must be manually moved into XCOM's local filepath (typically `"C:\Program Files (x86)\Steam\steamapps\common\XCom-Enemy-Unknown\XEW"` for Windows).

# List of Included Mods
- [Alien Strategic Stats](https://www.reddit.com/r/Xcom/comments/2zbkgj/lw_mod_alien_strategic_stats_exposed/)
- [Assorted Long War Gameplay Modifications](https://www.nexusmods.com/xcom/mods/581?tab=files)
- [Better Blueshirts](https://www.nexusmods.com/xcom/mods/665/?)
- [Carlock Reward Soldier](https://www.nexusmods.com/xcom/mods/593)
- [DR Chipping](https://www.nexusmods.com/xcom/mods/628/?tab=description)
- [Enhanced Random Soldiers](https://www.nexusmods.com/xcom/mods/607?tab=files)
- [Enhanced Tactical Info](https://www.nexusmods.com/xcom/mods/554?tab=description)
- [Exalt Intel Tweak](https://www.nexusmods.com/xcom/mods/695/?)
- [Extra Landed Transport Map](https://www.nexusmods.com/xcom/mods/643/?tab=posts)
- [Fix Left Click to Move](https://www.nexusmods.com/xcom/mods/797)
- [Guassian Red Fog](https://www.nexusmods.com/xcom/mods/502/?tab=posts)
- [Line-Of-Sight Indicators](https://www.nexusmods.com/xcom/mods/666/?)
- [Loadout Manager](https://www.nexusmods.com/xcom/mods/656)
- [Meld Alarm](https://www.nexusmods.com/xcom/mods/540/?tab=files)
- [Meld Countdown](https://www.nexusmods.com/xcom/mods/759)
- [More Hours](https://www.nexusmods.com/xcom/mods/645)
- [Omega 13](https://www.nexusmods.com/xcom/mods/534)
- [Pod Reveal Mods](https://www.nexusmods.com/xcom/mods/715?tab=description)
- [Random Car Colors](https://www.nexusmods.com/xcom/mods/576?tab=description)
- [Remove Death Animation Delay](https://www.nexusmods.com/xcom/mods/452?tab=files)
- [SHIV EXP and New AI](https://www.nexusmods.com/xcom/mods/603/?tab=description)
- [Situation Room Panic and Defense Values](https://www.nexusmods.com/xcom/mods/731?tab=description)
- [Squadron Unleashed 2](https://www.nexusmods.com/xcom/mods/809)
- [Stop Losing Time](https://www.nexusmods.com/xcom/mods/810)
- [UI Mod Manager](https://www.nexusmods.com/xcom/mods/766?tab=description)
- [Ultra Graphics](https://www.nexusmods.com/xcom/mods/741)
- [Virtual Reality Training](https://www.nexusmods.com/xcom/mods/569)
- [XCOM Mini Mods Collection](https://www.nexusmods.com/xcom/mods/735?tab=description)
- And many more config-based ones (see below)!

# Changes to Config
Several changes have been made to multiple config files. The most notable is `defaultgamecore.ini`. Gameplay changes are noted here. Many other files present have been changed to incorporate mods.

### `defaltgamecore.ini`
**Tactial**
- Cyberdisks have +1 DR
- Mechtoids have +2 DR
- Sectopods have +3 DR
- XCOM default squad size increased by 2 (for a starting squad size of 8)
- Increased low cover bonus to 35% and high cover to 50%
- Sharpshooter now grants +15% aim to high cover targets
- HEAT Ammo and Warheads bonus increased to +100%
- Arc Thrower added to pistol slot
- Elerium Turbos now (re)usuable for MECs
- Alloy Carbide Plating now adds +1 HP (nerf) and +1 DR (buff)
- Increased MEC Proximity Mine and Grenade Launcher range to 21
- Increased Flamethrower damage to 7 (from 5)
- Increased Kinetic Strike Module damage to 14 (from 12)
- Tanky MECs (MEC-2, MEC-4, and MEC-5) now grant Damage Control instead of Body Shield
- All MEC suits get +1.5 DR
- All SHIVs get +1 DR
- Gauss weapons now negate 0.5 DR instead of 0.34 (Quenchguns doubles this to 1)
- Aiming angle second wave bonuses have been changed to minimum +10% and maximum (cover bonus - 10)%
- Quick and Dirty Second Wave option tries to increase enemies to 150% of their normal amount
- Changed perk trees and stat level ups according to spreadsheet ([found here](https://docs.google.com/spreadsheets/d/1b44olPdr0msneZlyy9tOwkpv8QwB2BEO8vZtzeaJLtQ/edit?usp=sharing))
  
**Strategy**
- Will penalty for being critically wounded reduced to 0
- Starting soldiers increased to 48 and soldier cost down to $20 per soldier
- XCOM will start with 2 SHIVs unless "On Our Own" country bonus is selected.
- Increased rank requirements for OTS projects (in particular Squad Size)
- Increased EXP requirements for ranks
  - Exception: SPEC now requires 80 EXP instead of 120 EXP
- Master Sergeants gain an additional stat point every 3 missions instead of every 4 missions
- Into the Breach officer perk grants 50% bonus EXP rather than 25%
- Gene Mods now cost less meld (approximately 25%)
- Psi Lab, Cybernetics Lab, and Gene Lab can now hold up to 6 soldiers
- Jellied Elerium foundry project cost significantly reduced
- Advanced Servomotors, Shaped Armor, and MEC Close Combat foundry project cost reduced by 10 meld
- SHIV rebuild time changed to twice SHIV build time
- Respirator Implants cost 30 Meld (up from 8)
- Implements "[Fatigue for Gear](https://pastebin.com/3zuMVfwq)"
  - Meant to be played with Miracle Workers, Wear and Tear, and Total Loss second wave options
  - Gear will require repair 75% of the time (up from 20%)
  - Repairs take 75% of build time
  - All repairable items (so not interceptors or facilities) cost 25% of their original cost in credits (rounded up), alloys, elerium, and meld (rounded up)
  - To compensate for this, UFO Power Sources and UFO Flight Computers have a 30% and 35% chance to survive from crashes (up 10% each)
  - The EMP Cannon increases this chance by 25%.
- Fission Generators provide 12 power and cost $180

**Miscellaneous**
- Soldier country probabilities have been more realistically weighted (see [here](https://www.reddit.com/r/Xcom/comments/2y1spu/lw_beta_15realistic_soldier_country_probabilities/) for more info)
- Default soldier appearance now uses:
  - Hooded vest (armor deco 3, package 69)
  - Kevlar helmet (helmet 20, package 403)
  - Armor tint 32 (black on black)
- Fatigue set to 120% of its original value

### `defaultgamedata.ini`
- MEC Augmentation Costs changed to 60 credits and 30 meld
- Officers only need to lead 3 missions before their next promotion (instead of 5)
- After 1 mission, ranks of dead officers can be re-assigned
- The game now starts on March 1, 2035

### `defaultnamelist.ini`
- Contains custom namelist stored [here](https://docs.google.com/document/d/1kkf_J76dPE1cglh7RTNlAbk002emyTH37hsCuIswEcU/edit?usp=sharing)
- For use with the [Race and Gender Aware Namelist mod](). Use that version of the list
- To generate the namelist, [use daiz.github.io](https://daiz.github.io/xcom-namegen/)

### `xcomgame.int`
- Note: this is a localization file found in the `Localization\INT` filepath
- Contains new nicknames (approx 75) for each class detailed [here](https://docs.google.com/spreadsheets/d/13ddlocdkhgOX22B7RTzzVc2A3A3p3SkN2nXQWrqmweg/edit?usp=sharing)

### `xcomstrategygame.int`
- Note: this is a localization file found in the `Localization\INT` filepath
- Contains new interceptor names, mostly themed after mecha anime, with some Top Gun and Fire Emblem thrown in there. Detailed [here](https://docs.google.com/spreadsheets/d/13ddlocdkhgOX22B7RTzzVc2A3A3p3SkN2nXQWrqmweg/edit?usp=sharing)

# Install Instructions
- Install Long War using the Long War installer
- Open `Long War Mod Manager` from the `Dev Console Engine File` folder
  - Make sure to select the Dev Console engine file in the `Long War Mod Manager` folder
  - Install all mods from the `Mods` folder of `Long War Mod Manager`
- Copy files from `Config` into XCOM's Config folder (`"C:\Program Files (x86)\Steam\steamapps\common\XCom-Enemy-Unknown\XEW\XComGame\Config"`)
- Copy files from `CookedPCConsole` into XCOM's Localization folder (`"C:\Program Files (x86)\Steam\steamapps\common\XCom-Enemy-Unknown\XEW\XComGame\CookedPCConsole"`)
- Copy files from `Localization` into XCOM's Localization folder (`"C:\Program Files (x86)\Steam\steamapps\common\XCom-Enemy-Unknown\XEW\XComGame\Localization"`)
- Copy files from `Engine\Config` into XCOM's Engine folder (`"C:\Program Files (x86)\Steam\steamapps\common\XCom-Enemy-Unknown\XEW\Engine\Config"`)
- Copy `TexMod` from the `TexMod` folder to XCOM's Binaries folder (`"C:\Program Files (x86)\Steam\steamapps\common\XCom-Enemy-Unknown\XEW\Binaries\Win32"`)
  - Rename the `XComEW` executable to `XComEW_REAL`
  - Rename `TexMod` to `XComEW`
  - When launching XCOM, you will instead launch `TexMod`. Select all `.tpf` (`TexMod` package files) in `TexMod files` to load
- Configure any other mods to taste using the UI mod manager, and you're all set to play!