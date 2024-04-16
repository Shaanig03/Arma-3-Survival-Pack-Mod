params ["_display"];

uiNameSpace setVariable ["sp_ui_inaction", _display];


// get progress bar
private _ctrl_progerssBar = _display displayCtrl 2200;





// cancel button
_ctrl_btn_cancelAction = _display displayCtrl 1600;
_ctrl_btn_cancelAction ctrlAddEventHandler ["ButtonDown",{

	// set inaction to false
	player setVariable ["sp_inaction", false];
	player setVariable ["sp_inaction_completed", false];
	
	// close inaction dialog
	private _inaction_ui = uiNamespace getVariable ["sp_ui_inaction", objNull];
	if (!isNull _ui) then {
		_inaction_ui closeDisplay 1;
	};
	
}];

[_display] spawn {
	_display =_this select 0;
	
	
	// get progress bar
	_ctrl_progerssBar = _display displayCtrl 2200;
	
	// get text control
	private _ctrl_txt = _display displayCtrl 1100;
	
	// get completion time & get completion duration & text
	private _completionTime = sp_inaction_completionTime;
	private _completionDuration = sp_inaction_completionDuration;
	private _inaction_txt = sp_inaction_txt;
	private _thirdPerson_forced = sp_inaction_thirdPersonForced;
	
	// get camera view
	private _camView = cameraView;
	
	if (_thirdPerson_forced) then {
		if (_camView != "EXTERNAL") then {
			titleText ["","BLACK OUT", 0.05];
			sleep 0.15;
			// switch to third person
			player switchCamera "EXTERNAL";
			titleText ["","BLACK IN", 0.08];
		};
	};
	
	
	// while display exists
	while {!isNull _display} do {
		// exit if player is no longer in action
		private _inaction = player getVariable ["sp_inaction", false];
		if (!_inaction) exitWith {};
		
		// exit if player is dead 
		if (!alive player) exitWith {};
		
		// get progress
		private _progress = _completionTime - time;
		
		// set progress bar value
		private _progressValue = [_completionDuration, 0, 0, 1, _progress] call survivalpack_fnc_convertRange;
		_ctrl_progerssBar progressSetPosition _progressValue;
		
		private _txtformat = format ["<t  align='center'>%1 %2%3</t>", _inaction_txt, round(_progressValue * 100), "%"];
		_ctrl_txt ctrlSetStructuredText parseText _txtformat;
		
		if (_progressValue >= 1) exitWith {
			player setVariable ["sp_inaction_completed", true];
		};

		// update progress bar
		
		
		sleep 0.005;
	};
	
	if (!isNull _display) then {
		_display closeDisplay 0;
	};
	
	player setVariable ["sp_inaction", false];
	player removeAction (player getVariable "sp_cancelaction_id");
	
	// if third person is forced
	if (_thirdPerson_forced) then {
		// previous camera view wasn't third person then change it back
		if (_camView != "EXTERNAL") then {
			player switchCamera _camView;
		};
	};
};	

/*
params ["_display"];



// get progress bar
_ctrl_progerssBar = _display displayCtrl 2200;

// get text control
_ctrl_txt = _display displayCtrl 1100;

// get completion time 
_completionTime = player getVariable ["sb_inaction_completionTime", 0];
_inaction_txt = player getVariable ["sb_inaction_txt", ""];

// get the completion delay
_completionDelay = _completionTime - time;

// cancel button
_ctrl_btn_cancelAction = _display displayCtrl 1600;
_ctrl_btn_cancelAction ctrlAddEventHandler ["ButtonDown",{

	// set sb_inaction to false
	player setVariable ["sb_inaction", false, true];
	
	// close inaction dialog
	_inaction_ui = uiNamespace getVariable ["ui_sb_inaction", objNull];
	if (!isNull _ui) then {
		_inaction_ui closeDisplay 1;
	};
	
}];

while {!isNull _display} do {
	// if player is not inaction, exit
	_sb_inaction = player getVariable ["sb_inaction", false];
	if (!_sb_inaction) exitWith {_display closeDisplay 0};
	
	// exit dialog if player dies
	if (!alive player) exitWith {_display closeDisplay 0};
	
	// get progress
	_progress = _completionTime - time;
	
	// set progress bar value
	_progressValue = [_completionDelay, 0, 0, 1, _progress] call extra_fnc_convertRange;
	_ctrl_progerssBar progressSetPosition _progressValue;
	
	// set text
	_txtformat = format ["<t  align='center'>%1 %2%3</t>", _inaction_txt, round(_progressValue * 100), "%"];
	_ctrl_txt ctrlSetStructuredText parseText _txtformat;
	
	// if progress reaches 100
	if (_progressValue >= 1) exitWith {player setVariable ["sb_inaction_completed", true, true]; player setVariable ["sb_inaction", false, true]; _display closeDisplay 0};
	sleep 0.01;
};


*/