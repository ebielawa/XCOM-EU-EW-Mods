Enhanced Soldier Customization.txt
==================================

This is the main mod that allows for body size and voice modification. It should be installed with PatcherGUI 7.1 or better.
PatcherGUI can be downloaded here: http://www.nexusmods.com/xcom/mods/448/?

Enhanced Randomized Soldiers (optional).txt
===========================================

This mod requires that the "Enhanced Soldier Customization" is installed first.

There are 2 versions of this mod, each with different default settings. The "Big Head Soldiers" version will create soldiers
with big heads and a wide range of body sizes and voice pitches. The "Normal Looking Soldiers" version will create 
"normal" looking soldiers.

Install this if you want your new soldiers to have a wider range of initial appearances. They will have a wider range of
facial hair, hair colors and helmets. Their body size, head size and voice pitch will also be adjusted slightly to make
them all unique. 

This mod also has the ability to create "alien" soldiers. If you want aliens on your team find the following line in the file:

ALIAS=PercentageChanceOfAlienSoldier: <%b 0> // % chance a soldier will be an "alien"

and change the 0 to a value between 1 and 100. For example, set it to 20 if you want 20% of your soldiers to be "aliens".

Type 1 aliens are big and muton like with deep voices.
Type 2 aliens are small and sectoid like with high pitched voices.

Aliens will be given a full face helmet, a random alien name, and their flag will be set to "XCom".

If you use your own name list you can disable the alien names by searching for the following line:

ALIAS=GenerateAlienNames: <%b 1>

Change the 1 to a 0 to disable random alien names.

SUPPORT FOR GENDER AND RACE AWARE CUSTOM NAME LISTS
===================================================

The "Enhanced Randomized Soldiers" mod now also includes the "Gender and Race Aware" mod. 
It allows you to generate custom name lists that include gender and race information.

Simply create a list of names in a plain text file, one name per line.

To indicate gender, set the first character of the name to be "1" for male, "2" for female, e.g.:
1John Smith
2Sally Jones

If you don't specify a gender code it will be assigned randomly. This means you can still use your existing custom name files with this mod installed.

To indicate a race you MUST first set the gender as above, then also set the 2nd character of the name as follows:
"1" - Caucasian
"2" - African
"3" - Asian
"4" - Hispanic

e.g.
11John Travolta
12Mike Tyson
22Oprah
13Bruce Lee
24Jennifer Lopez

If race is not specified in the name it will be assigned randomly.

All the available code combinations are:
11 - Caucasian Male
12 - African Male
13 - Asian Male
14 - Hispanic Male
21 - Caucasian Female
22 - African Female
23 - Asian Female
24 - Hispanic Female

Once you have created and saved your name list, copy and paste it into the "XCom Namelist Generator" web site:
http://daiz.io/xcom-namegen/

Click on the "Download for Long War Beta 15" button to download a file named "DefaultNameList.ini". 
In your [XCOM Install Path]\XEW\XComGame\Config\ folder, make a backup copy of your existing DefaultNameList.ini file before replacing it with the file you downloaded.

Now the next time soldiers are added to your baracks, they will be selected from your custom name list and assigned the appropriate gender and race.

Included in the zip file package is "famouspeople.txt" which is a text file already set up with names, genders and races. There's also a DefaultNameList.ini file containing these names already formatted for Long War beta 15.
