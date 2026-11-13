-- Vessel material presets


VesselCustomElements.MPreset_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.LINES,
	desc =
	{
		-- имена берутся не из VesselCustomElements, а напрямую из названий цветов и материалов
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Matt_Black01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Matt_Gray01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Matt_Red01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Carbon",
	},
	cant_be_bought	= true,
	prices		= CommonPresetPrices,
}

VesselCustomElements.MPreset_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.LINES,
	desc =
	{
		-- имена берутся не из VesselCustomElements, а напрямую из названий цветов и материалов
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Matt_Red01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Matt_Gray01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Matt_Red01",
	},
	cant_be_bought	= true,
	prices		= CommonPresetPrices,
}


----- SteamWinterSale ----

VesselCustomElements.SteamWinterSale_Snow_l =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.LINES,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_SteamWinterSale_Snow_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_SteamWinterSale_Snow_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_SteamWinterSale_Snow_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snow_03",
	},

	prices = CommonPresetPrices,
	cant_be_bought = true,
}


VesselCustomElements.SteamWinterSale_Snow_c =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.CAMOUFLAGE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_SteamWinterSale_Snow_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_SteamWinterSale_Snow_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_SteamWinterSale_Snow_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snow_03",
	},

	uiIco = "paint_teamWinterSale_Snow_c_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}


VesselCustomElements.SteamWinterSale_IceCrystal =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_SteamWinterSale_Ice_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_SteamWinterSale_Ice_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_SteamWinterSale_Ice_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "IceCrystal",
	},

	uiIco = "paint_SteamWinterSale_IceCrystal_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.SteamWinterSale_Snow02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_SteamWinterSale_Snow02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_SteamWinterSale_Snow02_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_SteamWinterSale_Snow02_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snow_02",
	},

	uiIco = "paint_SteamWinterSale_Snow02_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}
----- New Year 2014 ----

VesselCustomElements.NewYear14_Stars =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_NewYear14_Stars_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_NewYear14_Stars_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_NewYear14_Stars_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stars_01",
	},

	uiIco = "paint_NewYear14_Stars_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

----- Base Presets ----
--- Lines ----

VesselCustomElements.BaseLines_Fox =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.LINES,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseLines_Fox_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseLines_Fox_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseLines_Fox_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}


VesselCustomElements.BaseLines_BlackY =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.LINES,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseLines_BlackY_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseLines_BlackY_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseLines_BlackY_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

VesselCustomElements.BaseLines_GrayB =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.LINES,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseLines_GrayB_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseLines_GrayB_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseLines_GrayB_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

VesselCustomElements.BaseLines_Fighter01 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.LINES,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseLines_Fighter01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseLines_Fighter01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseLines_Fighter01_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

VesselCustomElements.BaseLines_Fighter02 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.LINES,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseLines_Fighter02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseLines_Fighter02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseLines_Fighter02_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

--- Camouflage ----

--комуфляж для крафт корабля
VesselCustomElements.BaseCamouflage_CraftCamouflage =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.CAMOUFLAGE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Matt_Green03",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Matt_Black01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Matt_Yellow01",
	},

	prices		= CommonPresetPrices,
	--	cant_be_bought	= true,
}




VesselCustomElements.BaseCamouflage_Summer01 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.CAMOUFLAGE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseCamouflage_Summer01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseCamouflage_Summer01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseCamouflage_Summer01_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

VesselCustomElements.BaseCamouflage_Summer02 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.CAMOUFLAGE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseCamouflage_Summer02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseCamouflage_Summer02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseCamouflage_Summer02_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

VesselCustomElements.BaseCamouflage_Sand01 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.CAMOUFLAGE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseCamouflage_Sand01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseCamouflage_Sand01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseCamouflage_Sand01_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

VesselCustomElements.BaseCamouflage_Sand02 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.CAMOUFLAGE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseCamouflage_Sand02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseCamouflage_Sand02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseCamouflage_Sand02_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

VesselCustomElements.BaseCamouflage_Metallic01 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.CAMOUFLAGE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BaseCamouflage_Metallic01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseCamouflage_Metallic01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BaseCamouflage_Metallic01_3",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}



VesselCustomElements.CbtCamouflage_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.CAMOUFLAGE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_CbtCamouflage_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_CbtCamouflage_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_CbtCamouflage_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Carbon",
	},

	prices		= CommonPresetPrices,
--	cant_be_bought	= true,
}

VesselCustomElements.OWDLC_grid01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_OWDLC_Grid_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_OWDLC_Grid_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_OWDLC_Grid_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Grid01",
	},

	uiIco = "paint_OWDLC_grid01_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.OWDLC_tech01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_OWDLC_Tech_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_OWDLC_Tech_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_OWDLC_Tech_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Tech_01",
	},

	uiIco = "paint_OWDLC_tech01_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.Precursor =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Prec_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Prec_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Prec_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Precursor",
	},

	uiIco = "paint_Precursor_ico",
	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.Golden =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Golden1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Golden1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Golden1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "GoldOverflow_01",
	},

	uiIco = "paint_Golden_ico",
	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.Liquid =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Liquid1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Liquid1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Liquid1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Liquid_01",
	},

	uiIco = "paint_Liquid_ico",
	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.Liquid2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Liquid2",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Liquid2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Liquid2",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Liquid_02",
	},

	uiIco = "Liquid2_ico",
	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.Precskin =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_Prec1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_Prec2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_Prec3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Precursor02",
	},

	prices		= CommonPresetPrices,
	cant_be_bought	= true,
	
	uiIco = "Precskin_ico",
}

VesselCustomElements.Pumpkin =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] = "Preset_Pumpkin",
		[ ai.VesselCustomSlot.MATERIAL_1 	] = "Preset_Pumpkin",
		[ ai.VesselCustomSlot.MATERIAL_2 	] = "Preset_Pumpkin",
		[ ai.VesselCustomSlot.ARMOR_0 		] = "Pumpkin",
	},

	uiIco = "Crossout_Pumpkin_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.Gzhel =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Gzhel",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Gzhel",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Gzhel",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Gzhel",
	},

	uiIco = "paint_Gzhel_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.SClogo =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_SClogo",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_SClogo",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_SClogo",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "SClogo",
	},

	uiIco = "paint_SClogo_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.SClogo2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_SClogo2",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_SClogo2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_SClogo2",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "SClogo2",
	},

	uiIco = "SClogo2_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.Stars23 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stars23_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stars23_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stars23_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stars_23",
	},

	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.Ice_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_ice2",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BaseCamouflage_Sand01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_Craft_r3_m1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snow_04",
	},

	uiIco = "paint_Ice_1_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.IceCrystalBlack =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_Prec3",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_Craft_r3_m1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_Premium_r1_i3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snow_03",
	},

	prices		= CommonPresetPrices,
	cant_be_bought	= true,
	
	uiIco = "IceCrystalBlack_ico",
}

VesselCustomElements.Preset9May =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Green1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Green1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Green1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "May9",
	},

	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.PresetCybersport =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.DEFAULT,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_cyberSport2018_r1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_cyberSport2018_g1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_cyberSport2018_b1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Hex02",
	},

	uiIco = "paint_PresetCybersport_ico",
	cant_be_bought	= true,
}



--------------------------------------------------
--#68580

----------------------- ДЕКОРЫ

VesselCustomElements.R5_ATTACK_UNIQUE =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.RACE5_ATTACK_UNIQUE,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_r5_m_unique_r1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_r5_m_unique_g1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_r5_m_unique_b1",
		[ ai.VesselCustomSlot.CHILD_0 		] 	= "R5_m_unique",
		[ ai.VesselCustomSlot.SKIN_0 		] 	= "unique",
	},
	prices		= CommonPresetPrices,
	--cant_be_bought	= false,
	cant_be_bought	= true,
}

VesselCustomElements.R3_GUARD_12APRIL =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.RACE3_GUARD_12APRIL,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_Race3_I_shuttle_rUSA",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_Race3_I_shuttle_gUSA",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_Race3_I_shuttle_bUSA",
		[ ai.VesselCustomSlot.SKIN_0 		] 	= "april12",
	},
	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.R1_ENGINEER_12APRIL =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.RACE1_ENGINEER_12APRIL,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_Race1_l_spiral_rUSSR",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_Race1_l_spiral_gUSSR",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_Race1_l_spiral_bUSSR",
		[ ai.VesselCustomSlot.SKIN_0 		] 	= "april12",
	},
	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}



VesselCustomElements.R5_SCOUT_DECOR =
{
	-- type		= ai.VesselCustomElementType.CHILD,
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.RACE5_SCOUT,

	-- child = "R5_scout_decor_unique",
	-- slot = ai.VesselCustomSlot.CHILD_1,
	
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_r5_s_t1_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_r5_s_t1_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_r5_s_t1_3",
		[ ai.VesselCustomSlot.CHILD_1 		] 	= "R5_scout_decor_unique",
	},

	
	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.R5_ENGINEER_DECOR =
{
	-- type		= ai.VesselCustomElementType.CHILD,
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.RACE5_ENGINEER,

	-- child = "R5_scout_decor_unique",
	-- slot = ai.VesselCustomSlot.CHILD_1,
	
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_r5_l_t1_r1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_r5_l_t1_g1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_r5_l_t1_b1",
		[ ai.VesselCustomSlot.CHILD_1 		] 	= "R5_engineer_decor_unique",
	},

	
	prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

--#69857
--закомментирован т.к. доступен только 2-м кораблям и не планировался как шаблон
--[[VesselCustomElements.NewYear17 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_NewYear17_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_NewYear17_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_NewYear17_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "NewYear17",
	},

	cant_be_bought	= false,
	--cant_be_bought	= true,
}]]

VesselCustomElements.CrossoutBeepHorn =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "CrossoutBeepHorn",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.CrossoutHorns =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "CrossoutHorns",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.CrossoutEagleSign =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "CrossoutEagleSign",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Moon_Rover =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Moon_Rover",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Empire_Sign =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Empire_Sign",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Federation_Sign =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Federation_Sign",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Jericho_Sign =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Jericho_Sign",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Ellydium_Sign =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Ellydium_Sign",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.SC_Logo =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "SC_Logo",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.SC_Glove_01 =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "SC_Glove_01",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.SC_Moon_Decor =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "SC_Moon_Decor",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Crystal_Shard =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Crystal_Shard",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Direct_Hit =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Direct_Hit",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Cool_Down =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Cool_Down",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Police_Lights =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Police_Lights",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Jericho_Logo =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Jericho_Logo",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Satellite =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Satellite",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Pirate_Arm =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Pirate_Arm",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Sundial =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Sundial",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Blades =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Blades",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Phoenix_Wings =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Phoenix_Wings",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Trophy_Decor =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Trophy_Decor",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Shark =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Shark",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Spring_Scull =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Spring_Scull",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.SC_Logo_on_Shield =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "SC_Logo_on_Shield",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.PlagueDoctor_Mask =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "PlagueDoctor_Mask",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Neon_Rocket =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Neon_Rocket",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Snowman =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Snowman",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Utility_Bag =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Utility_Bag",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Antler =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Antler",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Flaming_Star =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Flaming_Star",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Christmas_Ball =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Christmas_Ball",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Sentinel_Tournament_Cup =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Sentinel_Tournament_Cup",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Vostok =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Vostok",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Pearl =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Pearl",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Fire_Bird =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Fire_Bird",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Astronaut =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Astronaut",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Exotic_Ikebana =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Exotic_Ikebana",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Octo =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Octo",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Tropick_Fish =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Tropick_Fish",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Trophy_Decor_21 =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Trophy_Decor_21",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Tournament_Decor_Beacon =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Tournament_Decor_Beacon",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.LevitatingCrystal =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "LevitatingCrystal",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Spiked =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Spiked",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.ModernHead =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "ModernHead",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Dragon =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Dragon",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.AlienShrine =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "AlienShrine",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Totem =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Totem",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Rhomb =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Rhomb",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Heart =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Heart",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Rabbit =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Rabbit",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Sakura =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Sakura",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Wishes =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Wishes",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Fox =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Fox",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Torch =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Torch",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Lamp =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Lamp",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Reactor =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Reactor",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.NewRose =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "NewRose",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Trophy_Decor_22 =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Trophy_Decor_22",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.CutCube =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "CutCube",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Owl =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Owl",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Antipode =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Antipode",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Plexus =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Plexus",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Chained =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Chained",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Covered =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Covered",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Eye =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Eye",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Spider =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Spider",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Black_Relay =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Black_Relay",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Cocoon =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Cocoon",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Anchor =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Anchor",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Snorkel =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Snorkel",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Stooge =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Stooge",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Nautilus =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Nautilus",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Feather =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Feather",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Inner_Glow =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Inner_Glow",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Icicle =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Icicle",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Tree =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Tree",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Last_Phase =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Last_Phase",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Crystal_Aurora =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Crystal_Aurora",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Polaris =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Polaris",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.DrillDecor =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "DrillDecor",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Crystalopter =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Crystalopter",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Malachite =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Malachite",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Pteryx =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Pteryx",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Beak =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Beak",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.DinoToy =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "DinoToy",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Space_day_2023 =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Space_day_2023",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Shellfish = 
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Shellfish", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Vibrance =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Vibrance",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Crest =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Crest",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Spines =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Spines",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Dome =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Dome",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Paw =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Paw",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Pickaxe =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Pickaxe",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- Декоры BP12_1 / SUM23_1 "Грани риска. Первый этап"

VesselCustomElements.Brassknuckles =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Brassknuckles",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Money_Skull =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Money_Skull",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Money_Dog =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Money_Dog",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Smugglerbox =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Smugglerbox",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- декор Трофей Космобольца 2023

VesselCustomElements.Trophy_Decor_23 =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Trophy_Decor_23",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- Декоры BP12_2 / SUM23_2 "Грани риска. Второй этап" SC-117635

VesselCustomElements.Shellgame =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Shellgame",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Money_Hand =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Money_Hand",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Death_Drum =
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Death_Drum",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Wings = -- !!! ЗАГОТОВКА !!! ДЕФ БУДЕТ МЕНЯТЬСЯ КОГДА К.Ч. ОПРЕДЕЛИТСЯ !!!
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Wings", -- !!! ЗАГОТОВКА !!! ДЕФ БУДЕТ МЕНЯТЬСЯ КОГДА К.Ч. ОПРЕДЕЛИТСЯ !!!
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- Декоры BP13_1 / AUT23_1 "Древний инстинкт. Первая фаза" SC-117869

VesselCustomElements.Saint_Head = -- Последний судья
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Saint_Head",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Coffin = -- Груз 273
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Coffin",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Kunai = -- Кокон монарха
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Kunai",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Crown = -- Венок Катрины
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Crown", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-117611 Декор для Mauler
VesselCustomElements.Connector = -- Коннектор судьбы
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Connector", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- Декоры BP13_2 / AUT23_2 "Древний инстинкт. Вторая фаза" SC-117870

VesselCustomElements.Dreamcatcher = -- Октагон Ананси
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Dreamcatcher",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Lunnica = -- Кровавая луна
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Lunnica",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Sence_Tree = -- Древо смыслов
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Sence_Tree",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Death_Flower = -- Цветок скорби
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Death_Flower", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- Декоры BP14_1 / NY23_1 "Секреты предтечей". Первая фаза. SC-118208

VesselCustomElements.Fan = -- Призыватель ветров
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Fan",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Chest = -- Тайник ванов
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Chest",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Spheres_Chinese = -- Глаза Юн
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Spheres_Chinese",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Fly_Lantern = -- Дэнлон/Denglong
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Fly_Lantern", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- Декоры BP14_2 / NY24_2 "Секреты предтечей". Вторая фаза. SC-118348

VesselCustomElements.BP14_Cloud = -- Дар небес
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP14_Cloud",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP14_Gong = -- Вызов на бой
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP14_Gong",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP14_Umbrella = -- Солнечная батарейка
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP14_Umbrella",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP14_Hairpin = -- Модный прикид
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP14_Hairpin", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- Декоры BP15_1 / SPR24_1 "Скачок в бездну.". Первая фаза. SC-118487

VesselCustomElements.BP15_Dna = -- Двойная спираль
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP15_Dna",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP15_Arc = -- Стабилизированный элемент
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP15_Arc",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP15_Warnsign = -- Биологическая опасность
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP15_Warnsign",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP15_Rift = -- Полураспад
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP15_Rift", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-118784 Декор "Сим" для корабля Vigilant

VesselCustomElements.Sim = -- Свет Истины
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Sim", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-118721 Декор "Солнечная система" для 12 апреля 2024

VesselCustomElements.Solar_System_2024 = -- Солнечная система
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Solar_System_2024", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- Декоры BP15_2 / SPR24_2 "Скачок в бездну.". Вторая фаза. SC-118843

VesselCustomElements.BP15_Rod = -- Столпы созидания
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP15_Rod",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP15_Crystalbrain = -- Разделённый разум (+FX)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP15_Crystalbrain",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP15_Pyramids = -- Постоянство времени
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP15_Pyramids",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP15_Atom = -- Ядро творения
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP15_Atom", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-118621 Декоры. Боевой пропуск "Неведомые горизонты. Первая фаза": BP16_1 / SUM24_1. Лето 2024.

VesselCustomElements.BP16_Whirligig = -- Гипнотическая юла
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP16_Whirligig",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP16_Jestercap = -- Шапка шута
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP16_Jestercap",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP16_Trick = -- Фокус не по плану (+FX)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP16_Trick",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP16_Drum = -- Тревожный Барабан
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP16_Drum", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-118978 Уникальный декор Трофей Космобольца 2024

VesselCustomElements.Trophy_Decor_24 = -- Трофей Космобольца 2024
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Trophy_Decor_24", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-118837 Декоры. Боевой пропуск "Неведомые горизонты. Вторая фаза": BP16_2 / SUM24_2. Лето 2024.

VesselCustomElements.BP16_Airballoon = -- Аэростат
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP16_Airballoon",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP16_Shootinggallery = -- Тир (+ Победный VFX)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP16_Shootinggallery",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP16_Carousel = -- Карусель
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP16_Carousel",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP16_Monkey = -- Мартышка
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP16_Monkey", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-118962 Декоры. Боевой пропуск "Сердце тьмы. Первая фаза". BP17_1 / AUT24_1. Осень 2024.

VesselCustomElements.BP17_Flora = -- Механо-лотос 
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP17_Flora",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP17_Repairrobot = -- BD-8 (+ Победный VFX)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP17_Repairrobot",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP17_Bird = -- Орлуша
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP17_Bird",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP17_Gardener = -- Кинетоскоп
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP17_Gardener", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119095 Декоры. Боевой пропуск "Сердце тьмы. Вторая фаза". BP17_2 / AUT24_2. Осень 2024.

VesselCustomElements.BP17_Cat = -- К9 (+ Победный VFX)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP17_Cat",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP17_Dragonfly = -- Люминокрыл
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP17_Dragonfly",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP17_Spider = -- Ткач Реальности
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP17_Spider",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP17_IBM = -- Партнёр 01.01
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP17_IBM", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119173 Декоры. Боевой пропуск "Забытые звезды. Первая фаза". BP18_1 / NY24_1. Зима 2024.

VesselCustomElements.BP18_Amazon = -- Амазон 
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP18_Amazon",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP18_Snake = -- Кецаль (+ Победный VFX)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP18_Snake",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP18_Dualmask = -- Дуальная маска
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP18_Dualmask",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP18_Totem = -- Тотем огня
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP18_Totem", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119282 Декоры. Боевой пропуск "Забытые звезды. Вторая фаза". BP18_2 / NY24_2. Зима 2024.

VesselCustomElements.BP18_Robot = -- Сгибатель (+ Победный VFX)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP18_Robot",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP18_Portal = -- Древние врата
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP18_Portal",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP18_Mask = -- Ах-Пуч
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP18_Mask",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP18_Quetzal = -- Амару
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP18_Quetzal", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119398 Декоры. Боевой пропуск "Союзники и соперники. Первая фаза". BP19_1 / SPR25_1. Весна 2025.

VesselCustomElements.BP19_Vynil = -- Винил
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Vynil",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP19_Kinescope = -- Даю настройку! (+ Победный VFX (killer_custom_fx))
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Kinescope",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP19_Radiolamp = -- Ламповая технология
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Radiolamp",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP19_Object = -- Звёздный трекбол
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Object", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119498 Декоры. Боевой пропуск "Союзники и соперники. Вторая фаза". BP19_2 / SPR25_2. Весна 2025.

VesselCustomElements.BP19_Quartz = -- iSCreen-333 Pro (+ Победный VFX (killer_custom_fx))
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Quartz",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP19_Fab = -- Кузькина мачеха 
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Fab",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP19_Ufo = -- Главный по тарелочкам
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Ufo",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP19_Monoplane = -- Илюша
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Monoplane", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119538 Декор на 12-е апреля, Весна 2025.

VesselCustomElements.BP19_Astronaut = -- Алексей Архипович (или "60 лет")
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP19_Astronaut", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119590 Декоры. Боевой пропуск "Предания древних. Первая фаза". BP20_1 / SUM25_1. Лето 2025.

VesselCustomElements.BP20_Epichero = -- Велес
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP20_Epichero",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP20_Goose = -- Гуси-лебеди (+ Победный VFX (killer_custom_fx))
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP20_Goose",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP20_Handiwork = -- Прялка Мокоши
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP20_Handiwork",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP20_Lizard = -- Малахитница
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP20_Lizard", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119802 Уникальный декор Трофей Космобольца 2025

VesselCustomElements.Trophy_Decor_25 = -- Трофей Космобольца 2025
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Trophy_Decor_25", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119651 Декоры. Боевой пропуск "Союзники и соперники. Вторая фаза". BP20_2 / SUM25_2. Лето 2025.

VesselCustomElements.BP20_Chicken = -- Курочка Ряба (+ Победный VFX (killer_custom_fx))
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP20_Chicken", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP20_Izba = -- Дом Солнца 
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP20_Izba",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP20_Wheel = -- Супрядки
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP20_Wheel",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP20_Bull = -- Дымковский бычок
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP20_Bull",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119778 Декоры. Боевой пропуск "Опустошенные миры. Первая фаза". BP21_1 / AUT25_1. Осень 2025.

VesselCustomElements.BP21_Helmet = -- Шлем Валькирии
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP21_Helmet", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP21_Talharpa = -- Тальхарпа 
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP21_Talharpa",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP21_Hammer = -- Молот Тора (+ Победный VFX (killer_custom_fx))
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP21_Hammer",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP21_Megalith = -- Мегалит
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP21_Megalith",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-120019 Декор + Победный VFX. Ежеквартальный Видеоконкурс «ФИЛЬМ СЕЗОНА».

VesselCustomElements.Film = -- Фильммейкер
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Film", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-120060 Вещь Т-825. Концепт-арт и модель декора на Хелоуинский ивент пасс, Осень 2025.

VesselCustomElements.Halloween_25 = -- Вещь Ти-Экс
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Halloween_25", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119798 Декоры. Боевой пропуск "Опустошенные миры. Вторая фаза". BP21_2 / AUT25_2. Осень 2025.

VesselCustomElements.BP21_Drakkar = -- Драккар (+ эффект-модификатор)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP21_Drakkar", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP21_Figurine = -- Хильдисвини
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP21_Figurine",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP21_Shield = -- Щит Хранителя
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP21_Shield",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP21_Anvil = -- Наковальня двергов
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP21_Anvil",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-119953 Декоры. Боевой пропуск "Перекрёсток галактик. Первая фаза". BP22_1 / NY26_1. Зима 2025 - 26

VesselCustomElements.BP22_Desertmask = -- Пустынник
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP22_Desertmask", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP22_Cube = -- Куб Агонии
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP22_Cube",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP22_Decoy = -- Ударник (+ Победный VFX (killer_custom_fx))
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP22_Decoy",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP22_Vehicle = -- Сборщик
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP22_Vehicle",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-120065 Декоры. Боевой пропуск "Перекрёсток галактик. Вторая фаза". BP22_2 / NY26_2. Зима 2025 - 26.

VesselCustomElements.BP22_Seal = -- Печать Императора

{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP22_Seal", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP22_Water = -- Вода жизни
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP22_Water",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP22_Emblem = -- Вычислитель Ментата
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP22_Emblem",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP22_Floatlamp = -- Парящая лампа
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP22_Floatlamp",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-120209 Декоры. Боевой пропуск "Раскол альянсов". Первая фаза BP23_1 / SPR26_1. Весна 2026.

VesselCustomElements.BP23_Blade = -- Триада возмездия 

{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP23_Blade", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP23_Coin = -- Золотой стандарт (+ Победный VFX (killer_custom_fx))
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP23_Coin",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP23_Book = -- Оптический анализатор
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP23_Book",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP23_Board = -- Авангард-R 
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP23_Board",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-120290 Декоры. Боевой пропуск "Раскол альянсов". Вторая фаза BP23_2 / SPR26_2. Весна 2026.

VesselCustomElements.BP23_Capsule = -- Энерго-капсула 

{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP23_Capsule", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP23_Crystal = -- Кристалл-анемон 
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP23_Crystal",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP23_Banner = -- Имперский вымпел (+ Победный VFX (killer_custom_fx))
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP23_Banner",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP23_Locator = -- Локатор
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP23_Locator",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-120476 Декор "Клешня Ветерана". Финал 2026.

VesselCustomElements.Veteran_LClaw = -- КЛЕШНЯ ЛЕВАЯ (по курсу)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Veteran_LClaw", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.Veteran_RClaw = -- КЛЕШНЯ ПРАВАЯ (по курсу)
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "Veteran_RClaw", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

--- SC-120371 Декоры. Боевой пропуск "Наследие предтеч". Первая фаза BP24_1 / SUM26_1. Лето 2026.

VesselCustomElements.BP24_Detector = -- Детектор Предтеч

{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP24_Detector", 
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP24_Sphere = -- Дайс Предтеч
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP24_Sphere",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP24_Mask = -- Маска Предтеч
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP24_Mask",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

VesselCustomElements.BP24_Eye = -- Цифровое Око
{
	type		= ai.VesselCustomElementType.CHILD,
	group		= VesselCustomElementsGroups.DEFAULT,

	child = "BP24_Eye",
	slot = ai.VesselCustomSlot.CHILD_1,
	cant_be_bought	= true,
}

----------------------- ШАБЛОНЫ/ПОКРАСКИ

VesselCustomElements.WomansDay_2017 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Roses_r1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Roses_g1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Roses_b1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Roses",
	},

	uiIco = "paint_WomansDay_2017_ico",
	prices = CommonPresetPrices,
	cant_be_bought = true,
}

VesselCustomElements.BaseCamouflage_SCL =
{
	type		= ai.VesselCustomElementType.MPRESET,
	group		= VesselCustomElementsGroups.DEFAULT,
	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Prec_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Prec_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Prec_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "PrecursorRed",
	},

	--prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.NY19_Sparkles01 =  --NY19_Candy01
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_newYear19_sparkles_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_newYear19_sparkles_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_newYear19_sparkles_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "NY19_Sparkles01", --NY_19_Candy01
	},

	uiIco = "paint_NY19_Sparkles01_ico",
	cant_be_bought	= true,
}

VesselCustomElements.NY19_NewYear19 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_newYear19_newyear19_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_newYear19_newyear19_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_newYear19_newyear19_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "NY19_NewYear19",
	},

	uiIco = "paint_NY19_NewYear19_ico",
	cant_be_bought	= true,
}
VesselCustomElements.NY19_Holiday01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_newYear19_holiday_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_newYear19_holiday_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_newYear19_holiday_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "NY19_Holiday01",
	},

	uiIco = "paint_NY19_Holiday01_ico",
	cant_be_bought	= true,
}

VesselCustomElements.Crossout_AlienSkin =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_AlienSkin_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_AlienSkin_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_AlienSkin_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_AlienSkin",
	},

    uiIco = "Crossout_AlienSkin_ico",
	cant_be_bought	= true,
}

VesselCustomElements.Crossout_BloodHand =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_BloodHand_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_BloodHand_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_BloodHand_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_BloodHand",
	},

	cant_be_bought	= true,
    uiIco = "Crossout_BloodHand_ico",
}

VesselCustomElements.Crossout_CamoPixel02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_CamoPixel02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_CamoPixel02_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_CamoPixel02_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_CamoPixel02",
	},

	uiIco = "Crossout_CamoPixel02_ico",
	cant_be_bought	= true,
}

VesselCustomElements.Crossout_ComoDesert =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_ComoDesert_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_ComoDesert_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_ComoDesert_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_ComoDesert",
	},

	uiIco = "Crossout_ComoDesert_ico",
	cant_be_bought	= true,
}

VesselCustomElements.Crossout_DirtyBoard =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_DirtyBoard_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_DirtyBoard_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_DirtyBoard_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_DirtyBoard",
	},

	uiIco = "Crossout_DirtyBoard_ico",
	cant_be_bought	= true,
}

VesselCustomElements.Crossout_ElectricPattern =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_ElectricPattern_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_ElectricPattern_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_ElectricPattern_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_ElectricPattern",
	},

	cant_be_bought	= true,
    uiIco = "Crossout_ElectricPattern_ico",
}

VesselCustomElements.Crossout_Flames =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Flames_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Flames_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Flames_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Flames",
	},

    cant_be_bought	= true,
    uiIco = "Crossout_Flames_ico",
}

VesselCustomElements.Crossout_Frost01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Frost01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Frost01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Frost01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Frost01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Frost01_ico",
}

VesselCustomElements.Crossout_KnightIron =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_KnightIron_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_KnightIron_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_KnightIron_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_KnightIron",
	},

	--prices		= CommonPresetPrices,
	cant_be_bought	= true,
    uiIco = "Crossout_KnightIron_ico",
}

VesselCustomElements.Crossout_Memento01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Memento01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Memento01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Memento01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Memento01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Memento01_ico",
}

VesselCustomElements.Crossout_Mummy01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Mummy01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Mummy01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Mummy01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Mummy01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Mummy01_ico",
}

VesselCustomElements.Crossout_ScaryFaces01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_ScaryFaces01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_ScaryFaces01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_ScaryFaces01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_ScaryFaces01",
	},

	--prices		= CommonPresetPrices,
	cant_be_bought	= true,
    uiIco = "Crossout_ScaryFaces01_ico",
}

VesselCustomElements.Crossout_SpiderWeb =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_SpiderWeb_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_SpiderWeb_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_SpiderWeb_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_SpiderWeb",
	},

	--prices		= CommonPresetPrices,
	cant_be_bought	= true,
    uiIco = "Crossout_SpiderWeb_ico",
}

VesselCustomElements.Crossout_SpiderWeb2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_SpiderWeb_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_SpiderWeb_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_SpiderWeb_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_SpiderWeb2",
	},
	--prices		= CommonPresetPrices,
	cant_be_bought	= true,
    uiIco = "Crossout_SpiderWeb2_ico",
}

VesselCustomElements.Crossout_Trypophobia01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Trypophobia01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Trypophobia01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Trypophobia01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Trypophobia01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Trypophobia01_ico",
}

VesselCustomElements.Crossout_Wood01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Wood01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Wood01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Wood01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Wood01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Wood01_ico",
}

--- SC-111596
VesselCustomElements.Camouflage_CanadianDesert =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Camouflage_CanadianDesert_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Camouflage_CanadianDesert_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Camouflage_CanadianDesert_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Camouflage_CanadianDesert",
	},

	cant_be_bought	= true,
}

VesselCustomElements.Camouflage_GeometryCamo01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Camouflage_GeometryCamo01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Camouflage_GeometryCamo01_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Camouflage_GeometryCamo01_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Camouflage_GeometryCamo01",
	},

	--prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.Camouflage_GeometryCamo02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Camouflage_GeometryCamo02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Camouflage_GeometryCamo02_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Camouflage_GeometryCamo02_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Camouflage_GeometryCamo02",
	},

	--prices		= CommonPresetPrices,
	cant_be_bought	= true,
}

VesselCustomElements.Crossout_StMuerte01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_StMuerte01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_StMuerte01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_StMuerte01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_StMuerte01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_StMuerte01_ico",
}

VesselCustomElements.Crossout_DirtyWhite =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_DirtyWhite_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_DirtyWhite_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_DirtyWhite_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_DirtyWhite",
	},

    cant_be_bought = true,
    uiIco = "Crossout_DirtyWhite_ico",
}

VesselCustomElements.Crossout_Shimapan =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Shimapan_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Shimapan_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Shimapan_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Shimapan",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Shimapan_ico",
}

VesselCustomElements.Crossout_Camouflage05 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage05_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage05_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage05_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage05",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage05_ico",
}

VesselCustomElements.Crossout_GoldTiger =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_GoldTiger_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_GoldTiger_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_GoldTiger_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_GoldTiger",
	},

    cant_be_bought = true,
    uiIco = "Crossout_GoldTiger_ico",
}

VesselCustomElements.Crossout_ScaleFish02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_ScaleFish02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_ScaleFish02_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_ScaleFish02_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_ScaleFish02",
	},

    cant_be_bought = true,
    uiIco = "Crossout_ScaleFish02_ico",
}

VesselCustomElements.Crossout_BulletHoles03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_BulletHoles03_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_BulletHoles03_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_BulletHoles03_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_BulletHoles03",
	},

    cant_be_bought = true,
    uiIco = "Crossout_BulletHoles03_ico",
}

VesselCustomElements.Crossout_Newyear01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Newyear01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Newyear01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Newyear01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Newyear01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Newyear01_ico",
}

VesselCustomElements.Crossout_ScaleFish01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_ScaleFish01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_ScaleFish01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_ScaleFish01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_ScaleFish01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_ScaleFish01_ico",
}

VesselCustomElements.Crossout_AlienwareArena01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_AlienwareArena_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_AlienwareArena_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_AlienwareArena_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_AlienwareArena01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_AlienwareArena01_ico",
}

VesselCustomElements.Crossout_FleurDeLys01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_FleurDeLys01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_FleurDeLys01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_FleurDeLys01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_FleurDeLys01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_FleurDeLys01_ico",
}

VesselCustomElements.Crossout_Youtube01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Youtube_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Youtube_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Youtube_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Youtube01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Youtube01_ico",
}

VesselCustomElements.Crossout_Feb14_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Feb14_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Feb14_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Feb14_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Feb1401",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Feb14_01_ico",
}

VesselCustomElements.Crossout_Valentine01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Valentine01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Valentine01_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Valentine01_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Valentine01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Valentine01_ico",
}

VesselCustomElements.Crossout_DangerStripes01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_DangerStripes01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_DangerStripes01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_DangerStripes01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_DangerStripes01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_DangerStripes01_ico",
}

VesselCustomElements.Crossout_DangerStripes02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_DangerStripes01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_DangerStripes01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_DangerStripes01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_DangerStripes02",
	},

    cant_be_bought = true,
    uiIco = "Crossout_DangerStripes02_ico",
}

VesselCustomElements.Crossout_TurtleShell01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_TurtleShell01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_TurtleShell01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_TurtleShell01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_TurtleShell01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_TurtleShell01_ico",
}

VesselCustomElements.Crossout_Armor02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Armor02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Armor02_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Armor02_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Armor02",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Armor02_ico",
}

VesselCustomElements.Crossout_CamoPixel01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_CamoPixel01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_CamoPixel01_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_CamoPixel01_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_CamoPixel01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_CamoPixel01_ico",
}

VesselCustomElements.Crossout_Camouflage02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage02_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage02_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage02",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage02_ico",
}

VesselCustomElements.Crossout_Camouflage11_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage11_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage11_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage11_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage11_1",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage11_1_ico",
}

VesselCustomElements.Crossout_Camouflage11_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage11_02",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage11_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage11_02",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage11_2",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage11_2_ico",
}

VesselCustomElements.Crossout_Camouflage11_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage11_03",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage11_03",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage11_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage11_3",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage11_3_ico",
}

VesselCustomElements.Crossout_Camouflage13_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage13_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage13_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage13_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage13_1",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage13_1_ico",
}

VesselCustomElements.Crossout_Camouflage13_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage13_02",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage13_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage13_02",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage13_2",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage13_2_ico",
}

VesselCustomElements.Crossout_Camouflage13_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage13_03",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage13_03",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage13_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage13_3",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage13_3_ico",
}

VesselCustomElements.Crossout_Football02_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Football02_1",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Football02_1_ico",
}

VesselCustomElements.Crossout_Football02_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Football02_2",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Football02_2_ico",
}

VesselCustomElements.Crossout_Football02_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Football02_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Football02_3",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Football02_3_ico",
}

VesselCustomElements.Crossout_Football03_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Football03_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Football03_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Football03_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Football03_1",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Football03_1_ico",
}

VesselCustomElements.Crossout_Football03_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Football03_02",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Football03_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Football03_02",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Football03_2",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Football03_2_ico",
}

VesselCustomElements.Crossout_Football03_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Football03_03",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Football03_03",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Football03_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Football03_3",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Football03_3_ico",
}

VesselCustomElements.Crossout_JellyPaint_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_JellyPaint_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_JellyPaint_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_JellyPaint_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_JellyPaint_1",
	},

    cant_be_bought = true,
    uiIco = "Crossout_JellyPaint_1_ico",
}

VesselCustomElements.Crossout_JellyPaint_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_JellyPaint_02",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_JellyPaint_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_JellyPaint_02",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_JellyPaint_2",
	},

    cant_be_bought = true,
    uiIco = "Crossout_JellyPaint_2_ico",
}

VesselCustomElements.Crossout_JellyPaint_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_JellyPaint_03",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_JellyPaint_03",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_JellyPaint_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_JellyPaint_3",
	},

    cant_be_bought = true,
    uiIco = "Crossout_JellyPaint_3_ico",
}

VesselCustomElements.OldGoodPaint_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_Premium_r3_lf1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_Premium_r3_lf3",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_r5_h_cockpit_r1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Turtle_01",
	},

    cant_be_bought = true,
    uiIco = "OldGoodPaint_1_ico",
}

VesselCustomElements.OldGoodPaint_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_Race1_m_t1pr_b1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_Race1_l_spiral_bUSSR",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_Race1_m_t1pr_b1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snow_04",
	},

    cant_be_bought = true,
    uiIco = "OldGoodPaint_2_ico",
}

VesselCustomElements.Crossout_Camouflage01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Camouflage01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Camouflage01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Camouflage01_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Camouflage01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Camouflage01_ico",
}

VesselCustomElements.Crystal_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crystal_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crystal_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crystal_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crystal_1",
	},

    cant_be_bought = true,
    uiIco = "Crystal_1_ico",
}

VesselCustomElements.Crystal_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crystal_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crystal_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crystal_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crystal_2",
	},

    cant_be_bought = true,
    uiIco = "Crystal_2_ico",
}

VesselCustomElements.Crystal_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crystal_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crystal_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crystal_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crystal_3",
	},

    cant_be_bought = true,
    uiIco = "Crystal_3_ico",
}

VesselCustomElements.Stratum_02_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_02_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_02_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_02_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_02_01",
	},

    cant_be_bought = true,
    uiIco = "Stratum_02_01_ico",
}

VesselCustomElements.Stratum_02_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_02_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_02_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_02_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_02_02",
	},

    cant_be_bought = true,
    uiIco = "Stratum_02_02_ico",
}

VesselCustomElements.Stratum_02_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_02_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_02_32",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_02_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_02_03",
	},

    cant_be_bought = true,
    uiIco = "Stratum_02_03_ico",
}

VesselCustomElements.Waves_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Waves_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Waves_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Waves_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Waves_1",
	},

    cant_be_bought = true,
    uiIco = "Waves_1_ico",
}

VesselCustomElements.Waves_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Waves_4",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Waves_5",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Waves_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Waves_2",
	},

    cant_be_bought = true,
    uiIco = "Waves_2_ico",
}

VesselCustomElements.Waves_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Waves_6",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Waves_7",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Waves_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Waves_3",
	},

    cant_be_bought = true,
    uiIco = "Waves_3_ico",
}

VesselCustomElements.Arrows =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Arrows_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Arrows_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Arrows_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Arrows",
	},

    cant_be_bought = true,
    uiIco = "Arrows_ico",
}

VesselCustomElements.Embers =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Ember",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Ember",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Ember",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Embers",
	},

    cant_be_bought = true,
    uiIco = "Embers_ico",
}

VesselCustomElements.Stratum_01_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_01_2",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_01_1",
	},

    cant_be_bought = true,
    uiIco = "Stratum_01_1_ico",
}

VesselCustomElements.Crossout_Armor02_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Armor02_02",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Armor02_03",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Armor02_04",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Armor02",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Armor02_2_ico",
}

VesselCustomElements.Signs_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Signs_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Signs_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Signs_01_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Signs_01",
	},

    cant_be_bought = true,
    uiIco = "Signs_01_ico",
}

VesselCustomElements.Signs_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Signs_01_2",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Signs_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Signs_01_2",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Signs_01",
	},

    cant_be_bought = true,
    uiIco = "Signs_02_ico",
}

VesselCustomElements.Signs_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Signs_01_3",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Signs_01_3",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Signs_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Signs_01",
	},

    cant_be_bought = true,
    uiIco = "Signs_03_ico",
}

VesselCustomElements.Pyramids =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pyramids_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pyramids_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pyramids_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pyramids",
	},

    cant_be_bought = true,
    uiIco = "Pyramids_ico",
}

VesselCustomElements.Curved =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Curved_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Curved_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Curved_2",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Curved",
	},

    cant_be_bought = true,
    uiIco = "Curved_ico",
}

VesselCustomElements.Stairs =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stairs_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stairs_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stairs_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stairs",
	},

    cant_be_bought = true,
    uiIco = "Stairs_ico",
}

VesselCustomElements.Stratum_01_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_01_3",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_01_3",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_01_4",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_01_2",
	},

    cant_be_bought = true,
    uiIco = "Stratum_01_2_ico",
}

VesselCustomElements.Orange =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Orange",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Orange",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Orange",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Orange",
	},

    cant_be_bought = true,
    uiIco = "Orange_ico",
}

VesselCustomElements.NY19_Holiday02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_newYear19_holiday_4",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_newYear19_holiday_4",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_newYear19_holiday_4",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "NY19_Holiday01",
	},

    cant_be_bought = true,
    uiIco = "NY19_Holiday02_ico",
}

VesselCustomElements.Crossout_Newyear02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Newyear01_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Newyear01_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Newyear01_02",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Newyear02",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Newyear02_ico",
}

VesselCustomElements.Triangles =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Triangles_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Triangles_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Triangles_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Triangles_1",
	},

    cant_be_bought = true,
    uiIco = "Triangles_ico",
}

VesselCustomElements.Rhombus =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Rhombus_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Rhombus_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Rhombus_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Rhombus_01",
	},

    cant_be_bought = true,
    uiIco = "Rhombus_ico",
}

VesselCustomElements.Mosaic =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Mosaic_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Mosaic_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Mosaic_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Mosaic_01",
	},

    cant_be_bought = true,
    uiIco = "Mosaic_ico",
}

VesselCustomElements.Waves =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Waves_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Waves_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Waves_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Waves_21",
	},

    cant_be_bought = true,
    uiIco = "Waves_ico",
}

VesselCustomElements.Diagonals =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Diagonals_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Diagonals_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Diagonals_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Diagonals_01",
	},

    cant_be_bought = true,
    uiIco = "Diagonals_ico",
}

VesselCustomElements.Blots =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Blots_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Blots_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Blots_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Blots_01",
	},

    cant_be_bought = true,
    uiIco = "Blots_ico",
}

VesselCustomElements.Empire =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Fraction_Empire_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Fraction_Empire_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Fraction_Empire_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Fraction_Empire01",
	},

    cant_be_bought = true,
    uiIco = "Empire_ico",
}

VesselCustomElements.Federation =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Fraction_Federation_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Fraction_Federation_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Fraction_Federation_12",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Fraction_Federation01",
	},

    cant_be_bought = true,
    uiIco = "Federation_ico",
}

VesselCustomElements.Jeriho =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Fraction_Jeriho_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Fraction_Jeriho_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Fraction_Jeriho_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Fraction_Jeriho01",
	},

    cant_be_bought = true,
    uiIco = "Jeriho_ico",
}

VesselCustomElements.Crossout_Mts =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Mts_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Mts_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Mts_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Mts",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Mts_ico",
}

VesselCustomElements.Feb14_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Feb14_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Feb14_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Feb14_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Feb14_02",
	},

    cant_be_bought = true,
    uiIco = "Feb14_02_ico",
}

VesselCustomElements.Feb23_Camouflage01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Feb23_Camouflage01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Feb23_Camouflage01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Feb23_Camouflage01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Feb23_Camouflage01",
	},

    cant_be_bought = true,
    uiIco = "Feb23_Camouflage01_ico",
}

VesselCustomElements.Triangles_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Triangles_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Triangles_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Triangles_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Triangles_2",
	},

    cant_be_bought = true,
    uiIco = "Triangles_2_ico",
}

VesselCustomElements.Flowers_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Flowers_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Flowers_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Flowers_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Flowers_01",
	},

    cant_be_bought = true,
    uiIco = "Flowers_01_ico",
}

VesselCustomElements.Thorn_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Thorn_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Thorn_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Thorn_12",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Thorn_01",
	},

    cant_be_bought = true,
    uiIco = "Thorn_01_ico",
}

VesselCustomElements.SunGlare =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_SunGlare_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_SunGlare_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_SunGlare_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "SunGlare_01",
	},

    cant_be_bought = true,
    uiIco = "SunGlare_ico",
}

VesselCustomElements.Spheres =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Spheres_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Spheres_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Spheres_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Spheres_01",
	},

    cant_be_bought = true,
    uiIco = "Spheres_ico",
}

VesselCustomElements.Lines =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Lines_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Lines_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Lines_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Lines_01",
	},

    cant_be_bought = true,
    uiIco = "Lines_ico",
}

VesselCustomElements.Blots_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Blots_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Blots_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Blots_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Blots_02",
	},

    cant_be_bought = true,
    uiIco = "Blots_02_ico",
}

VesselCustomElements.Levels =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Levels_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Levels_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Levels_01_2",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Levels_1",
	},

    cant_be_bought = true,
    uiIco = "Levels_ico",
}

VesselCustomElements.Mosaic_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Mosaic_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Mosaic_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Mosaic_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Mosaic_02",
	},

    cant_be_bought = true,
    uiIco = "Mosaic_02_ico",
}

VesselCustomElements.Triangles_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Triangles_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Triangles_32",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Triangles_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Triangles_3",
	},

    cant_be_bought = true,
    uiIco = "Triangles_3_ico",
}

VesselCustomElements.CropCircle =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Signs_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Signs_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Signs_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Signs_02",
	},

    cant_be_bought = true,
    uiIco = "CropCircle_ico",
}

VesselCustomElements.Seastar_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Seastar_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Seastar_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Seastar_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Seastar_01",
	},

    cant_be_bought = true,
    uiIco = "Seastar_01_ico",
}

VesselCustomElements.ToadCover_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ToadCover_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ToadCover_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ToadCover_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ToadCover_01",
	},

    cant_be_bought = true,
    uiIco = "ToadCover_01_ico",
}

VesselCustomElements.Actinia_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Actinia_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Actinia_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Actinia_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Actinia_01",
	},

    cant_be_bought = true,
    uiIco = "Actinia_01_ico",
}

VesselCustomElements.Sand_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Sand_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Sand_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Sand_01_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Sand_01",
	},

    cant_be_bought = true,
    uiIco = "Sand_01_ico",
}

VesselCustomElements.Stars_31 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stars_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stars_32",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stars_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stars_31",
	},

    cant_be_bought = true,
    uiIco = "Stars_31_ico",
}

VesselCustomElements.Flowers_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Flowers_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Flowers_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Flowers_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Flowers_02",
	},

    cant_be_bought = true,
    uiIco = "Flowers_02_ico",
}

VesselCustomElements.Bubbles_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Bubbles_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Bubbles_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Bubbles_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Bubbles_01",
	},

    cant_be_bought = true,
    uiIco = "Bubbles_01_ico",
}

VesselCustomElements.Seashell_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Seashell_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Seashell_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Seashell_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Seashell_01",
	},

    cant_be_bought = true,
    uiIco = "Seashell_01_ico",
}

VesselCustomElements.Precursor03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Prec_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Prec_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Prec_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Precursor03",
	},

    cant_be_bought = true,
    uiIco = "Precursor03_ico",
}

VesselCustomElements.Fraction_Jeriho02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Fraction_Jeriho_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Fraction_Jeriho_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Fraction_Jeriho_21",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Fraction_Jeriho02",
	},

    cant_be_bought = true,
    uiIco = "Fraction_Jeriho02_ico",
}

VesselCustomElements.Pyramids02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pyramids_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pyramids_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pyramids_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pyramids02",
	},

    cant_be_bought = true,
    uiIco = "Pyramids02_ico",
}

VesselCustomElements.Waves_31 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Waves_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Waves_32",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Waves_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Waves_31",
	},

    cant_be_bought = true,
    uiIco = "Waves_31_ico",
}

VesselCustomElements.Eyes_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Eyes_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Eyes_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Eyes_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Eyes_01",
	},

    cant_be_bought = true,
    uiIco = "Eyes_01_ico",
}


VesselCustomElements.Arms_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Arms_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Arms_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Arms_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Arms_01",
	},

    cant_be_bought = true,
    uiIco = "Arms_01_ico",
}

VesselCustomElements.Curse_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Curse_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Curse_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Curse_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Curse_01",
	},

    cant_be_bought = true,
    uiIco = "Curse_01_ico",
}

VesselCustomElements.Levels_2 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Levels_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Levels_02_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Levels_02_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Levels_2",
	},

    cant_be_bought = true,
    uiIco = "Levels_2_ico",
}

VesselCustomElements.PeelingPaint_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_PeelingPaint_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_PeelingPaint_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_PeelingPaint_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "PeelingPaint_01",
	},

    cant_be_bought = true,
    uiIco = "PeelingPaint_01_ico",
}

VesselCustomElements.Sheets_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Sheets_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Sheets_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Sheets_01_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Sheets_01",
	},

    cant_be_bought = true,
    uiIco = "Sheets_01_ico",
}

VesselCustomElements.Lines_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Lines_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Lines_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Lines_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Lines_02",
	},

    cant_be_bought = true,
    uiIco = "Lines_02_ico",
}

VesselCustomElements.Lines_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Lines_03_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Lines_03_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Lines_03_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Lines_03",
	},

    cant_be_bought = true,
    uiIco = "Lines_03_ico",
}

VesselCustomElements.Moss_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Moss_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Moss_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Moss_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Moss_01",
	},

    cant_be_bought = true,
    uiIco = "Moss_01_ico",
}

VesselCustomElements.Overgrown_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Overgrown_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Overgrown_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Overgrown_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Overgrown_01",
	},

    cant_be_bought = true,
    uiIco = "Overgrown_01_ico",
}

VesselCustomElements.Blots_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Blots_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Blots_32",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Blots_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Blots_03",
	},

    cant_be_bought = true,
    uiIco = "Blots_03_ico",
}

VesselCustomElements.Drips_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Drips_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Drips_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Drips_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Drips_01",
	},

    cant_be_bought = true,
    uiIco = "Drips_01_ico",
}

VesselCustomElements.Step_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Step_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Step_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Step_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Step_01",
	},

    cant_be_bought = true,
    uiIco = "Step_01_ico",
}

VesselCustomElements.StoneSlabs_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_StoneSlabs_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_StoneSlabs_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_StoneSlabs_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "StoneSlabs_01",
	},

    cant_be_bought = true,
    uiIco = "StoneSlabs_01_ico",
}

VesselCustomElements.StoneSlabs_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_StoneSlabs_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_StoneSlabs_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_StoneSlabs_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "StoneSlabs_02",
	},

    cant_be_bought = true,
    uiIco = "StoneSlabs_02_ico",
}

VesselCustomElements.Pattern_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_01",
	},

    cant_be_bought = true,
    uiIco = "Pattern_01_ico",
}

VesselCustomElements.Lines_04 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Lines_04_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Lines_04_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Lines_04_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Lines_04",
	},

    cant_be_bought = true,
    uiIco = "Lines_04_ico",
}

VesselCustomElements.Feb23_Camouflage02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Feb23_Camouflage021",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Feb23_Camouflage021",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Feb23_Camouflage023",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Feb23_Camouflage02",
	},

    cant_be_bought = true,
    uiIco = "Feb23_Camouflage02_ico",
}

VesselCustomElements.Octopus_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Octopus_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Octopus_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Octopus_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Octopus_01",
	},

    cant_be_bought = true,
    uiIco = "Octopus_01_ico",
}

VesselCustomElements.Stratum_03_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_03_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_03_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_03_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_03_01",
	},

    cant_be_bought = true,
    uiIco = "Stratum_03_01_ico",
}

VesselCustomElements.Sakura_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Sakura_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Sakura_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Sakura_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Sakura_01",
	},

    cant_be_bought = true,
    uiIco = "Sakura_01_ico",
}

VesselCustomElements.Net_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Net_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Net_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Net_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Net_01",
	},

    cant_be_bought = true,
    uiIco = "Net_01_ico",
}

VesselCustomElements.Moon_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Moon_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Moon_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Moon_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Moon_01",
	},

    cant_be_bought = true,
    uiIco = "Moon_01_ico",
}

VesselCustomElements.Flowers_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Flowers_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Flowers_32",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Flowers_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Flowers_03",
	},

    cant_be_bought = true,
    uiIco = "Flowers_03_ico",
}

VesselCustomElements.Cardboard_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Cardboard_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Cardboard_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Cardboard_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Cardboard_01",
	},

    cant_be_bought = true,
    uiIco = "Cardboard_01_ico",
}

VesselCustomElements.Circles_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Circles_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Circles_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Circles_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Circles_01",
	},

    cant_be_bought = true,
    uiIco = "Circles_01_ico",
}

VesselCustomElements.Pikabu_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pikabu_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pikabu_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pikabu_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pikabu_01",
	},

    cant_be_bought = true,
    uiIco = "Pikabu_01_ico",
}

VesselCustomElements.Circles_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Circles_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Circles_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Circles_21",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Circles_02",
	},

    cant_be_bought = true,
    uiIco = "Circles_02_ico",
}

VesselCustomElements.Circles_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Circles_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Circles_32",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Circles_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Circles_03",
	},

    cant_be_bought = true,
    uiIco = "Circles_03_ico",
}

VesselCustomElements.Flowers_04 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Flowers_41",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Flowers_42",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Flowers_43",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Flowers_04",
	},

    cant_be_bought = true,
    uiIco = "Flowers_04_ico",
}

VesselCustomElements.Waves_41 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Waves_41",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Waves_42",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Waves_43",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Waves_41",
	},

    cant_be_bought = true,
    uiIco = "Waves_41_ico",
}

VesselCustomElements.Lines_05 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Lines_05_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Lines_05_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Lines_05_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Lines_05",
	},

    cant_be_bought = true,
    uiIco = "Lines_05_ico",
}

VesselCustomElements.Crossout_BloodHand02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_BloodHand_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_BloodHand_21",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_BloodHand_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_BloodHand02",
	},

    cant_be_bought = true,
    uiIco = "Crossout_BloodHand02_ico",
}

VesselCustomElements.BP8_Polygon_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Polygon_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Polygon_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Polygon_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Polygon_01",
	},

    cant_be_bought = true,
    uiIco = "BP8_Polygon_01_ico",
}

VesselCustomElements.BP8_Circles_04 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Circles_41",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Circles_41",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Circles_43",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Circles_04",
	},

    cant_be_bought = true,
    uiIco = "BP8_Circles_04_ico",
}

VesselCustomElements.BP8_Circles_05 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Circles_51",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Circles_52",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Circles_53",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Circles_05",
	},

    cant_be_bought = true,
    uiIco = "BP8_Circles_05_ico",
}

VesselCustomElements.BP8_Triangles_4 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Triangles_41",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Triangles_42",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Triangles_43",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Triangles_4",
	},

    cant_be_bought = true,
    uiIco = "BP8_Triangles_4_ico",
}

VesselCustomElements.BP8_Curves_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Curves_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Curves_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Curves_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Curves_01",
	},

    cant_be_bought = true,
    uiIco = "BP8_Curves_01_ico",
}

VesselCustomElements.BP8_Pyramids03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pyramids_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pyramids_31",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pyramids_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pyramids03",
	},

    cant_be_bought = true,
    uiIco = "BP8_Pyramids03_ico",
}

VesselCustomElements.BP8_Net_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Net_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Net_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Net_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Net_02",
	},

    cant_be_bought = true,
    uiIco = "BP8_Net_02_ico",
}

VesselCustomElements.BP8_Polygon_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Polygon_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Polygon_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Polygon_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Polygon_02",
	},

    cant_be_bought = true,
    uiIco = "BP8_Polygon_02_ico",
}

VesselCustomElements.BP8_Net_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Net_03_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Net_03_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Net_03_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Net_03",
	},

    cant_be_bought = true,
    uiIco = "BP8_Net_03_ico",
}

VesselCustomElements.BP8_Bubbles_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Bubbles_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Bubbles_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Bubbles_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Bubbles_02",
	},

    cant_be_bought = true,
    uiIco = "BP8_Bubbles_02_ico",
}

VesselCustomElements.BP8_Curves_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Curves_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Curves_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Curves_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Curves_02",
	},

    cant_be_bought = true,
    uiIco = "BP8_Curves_02_ico",
}

VesselCustomElements.BP8_Thorn_012 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Thorn_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Thorn_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Thorn_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Thorn_012",
	},

    cant_be_bought = true,
    uiIco = "BP8_Thorn_012_ico",
}

VesselCustomElements.BP9_Eyes_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Eyes_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Eyes_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Eyes_22",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Eyes_02",
	},

    cant_be_bought = true,
    uiIco = "BP9_Eyes_02_ico",
}

VesselCustomElements.BP9_Spiral_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Spiral_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Spiral_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Spiral_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Spiral_1",
	},

    cant_be_bought = true,
    uiIco = "BP9_Spiral_1_ico",
}

VesselCustomElements.BP9_Loose_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Loose_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Loose_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Loose_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Loose_1",
	},

    cant_be_bought = true,
    uiIco = "BP9_Loose_1_ico",
}

VesselCustomElements.BP9_Levels_3 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Levels_03_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Levels_03_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Levels_03_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Levels_3",
	},

    cant_be_bought = true,
    uiIco = "BP9_Levels_3_ico",
}

VesselCustomElements.BP9_Rhombus_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Rhombus_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Rhombus_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Rhombus_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Rhombus_02",
	},

    cant_be_bought = true,
    uiIco = "BP9_Rhombus_02_ico",
}

VesselCustomElements.BP9_Curse_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Curse_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Curse_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Curse_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Curse_01",
	},

    cant_be_bought = true,
    uiIco = "BP9_Curse_01_ico",
}

VesselCustomElements.BP9_Thorn_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Thorn_31",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Thorn_32",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Thorn_33",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Thorn_03",
	},

    cant_be_bought = true,
    uiIco = "BP9_Thorn_03_ico",
}

VesselCustomElements.BP9_Lines_07 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Lines_07_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Lines_07_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Lines_07_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Lines_07",
	},

    cant_be_bought = true,
    uiIco = "BP9_Lines_07_ico",
}

VesselCustomElements.BP9_Lines_06 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Lines_06_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Lines_06_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Lines_06_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Lines_06",
	},

    cant_be_bought = true,
    uiIco = "BP9_Lines_06_ico",
}


VesselCustomElements.BP9_Net_05 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Net_05_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Net_05_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Net_05_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Net_05",
	},

    cant_be_bought = true,
    uiIco = "BP9_Net_05_ico",
}

VesselCustomElements.BP9_Net_04 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Net_04_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Net_04_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Net_04_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Net_04",
	},

    cant_be_bought = true,
    uiIco = "BP9_Net_04_ico",
}

VesselCustomElements.BP9_Levels_4 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Levels_04_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Levels_04_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Levels_04_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Levels_4",
	},

    cant_be_bought = true,
    uiIco = "BP9_Levels_4_ico",
}

----------------------------

VesselCustomElements.BP10_Stratum_04 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_04_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_04_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_04_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_04",
	},

    cant_be_bought = true,
    uiIco = "BP10_Stratum_04_ico",
}

VesselCustomElements.BP10_Stratum_05 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_05_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_05_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_05_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_05",
	},

    cant_be_bought = true,
    uiIco = "BP10_Stratum_05_ico",
}

VesselCustomElements.BP10_Stratum_06 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_06_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_06_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_06_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_06",
	},

    cant_be_bought = true,
    uiIco = "BP10_Stratum_06_ico",
}


VesselCustomElements.BP10_Stratum_07 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_07_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_07_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_07_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_07",
	},

    cant_be_bought = true,
    uiIco = "BP10_Stratum_07_ico",
}

VesselCustomElements.BP10_Stratum_08 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_08_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_08_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_08_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_08",
	},

    cant_be_bought = true,
    uiIco = "BP10_Stratum_08_ico",
}

VesselCustomElements.BP10_Stratum_09 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stratum_09_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stratum_09_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stratum_09_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stratum_09",
	},

    cant_be_bought = true,
    uiIco = "BP10_Stratum_09_ico",
}

----------------------------

VesselCustomElements.BP10_Candy_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Candy_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Candy_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Candy_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Candy_01",
	},

    cant_be_bought = true,
    uiIco = "BP10_Candy_01_ico",
}

VesselCustomElements.BP10_Snowflake_01_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Snowflake_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Snowflake_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Snowflake_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snowflake_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP10_Snowflake_01_1_ico",
}

VesselCustomElements.BP10_Cat_01_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Cat_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Cat_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Cat_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Cat_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP10_Cat_01_1_ico",
}


VesselCustomElements.BP10_Needles_01_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Needles_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Needles_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Needles_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Needles_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP10_Needles_01_1_ico",
}

VesselCustomElements.BP10_Net_06 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Net_06_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Net_06_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Net_06_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Net_06",
	},

    cant_be_bought = true,
    uiIco = "BP10_Net_06_ico",
}

VesselCustomElements.BP10_Glove_01_1 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Glove_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Glove_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Glove_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Glove_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP10_Glove_01_1_ico",
}

VesselCustomElements.SC_Birthday_23 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Holiday_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Holiday_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Holiday_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Holiday_02_1",
	},

    cant_be_bought = true,
    uiIco = "SC_Birthday_23_ico",
}

----------------------------

VesselCustomElements.BP11_Pattern_02 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_02",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_02_ico",
}

VesselCustomElements.BP11_Pattern_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_03_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_03_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_03_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_03",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_03_ico",
}

VesselCustomElements.BP11_Pattern_04 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_04_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_04_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_04_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_04",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_04_ico",
}


VesselCustomElements.BP11_Pattern_05 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_05_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_05_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_05_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_05",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_05_ico",
}

VesselCustomElements.BP11_Pattern_06 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_06_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_06_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_06_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_06",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_06_ico",
}

VesselCustomElements.BP11_Triangles_5 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Triangles_5_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Triangles_5_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Triangles_5_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Triangles_5",
	},

    cant_be_bought = true,
    uiIco = "BP11_Triangles_5_ico",
}

VesselCustomElements.Feb14_03 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Feb14_3_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Feb14_3_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Feb14_3_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Feb14_03",
	},

    cant_be_bought = true,
    uiIco = "Feb14_03_ico",
}

VesselCustomElements.Dino_01 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Dino_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Dino_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Dino_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Dino_01",
	},

    cant_be_bought = true,
    uiIco = "Dino_01_ico",
}

VesselCustomElements.Stars_04 =
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Stars_04_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Stars_04_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Stars_04_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Stars_04_01",
	},

    cant_be_bought = true,
    uiIco = "Stars_04_ico",
}

--SC-117642 Покраски Боевой пропуск 2 этап весна 2023г. / Battlepass spring 2nd step 2023

VesselCustomElements.BP11_Pattern_07 = -- Боевые шрамы
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_07_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_07_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_07_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_07",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_07_ico",
}

VesselCustomElements.BP11_Pattern_08 = -- Бдительность
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_08_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_08_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_08_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_08",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_08_ico",
}

VesselCustomElements.BP11_Pattern_09 = -- Плавные изгибы
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_09_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_09_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_09_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_09",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_09_ico",
}

VesselCustomElements.BP11_Pattern_10 = -- Естественная защита
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_10_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_10_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_10_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_10",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_10_ico",
}

VesselCustomElements.BP11_Pattern_11 = -- Первобытный окрас
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_11_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_11_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_11_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_11",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_11_ico",
}

VesselCustomElements.BP11_Pattern_12 = -- Хищный окрас
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_12_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_12_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_12_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_12",
	},

    cant_be_bought = true,
    uiIco = "BP11_Pattern_12_ico",
}

-- SC-117631 Покраски Боевой пропуск 1 этап лето 2023г. / Battlepass summer 1st step 2023

VesselCustomElements.BP12_Jewelry_01 = -- Золотая лихорадка
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Jewelry_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Jewelry_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Jewelry_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Jewelry_01",
	},

    cant_be_bought = true,
    uiIco = "BP12_Jewelry_01_ico",
}

VesselCustomElements.BP12_Skull_01 = -- Чёрная метка
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Skull_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Skull_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Skull_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Skull_01",
	},

    cant_be_bought = true,
    uiIco = "BP12_Skull_01_ico",
}

VesselCustomElements.BP12_Jewelry_02 = -- Большой куш
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Jewelry_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Jewelry_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Jewelry_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Jewelry_02",
	},

    cant_be_bought = true,
    uiIco = "BP12_Jewelry_02_ico",
}

VesselCustomElements.BP12_Lines_08 = -- Нити власти
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Lines_08_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Lines_08_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Lines_08_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Lines_08",
	},

    cant_be_bought = true,
    uiIco = "BP12_Lines_08_ico",
}

VesselCustomElements.BP12_Jewelry_03 = -- Доспехи бога
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Jewelry_03_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Jewelry_03_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Jewelry_03_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Jewelry_03",
	},

    cant_be_bought = true,
    uiIco = "BP12_Jewelry_03_ico",
}

VesselCustomElements.BP12_Pattern_13 = -- Касание Мидаса
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_13_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_13_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_13_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_13",
	},

    cant_be_bought = true,
    uiIco = "BP12_Pattern_13_ico",
}

--- SC-117663 Покраски за участие в турнирах "Уютного Уголка"

VesselCustomElements.Liquid_03 = -- Металл Элизиума (зелёная)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Liquid3",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Liquid3",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Liquid3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Liquid_03",
	},

    cant_be_bought = true,
    uiIco = "Liquid_03_ico",
}

VesselCustomElements.Precursor04 = -- Неотвратимость (розовая)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Prec_4",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Prec_4",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Prec_4",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Precursor04",
	},

    cant_be_bought = true,
    uiIco = "Precursor04_ico",
}

VesselCustomElements.Precursor05 = -- Бесконечность (фиолетовая)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Prec_5",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Prec_5",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Prec_5",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Precursor05",
	},

    cant_be_bought = true,
    uiIco = "Precursor05_ico",
}

-- SC-117636 Покраски Боевой пропуск 2 этап лето 2023г. / Battlepass summer 2nd step 2023

VesselCustomElements.BP12_Jewelry_04 = -- Бурлеск
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Jewelry_04_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Jewelry_04_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Jewelry_04_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Jewelry_04",
	},

    cant_be_bought = true,
    uiIco = "BP12_Jewelry_04_ico",
}

VesselCustomElements.BP12_Jewelry_05 = -- Незаходящее солнце
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Jewelry_05_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Jewelry_05_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Jewelry_05_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Jewelry_05",
	},

    cant_be_bought = true,
    uiIco = "BP12_Jewelry_05_ico",
}

VesselCustomElements.BP12_Brassknuckles_01 = -- Вооружён и опасен
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Brassknuckles_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Brassknuckles_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Brassknuckles_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Brassknuckles_01",
	},

    cant_be_bought = true,
    uiIco = "BP12_Brassknuckles_01_ico",
}

VesselCustomElements.BP12_Coins_1 = -- Нокс
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Coins_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Coins_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Coins_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Coins_1",
	},

    cant_be_bought = true,
    uiIco = "BP12_Coins_1_ico",
}

VesselCustomElements.BP12_Spinal_01 = -- Бурое золото
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Spinal_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Spinal_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Spinal_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Spinal_01",
	},

    cant_be_bought = true,
    uiIco = "BP12_Spinal_01_ico",
}

VesselCustomElements.BP12_Snake_01 = -- Ползущий
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Spinal_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Snake_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Snake_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snake_01",
	},

    cant_be_bought = true,
    uiIco = "BP12_Snake_01_ico",
}

VesselCustomElements.BP12_Snake_02 = -- Ползущий 2
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Spinal_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Snake_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Snake_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Snake_02",
	},

    cant_be_bought = true,
    uiIco = "BP12_Snake_02_ico",
}

-- SC-117871 Покраски Боевой пропуск 1 фаза осень 2023г. / Battlepass autumn 1st phase 2023

VesselCustomElements.BP13_DarkSigns_01 = -- Стальные руны
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_DarkSigns_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_DarkSigns_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_DarkSigns_01_2",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "DarkSigns_01",
	},

    cant_be_bought = true,
    uiIco = "BP13_DarkSigns_01_ico",
}

VesselCustomElements.BP13_DarkSigns_02 = -- Дурное знамение
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_DarkSigns_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_DarkSigns_02_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_DarkSigns_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "DarkSigns_02",
	},

    cant_be_bought = true,
    uiIco = "BP13_DarkSigns_02_ico",
}

VesselCustomElements.BP13_Crowning_01 = -- Медный рассвет
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crowning_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crowning_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crowning_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crowning_01",
	},

    cant_be_bought = true,
    uiIco = "BP13_Crowning_01_ico",
}

VesselCustomElements.BP13_DarkSigns_03 = -- Ограждающий символ
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_DarkSigns_03_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_DarkSigns_03_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_DarkSigns_03_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "DarkSigns_03",
	},

    cant_be_bought = true,
    uiIco = "BP13_DarkSigns_03_ico",
}

VesselCustomElements.BP13_Flowers_05 = -- Семпоаль
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Flowers_51",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Flowers_51",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Flowers_53",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Flowers_05",
	},

    cant_be_bought = true,
    uiIco = "BP13_Flowers_05_ico",
}

VesselCustomElements.BP13_Crossout_StMuerte02 = -- Калаверас
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_StMuerte02_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_StMuerte02_02",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_StMuerte02_03",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_StMuerte02",
	},

    cant_be_bought = true,
    uiIco = "BP13_Crossout_StMuerte02_ico",
}

-- SC-118275 Покраска "Занавес" для ивентпасса "Архивы ЕЦН: Выживание"

VesselCustomElements.Pattern_14 = -- Занавес
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Pattern_14_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Pattern_14_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Pattern_14_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Pattern_14",
	},

    cant_be_bought = true,
    uiIco = "Pattern_14_ico",
}

-- SC-117872 Покраски Боевой пропуск 2 фаза осень 2023г. / Battlepass autumn 2nd phase 2023

VesselCustomElements.BP13_DarkSigns_04 = -- Тёмная звезда
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_DarkSigns_04_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_DarkSigns_04_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_DarkSigns_04_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "DarkSigns_04",
	},

    cant_be_bought = true,
    uiIco = "BP13_DarkSigns_04_ico",
}

VesselCustomElements.BP13_DarkSigns_05 = -- Серые лепестки
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_DarkSigns_05_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_DarkSigns_05_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_DarkSigns_05_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "DarkSigns_05",
	},

    cant_be_bought = true,
    uiIco = "BP13_DarkSigns_05_ico",
}

VesselCustomElements.BP13_Plates_01 = -- Шестиугольная кольчуга
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Plates_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Plates_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Plates_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Plates_01",
	},

    cant_be_bought = true,
    uiIco = "BP13_Plates_01_ico",
}

VesselCustomElements.BP13_Skull_02 = -- Кавалер Риверы
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Skull_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Skull_02_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Skull_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Skull_02",
	},

    cant_be_bought = true,
    uiIco = "BP13_Skull_02_ico",
}

VesselCustomElements.BP13_Leaves_01 = -- Бархатный покров
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Leaves_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Leaves_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Leaves_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Leaves_01",
	},

    cant_be_bought = true,
    uiIco = "BP13_Leaves_01_ico",
}

VesselCustomElements.BP13_DarkSigns_06 = -- Ритуал Сердце Небес
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_DarkSigns_06_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_DarkSigns_06_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_DarkSigns_06_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "DarkSigns_06",
	},

    cant_be_bought = true,
    uiIco = "BP13_DarkSigns_06_ico",
}

-- SC-118209 Покраски Боевой пропуск 1 фаза зима 2023-2024 / Battlepass winter 1st phase 2023-2024

VesselCustomElements.BP14_ChineseClouds_01_1 = -- Золотой закат
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseClouds_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseClouds_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseClouds_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseClouds_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseClouds_01_1_ico",
}

VesselCustomElements.BP14_ChineseClouds_02_1 = -- Наступающая буря
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseClouds_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseClouds_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseClouds_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseClouds_02_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseClouds_02_1_ico",
}

VesselCustomElements.BP14_ChineseLamp_01_1 = -- Символ богатства
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseLamp_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseLamp_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseLamp_01_1",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseLamp_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseLamp_01_1_ico",
}

VesselCustomElements.BP14_ChineseUmbrella_01_1 = -- Фарфор
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseUmbrella_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseUmbrella_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseUmbrella_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseUmbrella_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseUmbrella_01_1_ico",
}

VesselCustomElements.BP14_ChineseCircles_01_1 = -- Пожелание удачи
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseCircles_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseCircles_01_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseCircles_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseCircles_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseCircles_01_1_ico",
}

VesselCustomElements.BP14_ChineseSymbol_01_1 = -- Долголетие
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseSymbol_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseSymbol_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseSymbol_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseSymbol_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseSymbol_01_1_ico",
}

-- SC-118511 Покраски Боевой пропуск 2 фаза зима 2023-2024 / Battlepass winter 2nd phase 2023-2024

VesselCustomElements.BP14_ChineseLamp_02_1 = -- Огни фестиваля
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseLamp_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseLamp_02_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseLamp_02_2",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseLamp_02_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseLamp_02_1_ico",
}

VesselCustomElements.BP14_ChineseRoof_01_1 = -- Шифер (не Клавдия!)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseRoof_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseRoof_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseRoof_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseRoof_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseRoof_01_1_ico",
}

VesselCustomElements.BP14_ChineseDragon_01_1 = -- Уроборос
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseDragon_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseDragon_01_3",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseDragon_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseDragon_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseDragon_01_1_ico",
}

VesselCustomElements.BP14_ChineseBamboo_01_1 = -- Бамбуковые заросли
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseBamboo_01_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseBamboo_01_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseBamboo_01_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseBamboo_01_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseBamboo_01_1_ico",
}

VesselCustomElements.BP14_ChineseSymbol_02_1 = -- Орнамент
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseSymbol_02_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseSymbol_02_1",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseSymbol_02_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseSymbol_02_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseSymbol_02_1_ico",
}

VesselCustomElements.BP14_ChineseClouds_03_1 = -- Облачная башня
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_ChineseClouds_03_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_ChineseClouds_03_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_ChineseClouds_03_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "ChineseClouds_03_1",
	},

    cant_be_bought = true,
    uiIco = "BP14_ChineseClouds_03_1_ico",
}

-- SC-118530 Покраска к Праздничный набор №12 к ДР игры

VesselCustomElements.Preset_Birthday_2024_1 = -- Праздничная 2024
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Birthday_2024_1",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Birthday_2024_2",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Birthday_2024_3",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Birthday_2024_1",
	},

    cant_be_bought = true,
    uiIco = "Preset_Birthday_2024_1_ico",
}

-- SC-118709 Покраски Боевой пропуск 1 фаза весна 2024 / Battlepass spring 1st phase 2024

VesselCustomElements.BP15_BlackHole01 = -- Солнечный ветер
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_BlackHole_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_BlackHole_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_BlackHole_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_BlackHole01",
	},

    cant_be_bought = true,
    uiIco = "BP15_BlackHole01_ico",
}

VesselCustomElements.BP15_Chain01 = -- Карбоновый слой
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Chain_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Chain_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Chain_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Chain01",
	},

    cant_be_bought = true,
    uiIco = "BP15_Chain01_ico",
}

VesselCustomElements.BP15_LiquidCrystal01 = -- Плазматический покров
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_LiquidCrystal_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_LiquidCrystal_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_LiquidCrystal_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_LiquidCrystal01",
	},

    cant_be_bought = true,
    uiIco = "BP15_LiquidCrystal01_ico",
}

VesselCustomElements.BP15_Brain01 = -- Мыслительный процесс
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Brain_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Brain_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Brain_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Brain01",
	},

    cant_be_bought = true,
    uiIco = "BP15_Brain01_ico",
}

VesselCustomElements.BP15_Neurons01 = -- Синапс
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Neurons_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Neurons_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Neurons_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Neurons01",
	},

    cant_be_bought = true,
    uiIco = "BP15_Neurons01_ico",
}

VesselCustomElements.BP15_Dna01 = -- Нить жизни
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Dna_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Dna_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Dna_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Dna01",
	},

    cant_be_bought = true,
    uiIco = "BP15_Dna01_ico",
}

-- SC-118817 Покраски Боевой пропуск 2 фаза весна 2024 / Battlepass spring 2st phase 2024

VesselCustomElements.BP15_Unknownbiohazard = -- Угроза вымирания
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Unknownbiohazard_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Unknownbiohazard_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Unknownbiohazard_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Unknownbiohazard",
	},

    cant_be_bought = true,
    uiIco = "BP15_Unknownbiohazard_ico",
}

VesselCustomElements.BP15_Ionizingliquid = -- Радиоактивные воды
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Ionizingliquid_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Ionizingliquid_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Ionizingliquid_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Ionizingliquid",
	},

    cant_be_bought = true,
    uiIco = "BP15_Ionizingliquid_ico",
}

VesselCustomElements.BP15_Star = -- Звёздное небо
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Star_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Star_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Star_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Star",
	},

    cant_be_bought = true,
    uiIco = "BP15_Star_ico",
}

VesselCustomElements.BP15_Chlorophyll = -- Трава у дома
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Chlorophyll_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Chlorophyll_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Chlorophyll_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Chlorophyll",
	},

    cant_be_bought = true,
    uiIco = "BP15_Chlorophyll_ico",
}

VesselCustomElements.BP15_Newmicroflora = -- Первичный бульон
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Newmicroflora_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Newmicroflora_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Newmicroflora_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Newmicroflora",
	},

    cant_be_bought = true,
    uiIco = "BP15_Newmicroflora_ico",
}

VesselCustomElements.BP15_Molecular = -- Прочное соединение
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP15_Molecular_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP15_Molecular_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP15_Molecular_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP15_Molecular",
	},

    cant_be_bought = true,
    uiIco = "BP15_Molecular_ico",
}

-- SC-118931 Покраски. Боевой пропуск "Неведомые горизонты. Первая фаза": BP16_1 / SUM24_1. Лето 2024.

VesselCustomElements.BP16_Carnivalmood = -- Карнавальное настроение
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Carnivalmood_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Carnivalmood_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Carnivalmood_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Carnivalmood",
	},

    cant_be_bought = true,
    uiIco = "BP16_Carnivalmood_ico",
}

VesselCustomElements.BP16_Carnivalstripes = -- Карнавальные полосы
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Carnivalstripes_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Carnivalstripes_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Carnivalstripes_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Carnivalstripes",
	},

    cant_be_bought = true,
    uiIco = "BP16_Carnivalstripes_ico",
}

VesselCustomElements.BP16_Flagcarnival = -- Предчувствие праздника
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Flagcarnival_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Flagcarnival_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Flagcarnival_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Flagcarnival",
	},

    cant_be_bought = true,
    uiIco = "BP16_Flagcarnival_ico",
}

VesselCustomElements.BP16_Theatricalmask = -- Театральная маска
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Theatricalmask_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Theatricalmask_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Theatricalmask_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Theatricalmask",
	},

    cant_be_bought = true,
    uiIco = "BP16_Theatricalmask_ico",
}

VesselCustomElements.BP16_Vintagecircus = -- Винтажный карнавал
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Vintagecircus_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Vintagecircus_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Vintagecircus_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Vintagecircus",
	},

    cant_be_bought = true,
    uiIco = "BP16_Vintagecircus_ico",
}

VesselCustomElements.BP16_Harlequin = -- Арлекины
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Harlequin_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Harlequin_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Harlequin_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Harlequin",
	},

    cant_be_bought = true,
    uiIco = "BP16_Harlequin_ico",
}

-- SC-119101 Покраска. 10 лет релиза. 2-11 сентября.

VesselCustomElements.Release_Release10 = -- Первый. Круглый. Юбилей
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Release_Release10_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Release_Release10_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Release_Release10_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Release_Release10",
	},

    cant_be_bought = true,
    uiIco = "Release_Release10_ico",
}

-- SC-118989 Покраски. Боевой пропуск "Неведомые горизонты. Вторая фаза": BP16_2 / SUM24_2. Лето 2024.

VesselCustomElements.BP16_Carnivalmadness = -- Карнавальное безумие
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Carnivalmadness_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Carnivalmadness_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Carnivalmadness_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Carnivalmadness",
	},

    cant_be_bought = true,
    uiIco = "BP16_Carnivalmadness_ico",
}

VesselCustomElements.BP16_Carnivalcreatures = -- Разлитые краски
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Carnivalcreatures_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Carnivalcreatures_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Carnivalcreatures_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Carnivalcreatures",
	},

    cant_be_bought = true,
    uiIco = "BP16_Carnivalcreatures_ico",
}

VesselCustomElements.BP16_Carnivalpuzzle = -- Карнавальный пазл
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Carnivalpuzzle_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Carnivalpuzzle_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Carnivalpuzzle_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Carnivalpuzzle",
	},

    cant_be_bought = true,
    uiIco = "BP16_Carnivalpuzzle_ico",
}

VesselCustomElements.BP16_Carnivaldog = -- Шарик
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Carnivaldog_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Carnivaldog_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Carnivaldog_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Carnivaldog",
	},

    cant_be_bought = true,
    uiIco = "BP16_Carnivaldog_ico",
}

VesselCustomElements.BP16_Carnivalpaw = -- Лапки
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Carnivalpaw_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Carnivalpaw_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Carnivalpaw_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Carnivalpaw",
	},

    cant_be_bought = true,
    uiIco = "BP16_Carnivalpaw_ico",
}

VesselCustomElements.BP16_Sweetlife = -- Сладкая жизнь
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP16_Sweetlife_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP16_Sweetlife_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP16_Sweetlife_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP16_Sweetlife",
	},

    cant_be_bought = true,
    uiIco = "BP16_Sweetlife_ico",
}

-- SC-119198 Покраски (из скинов). 10 лет релиза. 2-11 сентября.

VesselCustomElements.R10_Release102 = -- Вечная вахта
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Release10_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Release10_12",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Release10_13",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "R10_release102",
	},

    cant_be_bought = true,
    uiIco = "R10_release102_ico",
}

VesselCustomElements.R10_Release10 = -- Звездное сияние
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Release10_21",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Release10_22",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Release10_23",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "R10_release10",
	},

    cant_be_bought = true,
    uiIco = "R10_release10_ico",
}

-- SC-119074 Покраски (Шаблоны). Боевой пропуск "Сердце тьмы. Первая фаза". BP17_1 / AUT24_1. Осень 2024.

VesselCustomElements.BP17_Maze = -- Лабиринт
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Maze_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Maze_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Maze_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Maze",
	},

    cant_be_bought = true,
    uiIco = "BP17_Maze_ico",
}

VesselCustomElements.BP17_Metal = -- Листы железа
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Metal_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Metal_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Metal_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Metal",
	},

    cant_be_bought = true,
    uiIco = "BP17_Metal_ico",
}

VesselCustomElements.BP17_Drone = -- Дроны
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Drone_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Drone_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Drone_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Drone",
	},

    cant_be_bought = true,
    uiIco = "BP17_Drone_ico",
}

VesselCustomElements.BP17_Virus = -- Вирус
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Virus_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Virus_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Virus_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Virus",
	},

    cant_be_bought = true,
    uiIco = "BP17_Virus_ico",
}

VesselCustomElements.BP17_Antivirus = -- Антивирус
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Antivirus_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Antivirus_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Antivirus_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Antivirus",
	},

    cant_be_bought = true,
    uiIco = "BP17_Antivirus_ico",
}

VesselCustomElements.BP17_Biom = -- Живой организм
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Biom_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Biom_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Biom_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Biom",
	},

    cant_be_bought = true,
    uiIco = "BP17_Biom_ico",
}

-- SC-119297 Покраска "Котенок или жизнь!". Сезон EP: AUT2024 (Halloween).

VesselCustomElements.EP_Catlloween = -- Котенок или жизнь!
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_EP_Catlloween_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_EP_Catlloween_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_EP_Catlloween_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "EP_Catlloween",
	},

    cant_be_bought = true,
    uiIco = "EP_Catlloween_ico",
}

-- SC-119213 Покраски (Шаблоны). Боевой пропуск "Сердце тьмы. Вторая фаза". BP17_2 / AUT24_2. Осень 2024.

VesselCustomElements.BP17_Hexagon = -- Защитный гекс
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Hexagon_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Hexagon_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Hexagon_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Hexagon",
	},

    cant_be_bought = true,
    uiIco = "BP17_Hexagon_ico",
}

VesselCustomElements.BP17_Kitty = -- Восстание котиков
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Kitty_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Kitty_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Kitty_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Kitty",
	},

    cant_be_bought = true,
    uiIco = "BP17_Kitty_ico",
}

VesselCustomElements.BP17_Duck = -- Утиные истории
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Duck_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Duck_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Duck_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Duck",
	},

    cant_be_bought = true,
    uiIco = "BP17_Duck_ico",
}

VesselCustomElements.BP17_Fromout = -- Ископаемое
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Fromout_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Fromout_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Fromout_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Fromout",
	},

    cant_be_bought = true,
    uiIco = "BP17_Fromout_ico",
}

VesselCustomElements.BP17_Life = -- Жизнь
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Life_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Life_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Life_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Life",
	},

    cant_be_bought = true,
    uiIco = "BP17_Life_ico",
}

VesselCustomElements.BP17_Panel = -- Укрепление
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP17_Panel_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP17_Panel_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP17_Panel_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP17_Panel",
	},

    cant_be_bought = true,
    uiIco = "BP17_Panel_ico",
}

-- SC-119312 Покраски (Шаблоны). Боевой пропуск "Забытые звезды. Первая фаза". BP18_1 / NY25_1. Зима 2025.

VesselCustomElements.BP18_Ancient = -- Защитный гекс
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Ancient_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Ancient_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Ancient_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Ancient",
	},

    cant_be_bought = true,
    uiIco = "BP18_Ancient_ico",
}

VesselCustomElements.BP18_Island = -- Остров духов
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Island_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Island_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Island_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Island",
	},

    cant_be_bought = true,
    uiIco = "BP18_Island_ico",
}

VesselCustomElements.BP18_Fox = -- Лисьи причуды
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Fox_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Fox_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Fox_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Fox",
	},

    cant_be_bought = true,
    uiIco = "BP18_Fox_ico",
}

VesselCustomElements.BP18_Nature = -- Дыхание природы
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Nature_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Nature_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Nature_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Nature",
	},

    cant_be_bought = true,
    uiIco = "BP18_Nature_ico",
}

VesselCustomElements.BP18_Pattern = -- Узоры
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Pattern_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Pattern_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Pattern_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Pattern",
	},

    cant_be_bought = true,
    uiIco = "BP18_Pattern_ico",
}

VesselCustomElements.BP18_Void = -- Пустота
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Void_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Void_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Void_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Void",
	},

    cant_be_bought = true,
    uiIco = "BP18_Void_ico",
}

-- SC-119383 Покраска "Ожидание чуда". Ивентпасс "Архивы ЕЦН: Призрачный фронтир". BP18_3 / NY25_3. Зима 2025.

VesselCustomElements.EP18_NewYear = -- Котенок или жизнь!
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_EP18_NewYear_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_EP18_NewYear_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_EP18_NewYear_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "EP18_NewYear",
	},

    cant_be_bought = true,
    uiIco = "EP18_NewYear_ico",
}

-- SC-119433 Покраски (Шаблоны). Боевой пропуск "Забытые звезды. Вторая фаза". BP18_2 / NY25_2. Зима 2025.

VesselCustomElements.BP18_Bamboo = -- Бамбук
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Bamboo_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Bamboo_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Bamboo_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Bamboo",
	},

    cant_be_bought = true,
    uiIco = "BP18_Bamboo_ico",
}

VesselCustomElements.BP18_Dragon = -- Чешуя дракона
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Dragon_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Dragon_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Dragon_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Dragon",
	},

    cant_be_bought = true,
    uiIco = "BP18_Dragon_ico",
}

VesselCustomElements.BP18_Lizzard = -- Древние следы
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Lizzard_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Lizzard_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Lizzard_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Lizzard",
	},

    cant_be_bought = true,
    uiIco = "BP18_Lizzard_ico",
}

VesselCustomElements.BP18_Tone = -- Прямоугольный витраж
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Tone_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Tone_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Tone_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Tone",
	},

    cant_be_bought = true,
    uiIco = "BP18_Tone_ico",
}

VesselCustomElements.BP18_Tiger = -- Маскировка тигра
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Tiger_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Tiger_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Tiger_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Tiger",
	},

    cant_be_bought = true,
    uiIco = "BP18_Tiger_ico",
}

VesselCustomElements.BP18_Waves = -- Канагава
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP18_Waves_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP18_Waves_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP18_Waves_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP18_Waves",
	},

    cant_be_bought = true,
    uiIco = "BP18_Waves_ico",
}

-- SC-119531 Покраски (Шаблоны). Боевой пропуск "Союзники и соперники. Первая фаза". BP19_1 / SPR25_1. Весна 2025.

VesselCustomElements.BP19_Starscience = -- Секретный прототип
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Starscience_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Starscience_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Starscience_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Starscience",
	},

    cant_be_bought = true,
    uiIco = "BP19_Starscience_ico",
}

VesselCustomElements.BP19_Visualization = -- Визуализация
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Visualization_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Visualization_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Visualization_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Visualization",
	},

    cant_be_bought = true,
    uiIco = "BP19_Visualization_ico",
}

VesselCustomElements.BP19_Flow = -- Болото
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Flow_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Flow_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Flow_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Flow",
	},

    cant_be_bought = true,
    uiIco = "BP19_Flow_ico",
}

VesselCustomElements.BP19_Blueprint = -- Чертеж
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Blueprint_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Blueprint_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Blueprint_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Blueprint",
	},

    cant_be_bought = true,
    uiIco = "BP19_Blueprint_ico",
}

VesselCustomElements.BP19_Tile = -- Ламеллярный доспех
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Tile_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Tile_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Tile_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Tile",
	},

    cant_be_bought = true,
    uiIco = "BP19_Tile_ico",
}

VesselCustomElements.BP19_Movement = -- Движение
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Movement_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Movement_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Movement_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Movement",
	},

    cant_be_bought = true,
    uiIco = "BP19_Movement_ico",
}

-- SC-119624 Покраски (Шаблоны) на 1 апреля, 12 апреля. Боевой пропуск "Союзники и соперники.

VesselCustomElements.BP19_Noise = -- Noise
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Noise_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Noise_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Noise_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Noise",
	},

    cant_be_bought = true,
    uiIco = "BP19_Noise_ico",
}

VesselCustomElements.BP19_12april = -- Movement
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_12april_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_12april_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_12april_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_12april",
	},

    cant_be_bought = true,
    uiIco = "BP19_12april_ico",
}

-- SC-119630 Покраски (Шаблоны). Боевой пропуск "Союзники и соперники. Вторая фаза". BP19_2 / SPR25_2. Весна 2025.

VesselCustomElements.BP19_Rust1 = -- Ржавчина
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Rust1_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Rust1_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Rust1_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Rust1",
	},

    cant_be_bought = true,
    uiIco = "BP19_Rust1_ico",
}

VesselCustomElements.BP19_Drops = -- Фострал
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Drops_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Drops_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Drops_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Drops",
	},

    cant_be_bought = true,
    uiIco = "BP19_Drops_ico",
}

VesselCustomElements.BP19_Circle = -- Окись-23
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Circle_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Circle_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Circle_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Circle",
	},

    cant_be_bought = true,
    uiIco = "BP19_Circle_ico",
}

VesselCustomElements.BP19_Armor = -- Капиллярная сеть
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Armor_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Armor_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Armor_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Armor",
	},

    cant_be_bought = true,
    uiIco = "BP19_Armor_ico",
}

VesselCustomElements.BP19_Paint = -- Абстракция
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Paint_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Paint_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Paint_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Paint",
	},

    cant_be_bought = true,
    uiIco = "BP19_Paint_ico",
}

VesselCustomElements.BP19_Trace = -- Масляные разводы
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP19_Trace_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP19_Trace_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP19_Trace_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP19_Trace",
	},

    cant_be_bought = true,
    uiIco = "BP19_Trace_ico",
}

-- SC-119730 Покраски (Шаблоны). Боевой пропуск "Предания древних. Первая фаза". BP20_1 / SUM25_1. Лето 2025.

VesselCustomElements.BP20_Gzhel = -- Гжель
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Gzhel_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Gzhel_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Gzhel_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Gzhel",
	},

    cant_be_bought = true,
    uiIco = "BP20_Gzhel_ico",
}

VesselCustomElements.BP20_Firebird = -- Птица-огневица
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Firebird_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Firebird_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Firebird_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Firebird",
	},

    cant_be_bought = true,
    uiIco = "BP20_Firebird_ico",
}

VesselCustomElements.BP20_Bake = -- И так сойдёт
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Bake_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Bake_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Bake_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Bake",
	},

    cant_be_bought = true,
    uiIco = "BP20_Bake_ico",
}

VesselCustomElements.BP20_Paint = -- Роспись
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Paint_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Paint_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Paint_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Paint",
	},

    cant_be_bought = true,
    uiIco = "BP20_Paint_ico",
}

VesselCustomElements.BP20_House = -- Деревяные набигают
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_House_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_House_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_House_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_House",
	},

    cant_be_bought = true,
    uiIco = "BP20_House_ico",
}

VesselCustomElements.BP20_Squirrel = -- Орешки непростые 
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Squirrel_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Squirrel_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Squirrel_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Squirrel",
	},

    cant_be_bought = true,
    uiIco = "BP20_Squirrel_ico",
}

-- SC-119801 Покраски (Шаблоны). Боевой пропуск "Предания древних. Вторая фаза". BP20_2 / SUM25_2. Лето 2025.

VesselCustomElements.BP20_Khokhloma = -- Хохлома
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Khokhloma_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Khokhloma_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Khokhloma_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Khokhloma",
	},

    cant_be_bought = true,
    uiIco = "BP20_Khokhloma_ico",
}

VesselCustomElements.BP20_Forest = -- Березки
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Forest_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Forest_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Forest_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Forest",
	},

    cant_be_bought = true,
    uiIco = "BP20_Forest_ico",
}

VesselCustomElements.BP20_Apple = -- Наливное яблочко
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Apple_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Apple_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Apple_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Apple",
	},

    cant_be_bought = true,
    uiIco = "BP20_Apple_ico",
}

VesselCustomElements.BP20_Horse = -- Конёк-горбунок
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Horse_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Horse_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Horse_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Horse",
	},

    cant_be_bought = true,
    uiIco = "BP20_Horse_ico",
}

VesselCustomElements.BP20_Sprout = -- Зерцало чеканное
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Sprout_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Sprout_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Sprout_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Sprout",
	},

    cant_be_bought = true,
    uiIco = "BP20_Sprout_ico",
}

VesselCustomElements.BP20_Wheat = -- Урожай 
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP20_Wheat_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP20_Wheat_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP20_Wheat_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP20_Wheat",
	},

    cant_be_bought = true,
    uiIco = "BP20_Wheat_ico",
}

-- SC-119967 Покраски (Шаблоны). Видеоконкурс «ГОНКА БОМБАРДИРОВ». Финальный рейд-приключение «Возвращение Предтеч»

VesselCustomElements.VideoContest_Video = -- Хозяин кинозала
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_VideoContest_Video_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_VideoContest_Video_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_VideoContest_Video_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "VideoContest_Video",
	},

    cant_be_bought = true,
    uiIco = "VideoContest_Video_ico",
}

-- SC-119981 Покраски (Шаблоны). Боевой пропуск "Опустошенные миры. Первая фаза". BP21_1 / AUT25_1. Осень 2025.

VesselCustomElements.BP21_Flow = -- Леса Ванахейма
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Flow_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Flow_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Flow_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Flow",
	},

    cant_be_bought = true,
    uiIco = "BP21_Flow_ico",
}

VesselCustomElements.BP21_Hieroglyph = -- Руническое покрытие
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Hieroglyph_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Hieroglyph_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Hieroglyph_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Hieroglyph",
	},

    cant_be_bought = true,
    uiIco = "BP21_Hieroglyph_ico",
}

VesselCustomElements.BP21_Map = -- Карта владений
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "BP21_Map_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "BP21_Map_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "BP21_Map_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Map",
	},

    cant_be_bought = true,
    uiIco = "BP21_Map_ico",
}

VesselCustomElements.BP21_Ornament = -- Магический оберег
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Ornament_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Ornament_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Ornament_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Ornament",
	},

    cant_be_bought = true,
    uiIco = "BP21_Ornament_ico",
}

VesselCustomElements.BP21_Ring = -- Драупнир
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Ring_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Ring_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Ring_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Ring",
	},

    cant_be_bought = true,
    uiIco = "BP21_Ring_ico",
}

VesselCustomElements.BP21_Weapon = -- Мастерство кузнеца
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Weapon_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Weapon_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Weapon_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Weapon",
	},

    cant_be_bought = true,
    uiIco = "BP21_Weapon_ico",
}

-- SC-120104 Покраски (Шаблоны). "В стране кошмаров". Сезон EP: AUT2025 (Halloween).

VesselCustomElements.Halloween_01 = -- В стране кошмаров
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Halloween_01",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Halloween_01",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Halloween_01",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Halloween_01",
	},

    cant_be_bought = true,
    uiIco = "Halloween_01_ico",
}

-- SC-120080 Покраски (Шаблоны). Боевой пропуск "Опустошенные миры. Вторая фаза". BP21_2 / AUT25_2. Осень 2025.

VesselCustomElements.BP21_Feather = -- Перья Хрёсвельга
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Feather_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Feather_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Feather_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Feather",
	},

    cant_be_bought = true,
    uiIco = "BP21_Feather_ico",
}

VesselCustomElements.BP21_Dragon = -- Чешуя Нидхёгг
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Dragon_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Dragon_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Dragon_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Dragon",
	},

    cant_be_bought = true,
    uiIco = "BP21_Dragon_ico",
}

VesselCustomElements.BP21_Fabric = -- Ткань
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Fabric_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Fabric_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Fabric_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Fabric",
	},

    cant_be_bought = true,
    uiIco = "BP21_Fabric_ico",
}

VesselCustomElements.BP21_Wood = -- Хранитель Фьордов
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Wood_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Wood_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Wood_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Wood",
	},

    cant_be_bought = true,
    uiIco = "BP21_Wood_ico",
}

VesselCustomElements.BP21_Wool = -- Шерсть Рататоска
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Wool_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Wool_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Wool_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Wool",
	},

    cant_be_bought = true,
    uiIco = "BP21_Wool_ico",
}

VesselCustomElements.BP21_Ivory = -- Осколок Мидгарда
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP21_Ivory_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP21_Ivory_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP21_Ivory_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP21_Ivory",
	},

    cant_be_bought = true,
    uiIco = "BP21_Ivory_ico",
}

-- SC-120202 Покраски (Шаблоны). Боевой пропуск "Перекрёсток галактик. Первая фаза". BP22_1 / NY26_1. Зима 2025 - 26.

VesselCustomElements.BP22_Cow = -- Коррозия
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Cow_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Cow_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Cow_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Cow",
	},

    cant_be_bought = true,
    uiIco = "BP22_Cow_ico",
}

VesselCustomElements.BP22_Cover = -- Усиленный корпус
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Cover_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Cover_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Cover_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Cover",
	},

    cant_be_bought = true,
    uiIco = "BP22_Cover_ico",
}

VesselCustomElements.BP22_Mosaic = -- Блестяшка
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Mosaic_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Mosaic_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Mosaic_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Mosaic",
	},

    cant_be_bought = true,
    uiIco = "BP22_Mosaic_ico",
}

VesselCustomElements.BP22_Lava = -- Барханы
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Lava_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Lava_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Lava_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Lava",
	},

    cant_be_bought = true,
    uiIco = "BP22_Lava_ico",
}

VesselCustomElements.BP22_Illusion = -- Иллюзия
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Illusion_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Illusion_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Illusion_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Illusion",
	},

    cant_be_bought = true,
    uiIco = "BP22_Illusion_ico",
}

VesselCustomElements.BP22_Gem = -- Песчинки
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Gem_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Gem_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Gem_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Gem",
	},

    cant_be_bought = true,
    uiIco = "BP22_Gem_ico",
}

-- SC-120202 Покраски (Шаблоны). Ивентпасс "Архивы ЕЦН: Утраченные созвездия" BP22_3 / NY26_3 Зима 2025 - 26.

VesselCustomElements.BP22_Ice = -- В стране кошмаров
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Ice_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Ice_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Ice_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Ice",
	},

    cant_be_bought = true,
    uiIco = "BP22_Ice_ico",
}

-- SC-120162 Покраски (Шаблоны). Дополнительные. Осень 2025.

VesselCustomElements.Crossout_Avia01 = -- Обшивка самолёта
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Crossout_Avia01_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Crossout_Avia01_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Crossout_Avia01_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_Avia01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_Avia01_ico",
}

VesselCustomElements.Crossout_DogsOfWar01 = -- Композитная броня
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_DogsOfWar01_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_DogsOfWar01_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_DogsOfWar01_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Crossout_DogsOfWar01",
	},

    cant_be_bought = true,
    uiIco = "Crossout_DogsOfWar01_ico",
}

-- SC-120270 Покраски (Шаблоны). Боевой пропуск "Перекрёсток галактик. Вторая фаза". BP22_2 / NY26_2. Зима 2025 - 26.

VesselCustomElements.BP22_Engineers02 = -- Стальной покров (ПОКРАСКА ИЗ CROSSOUT)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Engineers02_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Engineers02_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Engineers02_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Engineers02",
	},

    cant_be_bought = true,
    uiIco = "BP22_Engineers02_ico",
}

VesselCustomElements.BP22_Oracle = -- Обшивка Опустошителя (ПОКРАСКА ИЗ CROSSOUT)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Oracle_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Oracle_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Oracle_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Oracle",
	},

    cant_be_bought = true,
    uiIco = "BP22_Oracle_ico",
}

VesselCustomElements.BP22_Chameleons01 = -- Калейдоскоп (ПОКРАСКА ИЗ CROSSOUT)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Chameleons01_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Chameleons01_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Chameleons01_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Chameleons01",
	},

    cant_be_bought = true,
    uiIco = "BP22_Chameleons01_ico",
}

VesselCustomElements.BP22_Dust = -- Песчаный шторм
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Dust_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Dust_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Dust_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Dust",
	},

    cant_be_bought = true,
    uiIco = "BP22_Dust_ico",
}

VesselCustomElements.BP22_Resonance = -- Резонанс
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Resonance_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Resonance_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Resonance_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Resonance",
	},

    cant_be_bought = true,
    uiIco = "BP22_Resonance_ico",
}

VesselCustomElements.BP22_Gold = -- Золото пустыни
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP22_Gold_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP22_Gold_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP22_Gold_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP22_Gold",
	},

    cant_be_bought = true,
    uiIco = "BP22_Gold_ico",
}

-- SC-120303 Покраска на Сундук "День Рождения Star Conflict"

VesselCustomElements.Birthday_2026 = -- Праздничная обертка
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_Birthday_2026_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_Birthday_2026_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_Birthday_2026_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "Birthday_2026",
	},

    cant_be_bought = true,
    uiIco = "Birthday_2026_ico",
}

-- SC-120360 Покраски (Шаблоны). Боевой пропуск "Раскол альянсов". Первая фаза BP23_1 / SPR26_1. Весна 2026.

VesselCustomElements.BP23_Flow = -- Поток энергии
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Flow_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Flow_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Flow_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Flow",
	},

    cant_be_bought = true,
    uiIco = "BP23_Flow_ico",
}

VesselCustomElements.BP23_Scientists01 = -- Новый рассвет (ПОКРАСКА ИЗ CROSSOUT)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Scientists01_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Scientists01_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Scientists01_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Scientists01",
	},

    cant_be_bought = true,
    uiIco = "BP23_Scientists01_ico",
}

VesselCustomElements.BP23_TornMetal01 = -- Варг (ПОКРАСКА ИЗ CROSSOUT)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_TornMetal01_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_TornMetal01_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_TornMetal01_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_TornMetal01",
	},

    cant_be_bought = true,
    uiIco = "BP23_TornMetal01_ico",
}

VesselCustomElements.BP23_CamouflageRacecar01 = -- Палитра (ПОКРАСКА ИЗ CROSSOUT)
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_CamouflageRacecar01_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_CamouflageRacecar01_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_CamouflageRacecar01_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_CamouflageRacecar01",
	},

    cant_be_bought = true,
    uiIco = "BP23_CamouflageRacecar01_ico",
}

VesselCustomElements.BP23_Glass = -- Резонанс
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Glass_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Glass_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Glass_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Glass",
	},

    cant_be_bought = true,
    uiIco = "BP23_Glass_ico",
}

VesselCustomElements.BP23_Glow = -- Золото пустыни
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Glow_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Glow_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Glow_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Glow",
	},

    cant_be_bought = true,
    uiIco = "BP23_Glow_ico",
}

-- SC-120426 Покраски (Шаблоны). Боевой пропуск "Раскол альянсов". Вторая фаза BP23_2 / SPR26_2. Весна 2026.

VesselCustomElements.BP23_Quartz = -- Отблеск
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Quartz_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Quartz_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Quartz_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Quartz",
	},

    cant_be_bought = true,
    uiIco = "BP23_Quartz_ico",
}

VesselCustomElements.BP23_Cloth = -- Кристаллическая ткань
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Cloth_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Cloth_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Cloth_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Cloth",
	},

    cant_be_bought = true,
    uiIco = "BP23_Cloth_ico",
}

VesselCustomElements.BP23_Waves = -- Магматическое покрытие
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Waves_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Waves_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Waves_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Waves",
	},

    cant_be_bought = true,
    uiIco = "BP23_Waves_ico",
}

VesselCustomElements.BP23_Giraffe = -- Жираф
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Giraffe_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Giraffe_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Giraffe_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Giraffe",
	},

    cant_be_bought = true,
    uiIco = "BP23_Giraffe_ico",
}

VesselCustomElements.BP23_Chaotic = -- Хаотичная буря
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Chaotic_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Chaotic_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Chaotic_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Chaotic",
	},

    cant_be_bought = true,
    uiIco = "BP23_Chaotic_ico",
}

VesselCustomElements.BP23_Evil = -- Темная материя
{
	type		= ai.VesselCustomElementType.MPRESET,

	desc =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Preset_BP23_Evil_11",
		[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Preset_BP23_Evil_11",
		[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Preset_BP23_Evil_11",
		[ ai.VesselCustomSlot.ARMOR_0 		] 	= "BP23_Evil",
	},

    cant_be_bought = true,
    uiIco = "BP23_Evil_ico",
}

