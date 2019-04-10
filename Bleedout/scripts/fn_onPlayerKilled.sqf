/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Development Studios, 2019
 * Rights: All Rights Reserved
 *
 * Filename: fn_onPlayerKilled.sqf
 *
 * Parameter(s): OBJECT - Player that is inacpacitated
 *               OBJECT - Player that is the killer
 *
 * Description:
 * Function to be used when a unit gets incapacitated and act accordingly.
 *
 * Dependencies:
 * AsYetUntitled Framework, XaFlaForo Base Installation Pack
 */

//--- DEBUGGING
scriptName "XaFlaForo_fnc_onPlayerKilled";
scopeName "main";

//--- Gather & Set Parameters
params [
    ["_unit",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];

if (!XaFlaForo_in_down_state) then
//--- Player has been killed (already was in bleeding out stage)
{
    //--- Make the killer wanted
    if (!isNull _killer && {!(_killer isEqualTo _unit)} && {!(side _killer isEqualTo west)} && {alive _killer}) then {
        if (vehicle _killer isKindOf "LandVehicle") then
        {
              [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["life_fnc_wantedAdd",2];
        }
        else
        {
              [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["life_fnc_wantedAdd",2];
        };
    };

  //--- Save Loadout
  XaFlaForo_bleeding_loadout = getUnitLoadout _unit;

  //--- Check if unit was killed by blufor
  if (side _killer isEqualTo west && !(playerSide isEqualTo west)) then
  {
      life_copRecieve = _killer;
  };

  //--- Check if player was wanted
  if (!isNull _killer && {!(_killer isEqualTo _unit)}) then
  {
      life_removeWanted = true;
  };

  //--- Remove items for good measure
  [_unit] call life_fnc_dropItems;

  _unit setVariable ["incapacitated", false, true];

}
//--- Player has been killed (not yet entered bleeding out stage)
else
{

  //--- Close Any Dialogs
  if (dialog) then {
    closeDialog 0;
  };

  //--- Set incapacitated status
  _unit setVariable ["incapacitated", true, true];

};
