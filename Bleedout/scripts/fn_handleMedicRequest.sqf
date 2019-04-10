/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Website: xaflaforo.co.uk
 * Rights: All Rights Reserved
 * Notice: You're not allowed to use this file without permission from the author!
 *
 * Filename: fn_deathscreen.sqf
 *
 * Parameter(s): OBJECT: Player that is incapacitatedState
 *               STRING: Marker on map
 *
 * Description:
 * Function to be used to handle notifcations to medics.
 *
 * Dependencies:
 * AsYetUntitled Framework, XaFlaForo Base Installation Pack
 *
 * Donate:
 * If you would like to donate to recieve products first, technical suppport  and no advertising in the products donate below.
 * paypal.me/EthanSolutions
 */

//--- Params
params ["_unit"];

//--- Not a medic
if !(playerSide isEqualTo independent) exitWith {};

//--- Hint
["TaskAssigned",["","Revive Player On Map"]] call BIS_fnc_showNotification;
