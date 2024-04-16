params ["_display"];

uiNamespace setVariable ["sp_ui_stats", _display];
[_display] spawn {
	_display =_this select 0;
	
	private _ctrl_food = _display displayCtrl 1100;
	private _ctrl_water = _display displayCtrl 1101;
	
	private _str_percentage = "%";
	
	while {!isNull _display} do {
		private _food = round((player getVariable ["food", 1]) * 100);
		private _water = round((player getVariable ["water", 1]) * 100);
		
		_ctrl_food ctrlSetStructuredText parseText (format [sp_txt_stats_hunger, _food, _str_percentage]);
		_ctrl_water ctrlSetStructuredText parseText (format [sp_txt_stats_water, _water, _str_percentage]);

		sleep 0.5;
	};
};