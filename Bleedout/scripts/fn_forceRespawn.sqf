#define BLEEDOUTCtrl(ctrl) ((uiNamespace getVariable ["Life_Death_Screen",displayNull]) displayCtrl ctrl)
#define BLEEDOUTdisplay (uiNamespace getVariable ["Life_Death_Screen",displayNull])
/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Website: xaflaforo.co.uk
 * Rights: All Rights Reserved
 * Notice: You're not allowed to use this file without permission from the author!
 *
 * Filename: fn_forceRespawn.sqf
 *
 * Parameter(s): NONE
 *
 * Description:
 * Function to be used to control the deathscreen GUI.
 *
 * Dependencies:
 * AsYetUntitled Framework, XaFlaForo Base Installation Pack
 *
 * Donate:
 * If you would like to donate to recieve products first, technical suppport  and no advertising in the products donate below.
 * paypal.me/EthanSolutions
 */

if (XaFlaForo_in_down_state) then {
    XaFlaForo_Deathscreen_AllowSuicide = (findDisplay 73001) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 57) then {
    		(findDisplay 73001) displayRemoveEventHandler ['KeyDown',XaFlaForo_Deathscreen_AllowSuicide];
    		setDammage 1;];
};
