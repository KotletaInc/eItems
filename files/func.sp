public int eGetWeaponCount()
{
    return g_iWeaponCount;
}

public int eGetPaintsCount()
{
    return g_iPaintsCount;
}

public bool eAreItemsSynced()
{
    return g_bItemsSynced;
}

public int eGetWeaponNumByDefIndex(int iDefIndex)
{
    return g_arWeaponsNum.FindValue(iDefIndex);
}

public int GetWeaponNumByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return iWeaponNum;
        }

    }
    return -1;
}

public int GetWeaponNumByWeapon(int iWeapon)
{
    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);
    if(iDefIndex <= 0)
    {
        return -1;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
    return WeaponInfo.WeaponNum;
}

public int GetWeaponDefIndexByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return 0;
    }

    return GetEntProp(iWeapon, Prop_Send, "m_iItemDefinitionIndex");
}

public int GetWeaponDefIndexByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return -1;
    }

    return g_arWeaponsNum.Get(iWeaponNum);
}

public int GetWeaponDefIndexByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return GetWeaponDefIndexByWeaponNum(iWeaponNum);
        }

    }
    return -1;
}

public bool IsValidWeapon(int iWeapon)
{
    if(!IsValidEntity(iWeapon) || !IsValidEdict(iWeapon) || iWeapon < 0)
    {
		return false;
	}

    if(!HasEntProp(iWeapon, Prop_Send, "m_hOwnerEntity"))
    {
        return false;
	}

    int iDefIndex = GetEntProp(iWeapon, Prop_Send, "m_iDefinitionIndex");
    if(g_arWeaponsNum.FindValue(iDefIndex) != -1)
    {
        return true;
    }

    return false;
}

public bool GetWeaponClassNameByWeaponNum(int iWeaponNum, char[] szClassName, int iLen)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szClassName, iLen, WeaponInfo.ClassName);
    return true;
}

public bool GetWeaponClassNameByDefIndex(int iDefIndex, char[] szClassName, int iLen)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szClassName, iLen, WeaponInfo.ClassName);
    return true;
}

public bool GetWeaponClassNameByWeapon(int iWeapon, char[] szClassName, int iLen)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
    
    strcopy(szClassName, iLen, WeaponInfo.ClassName);
    return true;
}