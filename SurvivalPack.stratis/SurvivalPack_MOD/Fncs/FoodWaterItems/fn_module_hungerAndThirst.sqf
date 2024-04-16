if (!isServer) exitWith {};
if (!isNil "sp_hunger_and_thirst_loaded") exitWith {};

params [
	["_logic", objNull, [objNull]],		// Argument 0 is module logic
	["_units", [], [[]]],				// Argument 1 is a list of affected units (affected by value selected in the 'class Units' argument))
	["_activated", true, [true]]		// True when the module was activated, false when it is deactivated (i.e., synced triggers are no longer active)
];



// get module properties
private _foodDrainMultiplier = _logic getVariable ["FoodDrainMultiplier", 0];
private _foodDrainWhileRunningMultiplier = _logic getVariable ["FoodDrainWhileRunningMultiplier", 0];
private _foodDrainWhileDamagedMultiplier = _logic getVariable ["FoodDrainWhileDamagedMultiplier", 0];

private _waterDrainMultiplier = _logic getVariable ["WaterDrainMultiplier", 0];
private _waterDrainWhileRunningMultiplier = _logic getVariable ["WaterDrainWhileRunningMultiplier", 0];
private _waterDrainWhileDamagedMultiplier = _logic getVariable ["WaterDrainWhileDamagedMultiplier", 0];

private _damageThirstHunger = _logic getVariable ["DamageThirstHunger", 0];
private _noFoodorWaterWarningDelay = _logic getVariable ["NoFoodorWaterWarningDelay", 10];

// convert module property strings to numbers
if (typeName _foodDrainMultiplier == "STRING") then {_foodDrainMultiplier = parseNumber(_foodDrainMultiplier)};
if (typeName _foodDrainWhileRunningMultiplier == "STRING") then {_foodDrainWhileRunningMultiplier = parseNumber(_foodDrainWhileRunningMultiplier)};
if (typeName _foodDrainWhileDamagedMultiplier == "STRING") then {_foodDrainWhileDamagedMultiplier = parseNumber(_foodDrainWhileDamagedMultiplier)};

if (typeName _waterDrainMultiplier == "STRING") then {_waterDrainMultiplier = parseNumber(_waterDrainMultiplier)};
if (typeName _waterDrainWhileRunningMultiplier == "STRING") then {_waterDrainWhileRunningMultiplier = parseNumber(_waterDrainWhileRunningMultiplier)};
if (typeName _waterDrainWhileDamagedMultiplier == "STRING") then {_waterDrainWhileDamagedMultiplier = parseNumber(_waterDrainWhileDamagedMultiplier)};

if (typeName _damageThirstHunger == "STRING") then {_damageThirstHunger = parseNumber(_damageThirstHunger)};
if (typeName _noFoodorWaterWarningDelay == "STRING") then {_noFoodorWaterWarningDelay = parseNumber(_noFoodorWaterWarningDelay)};

private _firstPersonEnabled = _logic getVariable ["EnableFirstPerson", false];


private _refillCanisters_enabled = _logic getVariable ["RefillCanisters", true];
private _refillWaterbottles_enabled = _logic getVariable ["RefillWaterBottles", true];


/*

// load config 
private _foodDrainMultiplier = parseNumber(_logic getVariable ["FoodDrainMultiplier", "0"]);
private _foodDrainWhileRunningMultiplier = parseNumber(_logic getVariable ["FoodDrainWhileRunningMultiplier", "0"]);
private _foodDrainWhileDamagedMultiplier = parseNumber(_logic getVariable ["FoodDrainWhileDamagedMultiplier", "0"]);

private _waterDrainMultiplier = parseNumber(_logic getVariable ["WaterDrainMultiplier", "0"]);
private _waterDrainWhileRunningMultiplier = parseNumber(_logic getVariable ["WaterDrainWhileRunningMultiplier", "0"]);
private _waterDrainWhileDamagedMultiplier = parseNumber(_logic getVariable ["WaterDrainWhileDamagedMultiplier", "0"]);

private _damageThirstHunger = parseNumber(_logic getVariable ["DamageThirstHunger", "0"]);
private _noFoodorWaterWarningDelay = parseNumber(_logic getVariable ["NoFoodorWaterWarningDelay", "10"]);

private _firstPersonEnabled = _logic getVariable ["EnableFirstPerson", false];
*/


missionNamespace setVariable ["sp_foodDrain_Multiplier", _foodDrainMultiplier, true];
missionNamespace setVariable ["sp_foodDrain_running_Multiplier", _foodDrainWhileRunningMultiplier, true];
missionNamespace setVariable ["sp_foodDrain_whileDamaged_Multiplier", _foodDrainWhileDamagedMultiplier, true];

missionNamespace setVariable ["sp_waterDrain_Multiplier", _waterDrainMultiplier, true];
missionNamespace setVariable ["sp_waterDrain_running_Multiplier", _waterDrainWhileRunningMultiplier, true];
missionNamespace setVariable ["sp_waterDrain_whileDamaged_Multiplier", _waterDrainWhileDamagedMultiplier, true];

missionNamespace setVariable ["sp_damage_thirsthunger", _damageThirstHunger, true];
missionNamespace setVariable ["sp_nowaterfood_warningDelay", _noFoodorWaterWarningDelay, true];


missionNamespace setVariable ["sp_firstPersonEnabled", _firstPersonEnabled, true];


missionNamespace setVariable ["sp_refill_canisters_enabled", _refillCanisters_enabled, true];
missionNamespace setVariable ["sp_refill_waterbottles_enabled", _refillWaterbottles_enabled, true];

/*
sp_damage_thirsthunger = 0.005;
sp_refuelRange = 15;
sp_nowaterfood_warningDelay = 10;
sp_local_nextWarning_noFoodorWater = 0;
*/

// load config (for server)
[] call survivalpack_fnc_config;

// load config & player inits
{
	
	
	// exit if not a player that has interface
	if (!hasInterface) exitWith {};
	
	// load player init (for client)
	[player] call survivalpack_fnc_playerInit;
} remoteExec ["bis_fnc_call", 0, true];

sp_hunger_and_thirst_loaded = true;

/*

			class FoodDrainMultiplier : Edit
			{
				displayName = "Food Drain Multiplier";
				tooltip = "increasing this factor value would make the player drain food much faster";
				property = "SNG_Module_HungerAndThirst_FoodDrainMultiplier";
				// Default text for the input box:
				defaultValue = "1"; // Because this is an expression, one must have a string within a string to return a string
			};
			class WaterDrainMultiplier : Edit
			{
				displayName = "Water Drain Multiplier";
				tooltip = "increasing this factor value would make the player drain water much faster";
				property = "SNG_Module_HungerAndThirst_WaterDrainMultiplier";
				// Default text for the input box:
				defaultValue = "1"; // Because this is an expression, one must have a string within a string to return a string
			};
			class DamageThirstHunger : Edit
			{
				displayName = "Damage From Thirst or Hunger";
				tooltip = "damage amount which the player would take every 0.5s when player's hunger or thirst is zero";
				property = "SNG_Module_HungerAndThirst_DamageThirstHunger";
				// Default text for the input box:
				defaultValue = "0.005"; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class NoFoodorWaterWarningDelay : Edit
			{
				displayName = "Damage From Thirst or Hunger";
				tooltip = "when the player's hunger and water value is zero, displays a message every 10s by default";
				property = "SNG_Module_HungerAndThirst_NoFoodorWaterWarningDelay";
				// Default text for the input box:
				defaultValue = "10"; // Because this is an expression, one must have a string within a string to return a string
			};
			
*/