public void ParseItems()
{
    PrintToServer("%s Downloading eItems data from API", TAG_NCLR);
    HTTPClient httpClient = new HTTPClient("https://api.hexa-core.eu/plugins/eitems");
    httpClient.SetHeader("User-Agent", "eItems HTTP Client 1.0 (730)");
    httpClient.Get("items.json", PraseItemsDownloaded);
}

public void PraseItemsDownloaded(HTTPResponse response, any value)
{
    if (response.Status != HTTPStatus_OK)
    {
        PrintToServer("%s Downloading eItems data from API failed! Local backup will be used instead!", TAG_NCLR);
        LoadBackup();
        return;
    }
    if (response.Data == null)
    {
        PrintToServer("%s Downloading eItems data from API failed! Local backup will be used instead!", TAG_NCLR);
        LoadBackup();
        return;
    }
    PrintToServer("%s eItems data downloaded successfully", TAG_NCLR);
    BackupJson(response.Data);
}

public void LoadBackup()
{
    if(!FileExists(g_szLocalFilePath))
    {
        SetFailState("%s Local backup not found! Turning plugin off.", TAG_NCLR);
        return;
    }

    JSONObject jRoot = JSONObject.FromFile(g_szLocalFilePath);
    ParseData(jRoot);
}

public void BackupJson(JSON json)
{
    PrintToServer("%s Creating local backup file!", TAG_NCLR);
    File fLocalFile = null;
    if (fLocalFile == null)
    {
        if(FileExists(g_szLocalFilePath))
        {
            DeleteFile(g_szLocalFilePath);
        }
        fLocalFile = OpenFile(g_szLocalFilePath, "w+");
    }

    JSONObject jRoot = view_as<JSONObject>(json);

    jRoot.ToFile(g_szLocalFilePath, JSON_COMPACT);
    delete fLocalFile;
    fLocalFile = null;
    PrintToServer("%s Backup created!", TAG_NCLR);

    ParseData(jRoot);
}

public void ParseData(JSONObject jRoot)
{
    g_bItemsSyncing = true;
    g_fStart = GetEngineTime();

    JSONArray jWeapons      = view_as<JSONArray>(jRoot.Get("weapons"));
    JSONArray jPaints       = view_as<JSONArray>(jRoot.Get("paints"));
    JSONArray jGloves       = view_as<JSONArray>(jRoot.Get("gloves"));
    JSONArray jCoins        = view_as<JSONArray>(jRoot.Get("coins"));
    JSONArray jPins         = view_as<JSONArray>(jRoot.Get("pins"));
    JSONArray jCrates       = view_as<JSONArray>(jRoot.Get("crates"));
    JSONArray jMusicKits    = view_as<JSONArray>(jRoot.Get("music_kits"));
    JSONArray jPatches      = view_as<JSONArray>(jRoot.Get("patches"));
    JSONArray jSprayes      = view_as<JSONArray>(jRoot.Get("sprayes"));
    JSONArray jStickers     = view_as<JSONArray>(jRoot.Get("stickers"));
    

    /*              Paints parse                */

    ParsePaints(jPaints);

    /*              Weapon parse                */

    ParseWeapons(jWeapons);

    /*             Gloves parse                */

    ParseGloves(jGloves);


    delete jRoot;
    delete jWeapons;
    delete jPaints;
    delete jGloves;
    delete jCoins;
    delete jPins;
    delete jCrates;
    delete jMusicKits;
    delete jPatches;
    delete jSprayes;
    delete jStickers;

    float fEnd = GetEngineTime();
    PrintToServer("%s Items synced successfully in %0.5f seconds", TAG_NCLR, fEnd - g_fStart);
    g_bItemsSynced = true;
    g_bItemsSyncing = false;

    Call_StartForward(g_OnItemsSynced);
    Call_Finish(g_OnItemsSynced);
    CheckHibernation(true);
}

public void ParseWeapons(JSONArray array)
{
    g_iWeaponCount = array.Length;
    JSONObject jItem;
    char szWeaponClassname[48];
    char szWeaponDisplayName[64];
    char szWeaponViewModel[PLATFORM_MAX_PATH];
    char szWeaponWorldModel[PLATFORM_MAX_PATH];
    char szPosTemp[12];
    char szWepDefIndex[12];
    int iSkinDefIndex;
    int iWepDefIndex;
    int iTeam;
    int iSlot;
    int iClipAmmo;
    int iReserveAmmo;
    int iMaxPlayerSpeed;
    int iPrice;
    int iDamage;
    int iFullAuto;

    float fCycleTime;
    float fSpread;
 
    for(int iWeaponNum = 0; iWeaponNum < array.Length; iWeaponNum++)
    {
        iSkinDefIndex = 0;
        iWepDefIndex = 0;
        iTeam = 0;
        iSlot = -1;
        iClipAmmo = -1;
        iReserveAmmo = -1;
        iMaxPlayerSpeed = -1;
        iPrice = -1;
        iDamage = -1;
        iFullAuto = 0;

        fCycleTime = 0.0;
        fSpread = 0.0;
 
        jItem = view_as<JSONObject>(array.Get(iWeaponNum));
        iWepDefIndex = jItem.GetInt("def_index");
        iTeam = jItem.GetInt("team");

        if(jItem.HasKey("slot"))
        {
            iSlot = jItem.GetInt("slot");
        }
        
        jItem.GetString("item_name", szWeaponDisplayName, sizeof(szWeaponDisplayName));
        jItem.GetString("class_name", szWeaponClassname, sizeof(szWeaponClassname));
        jItem.GetString("view_model", szWeaponViewModel, sizeof(szWeaponViewModel));
        jItem.GetString("world_model", szWeaponWorldModel, sizeof(szWeaponWorldModel));

        IntToString(iWepDefIndex, szWepDefIndex, sizeof(szWepDefIndex));

        ArrayList arWeaponPaints = new ArrayList();
        if(jItem.HasKey("paints"))
        {
            JSONObject jPaintsObj = view_as<JSONObject>(jItem.Get("paints"));
            for(int iPos = 0; iPos < jPaintsObj.Size; iPos++)
            {
                IntToString(iPos, szPosTemp, sizeof(szPosTemp));
                iSkinDefIndex = jPaintsObj.GetInt(szPosTemp);
                arWeaponPaints.Push(iSkinDefIndex);
            }
            g_smWeaponPaints.SetValue(szWepDefIndex, arWeaponPaints);
            delete jPaintsObj;
        }

        if(jItem.HasKey("attributes"))
        {
            JSONObject jAttributesObj = view_as<JSONObject>(jItem.Get("attributes"));
            
            if(jAttributesObj.HasKey("primary_clip_size"))
            {
                iClipAmmo = jAttributesObj.GetInt("primary_clip_size");
            }

            if(jAttributesObj.HasKey("primary_reserve_ammo_max"))
            {
                iReserveAmmo = jAttributesObj.GetInt("primary_reserve_ammo_max");
            }

            if(jAttributesObj.HasKey("max_player_speed"))
            {
                iMaxPlayerSpeed = jAttributesObj.GetInt("max_player_speed");
            }

            if(jAttributesObj.HasKey("in_game_price"))
            {
                iPrice = jAttributesObj.GetInt("in_game_price");
            }

            if(jAttributesObj.HasKey("damage"))
            {
                iDamage = jAttributesObj.GetInt("damage");
            }

            if(jAttributesObj.HasKey("is_full_auto"))
            {
                iFullAuto = jAttributesObj.GetInt("is_full_auto");
            }

            if(jAttributesObj.HasKey("cycletime"))
            {
                fCycleTime = jAttributesObj.GetFloat("cycletime");
            }

            if(jAttributesObj.HasKey("spread"))
            {
                fSpread = jAttributesObj.GetFloat("spread");
            }




            delete jAttributesObj;
        }

        delete jItem;

        eWeaponInfo WeaponInfo;

        strcopy(WeaponInfo.DisplayName,     sizeof(eWeaponInfo::DisplayName),   szWeaponDisplayName);
        strcopy(WeaponInfo.ClassName,       sizeof(eWeaponInfo::ClassName),     szWeaponClassname);
        strcopy(WeaponInfo.ViewModel,       sizeof(eWeaponInfo::ViewModel),     szWeaponViewModel);
        strcopy(WeaponInfo.WorldModel,      sizeof(eWeaponInfo::WorldModel),    szWeaponWorldModel);
        strcopy(WeaponInfo.DisplayName,     sizeof(eWeaponInfo::DisplayName),   szWeaponDisplayName);
        strcopy(WeaponInfo.DisplayName,     sizeof(eWeaponInfo::DisplayName),   szWeaponDisplayName);
        strcopy(WeaponInfo.DisplayName,     sizeof(eWeaponInfo::DisplayName),   szWeaponDisplayName);

        WeaponInfo.WeaponNum            = iWeaponNum;
        WeaponInfo.Paints               = arWeaponPaints;
        WeaponInfo.Team                 = iTeam;
        WeaponInfo.Slot                 = iSlot;
        WeaponInfo.ClipAmmo             = iClipAmmo;
        WeaponInfo.ReserveAmmo          = iReserveAmmo;
        WeaponInfo.MaxPlayerSpeed       = iMaxPlayerSpeed;
        WeaponInfo.Price                = iPrice;
        WeaponInfo.Damage               = iDamage;
        WeaponInfo.FullAuto             = iFullAuto;
        WeaponInfo.CycleTime            = fCycleTime;
        WeaponInfo.Spread               = fSpread;

        g_smWeaponInfo.SetArray(szWepDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        g_arWeaponsNum.Push(iWepDefIndex);
    }
    PrintToServer("%s %i weapons synced successfully!", TAG_NCLR, array.Length);
}

public void ParsePaints(JSONArray array)
{

    g_iPaintsCount = array.Length;
    JSONObject jItem;
    int iDefIndex = 0;
    char szDisplayName[64];
    char szDisplayNameExtra[32];
    char szSkinDef[12];
    for(int iSkinNum = 0; iSkinNum < array.Length; iSkinNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iSkinNum));

        iDefIndex = jItem.GetInt("def_index");
        g_arSkinsNum.Push(iDefIndex);

        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));
        
        if(jItem.HasKey("item_name_extra"))
        {
            jItem.GetString("item_name_extra", szDisplayNameExtra, sizeof(szDisplayNameExtra));
            FormatEx(szDisplayName, sizeof(szDisplayName), "%s %s", szDisplayName, szDisplayNameExtra);
        }

        IntToString(iDefIndex, szSkinDef, sizeof(szSkinDef));

        eSkinInfo SkinInfo;
        SkinInfo.SkinNum = iSkinNum;
        strcopy(SkinInfo.DisplayName, sizeof(eSkinInfo::DisplayName), szDisplayName);
        SkinInfo.GloveApplicable = false;
        g_smSkinInfo.SetArray(szSkinDef, SkinInfo, sizeof(eSkinInfo));

        delete jItem;
    }
    PrintToServer("%s %i paints synced successfully!", TAG_NCLR, array.Length);
}

public void ParseGloves(JSONArray array)
{

    g_iGlovesCount = array.Length;
    JSONObject jItem;

    int iDefIndex = 0;
    int iSkinDefIndex;
    char szSkinDef[12];
    char szDisplayName[64];
    char szViewModel[PLATFORM_MAX_PATH];
    char szWorldModel[PLATFORM_MAX_PATH];
    char szGloveDef[12];
    char szPosTemp[12];

    for(int iGloveNum = 0; iGloveNum < array.Length; iGloveNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iGloveNum));

        iDefIndex = jItem.GetInt("def_index");
        g_arGlovesNum.Push(iDefIndex);

        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));
        jItem.GetString("view_model", szViewModel, sizeof(szViewModel));
        jItem.GetString("world_model", szWorldModel, sizeof(szWorldModel));

        IntToString(iDefIndex, szGloveDef, sizeof(szGloveDef));

        ArrayList arGlovePaints = new ArrayList();
        if(jItem.HasKey("paints"))
        {
            JSONObject jPaintsObj = view_as<JSONObject>(jItem.Get("paints"));
            for(int iPos = 0; iPos < jPaintsObj.Size; iPos++)
            {
                IntToString(iPos, szPosTemp, sizeof(szPosTemp));
                iSkinDefIndex = jPaintsObj.GetInt(szPosTemp);
                IntToString(iSkinDefIndex, szSkinDef, sizeof(szSkinDef));
                eSkinInfo SkinInfo;
                g_smSkinInfo.GetArray(szSkinDef, SkinInfo, sizeof(eSkinInfo));
                SkinInfo.GloveApplicable = true;
                g_smSkinInfo.SetArray(szSkinDef, SkinInfo, sizeof(eSkinInfo));
                arGlovePaints.Push(iSkinDefIndex);
            }
            g_smGlovePaints.SetValue(szGloveDef, arGlovePaints);
            delete jPaintsObj;
        }

        eGlovesInfo GloveInfo;
        GloveInfo.GloveNum = iGloveNum;
        strcopy(GloveInfo.DisplayName, sizeof(eGlovesInfo::DisplayName), szDisplayName);
        strcopy(GloveInfo.ViewModel, sizeof(eGlovesInfo::ViewModel), szViewModel);
        strcopy(GloveInfo.WorldModel, sizeof(eGlovesInfo::WorldModel), szWorldModel);
        GloveInfo.Paints = arGlovePaints;

        g_smGloveInfo.SetArray(szGloveDef, GloveInfo, sizeof(eGlovesInfo));

        delete jItem;
    }
    PrintToServer("%s %i gloves synced successfully!", TAG_NCLR, array.Length);
}