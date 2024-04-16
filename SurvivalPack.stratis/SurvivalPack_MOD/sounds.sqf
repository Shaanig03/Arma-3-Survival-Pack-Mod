//[] call survivalpack_fnc_playSoundGlobal

class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class sp_eating
	{
		name = "eating sound";						// display name
		sound[] = { "SurvivalPack\Sounds\eating.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "" };			// subtitles

		titlesFont = "LCD14";		// OFP:R - titles font family
		titlesSize = 0;			// OFP:R - titles font size

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
		soundDuration = 12;
	};
	class sp_drinking
	{
		name = "drinking sound";						// display name
		sound[] = { "SurvivalPack\Sounds\drinking.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "" };			// subtitles

		titlesFont = "LCD14";		// OFP:R - titles font family
		titlesSize = 0;			// OFP:R - titles font size

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
		soundDuration = 8;
	};
	class sp_canOpen
	{
		name = "can open sound";						// display name
		sound[] = { "SurvivalPack\Sounds\can_open.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "" };			// subtitles

		titlesFont = "LCD14";		// OFP:R - titles font family
		titlesSize = 0;			// OFP:R - titles font size

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
	};
	class sp_refuel
	{
		name = "can open sound";						// display name
		sound[] = { "SurvivalPack\Sounds\refuel.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "" };			// subtitles

		titlesFont = "LCD14";		// OFP:R - titles font family
		titlesSize = 0;			// OFP:R - titles font size

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
		soundDuration = 120;
	};
	class sp_tired1
	{
		name = "tired 1";						// display name
		sound[] = { "SurvivalPack\Sounds\tired1.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "" };			// subtitles

		titlesFont = "LCD14";		// OFP:R - titles font family
		titlesSize = 0;			// OFP:R - titles font size

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
	};
	class sp_tired2
	{
		name = "tired 2";						// display name
		sound[] = { "SurvivalPack\Sounds\tired2.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "" };			// subtitles

		titlesFont = "LCD14";		// OFP:R - titles font family
		titlesSize = 0;			// OFP:R - titles font size

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
	};
	class sp_refuel_gaspump
	{
		name = "tired 2";						// display name
		sound[] = { "SurvivalPack\Sounds\refuel_gaspump.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "" };			// subtitles

		titlesFont = "LCD14";		// OFP:R - titles font family
		titlesSize = 0;			// OFP:R - titles font size

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
	};
	class sp_refill_waterpump
	{
		name = "tired 2";						// display name
		sound[] = { "SurvivalPack\Sounds\refill_waterpump.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "" };			// subtitles

		titlesFont = "LCD14";		// OFP:R - titles font family
		titlesSize = 0;			// OFP:R - titles font size

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
	};
};