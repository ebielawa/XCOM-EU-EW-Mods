class SU_XGInterceptionEngagementUI extends XGInterceptionEngagementUI;

function PostInit(XGInterception kXGInterception)
{
    m_kInterceptionEngagement = Spawn(class'SU_XGInterceptionEngagement');
    m_kInterceptionEngagement.Init(kXGInterception);
    Narrative(XComNarrativeMoment(DynamicLoadObject("NarrativeMoment.InterceptorEnemySighted", class'XComNarrativeMoment')));
    //m_kInterceptionEngagement.GetCombat();//FIXME 
    //if(!IsShortDistanceWeapon(SHIPWEAPON(m_kInterceptionEngagement.m_kInterception.m_arrInterceptors[0].GetWeapon()).eType))
    //{
    //}
    m_kInterceptionEngagement.m_kInterception.m_kUFOTarget.m_bWasEngaged = true;
    GEOSCAPE().UpdateSound();
}
function OnEngagementOver()
{
	WorldInfo.Game.SetGameSpeed(1.0);
	DeterminePilotStatus();
	super.OnEngagementOver();//this triggers ShowResultScreen
}
function DeterminePilotStatus()
{
	local SU_Pilot kPilot;
	local XGShip_Interceptor kJet;

	foreach m_kInterceptionEngagement.m_kInterception.m_arrInterceptors(kJet)
	{
		kPilot = class'SU_Utils'.static.GetPilot(kJet);
		if(kJet.GetHP() <= 0)
		{
			if(kPilot.GetSurvivalChancePct() < FRand())
			{
				kPilot.m_iStatus = ePilotStatus_Dead;
			}
			else if(class'SquadronUnleashed'.default.PILOT_WOUND_CHANCE_ON_SHOTDOWN > Rand(100))
			{
				kPilot.m_iStatus = ePilotStatus_Wounded;
				kPilot.m_iHoursUnavailable = 24 * class'SquadronUnleashed'.default.PILOT_HEAL_DAYS + class'SquadronUnleashed'.default.PILOT_TRANSFER_HOURS;
			}
			else
			{
				kPilot.m_iStatus = ePilotStatus_InTransfer;
				kPilot.m_iHoursUnavailable = class'SquadronUnleashed'.default.PILOT_TRANSFER_HOURS;
			}
		}
		else
		{
			kPilot.m_iStatus = ePilotStatus_Recovering;
			kPilot.m_iHoursUnavailable = class'SquadronUnleashed'.default.PILOT_RECOVER_AFTER_COMBAT_HOURS;
			if(kPilot.m_iHoursUnavailable == 1 && GEOSCAPE().m_kDateTime.GetMinute() > 20)
			{
				++kPilot.m_iHoursUnavailable;
			}
		}
		if(kPilot.GetStatus() != ePilotStatus_Dead)
		{
			GrantXP(kPilot);
		}
		`Log(GetFuncName() @ kPilot.GetCallsign() @ "status after combat" @ kPilot.GetStatusString(), class'SquadronUnleashed'.default.bVerboseLog, 'SquadronUnleashed');
	}
}
function GrantXP(SU_Pilot kPilot)
{
    local SU_UIInterceptionEngagement kInterface;
	local int iNewXP;

	kInterface = SU_UIInterceptionEngagement(m_kInterface);
	iNewXP += class'SU_PilotRankMgr'.default.XP_PER_ENGAGMEMENT_SECOND * kInterface.m_fPlaybackTimeElapsed;
	if(m_kInterceptionEngagement.m_kInterception.m_eUFOResult == eUR_Crash || m_kInterceptionEngagement.m_kInterception.m_eUFOResult == eUR_Destroyed)
	{
		iNewXP += class'SU_PilotRankMgr'.default.XP_FOR_WIN;
	}
	if(kPilot.GetShip() == m_kInterceptionEngagement.GetShip(kInterface.m_iKillerShipIndex))
	{
		iNewXP += class'SU_PilotRankMgr'.default.XP_FOR_KILL_SHOT;
		kPilot.m_iKills++;
		kPilot.UpdateShipConfirmedKills();
	}
	kPilot.m_fTotalDogfightTime += kInterface.m_fPlaybackTimeElapsed;
	kPilot.m_iNumDogfights++;
	kPilot.m_iXP += iNewXP;
	kPilot.m_iLastBattleXP += iNewXP;
}
function OnResultLeave()
{
    local SU_UIInterceptionEngagement kInterface;
	local XGInterception kInterception; 
	local array<XGShip_Interceptor> arrJets;

	WorldInfo.Game.SetGameSpeed(1.0);
	kInterception = m_kInterceptionEngagement.m_kInterception;
	arrJets = kInterception.m_arrInterceptors;
	kInterface = SU_UIInterceptionEngagement(m_kInterface);
	//increase the index of result screen shown
	++ kInterface.m_iResultScreenIterator;

    //check if there are more ships to show result screen for
	if(kInterface.m_iResultScreenIterator < arrJets.Length)
    {
        kInterface.ShowResultScreen();
        return;
    }
    //move the ship that delivered killing blow to position 0 in m_arrInterceptors
	//as it will be grabbed from there in CompleteEngagement() to determine loot based on its weapon
    arrJets.InsertItem(0, arrJets[kInterface.m_iKillerShipIndex - 1]);
    arrJets.Remove(kInterface.m_iKillerShipIndex, 1);
	m_kInterceptionEngagement.m_kInterception.m_arrInterceptors = arrJets;
    
    //tell presentation layer to leave state 'InterceptionEngagement'
    PRES().PopState();

	//if not UFOCrashed...
    if(kInterception.m_eUFOResult != eUR_Crash)
    {        
    	//if any jet is returning home...
    	if(arrJets.Length > 0)
    	{
			//focus on the jets' base
    		PRES().CAMLookAtEarth(arrJets[0].GetHomeCoords());
    	}
		else
		{
    		//else focus geoscape on HQ
    		PRES().CAMLookAtEarth(XComHeadquartersGame(class'Engine'.static.GetCurrentWorldInfo().Game).GetGameCore().GetHQ().GetCoords());
		}
    }
	//determine loot, update pilot ranks and send jets home - namely complete engagement
    kInterception.CompleteEngagement();
    Sound().PlayMusic(1);
    m_kInterceptionEngagement.Destroy();
    PRES().GetCamera().ForceEarthViewImmediately();
    PRES().m_kUIMissionControl.UpdateButtonHelp(); 
}
