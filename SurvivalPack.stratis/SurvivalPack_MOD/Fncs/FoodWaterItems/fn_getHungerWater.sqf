params ["_player"];

private _clientOwner = clientOwner;

// remote exec for target player
[[_player, _clientOwner],{
	params ["_player","_clientOwner"];
	
	// get (target player) food & water
	private _food = _player getVariable ["food", 0];
	private _water = _player getVariable ["water", 0];
	
	// send it over to the client owner 
	[[_food, _water, _player],{
		params ["_retrieved_food","_retrieved_water","_retrieved_player"];
		
		sp_recievedpacketvar_food = _retrieved_food;
		sp_recievedpacketvar_water = _retrieved_water;
		sp_recievedpacketvar_player = _retrieved_player;
		
	}] remoteExec ["bis_fnc_call", _clientOwner];
	
}] remoteExec ["bis_fnc_call", _player];

/* 
	doesn't directly return the player food and water value but the target player's food and water values are returned and stored in "sp_recievedpacketvar_food", "sp_recievedpacketvar_water"
*/

/*

params ["_targetPlayer"];

// remoteExec for player
[[_targetPlayer, clientOwner],{
	params ["_targetPlayer","_remoteExecCallerID"];
	
	// get food & water
	private _food = _targetPlayer getVariable ["food", 0];
	private _water = _targetPlayer getVariable ["water", 0];
	
	[[_food, _water],{
	
	
	}] remoteExec ["bis_fnc_call", _remoteExecCallerID];
	
}] remoteExec ["bis_fnc_call", _targetPlayer];
*/

/*
// create a packet id
if (isNil "sp_local_hungerwater_packetID") then {
	sp_local_hungerwater_packetID = 0;
};
sp_local_hungerwater_packetID = sp_local_hungerwater_packetID + 0.01;

private _packetName = format ["sp_hw_packet%1", sp_local_hungerwater_packetID];
private _clientOwner = clientOwner;

[[_packetName, _clientOwner],{
	params ["_packetName","_clientOwner"];
	
	

}] remoteExec ["bis_fnc_call", _player];
*/

/*
[[_player],{
	params ["_player"];
	
	// store variables 
	_player setVariable ["food", _player getVariable "food", true];
	_player setVariable ["water", _player getVariable "water", true];
}] remoteExecCall ["bis_fnc_call", _player];


private _return = [_player getVariable ["food", -1], _player getVariable ["water", -1]];
_return*/