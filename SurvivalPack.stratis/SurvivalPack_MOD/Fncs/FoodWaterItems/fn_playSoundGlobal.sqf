params ["_sourceObject","_soundName",["_maxDistance", 30],["_pitch", 1]];

[[_sourceObject, _soundName, _maxDistance, _pitch],{
	params ["_sourceObject","_soundName",["_maxDistance", 30],["_pitch", 1]];
	
	_sourceObject say [_soundName, _maxDistance, _pitch];
}] remoteExec ["bis_fnc_call", 0];