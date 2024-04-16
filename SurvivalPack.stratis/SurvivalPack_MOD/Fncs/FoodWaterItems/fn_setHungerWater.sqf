params ["_player",["_foodValue", 1], ["_waterValue", -1]];

// remote exec for player
[[_player, _foodValue, _waterValue],{
	// get params
	params ["_player", "_foodValue","_waterValue"];
	
	// set new food & water value
	if (_foodValue != -1) then {
		_player setVariable ["food", _foodValue];
	};
	if (_waterValue != -1) then {
		_player setVariable ["water", _waterValue];
	};
	
}] remoteExecCall ["bis_fnc_call", _player];
