




if (XaFlaForo_in_down_state) then {
	    //--- Create PP effects
	    if (isNil "XaFlaForo_Bleedout_Effect_ppColor") then
      {
          XaFlaForo_Bleedout_Effect_ppColor = ppEffectCreate ["ColorCorrections", 1630]
      };
	    if (isNil "XaFlaForo_Bleedout_Effect_ppBlur") then
      {
          XaFlaForo_Bleedout_Effect_ppBlur = ppEffectCreate ["DynamicBlur", 520]
      };
	    if (isNil "XaFlaForo_Bleedout_Effect_ppAber") then
      {
          XaFlaForo_Bleedout_Effect_ppAber = ppEffectCreate ["ChromAberration", 120]
      };

	     //--- Adjust PP effects
	     XaFlaForo_Bleedout_Effect_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
	     XaFlaForo_Bleedout_Effect_ppBlur ppEffectAdjust [3];
	     XaFlaForo_Bleedout_Effect_ppAber ppEffectAdjust [0.01, 0.01, true];

	     //--- Commit and enable PP effects
	    {_x ppEffectCommit 0; _x ppEffectEnable true} forEach [
          XaFlaForo_Bleedout_Effect_ppColor, XaFlaForo_Bleedout_Effect_ppBlur, XaFlaForo_Bleedout_Effect_ppAber
      ];
  }
  else
  {
	    //--- Disable PP effects
	    {_x ppEffectEnable false} forEach [
            XaFlaForo_Bleedout_Effect_ppColor, XaFlaForo_Bleedout_Effect_ppBlur, XaFlaForo_Bleedout_Effect_ppAber
      ];
};
