ConVar g_cvHibernationWhenEmpty;
int g_iHibernateWhenEmpty = 0;

enum struct eSkinInfo
{
    int SkinNum;
    char DisplayName[48];
    bool GloveApplicable;
}

enum struct eGlovesInfo
{
    int GloveNum;
    char DisplayName[48];
    char ViewModel[PLATFORM_MAX_PATH];
    char WorldModel[PLATFORM_MAX_PATH];
    ArrayList Paints;
}

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

enum struct eClientInfo
{
    bool GivingWeapon;

    bool Reset()
    {
        this.GivingWeapon = false;
    }  
}

eClientInfo ClientInfo[MAXPLAYERS + 1];

StringMap g_smSkinInfo = null;
ArrayList g_arSkinsNum = null;

StringMap g_smWeaponPaints = null;
StringMap g_smWeaponInfo = null;
ArrayList g_arWeaponsNum = null;

StringMap g_smGlovePaints = null;
StringMap g_smGloveInfo = null;
ArrayList g_arGlovesNum = null;

float g_fStart;

int g_iWeaponCount = 0;
int g_iPaintsCount = 0;
int g_iGlovesCount = 0;

bool g_bItemsSynced = false;
bool g_bItemsSyncing = false;
bool g_bIsRoundEnd = false;

Handle g_hSwitchWeaponCall = null;

GlobalForward g_OnWeaponGiven;
GlobalForward g_OnItemsSynced;

char g_szLocalFilePath[PLATFORM_MAX_PATH];