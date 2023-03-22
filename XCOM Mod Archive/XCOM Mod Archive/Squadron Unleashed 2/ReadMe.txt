INSTALLATION (does not require new campaign):

IF YOU HAVE FILES FROM EARLY ALPHA VERSIONS (from my Discord Channel), PLEASE, START WITH DELETING \Mods folder in \CookedPCConsole

NEW ROULETTE PLUS Mod users - you already have XComModBridge.u in your \CookedPCConsole. Don't overwrite it - delete it from the unzipped package before copying the files (you want Roulette Plus file, not mine).

1. Unzip Squadron Unleashed folder.
2. Drag \Localization, \Config, \CookedPCConsole folders into your ...\XEW\XComGame folder.
3. Confirm overwrites.
4. In DefaultMutatorLoader.ini add this line:

arrStrategicMutators=SquadronUnleashed.SquadronUnleashed

5. Note: unless you are a programmer-modder ignore \Source files.

Short manual:
FIRST OF ALL, ALMOST EVERYTHING IS .INI CONFIGURABLE - read DefaultSquadronUnleashed.ini for more info

SHIP SELECTION:
1. Stance buttons repurposed:
- left button toggles tactic
- center button toggles between usage of primary/secondary/both weapons
- right button allows to change pilot
2. Tactics AGG/BAL/DEF control auto-behavior in combat (check .ini or Air Force HQ in game)

COMBAT CONTROLS:
1. Double click a ship during combat to toggle close/back.
2. Hit space or enter to abort currently selected ship.
3. Keyboard arrows can be also used to select ship (up/down) and move close/back (left/right).
4. Modules are "consumed" by any ship, not just the one that toggled them.
5. There is an option to make dodge module work time-based instead of charge-based (check in DefaultSquadronUnleashed.ini)

WEAPONS FITTING PRIMARY SLOT by default:
- missiles, plasma, fusion

WEAPONS FITTING SECONDARY SLOT:
- cannons + plasma (yes, you can go double plasma).

All ships are auto-equipped with two weapons. 
Mod validates fitting into primary/secondary slots based on current .ini settings (moves between slots, moves to storage etc.).

Pilot must pass both XP and Kills requirement to be eligible for higher rank.
Careers don't need kills requirement - it can be set to 0.