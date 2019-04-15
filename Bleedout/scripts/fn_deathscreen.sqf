#define BLEEDOUTCtrl(ctrl) ((uiNamespace getVariable ["Life_Death_Screen",displayNull]) displayCtrl ctrl)
#define BLEEDOUTdisplay (uiNamespace getVariable ["Life_Death_Screen",displayNull])
/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Website: xaflaforo.co.uk
 * Rights: All Rights Reserved
 * Notice: You're not allowed to use this file without permission from the author!
 *
 * Filename: fn_deathscreen.sqf
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


//--- DEBUGGING
scriptName "XaFlaForo_fnc_deathscreen";
scopeName "main";
#define __filename "fn_deathscreen.sqf"

//--- Variables For Deathscreen
XaFlaForo_Blood = 0.00;
XaFlaForo_Can_Suicide = false;
XaFlaForo_forceBleedOut = false;
XaFlaForo_in_revive_state = false;

//--- Fetch Display
6969 cutRsc["Life_Death_Screen","PLAIN"];
BLEEDOUTCtrl(99533) ctrlSetText "RESPAWN NOT AVAILIABLE";

 //--- LOOP DEATHSCREEN
while {XaFlaForo_in_down_state} do
{
    if (XaFlaForo_in_revive_state) then
    {
        BLEEDOUTCtrl(99532) progressSetPosition XaFlaForo_Revive;
        XaFlaForo_Revive = XaFlaForo_Revive + 0.01;
        BLEEDOUTCtrl(99533) ctrlSetText "YOU ARE BEING REVIVED";
        BLEEDOUTCtrl(99532)  ctrlSetTextColor [0, 0.67, 0.14, 1];
        sleep 0.05;
          if (XaFlaForo_Revive >= 0.99) then
          {
            [player, ""] remoteExecCall ["life_fnc_animSync", 0];
            [] call life_fnc_setupActions;
            player setUnitLoadout XaFlaForo_bleeding_loadout;
            6969 cutText["","PLAIN"];
            life_action_inUse = false;
            XaFlaForo_in_down_state = false;
            XaFlaForo_Can_Suicide = true;
          };
    }
    else
    {
      //--- Control Progress Bar
      BLEEDOUTCtrl(99532) progressSetPosition (1 - (damage player));
      BLEEDOUTCtrl(99532)  ctrlSetTextColor [0.69, 0.03, 0, 1];

     //--- Set damage
     player setDammage XaFlaForo_Blood;

     if (XaFlaForo_Blood >= 0.22) then {
         XaFlaForo_Can_Suicide = true;
         BLEEDOUTCtrl(99533) ctrlSetText "PRESS [0] TO RESPAWN";
     };

     if (XaFlaForo_forceBleedOut) then {
          player setDammage 1;
     };

     cutText ["playerHUD",""];

   };
};
