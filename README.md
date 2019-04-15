# <CENTER>XaFlaForo Studios - Bleeding Out System

<h3 align="center">Arma Script (Base Installation Pack)</h3>

## Dependencies
- AsYetUntitled (You need to get the framework yourself at the repo at the following url: https://www.altisliferpg.com/forum/8-altis-life-rpg-official-framework/)
- Base https://github.com/XaFlaForo/AltisLifeScripts/tree/Base-Installation-Pack

## Donate
paypal.me/EthanSolutions

## Copyright and License

Copyright (c) 2019 Ethan (XaFlaForo), XaFlaForo Studios.

## ALL CODE IS LICENSED UNDER Attribution-NonCommercial-ShareAlike CC BY-NC-SA
This license lets others remix, tweak, and build upon your work non-commercially, as long as they credit you and license their new creations under the identical terms.
    <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/)"><img src="https://licensebuttons.net/l/by-nc-sa/3.0/88x31.png" /></a>

## Installation
How to install:

STEP 1: Move the bleedout folder to XaFlaForo FolderSTEP 2: Add the following code to Config_Functions.hpp Under tag = "XaFlaForo";
 

#include "Bleedout\functions.hpp"

STEP 4: Add the following code to description.ext under RscTitles 
 

#include "XaFlaForo\Bleedout\Dialogs\RscDisplayBleedingOut.hpp"
STEP 5: Add the following code to initPlayerLocal.sqf

//--- XaFlaForo Bleeding Out Init
XaFlaForo_Revive = 0;
XaFlaForo_in_revive_state = false;
XaFlaForo_Blood = 0.00;
XaFlaForo_Can_Suicide = true;
XaFlaForo_in_down_state = false;
while {true} do 
{

  //--- SLEEP LITTLE BABY
  uiSleep 2;

  //--- Apply Damage To Player
  XaFlaForo_Blood = XaFlaForo_Blood + 0.01;
};
STEP 6: Add the following code to handleDamage.sqf at the top 

XaFlaForo_Blood = XaFlaForo_Blood + 0.02;

if (XaFlaForo_in_revive_state ) then 
{
    XaFlaForo_in_revive_state = false;
    XaFlaForo_Blood = 0;
};
STEP 7: Add the following code to handleDamage.sqf at the top

if ( !XaFlaForo_Can_Suicide ) exitWith{};
STEP 8: Add the following code to handleDamage.sqf under case 57

case 11: {
    if (XaFlaForo_Can_Suicide) then {
          XaFlaForo_forceBleedOut = true;
    };
};
STEP 9: Remove the following code to fn_setupEVH.sqf
 

player addEventHandler ["Killed", {_this call life_fnc_onPlayerKilled}];
player addEventHandler ["Respawn", {_this call life_fnc_onPlayerRespawn}];
STEP 10: Add the following code to fn_setupEVH.sqf
 

player addEventHandler ["Killed", {_this call XaFlaForo_fnc_onPlayerKilled}];
player addEventHandler ["Respawn", {_this call XaFlaForo_fnc_onPlayerRespawn}];
player addEventHandler ["HandleHeal", {_this call XaFlaForo_fnc_onRevive}];
﻿ STEP 11: Remove deathscreen.hpp from masterhandler.hpp



