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

enum struct eClientInfo
{
    bool GivingWeapon;

    bool Reset()
    {
        this.GivingWeapon = false;
    }  
}

eClientInfo ClientInfo[MAXPLAYERS + 1];

float g_fStart;

int g_iWeaponCount = 0;
int g_iPaintsCount = 0;

bool g_bItemsSynced = false;
bool g_bItemsSyncing = false;
bool g_bIsRoundEnd = false;

Handle g_hSwitchWeaponCall = null;
Handle g_hOnWeaponGiven = null;


GlobalForward g_OnItemsSynced;