Class ModBridge extends XComMod
 config(ModBridge);

var string valStrValue0;
var string valStrValue1;
var string valStrValue2;
var int valIntValue0;
var int valIntValue1;
var int valIntValue2;
var array<string> valArrStr;
var array<int> valArrInt;
var TTableMenu valTMenu;
var string functionName;
var string functParas;
var string ModInitError;
var bool bModReturn;
var class<CheatManager> ModCheatClass;
var array<XComMod> MBMods;
var config bool verboseLog;
var config array<string> ModList;
var actor kCallingActor;

simulated function StartMatch(){}
function ModError(string Error){}
function bool ModRecordActor(string Checkpoint, class<Actor> ActorClasstoRecord){}
function OverwriteCheatClass(){}

function SwitchCheatManager(string modpackage){}

function string GetCallingMod(optional int backlevels = 3){}

function AssignMods(){}

function ModsStartMatch(string funcName, string paras)
{}

function string StrValue0(optional string str, optional bool bForce)
{}

function string StrValue1(optional string str, optional bool bForce)
{}

function string StrValue2(optional string str, optional bool bForce)
{}

function int IntValue0(optional int I = -1, optional bool bForce)
{}

function int IntValue1(optional int I = -1, optional bool bForce)
{}

function int IntValue2(optional int I = -1, optional bool bForce)
{}

function array<string> arrStrings(optional array<string> arrStr, optional bool bForce)
{}

function array<int> arrInts(optional array<int> arrInt, optional bool bForce)
{}

//Force it to be blank by not specifying first parameter: ModBridge.TMenu(, true); /* 1B <TMenu> 0B 27 16 */
function TTableMenu TMenu(optional TTableMenu menu, optional bool bForce)
{}


function XComMod Mods(string ModName, optional string funcName, optional string paras, optional string strHookType)
{}

function string GetParameterString(int iParameterID)
{}