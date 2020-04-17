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
    char szClassName[48];
    int iIsKnife;
    int iIsSkinnable;
    for(int i = 0; i < iWeaponsCount; i++)
    {
        iDefIndex = eItems_GetWeaponDefIndexByWeaponNum(i);
        iIsKnife = view_as<int>(eItems_IsDefIndexKnife(iDefIndex));
        iIsSkinnable = view_as<int>(eItems_IsSkinnableDefIndex(iDefIndex));
        
        eItems_GetWeaponClassNameByWeaponNum(i, szClassName, sizeof(szClassName));
        eItems_GetWeaponDisplayNameByWeaponNum(i, szDisplayName, sizeof(szDisplayName));
        PrintToServer("%s Def: %i | Display: %s | ClassName: %s | IsKnife: %i | Skinnable: %i", TAG_NCLR, iDefIndex, szDisplayName, szClassName, iIsKnife, iIsSkinnable);
    }
}

