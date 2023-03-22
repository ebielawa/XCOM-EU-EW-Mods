class SU_UIInterceptionEngagement extends UIInterceptionEngagement
	config(SquadronUnleashed);

var Vector2D m_vLastUpdateMouseLoc;
/**Distance in pixels by which mouse cursor must move in order to trigger UpdateMousCursorSelection*/
var float m_fMouseUpdateStepSq;
var localized string m_strPilotPromoted;
var localized string m_strPilotWounded;
var localized string m_strPilotSurvived;
var localized string m_strPilotKilled;
var localized string m_strInterceptorAborted;
var localized string m_strInterceptorDestroyed;
var int m_iResultScreenIterator;
var int m_iKillerShipIndex;
var int m_iSelectedShipGfx;
var array<int> m_arrShipGfxOrder;
var array<int> m_arrOutOfBattle;
var array<float> m_arrMoveTimers;
var config int DAMAGED_BATTLE_COLOR_ID;
var config int GOOD_BATTLE_COLOR_ID;
var config int LEADER_BATTLE_FONTSIZE;

var config bool SHOW_DAMAGE_BARS;
var config bool SHOW_DAMAGE_COLORED_JETS;
var config Color DAMAGE_BAR_BG_COLOR;
var config Color DAMAGE_BAR_HP_COLOR;

simulated event Tick(float fDeltaT)
{
	super.Tick(fDeltaT);//this will call Playback thus triggering CombatTick
	if(manager != none && manager.IsMouseActive() && V2DSizeSq(controllerRef.m_Pres.m_kUIMouseCursor.m_v2MouseLoc - m_vLastUpdateMouseLoc) > m_fMouseUpdateStepSq)
	{
		m_vLastUpdateMouseLoc = controllerRef.m_Pres.m_kUIMouseCursor.m_v2MouseLoc;
		UpdateMouseCursorSelection();
	}
}
function OnFlashCommand(string Cmd, string Arg)
{
    if(Cmd == "IntroSequenceComplete")
    {
		if(class'SquadronUnleashed'.default.TIME_SLOMO_FACTOR > 0.0)
		{
			WorldInfo.Game.SetGameSpeed(class'SquadronUnleashed'.default.TIME_SLOMO_FACTOR);
		}
		m_bIntroSequenceComplete = true;
		InitTutorial();
    }
}
function InitTutorial()
{
	local SU_HelpManager kHelpMgr;

	kHelpMgr = class'SU_Utils'.static.GetHelpMgr();
	kHelpMgr.QueueHelpMsg(eSUHelp_CombatIntro);
	kHelpMgr.QueueHelpMsg(eSUHelp_CombatDistance);
	kHelpMgr.QueueHelpMsg(eSUHelp_CombatShipControl);
	if(SU_XGInterception(m_kXGInterception).m_iSquadronAimBonus != 0 || SU_XGInterception(m_kXGInterception).m_iSquadronDefBonus != 0)
	{
		kHelpMgr.QueueHelpMsg(eSUHelp_CombatLeader);
	}
	kHelpMgr.PushState('ProcessingQueue');
	controllerRef.SetPause(true);
}

simulated function XGInterceptionEngagementUI GetMgr()
{
    return SU_XGInterceptionEngagementUI(XComHQPresentationLayer(controllerRef.m_Pres).GetMgr(class'SU_XGInterceptionEngagementUI', (self), 0));
}

simulated function OnInit()
{
    local int I;
	local XGShip kShip;
	local XGShip_Interceptor kUFOTarget;
	local SU_XGInterceptionEngagement kEngagement;

	//m_kXGInterception.m_kUFOTarget.m_kTShip.eType = 8;
	super.OnInit();//I think I can let original stuff (whatever it is, even modded) be done
	kEngagement = SU_XGInterceptionEngagement(m_kMgr.m_kInterceptionEngagement);
    for(I=0; I < kEngagement.GetNumShips(); ++I)
    {
		kShip = kEngagement.GetShip(I);
		class'SU_Utils'.static.DebugWeaponsForShip(kShip);//ensure correct lengths of arrays: arrWeapons and m_afWeaponCooldown
		class'SU_Utils'.static.RearmShip(kShip);//replenish ship's ammo - just in case
		AS_AddShip(kShip, GetShipType(kShip), kShip.IsAlienShip());
		AS_SetHP(I, kShip.GetHullStrength(), false);
		AS_SetHP(I, kShip.m_iHP, I == kEngagement.m_iUFOTarget);
		if(I==2)
		{
			m_arrShipGfxOrder.AddItem(2);//2nd ship goes visually below the 1st
		}
		else if(I > 0)
		{
			m_arrShipGfxOrder.InsertItem(0, I);//default order of 6 ships (from top of screen to bottom): 6,5,4,3,1,2
		}
		if(!kShip.IsAlienShip())
		{
			//SelfGfx().GetShip(kShip).m_gfxDamageBar.SetProgressTxtColor("0x67E8ED");
			UpdateAmmoIndicator(kShip);
			if(XGShip_Interceptor(kShip) == SU_XGInterception(m_kXGInterception).m_kSquadronLeader.GetShip())
			{
				AS_SetLeaderFlag(kShip);
			}
			SelfGfx().GetShip(kShip).m_gfxDamageBar.SetProgressTxt(class'UIUtilities'.static.GetHTMLColoredText(class'SU_Utils'.static.GetPilot(XGShip_Interceptor(kShip)).GetCallsignWithRank(false,true), default.GOOD_BATTLE_COLOR_ID, 14.0/SelfGfx().GetCombatScale()));
		}
		m_arrMoveTimers.Add(1);
    }
	kUFOTarget = XGShip_Interceptor(kEngagement.GetShip(kEngagement.m_iUFOTarget));
	AS_ShowEstablishingLinkLabel(class'UIUtilities'.static.GetHTMLColoredText(class'XGMissionControlUI'.default.m_strLabelUFOPrefix $ GetMgr().ITEMTREE().ShipTypeNames[kEngagement.GetShip(0).GetType()] @ class'SU_Utils'.static.StanceToString(kEngagement.GetShip(0)), class'SU_Utils'.static.GetStance(kEngagement.GetShip(0))==1 ? eUIState_Bad : eUIState_Normal, 30));
	//AS_DisplayEffectEvent(3, "", false);
	m_iSelectedShipGfx = m_arrShipGfxOrder.Find(kEngagement.m_iUFOTarget);
	RealizeSelected();
	AS_SetUFOTarget(kUFOTarget);
	SelfGfx().SetDelegates();
	SelfGfx().GetShip("alienTarget").GetObject("damageDiagram").SetVisible(class'SquadronUnleashed'.default.ALWAYS_SHOW_UFO_HP || (m_kMgr.ENGINEERING().IsFoundryTechResearched(45) && m_kMgr.LABS().IsResearched(kEngagement.GetShip(0).GetType() + 57)));
	`Log(GetFuncName() @ "done.", class'SquadronUnleashed'.default.bVerboseLog, 'SquadronUnleashed');
    //AS_SetAbortButtonText(m_strAbortMission);
}
function AS_AddShip(coerce string strShipID, int iType, optional bool bAlien)
{
	SelfGfx().AddShip(strShipID, iType, bAlien);
}
function CombatTick(float fDeltaT)
{
	local bool bCuePlayed;
	local XGShip kShip;
	local int I;

	if(!m_bIntroSequenceComplete || !class'SU_Utils'.static.GetHelpMgr().TutorialDone())
	{
		return;
	}
	if(m_fPlaybackTimeElapsed == 0.0)
	{
		m_fEnemyEscapeTimer = m_kMgr.m_kInterceptionEngagement.GetTimeUntilOutrun(1);
		AS_SetEnemyEscapeTimer(int(m_fEnemyEscapeTimer * 10.0));
		m_kMgr.m_kInterceptionEngagement.StaggerWeaponsForShip(0);//cause why not stagger UFO weapons :)
		for(I=0; I < m_kXGInterception.m_arrInterceptors.Length; ++I)
		{
			kShip = m_kXGInterception.m_arrInterceptors[I];
			m_kMgr.m_kInterceptionEngagement.StaggerWeaponsForShip(I+1);//set initial cooldowns to rand(0.1-2.0)
			if(ShouldAutoApproach(kShip))
			{
				if(!bCuePlayed)
				{
					m_kMgr.VOCloseDistance();
					bCuePlayed = true;//to avoid multiple VOCloseDistance sound cues
				}
				AS_MovementEvent(I+1, 1, 1.0);//+1 to skip UFO
			}
		}
	}
	m_fPlaybackTimeElapsed += fDeltaT;
	UpdateEnemyEscapeTimer(fDeltaT);
    UpdateWeapons(fDeltaT);//update cooldowns
	FireWeaponsCheck();//core mechanics - fire ready weapons, trigger Attack events
	DealDamageCheck();//handle "on hit" events (apply damage, dodge bullet)
	UpdateAutoPilot(fDeltaT);//abort/back-off/close-in based on HP or m_kTShip.iRange
    UpdateUFOTarget();//let UFO pick new target if necessary
}
/** Update weapon cooldowns.*/
function UpdateWeapons(float fDeltaT)
{
	local int iShip;

    for(iShip=0; iShip < m_kMgr.m_kInterceptionEngagement.GetNumShips(); ++iShip)
    {
        m_kMgr.m_kInterceptionEngagement.GetShip(iShip).UpdateWeapons(fDeltaT);
    }
}
function FireWeaponsCheck()
{
	local array<TShipWeapon> akShipWeapons;
    local XGShip kShip, kTargetShip;
    local int iShip, iWeapon;
	local XGInterceptionEngagement kEngagement;
	local TAttack kAttack;
	local CombatExchange kCombatExchange;
	local bool bDeactivateAimEffect;
	local TDamageData kDamageData;
	local SU_Pilot kPilot;
	local string strDebug;

	kEngagement = m_kMgr.m_kInterceptionEngagement;
	for(iShip=0; iShip < kEngagement.GetNumShips(); ++iShip)
	{
		kShip = kEngagement.GetShip(iShip);
		if(kShip.IsHumanShip())
		{
			kPilot = class'SU_Utils'.static.GetPilot(XGShip_Interceptor(kShip));
		}
		if(kShip.m_kTShip.iRange == 3 || kShip.m_iHP < 0)
		{
			//LogInternal(GetFuncName() @ kShip @ "out of battle.");
			continue;
		}
		akShipWeapons = kShip.GetWeapons();
		if(akShipWeapons.Length < 2)
		{
			//vulcan must have been skipped, so...
			akShipWeapons.AddItem(m_kMgr.SHIPWEAPON(0));
		}
		for(iWeapon = 0; iWeapon < akShipWeapons.Length; ++iWeapon)
		{
			if(akShipWeapons[iWeapon].eType >= 0 && class'SU_Utils'.static.GetAmmo(kShip, iWeapon) != 0)
			{
				if(!class'SU_Utils'.static.IsShortDistanceWeapon(akShipWeapons[iWeapon].eType) || SelfGfx().GetShip(kShip).m_bClosedIn)
				{
					if(kShip.m_afWeaponCooldown[iWeapon] <= 0.0)
					{
						kShip.m_afWeaponCooldown[iWeapon] += akShipWeapons[iWeapon].fFiringTime;
							strDebug $= (kShip @ "about to attack...");
							strDebug $= ("\n"$Chr(9)$ "iWeapon=" $ iWeapon @ "eType="$ akShipWeapons[iWeapon].eType @ "iAmmo="$class'SU_Utils'.static.GetAmmo(kShip, iWeapon)); 
						kAttack.iSourceShip = iShip;
						kAttack.iTargetShip = (kAttack.iSourceShip == 0 ? kEngagement.m_iUFOTarget : 0);
						kTargetShip = kEngagement.GetShip(kAttack.iTargetShip);
							strDebug $= ("\n"$Chr(9)$kTargetShip @ "under attack...");
						if(kTargetShip.IsHumanShip())
						{
							kPilot = class'SU_Utils'.static.GetPilot(XGShip_Interceptor(kTargetShip));
						}
						if(kTargetShip.m_kTShip.iRange == 3 || kTargetShip.m_iHP < 0)
						{
							strDebug $= ("\n"$Chr(9)$kTargetShip @ "already out of battle, attack cancelled. THIS IS UNUSUAL - check for bugs.");
							break;
						}
						else
						{
							if(kAttack.iSourceShip != 0 && m_bPendingDisengage)
							{
								break;
							}
							else
							{
								++m_iBulletIndex;
								class'SU_Utils'.static.ConsumeAmmo(kShip, iWeapon);
								if(!kShip.IsAlienShip())
								{
									UpdateAmmoIndicator(kShip);
								}
								kAttack.iWeapon = akShipWeapons[iWeapon].eType;
								kAttack.fDuration = 0.30;
								kAttack.bHit = Rand(100) < class'SU_Utils'.static.GetHitChance(kShip, kTargetShip, iWeapon, false, SelfGfx().GetShip(kShip).m_bClosedIn || SelfGfx().GetShip(kTargetShip).m_bClosedIn);
								if(kAttack.bHit && kTargetShip.IsHumanShip())
								{
									kAttack.bHit = Rand(100) > ((kTargetShip.m_kTShip.iRange == 2 ? class'SquadronUnleashed'.default.DEF_JET_DODGE_CHANCE : 0) + (kPilot.IsTraitActive(SelfGfx().GetShip(kShip).m_bClosedIn) ? kPilot.GetCareerTrait().iBonusDodge : 0) + (kPilot.IsFirestormTraitActive(SelfGfx().GetShip(kShip).m_bClosedIn) ? kPilot.GetFirestormTrait().iBonusDodge : 0));
								}
								if(!kAttack.bHit && kTargetShip.IsHumanShip() && kTargetShip.m_kTShip.iRange == 1)
								{
									kAttack.bHit = Rand(100) < class'SquadronUnleashed'.default.AGG_JET_FORCE_HIT_CHANCE;
								}
								bDeactivateAimEffect = false;
								//aim module is consumed by any ship:
								if(m_kMgr.m_kInterceptionEngagement.GetNumConsumableInEffect(127) > 0 && kAttack.iTargetShip == 0)//used to be: kAttack.iSourceShip == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget)
								{
									if(!kAttack.bHit)
									{
										m_kMgr.m_kInterceptionEngagement.UseConsumableEffect(127);
										kAttack.bHit = true;
										if(m_kMgr.m_kInterceptionEngagement.GetNumConsumableInEffect(127) == 0)
										{
											bDeactivateAimEffect = true;
										}
									}
								}
								if(!kAttack.bHit && kAttack.iSourceShip == 0 && (class'SquadronUnleashed'.default.LONE_BULLET_CHANCE_BAL > 0 || class'SquadronUnleashed'.default.LONE_BULLET_CHANCE_AGG > 0))
								{
									strDebug $= ("\n"$Chr(9)$"\"Lone bullet mechanics\" check...");
									kCombatExchange.iTargetShip = -1;
									//FIXME, consider scrapping "lone bullet" mechanics
									for(kCombatExchange.iTargetShip=0; kCombatExchange.iTargetShip < m_kXGInterception.m_arrInterceptors.Length; ++kCombatExchange.iTargetShip)
									{
										if(kCombatExchange.iTargetShip == kAttack.iTargetShip)
										{
											continue;
										}
										kTargetShip = m_kXGInterception.m_arrInterceptors[kCombatExchange.iTargetShip];
										if(kTargetShip.m_kTShip.iRange == 0 && Rand(100) < class'SquadronUnleashed'.default.LONE_BULLET_CHANCE_BAL)
										{
											kAttack.bHit = true;
											kAttack.iTargetShip = ++kCombatExchange.iTargetShip;
											strDebug $= ("\n"$Chr(9)$"Lone bullet hits" @ kTargetShip);
											break;
										}
										if(kTargetShip.m_kTShip.iRange == 1 && Rand(100) < class'SquadronUnleashed'.default.LONE_BULLET_CHANCE_AGG)
										{
											kAttack.bHit = true;
											kAttack.iTargetShip = ++kCombatExchange.iTargetShip;
											strDebug $= ("\n"$Chr(9)$"Lone bullet hits" @ kTargetShip);
											break;
										}
									}
								}
								if(!kAttack.bHit)
								{
									kAttack.fDuration += 0.30;
									kAttack.iDamage = 0;
								}
								else
								{
									kCombatExchange.iSourceShip = kAttack.iSourceShip;//feed kCombatExchange for GetShipDamage call
									kCombatExchange.iTargetShip = kAttack.iTargetShip;//feed kCombatExchange for GetShipDamage call
									kAttack.iDamage = kEngagement.GetShipDamage(kShip.SHIPWEAPON(kAttack.iWeapon), kCombatExchange);
									kAttack.iDamage = kAttack.iDamage + Rand(kAttack.iDamage / 2);
									if(kShip.IsA('XGShip_Interceptor'))
									{
										kPilot = class'SU_Utils'.static.GetPilot(XGShip_Interceptor(kShip));
										kPilot.m_iXP += class'SU_Utils'.static.GetRankMgr().XP_FOR_HIT;
										kPilot.m_iLastBattleXP += class'SU_Utils'.static.GetRankMgr().XP_FOR_HIT;
										if(class'SU_Utils'.static.GetGameCore().LABS().IsResearched(kEngagement.GetShip(kAttack.iTargetShip).m_kTShip.eType + 57))
										{
											kAttack.iDamage *= (1.0 + class'SquadronUnleashed'.default.EXTRA_DMG_FOR_RESEARCH);                                                                        
										}
										kAttack.iDamage *= (1.0 + kPilot.m_iKills * class'SquadronUnleashed'.default.EXTRA_DMG_PCT_PER_KILL);
										kAttack.iDamage *= class'SU_Utils'.static.GetRankDmgBonus(kPilot.GetRank(), kPilot.GetCareerType());
										if(class'SU_Utils'.static.IsSecondaryWeapon(iWeapon, kShip))
										{
											kAttack.iDamage *= class'SquadronUnleashed'.default.SECONDARY_WPN_DMG_MOD;
										}
										if(class'SU_Utils'.static.GetStance(kShip) == 1)
										{
											kAttack.iDamage *= (1.0 + class'SquadronUnleashed'.default.AGG_JET_DMG_BONUS);
										}
										if(kPilot.IsTraitActive(SelfGfx().GetShip(kShip).m_bClosedIn))
										{
											kAttack.iDamage *= 1.0 + float(kPilot.GetCareerTrait().iBonusDmgPct) / 100.0;
										}
										if(kPilot.IsFirestormTraitActive(SelfGfx().GetShip(kShip).m_bClosedIn))
										{
											kAttack.iDamage *= 1.0 + float(kPilot.GetFirestormTrait().iBonusDmgPct) / 100.0;
										}
									}
									else if(class'SU_Utils'.static.GetStance(kTargetShip) == 1)
									{
										kAttack.iDamage *= (1.0 + class'SquadronUnleashed'.default.AGG_JET_DMG_VULNERABILITY);
									}
									if(kTargetShip.IsA('XGShip_Interceptor') && kAttack.iTargetShip != m_kMgr.m_kInterceptionEngagement.m_iUFOTarget)
									{
										kAttack.iDamage = int(float(kAttack.iDamage) * class'SquadronUnleashed'.default.LONE_BULLET_DMG_MOD);
									}
									else if(Rand(100) <= class'SU_Utils'.static.GetCritChance(kShip, kTargetShip, iWeapon))
									{
										kAttack.iDamage *= class'SquadronUnleashed'.default.CRIT_DMG_MULTIPLIER;
										kAttack.iDamage *= class'SU_Utils'.static.GetWeaponCritDmgModPct(kAttack.iWeapon);
										kAttack.iDamage += class'SU_Utils'.static.GetWeaponCritDmgModFlat(kAttack.iWeapon);
										if(kShip.IsHumanShip())
										{
											if(kPilot.IsTraitActive(SelfGfx().GetShip(kShip).m_bClosedIn))
												kAttack.iDamage *= 1.0 + float(kPilot.GetCareerTrait().iBonusCritDmgPct) / 100.0;
											if(kPilot.IsFirestormTraitActive(SelfGfx().GetShip(kShip).m_bClosedIn))
												kAttack.iDamage *= 1.0 + float(kPilot.GetFirestormTrait().iBonusCritDmgPct) / 100.0;
										}
									}
									kDamageData.iDamage = kAttack.iDamage;
									kDamageData.iBulletID = m_iBulletIndex;
									kDamageData.iShip = kAttack.iTargetShip;
									if(SelfGfx().GetShip(kShip).m_bClosedIn || SelfGfx().GetShip(kTargetShip).m_bClosedIn)
									{
										kDamageData.fTime = m_fPlaybackTimeElapsed + SelfGfx().CalculateDurationOffsetBasedOnDistance(kAttack.fDuration, string(kShip), string(kTargetShip));
									}
									else
									{
										kDamageData.fTime = m_fPlaybackTimeElapsed + kAttack.fDuration;
									}
									m_akDamageInformation.AddItem(kDamageData);
								}
								if(!kShip.IsAlienShip() && class'SU_Utils'.static.IsShortDistanceWeapon(kAttack.iWeapon) && m_kMgr.m_bFirstFire)
								{
									m_kMgr.PRES().UINarrative(m_kMgr.PRES().m_kNarrative.m_arrNarrativeMoments[158]);
									m_kMgr.m_bFirstFire = false;
								}
								if(kTargetShip.IsAlienShip() && kTargetShip.m_iHP <= kDamageData.iDamage)
								{
									m_iKillerShipIndex = kAttack.iSourceShip;
								}
								m_kMgr.SFXFire(kAttack.iWeapon > 0 ? kAttack.iWeapon : eShipWeapon_Cannon);
								AS_AttackEvent(kAttack.iSourceShip, kAttack.iTargetShip, kAttack.iWeapon, m_iBulletIndex, kAttack.iDamage, kAttack.fDuration, kAttack.bHit);
								if(bDeactivateAimEffect)
								{
									AS_DisplayEffectEvent(0, GetAbilityDescription(0), false, m_iBulletIndex);
								}
							}
						}
					`Log(strDebug, class'SquadronUnleashed'.default.bVerboseLog, GetFuncName());
					}
				}
			}
		}
	}
}
function DealDamageCheck()
{
	local int I;
	local XGShip kShip;
	local string strDebug;

	for(I = m_iDamageDataIndex; I < m_akDamageInformation.Length; ++I)
	{
		if(m_akDamageInformation[I].fTime < m_fPlaybackTimeElapsed)
		{
			++ m_iDamageDataIndex;
			kShip = m_kMgr.m_kInterceptionEngagement.GetShip(m_akDamageInformation[I].iShip);
			if(m_kMgr.m_kInterceptionEngagement.GetNumConsumableInEffect(125) > 0 && kShip.IsHumanShip())
			{
				m_kMgr.m_kInterceptionEngagement.UseConsumableEffect(125);
				if(!m_kMgr.m_kInterceptionEngagement.IsConsumableInEffect(125))
				{
					AS_DisplayEffectEvent(1, GetAbilityDescription(1), false);
					AS_SetDodgeButton(m_strDodgeAbility, 2);
				}
			}
			else
			{
				m_kMgr.SFXShipHit(kShip, m_akDamageInformation[I].iDamage);
				if(kShip.IsAlienShip())
				{
					if(kShip.m_iHP > 0)
					{
						kShip.m_iHP -= m_akDamageInformation[I].iDamage;
					}
					if(kShip.m_iHP <= 0)
					{
						m_kMgr.SFXShipDestroyed(kShip);
					}
					strDebug $= ("\n"$Chr(9)$"m_fPlaybackTimeElapsed" @ m_fPlaybackTimeElapsed $ ",Unreal SetHP(0," @ kShip.m_iHP $", false, "@ m_akDamageInformation[I].iBulletID$")"); 
					AS_SetHP(0, kShip.m_iHP, true, m_akDamageInformation[I].iBulletID);
				}
				else
				{
					//if(kShip.m_iHP < m_akDamageInformation[I].iDamage /*&& m_akDamageInformation[I].iShip == 1*/)
					//{
					//	//AS_SetHP(1, 1, false, m_akDamageInformation[I].iBulletID);
					//	kShip.m_kTShip.iRange = 3;//mark as no longer in battle
					//}
					/*else if(m_akDamageInformation[I].iShip == 1)
					{
					}*/
					kShip.m_iHP -= m_akDamageInformation[I].iDamage;
					strDebug $= ("\n"$Chr(9)$"m_fPlaybackTimeElapsed" @ m_fPlaybackTimeElapsed $ ", Unreal SetHP(" $ m_akDamageInformation[I].iShip $"," @ kShip.m_iHP $"," @ (m_akDamageInformation[I].iShip == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget) $"," @ m_akDamageInformation[I].iBulletID$")"); 
					AS_SetHP(m_akDamageInformation[I].iShip, kShip.m_iHP, m_akDamageInformation[I].iShip == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget, m_akDamageInformation[I].iBulletID);
					if(kShip.m_iHP <= 0)
					{
						kShip.m_kTShip.iRange = 3;
						m_kMgr.SFXShipDestroyed(kShip);
					}
					else if(XGShip_Interceptor(kShip).GetHPPct() <= class'SU_Utils'.static.GetAutoDisengageHPTreshold(XGShip_Interceptor(kShip)))
					{
						kShip.m_kTShip.iRange = 3;
						m_kMgr.PRES().UINarrative(xcomnarrativemoment(DynamicLoadObject("NarrativeMoment.InterceptorAborting", class'xcomnarrativemoment')));
					}
					else if(XGShip_Interceptor(kShip).GetHPPct() <= class'SU_Utils'.static.GetAutoBackOffHPTreshold(XGShip_Interceptor(kShip)))
					{
						AS_MovementEvent(m_akDamageInformation[I].iShip, 0, 1.0);

					}
					if(m_akDamageInformation[I].iShip == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget && kShip.m_kTShip.iRange == 3)
					{
						if(AnyInterceptorsChasing())
						{
							TryAbort();
						}
						else
						{
							//AS_SetHP(1, 0, false);
							//m_kMgr.SFXShipDestroyed(kShip);
							m_kXGInterception.m_eUFOResult = 3;
						}
					}
					//AS_DisplayEffectEvent(3, SU_XGInterceptionEngagement(m_kMgr.m_kInterceptionEngagement).GetSquadronStatusBrief(), false);
					if(kShip.m_kTShip.iRange == 3)
					{
						class'UIModUtils'.static.ObjectMultiplyColor(SelfGfx().GetShip(kShip), 1,1,1,0.40);
						if(kShip.m_iHP <=0)
						{
							SelfGfx().GetShip(kShip).SetVisible(false);
						}
						else
						{
							AS_MovementEvent(m_akDamageInformation[I].iShip, -1, 5.00);
						}
					}
				}
				`Log(strDebug, strDebug != "" && class'SquadronUnleashed'.default.bVerboseLog, GetFuncName());
			}
		}
	}
}
function UpdateMouseCursorSelection()
{
	local int I, iSelection;
	
	iSelection = -1;
	if(manager != none)
	{
		for(I=0; I < m_kXGInterception.m_arrInterceptors.Length; ++I)
		{
			if(SelfGfx().GetShip(m_kXGInterception.m_arrInterceptors[I]).HasMouseFocus())
			{
				iSelection = m_arrShipGfxOrder.Find(I+1);
				break;
			}
		}
		if(iSelection != m_iSelectedShipGfx && iSelection != -1)
		{
			m_iSelectedShipGfx = iSelection;
			RealizeSelected();
		}
	}
}
function UpdateAutoPilot(optional float fDeltaTime)
{
	local XGShip_Interceptor kShip;
	local int iShip;

	if(m_bPendingDisengage || m_kXGInterception.m_eUFOResult != 0)
	{
		return;
	}
	foreach m_kXGInterception.m_arrInterceptors(kShip, iShip)
	{
		if(fDeltaTime >= 0.0)
		{
			m_arrMoveTimers[iShip+1] -= fDeltaTime;
		}
		if(SelfGfx().GetShip(kShip).m_bMoving)
		{
			continue;
		}
		if(class'SU_Utils'.static.GetStance(kShip) == 3)
		{
			AS_MovementEvent(iShip+1, -1, 5.0);
		}
		else if(ShouldAutoApproach(kShip, false))
		{
			AS_MovementEvent(iShip+1, 1, 1.0);
		}
	}
	SU_XGInterception(m_kXGInterception).UpdateSquadronTeamBonuses(true);
}
simulated function Playback(float fDeltaT)
{
	local bool bDeactivateAimEffect, bDone;
	local int I, iStreamIndex, iPlaybackIndex, iPlaybackLength;
	local TAttack kAttack;
	local TDamageData kDamageData;
	local XGShip kShip, kTargetShip;
	local CombatExchange kCombatExchange;
	local float fPlaybackTime, fTimeOffset;

	CombatTick(fDeltaT);
	return;
//---------------------------------------------------------
//---------------OLD CODE - DEPRECATED---------------------
//---------------------------------------------------------
	if(!m_bIntroSequenceComplete)
	{
		return;
	}
	if(m_fPlaybackTimeElapsed == 0.0)
	{
		m_fEnemyEscapeTimer = m_kMgr.m_kInterceptionEngagement.GetTimeUntilOutrun(1);
		//AS_MovementEvent(0, 0, m_fEnemyEscapeTimer);//?? redundant, moveType 0 does nothing
		AS_SetEnemyEscapeTimer(int(m_fEnemyEscapeTimer * float(10)));
		for(I=0; I < m_kXGInterception.m_arrInterceptors.Length; ++I)
		{
			kShip = m_kXGInterception.m_arrInterceptors[I];
			if(ShouldAutoApproach(kShip))
			{
				if(!bDone)
				{
					m_kMgr.VOCloseDistance();
					bDone = true;//to avoid multiple VOCloseDistance sound cues
				}
				AS_MovementEvent(I+1, 1, 1.0);//+1 to skip UFO
			}
		}
	}
	m_fPlaybackTimeElapsed += fDeltaT;
	UpdateEnemyEscapeTimer(fDeltaT);
	for(iStreamIndex=0; iStreamIndex < 2; ++iStreamIndex)
	{
		fPlaybackTime = m_fPlaybackTimeElapsed;
		fTimeOffset = 0.0;
		if(iStreamIndex == 0)
		{
			iPlaybackIndex = m_iInterceptorPlaybackIndex;
			iPlaybackLength = m_kMgr.m_kInterceptionEngagement.m_kCombat.m_aInterceptorExchanges.Length;
			fTimeOffset = m_kMgr.m_kInterceptionEngagement.m_fInterceptorTimeOffset;
		}
		else
		{
			iPlaybackIndex = m_iUFOPlaybackIndex;
			iPlaybackLength = m_kMgr.m_kInterceptionEngagement.m_kCombat.m_aUFOExchanges.Length;
		}
		fPlaybackTime += fTimeOffset;
		for(I=iPlaybackIndex; I < iPlaybackLength; ++I)
		{
			if(iStreamIndex == 0)
			{
				kCombatExchange = m_kMgr.m_kInterceptionEngagement.m_kCombat.m_aInterceptorExchanges[I];
			}
			else
			{
				kCombatExchange = m_kMgr.m_kInterceptionEngagement.m_kCombat.m_aUFOExchanges[I];
			}
			if(kCombatExchange.fTime < fPlaybackTime)
			{
				if(iStreamIndex == 0)
				{
					++ m_iInterceptorPlaybackIndex;
				}
				else
				{
					++ m_iUFOPlaybackIndex;
				}
				++ m_iBulletIndex;
				kAttack.iSourceShip = kCombatExchange.iSourceShip;
				kShip = m_kMgr.m_kInterceptionEngagement.GetShip(kAttack.iSourceShip);
				LogInternal(kShip @ "about to attack...");
				if(kShip.m_kTShip.iRange == 3)
				{
					LogInternal(kShip @ "already left battle, skipping attack.");
					//continue;
				}
				else
				{
					kAttack.iTargetShip = ((kAttack.iSourceShip == 0) ? m_kMgr.m_kInterceptionEngagement.m_iUFOTarget : 0);
					kTargetShip = m_kMgr.m_kInterceptionEngagement.GetShip(kAttack.iTargetShip);
					LogInternal(kTargetShip @ "under attack...");
					if(kTargetShip.m_kTShip.iRange == 3)
					{
						LogInternal(kTargetShip @ "left battle, attack cancelled.");
						//continue;
					}
					else
					{
						if(kShip.m_iHP <= 0 || kTargetShip.m_iHP <= 0)
						{
							//continue;
						}
						else
						{
							if((kAttack.iSourceShip != 0) && m_bPendingDisengage)
							{
								//continue;
							}
							else
							{
								kAttack.iWeapon = GetWeaponType(kCombatExchange);
								kAttack.iDamage = kCombatExchange.iDamage;
								kAttack.iDamage = kAttack.iDamage / int(1.0);
								kAttack.fDuration = 0.30;
								kAttack.bHit = kCombatExchange.bHit;
								if(kAttack.bHit && kTargetShip.m_kTShip.iRange == 2)
								{
									kAttack.bHit = Rand(100) > class'SquadronUnleashed'.default.DEF_JET_DODGE_CHANCE;//FIXME
								}
								if(!kAttack.bHit && kTargetShip.m_kTShip.iRange == 1)
								{
									kAttack.bHit = Rand(100) < class'SquadronUnleashed'.default.AGG_JET_FORCE_HIT_CHANCE;
								}
								bDeactivateAimEffect = false;
								if(m_kMgr.m_kInterceptionEngagement.GetNumConsumableInEffect(127) > 0 && kAttack.iSourceShip == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget)
								{
									//FIXME, consider using Aim effect by any ship (then the check above would be iTargetShip == 0)
									if(kCombatExchange.iDamage > 0 && !kAttack.bHit)
									{
										m_kMgr.m_kInterceptionEngagement.UseConsumableEffect(127);
										kAttack.bHit = true;
										if(m_kMgr.m_kInterceptionEngagement.GetNumConsumableInEffect(127) == 0)
										{
											bDeactivateAimEffect = true;
										}
									}
								}
								if(!kAttack.bHit && kAttack.iTargetShip != 0)
								{
									//FIXME, consider scrapping "lone bullet" mechanics
									while(kAttack.iTargetShip < m_kXGInterception.m_arrInterceptors.Length)
									{
										++ kAttack.iTargetShip;
										kTargetShip = m_kXGInterception.m_arrInterceptors[kAttack.iTargetShip - 1];
										// End:0xB04
										if(kTargetShip.m_kTShip.iRange == 0 && Rand(100) < 20)//FIXME, chance to be hit when BAL
										{
											kAttack.bHit = true;
											break;
										}
										if(kTargetShip.m_kTShip.iRange == 1 && Rand(100) < 40)//FIXME, chance to be hit when AGG
										{
											kAttack.bHit = true;
											break;
										}
									}
								}
								if(!kAttack.bHit)
								{
									kAttack.fDuration += 0.30;
									kAttack.iDamage = 0;
								}
								else
								{
									if(kTargetShip.m_kTShip.eType != m_kMgr.m_kInterceptionEngagement.GetShip(kCombatExchange.iTargetShip).m_kTShip.eType)
									{
										kCombatExchange.iDamage = m_kMgr.m_kInterceptionEngagement.GetShipDamage(kShip.SHIPWEAPON(kShip.m_kTShip.arrWeapons[kCombatExchange.iWeapon]), kCombatExchange);
										kCombatExchange.iTargetShip = kAttack.iTargetShip;
										kAttack.iDamage *= (float(m_kMgr.m_kInterceptionEngagement.GetShipDamage(kShip.SHIPWEAPON(kShip.m_kTShip.arrWeapons[kCombatExchange.iWeapon]), kCombatExchange)) / float(kCombatExchange.iDamage));
									}
									if(Rand(100) <= Clamp(((kShip.SHIPWEAPON(kShip.m_kTShip.arrWeapons[kCombatExchange.iWeapon]).iAP + kShip.m_kTShip.iAP) - kTargetShip.m_kTShip.iArmor) / 2, 5, 25))//FIXME, min and max crit hit
									{
										kAttack.iDamage *= 2.0;//FIXME, crit damage multiplier
									}
									kDamageData.iDamage = kAttack.iDamage;
									kDamageData.iBulletID = m_iBulletIndex;
									kDamageData.iShip = kAttack.iTargetShip;
									kDamageData.fTime = (kCombatExchange.fTime + kAttack.fDuration) - fTimeOffset;
									m_akDamageInformation.AddItem(kDamageData);
								}
								if(!kShip.IsAlienShip())
								{
									m_kMgr.VOInRange();
								}
								if(kAttack.iTargetShip > m_kMgr.m_kInterceptionEngagement.m_iUFOTarget)
								{
									kDamageData.iDamage = int(float(kDamageData.iDamage) * 1.0);//FIXME lone bullet multiplier
									//kAttack.iDamage = 1;//no longer required cause Action Script no longer handles dealing damage
								}
								if(kTargetShip.IsAlienShip() && kTargetShip.m_iHP <= kDamageData.iDamage)
								{
									m_iKillerShipIndex = kAttack.iSourceShip;
								}
								m_kMgr.SFXFire(kAttack.iWeapon);
								AS_AttackEvent(kAttack.iSourceShip, kAttack.iTargetShip, kAttack.iWeapon, m_iBulletIndex, kAttack.iDamage, kAttack.fDuration, kAttack.bHit);
								if(bDeactivateAimEffect)
								{
									AS_DisplayEffectEvent(0, GetAbilityDescription(0), false, m_iBulletIndex);
								}
							}
						}
					}
				}
			}
		}
	}
	for(I = m_iDamageDataIndex; I < m_akDamageInformation.Length; ++I)
	{
		if(m_akDamageInformation[I].fTime < m_fPlaybackTimeElapsed)
		{
			++ m_iDamageDataIndex;
			kShip = m_kMgr.m_kInterceptionEngagement.GetShip(m_akDamageInformation[I].iShip);
			if(m_kMgr.m_kInterceptionEngagement.GetNumConsumableInEffect(125) > 0 && kShip.IsHumanShip())
			{
				m_kMgr.m_kInterceptionEngagement.UseConsumableEffect(125);
				if(!m_kMgr.m_kInterceptionEngagement.IsConsumableInEffect(125))
				{
					AS_DisplayEffectEvent(1, GetAbilityDescription(1), false);
					AS_SetDodgeButton(m_strDodgeAbility, 2);
				}
			}
			else
			{
				m_kMgr.SFXShipHit(kShip, m_akDamageInformation[I].iDamage);
				if(kShip.IsAlienShip())
				{
					if(kShip.m_iHP > 0)
					{
						kShip.m_iHP -= m_akDamageInformation[I].iDamage;
					}
					if(kShip.m_iHP <= 0)
					{
						m_kMgr.SFXShipDestroyed(kShip);
					}
					LogInternal("m_fPlaybackTimeElapsed" @ m_fPlaybackTimeElapsed $ ",Unreal SetHP(0," @ kShip.m_iHP $", false, "@ m_akDamageInformation[I].iBulletID$")"); 
					AS_SetHP(0, kShip.m_iHP, true, m_akDamageInformation[I].iBulletID);
				}
				else
				{
					if(kShip.m_iHP < m_akDamageInformation[I].iDamage /*&& m_akDamageInformation[I].iShip == 1*/)
					{
						//AS_SetHP(1, 1, false, m_akDamageInformation[I].iBulletID);
						kShip.m_kTShip.iRange = 3;//mark as no longer in battle
					}
					/*else if(m_akDamageInformation[I].iShip == 1)
					{
					}*/
					kShip.m_iHP -= m_akDamageInformation[I].iDamage;
					LogInternal("m_fPlaybackTimeElapsed" @ m_fPlaybackTimeElapsed $ ",Unreal SetHP(" $ m_akDamageInformation[I].iShip $"," @ kShip.m_iHP $"," @ (m_akDamageInformation[I].iShip == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget) $"," @ m_akDamageInformation[I].iBulletID$")"); 
					AS_SetHP(m_akDamageInformation[I].iShip, kShip.m_iHP, m_akDamageInformation[I].iShip == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget, m_akDamageInformation[I].iBulletID);
					if(XGShip_Interceptor(kShip).GetHPPct() < 0.250 && m_akDamageInformation[I].iShip > m_kMgr.m_kInterceptionEngagement.m_iUFOTarget)//FIXME, auto-disengage
					{
						kShip.m_kTShip.iRange = 3;
						m_kMgr.PRES().UINarrative(xcomnarrativemoment(DynamicLoadObject("NarrativeMoment.InterceptorAborting", class'xcomnarrativemoment')));
					}
					if(kShip.m_iHP <= 0)
					{
						kShip.m_kTShip.iRange = 3;
						m_kMgr.SFXShipDestroyed(kShip);
					}
					if(m_akDamageInformation[I].iShip == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget && kShip.m_kTShip.iRange == 3)
					{
						//FIXME, handling of UFO target swapping after the current one destroyed/disengaged
						if(m_kMgr.m_kInterceptionEngagement.AnyInterceptorsChasing())
						{
							TryAbort();
						}
						else
						{
							//AS_SetHP(1, 0, false);
							m_kMgr.SFXShipDestroyed(kShip);
							m_kXGInterception.m_eUFOResult = 3;
						}
					}
					//AS_DisplayEffectEvent(3, SU_XGInterceptionEngagement(m_kMgr.m_kInterceptionEngagement).GetSquadronStatusBrief(), false);
					if(kShip.m_kTShip.iRange == 3)
					{
						class'UIModUtils'.static.ObjectMultiplyColor(SelfGfx().GetShip(kShip), 1,1,1,0.40);
						if(kShip.m_iHP <=0)
						{
							SelfGfx().GetShip(kShip).SetVisible(false);
						}
						else
						{
							AS_MovementEvent(m_akDamageInformation[I].iShip, -1, 5.00);
						}
					}
				}
			}
		}
	}
}
function UpdateAmmoIndicator(XGShip kShip)
{
	local string strPrimaryAmmo, strSecondaryAmmo, strAmmo;
	local int iPrimaryAmmo, iSecondaryAmmo;

	iPrimaryAmmo = class'SU_Utils'.static.GetAmmo(kShip, 0);
	iSecondaryAmmo = class'SU_Utils'.static.GetAmmo(kShip, 1);
	if(kShip.m_afWeaponCooldown[0] > 100)
	{
		strPrimaryAmmo = "";
	}
	else
	{
		strPrimaryAmmo = class'UIUtilities'.static.GetHTMLColoredText(iPrimaryAmmo >= 0 ? string(iPrimaryAmmo) : "oo", iPrimaryAmmo == 0 ? eUIState_Bad : eUIState_Normal);
	}
	if(kShip.m_afWeaponCooldown[1] > 100)
	{
		strSecondaryAmmo = "";
	}
	else
	{
		strSecondaryAmmo = class'UIUtilities'.static.GetHTMLColoredText(iSecondaryAmmo >=0 ? string(iSecondaryAmmo) : "oo", iSecondaryAmmo == 0 ? eUIState_Bad : eUIState_Normal);
	}
	strAmmo = strPrimaryAmmo;
	if(strAmmo != "" && strSecondaryAmmo != "")
	{
		strAmmo @= "|" @ strSecondaryAmmo;
	}
	else if(strSecondaryAmmo != "")
	{
		strAmmo = strSecondaryAmmo;
	}
	AS_SetAmmoText(kShip, "<p align='right'>"$ strAmmo $"</p>");
}
function bool AnyInterceptorsChasing()
{
	local XGShip_Interceptor kShip;
	local bool bRetVal;

	foreach m_kXGInterception.m_arrInterceptors(kShip)
	{
		if(kShip.m_kTShip.iRange < 3 && kShip.GetHP() > 0)
		{
			bRetVal=true;
		}
	}
	return bRetVal;
}
//FIXME Consider extending the timer to show more digits
simulated function UpdateEnemyEscapeTimer(float fDeltaT)
{
    local int iCurrTenthsOfSeconds;
	local string strTrackingLabel, strDodgingLabel, strDisplayLabel;
	local float fDodgingTimer;

	if(IsTimerActive('DisableDodgeEffect', class'SU_Utils'.static.GetSquadronMod().m_kTickMutator))
	{  
		fDodgingTimer = GetRemainingTimeForTimer('DisableDodgeEffect', class'SU_Utils'.static.GetSquadronMod().m_kTickMutator);
	}
	if(m_fTrackingTimer > 0.0)
    {
        m_fTrackingTimer -= fDeltaT;
		strTrackingLabel = (m_strTrackingText $ "\n") $ Left(string(m_fTrackingTimer), InStr(string(m_fTrackingTimer), ".") + 2);
        if(m_fTrackingTimer <= 0.0)
        {
            m_fTrackingTimer = 0.0;
            m_fEnemyEscapeTimer = m_kMgr.m_kInterceptionEngagement.GetTimeUntilOutrun(1) - m_fPlaybackTimeElapsed;//note: GetTimeUntilOutrun accounts for tracking so this is OK
            AS_DisplayEffectEvent(2, GetAbilityDescription(2), false);
            strTrackingLabel = "";
        }
    }
	if(fDodgingTimer > 0.0)
	{
		strDodgingLabel = class'UIUtilities'.static.GetHTMLColoredText(m_strDodgeAbility $ ":" @ Left(string(fDodgingTimer), InStr(string(fDodgingTimer), ".") + 2), eUIState_Normal);
		if(strTrackingLabel != "")
		{
			strDodgingLabel = "\n\n" $ strDodgingLabel;
		}
	}
	strDisplayLabel = strTrackingLabel $ strDodgingLabel;
    AS_SetTrackingLabel(strDisplayLabel);
	if(m_fTrackingTimer > 0.0)
	{
		return;
	}
    m_fEnemyEscapeTimer -= fDeltaT;
    m_kMgr.SFXEnemyEscapeTimerUpdated(m_fEnemyEscapeTimer);
    if((m_fEnemyEscapeTimer < 0.10) && m_fEnemyEscapeTimer > float(0))
    {
        if(m_fEnemyEscapeTimer < 0.050)
        {
            iCurrTenthsOfSeconds = 0;
        }
        else
        {
            iCurrTenthsOfSeconds = 1;
        }
    }
    else
    {
        iCurrTenthsOfSeconds = int(m_fEnemyEscapeTimer * float(10));
    }
    if(iCurrTenthsOfSeconds != m_iTenthsOfSecondCounter)
    {
        m_iTenthsOfSecondCounter = iCurrTenthsOfSeconds;
        AS_SetEnemyEscapeTimer(m_iTenthsOfSecondCounter);
    }
}

simulated function ShowResultScreen()
{
	local int I, battleResult;
	local string strDescription, strReport;
	local float fHealthPercent;
	local XGParamTag kTag;
	local array<XGShip_Interceptor> arrJets;
	local SU_Pilot kPilot;

	m_bViewingResults = true;
	arrJets = m_kXGInterception.m_arrInterceptors;
	if(m_kMgr.m_kInterceptionEngagement.m_kInterception.m_eUFOResult == eUR_Disengaged)
	{
		AS_SetAbortLabel(m_strAbortedMission);
	}
	SetConsumablesState(2);
	kTag = XGParamTag(XComEngine(class'Engine'.static.GetEngine()).LocalizeContext.FindTag("XGParam"));
	
	//determine name of ship: Interceptor or Firestorm
	kTag.StrValue0 = arrJets[m_kMgr.m_kInterceptionEngagement.m_iUFOTarget - 1].m_kTShip.strName;
	
	//build first row of the report: "Interceptor destroyed / shot down .... etc." depending on result
	switch(m_kMgr.m_kInterceptionEngagement.m_kInterception.m_eUFOResult)
	{
		case 1:
			battleResult = 1;
			strDescription = class'XComLocalizer'.static.ExpandString(m_strResult_UFOCrashed);
			break;
		case 2:
			battleResult = 1;
			strDescription = class'XComLocalizer'.static.ExpandString(m_strResult_UFODestroyed);
			break;
		case 3:
			battleResult = 0;
			strDescription = class'XComLocalizer'.static.ExpandString(m_strResult_UFOEscaped);
			break;
		case 4:
			battleResult = 2;
			strDescription = class'XComLocalizer'.static.ExpandString(m_strResult_UFODisengaged);
			break;
		default:
	}
	for(I=0; I < arrJets.Length; ++I)
	{
		kPilot = class'SU_Utils'.static.GetPilot(arrJets[I]);
		kTag = XGParamTag(XComEngine(class'Engine'.static.GetEngine()).LocalizeContext.FindTag("XGParam"));
		//determine name of ship: Interceptor or Firestorm
		kTag.StrValue0 = arrJets[I].m_kTShip.strName;
		fHealthPercent = arrJets[I].GetHPPct();
		if(fHealthPercent <= 0.0)
		{
			battleResult = 3;
			strReport = class'XComLocalizer'.static.ExpandString(m_strReport_ShotDown);
			switch(kPilot.GetStatus())
			{
			case ePilotStatus_Dead:
				strReport = strReport @ m_strPilotKilled;
				break;
			case ePilotStatus_Wounded:
				strReport = strReport @ m_strPilotWounded;
				break;
			default:
				strReport = strReport @ m_strPilotSurvived;
			}
		}
		else if(fHealthPercent < 0.330)
		{
			strReport = class'XComLocalizer'.static.ExpandString(m_strReport_SevereDamage);
		}
		else if(fHealthPercent < 0.660)
		{
			strReport = class'XComLocalizer'.static.ExpandString(m_strReport_HeavyDamage);
		}
		else if(fHealthPercent < 1.0)
		{
			strReport = class'XComLocalizer'.static.ExpandString(m_strReport_LightDamage);
		}
		else
		{
			strReport = class'XComLocalizer'.static.ExpandString(m_strReport_NoDamage);
		}
		AS_SetResultsTitleLabels(m_strReport_Title, kPilot.GetCallsignWithRank(false,true) @ (kPilot.GetStatus() == ePilotStatus_Dead ? "" : "(+" $ kPilot.m_iLastBattleXP @ Repl(class'SU_UIPilotRoster'.default.m_strXP, ":","") $")"));
		//if it's time to show report for the jet...
		if(I == m_iResultScreenIterator)
		{
			//if the jet has not been destroyed (battleResult !=3)
			if(battleResult != 3)
			{
				//check if promotion is imminent
				if(!kPilot.IsAtMaxRank() && kPilot.QualifiesForRank(kPilot.GetRank() + 1))
				{
					//cache callsign before promotion...
					kTag.StrValue0 = kPilot.GetCallsignWithRank(false,true);
					//promotion is valid so grab new rank name and squadron size...
					kTag.StrValue1 = class'SU_Utils'.static.GetRankMgr().GetFullRankName(kPilot.GetRank()+1) @ class'SU_Utils'.static.GetRankMgr().GetCareerPathName(kPilot.GetCareerType());
					kTag.IntValue0 = class'SU_Utils'.static.GetSquadronSizeAtRank(kPilot.GetRank()+1, kPilot.GetCareerType());
					
					//and expand the report with "Congratulations!..."
					strReport = (class'XComLocalizer'.static.ExpandString(m_strPilotPromoted) @ "\n") @ strReport;	

					//show the expanded report
					AS_ShowResults((strReport $ "\n") $ strDescription, battleResult, m_strLeaveReportButtonLabel);
					class'SU_Utils'.static.GetSquadronMod().m_kPilotQuarters.m_bRequiresAttention = true;
					GetMgr().HANGAR().m_bRequiresAttention = true;
					if(kPilot.GetCareerPath().arrTRanks[kPilot.GetRank()+1].iTraitType != 0)
					{
						OnNewTraitGained(kPilot);
					}
				}
				else
				//no promotion
				{
					//show report informing only of result and jet's status
					AS_ShowResults((strDescription $ "\n") $ strReport, battleResult, m_strLeaveReportButtonLabel);
				}
			}
			else if(m_kXGInterception.m_eUFOResult >= 3)
			{
				//UFO is not downed so only show report informing of result and jet's status
				AS_ShowResults((strDescription $ "\n") $ strReport, battleResult, m_strLeaveReportButtonLabel);
				break;
			}
			//check if jet has disengaged
			else if(arrJets[I].m_kTShip.iRange == 3)
			{
				//if so, then grab ship type...
				kTag.StrValue0 = arrJets[I].m_kTShip.strName;
						
				//and expand report with 'disengaged' info
				strDescription = class'XComLocalizer'.static.ExpandString(m_strResult_UFODisengaged);
						
				//show report
				AS_ShowResults((strDescription $ "\n") $ strReport, battleResult, m_strLeaveReportButtonLabel);
			}
			else
			{
				//only inform of jet's health status
				AS_ShowResults(strReport, battleResult, m_strLeaveReportButtonLabel);
			}
			break;//stop iterating
		}    
	}
}
function UpdateUFOTarget(optional bool bOnInit)
{
	local int iShipID, iScore, iHighestScore;
	local array<int> arrScores;
	local XGShip_Interceptor kShip;

	//bits 1-6 (lowest priority)- hold Rand(63) factor
	//bit  7                    - holds IsCurrentTarget flag (0/1)
	//bits 8-21                 - hold current dmg (0-16383)
	//bits 22-28                - hold Aggro stat (0-127)
	//bit  29 (highest priority)- holds m_bClosedIn (short distance) flag (0/1)
	arrScores.Add(m_kXGInterception.m_arrInterceptors.Length);
	for(iShipID=0; iShipID < m_kXGInterception.m_arrInterceptors.Length; ++iShipID)
	{
		kShip = m_kXGInterception.m_arrInterceptors[iShipID];
		iScore = 0;
		if(kShip.m_kTShip.iRange == 3)
		{
			iScore = -1;
		}
		else
		{
			if(SelfGfx().GetShip(kShip).m_bClosedIn)
			{
				iScore += 1 << 28;
			}
			iScore += Min(127, class'SU_Utils'.static.GetAggroForShip(kShip, XGShip_UFO(m_kMgr.m_kInterceptionEngagement.GetShip(0)))) << 21;
			iScore += Min(16383, (kShip.GetHullStrength() - kShip.m_iHP)) << 7;
			if( (iShipID + 1) == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget)
			{
				iScore += 1 << 6;
			}
			else
			{
				iScore += Rand(64);
			}
		}
		arrScores[iShipID] = iScore;
	}
	iHighestScore = -1;
	foreach arrScores(iScore)
	{
		iHighestScore = Max(iScore, iHighestScore);
	}
	iShipID = arrScores.Find(iHighestScore);
	if(iHighestScore != -1 && m_kMgr.m_kInterceptionEngagement.m_iUFOTarget != iShipID + 1)
	{
		m_kMgr.m_kInterceptionEngagement.m_iUFOTarget = iShipID + 1;
		AS_SetUFOTarget(m_kXGInterception.m_arrInterceptors[iShipID]);
	}

	//old code from TryAbort (in case I want to look at it later)
		//AS_ShowEstablishingLinkLabel(kUFOTarget.m_strCallsign $ "\n" $ class'UIUtilities'.static.GetHTMLColoredText(kUFOTarget.GetWeaponString() @ ("(" $ (class'SquadronUnleashed'.static.StanceToString(kUFOTarget) $ ")")), (kUFOTarget.m_iHoursDown > 0 ? DAMAGED_BATTLE_COLOR_ID : GOOD_BATTLE_COLOR_ID), LEADER_BATTLE_FONTSIZE));
        //if(m_kMgr.m_kInterceptionEngagement.GetShip(0).GetType() >= 10)
        //{
        //    AS_InitializeData(kUFOTarget.GetType(), m_kMgr.m_kInterceptionEngagement.GetShip(0).GetType() - 6, m_strPlayerDamageLabel, (kUFOTarget.m_strCallsign $ "\n") $ class'UIUtilities'.static.GetHTMLColoredText(kUFOTarget.GetWeaponString() @ ("(" $ (class'SquadronUnleashed'.static.StanceToString(kUFOTarget) $ ")")), ((kUFOTarget.m_iHoursDown > 0) ? DAMAGED_BATTLE_COLOR_ID : GOOD_BATTLE_COLOR_ID), LEADER_BATTLE_FONTSIZE));
        //}
        //else
        //{
        //    AS_InitializeData(kUFOTarget.GetType(), m_kMgr.m_kInterceptionEngagement.GetShip(0).GetType(), m_strPlayerDamageLabel, (kUFOTarget.m_strCallsign $ "\n") $ class'UIUtilities'.static.GetHTMLColoredText(kUFOTarget.GetWeaponString() @ ("(" $ (class'SquadronUnleashed'.static.StanceToString(kUFOTarget) $ ")")), ((kUFOTarget.m_iHoursDown > 0) ? DAMAGED_BATTLE_COLOR_ID : GOOD_BATTLE_COLOR_ID), LEADER_BATTLE_FONTSIZE));
        //}

        //disable active dodge and aim modules
        //FIXME, consider rework to make it persist
		//m_kMgr.m_kInterceptionEngagement.m_aiConsumableQuantitiesInEffect[0] = 0;
        //m_kMgr.m_kInterceptionEngagement.m_aiConsumableQuantitiesInEffect[2] = 0;
        //AS_DisplayEffectEvent(0, GetAbilityDescription(0), false);
        //AS_DisplayEffectEvent(1, GetAbilityDescription(1), false);
            
		//update available modules based on new leader's stance
        //SetConsumablesState(0);

		//initialize new hull strength of leader
        //AS_SetHP(1, kUFOTarget.GetHullStrength(), true);
            
        //and his current HP
        //AS_SetHP(1, kUFOTarget.m_iHP, false);
            
        //update status report of the fleet
        //AS_DisplayEffectEvent(3, SU_XGInterceptionEngagement(m_kMgr.m_kInterceptionEngagement).GetSquadronStatusBrief(), false);
}
simulated function TryAbort()
{
	local array<XGShip_Interceptor> arrJets;
	local XGShip_Interceptor kUFOTarget;
	local int iShipID;
	
	arrJets = m_kXGInterception.m_arrInterceptors;
	iShipID = m_kMgr.m_kInterceptionEngagement.m_iUFOTarget;
	kUFOTarget = arrJets[iShipID - 1];
	`Log(GetFuncName() @ kUFOTarget @ "("$kUFOTarget.m_strCallsign$")", class'SquadronUnleashed'.default.bVerboseLog);
	
	if(!m_bPendingDisengage && !m_bViewingResults && m_bIntroSequenceComplete)
    {
        class'UIModUtils'.static.ObjectMultiplyColor(SelfGfx().GetShip(kUFOTarget),1,1,1,0.40);
		AS_MovementEvent(iShipID, -1, 5.00);
    	kUFOTarget.m_kTShip.iRange = 3; //mark aborting ship 'out of combat'
		UpdateUFOTarget(); //order UFO to pick new target
		m_iSelectedShipGfx = m_arrShipGfxOrder.Find(m_kMgr.m_kInterceptionEngagement.m_iUFOTarget);
		RealizeSelected();
    }
	if(!AnyInterceptorsChasing())
	{
        //if no more ships in fight, finish the battle
		`Log("No more jets available. Mission aborting...", class'SquadronUnleashed'.default.bVerboseLog);
        m_kMgr.Abort();
        AS_SetAbortLabel(m_strAbortingMission);
        Invoke("AbortAttempted");
        m_bPendingDisengage = true;
    }
}
simulated function string GetAbilityDescription(UIInterceptionEngagement.eDisplayEffectType Type)
{
    //status bars are right-aligned, but description should be centered
	return "<p align=\"center\">" $ (m_strAbilityDescriptions[Type] $ "</p>");  
}

function AS_SetTrackingLabel(string txt)
{
    manager.ActionScriptVoid(string(GetMCPath()) $ ".SetTrackingLabel");   
}

function GoToView(int iView)
{
	local SU_HelpManager kHelpMgr;

    m_iView = iView;
    if(m_iView == 1)
    {
    	//set iterator of report screens to 0 (report for first jet)
    	m_iResultScreenIterator = 0;
        ShowResultScreen();
		kHelpMgr = class'SU_Utils'.static.GetHelpMgr();
		kHelpMgr.QueueHelpMsg(eSUHelp_CombatXP, 0.50);
		SetTimer(0.50, false, 'Pause');
    }
}
function Pause()
{
	controllerRef.SetPause(true);
}
function UnPause()
{
	controllerRef.SetPause(false);
}
function int GetShipType(XGShip kShip)
{
	return kShip.GetType() - 6 * int(kShip.GetType() > 9);
}
function bool ShouldAutoApproach(XGShip kShip, optional bool bInitial=true)
{
	local bool bAutoClose;
	local int iStance;

	iStance = class'SU_Utils'.static.GetStance(kShip);
	if(iStance > 2)
	{
		return false;
	}
	else if(XGShip_Interceptor(kShip) != none)
	{
		bAutoClose = bInitial && class'SU_Utils'.static.GetPilot(XGShip_Interceptor(kShip)).m_bStartBattleClose;
	}
	//if ship has only short range weapons it should auto approach:
	if(!bAutoClose && HasOnlyShortRangeWeapons(kShip))
	{
		bAutoClose = bInitial || class'SU_Utils'.static.GetStance(kShip) != 2;//force at start of battle but later only for BAL and AGG
	}
	`Log(GetFuncName() @ XGShip_Interceptor(kShip).m_strCallsign @ bAutoClose, bInitial && class'SquadronUnleashed'.default.bVerboseLog, 'SquadronUnleashed');

	return bAutoClose;
}

function bool HasOnlyShortRangeWeapons(XGShip kShip)
{
	local bool bPrimaryCheck, bSecondaryCheck;

	bPrimaryCheck = class'SU_Utils'.static.IsShortDistanceWeapon(kShip.m_kTShip.arrWeapons[0]) || kShip.m_afWeaponCooldown[0] > 100.0 || class'SU_Utils'.static.GetAmmo(kShip, 0) == 0;
	bSecondaryCheck = class'SU_Utils'.static.IsShortDistanceWeapon(kShip.m_kTShip.arrWeapons[1]) || kShip.m_afWeaponCooldown[1] > 100.0 || class'SU_Utils'.static.GetAmmo(kShip, 1) == 0;
	
	return bPrimaryCheck && bSecondaryCheck;
}
function OnNewTraitGained(SU_Pilot kPilot)
{
	local TDialogueBoxData tData;
	local int iNewRank, iTrait;

	iNewRank = kPilot.GetRank() + 1;
	iTrait = kPilot.GetCareerPath().arrTRanks[iNewRank].iTraitType;
	if(iTrait != 0)
	{
		tData.strTitle = kPilot.GetCallsign() @ "GAINS NEW TRAIT!";
		tData.strText = "'"$class'SU_Utils'.static.GetRankMgr().m_arrTraitNames[iTrait] $"'\n"$class'UIUtilities'.static.GetHTMLColoredText(kPilot.TraitBuffsToString(iTrait), eUIState_Highlight) $ (kPilot.TraitReqsToString(iTrait) != "" ? "\n\n"$class'SU_UIPilotCard'.default.m_strLabelTraitRestrictions$"\n"$ class'UIUtilities'.static.GetHTMLColoredText(kPilot.TraitReqsToString(iTrait), eUIState_Highlight) : "");
		if(kPilot.m_iCareerTrait != 0)
		{
			tData.strText $= "\n\n" $ class'UIUtilities'.static.GetHTMLColoredText("New trait replaces the current trait: '"$ class'SU_Utils'.static.GetRankMgr().m_arrTraitNames[kPilot.m_iCareerTrait]$"'", eUIState_Warning);
		}
		tData.strAccept = class'UIDialogueBox'.default.strAccept;
		controllerRef.m_Pres.UIRaiseDialog(tData);
	}
}
simulated function bool OnMouseEvent(int Cmd, array<string> args)
{
    local string targetCallback;
	local bool bHandled;

    if(Cmd != 391)
    {
        return true;//ActionScript only sends out 391 so 392 (mouseOver) is implemented using UpdateMouseCursorSelection in Tick
    }
    targetCallback = args[args.Length - 1];
	if(targetCallback == "selectionBorder")
	{
		targetCallback = args[args.Length - 4];
		if(!SelfGfx().GetShip(targetCallback).m_bHasFocus)
		{
			m_iSelectedShipGfx = m_arrShipGfxOrder.Find(SU_XGInterceptionEngagement(m_kMgr.m_kInterceptionEngagement).ShipNameToShipID(targetCallback));
			AS_SelectShip(targetCallback);
		}
		else if(!SelfGfx().GetShip(targetCallback).m_bClosedIn)
		{
			SelfGfx().MovementEvent(targetCallback, 1, 1.0);
		}
		else
		{
			SelfGfx().MovementEvent(targetCallback, 0, 1.0);
		}
		bHandled = true;
	}
	if(!bHandled)
	{
		bHandled = super.OnMouseEvent(Cmd, args);
	}
	return bHandled;
}
simulated function bool OnUnrealCommand(int Cmd, int Arg)
{
    local bool bHandled;

    if(!CheckInputIsReleaseOrDirectionRepeat(Cmd, Arg))
    {
        return true;
    }
    bHandled = true;
	switch(Cmd)
	{
	case 500:
		OnDPadUp();
		break;
	case 501:
		OnDPadRight();
		break;
	case 502:
		OnDPadDown();
		break;
	case 503:
		OnDPadLeft();
		break;
	case 511:
		if(m_arrShipGfxOrder[m_iSelectedShipGfx] == m_kMgr.m_kInterceptionEngagement.m_iUFOTarget)
		{
			TryAbort();
		}
		else
		{
			m_kMgr.m_kInterceptionEngagement.GetShip(m_arrShipGfxOrder[m_iSelectedShipGfx]).m_kTShip.iRange = 3;
			AS_MovementEvent(m_arrShipGfxOrder[m_iSelectedShipGfx], -1, 5.0);
		}
		break;
	default:
		bHandled=false;
	}
	if(!bHandled)
	{
		bHandled = super.OnUnrealCommand(Cmd, Arg);
	}
	return bHandled;
}
function OnDPadLeft()
{
	AS_MovementEvent(m_arrShipGfxOrder[m_iSelectedShipGfx], 0, 1.0);
}
function OnDPadRight()
{
	AS_MovementEvent(m_arrShipGfxOrder[m_iSelectedShipGfx], 1, 1.0);
}
function OnDPadUp()
{
	local int iCurrentSelection;

	iCurrentSelection = m_iSelectedShipGfx;
	do
	{
		--m_iSelectedShipGfx;
		if(m_iSelectedShipGfx < 0)
		{
			m_iSelectedShipGfx = m_arrShipGfxOrder.Length - 1;
		}
		if(m_iSelectedShipGfx == iCurrentSelection)
		{
			break;
		}
	}
	until(m_kMgr.m_kInterceptionEngagement.GetShip(m_arrShipGfxOrder[m_iSelectedShipGfx]).m_kTShip.iRange < 3);
	RealizeSelected();
}
function OnDPadDown()
{
	local int iCurrentSelection;

	iCurrentSelection = m_iSelectedShipGfx;
	do
	{
		++m_iSelectedShipGfx;
		if(m_iSelectedShipGfx > m_arrShipGfxOrder.Length - 1)
		{
			m_iSelectedShipGfx = 0;
		}
		if(m_iSelectedShipGfx == iCurrentSelection)
		{
			break;
		}
	}
	until(m_kMgr.m_kInterceptionEngagement.GetShip(m_arrShipGfxOrder[m_iSelectedShipGfx]).m_kTShip.iRange < 3);
	RealizeSelected();
}
function RealizeSelected()
{
	AS_SelectShip(string(m_kMgr.m_kInterceptionEngagement.GetShip(m_arrShipGfxOrder[m_iSelectedShipGfx])));
}
function AS_SelectShip(coerce string strShipObjectName)
{
	SelfGfx().SetShipFocus(strShipObjectName);
}
function AS_SetUFOTarget(coerce string strShipObjectName)
{
	SelfGfx().SetUFOTarget(strShipObjectName);
}
function AS_SetLeaderFlag(coerce string strShipObjectName)
{
	SelfGfx().SetLeaderFlag(strShipObjectName);
}
function SUGfx_IntercetpionEngagement SelfGfx()
{
	return SUGfx_IntercetpionEngagement(manager.GetVariableObject(string(GetMCPath()), class'SUGfx_IntercetpionEngagement'));
}
function AS_ShowEstablishingLinkLabel(string strLabel)
{
	local UIModGfxTextField gfxLabel;

	gfxLabel = UIModGfxTextField(SelfGfx().GetObject("establishingLinkPanel").GetObject("txtField", class'UIModGfxTextField'));
	gfxLabel.m_sTextAlign="center";
	gfxLabel.m_sFontFace = "$TitleFont";
	gfxLabel.m_FontSize = 48;
	gfxLabel.SetHTMLText(strLabel);
}
function AS_SetHP(int targetShip, int newHP, bool initialization, optional int weaponID=-1)
{
	if(m_DataInitialized)
	{
		//after initialization we want pass ship's name to our custom .SetShipHP
		SelfGfx().SetShipHP(string(m_kMgr.m_kInterceptionEngagement.GetShip(targetShip)), newHP, initialization, weaponID);
	}
	else if(targetShip < 2)
	{
		//before initialization we want 0 and 1 be passed to original .SetHP, to init "template" ships
		manager.ActionScriptVoid(GetMCPath() $ ".SetHP");
	}
}
function AS_AttackEvent(int sourceShip, int targetShip, int WeaponType, int weaponID, int Damage, float attackDuration, bool Hit)
{
	local XGShip kAttacker, kTarget;

	if(WeaponType == 0)
	{
		WeaponType = eShipWeapon_Cannon;
	}
	kAttacker = m_kMgr.m_kInterceptionEngagement.GetShip(sourceShip);
	kTarget = m_kMgr.m_kInterceptionEngagement.GetShip(targetShip);
	SelfGfx().AttackEvent(string(kAttacker), string(kTarget), WeaponType, weaponID, Damage, attackDuration, Hit);
}
/** @param sourceShip Ship's index; 0 for UFO, or m_arrInterceptors' idx + 1 for xcom ships
 *  @param moveType 0 - back to starting position, 1 - close-in, -1 -disengage
 *  @param moveDuration Move animation time
 */
function AS_MovementEvent(int sourceShip, int moveType, float moveDuration)
{
	if(m_arrOutOfBattle.Find(sourceShip) >= 0 || m_arrMoveTimers[sourceShip] > 0.0)
	{
		return;
	}
	`Log(GetFuncName() @ "ship" @ sourceShip @ "type" @ moveType, class'SquadronUnleashed'.default.bVerboseLog);
	if(moveType == 1 && !m_bPendingDisengage && m_kXGInterception.m_eUFOResult == 0)
	{
		m_kMgr.PRES().UINarrative(m_kMgr.PRES().m_kNarrative.m_arrNarrativeMoments[158]);
	}
	if(moveType == -1)
	{
		if(m_arrOutOfBattle.Find(sourceShip) < 0)
			m_arrOutOfBattle.AddItem(sourceShip);
	}
	else
	{
		m_arrMoveTimers[sourceShip] = moveDuration;
	}
	SelfGfx().MovementEvent(m_kMgr.m_kInterceptionEngagement.GetShip(sourceShip), moveType, moveDuration);
}
function AS_SetShipType(int targetShip, int Type)
{
	SelfGfx().GetShip(m_kMgr.m_kInterceptionEngagement.GetShip(targetShip)).AS_SetShipType(Type - 6 * int(Type >9));
}
function AS_DisplayEffectEvent(int effectType, string effectDescription, optional bool Enabled=true, optional int effectData=-1)
{
	if(m_DataInitialized)
	{
		AS_SetPlayerShip(m_kMgr.m_kInterceptionEngagement.GetShip(m_kMgr.m_kInterceptionEngagement.m_iUFOTarget));
	}
	manager.ActionScriptVoid(string(GetMCPath()) $ ".DisplayEffectEvent");
	SelfGfx().SetPlayerShip("playerShip");//set back to the template
}
function AS_SetPlayerShip(XGShip kShip)
{
	SelfGfx().SetPlayerShip(kShip);
}
function AS_SetAlienShip(XGShip kShip)
{
	SelfGfx().SetAlienShip(kShip);
}
function AS_SetAmmoText(XGShip kShip, string sNewTxt)
{
	SelfGfx().GetShip(kShip).SetAmmoText(sNewTxt);
}
function AS_SetResultsTitleLabels(string Title, string subtitle)
{
	UIModGfxTextField(SelfGfx().GetObject("resultsPanel").GetObject("titleField", class'UIModGfxTextField')).m_FontSize = 25;
	UIModGfxTextField(SelfGfx().GetObject("resultsPanel").GetObject("titleField", class'UIModGfxTextField')).m_sTextAlign = "center";
	UIModGfxTextField(SelfGfx().GetObject("resultsPanel").GetObject("titleField", class'UIModGfxTextField')).m_sFontFace = "$TitleFont";
	UIModGfxTextField(SelfGfx().GetObject("resultsPanel").GetObject("subtitleField", class'UIModGfxTextField')).m_FontSize = 40;
	UIModGfxTextField(SelfGfx().GetObject("resultsPanel").GetObject("subtitleField", class'UIModGfxTextField')).m_sFontFace = "$TitleFont";
	UIModGfxTextField(SelfGfx().GetObject("resultsPanel").GetObject("subtitleField", class'UIModGfxTextField')).m_sTextAlign = "center";

	UIModGfxTextField(SelfGfx().GetObject("resultsPanel").GetObject("titleField", class'UIModGfxTextField')).SetHTMLText(Title);
	UIModGfxTextField(SelfGfx().GetObject("resultsPanel").GetObject("subtitleField", class'UIModGfxTextField')).SetHTMLText(subtitle);
}
function AS_ShowResults(string report, int battleResult, string leaveReportButtonLabel)
{
	super.AS_ShowResults(report, battleResult, leaveReportButtonLabel);
	SelfGfx().GetObject("resultsPanel").GetObject("report").SetString("htmlText", report);
}
defaultproperties
{
	m_fMouseUpdateStepSq=10.0   //distance in pixels by which a mouse cursor must move to trigger UpdateMouseCursorSelection
}