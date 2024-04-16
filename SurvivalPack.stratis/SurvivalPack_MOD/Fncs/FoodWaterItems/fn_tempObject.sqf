params ["_tempObject","_player"];

// while object temporary object exists
while {!isNull _tempObject} do {
	
	// if player disconnects or player is dead
	if (!isPlayer _player || !alive _player) then {
		// delete object
		deleteVehicle _tempObject;
	};
	sleep 1;
};
