public void CreateNatives()
{
    CreateNative("eItems_GetWeaponCount", Native_GetWeaponCount);
    CreateNative("eItems_GetPaintsCount", Native_GetPaintsCount);
    CreateNative("eItems_GetGlovesCount", Native_GetGlovesCount);
    


    CreateNative("eItems_AreItemsSynced", Native_AreItemsSynced);
    CreateNative("eItems_AreItemsSyncing", Native_AreItemsSyncing);
    CreateNative("eItems_ReSync", Native_ReSync);
    
    

    /*              Weapons             */

    //Generic
    CreateNative("eItems_GetWeaponNumByDefIndex", Native_GetWeaponNumByDefIndex);
    CreateNative("eItems_GetWeaponNumByClassName", Native_GetWeaponNumByClassName);
    CreateNative("eItems_GetWeaponNumByWeapon", Native_GetWeaponNumByWeapon);
    CreateNative("eItems_GetWeaponDefIndexByWeaponNum", Native_GetWeaponDefIndexByWeaponNum);
    CreateNative("eItems_GetWeaponDefIndexByClassName", Native_GetWeaponDefIndexByClassName);
    CreateNative("eItems_IsDefIndexKnife", Native_IsDefIndexKnife);
    CreateNative("eItems_GetWeaponDefIndexByWeapon", Native_GetWeaponDefIndexByWeapon);
    CreateNative("eItems_GetActiveWeaponNum", Native_GetActiveWeaponNum);
    CreateNative("eItems_GetActiveWeaponDefIndex", Native_GetActiveWeaponDefIndex);
    CreateNative("eItems_GetActiveWeapon", Native_GetActiveWeapon);
    CreateNative("eItems_GetActiveWeaponClassName", Native_GetActiveWeaponClassName);
    CreateNative("eItems_IsSkinnableDefIndex", Native_IsSkinnableDefIndex);
    CreateNative("eItems_FindWeaponByWeaponNum", Native_FindWeaponByWeaponNum);
    CreateNative("eItems_FindWeaponByDefIndex", Native_FindWeaponByDefIndex);
    CreateNative("eItems_FindWeaponByClassName", Native_FindWeaponByClassName);
    CreateNative("eItems_RefillClipAmmo", Native_RefillClipAmmo);
    CreateNative("eItems_RefillReserveAmmo", Native_RefillReserveAmmo);
    CreateNative("eItems_IsValidWeapon", Native_IsValidWeapon);
    CreateNative("eItems_GiveWeapon", Native_GiveWeapon);
    CreateNative("eItems_RemoveKnife", Native_RemoveKnife);
    CreateNative("eItems_RemoveWeapon", Native_RemoveWeapon);
    CreateNative("eItems_RespawnWeapon", Native_RespawnWeapon);
    CreateNative("eItems_RespawnWeaponBySlot", Native_RespawnWeaponBySlot);
    CreateNative("eItems_RemoveAllWeapons", Native_RemoveAllWeapons);
    CreateNative("eItems_SetWeaponAmmo", Native_SetWeaponAmmo);
    CreateNative("eItems_SetAllWeaponsAmmo", Native_SetAllWeaponsAmmo);
    CreateNative("eItems_SetAllWeaponsAmmoByClassName", Native_SetAllWeaponsAmmoByClassName);
    CreateNative("eItems_SetActiveWeapon", Native_SetActiveWeapon);
    CreateNative("eItems_DropWeapon", Native_DropWeapon);
    //ClassNames
    CreateNative("eItems_GetWeaponClassNameByWeaponNum", Native_GetWeaponClassNameByWeaponNum);
    CreateNative("eItems_GetWeaponClassNameByDefIndex", Native_GetWeaponClassNameByDefIndex);
    CreateNative("eItems_GetWeaponClassNameByWeapon", Native_GetWeaponClassNameByWeapon);
    //DisplayNames
    CreateNative("eItems_GetWeaponDisplayNameByWeaponNum", Native_GetWeaponDisplayNameByWeaponNum);
    CreateNative("eItems_GetWeaponDisplayNameByDefIndex", Native_GetWeaponDisplayNameByDefIndex);
    CreateNative("eItems_GetWeaponDisplayNameByClassName", Native_GetWeaponDisplayNameByClassName);
    CreateNative("eItems_GetWeaponDisplayNameByWeapon", Native_GetWeaponDisplayNameByWeapon);
    //ViewModels
    CreateNative("eItems_GetWeaponViewModelByWeaponNum", Native_GetWeaponViewModelByWeaponNum);
    CreateNative("eItems_GetWeaponViewModelByDefIndex", Native_GetWeaponViewModelByDefIndex);
    CreateNative("eItems_GetWeaponViewModelByWeapon", Native_GetWeaponViewModelByWeapon);
    CreateNative("eItems_GetWeaponViewModelByClassName", Native_GetWeaponViewModelByClassName);
    //WorldModels
    CreateNative("eItems_GetWeaponWorldModelByWeaponNum", Native_GetWeaponWorldModelByWeaponNum);
    CreateNative("eItems_GetWeaponWorldModelByDefIndex", Native_GetWeaponWorldModelByDefIndex);
    CreateNative("eItems_GetWeaponWorldModelByWeapon", Native_GetWeaponWorldModelByWeapon);
    CreateNative("eItems_GetWeaponWorldModelByClassName", Native_GetWeaponWorldModelByClassName);
    //Weapon Slot
    CreateNative("eItems_GetWeaponSlotByWeaponNum", Native_GetWeaponSlotByWeaponNum);
    CreateNative("eItems_GetWeaponSlotByDefIndex", Native_GetWeaponSlotByDefIndex);
    CreateNative("eItems_GetWeaponSlotByWeapon", Native_GetWeaponSlotByWeapon);
    CreateNative("eItems_GetWeaponSlotByClassName", Native_GetWeaponSlotByClassName);
    //Weapon Team
    CreateNative("eItems_GetWeaponTeamByWeaponNum", Native_GetWeaponTeamByWeaponNum);
    CreateNative("eItems_GetWeaponTeamByDefIndex", Native_GetWeaponTeamByDefIndex);
    CreateNative("eItems_GetWeaponTeamByWeapon", Native_GetWeaponTeamByWeapon);
    CreateNative("eItems_GetWeaponTeamByClassName", Native_GetWeaponTeamByClassName);
    //Clip Ammo
    CreateNative("eItems_GetWeaponClipAmmoByWeaponNum", Native_GetWeaponClipAmmoByWeaponNum);
    CreateNative("eItems_GetWeaponClipAmmoByDefIndex", Native_GetWeaponClipAmmoByDefIndex);
    CreateNative("eItems_GetWeaponClipAmmoByWeapon", Native_GetWeaponClipAmmoByWeapon);
    CreateNative("eItems_GetWeaponClipAmmoByClassName", Native_GetWeaponClipAmmoByClassName);
    //Reserve Ammo
    CreateNative("eItems_GetWeaponReserveAmmoByWeaponNum", Native_GetWeaponReserveAmmoByWeaponNum);
    CreateNative("eItems_GetWeaponReserveAmmoByDefIndex", Native_GetWeaponReserveAmmoByDefIndex);
    CreateNative("eItems_GetWeaponReserveAmmoByWeapon", Native_GetWeaponReserveAmmoByWeapon);
    CreateNative("eItems_GetWeaponReserveAmmoByClassName", Native_GetWeaponReserveAmmoByClassName);
    //Price
    CreateNative("eItems_GetWeaponPriceByWeaponNum", Native_GetWeaponPriceByWeaponNum);
    CreateNative("eItems_GetWeaponPriceByDefIndex", Native_GetWeaponPriceByDefIndex);
    CreateNative("eItems_GetWeaponPriceByWeapon", Native_GetWeaponPriceByWeapon);
    CreateNative("eItems_GetWeaponPriceByClassName", Native_GetWeaponPriceByClassName);
    //Max Player Speed
    CreateNative("eItems_GetWeaponMaxPlayerSpeedByWeaponNum", Native_GetWeaponMaxPlayerSpeedByWeaponNum);
    CreateNative("eItems_GetWeaponMaxPlayerSpeedByDefIndex", Native_GetWeaponMaxPlayerSpeedByDefIndex);
    CreateNative("eItems_GetWeaponMaxPlayerSpeedByWeapon", Native_GetWeaponMaxPlayerSpeedByWeapon);
    CreateNative("eItems_GetWeaponMaxPlayerSpeedByClassName", Native_GetWeaponMaxPlayerSpeedByClassName);
    //Damage
    CreateNative("eItems_GetWeaponDamageByWeaponNum", Native_GetWeaponDamageByWeaponNum);
    CreateNative("eItems_GetWeaponDamageByDefIndex", Native_GetWeaponDamageByDefIndex);
    CreateNative("eItems_GetWeaponDamageByWeapon", Native_GetWeaponDamageByWeapon);
    CreateNative("eItems_GetWeaponDamageByClassName", Native_GetWeaponDamageByClassName);
    //Is Full Auto
    CreateNative("eItems_IsWeaponFullAutoByWeaponNum", Native_IsWeaponFullAutoByWeaponNum);
    CreateNative("eItems_IsWeaponFullAutoByDefIndex", Native_IsWeaponFullAutoByDefIndex);
    CreateNative("eItems_IsWeaponFullAutoByWeapon", Native_IsWeaponFullAutoByWeapon);
    CreateNative("eItems_IsWeaponFullAutoByClassName", Native_IsWeaponFullAutoByClassName);
    //Spread
    CreateNative("eItems_GetWeaponSpreadByWeaponNum", Native_GetWeaponSpreadByWeaponNum);
    CreateNative("eItems_GetWeaponSpreadByDefIndex", Native_GetWeaponSpreadByDefIndex);
    CreateNative("eItems_GetWeaponSpreadByWeapon", Native_GetWeaponSpreadByWeapon);
    CreateNative("eItems_GetWeaponSpreadByClassName", Native_GetWeaponSpreadByClassName);
    //Cycle Time
    CreateNative("eItems_GetWeaponCycleTimeByWeaponNum", Native_GetWeaponCycleTimeByWeaponNum);
    CreateNative("eItems_GetWeaponCycleTimeByDefIndex", Native_GetWeaponCycleTimeByDefIndex);
    CreateNative("eItems_GetWeaponCycleTimeByWeapon", Native_GetWeaponCycleTimeByWeapon);
    CreateNative("eItems_GetWeaponCycleTimeByClassName", Native_GetWeaponCycleTimeByClassName);

    /*              Skins             */

    CreateNative("eItems_IsSkinNumGloveApplicable", Native_IsSkinNumGloveApplicable);
    CreateNative("eItems_GetSkinNumByDefIndex", Native_GetSkinNumByDefIndex);
    CreateNative("eItems_GetSkinDefIndexBySkinNum", Native_GetSkinDefIndexBySkinNum);
    CreateNative("eItems_GetSkinDisplayNameByDefIndex", Native_GetSkinDisplayNameByDefIndex);
    CreateNative("eItems_GetSkinDisplayNameBySkinNum", Native_GetSkinDisplayNameBySkinNum);
    CreateNative("eItems_IsNativeSkin", Native_IsNativeSkin);

    /*              Gloves            */

    CreateNative("eItems_GetGlovesNumByDefIndex", Native_GetGlovesNumByDefIndex);
    CreateNative("eItems_GetGlovesDefIndexByGlovesNum", Native_GetGlovesDefIndexByGlovesNum);
    CreateNative("eItems_GetGlovesDisplayNameByDefIndex", Native_GetGlovesDisplayNameByDefIndex);
    CreateNative("eItems_GetGlovesDisplayNameByGlovesNum", Native_GetGlovesDisplayNameByGlovesNum);
    CreateNative("eItems_GetGlovesViewModelByGlovesNum", Native_GetGlovesViewModelByGlovesNum);
    CreateNative("eItems_GetGlovesViewModelByDefIndex", Native_GetGlovesViewModelByDefIndex);
    CreateNative("eItems_GetGlovesWorldModelByGlovesNum", Native_GetGlovesWorldModelByGlovesNum);
    CreateNative("eItems_GetGlovesWorldModelByDefIndex", Native_GetGlovesWorldModelByDefIndex);
    CreateNative("eItems_GetGlovesNumBySkinNum", Native_GetGlovesNumBySkinNum);
    
    

}

public int Native_GetWeaponCount(Handle plugin, int numParams)
{
    return GetWeaponCount();
}

public int Native_GetPaintsCount(Handle plugin, int numParams)
{
    return GetPaintsCount();
}

public int Native_GetGlovesCount(Handle plugin, int numParams)
{
    return GetGlovesCount();
}

public int Native_AreItemsSynced(Handle plugin, int numParams)
{
    return AreItemsSynced();
}

public int Native_AreItemsSyncing(Handle plugin, int numParams)
{
    return AreItemsSyncing();
}

public int Native_ReSync(Handle hPlugin, int iNumParams)
{
    CheckHibernation();
    ParseItems();
    return true;
}

    // ClassNames

public int Native_GetWeaponClassNameByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szClassName[48];

    if(!GetWeaponClassNameByWeaponNum(iWeaponNum, szClassName, sizeof(szClassName)))
    {
        return false;
    }

    return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponClassNameByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szClassName[48];

    if(!GetWeaponClassNameByDefIndex(iDefIndex, szClassName, sizeof(szClassName)))
    {
        return false;
    }

    return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponClassNameByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    char szClassName[48];

    if(!GetWeaponClassNameByWeapon(iWeapon, szClassName, sizeof(szClassName)))
    {
        return false;
    }

    return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
}

    // DisplayNames

public int Native_GetWeaponDisplayNameByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[48];

    if(!GetWeaponDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
        return false;
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponDisplayNameByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    char szDisplayName[48];

    if(!GetWeaponDisplayNameByClassName(szClassName, szDisplayName, sizeof(szDisplayName)))
    {
        return false;
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponDisplayNameByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDisplayName[48];

    if(!GetWeaponDisplayNameByWeaponNum(iWeaponNum, szDisplayName, sizeof(szDisplayName)))
    {
        return false;
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponDisplayNameByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    char szDisplayName[48];

    if(!GetWeaponDisplayNameByWeapon(iWeapon, szDisplayName, sizeof(szDisplayName)))
    {
        return false;
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

    //ViewModel

public int Native_GetWeaponViewModelByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szViewModel[PLATFORM_MAX_PATH];

    if(!GetWeaponViewModelByWeaponNum(iWeaponNum, szViewModel, sizeof(szViewModel)))
    {
        return false;
    }

    return SetNativeString(2, szViewModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponViewModelByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szViewModel[PLATFORM_MAX_PATH];

    if(!GetWeaponViewModelByDefIndex(iDefIndex, szViewModel, sizeof(szViewModel)))
    {
        return false;
    }

    return SetNativeString(2, szViewModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponViewModelByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    char szViewModel[PLATFORM_MAX_PATH];

    if(!GetWeaponViewModelByWeapon(iWeapon, szViewModel, sizeof(szViewModel)))
    {
        return false;
    }

    return SetNativeString(2, szViewModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponViewModelByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    char szViewModel[PLATFORM_MAX_PATH];

    if(!GetWeaponViewModelByClassName(szClassName, szViewModel, sizeof(szViewModel)))
    {
        return false;
    }

    return SetNativeString(2, szViewModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

    //WorldModel

public int Native_GetWeaponWorldModelByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetWeaponWorldModelByWeaponNum(iWeaponNum, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponWorldModelByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetWeaponWorldModelByDefIndex(iDefIndex, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponWorldModelByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetWeaponWorldModelByWeapon(iWeapon, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponWorldModelByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetWeaponWorldModelByClassName(szClassName, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

    //Generic

public int Native_IsDefIndexKnife(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    return IsDefIndexKnife(iDefIndex);
}

public int Native_GetWeaponDefIndexByWeapon(Handle hPlugin, int iNumParams)
{
	int iWeapon = GetNativeCell(1);
	return GetWeaponDefIndexByWeapon(iWeapon);
}

public int Native_GetWeaponNumByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    return GetWeaponNumByDefIndex(iDefIndex);
}

public int Native_GetWeaponNumByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));
    return GetWeaponNumByClassName(szClassName);
}

public int Native_GetWeaponNumByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    return GetWeaponNumByWeapon(iWeapon);
}

public int Native_GetWeaponDefIndexByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    return GetWeaponDefIndexByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponDefIndexByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));
    return GetWeaponDefIndexByClassName(szClassName);
}

public int Native_GetActiveWeaponNum(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iWeapon = GetActiveWeapon(client);

    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    return GetWeaponNumByWeapon(iWeapon);
}

public int Native_GetActiveWeaponDefIndex(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iWeapon = GetActiveWeapon(client);

    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    return GetWeaponDefIndexByWeapon(iWeapon);
}

public int Native_GetActiveWeapon(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	return GetActiveWeapon(client);
}

public int Native_GetActiveWeaponClassName(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);

    int iDefIndex = GetActiveWeaponDefIndex(client);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szClassName[48];

    if (GetWeaponClassNameByDefIndex(iDefIndex, szClassName, sizeof(szClassName)))
    {
        return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
    }

    return false;
}

public int Native_IsSkinnableDefIndex(Handle hPlugin, int iNumParams)
{
	int iDefIndex = GetNativeCell(1);

	if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

	return IsSkinnableDefIndex(iDefIndex);
}

public int Native_FindWeaponByWeaponNum(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iWeaponNum = GetNativeCell(2);
	
	return FindWeaponByWeaponNum(client, iWeaponNum);
}

public int Native_FindWeaponByDefIndex(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iDefIndex = GetNativeCell(2);
	
	return FindWeaponByDefIndex(client, iDefIndex);
}

public int Native_FindWeaponByClassName(Handle plugin, int numParams)
{
    char szClassName[48];

    int client = GetNativeCell(1);
    GetNativeString(2, szClassName, sizeof(szClassName));

    return FindWeaponByClassName(client, szClassName);
}

    //Weapon Slot

public int Native_GetWeaponSlotByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponSlotByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponSlotByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponSlotByDefIndex(iDefIndex);
}

public int Native_GetWeaponSlotByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponSlotByWeapon(iWeapon);
}

public int Native_GetWeaponSlotByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponSlotByClassName(szClassName);
}

    //Weapon Team

public int Native_GetWeaponTeamByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponTeamByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponTeamByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponTeamByDefIndex(iDefIndex);
}

public int Native_GetWeaponTeamByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponTeamByWeapon(iWeapon);
}

public int Native_GetWeaponTeamByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponTeamByClassName(szClassName);
}

    //Clip Ammo
public int Native_GetWeaponClipAmmoByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponClipAmmoByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponClipAmmoByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponClipAmmoByDefIndex(iDefIndex);
}

public int Native_GetWeaponClipAmmoByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponClipAmmoByWeapon(iWeapon);
}

public int Native_GetWeaponClipAmmoByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponClipAmmoByClassName(szClassName);
}

    //Reserve Ammo
public int Native_GetWeaponReserveAmmoByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponReserveAmmoByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponReserveAmmoByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponReserveAmmoByDefIndex(iDefIndex);
}

public int Native_GetWeaponReserveAmmoByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponReserveAmmoByWeapon(iWeapon);
}

public int Native_GetWeaponReserveAmmoByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponReserveAmmoByClassName(szClassName);
}

    //Price
public int Native_GetWeaponPriceByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponPriceByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponPriceByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponPriceByDefIndex(iDefIndex);
}

public int Native_GetWeaponPriceByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponPriceByWeapon(iWeapon);
}

public int Native_GetWeaponPriceByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponPriceByClassName(szClassName);
}

    //Max Player Speed
public int Native_GetWeaponMaxPlayerSpeedByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponMaxPlayerSpeedByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponMaxPlayerSpeedByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponMaxPlayerSpeedByDefIndex(iDefIndex);
}

public int Native_GetWeaponMaxPlayerSpeedByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponMaxPlayerSpeedByWeapon(iWeapon);
}

public int Native_GetWeaponMaxPlayerSpeedByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponMaxPlayerSpeedByClassName(szClassName);
}

    //Damage
public int Native_GetWeaponDamageByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponDamageByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponDamageByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponDamageByDefIndex(iDefIndex);
}

public int Native_GetWeaponDamageByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponDamageByWeapon(iWeapon);
}

public int Native_GetWeaponDamageByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponDamageByClassName(szClassName);
}

    //Is Full Auto
public int Native_IsWeaponFullAutoByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return view_as<bool>(IsWeaponFullAutoByWeaponNum(iWeaponNum));
}

public int Native_IsWeaponFullAutoByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return view_as<bool>(IsWeaponFullAutoByDefIndex(iDefIndex));
}

public int Native_IsWeaponFullAutoByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return view_as<bool>(IsWeaponFullAutoByWeapon(iWeapon));
}

public int Native_IsWeaponFullAutoByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return view_as<bool>(IsWeaponFullAutoByClassName(szClassName));
}

    //Spread
public int Native_GetWeaponSpreadByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponSpreadByWeaponNum(iWeaponNum));
}

public int Native_GetWeaponSpreadByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponSpreadByDefIndex(iDefIndex));
}

public int Native_GetWeaponSpreadByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponSpreadByWeapon(iWeapon));
}

public int Native_GetWeaponSpreadByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return view_as<int>(GetWeaponSpreadByClassName(szClassName));
}

    //Cycle Time
public int Native_GetWeaponCycleTimeByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponCycleTimeByWeaponNum(iWeaponNum));
}

public int Native_GetWeaponCycleTimeByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponCycleTimeByDefIndex(iDefIndex));
}

public int Native_GetWeaponCycleTimeByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponCycleTimeByWeapon(iWeapon));
}

public int Native_GetWeaponCycleTimeByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return view_as<int>(GetWeaponCycleTimeByClassName(szClassName));
}

public int Native_RefillClipAmmo(Handle hPlugin, int iNumParams)
{
    int iWeapon = GetNativeCell(1);

    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return RefillClipAmmo(iWeapon);
}

public int Native_RefillReserveAmmo(Handle hPlugin, int iNumParams)
{
    int iWeapon = GetNativeCell(1);

    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return RefillReserveAmmo(iWeapon);
}

public int Native_IsValidWeapon(Handle hPlugin, int iNumParams)
{
    int iWeapon = GetNativeCell(1);
    return IsValidWeapon(iWeapon);
}

public int Native_GiveWeapon(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    char szClassName[48];

    GetNativeString(2, szClassName, sizeof(szClassName));

    int iReserveAmmo = GetNativeCell(3);
    int iClipAmmo = GetNativeCell(4);
    int iSwitchTo = GetNativeCell(5);

    return GiveWeapon(client, szClassName, iReserveAmmo, iClipAmmo, iSwitchTo);
}

public int Native_RemoveKnife(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	
	return RemoveKnife(client);
}

public int Native_RemoveWeapon(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iWeapon = GetNativeCell(2);

    return RemoveWeapon(client, iWeapon);
}

public int Native_RespawnWeapon(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iWeapon = GetNativeCell(2);
	
	return RespawnWeapon(client, iWeapon);
}

public int Native_RespawnWeaponBySlot(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iSlot = GetNativeCell(2);
    int iWeapon = GetPlayerWeaponSlot(client, iSlot);
    return RespawnWeapon(client, iWeapon);
}

public int Native_RemoveAllWeapons(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iSkipSlot = GetNativeCell(2);

    return RemoveAllWeapons(client, iSkipSlot);
}


public int Native_SetWeaponAmmo(Handle hPlugin, int iNumParams)
{
	int iWeapon = GetNativeCell(1);
	int iReserveAmmo = GetNativeCell(2);
	int iClipAmmo = GetNativeCell(3);
	
	return SetWeaponAmmo(iWeapon, iReserveAmmo, iClipAmmo);
}

public int Native_SetAllWeaponsAmmo(Handle hPlugin, int iNumParams)
{
	int iReserveAmmo = GetNativeCell(1);
	int iClipAmmo = GetNativeCell(1);

	return SetAllWeaponsAmmo(iReserveAmmo, iClipAmmo);
}

public int Native_SetAllWeaponsAmmoByClassName(Handle hPlugin, int iNumParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));
    int iReserveAmmo = GetNativeCell(2);
    int iClipAmmo = GetNativeCell(2);

    return SetAllWeaponsAmmoByClassName(szClassName, iReserveAmmo, iClipAmmo);
}

public int Native_SetActiveWeapon(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iWeapon = GetNativeCell(2);
	
	return SetActiveWeapon(client, iWeapon);
}

public int Native_DropWeapon(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iWeapon = GetNativeCell(2);
	
	return DropWeapon(client, iWeapon);
}

public int Native_IsSkinNumGloveApplicable(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return false;
    }

    return IsSkinNumGloveApplicable(iSkinNum);
}

public int Native_GetSkinNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSkinsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetSkinNumByDefIndex(iDefIndex);
}

public int Native_GetSkinDefIndexBySkinNum(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return -1;
    }
    return GetSkinDefIndexBySkinNum(iSkinNum);
}

public int Native_GetSkinDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSkinsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[48];

    if(!GetSkinDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetSkinDisplayNameBySkinNum(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return -1;
    }

    char szDisplayName[48];

    if(!GetSkinDisplayNameBySkinNum(iSkinNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_IsNativeSkin(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);
    int iItemNum = GetNativeCell(2);
    int iItemType = GetNativeCell(3);

    if(iItemType < 0 || iItemType > 1)
    {
        return false;
    }
    
    return IsNativeSkin(iSkinNum, iItemNum, iItemType);
}

public int Native_GetGlovesNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetGlovesNumByDefIndex(iDefIndex);
}

public int Native_GetGlovesDefIndexByGlovesNum(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iGlovesCount < iSkinNum)
    {
        return -1;
    }
    return GetGlovesDefIndexByGlovesNum(iSkinNum);
}

public int Native_GetGlovesDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[48];

    if(!GetGlovesDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesDisplayNameByGlovesNum(Handle hPlugin, int iNumParams)
{
    int iGloveNum = GetNativeCell(1);

    if(g_iGlovesCount < iGloveNum)
    {
        return -1;
    }

    char szDisplayName[48];

    if(!GetGlovesDisplayNameByGlovesNum(iGloveNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesViewModelByGlovesNum(Handle plugin, int numParams)
{
    int iGloveNum = GetNativeCell(1);

    if(g_iGlovesCount < iGloveNum)
    {
        return -1;
    }
    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetGlovesViewModelByGlovesNum(iGloveNum, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesViewModelByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetGlovesViewModelByDefIndex(iDefIndex, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesWorldModelByGlovesNum(Handle plugin, int numParams)
{
    int iGloveNum = GetNativeCell(1);

    if(g_iGlovesCount < iGloveNum)
    {
        return -1;
    }
    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetGlovesWorldModelByGlovesNum(iGloveNum, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesWorldModelByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetGlovesWorldModelByDefIndex(iDefIndex, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesNumBySkinNum(Handle plugin, int numParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return -1;
    }

    return GetGlovesNumBySkinNum(iSkinNum);
}


