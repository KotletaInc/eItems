#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include <ripext>
#include <eItems>

#pragma newdecls required
#pragma semicolon 1

#define TAG_NCLR "[eItems]"
#define AUTHOR "ESK0"
#define VERSION "0.2"


ConVar g_cvHibernationWhenEmpty;
int g_iHibernateWhenEmpty = 0;

StringMap g_smSkinsNames = null;
StringMap g_smWeaponPaints = null;
StringMap g_smWeaponInfo = null;

ArrayList g_arSkinsNum = null;
ArrayList g_arWeaponsNum = null;

enum struct eWeaponInfo
{
    int WeaponNum;
    char DisplayName[48];
    char ClassName[48];
    char ViewModel[PLATFORM_MAX_PATH];
    char WorldModel[PLATFORM_MAX_PATH];
    ArrayList Paints;
    int Team;
    int Slot;
    int ClipAmmo;
    int ReserveAmmo;
    int MaxPlayerSpeed;
    int Price;
    float CycleTime;
    float Spread;
    int Damage;
    int FullAuto;
}

float g_fStart;

int g_iWeaponCount = 0;
int g_iPaintsCount = 0;

bool g_bItemsSynced = false;

GlobalForward g_OnItemsSynced;

#include "files/natives.sp"
#include "files/forwards.sp"
#include "files/func.sp"

public Plugin myinfo =
{
    name = "eItems",
    author = AUTHOR,
    version = VERSION,
};


public void OnPluginStart()
{
    g_smSkinsNames      = new StringMap();
    g_smWeaponPaints    = new StringMap();
    g_smWeaponInfo      = new StringMap();
    g_arSkinsNum        = new ArrayList();
    g_arWeaponsNum      = new ArrayList();

    g_cvHibernationWhenEmpty    = FindConVar("sv_hibernate_when_empty");
    g_iHibernateWhenEmpty       = g_cvHibernationWhenEmpty.IntValue;

    CheckHibernation();
    ParseItems();
}

public void OnPluginEnd()
{
    delete g_smSkinsNames;
    delete g_smWeaponPaints;
    delete g_smWeaponInfo;
    delete g_arSkinsNum;
    delete g_arWeaponsNum;
}

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
    RegPluginLibrary("eItems");

    CreateNatives();
    CreateForwards();
    return APLRes_Success;
}

public void ParseItems()
{
    HTTPClient httpClient = new HTTPClient("<-- URL HIDDEN TILL RELEASE --->");
    httpClient.Get("items.json", PraseItemsDownloaded);
}

public void PraseItemsDownloaded(HTTPResponse response, any value)
{
    if (response.Status != HTTPStatus_OK)
    {
        SetFailState("%s HTTPStatus_OK failed", TAG_NCLR);
        return;
    }
    if (response.Data == null)
    {
        SetFailState("%s Data failed", TAG_NCLR);
        return;
    }

    ParseData(response.Data);
}



public void ParseData(any json)
{
    g_fStart = GetEngineTime();

    JSONObject jRoot        = view_as<JSONObject>(json);
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
    PrintToServer("%s Items synced in %0.5f seconds", TAG_NCLR, fEnd - g_fStart);
    PrintToServer("%s Items synced successfully", TAG_NCLR);
    g_bItemsSynced = true;

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
        iFullAuto = -1;

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
        g_smSkinsNames.SetString(szSkinDef, szDisplayName);
        delete jItem;
    }
    PrintToServer("%s %i paints synced successfully!", TAG_NCLR, array.Length);
}

stock void CheckHibernation(bool bToDefault = false)
{
    if(g_iHibernateWhenEmpty == 0)
    {
        return;
    }
    if(bToDefault)
    {
        PrintToServer("%s Hibernation returned back to default", TAG_NCLR);
        g_cvHibernationWhenEmpty.SetInt(g_iHibernateWhenEmpty);
        return;
    }

    PrintToServer("%s Hibernation disabled", TAG_NCLR);
    g_cvHibernationWhenEmpty.SetInt(0);
}

stock bool IsValidClient(int client, bool alive = false)
{
    return (0 < client && client <= MaxClients && IsClientInGame(client) && IsFakeClient(client) == false && (alive == false || IsPlayerAlive(client)));
}