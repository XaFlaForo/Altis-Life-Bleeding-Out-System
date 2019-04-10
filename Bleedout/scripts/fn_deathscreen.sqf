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

//--- PASS UNIT PARAM
params ["_unit", "_display"];

//--- Variables For Deathscreen
XaFlaForo_Blood = 0.00;
XaFlaForo_Can_Suicide = false;
XaFlaForo_forceBleedOut = false;
XaFlaForo_Medic_Distance = if (([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Yes"} else {"No"};

//--- Remove The Hud
[] call life_fnc_hudUpdate;

//--- Fetch Display
6969 cutRsc["Life_Death_Screen","PLAIN"];
BLEEDOUTCtrl(99533) ctrlSetText "RESPAWN NOT AVAILIABLE";
(uiNamespace getVariable ["Life_Death_Screen",displayNull]) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"]; //Block the ESC menu


 //--- LOOP DEATHSCREEN
while {XaFlaForo_in_down_state} do {

      //--- Control Progress Bar
      BLEEDOUTCtrl(99532) progressSetPosition (1 - (damage player));


     //--- Set damage
     _unit setDammage XaFlaForo_Blood;

     if (XaFlaForo_Blood >= 0.22) then {
         XaFlaForo_Can_Suicide = true;
         BLEEDOUTCtrl(99533) ctrlSetText "PRESS [0] TO RESPAWN";
     };

     if (XaFlaForo_forceBleedOut) then {
          _unit setDammage 1;
     };

};
