#if defined _eItems_included_
#endinput
#endif
#define _eItems_included_


native int eItems_GetWeaponCount();
native int eItems_GetPaintsCount();
native bool eItems_AreItemsSynced();

forward void eItems_OnItemsSynced();


/*              Weapons             */

    /*     Generic     */

native int      eItems_GetWeaponNumByDefIndex(int iDefIndex);
native int      eItems_GetWeaponNumByClassName(const char[] szClassName);
native int      eItems_GetWeaponNumByWeapon(int iWeapon);
native int      eItems_GetWeaponDefIndexByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponDefIndexByClassName(const char[] szClassName); 
native int      eItems_GetWeaponDefIndexByWeapon(int iWeapon); 
native bool     eItems_IsDefIndexKnife(int iDefIndex);
native int      eItems_GetActiveWeaponNum(int iClient);
native int      eItems_GetActiveWeaponDefIndex(int iClient);
native int      eItems_GetActiveWeapon(int iClient);
native int      eItems_GetActiveWeaponClassName(int iClient, char[] szBuffer, int iLength);
native bool     eItems_IsSkinnableDefIndex(int iDefIndex);
native int      eItems_FindWeaponByWeaponNum(int iClient, int iWeaponNum);
native int      eItems_FindWeaponByDefIndex(int iClient, int iDefIndex);
native int      eItems_FindWeaponByClassName(int iClient, const char[] szClassName);
native bool     eItems_RefillClipAmmo(int iWeapon);
native bool     eItems_RefillReserveAmmo(int iWeapon);
native bool     eItems_IsValidWeapon(int iWeapon);



    /*  ClassNames  */

native bool     eItems_GetWeaponClassNameByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponClassNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponClassNameByWeapon(int iWeapon, char[] szBuffer, int iLength);

    /*  DisplayNames    */

native bool     eItems_GetWeaponDisplayNameByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponDisplayNameByWeapon(int iWeapon, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponDisplayNameByClassName(const char[] szClassName, char[] szBuffer, int iLength);

    /*    ViewModel     */

native bool     eItems_GetWeaponViewModelByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponViewModelByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponViewModelByWeapon(int iWeapon, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponViewModelByClassName(const char[] szClassName, char[] szBuffer, int iLength);

    /*    WorldModel     */

native bool     eItems_GetWeaponWorldModelByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponWorldModelByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponWorldModelByWeapon(int iWeapon, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponWorldModelByClassName(const char[] szClassName, char[] szBuffer, int iLength);

    /*     Slot     */

native int      eItems_GetWeaponSlotByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponSlotByDefIndex(int iDefIndex);
native int      eItems_GetWeaponSlotByWeapon(int iWeapon);
native int      eItems_GetWeaponSlotByClassName(const char[] szClassName);

    /*     Team     */

native int      eItems_GetWeaponTeamByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponTeamByDefIndex(int iDefIndex);
native int      eItems_GetWeaponTeamByWeapon(int iWeapon);
native int      eItems_GetWeaponTeamByClassName(const char[] szClassName);

    /*     Clip Ammo     */

native int      eItems_GetWeaponClipAmmoByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponClipAmmoByDefIndex(int iDefIndex);
native int      eItems_GetWeaponClipAmmoByWeapon(int iWeapon);
native int      eItems_GetWeaponClipAmmoByClassName(const char[] szClassName);

    /*     Reserve Ammo     */

native int      eItems_GetWeaponReserveAmmoByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponReserveAmmoByDefIndex(int iDefIndex);
native int      eItems_GetWeaponReserveAmmoByWeapon(int iWeapon);
native int      eItems_GetWeaponReserveAmmoByClassName(const char[] szClassName);

    /*     Price     */

native int      eItems_GetWeaponPriceByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponPriceByDefIndex(int iDefIndex);
native int      eItems_GetWeaponPriceByWeapon(int iWeapon);
native int      eItems_GetWeaponPriceByClassName(const char[] szClassName);

    /*     Max Player Speed     */

native int      eItems_GetWeaponMaxPlayerSpeedByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponMaxPlayerSpeedByDefIndex(int iDefIndex);
native int      eItems_GetWeaponMaxPlayerSpeedByWeapon(int iWeapon);
native int      eItems_GetWeaponMaxPlayerSpeedByClassName(const char[] szClassName);

    /*     Damage     */

native int      eItems_GetWeaponDamageSpeedByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponDamageSpeedByDefIndex(int iDefIndex);
native int      eItems_GetWeaponDamageSpeedByWeapon(int iWeapon);
native int      eItems_GetWeaponDamageSpeedByClassName(const char[] szClassName);

    /*     Full Auto     */

native bool     eItems_IsWeaponFullAutoByWeaponNum(int iWeaponNum);
native bool     eItems_IsWeaponFullAutoByDefIndex(int iDefIndex);
native bool     eItems_IsWeaponFullAutoByWeapon(int iWeapon);
native bool     eItems_IsWeaponFullAutoByClassName(const char[] szClassName);

    /*     Spread     */

native float    eItems_GetWeaponSpreadByWeaponNum(int iWeaponNum);
native float    eItems_GetWeaponSpreadByDefIndex(int iDefIndex);
native float    eItems_GetWeaponSpreadByWeapon(int iWeapon);
native float    eItems_GetWeaponSpreadByClassName(const char[] szClassName);

    /*     Cycle Time     */

native float    eItems_GetWeaponCycleTimeByWeaponNum(int iWeaponNum);
native float    eItems_GetWeaponCycleTimeByDefIndex(int iDefIndex);
native float    eItems_GetWeaponCycleTimeByWeapon(int iWeapon);
native float    eItems_GetWeaponCycleTimeByClassName(const char[] szClassName);