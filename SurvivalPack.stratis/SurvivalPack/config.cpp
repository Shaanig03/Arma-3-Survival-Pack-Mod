class CfgPatches
{
	class SNG_SurvivalPack
	{
		units[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = { "A3_Modules_F", "A3_Data_F_Enoch_Loadorder"};
		author = "UnknownBird";
	};
};


#include "Fncs\FoodWaterItems\inaction_defines.hpp"
#include "Fncs\FoodWaterItems\inaction_titles.hpp"
#include "fncs.sqf"
#include "sounds.sqf"

class CfgMovesBasic; // Ref﻿erence CfgMovesBasic. 
class CfgMovesMaleSdr : CfgMovesBasic // Override CfgMovesMaleSdr
{
	skeletonName="OFP2_ManSkeleton";
	gestures="CfgGesturesMale";
	class States
	{
		class CutSceneAnimationBaseSit;
		
		class sp_anim_start_eating : CutSceneAnimationBaseSit
		{
			looped = 0; // turn in loop or not
			speed = 0.5; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_start_eating.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {"sp_anim_eating", 2}; // next animation after this one
		};
		class sp_anim_end_eating : CutSceneAnimationBaseSit
		{
			looped = 0; // turn in loop or not
			speed = -1; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_end_eating.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {}; // next animation after this one
		};
		class sp_anim_eating : CutSceneAnimationBaseSit
		{
			looped = 1; // turn in loop or not
			speed = 0.25; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_eating.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {}; // next animation after this one
		};
		class sp_anim_start_drinking_waterbottle : CutSceneAnimationBaseSit
		{
			looped = 0; // turn in loop or not
			speed = 0.5; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_start_waterbottle.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {}; // next animation after this one
		};
		class sp_anim_drinking_waterbottle : CutSceneAnimationBaseSit
		{
			looped = 1; // turn in loop or not
			speed = 0.7; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_waterbottle.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {}; // next animation after this one
		};
		class sp_anim_end_drinking_waterbottle : CutSceneAnimationBaseSit
		{
			looped = 0; // turn in loop or not
			speed = 0.5; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_end_waterbottle.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {}; // next animation after this one
		};
		
		class sp_anim_start_canister_fuel : CutSceneAnimationBaseSit
		{
			looped = 0; // turn in loop or not
			speed = 0.5; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_start_fuelcanister.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {}; // next animation after this one
		};
		class sp_anim_canister_fuel : CutSceneAnimationBaseSit
		{
			looped = 1; // turn in loop or not
			speed = 0.7; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_fuelcanister.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {}; // next animation after this one
		};
		class sp_anim_end_canister_fuel : CutSceneAnimationBaseSit
		{
			looped = 0; // turn in loop or not
			speed = 0.5; // duration of your animation in seconds * -1 
			file = "SurvivalPack\Anims\anim_end_fuelcanister.rtm"; // your animation path
			canBlendStep = 0; // sliding effect on/off
			minPlayTime= 1; // minimun time before the animation can be interrupted
			InterpolateTo[] = {}; // next animation after this one
		};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class SNG_Survival: NO_CATEGORY
	{
		displayName = "Survival";
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F : Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};

		// Description base classes (for more information see below):
		class ModuleDescription
		{
			class AnyBrain;
		};
	};

	class SNG_Module_HungerAndThirst : Module_F
	{
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Survival: Thirst, Hunger & Items";				// Name displayed in the menu
		icon = "SurvivalPack\Data\Icons\icon_module_thirst_and_hunger.paa";	// Map icon. Delete this entry to use the default icon.
		category = "SNG_Survival";
		//
		function = "survivalpack_fnc_module_hungerAndThirst";	// Name of function triggered once conditions are met
		functionPriority = 1;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 0;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 1;				// 1 for module waiting until all synced triggers are activated
		isDisposable = 1;					// 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation will not work)
		is3DEN = 0;							// 1 to run init function in Eden Editor as well
		curatorCanAttach = 0;				// 1 to allow Zeus to attach the module to an entity
		curatorInfoType = ""; // Menu displayed when the module is placed or double-clicked on by Zeus

		// 3DEN Attributes Menu Options
		canSetArea = 0;						// Allows for setting the area values in the Attributes menu in 3DEN
		canSetAreaShape = 0;				// Allows for setting "Rectangle" or "Ellipse" in Attributes menu in 3DEN
		canSetAreaHeight = 0;				// Allows for setting height or Z value in Attributes menu in 3DEN
		class AttributeValues
		{
			// This section allows you to set the default values for the attributes menu in 3DEN
			size3[] = { 1, 1, -1 };		// 3D size (x-axis radius, y-axis radius, z-axis radius)
			isRectangle = 0;				// Sets if the default shape should be a rectangle or ellipse
		};

		// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
		class Attributes : AttributesBase
		{
			// Arguments shared by specific module type (have to be mentioned in order to be present):
			class Units : Units
			{
				property = "SNG_Module_HungerAndThirst";
			};
			
			class FoodDrainMultiplier : Edit
			{
				displayName = "Food Drain Multiplier";
				tooltip = "increasing this factor value would make the player drain food much faster";
				property = "SNG_Module_HungerAndThirst_FoodDrainMultiplier";
				// Default text for the input box:
				defaultValue = """0.5"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class FoodDrainWhileRunningMultiplier : Edit
			{
				displayName = "Food Drain (While Running) Multiplier";
				tooltip = "increasing this factor value would make the player drain food much faster while running";
				property = "SNG_Module_HungerAndThirst_FoodDrainWhileRunningMultiplier";
				// Default text for the input box:
				defaultValue = """0.5"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class FoodDrainWhileDamagedMultiplier : Edit
			{
				displayName = "Food Drain (While Damaged) Multiplier";
				tooltip = "increasing this factor value would make the player drain food much faster while damaged";
				property = "SNG_Module_HungerAndThirst_FoodDrainWhileDamagedMultiplier";
				// Default text for the input box:
				defaultValue = """0.5"""; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class WaterDrainMultiplier : Edit
			{
				displayName = "Water Drain Multiplier";
				tooltip = "increasing this factor value would make the player drain water much faster";
				property = "SNG_Module_HungerAndThirst_WaterDrainMultiplier";
				// Default text for the input box:
				defaultValue = """0.65"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class WaterDrainWhileRunningMultiplier : Edit
			{
				displayName = "Water Drain (While Running) Multiplier";
				tooltip = "increasing this factor value would make the player drain water much faster while running";
				property = "SNG_Module_HungerAndThirst_WaterDrainWhileRunningMultiplier";
				// Default text for the input box:
				defaultValue = """1"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class WaterDrainWhileDamagedMultiplier : Edit
			{
				displayName = "Water Drain (While Damaged) Multiplier";
				tooltip = "increasing this factor value would make the player drain water much faster while damaged";
				property = "SNG_Module_HungerAndThirst_WaterDrainWhileDamagedMultiplier";
				// Default text for the input box:
				defaultValue = """0.2"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class DamageThirstHunger : Edit
			{
				displayName = "Damage From Thirst or Hunger";
				tooltip = "damage amount which the player would take every 0.5s when player's hunger or thirst is zero";
				property = "SNG_Module_HungerAndThirst_DamageThirstHunger";
				// Default text for the input box:
				defaultValue = """0.005"""; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class NoFoodorWaterWarningDelay : Edit
			{
				displayName = "Food & Water Zero Warning Msg Delay";
				tooltip = "when the player's hunger and water value is zero, displays a message every 10s by default";
				property = "SNG_Module_HungerAndThirst_NoFoodorWaterWarningDelay";
				// Default text for the input box:
				defaultValue = """10"""; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class EnableFirstPerson : Checkbox
			{
				displayName = "Enable First Person Mode";
				tooltip = "note: due to game engine limitation I wasn't able to make the consuming item render infront of player's hands, that is why I kinda disabled first person by default";
				property = "SNG_Module_HungerAndThirst_EnableFirstPerson";
				// Default text for the input box:
				defaultValue = false; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class RefillCanisters : Checkbox
			{
				displayName = "Enable Canister (Fuel) refill ";
				tooltip = "enables the player to refill empty canisters with fuel at gas stations";
				property = "SNG_Module_HungerAndThirst_RefillCanisters";
				// Default text for the input box:
				defaultValue = true; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class RefillWaterBottles : Checkbox
			{
				displayName = "Enable Water bottle refill ";
				tooltip = "enables the player to refill water bottles from a well pump";
				property = "SNG_Module_HungerAndThirst_RefillWaterBottles";
				// Default text for the input box:
				defaultValue = true; // Because this is an expression, one must have a string within a string to return a string
			};
			/*
			// Module-specific arguments:
			class Yield : Combo
			{
				property = "SNG_Module_Nuke_Yield";				// Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
				displayName = "Nuclear weapon yield";			// Argument label
				tooltip = "How strong will the explosion be";	// Tooltip description
				typeName = "NUMBER";							// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "50";							// Default attribute value. Warning: this is an expression, and its returned value will be used (50 in this case).

				// Listbox items
				class Values
				{
					class 50Mt	{ name = "50 megatons";	value = 50; };
					class 100Mt	{ name = "100 megatons"; value = 100; };
				};
			};

			class Name : Edit
			{
				displayName = "Name";
				tooltip = "Name of the nuclear device";
				property = "SNG_Module_Nuke_Name";
				// Default text for the input box:
				defaultValue = """Tsar Bomba"""; // Because this is an expression, one must have a string within a string to return a string
			};
			*/
			
			class ModuleDescription : ModuleDescription {}; // Module description should be shown last
		};

		// Module description (must inherit from base class, otherwise pre-defined entities won't be available)
		class ModuleDescription : ModuleDescription
		{
			description = "Short module description";	// Short description, will be formatted as structured text
			sync[] = { "LocationArea_F" };				// Array of synced entities (can contain base classes)

			class LocationArea_F
			{
				description[] = { // Multi-line descriptions are supported
					"First line",
					"Second line"
				};
				position = 1;	// Position is taken into effect
				direction = 1;	// Direction is taken into effect
				optional = 1;	// Synced entity is optional
				duplicate = 1;	// Multiple entities of this type can be synced
				synced[] = { "BluforUnit", "AnyBrain" };	// Pre-defined entities like "AnyBrain" can be used (see the table below)
			};

			class BluforUnit
			{
				description = "Short description";
				displayName = "Any BLUFOR unit";	// Custom name
				icon = "iconMan";					// Custom icon (can be file path or CfgVehicleIcons entry)
				side = 1;							// Custom side (determines icon color)
			};
		};
	};
	class SNG_Module_ItemProperties : Module_F
	{
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Survival: Item Properties";				// Name displayed in the menu
		icon = "iconModule";	// Map icon. Delete this entry to use the default icon.
		category = "SNG_Survival";
		//
		function = "survivalpack_fnc_module_itemProperties";	// Name of function triggered once conditions are met
		functionPriority = 2;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 0;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 1;				// 1 for module waiting until all synced triggers are activated
		isDisposable = 1;					// 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation will not work)
		is3DEN = 0;							// 1 to run init function in Eden Editor as well
		curatorCanAttach = 0;				// 1 to allow Zeus to attach the module to an entity
		curatorInfoType = ""; // Menu displayed when the module is placed or double-clicked on by Zeus

		// 3DEN Attributes Menu Options
		canSetArea = 0;						// Allows for setting the area values in the Attributes menu in 3DEN
		canSetAreaShape = 0;				// Allows for setting "Rectangle" or "Ellipse" in Attributes menu in 3DEN
		canSetAreaHeight = 0;				// Allows for setting height or Z value in Attributes menu in 3DEN
		class AttributeValues
		{
			// This section allows you to set the default values for the attributes menu in 3DEN
			size3[] = { 1, 1, -1 };		// 3D size (x-axis radius, y-axis radius, z-axis radius)
			isRectangle = 0;				// Sets if the default shape should be a rectangle or ellipse
		};

		// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
		class Attributes : AttributesBase
		{
			// Arguments shared by specific module type (have to be mentioned in order to be present):
			class Units : Units
			{
				property = "SNG_Module_ItemProperties";
			};
			
			class SPItem_TacticalBacon : Edit
			{
				displayName = "Tactical Bacon";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_TacticalBacon";
				// Default text for the input box:
				defaultValue = "[0.65, 0, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_CanSpirit : Edit
			{
				displayName = "Can (Spirit)";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_CanSpirit";
				// Default text for the input box:
				defaultValue = "[0, 0.5, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_CanFranta : Edit
			{
				displayName = "Can (Franta)";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_CanFranta";
				// Default text for the input box:
				defaultValue = "[0, 0.45, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_CanRedGull : Edit
			{
				displayName = "Can (RedGull)";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_CanRedGull";
				// Default text for the input box:
				defaultValue = "[0, 0.45, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_Waterbottle : Edit
			{
				displayName = "Water bottle";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_Waterbottle";
				// Default text for the input box:
				defaultValue = "[0, 0.65, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_Canteen : Edit
			{
				displayName = "Canteen";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_Canteen";
				// Default text for the input box:
				defaultValue = "[0, 1, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_Cerealbox : Edit
			{
				displayName = "Cereal box";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_Cerealbox";
				// Default text for the input box:
				defaultValue = "[0.45, 0, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_PowderedMilk : Edit
			{
				displayName = "Powdered Milk";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_PowderedMilk";
				// Default text for the input box:
				defaultValue = "[0.2, 0, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_RiceBox : Edit
			{
				displayName = "RiceBox";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_RiceBox";
				// Default text for the input box:
				defaultValue = "[0.65, 0, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_Pumpkin : Edit
			{
				displayName = "Pumpkin";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_Pumpkin";
				// Default text for the input box:
				defaultValue = "[0.85, 0, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_Orange : Edit
			{
				displayName = "Orange";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_Orange";
				// Default text for the input box:
				defaultValue = "[0.3, 0, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			class SPItem_BakedBeans : Edit
			{
				displayName = "Baked Beans";
				tooltip = "[<food_value(0-1)>(number), <water_value(0-1)>(number), <consumeDuration>(number)";
				property = "SNG_Module_ItemProperties_SPItem_Orange";
				// Default text for the input box:
				defaultValue = "[0.5, 0, 10]"; // Because this is an expression, one must have a string within a string to return a string
			};
			/*
			
		
			
			
			
			
	
			
			*/
			class ModuleDescription : ModuleDescription {}; // Module description should be shown last
		};

		// Module description (must inherit from base class, otherwise pre-defined entities won't be available)
		class ModuleDescription : ModuleDescription
		{
			description = "Short module description";	// Short description, will be formatted as structured text
			sync[] = { "LocationArea_F" };				// Array of synced entities (can contain base classes)

			class LocationArea_F
			{
				description[] = { // Multi-line descriptions are supported
					"First line",
					"Second line"
				};
				position = 1;	// Position is taken into effect
				direction = 1;	// Direction is taken into effect
				optional = 1;	// Synced entity is optional
				duplicate = 1;	// Multiple entities of this type can be synced
				synced[] = { "BluforUnit", "AnyBrain" };	// Pre-defined entities like "AnyBrain" can be used (see the table below)
			};

			class BluforUnit
			{
				description = "Short description";
				displayName = "Any BLUFOR unit";	// Custom name
				icon = "iconMan";					// Custom icon (can be file path or CfgVehicleIcons entry)
				side = 1;							// Custom side (determines icon color)
			};
		};
	};
	class SNG_Module_Strings : Module_F
	{
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Survival: Strings";				// Name displayed in the menu
		icon = "iconModule";	// Map icon. Delete this entry to use the default icon.
		category = "SNG_Survival";
		//
		function = "survivalpack_fnc_module_strings";	// Name of function triggered once conditions are met
		functionPriority = 0;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 0;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 1;				// 1 for module waiting until all synced triggers are activated
		isDisposable = 1;					// 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation will not work)
		is3DEN = 0;							// 1 to run init function in Eden Editor as well
		curatorCanAttach = 0;				// 1 to allow Zeus to attach the module to an entity
		curatorInfoType = ""; // Menu displayed when the module is placed or double-clicked on by Zeus

		// 3DEN Attributes Menu Options
		canSetArea = 0;						// Allows for setting the area values in the Attributes menu in 3DEN
		canSetAreaShape = 0;				// Allows for setting "Rectangle" or "Ellipse" in Attributes menu in 3DEN
		canSetAreaHeight = 0;				// Allows for setting height or Z value in Attributes menu in 3DEN
		class AttributeValues
		{
			// This section allows you to set the default values for the attributes menu in 3DEN
			size3[] = { 1, 1, -1 };		// 3D size (x-axis radius, y-axis radius, z-axis radius)
			isRectangle = 0;				// Sets if the default shape should be a rectangle or ellipse
		};

		// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
		class Attributes : AttributesBase
		{
			// Arguments shared by specific module type (have to be mentioned in order to be present):
			class Units : Units
			{
				property = "SNG_Module_Strings";
			};
			
			class msg_alreadyInAction : Edit
			{
				displayName = "message (already in action)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_alreadyInAction";
				// Default text for the input box:
				defaultValue = """your already performing an action"""; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class msg_no_vehs_nearby : Edit
			{
				displayName = "message (refuel: no vehs nearby)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_no_vehs_nearby";
				// Default text for the input box:
				defaultValue = """no vehicles nearby to refuel"""; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class msg_vehicle_has_max_fuel : Edit
			{
				displayName = "message (refuel: vehicle has max fuel)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_vehicle_has_max_fuel";
				// Default text for the input box:
				defaultValue = """vehicle %1 has max fuel"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_player_is_in_vehicle : Edit
			{
				displayName = "message (refuel: player is in vehicle)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_player_is_in_vehicle";
				// Default text for the input box:
				defaultValue = """player is in a vehicle, exit to refuel"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_vehicle_no_longer_exists : Edit
			{
				displayName = "message (refuel: vehicle no longer exists)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_vehicle_no_longer_exists";
				// Default text for the input box:
				defaultValue = """refueling vehicle no longer exists"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_refueling_veh_moved_away : Edit
			{
				displayName = "message (refuel: vehicle moved away)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_refueling_veh_moved_away";
				// Default text for the input box:
				defaultValue = """refueling vehicle has been moved away from player"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_vehicle_is_destroyed : Edit
			{
				displayName = "message (refuel: vehicle is destroyed)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_vehicle_is_destroyed";
				// Default text for the input box:
				defaultValue = """refueling vehicle has been destroyed"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_no_food : Edit
			{
				displayName = "message (zero food)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_no_food";
				// Default text for the input box:
				defaultValue = """warning: you are taking damage because of hunger"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_no_water : Edit
			{
				displayName = "message (zero water)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_no_water";
				// Default text for the inpuwt box:
				defaultValue = """warning: you are taking damage because of thirst"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_no_foodwater : Edit
			{
				displayName = "message (zero food & water)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_no_foodwater";
				// Default text for the input box:
				defaultValue = """warning: you are taking damage because of hunger & thirst"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class txt_pb_eating : Edit
			{
				displayName = "(progressbar eating) text";
				tooltip = "";
				property = "SNG_Module_Strings_txt_pb_eating";
				// Default text for the input box:
				defaultValue = """Eating %1"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class txt_pb_drinking : Edit
			{
				displayName = "(progressbar drinking) text";
				tooltip = "";
				property = "SNG_Module_Strings_txt_pb_drinking";
				// Default text for the input box:
				defaultValue = """Drinking %1"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class txt_pb_refueling : Edit
			{
				displayName = "(progressbar refueling) text";
				tooltip = "";
				property = "SNG_Module_Strings_txt_pb_refueling";
				// Default text for the input box:
				defaultValue = """Refueling %1"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class stats_parsetext_hunger : Edit
			{
				displayName = "stats (hunger icon & percentage)";
				tooltip = "";
				property = "SNG_Module_Strings_stats_parsetext_hunger";
				// Default text for the input box:
				defaultValue = """<img image='SurvivalPack\Data\Icons\icon_food.paa' size='1.2'/><t size='1'> %1%2</t>"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class stats_parsetext_water : Edit
			{
				displayName = "stats (water icon & percentage)";
				tooltip = "";
				property = "SNG_Module_Strings_stats_parsetext_water";
				// Default text for the input box:
				defaultValue = """<img image='SurvivalPack\Data\Icons\icon_water.paa' size='1.2'/><t size='1'> %1%2</t>"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_no_refuel_gaspump_one : Edit
			{
				displayName = "refuel one canister (using gas pump)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_no_refuel_gaspump_one";
				// Default text for the input box:
				defaultValue = """you have refueled %1 canister"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_no_refuel_gaspump_more_then_one : Edit
			{
				displayName = "refuel more then one canister (using gas pump)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_no_refuel_gaspump_more_then_one";
				// Default text for the input box:
				defaultValue = """you have refueled %1 canisters"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class msg_refill_water_bottles : Edit
			{
				displayName = "refill water bottles (using water pump)";
				tooltip = "";
				property = "SNG_Module_Strings_msg_refill_water_bottles";
				// Default text for the input box:
				defaultValue = """you have refilled water bottles"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class actiontxt_refill_canister_fuel : Edit
			{
				displayName = "(action text) refill fuel canisters";
				tooltip = "";
				property = "SNG_Module_Strings_actiontxt_refill_canister_fuel";
				// Default text for the input box:
				defaultValue = """<img image='\SurvivalPack\Data\Icons\icon_canisterfuel.paa' size='1.2'/><t color='#fcdb00'> Refill (Empty Canisters)"""; // Because this is an expression, one must have a string within a string to return a string
			};
			class actiontxt_refill_water_bottles : Edit
			{
				displayName = "(action text) refill water bottles";
				tooltip = "";
				property = "SNG_Module_Strings_actiontxt_refill_water_bottles";
				// Default text for the input box:
				defaultValue = """<img image='\SurvivalPack\Data\Icons\Icon_Waterbottle.paa' size='1.2'/><t color='#c2fcf4'> Refill (Empty Water bottles)"""; // Because this is an expression, one must have a string within a string to return a string
			};
			
			class ModuleDescription : ModuleDescription {}; // Module description should be shown last
		};

		// Module description (must inherit from base class, otherwise pre-defined entities won't be available)
		class ModuleDescription : ModuleDescription
		{
			description = "Short module description";	// Short description, will be formatted as structured text
			sync[] = { "LocationArea_F" };				// Array of synced entities (can contain base classes)

			class LocationArea_F
			{
				description[] = { // Multi-line descriptions are supported
					"First line",
					"Second line"
				};
				position = 1;	// Position is taken into effect
				direction = 1;	// Direction is taken into effect
				optional = 1;	// Synced entity is optional
				duplicate = 1;	// Multiple entities of this type can be synced
				synced[] = { "BluforUnit", "AnyBrain" };	// Pre-defined entities like "AnyBrain" can be used (see the table below)
			};

			class BluforUnit
			{
				description = "Short description";
				displayName = "Any BLUFOR unit";	// Custom name
				icon = "iconMan";					// Custom icon (can be file path or CfgVehicleIcons entry)
				side = 1;							// Custom side (determines icon color)
			};
		};
	};
};


// items
class CfgWeapons	
{
	class ItemCore;
    class InventoryItem_Base_F;
	//model = "\A3\Structures_F\Items\Vessels\CanisterFuel_F.p3d";
	
	
	
	class SPItem_CanisterFuel: ItemCore
	{
	  displayName="Canister (Fuel)";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=15;
		allowedslots[] = {901}; // only backpack
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\icon_canisterfuel.paa";
	  model = "\A3\Structures_F\Items\Vessels\CanisterFuel_F.p3d";
	  descriptionShort="Canister (Fuel)";
	  customItemType = "Fuel";
	  
	};
	class SPItem_CanisterFuelEmpty: ItemCore
	{
	  displayName="Canister (Empty)";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=15;
		allowedslots[] = {901}; // only backpack
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\icon_canisterfuel.paa";
	  model = "\A3\Structures_F\Items\Vessels\CanisterFuel_F.p3d";
	  descriptionShort="Canister (Fuel)";
	  customItemType = "Fuel";
	  
	};
	
	class SPItem_TacticalBacon: ItemCore
	{
	  displayName="Tactical Bacon";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=8;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_TacticalBacon.paa";
	  model="a3\structures_f\Items\Food\TacticalBacon_F.p3d";
	  descriptionShort="Food";
	  customItemType = "Food";
	  nutritionValue = 0.65;
	  
	};
	
	class SPItem_CanSpirit: ItemCore
	{
	  displayName="Can (Spirit)";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=5;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_SpiritCan.paa";
	  model="a3\structures_f\Items\Food\Can_V1_F.p3d";
	  descriptionShort="Energy Drink";
	  customItemType = "Food";
	  nutritionValue = 0;
	  waterValue = 0.5;
	};
	
	class SPItem_CanFranta: ItemCore
	{
	  displayName="Can (Franta)";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=5;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_Fanta.paa";
	  model="a3\structures_f\Items\Food\Can_V2_F.p3d";
	  descriptionShort="Energy Drink";
	  nutritionValue = 0;
	  waterValue = 0.45;
	};
	
	class SPItem_CanRedGull: ItemCore
	{	
	  displayName="Can (RedGull)";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=5;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_RedGull.paa";
	  model="a3\structures_f\Items\Food\Can_V3_F.p3d";
	  descriptionShort="Energy Drink";
	  nutritionValue = 0;
	  waterValue = 0.45;
	};
	
	class SPItem_Waterbottle: ItemCore
	{	
	  displayName="Water bottle";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	 class ItemInfo: InventoryItem_Base_F
      {
		mass=8;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_Waterbottle.paa";
	  model="a3\structures_f_epa\Items\Food\BottlePlastic_V2_F.p3d";
	  descriptionShort="Water bottle";
	  nutritionValue = 0;
	  waterValue = 0.85;
	};
	class SPItem_WaterbottleEmpty: ItemCore
	{	
	  displayName="Water bottle (Empty)";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=8;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_Waterbottle.paa";
	  model="a3\structures_f_epa\Items\Food\BottlePlastic_V2_F.p3d";
	  descriptionShort="Water bottle (Empty)";
	};
	
	class SPItem_Canteen: ItemCore
	{	
	  displayName="Canteen";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=9;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_Canteen.paa";
	  model="a3\structures_f_epa\Items\Food\Canteen_F.p3d";
	  descriptionShort="Canteen";
	  nutritionValue = 0;
	  waterValue = 1;
	};
	
	class SPItem_CanteenEmpty: ItemCore
	{	
	  displayName="Canteen (Empty)";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=9;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_Canteen.paa";
	  model="a3\structures_f_epa\Items\Food\Canteen_F.p3d";
	  descriptionShort="Canteen (Empty)";
	};
	
	class SPItem_Cerealbox: ItemCore
	{	
	  displayName="Cereal box";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=5;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_CerealBox.paa";
	  model="a3\structures_f_epa\Items\Food\CerealsBox_F.p3d";
	  descriptionShort="Food";
	  nutritionValue = 0.5;
	};
	class SPItem_PowderedMilk: ItemCore
	{	
	  displayName="Powdered Milk";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=3;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_PowderedMilk.paa";
	  model="a3\structures_f_epa\Items\Food\PowderedMilk_F.p3d";
	  descriptionShort="Food";
	  nutritionValue = 0.25;
	};
	class SPItem_RiceBox: ItemCore
	{	
	  displayName="Rice Box";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=8;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_Rice.paa";
	  model="a3\structures_f_epa\Items\Food\RiceBox_F.p3d";
	  descriptionShort="Food";
	  nutritionValue = 0.65;
	};
	class SPItem_Pumpkin: ItemCore
	{	
	  displayName="Pumpkin";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=12;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_Pumpkin.paa";
	  model="\A3\Props_F_Orange\Humanitarian\Supplies\Pumpkin_01_F.p3d";
	  descriptionShort="Food";
	  nutritionValue = 0.85;
	};
	class SPItem_Orange: ItemCore
	{	
	  displayName="Orange";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=5;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_Orange.paa";
	  model = "\A3\Props_F_Orange\Humanitarian\Supplies\Orange_01_F.p3d";
	  descriptionShort="Food";
	  nutritionValue = 0.3;
	};
	class SPItem_BakedBeans: ItemCore
	{	
	  displayName="Baked Beans";
	  scope = 2;      
      scopeArsenal = 2;
      scopeCurator = 2;
	  class ItemInfo: InventoryItem_Base_F
      {
		mass=8;
      };
	  simulation= "ItemMineDetector"
	  author="RandomGuy";
	  picture="\SurvivalPack\Data\Icons\Icon_BakedBeans.paa";
	  model="a3\structures_f_epa\Items\Food\BakedBeans_F.p3d";
	  descriptionShort="Food";
	  nutritionValue = 0.65;
	};  
};
