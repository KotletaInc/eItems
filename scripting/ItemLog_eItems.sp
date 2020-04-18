#pragma semicolon 1

#define PLUGIN_AUTHOR "SM9"
#define PLUGIN_VERSION "0.1"

#include <eItems>

bool g_bLateLoaded;

public Plugin myinfo = 
{
	name = "eItems Item Log (CSGO Items)", 
	author = PLUGIN_AUTHOR, 
	description = "Logs gloves and weapon skins", 
	version = PLUGIN_VERSION, 
	url = "https://github.com/ESK0/eItems"
};

public APLRes AskPluginLoad2(Handle hMyself, bool bLate, char[] chError, int iErrMax) {
	g_bLateLoaded = bLate;
}

public void OnPluginStart()
{
	if (GetEngineVersion() != Engine_CSGO) {
		SetFailState("This plugin is for CSGO only.");
	}
	
	if (g_bLateLoaded) {
		if (eItems_AreItemsSynced()) {
			eItems_OnItemsSynced();
		} else if (!eItems_AreItemsSyncing()) {
			eItems_ReSync();
		}
	}
	
	char szPath[PLATFORM_MAX_PATH];
	BuildPath(Path_SM, szPath, sizeof(szPath), "logs/ItemLog");
	
	if (!DirExists(szPath)) {
		CreateDirectory(szPath, 511);
	}
	
	BuildPath(Path_SM, szPath, sizeof(szPath), "logs/ItemLog/Weapons");
	
	if (!DirExists(szPath)) {
		CreateDirectory(szPath, 511);
	}
	
	BuildPath(Path_SM, szPath, sizeof(szPath), "logs/ItemLog/Gloves");
	
	if (!DirExists(szPath)) {
		CreateDirectory(szPath, 511);
	}
}

public void eItems_OnItemsSynced()
{
	char szBuffer[128]; char szPath[PLATFORM_MAX_PATH];
	char szSplitBuffer[128][128];
	int iSkinNum;
	File fFile;
	
	ArrayList alPaints = new ArrayList(128);
	
	// First we are going to push paints into an ArrayList so we can sort them alphabetically.
	for (int i = 0; i < eItems_GetPaintsCount(); i++) {
		if (eItems_GetSkinDefIndexBySkinNum(i) <= -1) {
			continue;
		}
		
		if (!eItems_GetSkinDisplayNameBySkinNum(i, szBuffer, sizeof(szBuffer))) {
			continue;
		}
		
		FormatEx(szBuffer, 128, "%s;%d", szBuffer, i);
		alPaints.PushString(szBuffer);
	}
	
	SortADTArray(alPaints, Sort_Ascending, Sort_String);
	
	// Lets create a paint list for each weapon.
	for (int i = 0; i < eItems_GetWeaponCount(); i++) {
		if (eItems_GetWeaponDefIndexByWeaponNum(i) <= -1) {
			continue;
		}
		
		bool bDisplay = eItems_GetWeaponDisplayNameByWeaponNum(i, szBuffer, sizeof(szBuffer));
		int iPrice = eItems_GetWeaponPriceByWeaponNum(i);
		int iDefIndex = eItems_GetWeaponDefIndexByWeaponNum(i);
		char sClassName[PLATFORM_MAX_PATH + 1];
		bool bClassName = eItems_GetWeaponClassNameByWeaponNum(i, sClassName, sizeof(sClassName));
		char sViewModel[PLATFORM_MAX_PATH + 1];
		bool bViewModel = eItems_GetWeaponViewModelByWeaponNum(i, sViewModel, sizeof(sViewModel));
		char sWorldModel[PLATFORM_MAX_PATH + 1];
		bool bWorldModel = eItems_GetWeaponWorldModelByWeaponNum(i, sWorldModel, sizeof(sWorldModel));
		int iSlot = eItems_GetWeaponSlotByWeaponNum(i);
		int iTeam = eItems_GetWeaponTeamByWeaponNum(i);
		int iClipAmmo = eItems_GetWeaponClipAmmoByWeaponNum(i);
		int iReserveAmmo = eItems_GetWeaponReserveAmmoByWeaponNum(i);
		float fSpread = eItems_GetWeaponSpreadByWeaponNum(i);
		float fCycleTime = eItems_GetWeaponCycleTimeByWeaponNum(i);
		
		BuildPath(Path_SM, szPath, sizeof(szPath), "logs/ItemLog/Weapons/%s.txt", szBuffer);

		PrintToServer("Displayname: %s (%d), Def Index: %d, Classname: %s (%d), View Model: %s (%d), World Model: %s (%d), Slot: %d, Team: %d, Clip Ammo: %d, Reserve Ammo: %d, Spread: %f, CycleTime: %f, Price: %d",
		szBuffer, bDisplay, iDefIndex, sClassName, bClassName, sViewModel, bViewModel, sWorldModel, bWorldModel, iSlot, iTeam, iClipAmmo, iReserveAmmo, fSpread, fCycleTime, iPrice);
		
		for (int x = 0; x < alPaints.Length; x++) {
			alPaints.GetString(x, szBuffer, sizeof(szBuffer)); ExplodeString(szBuffer, ";", szSplitBuffer, 128, 128);
			iSkinNum = StringToInt(szSplitBuffer[1]);
			
			if (eItems_IsNativeSkin(iSkinNum, i, ITEMTYPE_WEAPON)) {
				if (fFile == null) {
					fFile = OpenFile(szPath, "w+");
				}
				
				FormatEx(szBuffer, sizeof(szBuffer), "%s -- %d", szSplitBuffer[0], eItems_GetSkinDefIndexBySkinNum(iSkinNum));
				fFile.WriteLine(szBuffer);
			}
		}
		
		if (fFile != null) {
			fFile.Close();
			fFile = null;
		}
	}
	
	// Lets create a paint list for each gloves.
	for (int i = 0; i < eItems_GetGlovesCount(); i++) {
		if (eItems_GetGlovesDefIndexByGlovesNum(i) <= -1) {
			continue;
		}
		
		eItems_GetGlovesDisplayNameByGlovesNum(i, szBuffer, sizeof(szBuffer));
		BuildPath(Path_SM, szPath, sizeof(szPath), "logs/ItemLog/Gloves/%s.txt", szBuffer);
		
		for (int x = 0; x < alPaints.Length; x++) {
			alPaints.GetString(x, szBuffer, sizeof(szBuffer)); ExplodeString(szBuffer, ";", szSplitBuffer, 128, 128);
			iSkinNum = StringToInt(szSplitBuffer[1]);
			
			if (eItems_IsNativeSkin(iSkinNum, i, ITEMTYPE_GLOVES)) {
				if (fFile == null) {
					fFile = OpenFile(szPath, "w+");
				}
				
				FormatEx(szBuffer, sizeof(szBuffer), "%s -- %d", szSplitBuffer[0], eItems_GetSkinDefIndexBySkinNum(iSkinNum));
				fFile.WriteLine(szBuffer);
			}
		}
		
		if (fFile != null) {
			fFile.Close();
			fFile = null;
		}
	}
} 