params ["_actionDuration",["_actionTxt", ""],["_animation", ""],["_animation_loopDelay", -1],["_forceThirdPerson", false]];

private _rr = false;

// if player is already performing an action
if ((player getVariable ["sp_inaction", false])) exitWith {
	systemChat sp_msg_alreadyInAction;
	_rr
};

// set completion time & duration & text & force third person
sp_inaction_completionTime = time + _actionDuration;
sp_inaction_completionDuration = _actionDuration;
sp_inaction_txt = _actionTxt;
sp_inaction_thirdPersonForced = _forceThirdPerson;

// set inaction as true
player setVariable ["sp_inaction", true];

// create dialog
9999 cutRsc ["sp_inaction_dialog", "PLAIN"];


private _cancel_action = player addAction ["Cancel Action",{
	player setVariable ["sp_inaction", false];
}];
player setVariable ["sp_cancelaction_id", _cancel_action];
_rr = true;
_rr
