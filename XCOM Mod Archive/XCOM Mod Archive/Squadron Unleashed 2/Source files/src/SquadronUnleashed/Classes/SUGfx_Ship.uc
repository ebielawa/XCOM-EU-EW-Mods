class SUGfx_Ship extends GfxObject;

var bool m_bClosedIn;
var bool m_bMoving;
var GFxObject m_gfxGlobalCloseDistanceLocation;
var GFxObject m_gfxGlobalStartingLocation;
var UIModGfxSimpleShape m_gfxFocusBorder;
var UIModGfxSimpleProgressBar m_gfxDamageBar;
var UIModGfxSimpleShape m_gfxUFOTargetMarker;
var UIModGfxSimpleShape m_gfxLeaderFlag;
var UIModGfxTextField m_gfxAmmoTextField;
var bool m_bUFOTarget;
var bool m_bHasFocus;

delegate DelegateWithoutParams();

function bool IsUFO()
{
	return GetBool("isEnemy");
}
function SetHP(int iNewHP)
{
	local array<ASValue> arrParams;

	if(GetFloat("initialHP") < 0)
	{
		LogInternal("Set Hull (initial) on" @ self);
		SetHull(iNewHP);
	}
	SetFloat("currHP", float(iNewHP));
	UpdateDamageVisuals();
	AdjustDamageMasks();
	arrParams.Length=0;
	if(iNewHP <= 0)
	{
		Invoke("NotifyWeaponsOwnerDied", arrParams);
		GotoAndPlay("_destroyed");
		AS_SetOnDestructionCompleteDelegate(OnDestructionCompleteDelegate);
	}
}
/** Updates the ship's damage bar and color of the ship.*/
function UpdateDamageVisuals()
{
	local float fPctHPLeft;
	local array<ASValue> arrParams;

	fPctHPLeft = GetFloat("currHP") / GetFloat("initialHP");
	if(IsUFO() && !GetBool("isExploding") && fPctHPLeft < 0.5)
	{
		SetBool("isExploding", true);
		arrParams.Length = 0;
		Invoke("spawnExplosion", arrParams);
	}
	if(m_gfxDamageBar != none && class'SU_UIInterceptionEngagement'.default.SHOW_DAMAGE_BARS)
	{
		m_gfxDamageBar.SetProgress(fPctHPLeft);
	}
	if(class'SU_UIInterceptionEngagement'.default.SHOW_DAMAGE_COLORED_JETS)
	{
		if(fPctHPLeft < 0.25)
		{
			class'UIModUtils'.static.ObjectMultiplyColor(GetObject("effectsMC"), 2.50, 0.0, 0.0);
		}
		else if(fPctHPLeft < 0.5)
		{
			class'UIModUtils'.static.ObjectMultiplyColor(GetObject("effectsMC"), 2.50, 0.55, 0.0);
		}
		else if(fPctHPLeft < 0.75)
		{
			class'UIModUtils'.static.ObjectMultiplyColor(GetObject("effectsMC"), 2.50, 1.1, 0.0);
		}
	}
}
/** Applies the ship's HP/Hull data to the main damage diagram.*/
function AdjustDamageMasks()
{
	local GfxObject gfxDiagram, gfxCyanMask, gfxRedMask;
	local float fPctHP, fCyanH;

//	LogInternal(GetFuncName() @ GetString("_name") @ "("$self$")");
	gfxDiagram = GetObject("damageDiagram");
	gfxDiagram.GotoAndPlay(AS_GetShipLabel());
	gfxCyanMask = gfxDiagram.GetObject("cyanMask");
	gfxRedMask = gfxDiagram.GetObject("redMask");
	if(gfxCyanMask == none || gfxRedMask == none)
	{
		LogInternal("Error: Attempted to ajust HP without valid masks: cyanMask=" $ gfxCyanMask $ ", redMask=" $ gfxRedMask);
		return;
	}
	fPctHP = GetFloat("currHP") / GetFloat("initialHP");
	fCyanH = gfxCyanMask.GetFloat("_height") * fPctHP;
	gfxRedMask.SetFloat("_y", fCyanH);
	gfxCyanMask.SetFloat("_y", fCyanH - gfxCyanMask.GetFloat("_height"));
}
/** Sets visibility of "selection box" around the ship.*/
function SetFocus(bool bHasFocus)
{
	m_bHasFocus = bHasFocus;
	if(bHasFocus)
	{
		class'UIModUtils'.static.ObjectMultiplyColor(m_gfxFocusBorder,1.0,1.0,1.0,1.0);
	}
	else
	{
		class'UIModUtils'.static.ObjectMultiplyColor(m_gfxFocusBorder,1.0,1.0,1.0,0.02);//minimal alptha required for mouse response
	}
}
/**Set visibility of "reticile" indicator which marks current UFO's target*/
function SetUFOTarget(bool bUFOTarget)
{
	m_bUFOTarget = bUFOTarget;
	m_gfxUFOTargetMarker.SetVisible(m_bUFOTarget);
	if(m_bUFOTarget)
	{
		AdjustDamageMasks();
	}
}
function SetHull(int iNewHullStrength)
{
//	LogInternal(GetFuncName() @ iNewHullStrength);
	SetFloat("initialHP", float(iNewHullStrength));
}
function SetGlobalCloseDistanceLoc(GfxObject gfxGlobalLoc)
{
	m_gfxGlobalCloseDistanceLocation = gfxGlobalLoc;
}
function GfxObject GetCloseDistanceLoc()
{
	return m_gfxGlobalCloseDistanceLocation;
}
function SetGlobalStartingLoc(GFxObject gfxStartLoc)
{
	m_gfxGlobalStartingLocation = gfxStartLoc;
}
function GfxObject GetGlobalStartingLoc()
{
	return m_gfxGlobalStartingLocation;
}
function OnDestructionCompleteDelegate()
{
//	LogInternal(GetFuncName());
	SetVisible(false);
}
function AttachUFOTargetMarker(float fPerspectiveModifier, optional float fCombatScale)
{
	local float fR, fGlobalScaleModifier, fCenterX, fCenterY;
	local ASDisplayInfo tDisplay;
	if(m_gfxUFOTargetMarker == none)
	{
		tDisplay = GetObject("effectsMC").GetDisplayInfo();
		fGlobalScaleModifier= tDisplay.XScale / 100.0 / fPerspectiveModifier;
		fCenterX = tDisplay.X - GetObject("effectsMC").GetFloat("_width")*fGlobalScaleModifier/2.0;
		fCenterY = tDisplay.Y + GetObject("effectsMC").GetFloat("_height")*fGlobalScaleModifier/2.0;
		fR = 24.0 * fGlobalScaleModifier / fCombatScale;// * fPerspectiveModifier;
		m_gfxUFOTargetMarker = UIModGfxSimpleShape(GetObject("theShip").CreateEmptyMovieClip("UFOTargetMarker",,class'UIModGfxSimpleShape'));
		//DRAW THE RETICLE
		m_gfxUFOTargetMarker.DrawCircle(fR, fCenterX, fCenterY, 6, 0xFF0000);
		m_gfxUFOTargetMarker.AS_LineStyle(4, 0xFF0000, 80);
		m_gfxUFOTargetMarker.AS_MoveTo(fCenterX + fR, fCenterY);
		m_gfxUFOTargetMarker.AS_LineTo(fCenterX + fR/2, fCenterY);
		m_gfxUFOTargetMarker.AS_MoveTo(fCenterX - fR, fCenterY);
		m_gfxUFOTargetMarker.AS_LineTo(fCenterX - fR/2, fCenterY);
		m_gfxUFOTargetMarker.AS_MoveTo(fCenterX, fCenterY + fR);
		m_gfxUFOTargetMarker.AS_LineTo(fCenterX, fCenterY + fR/2);
		m_gfxUFOTargetMarker.AS_MoveTo(fCenterX, fCenterY - fR);
		m_gfxUFOTargetMarker.AS_LineTo(fCenterX, fCenterY - fR/2);
		m_gfxUFOTargetMarker.SetVisible(false);
	}
}
function AttachLeaderFlag(float fPerspectiveModifier, optional float fCombatScale)
{
	local float fArm, fGlobalScaleModifier, fX, fY;
	local ASDisplayInfo tDisplay;

	if(m_gfxLeaderFlag == none)
	{
		tDisplay = GetObject("effectsMC").GetDisplayInfo();
		fGlobalScaleModifier= tDisplay.XScale / 100.0 / fPerspectiveModifier;
		fArm = 20.0 * fGlobalScaleModifier / fCombatScale;//all the scaling is to get normalized size of the star
		fX = tDisplay.X - fArm * 2.0;
		fY = tDisplay.Y + fArm + 30;
		m_gfxLeaderFlag = UIModGfxSimpleShape(GetObject("theShip").CreateEmptyMovieClip("leaderFlag",,class'UIModGfxSimpleShape'));
		//DRAW THE STAR
		m_gfxLeaderFlag.DrawStar(fArm, 1, 0xFFFF00, 0xFFFF00);
		m_gfxLeaderFlag.SetPosition(fX, fY);
		m_gfxLeaderFlag.SetVisible(false);
	}
}
function AttachAmmoTxtField(optional float fPerspectiveModifier)
{
	local float fX, fY;

	if(GetObject("theShip").GetObject("ammoField") == none)
	{
		LogInternal(GetFuncName() @ self @ fPerspectiveModifier);
		m_gfxDamageBar.GetPosition(fX, fY);
		fY -= m_gfxDamageBar.GetFloat("_height");
		fX += m_gfxDamageBar.GetFloat("_width") - 50 / fPerspectiveModifier;

		m_gfxAmmoTextField = UIModGfxTextField(class'UIModUtils'.static.AttachTextFieldTo(GetObject("theShip"), "ammoField", fX, fY, 50 / fPerspectiveModifier, 20 / fPerspectiveModifier,, class'UIModGfxTextField'));
		m_gfxAmmoTextField.m_sTextAlign="right";
		m_gfxAmmoTextField.m_FontSize=13.0 / fPerspectiveModifier;
		m_gfxAmmoTextField.RealizeFormat();
		m_gfxAmmoTextField.SetVisible(true);
	}
}
function SetAmmoText(string sNewText)
{
	m_gfxAmmoTextField.SetHTMLText(sNewText);
}
function ToggleClosedInStatus()
{
	m_bClosedIn = !m_bClosedIn;
}
function ToggleMovingStatus()
{
	m_bMoving= !m_bMoving;
}
function bool HasMouseFocus()
{
	local float fW, fH, MouseX, MouseY;

	fW = m_gfxFocusBorder.GetFloat("_width")*1.10;
	fH = m_gfxFocusBorder.GetFloat("_height")*1.10;
	MouseX = m_gfxFocusBorder.GetFloat("_xmouse");
	MouseY = m_gfxFocusBorder.GetFloat("_ymouse");
	return (MouseX >= -10.0 && MouseX <= fW && MouseY >=1.0 && MouseY <= fH);
}
function AS_Initialize(coerce string strShipID, bool bEnemy, GfxObject gfxScreen)
{
	SetBool("bLoaded", true);
	ActionScriptVoid("Initialize");
}
function AS_SetShipType(int iType, optional float fScaleModifier=GetFloat("_xscale") / 100.0)
{
	LogInternal(GetFuncName() @  iType @ GetString("_name"));
	if(GetBool("isEnemy"))
	{
		SetFloat("shipType", float(iType));
	}
	ActionScriptVoid("SetShipType");
}
function int AS_GetShipType()
{
//	LogInternal(GetFuncName() @ self @ "returns" @ GetString("shipType"));
	return int(GetString("shipType"));
}
function string AS_GetShipLabel(optional int iShipType=AS_GetShipType())
{
//	LogInternal(GetFuncName() @ iShipType @ GetString("_name"));
	return ActionScriptString("GetShipLabel");
}
function AS_ShipMoveToLocation(GFxObject gfxLocation, float fMoveDuration)
{
	m_bMoving = true;
	class'SU_Utils'.static.PRES().SetTimer(fMoveDuration, false, 'AS_UpdateFiringLocation', self);
	class'SU_Utils'.static.PRES().SetTimer(fMoveDuration, false, 'ToggleMovingStatus', self);
	ActionScriptVoid("ShipMoveToLocation");
}
function AS_RemoveWeaponFromID(coerce string iWeaponID, coerce string targetShip)
{
	ActionScriptVoid("RemoveWeaponFromID");
}
function AS_Fire(GfxObject gfxTarget, int iWeaponType, int iWeaponID, int iDamage, float fDuration, bool bHit)
{
	ActionScriptVoid("Fire");
}
function GfxObject AS_GetGlobalFiringLocation()
{
	return ActionScriptObject("GetGlobalFiringLocation");
}
function AS_PopulateHitMissLocations()
{
	ActionScriptVoid("PopulateHitMissLocations");
}
function AS_UpdateFiringLocation()
{
	ActionScriptVoid("UpdateFiringLocation");
}
function AS_GlobalToLocal(out GFxObject gfxLocation)
{
	ActionScriptVoid("globalToLocal");
}
function AS_LocalToGlobal(out GFxObject gfxLocation)
{
	ActionScriptVoid("localToGlobal");
}
function AS_SetOnDestructionCompleteDelegate(delegate<DelegateWithoutParams> fnCallback)
{
	ActionScriptSetFunctionOn(GetObject("effectsMC"), "onDestructionComplete");
}

DefaultProperties
{
}