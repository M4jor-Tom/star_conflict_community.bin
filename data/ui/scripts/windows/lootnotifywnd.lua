-- ----------------------------------------------------------------------------
--
-- Workfile: lootnotifywnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.LootNotifyWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.LootNotifyWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "LootNotifyWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,		
		isPrototype	= true,
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
				defName 			= "loot_scanPoint_gainedItem",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "loot_name",
						layer		= "UI.LootNotifyWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по цвету
					{
						objName		= "descript",
						layer		= "UI.LootNotifyWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price",
						layer		= "UI.LootNotifyWnd.layers.REWARD_CARGO",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price_2",
						layer		= "UI.LootNotifyWnd.layers.REWARD_IMMEDIATE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- CAPTION
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 

    	-- ITEM_NAME
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 

    	-- REWARD_CARGO
    	{
   			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 

    	-- REWARD_IMMEDIATE
    	{
   			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 
	},
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.LootNotifyWnd:Setup( defName, amount, bSalvaged, junkPriceInfo, bAccountAura )

	self:Reset()

	if type( defName ) ~= "string" then
		sys.log( "UI.LootNotifyWnd:Setup()[ERROR]; invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if amount ~= nil then
    	if type( amount ) ~= "number" then
    		sys.log( "UI.LootNotifyWnd:Setup()[ERROR]; invalid type of the 2-nd parameter (\"amount\"); \"number\" expected, got \"%s\"", type( amount ) )
    		amount = nil
    	end
	end

	if amount == nil then
		amount = 1
	end

	if bSalvaged ~= nil then
    	if type( bSalvaged ) ~= "boolean" then
    		sys.log( "UI.LootNotifyWnd:Setup()[ERROR]; invalid type of the 3-rd parameter (\"bSalvaged\"); \"boolean\" expected, got \"%s\"", type( bSalvaged ) )
    		bSalvaged = nil
    	end
	end

	if bSalvaged == nil then
		bSalvaged = false
	end

	if bAccountAura ~= nil then
    	if type( bAccountAura ) ~= "boolean" then
    		sys.log( "UI.LootNotifyWnd:Setup()[ERROR]; invalid type of the 5-th parameter (\"bAccountAura\"); \"boolean\" expected, got \"%s\"", type( bAccountAura ) )
			return
    	end
	else
		bAccountAura = false
	end

	if bSalvaged or ( not bAccountAura and UI:IsDefJunk( defName ) ) then

    	if junkPriceInfo ~= nil then
        	if type( junkPriceInfo ) ~= "table" then
        		sys.log( "UI.LootNotifyWnd:Setup()[ERROR]; invalid type of the 4-th parameter (\"junkPriceInfo\"); \"table\" expected, got \"%s\"", type( junkPriceInfo ) )
        		junkPriceInfo = nil
        	end
    	end

		if junkPriceInfo ~= nil then
			if UI:Val2Key( UI.junkPriceTypes, junkPriceInfo.type ) == "" then
				sys.log( "UI.LootNotifyWnd:Setup()[ERROR]: invalid junkPriceInfo.type; one of the \"UI.junkPriceTypes\" vals expected, got %s", tostring( junkPriceInfo.type ) )
				junkPriceInfo = nil
			end
		end

		if junkPriceInfo == nil then
			if not bSalvaged then
				junkPriceInfo = UI:GetJunkPriceInfo( defName )
			end
		end

		if junkPriceInfo == nil then
			sys.log( "UI.LootNotifyWnd:Setup()[ERROR]: no junkPriceInfo" )
			return
		end

	end

    self.defName			= defName
    self.amount				= amount
    self.bSalvaged			= bSalvaged
    self.junkPriceInfo		= junkPriceInfo
	self.bAccountAura		= bAccountAura

	self:UpdateMode()
	self:UpdateMainAnimation()

	if self.mode == self.modes.CARGO then

		self:UpdateCaption()
		self:UpdateIco()
		self:UpdateItemName()
		self:UpdateRewardCargo()

	elseif self.mode == self.modes.IMMEDIATE then
		self:UpdateRewardImmediate()
	end

end


--
function UI.LootNotifyWnd:Reset()

    self.defName			= ""
    self.amount				= 0
    self.bSalvaged			= false
    self.junkPriceInfo		= { type = UI.junkPriceTypes.NONE }
	self.bAccountAura		= false
	self.mode				= -1

	self:SetText( "", self.layers.CAPTION )
	self:SetLayerVisible( false, self.layers.CAPTION )

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetLayerVisible( false, self.layers.ITEM_NAME )	

	self.rewardCargoMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.REWARD_CARGO )

	self.rewardImmediateMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.REWARD_IMMEDIATE )

	self.itemIcoWnd:Reset()
	self:RemoveControl( self.itemIcoWnd, self.layers.MAIN_EFFECT )

	self.shipPartIcoWnd:Reset()
	self:RemoveControl( self.shipPartIcoWnd, self.layers.MAIN_EFFECT )

end


--
function UI.LootNotifyWnd:HasContentToShow()

	return self.defName ~= ""
	
end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.LootNotifyWnd.layers =
{
    MAIN_EFFECT			= 0,
    CAPTION				= 1,
    ITEM_NAME			= 2,
    REWARD_CARGO		= 3,
	REWARD_IMMEDIATE	= 4,
}

UI.LootNotifyWnd.effectInfo =
{
	main =
	{
		itemIcoLocator		= "icon",
		shipPartIcoLocator	= "parts_slot",
		rewardCargoLocator	= "loloyalty",
		anim_CARGO			= "idle",
		anim_IMMEDIATE		= "idle_2",
	}
}

UI.LootNotifyWnd.modes =
{
	CARGO		= 1,
	IMMEDIATE	= 2,
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.LootNotifyWnd.defName				= ""
UI.LootNotifyWnd.amount					= 0
UI.LootNotifyWnd.bSalvaged				= false
UI.LootNotifyWnd.junkPriceInfo			= { type = UI.junkPriceTypes.NONE }
UI.LootNotifyWnd.bAccountAura			= false

UI.LootNotifyWnd.itemIcoWnd				= nil
UI.LootNotifyWnd.shipPartIcoWnd			= nil
UI.LootNotifyWnd.rewardCargoMetaText	= nil
UI.LootNotifyWnd.rewardImmediateMetaText= nil
UI.LootNotifyWnd.mode					= -1
UI.LootNotifyWnd.rewardFontId			= 0
UI.LootNotifyWnd.rewardColor			= UI.WHITE_COLOR

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.LootNotifyWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.rewardCargoMetaText = UI.MetaText.GetNewInstance()
	self.rewardCargoMetaText:InitFromLayer( self, self.layers.REWARD_CARGO ) 

	self.rewardImmediateMetaText = UI.MetaText.GetNewInstance()
	self.rewardImmediateMetaText:InitFromLayer( self, self.layers.REWARD_IMMEDIATE ) 

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local rewardFontName = mainEffect:GetObjFontName( self.effectInfo.main.rewardCargoLocator )	
		self.rewardFontId = _G.ObtainFont( rewardFontName )

		self.rewardColor = mainEffect:GetObjColor( self.effectInfo.main.rewardCargoLocator )

	end

	self:Reset()

end


--
function UI.LootNotifyWnd:F_Shutdown()

	if self.rewardCargoMetaText then
		self.rewardCargoMetaText:Clear()
	end

	if self.rewardImmediateMetaText then
		self.rewardImmediateMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.LootNotifyWnd:CreateControls()

	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.shipPartIcoWnd	= UI:CreateChildWnd( self, UI.ShipPartIcoWnd, "" )

end


--
function UI.LootNotifyWnd:UpdateMode()

	self.mode = self.modes.CARGO	

	if self.bSalvaged then
		self.mode = self.modes.IMMEDIATE

	elseif ( not self.bAccountAura and UI:IsDefJunk( self.defName ) ) then

		-- хак; IsJunkSelledImmediate() не определяет, горючее это или нет
		local bImmediate = UI:IsJunkSelledImmediate( self.defName )
		self.mode = bImmediate and self.modes.IMMEDIATE or self.modes.CARGO

	end

end


--
function UI.LootNotifyWnd:UpdateMainAnimation()

	local anim = ""

	if self.mode == self.modes.CARGO then
		anim = self.effectInfo.main.anim_CARGO

	elseif self.mode == self.modes.IMMEDIATE then	
		anim = self.effectInfo.main.anim_IMMEDIATE

	else
		sys.log( "UI.LootNotifyWnd::UpdateMainAnimation()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
	end

	if anim ~= "" then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:StartAnimation( anim )
		end
	end

end


--
function UI.LootNotifyWnd:UpdateCaption()

	self:SetLayerVisible( true, self.layers.CAPTION )

	local lootTypeStrId = ""

	if self.bAccountAura then
		lootTypeStrId = "lootNotify_lootType_accountAura"
		
	elseif UI:IsDefAdventureItem( self.defName ) then
		lootTypeStrId = "lootNotify_lootType_adventureItem"

	elseif UI:IsDefQuestItem( self.defName ) then
		lootTypeStrId = "lootNotify_lootType_questItem"

	elseif UI:IsDefJunk( self.defName ) then
		lootTypeStrId = "lootNotify_lootType_junk"

	elseif UI:IsDefResource( self.defName ) then
		lootTypeStrId = "lootNotify_lootType_resource"

	elseif UI:IsDefBlueprint( self.defName ) then
		lootTypeStrId = "lootNotify_lootType_blueprint"

	elseif UI:IsDefModule( self.defName ) then
		lootTypeStrId = "lootNotify_lootType_module"

	elseif UI:IsDefAmmo( self.defName ) then
		lootTypeStrId = "lootNotify_lootType_ammo"

	else
		sys.log( "UI.LootNotifyWnd:UpdateCaption()[ERROR]: unhandled loot type for def \"%s\"", self.defName )
	end

	local strLootType = "unknown"
	if lootTypeStrId ~= "" then
		strLootType = UI:GetStringByName( lootTypeStrId )
	end

	local str = UI:GetStringByName( "lootNotify_caption" )
	str = string.gsub( str, "%$loot_type%$", strLootType )

	self:SetText( str, self.layers.CAPTION )	

end


--
function UI.LootNotifyWnd:UpdateIco()

	if self.bAccountAura then

    	self:AddControl( self.itemIcoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.itemIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )

		local hTex = UI:GetMailAttachmentAccountAuraIco( self.defName )
		self.itemIcoWnd:SetupIco( hTex )

	elseif UI:IsDefShipPart( self.defName ) then

    	self:AddControl( self.shipPartIcoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.shipPartIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
		self.shipPartIcoWnd:Setup( self.defName, self.amount )

	else

    	self:AddControl( self.itemIcoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.itemIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )

    	self.itemIcoWnd:SetupForItem( self.defName )
		
    	if self.amount > 1 then
    		self.itemIcoWnd:SetCountResources( self.amount )
    	else
    		self.itemIcoWnd:HideCount()
    	end

	end

end


--
function UI.LootNotifyWnd:UpdateItemName()

	self:SetLayerVisible( true, self.layers.ITEM_NAME )

	local name	= ""
	local color	= UI:GetItemQualityColor( UI.MK1_QUALITY, false )

	if self.bAccountAura then
		name	= UI:AccountAura2Str( self.defName )
	else
		name	= UI:GetEntityLocalizedNameByDef( self.defName, false )
		color	= UI:GetItemColor( self.defName )
	end

	self:SetText( name, self.layers.ITEM_NAME )
	self:SetColor( color, self.layers.ITEM_NAME )

end


--
function UI.LootNotifyWnd:UpdateRewardCargo()	

	local strReward = ""
	
	local bDef = not self.bAccountAura
	if bDef and UI:IsDefJunk( self.defName ) and not UI:IsDefQuestItem( self.defName ) then
		strReward = self:JunkPrice2Str( self.junkPriceInfo )
	end

	if strReward ~= "" then

		local str = UI:GetStringByName( "itemTooltip_sellPrice" )
		str = str..": "..strReward

		self:SetLayerVisible( true, self.layers.REWARD_CARGO )
		self.rewardCargoMetaText:SetText( str, true )

	end

end   


--
function UI.LootNotifyWnd:JunkPrice2Str( junkPriceInfo )

	local strReward = ""

	if type( junkPriceInfo ) ~= "table" then
		sys.log( "UI.LootNotifyWnd:JunkPrice2Str()[ERROR]: invalid type of the 1-st parameter (\"junkPriceInfo\"); \"table\" expected, got \"%s\"", type( junkPriceInfo ) )
		return strReward
	end

	if junkPriceInfo.type == UI.junkPriceTypes.TOKENS then

		local strIco = "$tokens$"

		strReward = string.format( "$text [text %s][fontId %d][color %u][alignment BASELINE]$", UI:Num2StrSeparatedBy3( junkPriceInfo.tokens ), self.rewardFontId, self.rewardColor )
		strReward = strReward..strIco

	elseif junkPriceInfo.type == UI.junkPriceTypes.CREDITS then

		local strIco = "$credits_big$"

		strReward = string.format( "$text [text %s][fontId %d][color %u][alignment BASELINE]$", UI:Num2StrSeparatedBy3( junkPriceInfo.credits ), self.rewardFontId, self.rewardColor )
		strReward = strReward..strIco

	elseif junkPriceInfo.type == UI.junkPriceTypes.NONE then	-- #0038482 - может быть лут без цены
		-- пустая строка

	else
		sys.log( "UI.LootNotifyWnd:JunkPrice2Str()[ERROR]: unhandled junk price type: %s", tostring( junkPriceInfo.type ) )
	end

	return strReward

end


--
function UI.LootNotifyWnd:UpdateRewardImmediate()

	local str = UI:GetStringByName( "lootNotify_immediateReward" )
	local strReward = "error"

	if self.bSalvaged or ( not self.bAccountAura and UI:IsDefJunk( self.defName ) ) then
		strReward = self:JunkPrice2Str( self.junkPriceInfo )
	else
		sys.log( "UI.LootNotifyWnd:UpdateRewardImmediate()[ERROR]: not junk" )
	end

	str = string.gsub( str, "%$reward%$", strReward )

	self:SetLayerVisible( true, self.layers.REWARD_IMMEDIATE )	
	self.rewardImmediateMetaText:SetText( str, true )

end


--
function UI.LootNotifyWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ) then
		self:Reset()
		UI.HudWnd:OnLootNotifyHide()
	end	

end


--
function UI.LootNotifyWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:RestartAnimation()
	end

	self:UpdateMetaTextPos()

end


--
function UI.LootNotifyWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.LootNotifyWnd:UpdateMetaTextPos()

	self.rewardCargoMetaText:UpdateScreenOrgFromLayer( self, self.layers.REWARD_CARGO )	
	self.rewardImmediateMetaText:UpdateScreenOrgFromLayer( self, self.layers.REWARD_IMMEDIATE )	

end


--
function UI.LootNotifyWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REWARD_CARGO then
		self.rewardCargoMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.REWARD_IMMEDIATE then
		self.rewardImmediateMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.LootNotifyWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateMetaTextAlpha()

end


--
function UI.LootNotifyWnd:UpdateMetaTextAlpha()

	if self:IsLayerVisible( self.layers.REWARD_CARGO ) then
		local alpha = UI:GetAlpha( self:GetColor( self.layers.REWARD_CARGO ) )
		self.rewardCargoMetaText:SetAlpha( alpha )	

	elseif self:IsLayerVisible( self.layers.REWARD_IMMEDIATE ) then
		local alpha = UI:GetAlpha( self:GetColor( self.layers.REWARD_IMMEDIATE ) )
		self.rewardImmediateMetaText:SetAlpha( alpha )	
	end

end


--
function UI.LootNotifyWnd:AddControl( wnd, effectLayer, locatorName, params )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, params )

end


--
function UI.LootNotifyWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end           