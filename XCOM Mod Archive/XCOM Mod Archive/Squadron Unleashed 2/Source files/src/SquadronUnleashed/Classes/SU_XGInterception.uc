class SU_XGInterception extends XGInterception
config(SquadronUnleashed);

var int m_iSquadronGeoSpeed;
var int m_iSquadronSize;
var int m_iSquadronAimBonus;
var int m_iSquadronDefBonus;
var SwfMovie m_kInterceptionMovie;
var SU_Pilot m_kSquadronLeader;

function string EscapeTimeToString()
{
	local XGShip_Interceptor kInterceptor;
	local float fUFOSpeed, fTimeUntilOutrun;
	local int iSlowestInterceptorSpeed;
	local string strTime;

	iSlowestInterceptorSpeed = 9999;
    foreach m_arrInterceptors(kInterceptor)
    {
         iSlowestInterceptorSpeed = Min(iSlowestInterceptorSpeed, int(float(kInterceptor.m_kTShip.iEngagementSpeed) * (kInterceptor.m_iHoursDown == 0 ? 1.0 : class'SquadronUnleashed'.default.DAMAGED_SPEED_PENALTY)));         
    }      
    fUFOSpeed = float(m_kUFOTarget.m_kTShip.iEngagementSpeed);
    if(class'SU_Utils'.static.GetStance(m_kUFOTarget) == 1)
    {
		fUFOSpeed *= class'SquadronUnleashed'.default.AGG_UFO_SPEED_DOWN;
    }
    if(class'SU_Utils'.static.GetStance(m_kUFOTarget) == 2)
    {
         fUFOSpeed *= class'SquadronUnleashed'.default.DEF_UFO_SPEED_BOOST;
    }
    if(fUFOSpeed != 0.0)
    {
		fTimeUntilOutrun = 30.0 * (float(iSlowestInterceptorSpeed) / fUFOSpeed);
    }
    else
    {
		fTimeUntilOutrun = float(iSlowestInterceptorSpeed);
    }
	fTimeUntilOutrun *= class'SquadronUnleashed'.default.GLOBAL_ENGAGEMENT_TIME_MULTIPLIER;
	if(m_kSquadronLeader != none)
	{
		if(m_kSquadronLeader.IsTraitActive())
			fTimeUntilOutrun += float(m_kSquadronLeader.GetCareerTrait().iBonusTime);
		if(m_kSquadronLeader.IsFirestormTraitActive())
			fTimeUntilOutrun += float(m_kSquadronLeader.GetFirestormTrait().iBonusTime);
	}
	strTime = Left(string(fTimeUntilOutrun), 2 + InStr(string(fTimeUntilOutrun), "."));
	return strTime;
}

function UpdateSquadronSize()
{
	local XGShip_Interceptor kJet;
	local int iRank;

	m_iSquadronSize = 1;
    foreach m_arrInterceptors(kJet)
    {
        iRank = class'SU_Utils'.static.GetPilotRank(kJet);
    	m_iSquadronSize = Max(m_iSquadronsize, class'SU_Utils'.static.GetSquadronSizeAtRank(iRank, class'SU_Utils'.static.GetPilot(kJet).GetCareerType()));
    }    
    m_iSquadronSize = Clamp(m_iSquadronSize, class'SquadronUnleashed'.default.MIN_SQUADRON_SIZE, class'SquadronUnleashed'.default.MAX_SQUADRON_SIZE);
}
function UpdateSquadronGeoSpeed()
{
	local XGShip_Interceptor kJet;

	m_iSquadronGeoSpeed = 9999;
    foreach m_arrInterceptors(kJet)
    {
        if(!kJet.IsDamaged())
        {
            m_iSquadronGeoSpeed = Min(m_iSquadronGeoSpeed, kJet.GetSpeed());
            continue;
        }
        m_iSquadronGeoSpeed = Min(m_iSquadronGeoSpeed, class'SquadronUnleashed'.default.DAMAGED_SPEED_PENALTY * float(kJet.GetSpeed()));        
    }
}
function UpdateSquadronTeamBonuses(optional bool bDuringCombat)
{

	m_iSquadronAimBonus = 0;
	m_iSquadronDefBonus = 0;
	if(bDuringCombat && m_kSquadronLeader != none && class'SU_Utils'.static.GetStance(m_kSquadronLeader.GetShip()) == 3)
	{
		return;
	}
	else if(!bDuringCombat)
	{
		UpdateSquadronLeader();
	}
	if(m_kSquadronLeader != none )
	{
		m_iSquadronAimBonus = class'SU_Utils'.static.GetRankTeamAimBonus( m_kSquadronLeader.GetRank(), m_kSquadronLeader.GetCareerType() );
		m_iSquadronDefBonus = class'SU_Utils'.static.GetRankTeamDefBonus( m_kSquadronLeader.GetRank(), m_kSquadronLeader.GetCareerType() );
		if(m_kSquadronLeader.IsTraitActive())
		{
			m_iSquadronAimBonus += m_kSquadronLeader.GetCareerTrait().iBonusTeamAim;
			m_iSquadronDefBonus += m_kSquadronLeader.GetCareerTrait().iBonusTeamDef;
		}
		if(m_kSquadronLeader.IsFirestormTraitActive())
		{
			m_iSquadronAimBonus += m_kSquadronLeader.GetFirestormTrait().iBonusTeamAim;
			m_iSquadronDefBonus += m_kSquadronLeader.GetFirestormTrait().iBonusTeamDef;
		}
	}
}
function UpdateSquadronLeader()
{
	local XGShip_Interceptor kJet;
	local SU_Pilot kPilot;

	m_kSquadronLeader = none;
	foreach m_arrInterceptors(kJet)
	{
		kPilot = class'SU_Utils'.static.GetPilot(kJet);
		if(kPilot.GivesTeamBuffs())
		{
			if(m_kSquadronLeader == none || kPilot.GivesBetterTeamBuffThan(m_kSquadronLeader))
			{
				m_kSquadronLeader = kPilot;
			}
		}
	}
}
function ToggleInterceptor(XGShip_Interceptor kInterceptor)
{
    local int iLastSquadronSize;
	
	//record current number of jets in squadron
	iLastSquadronSize = m_arrInterceptors.Length;

	//check if selected ship is refuelled and not in transfer
    if(kInterceptor.m_iStatus != 0 && kInterceptor.m_iStatus != 4)
    {
        Sound().PlaySFX(SNDLIB().SFX_UI_No);
        return;
    }
	else
	{
		Sound().PlaySFX(SNDLIB().SFX_UI_ToggleSelectContinent);
	}
    if(HasInterceptor(kInterceptor))
    {
        m_arrInterceptors.RemoveItem(kInterceptor);
		kInterceptor.m_kEngagement = none;
    }
    else
    {
        m_arrInterceptors.AddItem(kInterceptor);
		kInterceptor.m_kEngagement = self;
    }
	//recalculate max squadron size after toggling the jet in/out
    UpdateSquadronSize();
	//if new max squadron size is below current squadron size (including selected jet)
    if(m_arrInterceptors.Length > m_iSquadronSize)
    {
        //... if there is still only 1 ship allowed
    	if(iLastSquadronSize == 1)
        {
			//remove previously selected ship and replace it with the new one
        	m_arrInterceptors.Remove(0, 1);
        }
		else
		{
    		//otherwise adjust squadron size by cutting off ships from the end of list
			m_arrInterceptors.Length = m_iSquadronSize;
			PlaySound(Sound().SNDLIB().SFX_UI_No);
			class'SU_Utils'.static.GetHelpMgr().ShowErrorMsg(eSUError_PilotRankTooLow, 0.72);
		}
    }
	UpdateSquadronGeoSpeed();
	UpdateSquadronTeamBonuses();
}
function OnArrival()
{
	local XGShip_Interceptor kInterceptor;

	if(!CheckForGood())
	{
		foreach m_arrInterceptors(kInterceptor)
		{
			kInterceptor.ReturnToBase();
		}        
		GEOSCAPE().RemoveInterception(self);
		return;
	}
	//PRES().StartInterceptionEngagement(self);
	StartInterceptionEngagement();
}
function StartInterceptionEngagement()
{
	LogInternal(GetFuncName()@ "PRES().m_bHasRequestedInterceptionLoad=" $ PRES().m_bHasRequestedInterceptionLoad,'SquadronUnleashed');
	if(!PRES().m_bHasRequestedInterceptionLoad)
	{
		PRES().m_kXGInterception = self;
		m_kInterceptionMovie = PRES().m_kInterceptionMovie;//to keep it in memory
		PRES().m_kInterceptionMovie = none;//to cheat PRES (step 1)
		PRES().m_bHasRequestedInterceptionLoad = true;//to cheat PRES (step 2) - now it will loop infinitely in State_InterceptionEngagement, waiting for the movie
		InitEngagementUI();//instead we shall run the PRES stuff manually...
		PRES().PushState('State_InterceptionEngagement');//yes - we do push the state to keep the PRES states' stack in order
	}
}
function InitEngagementUI()
{
	LogInternal(GetFuncName(),'SquadronUnleashed');
	PRES().m_kInterceptionEngagement = PRES().Spawn(class'SU_UIInterceptionEngagement', PRES());
	PRES().Get3DMovie().LoadScreen(PRES().m_kInterceptionEngagement);
	PRES().Get3DMovie().ShowDisplay(class'UIInterceptionEngagement'.default.DisplayTag);
	PRES().CAMLookAtNamedLocation(class'UIInterceptionEngagement'.default.m_strCameraTag, 1.0);
	PRES().m_kInterceptionEngagement.Init(XComPlayerController(PRES().Owner), PRES().Get3DMovie(), self);
	GEOSCAPE().m_bGlobeHidden = true;
}

function CompleteEngagement()
{
    local int I;
	local XGShip_Interceptor kJet;
	local SU_Pilot kPilot;
	local string strDebug;

    if(m_eUFOResult == eUR_Crash)
    {
		strDebug $= ("\n"$Chr(9)$GetFuncName() @ "kufo=" @ m_kUFOTarget);
        ClearOtherEngagements(m_kUFOTarget);
		strDebug $= ("\n"$Chr(9)$"After ClearOtherEngagements kufo=" @ m_kUFOTarget);
		//determine loot based on killer's weapon; killer has already been moved to position 0 of the array for that purpose
        AI().OnUFOShotDown(m_arrInterceptors[0], m_kUFOTarget);
    }
    else if(m_eUFOResult == eUR_Destroyed)
	{
		AI().OnUFODestroyed(m_kUFOTarget);
		//this line is copied from Campaign Summary by 'tracktwo'; records killer ship
        GetRecapSaveData().RecordEvent(((((((GEOSCAPE().m_kDateTime.GetDateString() @ GEOSCAPE().m_kDateTime.GetTimeString()) @ ":") @ m_arrInterceptors[0].GetCallsign()) @ "destroyed a") @ string(m_kUFOTarget.GetType())) @ "over") @ Country(m_kUFOTarget.GetCountry()).GetName());
	}
    else
    {
		AI().OnUFOAttacked(m_kUFOTarget);
	}
	for(I = 0; I < m_arrInterceptors.Length; ++ I)
    {
		kJet = m_arrInterceptors[I];
		kPilot = class'SU_Utils'.static.GetPilot(kJet);

		strDebug $= ("\n"$Chr(9)$"Updating " @ kJet.m_strCallsign $ "'s rank.");
		kJet.m_strCallsign = class'SU_Utils'.static.GetPilot(kJet).GetCallsignWithRank(true);//'true' updates the rank
		strDebug $= ("\n"$Chr(9)$"Current rank: " @ kJet.m_strCallsign);

        if(kJet.GetHP() <= 0)
        {
            HANGAR().OnInterceptorDestroyed(kJet);
			if(kPilot.GetStatus() == ePilotStatus_Dead)
			{
				class'SU_Utils'.static.GetSquadronMod().m_kPilotQuarters.RemovePilot(class'SU_Utils'.static.GetPilot(kJet));
			}
        }
        else
        {
            //reset default stance to BAL
            kJet.m_kTShip.iRange = 0;
			kJet.m_kTShip.iSpeed = ITEMTREE().m_arrShips[kJet.m_kTShip.eType].iSpeed * (kJet.IsDamaged() ? class'SquadronUnleashed'.default.DAMAGED_SPEED_PENALTY : 1.0);
            //send jet home
            kJet.ReturnToBase();
			//reset m_iLastBattleXP
			kPilot.m_iLastBattleXP = 0;
        }
    }
	`Log(strDebug, class'SquadronUnleashed'.default.bVerboseLog, GetFuncName());
    GEOSCAPE().RemoveInterception(self);
}
event Destroyed()
{
	local XGShip_Interceptor kShip;

	LogInternal(GetFuncName() @ self);
	foreach m_arrInterceptors(kShip)
	{
		LogInternal(kShip @ "m_kEngagement set to None.");
		kShip.m_kEngagement = none;
	}
}