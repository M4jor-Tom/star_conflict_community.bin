-- -----------------------------------------------------------------------
-- UI.HudDeathInfoWnd
-- -----------------------------------------------------------------------

UI.HudDeathInfoWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.HudDeathInfoWnd.def =
{
	className = "Wnd",
	
	props =
	{
		name	= "HudDeathInfoWnd",
		style	= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
	},
	
	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "hud_deathInfo",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.HudDeathInfoWnd.layers.KILLER",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "title3",
						layer		= "UI.HudDeathInfoWnd.layers.KILLER_WO_DURABILITY",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "descript_1",
						layer		= "UI.HudDeathInfoWnd.layers.DURABILITY",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "descript_2",
						layer		= "UI.HudDeathInfoWnd.layers.REPAIR_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- KILLER
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Large" },
		},
		
		-- KILLER_WO_DURABILITY
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Large" },
		},
		
		-- DURABILITY
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Large" },
		},
		
		-- REPAIR_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Large" },
		},
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.HudDeathInfoWnd:GameChat_AddBattleLogMessage( id, killInfo )

	if type( id ) ~= "string" then
		sys.log( "UI.HudKillsWnd:GameChat_AddBattleLogMessage()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return
	end
	
	if id ~= "kill" then
		return
	end
	
	if type( killInfo ) ~= "table" then
		sys.log( "UI.HudDeathInfoWnd:GameChat_AddBattleLogMessage()[ERROR]: invalid type of the 1-st parameter (\"killInfo\"); \"table\" expected, got \"%s\"", type( killInfo ) )
		return
	end

	if type( killInfo.victim ) ~= "table" then
		sys.log( "UI.HudDeathInfoWnd:GameChat_AddBattleLogMessage()[ERROR]: invalid type of (\"killInfo.victim\"); \"table\" expected, got \"%s\"", type( killInfo.victim ) )	
		return
	end

	if type( killInfo.victim.playerId ) ~= "number" then
		sys.log( "UI.HudDeathInfoWnd:GameChat_AddBattleLogMessage()[ERROR]: invalid type of (\"killInfo.victim.playerId\"); \"number\" expected, got \"%s\"", type( killInfo.victim.playerId ) )
		return
	end
	
	if killInfo.victim.playerId ~= _G.Game_LocalClientNum() then
		return
	end
	
	-- уничтожаться могут и модули, а не только корабли
	if type( killInfo.victim.isShip ) ~= "boolean" then
		sys.log( "UI.HudDeathInfoWnd:GameChat_AddBattleLogMessage()[ERROR]: invalid type of (\"killInfo.victim.isShip\"); \"boolean\" expected, got \"%s\"", type( killInfo.victim.isShip ) )
		return
	end
	
	if not killInfo.victim.isShip then
		return
	end
	
	if type( killInfo.victim.defName ) ~= "string" then
		sys.log( "UI.HudDeathInfoWnd:GameChat_AddBattleLogMessage()[ERROR]: invalid type of (\"killInfo.victim.defName\"); \"string\" expected, got \"%s\"", type( killInfo.victim.defName ) )
		return
	end
	
	self:Setup( killInfo )

end


--
function UI.HudDeathInfoWnd:Setup( killInfo )

	self:Reset()

	self.killInfo = killInfo
	
	if self:IsOnScreen() then
		self:FullUpdate()
	end
	
end


--
function UI.HudDeathInfoWnd:Reset()

	self.killInfo = nil
	
	self:ResetContent()
	
end


-- ------------------------------------
-- sconst
-- ------------------------------------

UI.HudDeathInfoWnd.layers =
{
	MAIN_EFFECT				= 0,
	KILLER					= 1,
	KILLER_WO_DURABILITY	= 2,
	DURABILITY				= 3,
	REPAIR_PRICE			= 4,
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.HudDeathInfoWnd.killInfo				= nil
UI.HudDeathInfoWnd.repairPriceMetaText	= nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.HudDeathInfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.repairPriceMetaText = UI.MetaText.GetNewInstance()
	self.repairPriceMetaText:InitFromLayer( self, self.layers.REPAIR_PRICE ) 
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.HudDeathInfoWnd:F_Shutdown()

	if self.repairPriceMetaText then
		self.repairPriceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HudDeathInfoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:FullUpdate()

end


--
function UI.HudDeathInfoWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.HudDeathInfoWnd:UpdateMetaTextPos()

	self.repairPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.REPAIR_PRICE )

end


--
function UI.HudDeathInfoWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REPAIR_PRICE then
		self.repairPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.HudDeathInfoWnd:ResetContent()
	
	self:SetText( "", self.layers.KILLER )
	self:SetText( "", self.layers.KILLER_WO_DURABILITY )
	self:SetText( "", self.layers.DURABILITY )
	self.repairPriceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.MAIN_EFFECT )
	
end


--
function UI.HudDeathInfoWnd:FullUpdate()
	
	self:ResetContent()
	
	if not self.killInfo then
		return
	end
	
	self:SetLayerVisible( true, self.layers.MAIN_EFFECT )
	self:UpdateKiller()
	self:UpdateDurability()
	self:UpdateRepairPrice()
	
end


--
function UI.HudDeathInfoWnd:UpdateKiller()

	self:SetText( "", self.layers.KILLER )
	self:SetText( "", self.layers.KILLER_WO_DURABILITY )
	
	local str = self:MakeKillerString( self.killInfo )
	local layer = self:NeedDurabilityInfo() and self.layers.KILLER or self.layers.KILLER_WO_DURABILITY
	
	self:SetText( str, layer )
	
end


--
function UI.HudDeathInfoWnd:UpdateDurability()

	self:SetText( "", self.layers.DURABILITY )
	
	if not self:NeedDurabilityInfo() then
		return
	end

	local colors_ranges =
	{
		{
			minDur	= 0,
			color	= 0xffff0000,	-- красный
		},
		
		{
			minDur	= 21,
			color	= 0xffffff00,	-- желтый
		},
		
		{
			minDur	= 80,
			color	= 0xff00ff00,	-- зеленый
		},
	}
	
	local durability = self:GetDurability()
	local durabilityPerc = UI:Round( durability * 100 )
	
	local baseColor = self:GetColor( self.layers.DURABILITY )
	local valColor = baseColor
	
	for rangeIdx = #colors_ranges, 1, -1 do
	
		local range = colors_ranges[ rangeIdx ]
		
		if durabilityPerc >= range.minDur then
			valColor = range.color
			break
		end
		
	end
	
	local strVal = string.format( "%s%d%%%s", UI:Color2Str( valColor ), durabilityPerc, UI:Color2Str( baseColor ) )
	local tSubst =	-- подстановка только через таблицу, иначе знак процента пропадет
	{
		val = strVal,
	}
	
	local str = UI:GetStringByName( "death_info_durability" ) 
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$(.-)%$", tSubst )
	
	if numSubst == 0 then
		sys.log( "UI.HudDeathInfoWnd:UpdateDurability()[ERROR]: cannot find placeholder '$val$' in string 'death_info_durability'" )
		str = string.format( "[INVALID STRING]Durability: %s", strVal )
	end
	
	self:SetText( str, self.layers.DURABILITY )
	
end


--
function UI.HudDeathInfoWnd:UpdateRepairPrice()

	self.repairPriceMetaText:SetText( "", true )

	if not self:NeedDurabilityInfo() then
		return
	end
	
	local damage = self:GetDurabilityDamage()
			
	local fullPrice = UI:GetShipFullRepairPrice( self.killInfo.victim.defName )
	local price = fullPrice * damage
	
	local priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
		val			= price,
		bIsBuyPrice	= true,
		basePrice	= price,
	}
	
	local strVal = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.REPAIR_PRICE ), true, true, true, nil )
	
	local str = UI:GetStringByName( "death_info_repairPrice" )
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$price%$", strVal )
	
	if numSubst == 0 then
		sys.log( "UI.HudDeathInfoWnd:UpdateRepairPrice()[ERROR]: cannot find placeholder '$price$' in string 'death_info_repairPrice'" )
		str = string.format( "[INVALID STRING]Repair price: %s", strVal )
	end
	
	self.repairPriceMetaText:SetText( str, true )

end


--
function UI.HudDeathInfoWnd:MakeKillerString( params )

	local str = "error"

	if type( params ) ~= "table" then
		sys.log( "UI.HudDeathInfoWnd:MakeKillString()[ERROR]: invalid type of the 1-st parameter (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
		return str
	end

	if type( params.killer ) ~= "table" then
		sys.log( "UI.HudDeathInfoWnd:MakeKillString()[ERROR]: invalid type of (\"params.killer\"); \"table\" expected, got \"%s\"", type( params.killer ) )	
		return str
	end

	if type( params.killer.playerId ) ~= "number" then
		sys.log( "UI.HudDeathInfoWnd:MakeKillString()[ERROR]: invalid type of (\"params.killer.playerId\"); \"number\" expected, got \"%s\"", type( params.killer.playerId ) )
		return str
	end

	if type( params.itemDefName ) ~= "string" then
		sys.log( "UI.HudDeathInfoWnd:MakeKillString()[ERROR]: invalid type of (\"params.itemDefName\"); \"string\" expected, got \"%s\"", type( params.itemDefName ) )	
		return str
	end
	
	local bNeedKillerName = false
	local strId = ""

	if params.itemDefName == "(crash)" then
		
		local bIsKillerShip = false
		if type( params.killer.isShip ) == "boolean" then
			bIsKillerShip = params.killer.isShip
		else
			sys.log( "UI.HudDeathInfoWnd:MakeKillString()[ERROR]: invalid type of (\"params.killer.isShip\"); \"boolean\" expected, got \"%s\"", type( params.killer.isShip ) )	
		end

		strId = bIsKillerShip and "death_info_kill_crash" or "death_info_self_crash"
		bNeedKillerName = bIsKillerShip

	elseif params.itemDefName == "(suicide)" then
		strId = "death_info_suicide"

	else
    	strId = "death_info_kill"
		bNeedKillerName = true
	end
	
	str = UI:GetStringByName( strId )

	if bNeedKillerName then
	
		local killerNickName = UI:GetPlayerNameFromKillInfo( params, true, self:GetColor( self.layers.KILLER ) )
		
		local numSubst = 0
		str, numSubst = string.gsub( str, "%$killer%$", killerNickName )
		
		if numSubst == 0 then
			sys.log( "UI.HudDeathInfoWnd:MakeKillString()[ERROR]: cannot find placeholder '$killer$' in string '%s'", strId )
			str = string.format( "[INVALID STRING]%s. Killer: %s", str, killerNickName )
		end
		
	end

	return str

end


--
function UI.HudDeathInfoWnd:GetDurability()
	
	return self.killInfo.victim.hullConditionNew or 1
	
end


--
function UI.HudDeathInfoWnd:GetDurabilityDamage()
	
	local durabilityOld = self.killInfo.victim.hullConditionOld or 1
	local durabilityNew = self.killInfo.victim.hullConditionNew or 1
	return math.max( durabilityOld - durabilityNew, 0 )
	
end


--
function UI.HudDeathInfoWnd:NeedDurabilityInfo()
	
	return self:GetDurabilityDamage() > 0
	
end


--
function UI.HudDeathInfoWnd:F_OnEventSaveUiState()

	UI.store.HudDeathInfoWnd =
	{
		killInfo = self.killInfo
	}
	
end


--
function UI.HudDeathInfoWnd:F_OnEventRestoreUiState()

	if UI.store.HudDeathInfoWnd then
	
		self.killInfo = UI.store.HudDeathInfoWnd.killInfo
		
		UI.store.HudDeathInfoWnd = nil
		
	end
	
end