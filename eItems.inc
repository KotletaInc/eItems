#if defined _eItems_included_
#endinput
#endif
#define _eItems_included_


native int eItems_GetWeaponCount();
native int eItems_GetPaintsCount();
native bool eItems_AreItemsSynced();

forward void eItems_OnItemsSynced();


/*              Weapons             */

native int  eItems_GetWeaponNumByDefIndex(int iDefIndex); // returns -1 if failed
native int  eItems_GetWeaponNumByClassName(const char[] szClassName); // returns -1 if failed
native int  eItems_GetWeaponNumByWeapon(int iWeapon); // returns -1 if failed
native int  eItems_GetWeaponDefIndexByWeaponNum(int iWeaponNum); // returns -1 if failed
native int  eItems_GetWeaponDefIndexByClassName(const char[] szClassName);  // returns -1 if failed
native bool eItems_GetWeaponClassNameByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength); // returns false if failed
native bool eItems_GetWeaponClassNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength); // returns false if failed
native bool eItems_GetWeaponClassNameByWeapon(int iWeapon, char[] szBuffer, int iLength); // returns false if failed