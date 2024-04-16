if (!isServer) exitWith {};

params [
	["_logic", objNull, [objNull]],		// Argument 0 is module logic
	["_units", [], [[]]],				// Argument 1 is a list of affected units (affected by value selected in the 'class Units' argument))
	["_activated", true, [true]]		// True when the module was activated, false when it is deactivated (i.e., synced triggers are no longer active)
];

missionNamespace setVariable ["sp_msg_alreadyInAction", _logic getVariable ["msg_alreadyInAction","<unknown>"], true];
missionNamespace setVariable ["sp_msg_no_vehicles_nearby", _logic getVariable ["msg_no_vehs_nearby","<unknown>"], true];
missionNamespace setVariable ["sp_msg_vehicle_has_max_fuel", _logic getVariable ["msg_vehicle_has_max_fuel","<unknown>"], true];
missionNamespace setVariable ["sp_msg_player_is_in_vehicle", _logic getVariable ["msg_player_is_in_vehicle","<unknown>"], true];
missionNamespace setVariable ["sp_msg_refueling_vehicle_no_longer_exists", _logic getVariable ["msg_vehicle_no_longer_exists","<unknown>"], true];
missionNamespace setVariable ["sp_msg_refueling_vehicle_moved_away", _logic getVariable ["msg_refueling_veh_moved_away","<unknown>"], true];
missionNamespace setVariable ["sp_msg_refueling_vehicle_is_destroyed", _logic getVariable ["msg_vehicle_is_destroyed","<unknown>"], true];
missionNamespace setVariable ["sp_msg_no_food", _logic getVariable ["msg_no_food","<unknown>"], true];
missionNamespace setVariable ["sp_msg_no_water", _logic getVariable ["msg_no_water","<unknown>"], true];
missionNamespace setVariable ["sp_msg_no_foodwater", _logic getVariable ["msg_no_foodwater","<unknown>"], true];
missionNamespace setVariable ["sp_txt_eating", _logic getVariable ["txt_pb_eating","<unknown>"], true];
missionNamespace setVariable ["sp_txt_drinking", _logic getVariable ["txt_pb_drinking","<unknown>"], true];
missionNamespace setVariable ["sp_txt_refueling", _logic getVariable ["txt_pb_refueling","<unknown>"], true];
missionNamespace setVariable ["sp_txt_stats_hunger", _logic getVariable ["stats_parsetext_hunger","<unknown>"], true];
missionNamespace setVariable ["sp_txt_stats_water", _logic getVariable ["stats_parsetext_water","<unknown>"], true];


missionNamespace setVariable ["sp_msg_refuel_gaspump_one", _logic getVariable ["msg_no_refuel_gaspump_one","<unknown>"], true];
missionNamespace setVariable ["sp_msg_refuel_gaspump", _logic getVariable ["msg_no_refuel_gaspump_more_then_one","<unknown>"], true];

missionNamespace setVariable ["sp_msg_refill_waterpump", _logic getVariable ["msg_refill_water_bottles","<unknown>"], true];

missionNamespace setVariable ["sp_txt_action_refueling_from_gaspump", _logic getVariable ["actiontxt_refill_canister_fuel","<unknown>"], true];
missionNamespace setVariable ["sp_txt_action_refilling_from_waterpump", _logic getVariable ["actiontxt_refill_water_bottles","<unknown>"], true];