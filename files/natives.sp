public void CreateNatives()
{
    CreateNative("eItems_GetWeaponCount", Native_GetWeaponCount);
    CreateNative("eItems_GetPaintsCount", Native_GetPaintsCount);
    CreateNative("eItems_AreItemsSynced", Native_AreItemsSynced);

    /*              Weapons             */

    CreateNative("eItems_GetWeaponNumByDefIndex", Native_GetWeaponNumByDefIndex);
    CreateNative("eItems_GetWeaponNumByClassName", Native_GetWeaponNumByClassName);
    CreateNative("eItems_GetWeaponNumByWeapon", Native_GetWeaponNumByWeapon);
    CreateNative("eItems_GetWeaponDefIndexByWeaponNum", Native_GetWeaponDefIndexByWeaponNum);
    CreateNative("eItems_GetWeaponDefIndexByClassName", Native_GetWeaponDefIndexByClassName);
    CreateNative("eItems_GetWeaponClassNameByWeaponNum", Native_GetWeaponClassNameByWeaponNum);
    CreateNative("eItems_GetWeaponClassNameByDefIndex", Native_GetWeaponClassNameByDefIndex);
    CreateNative("eItems_GetWeaponClassNameByWeapon", Native_GetWeaponClassNameByWeapon);
}

public int Native_GetWeaponCount(Handle plugin, int numParams)
{
    return eGetWeaponCount();
}

public int Native_GetPaintsCount(Handle plugin, int numParams)
{
    return eGetPaintsCount();
}

public int Native_AreItemsSynced(Handle plugin, int numParams)
{
    return eAreItemsSynced();
}

public int Native_GetWeaponNumByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    return eGetWeaponNumByDefIndex(iDefIndex);
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


