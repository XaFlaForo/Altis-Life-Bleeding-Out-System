
#define BleedoutDefine(ctrl) ((uiNamespace getVariable ["Life_Death_Screen",displayNull]) displayCtrl ctrl)
#define BLEEDOUTdisplay (uiNamespace getVariable ["Life_Death_Screen",displayNull])
class Life_Death_Screen {
  idd = 73001;
  duration = 10e10;
  movingEnable = 0;
  name = "Life_Death_Screen";
  onLoad = "uiNamespace setVariable ['Life_Death_Screen', _this select 0]";
  onUnload = "uiNamespace setVariable ['Life_Death_Screen', objNull]";
  onDestroy = "uiNamespace setVariable ['Life_Death_Screen', objNull]";

    class controlsBackground {
        class RscDisplayBackground: life_RscText {
            idc = -1;
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
            colorBackground[] = { 0.3, 0.3, 0.3, 0.5 };
        };
    };
    class Controls {
        class Background: Life_RscText {
        	idc = -1;
        	x = safeZoneX + safeZoneW * 0;
        	y = safeZoneY + safeZoneH * 0.84555556;
        	w = safeZoneW * 1.005625;
        	h = safeZoneH * 0.11777778;
        	colorBackground[] = {0.2,0.2,0.2,1};
        };
        class Title: Life_RscText {
        	idc = -1;
        	text = "BLEEDING OUT";
        	x = safeZoneX + safeZoneW * 0.439375;
        	y = safeZoneY + safeZoneH * 0.84111112;
        	w = safeZoneW * 0.273125;
        	h = safeZoneH * 0.05444445;
          font = "PuristaMedium";
          shadow = 0;
        };
        class Title_Sub: Life_RscText {
        	idc = 99533;
        	text = "RESPAWN NOT AVAILAIBLE";
        	x = safeZoneX + safeZoneW * 0.4175;
        	y = safeZoneY + safeZoneH * 0.91444445;
        	w = safeZoneW * 0.273125;
        	h = safeZoneH * 0.05444445;
          font = "PuristaMedium";
          shadow = 0;
        };
        class ProgressBackground: Life_RscText {
        	idc = -1;
        	x = safeZoneX + safeZoneW * 0.2925;
        	y = safeZoneY + safeZoneH * 0.88777778;
        	w = safeZoneW * 0.414375;
        	h = safeZoneH * 0.03555556;
        	colorBackground[] = {0.15,0.15,0.15,1};
        };
        class Progress: Life_RscProgress {
        	idc = 99532;
          x = safeZoneX + safeZoneW * 0.2925;
        	y = safeZoneY + safeZoneH * 0.88777778;
        	w = safeZoneW * 0.414375;
        	h = safeZoneH * 0.03555556;
          colorBar[] = {0.69,0.03,0,1};
          colorFrame[] = {0,0,0,0};
        };
    };
};
