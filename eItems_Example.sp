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
    int iPaintsCount = eItems_GetPaintsCount();
    PrintToServer("%s Weapons: %i | Paints: %i", TAG_NCLR, iWeaponsCount, iPaintsCount);

    PrintToServer("%s Weapon Num = %i ", TAG_NCLR, eItems_GetWeaponNumByClassName("weapon_usp_silencer"));
}

