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

    //ClassNames
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

    //  DisplayNames
public bool GetWeaponDisplayNameByWeaponNum(int iWeaponNum, char[] szDisplayName, int iLen)
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

    strcopy(szDisplayName, iLen, WeaponInfo.DisplayName);
    return true;
}

public bool GetWeaponDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szDisplayName, iLen, WeaponInfo.DisplayName);
    return true;
}

public bool GetWeaponDisplayNameByWeapon(int iWeapon, char[] szDisplayName, int iLen)
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
    
    strcopy(szDisplayName, iLen, WeaponInfo.DisplayName);
    return true;
}

public bool GetWeaponDisplayNameByClassName(const char[] szClassName, char[] szDisplayName, int iLen)
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
            strcopy(szDisplayName, iLen, WeaponInfo.DisplayName);
            return true;
        }
    }
    return false;
}

    //  ViewModels
public bool GetWeaponViewModelByWeaponNum(int iWeaponNum, char[] szViewModel, int iLen)
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

    strcopy(szViewModel, iLen, WeaponInfo.ViewModel);
    return true;
}

public bool GetWeaponViewModelByDefIndex(int iDefIndex, char[] szViewModel, int iLen)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szViewModel, iLen, WeaponInfo.ViewModel);
    return true;
}

public bool GetWeaponViewModelByWeapon(int iWeapon, char[] szViewModel, int iLen)
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
    
    strcopy(szViewModel, iLen, WeaponInfo.ViewModel);
    return true;
}

public bool GetWeaponViewModelByClassName(const char[] szClassName, char[] szViewModel, int iLen)
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
            strcopy(szViewModel, iLen, WeaponInfo.ViewModel);
            return true;
        }
    }
    return false;
}

    //  WorldModels
public bool GetWeaponWorldModelByWeaponNum(int iWeaponNum, char[] szWorldModel, int iLen)
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

    strcopy(szWorldModel, iLen, WeaponInfo.WorldModel);
    return true;
}

public bool GetWeaponWorldModelByDefIndex(int iDefIndex, char[] szWorldModel, int iLen)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szWorldModel, iLen, WeaponInfo.WorldModel);
    return true;
}

public bool GetWeaponWorldModelByWeapon(int iWeapon, char[] szWorldModel, int iLen)
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
    
    strcopy(szWorldModel, iLen, WeaponInfo.WorldModel);
    return true;
}

public bool GetWeaponWorldModelByClassName(const char[] szClassName, char[] szWorldModel, int iLen)
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
            strcopy(szWorldModel, iLen, WeaponInfo.WorldModel);
            return true;
        }
    }
    return false;
}

    // Generic
public bool IsDefIndexKnife(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    if(WeaponInfo.Slot == CS_SLOT_KNIFE)
    {
        return true;
    }

    return false;
}

public int GetActiveWeapon(int client)
{
	if (!IsValidClient(client, true))
    {
		return -1;
	}
		
	return GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
}

public int GetActiveWeaponDefIndex(int client)
{
	int iWeapon = GetActiveWeapon(client);
	
	if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

	return GetWeaponDefIndexByWeapon(iWeapon);
}

public bool IsSkinnableDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    ArrayList arWeaponPaints = null;
    g_smWeaponPaints.GetValue(szDefIndex, arWeaponPaints);
    if(arWeaponPaints == null)
    {
        return false;
    }
    return arWeaponPaints.Length > 0;
}

public int FindWeaponByWeaponNum(int client, int iWeaponNum)
{
	if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }
	
	char szClassName[48];

	if (!GetWeaponClassNameByWeaponNum(iWeaponNum, szClassName, sizeof(szClassName)))
    {
		return -1;
	}
	
	return FindWeaponByClassName(client, szClassName);
}

public int FindWeaponByClassName(int client, const char[] szClassName)
{
    if(!IsValidClient(client, true))
    {
        return -1;
    }


    int iWantedDefIndex = GetWeaponDefIndexByClassName(szClassName);

    if(g_arWeaponsNum.FindValue(iWantedDefIndex) == -1)
    {
        return -1;
    }

    int iMyWeapons = GetEntPropArraySize(client, Prop_Send, "m_hMyWeapons");

    for (int i = 0; i < iMyWeapons; i++)
    {
        int iWeapon = GetEntPropEnt(client, Prop_Send, "m_hMyWeapons", i);

        if(!IsValidWeapon(iWeapon))
        {
            continue;
        }

        int iWeaponDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

        if(iWeaponDefIndex == iWantedDefIndex)
        {
            return iWeapon;
        }
    }
    return -1;
}

public int FindWeaponByDefIndex(int client, int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szClassName[48];

    if (!GetWeaponClassNameByDefIndex(iDefIndex, szClassName, sizeof(szClassName)))
    {
        return -1;
    }

    return FindWeaponByClassName(client, szClassName);
}

    //  Weapon Slot
public int GetWeaponSlotByWeaponNum(int iWeaponNum)
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

    return WeaponInfo.Slot;
}

public int GetWeaponSlotByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Slot;
}

public int GetWeaponSlotByWeapon(int iWeapon)
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

    return WeaponInfo.Slot;
}

public int GetWeaponSlotByClassName(const char[] szClassName)
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
            return WeaponInfo.Slot;
        }
    }
    return -1;
}

    //  Weapon Team
public int GetWeaponTeamByWeaponNum(int iWeaponNum)
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

    return WeaponInfo.Team;
}

public int GetWeaponTeamByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Team;
}

public int GetWeaponTeamByWeapon(int iWeapon)
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

    return WeaponInfo.Team;
}

public int GetWeaponTeamByClassName(const char[] szClassName)
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
            return WeaponInfo.Team;
        }
    }
    return -1;
}

    //  Clip Ammo
public int GetWeaponClipAmmoByWeaponNum(int iWeaponNum)
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

    return WeaponInfo.ClipAmmo;
}

public int GetWeaponClipAmmoByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.ClipAmmo;
}

public int GetWeaponClipAmmoByWeapon(int iWeapon)
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

    return WeaponInfo.ClipAmmo;
}

public int GetWeaponClipAmmoByClassName(const char[] szClassName)
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
            return WeaponInfo.ClipAmmo;
        }
    }
    return -1;
}

    //  Reserve Ammo
public int GetWeaponReserveAmmoByWeaponNum(int iWeaponNum)
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

    return WeaponInfo.ReserveAmmo;
}

public int GetWeaponReserveAmmoByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.ReserveAmmo;
}

public int GetWeaponReserveAmmoByWeapon(int iWeapon)
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

    return WeaponInfo.ReserveAmmo;
}

public int GetWeaponReserveAmmoByClassName(const char[] szClassName)
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
            return WeaponInfo.ReserveAmmo;
        }
    }
    return -1;
}

    //  Price
public int GetWeaponPriceByWeaponNum(int iWeaponNum)
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

    return WeaponInfo.Price;
}

public int GetWeaponPriceByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Price;
}

public int GetWeaponPriceByWeapon(int iWeapon)
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

    return WeaponInfo.Price;
}

public int GetWeaponPriceByClassName(const char[] szClassName)
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
            return WeaponInfo.Price;
        }
    }
    return -1;
}

    //  Max Player Speed
public int GetWeaponMaxPlayerSpeedByWeaponNum(int iWeaponNum)
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

    return WeaponInfo.MaxPlayerSpeed;
}

public int GetWeaponMaxPlayerSpeedByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.MaxPlayerSpeed;
}

public int GetWeaponMaxPlayerSpeedByWeapon(int iWeapon)
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

    return WeaponInfo.MaxPlayerSpeed;
}

public int GetWeaponMaxPlayerSpeedByClassName(const char[] szClassName)
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
            return WeaponInfo.MaxPlayerSpeed;
        }
    }
    return -1;
}

    //  Damage
public int GetWeaponDamageByWeaponNum(int iWeaponNum)
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

    return WeaponInfo.Damage;
}

public int GetWeaponDamageByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Damage;
}

public int GetWeaponDamageByWeapon(int iWeapon)
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

    return WeaponInfo.Damage;
}

public int GetWeaponDamageByClassName(const char[] szClassName)
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
            return WeaponInfo.Damage;
        }
    }
    return -1;
}

    //  Is Full auto
public int IsWeaponFullAutoByWeaponNum(int iWeaponNum)
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

    return WeaponInfo.FullAuto;
}

public int IsWeaponFullAutoByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.FullAuto;
}

public int IsWeaponFullAutoByWeapon(int iWeapon)
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

    return WeaponInfo.FullAuto;
}

public int IsWeaponFullAutoByClassName(const char[] szClassName)
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
            return WeaponInfo.FullAuto;
        }
    }
    return -1;
}

    //  Spread
public float GetWeaponSpreadByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return -1.0;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Spread;
}

public float GetWeaponSpreadByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return -1.0;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Spread;
}

public float GetWeaponSpreadByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return -1.0;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return -1.0;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Spread;
}

public float GetWeaponSpreadByClassName(const char[] szClassName)
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
            return WeaponInfo.Spread;
        }
    }
    return -1.0;
}

    //  Cycle Time
public float GetWeaponCycleTimeByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return -1.0;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.CycleTime;
}

public float GetWeaponCycleTimeByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return -1.0;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.CycleTime;
}

public float GetWeaponCycleTimeByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return -1.0;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return -1.0;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.CycleTime;
}

public float GetWeaponCycleTimeByClassName(const char[] szClassName)
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
            return WeaponInfo.CycleTime;
        }
    }
    return -1.0;
}

public bool SetWeaponAmmo(int iWeapon, int iReserveAmmo, int iClipAmmo)
{
    if (iReserveAmmo < 0 && iClipAmmo < 0)
    {
        return false;
    }

    if(iReserveAmmo > -1)
    {
        SetEntProp(iWeapon, Prop_Send, "m_iPrimaryReserveAmmoCount", iReserveAmmo);
    }

    if(iClipAmmo > -1)
    {
        SetEntProp(iWeapon, Prop_Send, "m_iClip1", iClipAmmo);
    }

    return true;
}

public bool RefillClipAmmo(int iWeapon)
{
    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
    int iClipAmmo = WeaponInfo.ClipAmmo;
    return SetWeaponAmmo(iWeapon, -1, iClipAmmo);
}

public bool RefillReserveAmmo(int iWeapon)
{
    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
    int iReserveAmmo = WeaponInfo.ReserveAmmo;
    return SetWeaponAmmo(iWeapon, iReserveAmmo, -1);
}