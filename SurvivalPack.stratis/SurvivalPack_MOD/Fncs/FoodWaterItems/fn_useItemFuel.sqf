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
	case "Fuel": {
		// exit if player is in a vehicle
		if (vehicle _player != _player) exitWith {
			systemChat sp_msg_player_is_in_vehicle;
		};
		
		// get nearest vehicles
		private _nearestVehicles = nearestObjects [getPosATL _player,["Car","Tank","Air","Ship","LandVehicle"], sp_refuelRange];
		
		// exit if there is no vehicle
		if (count _nearestVehicles == 0) exitWith {
			systemChat sp_msg_no_vehicles_nearby;
		};
		
		
		private _nearestVehicle =_nearestVehicles select 0;
		
		// if nearest vehicle already has max fuel
		if (fuel _nearestVehicle >= 1) exitWith {
			private _veh_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _nearestVehicle) >> "displayname");
			systemChat format [sp_msg_vehicle_has_max_fuel, _veh_displayName];
		};
		
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
		_itemObject setPos getPos _player;
		_itemObject setDir 0;
		_itemObject attachTo [_player, _itemObjectAttachOffset, "RightHand", _followBoneRotation];
		
		// rotate item object
		[_itemObject, _itemObjectRotation] call BIS_fnc_setObjectRotation;
		
		/*
		private _camView = cameraView;
		if (_camView != "EXTERNAL") then {
			titleText ["","BLACK OUT", 0.05];
			sleep 0.15;
			// switch to third person
			_player switchCamera "EXTERNAL";c
			titleText ["","BLACK IN", 0.08];
		};*/
		
		if (_canSoundEnabled) then {
			[_itemObject, sp_sound_canOpen, 10] call survivalpack_fnc_playSoundGlobal;
			/*
			//sp_sound_canOpen
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
		if (alive _player && (_player getVariable ["sp_inaction", false])) then {
		
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
				while {_player getVariable ["sp_inaction", false] && alive player && !isNull _itemObject} do {
					[_itemObject, _useSound, 5] call survivalpack_fnc_playSoundGlobal;
					sleep _soundDuration;
				};
				
				/*
				// if sound is still playing, stop sound
				if (count (soundParams _soundID) > 0) then {
					//stopSound _soundID;
					[_soundID] remoteExec ["stopSound", 0]; // not worknig fix this in the 2 files
				};*/
			};
			
			
			// wait until player completes consuming food/drink or player dies or player is no longer performing action or nearest vehicle goes away from player
			waitUntil {time >= (sp_inaction_completionTime+0.1) || !alive _player || !(_player getVariable ["sp_inaction", false]) || _nearestVehicle distance player > sp_refuelRange || !alive _nearestVehicle};
			
			// if vehicle is moved away from player or vehicle is destroyed
			if (_nearestVehicle distance player > sp_refuelRange || !alive _nearestVehicle) then {
				// set inaction to false
				_player setVariable ["sp_inaction", false];
			};
			
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
				
					if (!isNull _nearestVehicle) then {
						if (_nearestVehicle distance _player <= sp_refuelRange) then {
							if (alive _nearestVehicle) then {
								//_nearestVehicle setFuel 1;
								[_nearestVehicle, 1] remoteExec ["setFuel", 0];
								
								/*
								// add food+water script
								private _hunger = _player getVariable ["food", 0];
								private _water = _player getVariable ["water", 0];
								
								_hunger = _hunger + _itemFoodValue;
								_water = _water + _itemWaterValue;
								
								if (_hunger > 1) then {_hunger = 1};
								if (_water > 1) then {_water = 1};
								
								_player setVariable ["food", _hunger];
								_player setVariable ["water", _water];
								*/
								
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
							} else {
								systemChat sp_msg_refueling_vehicle_is_destroyed;
							};
						} else {
							systemChat sp_msg_refueling_vehicle_moved_away;
						};
					} else {
						systemChat sp_msg_refueling_vehicle_no_longer_exists;
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
		};
		*/
	};
	default {};
};



