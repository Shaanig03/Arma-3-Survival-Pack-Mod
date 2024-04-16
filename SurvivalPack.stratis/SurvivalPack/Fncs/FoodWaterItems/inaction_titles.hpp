class RscTitles
{
	class sp_inaction_dialog
	{
		idd = -1;
		duration = 1e+1000;
		onLoad = "[_this select 0] call survivalpack_fnc_ui_inaction_onLoad";
		onUnload = "";
		
		class controls
		{
			class UI_InAction_ProgressBar: SPCtrl_RscProgress
			{
				idc = 2200;
				x = 0.180053 * safezoneW + safezoneX;
				y = 0.755012 * safezoneH + safezoneY;
				w = 0.639894 * safezoneW;
				h = 0.0340016 * safezoneH;
			};
			class UI_InAction_Txt: SPCtrl_RscStructuredText
			{
				idc = 1100;
				x = 0.180053 * safezoneW + safezoneX;
				y = 0.761011 * safezoneH + safezoneY;
				w = 0.639894 * safezoneW;
				h = 0.0340016 * safezoneH;
			};
			/*
			class UI_InAction_Btn_CancelAction: SPCtrl_RscButton
			{
				idc = 1600;
				text = "Cancel Action"; //--- ToDo: Localize;
				x = 0.420013 * safezoneW + safezoneX;
				y = 0.806014 * safezoneH + safezoneY;
				w = 0.143976 * safezoneW;
				h = 0.0340016 * safezoneH;
			};*/
		};
	};
	
	class sp_stats_dialog
	{
		idd = -1;
		duration = 1e+1000;
		onLoad = "[_this select 0] call survivalpack_fnc_ui_stats_onLoad";
		onUnload = "";
		
		class controls
		{

			class sp_stats_food: SPCtrl_RscStructuredText
			{
				idc = 1100;
				x = 0.00499997 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.113437 * safezoneW;
				h = 0.033 * safezoneH;
			};
			class sp_stats_water: SPCtrl_RscStructuredText
			{
				idc = 1101;
				x = 0.00499997 * safezoneW + safezoneX;
				y = 0.951 * safezoneH + safezoneY;
				w = 0.113437 * safezoneW;
				h = 0.033 * safezoneH;
			};

		};
	};
};

