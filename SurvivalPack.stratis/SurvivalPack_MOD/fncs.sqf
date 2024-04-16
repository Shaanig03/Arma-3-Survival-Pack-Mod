
class CfgFunctions
{
	class survivalpack
	{
		class fncs
		{
			file = "SurvivalPack\Fncs\FoodWaterItems";

			class config {};
			
			class playerInit {};
			class doubleClickUseItem {};
			class defineItem {};
			class startAction {};
			
			class ui_inaction_onLoad {};
			class ui_stats_onLoad {};
			
			class useItemFoodDrink {};
			class useItemFuel {};
			
			// modules
			class module_hungerAndThirst {};
			class module_itemProperties {};
			class module_strings {};
			
			class setItemProperties {};
			
			class tempObject {};
			class playSoundGlobal {};
			
			class getHungerWater {};
			class setHungerWater {};
		};
		class math_fncs
		{
			file = "SurvivalPack\Fncs\Math";
			class convertRange {};
		};
	};
};