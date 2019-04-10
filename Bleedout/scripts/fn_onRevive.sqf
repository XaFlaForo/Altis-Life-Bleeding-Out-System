/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Website: xaflaforo.co.uk
 * Rights: All Rights Reserved
 * Notice: You're not allowed to use this file without permission from the author!
 *
 * Filename: fn_onRevive.sqf
 *
 * Parameter(s): OBJECT - Player that is revived
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

//--- Get Plaer Back To Normal
[player, ""] remoteExecCall ["life_fnc_animSync", 0];
[] call life_fnc_setupActions;
_unit setUnitLoadout XaFlaForo_bleeding_loadout;
6969 cutText["","PLAIN"]; 
life_action_inUse = false;
XaFlaForo_in_down_state = false;
XaFlaForo_Can_Suicide = true;
