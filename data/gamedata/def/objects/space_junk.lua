
Def.Junk_Base = 
{
	class			= "BaseEntity",
	is_junk			= true,	-- код по прежнему работает через это
	is_ui_junk		= true,	-- интерфейс теперь работает только через это
	in_editor		= false,
	cant_be_bought	= true,
}

Def.Ui_Junk_Base = -- Это не джанк который интерфейсом отрабатывается как джанк
{
	class			= "BaseEntity",
	is_junk			= false,
	is_ui_junk		= true,
	in_editor		= false,
	cant_be_bought	= true,
}

Def.Fuel_Base = 
{
	inherit			= "Junk_Base",
	default_icon	= "mail_attachment_fuel",
	uiName			= "Junk_Fuel",
	uiDesc			= "Junk_Fuel_desc",
}


Def.Junk_FailedSalvage = 
{
	class			= "BaseEntity",
	inherit			= "Junk_Base",
	default_icon	= "mail_attachment_tokens",
	uiName			= "Junk_FailedSalvage",
	uiDesc			= "Junk_FailedSalvage_desc",
}

Def.Junk_Fuel50 = 
{
	inherit			= "Fuel_Base",
	fuel			= 50,
}

Def.Junk_Fuel3 = 
{
	inherit			= "Fuel_Base",
	fuel			= 3,
}

Def.Junk_Fuel5 = 
{
	inherit			= "Fuel_Base",
	fuel			= 5,
}

Def.Junk_Fuel7 = 
{
	inherit			= "Fuel_Base",
	fuel			= 7,
}

Def.Junk_Fuel10 = 
{
	inherit			= "Fuel_Base",
	fuel			= 10,
}

Def.Junk_Fuel15 = 
{
	inherit			= "Fuel_Base",
	fuel			= 15,
}

Def.Junk_Fuel25 = 
{
	inherit			= "Fuel_Base",
	fuel			= 25,
}

Def.ow_Fuel_player =
{
	inherit			= "Fuel_Base",
}

Def.Loyalty_ExtraShipParts =
{
	class			= "BaseEntity",
	is_ui_junk		= true,
	in_editor		= false,
	cant_be_bought	= true,
	--inherit			= "Junk_Base",	---#66155
	default_icon	= "faction_any",
	uiName			= "Loyalty_ExtraShipParts_name",
	uiDesc			= "Loyalty_ExtraShipParts_desc",
}