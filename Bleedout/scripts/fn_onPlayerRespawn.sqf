/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Website: xaflaforo.co.uk
 * Rights: All Rights Reserved
 * Notice: You're not allowed to use this file without permission from the author
 *
 * Filename: fn_onPlayerRespawn.sqf
 *
 * Parameter(s): OBJECT - Player that is inacpacitated
 *
 * Description:
 * Function to be used when a unit respawns.
 *
 * Dependencies:
 * AsYetUntitled Framework, XaFlaForo Base Installation Pack
 *
 * Donate:
 * If you would like to donate to recieve products first, technical suppport and no advertising in the products donate below.
 * paypal.me/EthanSolutions
 */


//--- DEBUGGING
scriptName "XaFlaForo_fnc_onPlayerRespawn";
scopeName "main";
#define __filename "fn_onPlayerRespawn.sqf"

//--- Gather & Set Variables
private ["_unit","_corpse","_containers"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

if (!XaFlaForo_in_down_state) then
//--- Player has been killed (not yet entered bleeding out stage)
{
  //--- Unit Handlers
  _unit setPosATL (getPosATL _corpse);
  _unit setDir (getDir _corpse);

  if  !((vehicle _unit) isEqualTo _unit) then {
      UnAssignVehicle _unit;
      _unit action ["getOut", vehicle _unit];
      _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
  };

  _unit setUnitLoadout XaFlaForo_bleeding_loadout;
  removeAllWeapons _unit;


  //--- Anim State Change
  [_unit, "acts_InjuredLyingRifle01"] remoteExecCall ["life_fnc_animSync", 0];
  deleteVehicle life_corpse;

  disableSerialization;


  //--- Init Death screenshot
  [_unit] spawn XaFlaForo_fnc_deathscreen;

  //--- Revive effects
  [] spawn XaFlaForo_fnc_bleedoutEffects;

  //--- Change Variables
  XaFlaForo_in_down_state = true;

  //--- Medic XaFlaForo_fnc_handleMedicRequest
  [] remoteExec XaFlaForo_fnc_handleMedicRequest;

}
//--- Player has been killed (already was in bleeding out stage)
else
{

  //--- Set variables on.
  _unit setVariable ["restrained",false,true];
  _unit setVariable ["Escorting",false,true];
  _unit setVariable ["transporting",false,true];
  _unit setVariable ["playerSurrender",false,true];
  _unit setVariable ["steam64id",getPlayerUID player,true]; //Reset the UID.
  _unit setVariable ["realname",profileName,true]; //Reset the players name.

  //--- Change & Fix Anim Points
  [_unit, ""] remoteExecCall ["life_fnc_animSync", 0];
  player playMoveNow "AmovPpneMstpSrasWrflDnon";
  XaFlaForo_Can_Suicide = true;

  //--- Setup Actions
  [] call life_fnc_setupActions;
  deleteMarker "Dead Player";
  deleteVehicle life_corpse;
  6969 cutText["Thanks For Using Death Screen By XaFlaForo - To remove this notice please donate £0.99 to XaFlaForo","PLAIN"];

  //--- Reset Client Variables
  life_action_inUse = false;
  XaFlaForo_in_down_state = false;
  life_hunger = 100;
  life_thirst = 100;
  life_carryWeight = 0;
  life_cash = 0;
  life_is_alive = false;

  //--- Call Database
  [0] call SOCK_fnc_updatePartial;
  [3] call SOCK_fnc_updatePartial;
  [4] call SOCK_fnc_updatePartial;

  //--- Revive effects
  [] spawn XaFlaForo_fnc_bleedoutEffects;

  //--- Load Spawn Menu
  [] call life_fnc_spawnmenu;

  (findDisplay 73001) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {false}"];

};
