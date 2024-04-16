// messages | texts


if (isNil "sp_msg_alreadyInAction") then {sp_msg_alreadyInAction = "your already performing an action"; publicVariable "sp_msg_alreadyInAction"};
if (isNil "sp_msg_no_vehicles_nearby") then {sp_msg_no_vehicles_nearby = "no vehicles nearby to refuel"; publicVariable "sp_msg_no_vehicles_nearby"};
if (isNil "sp_msg_vehicle_has_max_fuel") then {sp_msg_vehicle_has_max_fuel = "vehicle %1 has max fuel"; publicVariable "sp_msg_vehicle_has_max_fuel"};
if (isNil "sp_msg_player_is_in_vehicle") then {sp_msg_player_is_in_vehicle = "player is in a vehicle, exit to refuel"; publicVariable "sp_msg_player_is_in_vehicle"};
if (isNil "sp_msg_refueling_vehicle_no_longer_exists") then {sp_msg_refueling_vehicle_no_longer_exists = "refueling vehicle no longer exists"; publicVariable "sp_msg_refueling_vehicle_no_longer_exists"};
if (isNil "sp_msg_refueling_vehicle_moved_away") then {sp_msg_refueling_vehicle_moved_away = "refueling vehicle has been moved away from player"; publicVariable "sp_msg_refueling_vehicle_moved_away"};
if (isNil "sp_msg_refueling_vehicle_is_destroyed") then {sp_msg_refueling_vehicle_is_destroyed = "refueling vehicle has been destroyed"; publicVariable "sp_msg_refueling_vehicle_is_destroyed"};
if (isNil "sp_msg_no_food") then {sp_msg_no_food = "warning: you are taking damage because of hunger"; publicVariable "sp_msg_no_food"};
if (isNil "sp_msg_no_water") then {sp_msg_no_water = "warning: you are taking damage because of thirst"; publicVariable "sp_msg_no_water"};
if (isNil "sp_msg_no_foodwater") then {sp_msg_no_foodwater = "warning: you are taking damage because of hunger & thirst"; publicVariable "sp_msg_no_foodwater"};
if (isNil "sp_msg_refuel_gaspump_one") then {sp_msg_refuel_gaspump_one = "you have refueled %1 canister"; publicVariable "sp_msg_refuel_gaspump_one"};
if (isNil "sp_msg_refuel_gaspump") then {sp_msg_refuel_gaspump = "you have refueled %1 canisters"; publicVariable "sp_msg_refuel_gaspump"};
if (isNil "sp_msg_refill_waterpump") then {sp_msg_refill_waterpump = "you have refilled water bottles"; publicVariable "sp_msg_refill_waterpump"};


if (isNil "sp_txt_eating") then {sp_txt_eating = "Eating %1"; publicVariable "sp_txt_eating";};
if (isNil "sp_txt_drinking") then {sp_txt_drinking = "Drinking %1"; publicVariable "sp_txt_drinking";};
if (isNil "sp_txt_refueling") then {sp_txt_refueling = "Refueling %1"; publicVariable "sp_txt_refueling";};
if (isNil "sp_txt_stats_hunger") then {sp_txt_stats_hunger = "<img image='SurvivalPack\Data\Icons\icon_food.paa' size='1.2'/><t size='1'> %1%2</t>"; publicVariable "sp_txt_stats_hunger";};
if (isNil "sp_txt_stats_water") then {sp_txt_stats_water = "<img image='SurvivalPack\Data\Icons\icon_water.paa' size='1.2'/><t size='1'> %1%2</t>"; publicVariable "sp_txt_stats_water";};

if (isNil "sp_txt_action_refueling_from_gaspump") then {sp_txt_action_refueling_from_gaspump = "<img image='\SurvivalPack\Data\Icons\icon_canisterfuel.paa' size='1.2'/><t color='#fcdb00'> Refill (Empty Canisters)"; publicVariable "sp_txt_action_refueling_from_gaspump";};
if (isNil "sp_txt_action_refilling_from_waterpump") then {sp_txt_action_refilling_from_waterpump = "<img image='\SurvivalPack\Data\Icons\Icon_Waterbottle.paa' size='1.2'/><t color='#c2fcf4'> Refill (Empty Water bottles)"; publicVariable "sp_txt_action_refilling_from_waterpump";};


sp_gaspump_classes =
[
	"Land_fs_feed_F",
	"Land_FuelStation_Feed_F",
	"Land_FuelStation_03_pump_F",
	"Land_FuelStation_01_pump_malevil_F",
	"Land_FuelStation_01_pump_F",
	"Land_FuelStation_02_pump_F"
];
publicVariable "sp_gaspump_classes";

sp_gasPump_searchRange = 5;
publicVariable "sp_gasPump_searchRange";



sp_waterpump_classes =
[
	"Land_ConcreteWell_02_F"
];
publicVariable "sp_waterpump_classes";

sp_waterPump_searchRange = 5;
publicVariable "sp_waterPump_searchRange";

sp_animations =
[
	"sp_anim_start_eating",
	"sp_anim_end_eating",
	"sp_anim_eating",
	"sp_anim_start_drinking_waterbottle",
	"sp_anim_drinking_waterbottle",
	"sp_anim_end_drinking_waterbottle",
	"sp_anim_start_canister_fuel",
	"sp_anim_canister_fuel",
	"sp_anim_end_canister_fuel"
];
publicVariable "sp_animations";


if (isNil "sp_refill_canisters_enabled") then { sp_refill_canisters_enabled = true};
publicVariable "sp_refill_canisters_enabled";

if (isNil "sp_refill_waterbottles_enabled") then {sp_refill_waterbottles_enabled = true};
publicVariable "sp_refill_waterbottles_enabled";



// initialize values if not defined 

if (isNil "sp_foodDrain_Multiplier") then {sp_foodDrain_Multiplier = 0.5;};
if (isNil "sp_foodDrain_running_Multiplier") then {sp_foodDrain_running_Multiplier = 0.5;};
if (isNil "sp_foodDrain_whileDamaged_Multiplier") then {sp_foodDrain_whileDamaged_Multiplier = 0.5;};
publicVariable "sp_foodDrain_Multiplier";
publicVariable "sp_foodDrain_running_Multiplier";
publicVariable "sp_foodDrain_whileDamaged_Multiplier";

if (isNil "sp_waterDrain_Multiplier") then {sp_waterDrain_Multiplier = 0.65;};
if (isNil "sp_waterDrain_running_Multiplier") then {sp_waterDrain_running_Multiplier = 1;};
if (isNil "sp_waterDrain_whileDamaged_Multiplier") then {sp_waterDrain_whileDamaged_Multiplier = 0.2;};
publicVariable "sp_waterDrain_Multiplier";
publicVariable "sp_waterDrain_running_Multiplier";
publicVariable "sp_waterDrain_whileDamaged_Multiplier";

if (isNil "sp_damage_thirsthunger") then {sp_damage_thirsthunger = 0.005;};
if (isNil "sp_refuelRange") then {sp_refuelRange = 15;};
if (isNil "sp_nowaterfood_warningDelay") then {sp_nowaterfood_warningDelay = 10;};
if (isNil "sp_local_nextWarning_noFoodorWater") then {sp_local_nextWarning_noFoodorWater = 0;};
publicVariable "sp_damage_thirsthunger";
publicVariable "sp_refuelRange";
publicVariable "sp_nowaterfood_warningDelay";
publicVariable "sp_local_nextWarning_noFoodorWater";

if (isNil "sp_firstPersonEnabled") then {sp_firstPersonEnabled = false;};
publicVariable "sp_firstPersonEnabled";


/*
// progress bar (color)
sp_progressBar_color_food = 
[
	(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13]),
	(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54]),
	(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21]),
	(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])
];
sp_progressBar_color_water = [0.51,0.929,1,1];
*/

// sound files
sp_sound_eating = "sp_eating";
sp_sound_drinking = "sp_drinking";
sp_sound_canOpen = "sp_canOpen";
sp_sound_refuel = "sp_refuel";
sp_sounds_tired =
[
	"sp_tired1",
	"sp_tired2"
];
sp_sound_refuel_gaspump = "sp_refuel_gaspump";
sp_sound_refill_waterpump = "sp_refill_waterpump";

publicVariable "sp_sound_eating";
publicVariable "sp_sound_drinking";
publicVariable "sp_sound_canOpen";
publicVariable "sp_sound_refuel";
publicVariable "sp_sounds_tired";
publicVariable "sp_sound_refuel_gaspump";
publicVariable "sp_sound_refill_waterpump";

// define item with properties
[
	"SPItem_TacticalBacon", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0.65, // food value 
			0, // water value
			"Land_TacticalBacon_F", // display object
			[0,-0.075,-0.065], // object attach offset
			10, // consuming duration
			[0,0,0] // object item rotation
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_Cerealbox", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0.45, // food value 
			0, // water value
			"Land_CerealsBox_F", // display object
			[-0.08,-0.07,-0.2], // object attach offset
			10, // consuming duration
			[0,0,0] // object item rotation
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_PowderedMilk", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0.2, // food value 
			0, // water value
			"Land_PowderedMilk_F", // display object
			[-0.019,-0.075,-0.01], // object attach offset
			10, // consuming duration
			[0,99,-1] // object item rotation
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_RiceBox", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0.65, // food value 
			0, // water value
			"Land_RiceBox_F", // display object
			[0,-0.07,-0.07], // object attach offset
			10, // consuming duration
			[0,0,0] // object item rotation
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_Pumpkin", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0.85, // food value 
			0, // water value
			"Land_Pumpkin_01_F", // display object
			[0,-0.05,-0.02], // object attach offset
			10, // consuming duration
			[0,0,0] // object item rotation
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_Orange", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0.3, // food value 
			0, // water value
			"Land_Orange_01_F", // display object
			[0,-0.07,-0.10], // object attach offset
			10, // consuming duration
			[0,0,0] // object item rotation
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_BakedBeans", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0.5, // food value 
			0, // water value
			"Land_BakedBeans_F", // display object
			[0,-0.071,-0.115], // object attach offset
			10, // consuming duration
			[0,0,0] // object item rotation
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_Waterbottle", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0, // food value 
			0.65, // water value
			"Land_BottlePlastic_V2_F", // display object
			[-0.08,-0.16,0], // object attach offset
			11.5, // consuming duration
			[6.8,-90,0], // object item rotation
			true, // follow bone rotation?
			[ // drinking animations
				"sp_anim_start_drinking_waterbottle", // drink start animation
				"sp_anim_drinking_waterbottle",
				"sp_anim_end_drinking_waterbottle"
			],
			sp_txt_drinking, // text 
			sp_sound_drinking, // drinking sound
			"SPItem_WaterbottleEmpty"
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_Canteen", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0, // food value 
			1, // water value
			"Land_Canteen_F", // display object
			[-0.06,-0.14,-0.04], // object attach offset
			11.5, // consuming duration
			[-90,5,80], // object item rotation
			true, // follow bone rotation?
			[ // drinking animations
				"sp_anim_start_drinking_waterbottle", // drink start animation
				"sp_anim_drinking_waterbottle",
				"sp_anim_end_drinking_waterbottle"
			],
			sp_txt_drinking, // text 
			sp_sound_drinking, // drinking sound
			"SPItem_CanteenEmpty"
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_CanSpirit", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0, // food value 
			0.5, // water value
			"Land_Can_V1_F", // display object
			[-0.08,-0.08,0.01], // object attach offset
			11.5, // consuming duration
			[6.8,-90,0], // object item rotation
			true, // follow bone rotation?
			[ // drinking animations
				"sp_anim_start_drinking_waterbottle", // drink start animation
				"sp_anim_drinking_waterbottle",
				"sp_anim_end_drinking_waterbottle"
			],
			sp_txt_drinking, // text 
			sp_sound_drinking, // drinking sound
			"", // empty item class (eg: empty water bottle, empty can)
			true // can sound enabled?
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_CanFranta", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0, // food value 
			0.45, // water value
			"Land_Can_V2_F", // display object
			[-0.08,-0.08,0.01], // object attach offset
			11.5, // consuming duration
			[6.8,-90,0], // object item rotation
			true, // follow bone rotation?
			[ // drinking animations
				"sp_anim_start_drinking_waterbottle", // drink start animation
				"sp_anim_drinking_waterbottle",
				"sp_anim_end_drinking_waterbottle"
			],
			sp_txt_drinking, // text 
			sp_sound_drinking, // drinking sound
			"", // empty item class (eg: empty water bottle, empty can)
			true // can sound enabled?
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 


// define item with properties
[
	"SPItem_CanRedGull", // item class name
	[ // item info
		"Food", // item type
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFoodDrink}, // item use {code}
		[
			0, // food value 
			0.45, // water value
			"Land_Can_V3_F", // display object
			[-0.08,-0.08,0.01], // object attach offset
			11.5, // consuming duration
			[6.8,-90,0], // object item rotation
			true, // follow bone rotation?
			[ // drinking animations
				"sp_anim_start_drinking_waterbottle", // drink start animation
				"sp_anim_drinking_waterbottle",
				"sp_anim_end_drinking_waterbottle"
			],
			sp_txt_drinking, // text 
			sp_sound_drinking, // drinking sound
			"", // empty item class (eg: empty water bottle, empty can)
			true // can sound enabled?
		] // item parameters
	]
] call survivalpack_fnc_defineItem; 

// define item with properties
[
	"SPItem_CanisterFuel", // item class name
	[ // item info
		"Fuel", // item type 0
		{[_this select 0, _this select 1, _this select 2, _this select 3] call survivalpack_fnc_useItemFuel}, // item use {code} 1
		[
			0, // food value 0
			0.45, // water value 1
			"Land_CanisterFuel_F", // display object 2
			[-0.2,0.1,0.08], // object attach offset 3
			11.5, // consuming duration 4
			[-90,-45,104], // object item rotation 5
			true, // follow bone rotation? 6
			[ // drinking animationss 7
				"sp_anim_start_canister_fuel", // drink start animation
				"sp_anim_canister_fuel",
				"sp_anim_end_canister_fuel"
			],
			sp_txt_refueling, // text  8
			sp_sound_refuel, // drinking sound 9 
			"SPItem_CanisterFuelEmpty", // empty item class (eg: empty water bottle, empty can) 10
			false // can sound enabled?
		] // item parameters 2
	]
] call survivalpack_fnc_defineItem; 

// get water canisters 
sp_water_items = [];
sp_water_items_empty = [];

// get fuel canisters
sp_fuel_canisters = [];
sp_fuel_canisters_empty = [];

// loop through each defined item
{
	// get item's info
	private _x_itemInfo = sp_definedItemInfos select _forEachIndex;

	// get item type 
	private _itemType =_x_itemInfo select 0;

	// if item is a fuel canister
	if (_itemType == "Fuel") then {
		private _itemParams =_x_itemInfo select 2;
		private _emptyCanisterClass =_itemParams select 10;
		
		sp_fuel_canisters pushBack _x;
		sp_fuel_canisters_empty pushBack _emptyCanisterClass;
	} else {
		// get water bottles & canteens or other drinkable items that has empty item class
		if (_itemType == "Food") then {
			private _itemParams =_x_itemInfo select 2;
			
			private _foodValue =_itemParams select 0;
			private _waterValue =_itemParams select 1;
			
			// if food item is a drink
			if (_foodValue == 0 && _waterValue > 0) then {
				private _emptyItemClass =_itemParams select 10;
				
				// if food item has a empty item class
				if (!isNil {_emptyItemClass}) then {
					// if empty item class is assigned
					if (_emptyItemClass != "") then {
						sp_water_items pushBack _x;
						sp_water_items_empty pushBack _emptyItemClass;
					};
				};
			};
		
		};
	};
} forEach sp_definedItems;

publicVariable "sp_fuel_canisters";
publicVariable "sp_fuel_canisters_empty";
publicVariable "sp_water_items";
publicVariable "sp_water_items_empty";

