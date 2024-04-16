params ["_player","_itemClass","_container","_itemInfo"];


_itemInfo params ["_itemType","_itemUseCode","_itemParams"];


/*
"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0.65, // food value 
			0, // water value
			"Land_TacticalBacon_F" // display object
		]
*/

switch (_itemType) do {
	case "Food": {
		_itemParams params ["_itemFoodValue","_itemWaterValue","_itemDisplayObjectClass","_itemObjectAttachOffset","_consumingDuration","_itemObjectRotation",["_followBoneRotation", false],["_consumeAnimations", ["sp_anim_start_eating","sp_anim_eating","sp_anim_end_eating"]],["_action_txt", sp_txt_eating],["_useSound", sp_sound_eating],["_emptyItemClass", ""],["_canSoundEnabled", false]];
		
		// get item display name
		private _item_displayName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayname");
		
		// get first person enabled
		private _first_person_enabled = sp_firstPersonEnabled;
		private _thirdperson_forced = true;
		
		// if first person is enabled disable third person
		if (_first_person_enabled) then {
			_thirdperson_forced = false;
		};
		
		// start action 
		private _actionStarted = [_consumingDuration, (format [_action_txt, _item_displayName]), "", -1, _thirdperson_forced] call survivalpack_fnc_startAction;
		
		// if player was already performing an action
		if (!_actionStarted) exitWith {};
		
		// create item object
		private _itemObject = _itemDisplayObjectClass createVehicle (getPos player);
		
		// to delete the object if the player is dead or disconnects while using item
		[[_itemObject, _player],{
			params ["_itemObject","_player"];
			[_itemObject, _player] spawn survivalpack_fnc_tempObject;
		}] remoteExec ["bis_fnc_call", 2];
		
		_itemObject setPos getPos _player;
		_itemObject setDir 0;
		_itemObject attachTo [_player, _itemObjectAttachOffset, "RightHand", _followBoneRotation];
		
		// rotate item object
		[_itemObject, _itemObjectRotation] call BIS_fnc_setObjectRotation;
		
		
		
		if (_canSoundEnabled) then {
			//sp_sound_canOpen
			[_itemObject, sp_sound_canOpen, 10] call survivalpack_fnc_playSoundGlobal;
			/*
			playSound3D  
			 [ 
				 sp_sound_canOpen,   
				 _player,  
				 false,  
				 _player,  
				 1,  
				 1,  
				 30 
			 ];*/
		};
		
		// eating animation
		if (vehicle _player == _player) then {[_player, (_consumeAnimations select 0)] remoteExec ["switchMove", 0];};
		
		// wait until starting animation completes or player is dead or player cancels action
		waitUntil {moveTime _player >= 1 || !alive _player || !(_player getVariable ["sp_inaction", false])};
		
		// if player is alive && in action
		if (alive _player) then { //if (alive _player && (_player getVariable ["sp_inaction", false])) then {
		
			// play eating animation looping
			if (vehicle _player == _player) then {[_player, (_consumeAnimations select 1)] remoteExec ["switchMove", 0];};
			
			// play eating sound
			[_player, _useSound, _itemObject] spawn {
				private _player =_this select 0;
				private _useSound =_this select 1;
				private _itemObject =_this select 2;
				
				private _soundID = -1;
				
				
				private _soundDuration = getNumber (configfile >> "CfgSounds" >> _useSound >> "soundDuration");
				if (_soundDuration == 0) then {
					_soundDuration = 5;
				};
				
				// while player is in action && alive player
				while {(_player getVariable ["sp_inaction", false]) && alive _player && !isNull _itemObject} do {
				 
				    [_itemObject, _useSound, 5] call survivalpack_fnc_playSoundGlobal;
 
					sleep _soundDuration;
				};
				
				
			};
			
			
			// wait until player completes consuming food/drink
			waitUntil {time >= (sp_inaction_completionTime+0.1) || !alive _player || !(_player getVariable ["sp_inaction", false])};
			
			if (!isNull _itemObject) then { deleteVehicle _itemObject};
			
			// if player is alive && action is completed
			if (alive _player && _player getVariable ["sp_inaction_completed", false]) then {
				// play end animation
				if (vehicle _player == _player) then {[_player, (_consumeAnimations select 2)] remoteExec ["switchMove", 0];};
				
				// reset inaction completed to false
				_player setVariable ["sp_inaction_completed", false];
			
				// get item cargo to retrieve food item
				private _itemFound = false;
				private _itemCargo = [];
					
				if (_container == "u") then {
					_itemCargo = itemCargo (uniformContainer _player);
				} else {
					if (_container == "v") then {
						_itemCargo = itemCargo (vestContainer _player);
					} else {
						if (_container == "b") then {
							_itemCargo = itemCargo (backpackContainer _player);
						};
					};
				};
					
				// if item still exists
				if (_itemClass in _itemCargo) then {
				
					// add food+water script
					private _hunger = _player getVariable ["food", 0];
					private _water = _player getVariable ["water", 0];
					
					_hunger = _hunger + _itemFoodValue;
					_water = _water + _itemWaterValue;
					
					if (_hunger > 1) then {_hunger = 1};
					if (_water > 1) then {_water = 1};
					
					_player setVariable ["food", _hunger];
					_player setVariable ["water", _water];
					
					private _emptyItemClassFound = false;
					
					if (_emptyItemClass != "") then {_emptyItemClassFound = true};
					
					if (_container == "u") then {
							_player removeItemFromUniform _itemClass;
							
							if (_emptyItemClassFound) then {
								_player addItemToUniform _emptyItemClass;
							};
							
						} else {
							if (_container == "v") then {
								_player removeItemFromVest _itemClass;
								
								if (_emptyItemClassFound) then {
									_player addItemToVest _emptyItemClass;
								};
								
							} else {
								if (_container == "b") then {
									_player removeItemFromBackpack _itemClass;
									
									if (_emptyItemClassFound) then {
										_player addItemToBackpack _emptyItemClass;
									};
									
								};
							};
						};
					};
				
				 
				
				
				
				waitUntil {moveTime _player >= 1 || !alive _player};
				
				// reset animation
				if (alive _player) then {
					if (vehicle _player == _player) then {[_player, ""] remoteExec ["switchMove", 0];};
				};
			};
		};
		
		if (!isNull _itemObject) then { deleteVehicle _itemObject};
		if (alive _player) then {
			if (vehicle _player == _player) then {[_player, ""] remoteExec ["switchMove", 0];};
		};
		
		/*
		if (_camView != "EXTERNAL") then {
			player switchCamera _camView;
		};*/
		
	};
	default {};
};



