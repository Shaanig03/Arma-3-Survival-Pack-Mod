// get player
params [["_player", objNull]];
if (isNull _player) then {_player = player};

// wait until player initializes
waitUntil {!isNull _player && _player == _player};

// survival init
private _survivalInit = {
	_player =_this select 0;
	
	
	if (sp_refill_waterbottles_enabled) then {
		[_player] spawn {
			params ["_player"];
			
			sp_cond_refill_waterbottles_action = false;
			
			_player addAction [sp_txt_action_refilling_from_waterpump,{
				params ["_player"];
				
				// adding water item classes
				private _adding_bottles_with_water = [];
				
				// get player items
				private _items = items _player;
				
				// loop through each empty water item
				{
					// get empty canister & and it's index
					private _x_empty_waterItem = _x;
					private _x_itemIndex = _forEachIndex;
						
					// count items
					{
						// if looping player item is a empty canister
						if (_x == _x_empty_waterItem) then {
							_adding_bottles_with_water = _adding_bottles_with_water + [sp_water_items select _x_itemIndex];
						};
					} count _items;
				} forEach sp_water_items_empty;	
				
				// remove all empty water items
				{
					_player removeItems _x;
				} forEach sp_water_items_empty;
				
				// add refilled water bottles & canteens
				{
					_player addItem _x;
				} forEach _adding_bottles_with_water;
				
				
				// get refueled canister count
				private _c = count _adding_bottles_with_water;
					
				// if any canister was refueled
				if (_c > 0) then {
					systemChat format [sp_msg_refill_waterpump, _c]; 
					
					// play sound
					[_player, sp_sound_refill_waterpump, 5] call survivalpack_fnc_playSoundGlobal;
						
					// reset condition
					sp_cond_refill_waterbottles_action = false;
				};
					
				
			},[],12,true,true,"","alive _target && sp_refill_waterbottles_enabled && sp_cond_refill_waterbottles_action"];
			
			
			while {alive _player} do {
					// get player items 
					private _items = items _player;
					
					// loop through each player item and check if player has any empty bottle that can be refilled
					private _player_has_empty_bottles = false;
					{
						private _x_emptybottle_class = _x;
						if (_x_emptybottle_class in _items) exitWith {
							_player_has_empty_bottles = true;
						};
					} forEach sp_water_items_empty;
					
					// if player has empty canister
					if (_player_has_empty_bottles) then {
						// get nearby gas pumps
						private _waterPumps = nearestObjects [getPos _player, sp_waterpump_classes, sp_waterPump_searchRange];
						
						sp_cond_refill_waterbottles_action = ((count _waterPumps) > 0);
					
					} else {
						sp_cond_refill_waterbottles_action = false;
					};
					sleep 1.5;
				};
				
			};
	};
	
	
	// refill canister action (gas pump searcher)
	if (sp_refill_canisters_enabled) then {
	
		[_player] spawn {
			params ["_player"];
			
			sp_cond_refill_canister_action = false;
			
			_player addAction [sp_txt_action_refueling_from_gaspump,{
				params ["_player"];
				
				// adding canister classes
				private _adding_canisters_with_fuel = [];			
				
				// get player items
				private _items = items _player;
				
				
				// loop through each canister empty
				{
					// get empty canister & and it's index
					private _x_empty_canister = _x;
					private _x_canister_index = _forEachIndex;
					
					// count items
					{
						// if looping player item is a empty canister
						if (_x == _x_empty_canister) then {
							_adding_canisters_with_fuel = _adding_canisters_with_fuel + [sp_fuel_canisters select _x_canister_index];
						};
					} count _items;
				} forEach sp_fuel_canisters_empty;
				
				
				// remove all empty canisters
				{
					_player removeItems _x;
				} forEach sp_fuel_canisters_empty;
				
				// add refueled canisters
				{
					_player addItem _x;
				} forEach _adding_canisters_with_fuel;
				
				
				// get refueled canister count
				private _c = count _adding_canisters_with_fuel;
				
				// if any canister was refueled
				if (_c > 0) then {
					// display message
					if (_c > 1) then {
						systemChat format [sp_msg_refuel_gaspump, _c]; 
					} else {
						systemChat format [sp_msg_refuel_gaspump_one, _c]; 
					};
					
					// play sound
					[_player, sp_sound_refuel_gaspump, 5] call survivalpack_fnc_playSoundGlobal;
					
					// reset condition
					sp_cond_refill_canister_action = false;
				};
	
				
			},[],12,true,true,"","alive _target && sp_refill_canisters_enabled && sp_cond_refill_canister_action"];
				
			while {alive _player} do {
				// get player items 
				private _items = items _player;
				
				// loop through each player item and check if player has any empty canister
				private _player_has_empty_canister = false;
				{
					private _x_emptyCanister_class = _x;
					if (_x_emptyCanister_class in _items) exitWith {
						_player_has_empty_canister = true;
					};
				} forEach sp_fuel_canisters_empty;
				
				// if player has empty canister
				if (_player_has_empty_canister) then {
					// get nearby gas pumps
					private _gasPumps = nearestObjects [getPos _player, sp_gaspump_classes, sp_gasPump_searchRange];
					
					sp_cond_refill_canister_action = ((count _gasPumps) > 0);
				
				} else {
					sp_cond_refill_canister_action = false;
				};
				sleep 1.5;
			};
			
			
		};
		
	};
	
	// while player is alive
	[_player] spawn {
		_player =_this select 0;
		while {alive _player} do {
			// if stats ui is not displayed
			private _ui = uiNamespace getVariable ["sp_ui_stats", objNull];
			if (isNull _ui) then {
				// display stats ui
				9998 cutRsc ["sp_stats_dialog", "PLAIN"];
			};
			
			sleep 1;
		};
	};
	
	// player double click to use items 
	_player addEventHandler ["InventoryOpened",{
		[] spawn {
			// wait until ui is created
			waitUntil {!isNull (findDisplay 602)}; 
			
			// get inventory ui
			_display = (findDisplay 602);
			if (isNull _display) exitWith {};
			
			// get inventory listboxes
			private _lb_uniform = _display displayCtrl 633;
			private _lb_vest = _display displayCtrl 638;
			private _lb_backpack =_display displayCtrl 619;
			
			
			// event handler for double clicking an item from the inventory to use it
			_lb_uniform ctrlAddEventHandler ["MouseButtonDblClick",{
				// if player is already performing an action
				if ((player getVariable ["sp_inaction", false])) exitWith {
					systemChat sp_msg_alreadyInAction;
				};

				
				params ["_lb"];
				
				_item_index = lbCurSel _lb;
				
				if (_item_index != -1) then {
					// get clicked item class
					_itemClass = _lb lbData _item_index;
					[_itemClass, "u"] call survivalpack_fnc_doubleClickUseItem;
				};
				
			}];
			
			// event handler for double clicking an item from the inventory to use it
			_lb_vest ctrlAddEventHandler ["MouseButtonDblClick",{
				// if player is already performing an action
				if ((player getVariable ["sp_inaction", false])) exitWith {
					systemChat sp_msg_alreadyInAction;
				};
				
				params ["_lb"];
				
				_item_index = lbCurSel _lb;
				
				if (_item_index != -1) then {
					// get clicked item class
					_itemClass = _lb lbData _item_index;
					[_itemClass, "v"] call survivalpack_fnc_doubleClickUseItem;
				};

			}];
			
			// event handler for double clicking an item from the inventory to use it
			_lb_backpack ctrlAddEventHandler ["MouseButtonDblClick",{
				// if player is already performing an action
				if ((player getVariable ["sp_inaction", false])) exitWith {
					systemChat sp_msg_alreadyInAction;
				};
				
				params ["_lb"];
				
				_item_index = lbCurSel _lb;
				
				if (_item_index != -1) then {
					// get clicked item class
					_itemClass = _lb lbData _item_index;
					[_itemClass, "b"] call survivalpack_fnc_doubleClickUseItem;
				};

			}];
		
		};
	}];
	
	// player food & water drain script
	[_player] spawn {
		_player =_this select 0;
		
		
		
		
		// reset hunger & water when player dies
		_player addEventHandler ["Killed",{
			_player =_this select 0;
			
			private _starting_food_value = missionNamespace getVariable ["sp_startingFood_value", 1];
			private _starting_water_value = missionNamespace getVariable ["sp_startingWater_value", 1];
			
			_player setVariable ["food", _starting_food_value];
			_player setVariable ["water", _starting_water_value];
			
			// if player is in a survival pack animation
			if ((animationState _player) in sp_animations) then {
				// disable animation #testing
				[_player, ""] remoteExec ["switchMove", 0];
			};
		}];
		
		
		// while player is alive
		while {alive _player} do {
			// get food & water
			private _food = _player getVariable ["food", 1];
			private _water = _player getVariable ["water", 1];
			
		
			
			// drain food & water
			_food = _food - (0.00005 * sp_foodDrain_Multiplier);
			_water = _water - (0.00005 * sp_waterDrain_Multiplier);
			
			// if player is not in a vehicle
			private _veh = vehicle _player;
			if (_veh == player) then {
			
				// get player speed
				private _speed = speed _player;
				
				// drain food & water while moving
				if (_speed >= 14) then {
					_food = _food - 0.00005 *  sp_foodDrain_running_Multiplier;
					_water = _water - 0.00001 *  sp_waterDrain_running_Multiplier;
					
					if (_speed >= 16) then {
						_food = _food - 0.00003 *  sp_foodDrain_running_Multiplier;
						_water = _water - 0.00001 *  sp_waterDrain_running_Multiplier;
						

					};
				};
				
			};
			
			// get player damage
			private _dmg = damage _player;
			
			if (_dmg >= 0.4) then {
				// drain food & water while damaged
				_food = _food - 0.00005 *  sp_foodDrain_whileDamaged_Multiplier;
				_water = _water - 0.00001 *  sp_waterDrain_whileDamaged_Multiplier;
				
				if (_dmg >= 0.8) then {
					_food = _food - 0.00008 *  sp_foodDrain_whileDamaged_Multiplier;
					_water = _water - 0.0003 *  sp_waterDrain_whileDamaged_Multiplier;
				};
			};
			
			// update (locally)
			if (_food < 0) then {_food = 0};
			if (_water < 0) then {_water = 0};
			
			
			private _no_food = (_food <= 0);
			Private _no_water = (_water <= 0);
			
			
			// if player food or water zero
			if (_no_food || _no_water) then {
				// take damage
				_dmg = _dmg + sp_damage_thirsthunger;
				
				// show warning and add delays
				if (time >= sp_local_nextWarning_noFoodorWater) then {
					sp_local_nextWarning_noFoodorWater = time + sp_nowaterfood_warningDelay;

					// warning message
					private _warning_msg = "";
					
					if (_no_food && _no_water) then {
						_warning_msg = sp_msg_no_foodwater;
					} else {
						if (_no_food) then {
							_warning_msg = sp_msg_no_food;
						} else {
							if (_no_water) then {
								_warning_msg = sp_msg_no_water;
							};
						};
					};
					systemChat _warning_msg;
					
					[_player, selectRandom sp_sounds_tired, 20] call survivalpack_fnc_playSoundGlobal;
					
				};
				_player setDamage _dmg;
			};
			_player setVariable ["food", _food];
			_player setVariable ["water", _water];
			
			sleep 0.5;
		};
	};
};

[_player] call _survivalInit;
_player addEventHandler ["Respawn", _survivalInit];