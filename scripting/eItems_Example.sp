#include <sourcemod>
#include <eItems>

#pragma newdecls required
#pragma semicolon 1

#define TAG_NCLR "[eItems Example]"
#define AUTHOR "ESK0"
#define VERSION "0.1"

bool g_bLateLoad;

public Plugin myinfo =
{
    name = "[eItems] Example",
    author = AUTHOR,
    version = VERSION
};

public APLRes AskPluginLoad2(Handle hMyself, bool bLate, char[] chError, int iErrMax)
{
    g_bLateLoad = bLate;
}

public void OnPluginStart()
{
    if(GetEngineVersion() != Engine_CSGO)
    {
		SetFailState("Your game is not supported! (CS:GO Only!)");
	}

    if(g_bLateLoad)
    {
        if(eItems_AreItemsSynced())
        {
            eItems_OnItemsSynced();
        }
    }
}

public void eItems_OnItemsSynced()
{
    int iWeaponsCount = eItems_GetWeaponCount();

    int iDefIndex;
    char szDisplayName[48];
    int iTeam;
    int iPrice;
    int iMaxSpeed;
    int iDamage;
    int iIsFullAuto;
    float fSpread;
    float fCycleTime;

    for(int i = 0; i < iWeaponsCount; i++)
    {
        iDefIndex = eItems_GetWeaponDefIndexByWeaponNum(i);
        iTeam = eItems_GetWeaponTeamByDefIndex(iDefIndex);
        iPrice = eItems_GetWeaponPriceByDefIndex(iDefIndex);
        iMaxSpeed = eItems_GetWeaponMaxPlayerSpeedByDefIndex(iDefIndex);
        iDamage = eItems_GetWeaponDamageByDefIndex(iDefIndex);
        iIsFullAuto = view_as<int>(eItems_IsWeaponFullAutoByDefIndex(iDefIndex));
        fSpread = eItems_GetWeaponSpreadByDefIndex(iDefIndex);
        fCycleTime = eItems_GetWeaponCycleTimeByDefIndex(iDefIndex);

        eItems_GetWeaponDisplayNameByWeaponNum(i, szDisplayName, sizeof(szDisplayName));
        PrintToServer("%s Def: %i | Display: %s | Team: %i | Price: %i | MaxSpeed: %i | Damage: %i | FullAuto: %i | Spread: %f | CycleTime: %f", TAG_NCLR, iDefIndex, szDisplayName, iTeam, iPrice, iMaxSpeed, iDamage, iIsFullAuto, fSpread, fCycleTime);
    }
}

