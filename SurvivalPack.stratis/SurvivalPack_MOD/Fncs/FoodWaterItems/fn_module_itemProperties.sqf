if (!isServer) exitWith {};

params [
	["_logic", objNull, [objNull]],		// Argument 0 is module logic
	["_units", [], [[]]],				// Argument 1 is a list of affected units (affected by value selected in the 'class Units' argument))
	["_activated", true, [true]]		// True when the module was activated, false when it is deactivated (i.e., synced triggers are no longer active)
];


// loop through each defined item
{	
	// get item property [<food_value>,<water_value>,<consumeDuration>]
	private _itemProperty = _logic getVariable _x;
	if (!isNil {_itemProperty}) then {
	
		// compile string to array
		if (typeName _itemProperty == "STRING") then {
			_itemProperty = [] call (compile _itemProperty);
		};
		
		
		// set item properties
		[_x, (_itemProperty select 0), (_itemProperty select 1), (_itemProperty select 2)] call survivalpack_fnc_setItemProperties;
	};
} forEach sp_definedItems;
