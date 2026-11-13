--
local DrugsStoreItemIdCounter = 110000
local function Drugs_GetNextStoreItemId()
	DrugsStoreItemIdCounter = DrugsStoreItemIdCounter + 1
	return DrugsStoreItemIdCounter
end
-- 
Def.Drug_Base =
{
	in_editor		= false,
	is_drug			= true,
	shopCategory	= "OFFICE",
	shopSubCategory	= "DRUGS",
	-- default_icon="Drug",
}


Def.Drug_SilverDamage = 
{
	uiName 			= "Drug_SilverDamage",
	uiDesc 			= "Drug_SilverDamage_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_Damage",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	price			= 120000,
	default_icon	= "Drug_SilverDamage_ico",
	cant_be_bought	= true,
}

Def.Drug_SilverSpeed = 
{
	uiName 			= "Drug_SilverSpeed",
	uiDesc 			= "Drug_SilverSpeed_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_Speed",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	price			= 100000,
	default_icon	= "Drug_SilverSpeed_ico",
	cant_be_bought	= true,
}

Def.Drug_Overload = 
{
	uiName 			= "Drug_Overload",
	uiDesc 			= "Drug_Overload_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_Overload",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	price			= 160000,
	default_icon	= "Drug_Overload_ico",
	cant_be_bought	= true,
}

Def.Drug_SilverShieldResist = 
{
	uiName 			= "Drug_SilverShieldResist",
	uiDesc 			= "Drug_SilverShieldResist_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_ShieldResist",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	price			= 80000,
	default_icon	= "Drug_SilverShieldResist_ico",
	cant_be_bought	= false,
}

Def.Drug_RepBoost15 = 
{
	uiName 			= "Drug_RepBoost15",
	uiDesc 			= "Drug_RepBoost15_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_RepBoost15",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 180,
	default_icon	= "Drug_RepBoost15_ico",
	cant_be_bought	= true,
}

Def.Drug_RepBoost200_2 = 
{
	uiName 			= "Drug_RepBoost15",
	uiDesc 			= "Drug_RepBoost200_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_RepBoost200_2",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 400,
	default_icon	= "Drug_RepBoost15_ico",
	cant_be_bought	= false,
}

Def.Drug_RepBoost200 = 
{
	uiName 			= "Drug_RepBoost200",
	uiDesc 			= "Drug_RepBoost200_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_RepBoost200",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 700,
	default_icon	= "Drug_RepBoost200_ico",
	cant_be_bought	= true,
}

Def.Drug_RepBoost200_10 = 
{
	uiName 			= "Drug_GoldRepBoost15wide",
	uiDesc 			= "Drug_RepBoost200_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_RepBoost200_10",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 1200,
	default_icon	= "Drug_GoldRepBoost15wide_ico",
	cant_be_bought	= true,
}

Def.Drug_GoldRepBoost15wide = 
{
	uiName 			= "Drug_GoldRepBoost15wide",
	uiDesc 			= "Drug_GoldRepBoost15wide_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_RepBoost15wide",
	is_group_wide	= true,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 390,
	default_icon	= "Drug_GoldRepBoost15wide_ico",
	cant_be_bought	= false,
}

Def.Drug_SilverHullResist = 
{
	uiName 			= "Drug_SilverHullResist",
	uiDesc 			= "Drug_SilverHullResist_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_HullResist",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	price			= 80000,
	default_icon	= "Drug_SilverHullResist_ico",
	cant_be_bought	= false,
}

Def.Drug_SilverTotalResist = 
{
	uiName 			= "Drug_SilverTotalResist",
	uiDesc 			= "Drug_SilverTotalResist_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_TotalResist",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	price			= 120000,
	default_icon	= "Drug_SilverTotalResist_ico",
	cant_be_bought	= false,
}

Def.Drug_ExpBoost15 = 
{
	uiName 			= "Drug_ExpBoost15",
	uiDesc 			= "Drug_ExpBoost15_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_ExpBoost15",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 80,
	default_icon	= "Drug_ExpBoost15_ico",
	cant_be_bought	= true,
}

Def.Drug_LootAssuranceWinLose = 
{
	uiName 			= "Drug_LootTry",
	uiDesc 			= "Drug_LootTry_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_LootAssuranceWinLose",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 200,
	default_icon	= "Drug_LootAssuranceWinLose_ico",
	cant_be_bought	= true, -- #61115 
}

Def.Drug_LootTry = 
{
	uiName 			= "Drug_LootTry",
	uiDesc 			= "Drug_LootTry_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_LootTry",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 250,
	default_icon	= "Drug_ExpBoost15_ico",
	cant_be_bought	= true,
}

Def.Drug_LootAssuranceWinLoseTry = 
{
	uiName 			= "Drug_LootTry",
	uiDesc 			= "Drug_LootTry_Desc",
	inherit			= "Drug_Base",
	account_aura	= "Drug_LootAssuranceWinLoseTry",
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	stacks			= true,
	premiumPrice	= 300,
	default_icon	= "Drug_LootAssuranceWinLoseTry_ico",
	cant_be_bought	= true, -- #61115 Убрал лишние бустеры
}


--[[ 
Def.Drug_SilverHullResist = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_HullResist",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	price			= 20000,
}


Def.Drug_GoldExpBoost15 = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_ExpBoost15",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	premiumPrice	= 30,
}

Def.Drug_GoldExpBoost10wide = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_ExpBoost10wide",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= true,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	premiumPrice	= 60,
}



Def.Drug_RepBoost100 = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_RepBoost100",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	premiumPrice	= 200,
}

Def.Drug_RepBoost500 = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_RepBoost500",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	premiumPrice	= 1000,
}

Def.Drug_RepBoost500wide = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_RepBoost500wide",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= true,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	premiumPrice	= 1500,
}

Def.Drug_LootAssurance100 = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_LootAssurance100",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	premiumPrice	= 50,
}


Def.Drug_LootAssuranceWinLose1 = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_LootAssuranceWinLose1",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	premiumPrice	= 400,
}

Def.Drug_LootAssuranceWinLose100 = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_LootAssuranceWinLose100",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= false,
	--drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	premiumPrice	= 1000,
}


Пример

Def.Drug_Sample = 
{
	inherit			= "Drug_Base",
	account_aura	= "Drug_Sample",
	slot			= ai.DrugSlot.BATTLE,
	is_group_wide	= true,
	item_lvl		= 10,
	drop_weight		= 0.2,
	storeItemId		= Drugs_GetNextStoreItemId(),
	cant_be_bought	= true,
	stacks			= true,
	price			= 5000,
	premiumPrice	= 20,
	shopCategory	= "OFFICE",
	shopSubCategory	= "DRUGS",
}


]]