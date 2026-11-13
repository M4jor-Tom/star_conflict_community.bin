-- ----------------------------------------------------------------------------
--
-- Workfile: debriefingowwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.DebriefingOWWnd = {}
local dw = UI.DebriefingOWWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOWWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name	= "DebriefingOWWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "debriefingOW_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.DebriefingOWWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "debrifing_win2",
						layer		= "UI.DebriefingOWWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "blackBg",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "debriefingOW_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.DebriefingOWWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bookmarks",
						wnd			= "UI.DebriefingOW_PageTypeList",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",
						wnd			= "UI.DebriefingOW_ExitBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.DebriefingOW_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_caption" ),
		},
	},

	children =
	{
		"UI.DebriefingOW_PageTypeList",
		"UI.DebriefingOW_ExitBtn",
		"UI.DebriefingOW_CrossBtn",
		"UI.DebriefingOW_GENERAL",
		"UI.DebriefingOW_STATS",	
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOWWnd:Setup( data )

	self.data = data or {}

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.DebriefingOWWnd:GetData()

	return self.data

end


--
function UI.DebriefingOWWnd:GetDataForPlayer( playerId )

	for idx, playerData in ipairs( self.data.players ) do
	
		if playerData and playerData.playerId == playerId then
			return playerData
		end

	end

	return nil

end


--
function UI.DebriefingOWWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.DebriefingOW_GENERAL:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.DebriefingOW_STATS:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

end


--
function UI.DebriefingOWWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.DebriefingOW_GENERAL:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.DebriefingOW_STATS:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

end


--
function UI.DebriefingOWWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.DebriefingOW_GENERAL:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.DebriefingOW_STATS:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

end


--
function UI.DebriefingOWWnd:GetJunkPriceInfo( defName )

	return UI:GetJunkPriceInfo( defName )

end


--
function UI.DebriefingOWWnd:GetLootItems()

	local items = {}

	local data = self:GetData()
	if data.inventory ~= nil then
	
		if type( data.inventory ) == "table" then

			-- первод из 0-based в 1-based
			if data.inventory[ 0 ] ~= nil then
    			for itemIdx, item in pairs( data.inventory ) do
    				items[ itemIdx + 1 ] = item
    			end
			else
				items = data.inventory
			end

		else
			sys.log( "UI.DebriefingOWWnd:GetLootItems()[ERROR]: invalid type of the field \"inventory\"; \"table\" or \"nil\" expected, got \"%s\"", type( data.inventory ) )
		end

	end

	return items
	
end


--
function UI.DebriefingOWWnd:IsWin()

	local bWin = false
	if type( self.data.docked ) == "number" then
        bWin = self.data.docked ~= 0
	else
		sys.log( "UI.DebriefingOWWnd:IsWin()[ERROR]: invalid type of then field \"docked\"; \"number\" expected, got \"%s\"", type( self.data.docked ) )
	end

	return bWin

end


--
function UI.DebriefingOWWnd:GetKarma()

	local karma = 0

	if type( self.data.playerStats ) == "table" then

    	if type( self.data.playerStats.karma ) == "number" then
    		karma = self.data.playerStats.karma
    	else
    		sys.log( "UI.DebriefingOWWnd:GetKarma()()[ERROR]: invalid type of the field \"playerStats.karma\"; \"number\" expected, got \"%s\"", type( self.data.playerStats.karma ) )
    	end

	else
		sys.log( "UI.DebriefingOWWnd:GetKarma()[ERROR]: invalid type of the field \"playerStats\"; \"table\" expected, got \"%s\"", type( self.data.playerStats ) )
	end	

	return karma

end


--
function UI.DebriefingOWWnd:GetFactionRep()

	local factionRep = {}

	if type( self.data.factionRep ) == "table" then

		-- первод из 1-based в 0-based
		for i = 0, ai.Faction.NUM - 1 do
			local idx = i + 1
			if type( self.data.factionRep[ idx ] ) == "number" then
				factionRep[ i ] = self.data.factionRep[ idx ]
			else
				sys.log( "UI.DebriefingOWWnd:GetFactionRep()()[ERROR]: invalid type of the field \"factionRep[ %s ]\"; \"number\" expected, got \"%s\"", UI:Val2Key( ai.Faction, i ), type( self.data.factionRep[ idx ] ) )
				break
			end
		end

	else
		sys.log( "UI.DebriefingOWWnd:GetFactionRep()[ERROR]: invalid type of the field \"factionRep\"; \"table\" expected, got \"%s\"", type( self.data.factionRep ) )
	end

	return factionRep

end


--
function UI.DebriefingOWWnd:GetKillerUid()

	local killerUid = UI.INVALID_U64_ID

	if not self:IsWin() then

    	if self.data.killerUid ~= nil then

    		if type( self.data.killerUid ) == "userdata" then
    			killerUid = self.data.killerUid
    		else
    			sys.log( "UI.DebriefingOWWnd:GetKillerUid()()[ERROR]: invalid type of the field \"killerUid\"; \"userdata\" expected, got \"%s\"", type( self.data.killerUid ) )
    		end

    	end

	end

	return killerUid

end


--
function UI.DebriefingOWWnd:IsPremium()

	local bPremium = false

	if type( self.data.isPremium ) == "number" then
		bPremium = self.data.isPremium ~= 0
	else
		sys.log( "UI.DebriefingOWWnd:IsPremium()[ERROR]: invalid type of the field \"isPremium\"; \"number\" expected, got \"%s\"", type( self.data.isPremium ) )
	end

	return bPremium

end

-- ------------------------------
-- const
-- ------------------------------

dw.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,

}

dw.pageTypes =
{
	GENERAL		= 1,
	STATS		= 2,
}

dw.effectInfo =
{
	work =
	{
		pageLocator	= "debrifing_list"
	}
}

dw.sounds =
{
	close				= "sound/ui/btnClick",
	lootMouseOver		= "sound/ui/btnMouseOver",
	pageMouseOver		= UI.sounds.btnMouseOver,
	pageOpen			= UI.sounds.btnClick,
}

-- ------------------------------
-- vars
-- ------------------------------

dw.pageWnds			= {}
dw.curPageType		= -1
dw.curPageWnd		= nil
dw.data				= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOWWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self:InitPageWnds()

end


--
function UI.DebriefingOWWnd:InitPageWnds()

	for pageTypeName, pageType in pairs( self.pageTypes ) do
		
		local pageWndName = string.format( "DebriefingOW_%s", pageTypeName )
		local pageWnd = UI[ pageWndName ]

		if pageWnd then
			self:RemoveChild( pageWnd )

			self.pageWnds[ pageType ] = pageWnd
		end

	end

end


--
function UI.DebriefingOWWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.DebriefingOW_ExitBtn then
		self:ExitToHangar( true )

	elseif wnd == UI.DebriefingOW_CrossBtn then
		self:ExitToHangar( true )

	elseif wnd.PAGE_TYPE_SLOT then

		local data = wnd:GetRecordData()
		if not data.bDisabled then
			if data.pageType ~= self.curPageType then

				self:SetPage( data.pageType )
				UI:PlayGlobalSound( self.sounds.pageOpen )

			end
		end

	end

	return true

end


--
function UI.DebriefingOWWnd:OnEscape()

	self:ExitToHangar( true )
	return true

end


--
function UI.DebriefingOWWnd:ExitToHangar( bSound )

	if bSound then
		UI:PlayGlobalSound( self.sounds.close )
	end

	self:Hide()

end


--
function UI.DebriefingOWWnd:SetPage( pageType )

    if pageType == self.curPageType then
		return
	end

	self.curPageType = pageType

	self:UpdatePageTypeListSelection()
	self:UpdatePageWnd()

end


--
function UI.DebriefingOWWnd:UpdatePageTypeListSelection()

	local recordIdx = -1

	if self.curPageType ~= -1 then
		recordIdx = UI.DebriefingOW_PageTypeList:GetRecordByPageType( self.curPageType )
	end

	UI.DebriefingOW_PageTypeList:SelectRecord( recordIdx )	

end


--
function UI.DebriefingOWWnd:UpdatePageWnd()

	local needPageWnd = nil

	if self.curPageType ~= -1 then
		needPageWnd = self.pageWnds[ self.curPageType ]
	end

	if needPageWnd == self.curPageWnd then
		return
	end

	if self.curPageWnd then
		self:HidePageWndInternal()
	end

	if needPageWnd then

		self:ShowPageWndInternal( needPageWnd )
		self.curPageWnd:FullUpdate()

	end

end


--
function UI.DebriefingOWWnd:HidePageWndInternal()

	if not self.curPageWnd then
		return
	end

	self.curPageWnd:UnlinkFromParent()	

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:UnlinkWnd( self.curPageWnd:GetUiHandle(), "" )
	end

	self.curPageWnd = nil

end


--
function UI.DebriefingOWWnd:ShowPageWndInternal( pageWnd )

	if not pageWnd then
		sys.log( "UI.DebriefingOWWnd:ShowPageWndInternal()[ERROR]: pageWnd id nil" )
	end

	if self.curPageWnd ~= nil then
		sys.log( "UI.DebiefingWnd:ShowPageWndInternal()[ERROR]: curPageWnd not nil" )
	end

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	UI:AddChildAndLink( self, pageWnd, workEffect, self.effectInfo.work.pageLocator, UI.EffectAnimParams.POS )

	self.curPageWnd = pageWnd	

end


--
function UI.DebriefingOWWnd:Reset()

	UI.FullScreenSelectionWnd.Reset( self )

	self:SetPage( -1 )

end


--
function UI.DebriefingOWWnd:FullUpdate()

	self:Reset()
	
	-- создание автоген-дефов (они были в игре, в ангаре их нет);
	-- это будут временные  дефы и быстро протухнут, поэтому их надо пересоздавать непосредственно перед использованием,
	-- здесь создание нужно, чтобы имя дефа записать в итем (оно будет совпадать с тем, что было в игре, и сколько бы раз ни пересоздавался деф)
	if self.data and self.data.inventory then
		for idx, item in pairs( self.data.inventory ) do
			if item.autogenItem then
				item.defName = UI:AddTempAutogenDef( item.autogenItem )
			end
		end
	end

	self:SetPage( self.pageTypes.GENERAL )

end


--
function UI.DebriefingOWWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	UI.store.DebriefingOWWnd =
	{
		data			= self.data,
	}

end


--
function UI.DebriefingOWWnd:F_OnEventRestoreUiState()

	if UI.store.DebriefingOWWnd then

		self.data			= UI.store.DebriefingOWWnd.data

		if self:IsOnScreen() then
			self:FullUpdate()
		end
		
		UI.store.DebriefingOWWnd = nil

	end

end

-- -------------------------------------------------------------------
-- UI.DebriefingOW_ExitBtn
-- -------------------------------------------------------------------

UI.DebriefingOW_ExitBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3",

    	props =
    	{
    		name	= "DebriefingOW_ExitBtn",
    	},
    },

	textId = "debriefingOW_close"
}

-- -------------------------------------------------------------------
-- UI.DebriefingOW_CrossBtn
-- -------------------------------------------------------------------

UI.DebriefingOW_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

    	props =
    	{
    		name	= "DebriefingOW_CrossBtn",
    	},
    },
}

-- -------------------------------------------------------------------
-- UI.DebriefingOW_PageTypeList
-- -------------------------------------------------------------------

UI.DebriefingOW_PageTypeList = {}
local ptl = UI.DebriefingOW_PageTypeList

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_PageTypeList.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "DebriefingOW_PageTypeList",
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
				defName				= "debriefingOW_pageTypeList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_PageTypeList:GetRecordByPageType( pageType )

	for recordIdx = 1, self:GetNumRecords() do
		local data = self:GetRecordData( recordIdx )
		if data.pageType == pageType then
			return recordIdx
		end
	end

	return -1

end


-- ------------------------------
-- const
-- ------------------------------

ptl.btnPrototypeName	= "DebriefingOW_PageTypeSlot"

ptl.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

ptl.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

ptl.MAX_SLOTS = 2

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_PageTypeList:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	self:InitRecords()

end


--
function UI.DebriefingOW_PageTypeList:InitRecords()

	self:Clear()

	for pageType = 1, UI:GetTableLength( UI.DebriefingOWWnd.pageTypes ) do

		local data = {}
		data.pageType = pageType

		self:AddRecord( data )		

	end	

end


-- -------------------------------------------------------------------
-- UI.DebriefingOW_PageTypeSlot
-- -------------------------------------------------------------------

UI.DebriefingOW_PageTypeSlot = {}
local pts = UI.DebriefingOW_PageTypeSlot

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_PageTypeSlot.def =
{
	className		= "Wnd",
	prototype		= "ButtonsList_Btn",

	props =
	{
		name		= "DebriefingOW_PageTypeSlot",
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
				defName				= "debriefingOW_pageTypeSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "button_1",
						layer		= "UI.DebriefingOW_PageTypeSlot.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.DebriefingOW_PageTypeSlot.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "debriefingOW_pageTypeSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_PageTypeSlot:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.TEXT )
	self:SetMouseOver( false )

end


--
function UI.DebriefingOW_PageTypeSlot:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	self:UpdateAnimation()

end

-- ------------------------------
-- const
-- ------------------------------

pts.layers =
{
    MAIN_EFFECT			= 0,
    TEXT				= 1,
    MOUSE_OVER_EFFECT	= 2,
}

pts.effectInfo =
{
	main =
	{
		animSel					= "select",
		animUnsel				= "idle",
		animDisabled			= "disable",
	}
}

pts.PAGE_TYPE_SLOT = true

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_PageTypeSlot:UpdateForData( data, bAnimated )

	self:UpdateText( data )
	self:UpdateAnimation( data )

end


--
function UI.DebriefingOW_PageTypeSlot:UpdateText( data )

    local strId = string.format( "debriefingOW_page_%s", UI:Val2Key( UI.DebriefingOWWnd.pageTypes, data.pageType ) )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.TEXT )		

end


--
function UI.DebriefingOW_PageTypeSlot:UpdateAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local isSelected = self:IsSelected()
	local isDisabled = data and data.bDisabled or false

	local anim = ""

	if isSelected then
		anim = self.effectInfo.main.animSel
	elseif isDisabled then
		anim = self.effectInfo.main.animDisabled
	else
		anim = self.effectInfo.main.animUnsel
	end

	mainEffect:StartAnimation( anim )	

end


--
function UI.DebriefingOW_PageTypeSlot:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.DebriefingOW_PageTypeSlot:SetMouseOver( bMouseOver )

	if bMouseOver and self:IsOnScreen() then
		local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )
		if not bWasMouseOver then
			UI:PlayGlobalSound( UI.DebriefingOWWnd.sounds.pageMouseOver )
		end
	end

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

end


--
function UI.DebriefingOW_PageTypeSlot:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )

	return true

end


--
function UI.DebriefingOW_PageTypeSlot:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.DebriefingOW_PageTypeSlot:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen( self )

	self:UpdateMouseOver()

end


-- -------------------------------------------------------------------
-- UI.DebriefingOW_PageWnd
-- -------------------------------------------------------------------

UI.DebriefingOW_PageWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_PageWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "DebriefingOW_PageWnd",
		style		= UI.WS_UPDATE_IF_VISIBLBE,
		isPrototype	= true
	}
}

-- ------------------------------
-- interdace functions
-- ------------------------------

--
function UI.DebriefingOW_PageWnd:GetPageType()

	return self.pageType

end


--
function UI.DebriefingOW_PageWnd:FullUpdate()
end

-- ------------------------------
-- vars
-- ------------------------------

UI.DebriefingOW_PageWnd.pageType	= -1


-- -------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL
-- -------------------------------------------------------------------

UI.DebriefingOW_GENERAL = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_GENERAL.def =
{
	className	= "Wnd",
	prototype	= "DebriefingOW_PageWnd",

	props =
	{
		name		= "DebriefingOW_GENERAL",
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
				defName 			= "debriefingOW_GENERAL",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "result_block_2",
						wnd			= "UI.DebriefingOW_GENERAL_StatsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "medals",
						wnd			= "UI.DebriefingOW_GENERAL_QuestsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "trophy",
						wnd			= "UI.DebriefingOW_GENERAL_LootWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "karma",
						wnd			= "UI.DebriefingOW_GENERAL_KarmaWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "reputation",
						wnd			= "UI.DebriefingOW_GENERAL_FactionRepWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "status_image",
						layer		= "UI.DebriefingOW_GENERAL.layers.WIN_LOSE_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "status_mess",
						layer		= "UI.DebriefingOW_GENERAL.layers.WIN_LOSE_TEXTS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_1",	
						layer		= "UI.DebriefingOW_GENERAL.layers.REWARD",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WIN_LOSE_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "debriefingOW_GENERAL_winLoseBg",
			}}
		},

		-- WIN_LOSE_TEXTS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "debriefingOW_GENERAL_winLoseTexts",

				links =
				{
					{
						objName		= "text_1",	
						layer		= "UI.DebriefingOW_GENERAL.layers.WIN_LOSE_STATUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",	
						layer		= "UI.DebriefingOW_GENERAL.layers.WIN_LOSE_REASON",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WIN_LOSE_STATUS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- WIN_LOSE_REASON
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- REWARD_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "debriefingOW_GENERAL_altRewardBg",
				defaultAnimation	= "idle",
			}}
		},

		-- REWARD
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},

	children =
	{
		"UI.DebriefingOW_GENERAL_StatsWnd",
		"UI.DebriefingOW_GENERAL_QuestsWnd",
		"UI.DebriefingOW_GENERAL_LootWnd",
		"UI.DebriefingOW_GENERAL_KarmaWnd",
		"UI.DebriefingOW_GENERAL_FactionRepWnd",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL:FullUpdate()

	UI.DebriefingOW_GENERAL_StatsWnd:FullUpdate()
	UI.DebriefingOW_GENERAL_QuestsWnd:FullUpdate()
	UI.DebriefingOW_GENERAL_LootWnd:FullUpdate()

	UI.DebriefingOW_GENERAL_KarmaWnd:Setup( UI.DebriefingOWWnd:GetKarma() )
	UI.DebriefingOW_GENERAL_FactionRepWnd:Setup( UI.DebriefingOWWnd:GetFactionRep() )

	self:UpdateWinLose()
	self:UpdateReward()

end


--
function UI.DebriefingOW_GENERAL:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if not UI.DebriefingOWWnd:IsWin() and UI.DebriefingOWWnd:GetKillerUid() == uid then
		self:UpdateWinLose()		
	end

end


--
function UI.DebriefingOW_GENERAL:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if not UI.DebriefingOWWnd:IsWin() then

		local killerUid = UI.DebriefingOWWnd:GetKillerUid()
		if killerUid ~= UI.INVALID_U64_ID then

	        local killerCid = UI:GetPlayerClanByUid( killerUid )
			if killerCid == cid then
				self:UpdateWinLose()
			end
			
		end		

	end

end


--
function UI.DebriefingOW_GENERAL:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if field == _G.MasterServer.UserProfileField.UPF_CLAN_ID then

    	if not UI.DebriefingOWWnd:IsWin() then

    		local killerUid = UI.DebriefingOWWnd:GetKillerUid()
    		if killerUid == uid then
				self:UpdateWinLose()    			
    		end		

    	end

	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.DebriefingOW_GENERAL.pageType = dw.pageTypes.GENERAL

UI.DebriefingOW_GENERAL.layers =
{
	MAIN_EFFECT				= 0,
    WIN_LOSE_BG_EFFECT		= 1,
    WIN_LOSE_TEXTS_EFFECT	= 2,
    WIN_LOSE_STATUS			= 3,
    WIN_LOSE_REASON			= 4,
    REWARD_BG_EFFECT		= 5,
    REWARD					= 6,
}

UI.DebriefingOW_GENERAL.effectInfo =
{
	main =
	{
		rewardBgLocator		= "result",
	},

	rewardBg =
	{
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "dist_max",
	},

	winLoseBg =
	{
		animWin		= "win",
		animLose	= "defeat",
	},

	winLoseTexts =
	{
		animWin		= "win",
		animLose	= "defeat",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.DebriefingOW_GENERAL.rewardMetaText = UI.MetaText.GetNewInstance()

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL:F_PostLoad()

	UI.DebriefingOW_PageWnd.F_PostLoad( self )

	self.rewardMetaText:InitFromLayer( self, self.layers.REWARD ) 	

end


--
function UI.DebriefingOW_GENERAL:F_Shutdown()

	if self.rewardMetaText then
		self.rewardMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.DebriefingOW_GENERAL:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.DebriefingOW_GENERAL:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.DebriefingOW_GENERAL:UpdateMetaTextPos()

	self.rewardMetaText:UpdateScreenOrgFromLayer( self, self.layers.REWARD )

end


--
function UI.DebriefingOW_GENERAL:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REWARD then
		self.rewardMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.DebriefingOW_GENERAL:UpdateWinLose()

	local bWin = UI.DebriefingOWWnd:IsWin()
	local debriefData = UI.DebriefingOWWnd:GetData()

	-- текст статуса победа/поражение

	local strStatus = bWin and UI:GetStringByName( "debriefingOW_win" ) or UI:GetStringByName( "debriefingOW_lose" )
	self:SetText( strStatus, self.layers.WIN_LOSE_STATUS )	


	-- текст причины

    local strReason = ""

	if bWin then

		local zoneId = _G.MasterServer_GetSpaceStationZoneId()
		local zoneName = UI:ZoneId2Name( zoneId )
		local strStation = UI:ZoneStation2Str( zoneName )

		strReason = UI:GetStringByName( "debriefingOW_winDesc" )
	
		local numSubst = 0	
		strReason, numSubst = string.gsub( strReason, "%$station%$", strStation )

		if numSubst == 0 then
			sys.log( "UI.DebriefingOW_GENERAL:UpdateWinLose()[ERROR]: cannot find placeholder \"$stationName$\" in string \"debriefingOW_winDesc\"" )
		end
		
	else

		local killerUid = UI.DebriefingOWWnd:GetKillerUid()
		if killerUid ~= UI.INVALID_U64_ID then

			strReason = UI:GetStringByName( "debriefingOW_loseDesc_killedByPlayer" )

			local killerNickname = UI:MakePlayerNameByUid( killerUid, true, false, false )

			local numSubst = 0	
			strReason, numSubst = string.gsub( strReason, "%$killer%$", killerNickname )

		else

			strReason = UI:GetStringByName( "debriefingOW_loseDesc" )

		end

	end

	self:SetText( strReason, self.layers.WIN_LOSE_REASON )	


	-- анимация текста

	local textsEffect = UI:GetEffectFromLayer( self, self.layers.WIN_LOSE_TEXTS_EFFECT )
	if textsEffect then
		local anim = bWin and self.effectInfo.winLoseTexts.animWin or self.effectInfo.winLoseTexts.animLose
		textsEffect:StartAnimation( anim )
	end


	-- фон

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.WIN_LOSE_BG_EFFECT )
	if bgEffect then
		local anim = bWin and self.effectInfo.winLoseBg.animWin or self.effectInfo.winLoseBg.animLose
		bgEffect:StartAnimation( anim )
	end
	
end


--
function UI.DebriefingOW_GENERAL:UpdateReward()

	local debriefData = UI.DebriefingOWWnd:GetData()

	local credits = 0
	if type( debriefData.directLootCredits ) == "number" then
		credits = debriefData.directLootCredits
	else
		sys.log( "UI.DebriefingOW_GENERAL:UpdateReward()[ERROR]: invalid type of field \"directLootCredits\"; \"number\" expected, got \"%s\"", type( debriefData.directLootCredits ) )
	end

	local synergy = 0
	if type( debriefData.exp ) == "number" then
		synergy = debriefData.exp
	else
		sys.log( "UI.DebriefingOW_GENERAL:UpdateReward()[ERROR]: invalid type of field \"exp\"; \"number\" expected, got \"%s\"", type( debriefData.exp ) )
	end

	-- текст

	local creditsPriceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
		val			= credits,
		bIsBuyPrice	= false,
	}

	local synrgyPriceInfo =
	{
		priceType	= UI.exPriceTypes.SYNERGY,
		val			= synergy,
		bIsBuyPrice	= false,
	}

	local strCredits	= UI:PriceInfo2Str( creditsPriceInfo, self:GetColor( self.layers.REWARD ), nil, nil, true, nil )
	local strSynergy	= UI:PriceInfo2Str( synrgyPriceInfo, self:GetColor( self.layers.REWARD ), nil, nil, true, nil )

	local text = string.format( "%s %s", strCredits, strSynergy )
	self.rewardMetaText:SetText( text, true )


	-- подложка
	
	local bgEffect = UI:GetEffectFromLayer( self, self.layers.REWARD_BG_EFFECT )
	if bgEffect then

		local bgMinSize 	= bgEffect:GetObjSize( self.effectInfo.rewardBg.minSizeLocator )
		local bgMaxSize 	= bgEffect:GetObjSize( self.effectInfo.rewardBg.maxSizeLocator )
		local bgOrg			= bgEffect:GetObjPos( self.effectInfo.rewardBg.minSizeLocator )

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		local bgLocatorPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.rewardBgLocator ) or Vec2( 0, 0 )

    	local textLayerRect = self:GetLayerRect( self.layers.REWARD )

        local textWidth = _G.MeasureText(
       		self.rewardMetaText:GetFormattedText(),
       		self:GetFont( self.layers.REWARD ),
        	textLayerRect,
       		self:GetTextFormatFlags( self.layers.REWARD ),
        	textLayerRect ).z

		local bgWidth = UI:Clamp( textWidth, bgMinSize.x, bgMaxSize.x )

		local bgAnimTime = ( bgWidth - bgMinSize.x ) / ( bgMaxSize.x - bgMinSize.x )
		bgEffect:SetAnimationTime( bgAnimTime )

		local centerX = textLayerRect.x + textLayerRect.z * 0.5
		local bgPos = UI:Vec2( centerX - bgWidth * 0.5 - bgOrg.x, bgLocatorPos.y )
		bgEffect:SetPos( bgPos )

		bgEffect:Update( 0 )

	end

end


-- -------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_StatsWnd
-- -------------------------------------------------------------------

UI.DebriefingOW_GENERAL_StatsWnd = {}
local pgs = UI.DebriefingOW_GENERAL_StatsWnd

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.DebriefingOW_GENERAL_StatsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "DebriefingOW_GENERAL_StatsWnd",
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
				defName 			= "debriefingOW_GENERAL_stats",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_StatsWnd:FullUpdate()

	self:Clear()

	local slotIdx	= 1
	local rowData	= { slots = {} }

	for statType = 1, UI:GetTableLength( self.statTypes ) do

		local slotData = { statType = statType }
		rowData.slots[ slotIdx ] = slotData

    	slotIdx = slotIdx + 1

    	if slotIdx > self.MAX_SLOTS_IN_ROW then

    		self:AddRecord( rowData )

    		slotIdx = 1
    		rowData = { slots = {} }

    	end

	end	

	if next( rowData.slots ) then
		self:AddRecord( rowData )
	end

end


--
function UI.DebriefingOW_GENERAL_StatsWnd:GetNumSlotsForRecord( recordIdx )

	if recordIdx < 1 or recordIdx > self:GetNumRecords() then
		return 0
	end

	local rowWnd = self:GetButtonForRecord( recordIdx )
	if not rowWnd then
		return 0
	end

	return rowWnd:GetNumSlots()	

end

-- ------------------------------
-- const
-- ------------------------------

pgs.btnPrototypeName	= "DebriefingOW_GENERAL_StatsRow"

pgs.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

pgs.listStyle			= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
pgs.MAX_SLOTS			= 4
pgs.MAX_SLOTS_IN_ROW	= 2

--
pgs.statTypes =
{
	TIME			= 1,
	DAMAGE_DONE		= 2,
	ZONES			= 3,
	PLAYERS_KILLED	= 4,
	DISTANCE		= 5,
	PIRATES_KILLED	= 6,
	DAMAGE_RECEIVED	= 7,
	POLICE_KILLED	= 8,	
}

-- -------------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_StatsRow
-- -------------------------------------------------------------------------

UI.DebriefingOW_GENERAL_StatsRow = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.DebriefingOW_GENERAL_StatsRow.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "DebriefingOW_GENERAL_StatsRow",
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
				defName 			= "debriefingOW_GENERAL_stats_row",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,			
					},
				}
			}}
		}
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.DebriefingOW_GENERAL_StatsRow:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	for slotIdx, slotWnd in pairs( self.slots ) do
		self:HideSlot( slotIdx ) 
	end

end


--
function UI.DebriefingOW_GENERAL_StatsRow:GetSlotData( slotIdx )

	local data = self:GetRecordData()
	return data and data.slots[ slotIdx ]

end


--
function UI.DebriefingOW_GENERAL_StatsRow:GetSlotWnd( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd and slotWnd:IsChildOf( self ) then
		return slotWnd
	end

	return nil
	
end


--
function UI.DebriefingOW_GENERAL_StatsRow:GetNumSlots()

	local numSlots = 0

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			numSlots = numSlots + 1
		end
	end

	return numSlots

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.DebriefingOW_GENERAL_StatsRow.effectInfo =
{
	main =
	{
		slotPrefix = "slot_"
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.DebriefingOW_GENERAL_StatsRow.slots = {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.DebriefingOW_GENERAL_StatsRow:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.slots = {}

	self:CreateSlots()

end


--
function UI.DebriefingOW_GENERAL_StatsRow:CreateSlots()

	for slotIdx = 1, UI.DebriefingOW_GENERAL_StatsWnd.MAX_SLOTS_IN_ROW do

		local slotWnd = UI:CreateChildWnd( self, UI.DebriefingOW_GENERAL_StatsSlot, tostring( slotIdx ) )

		slotWnd:SetSlot( slotIdx )
		table.insert( self.slots, slotWnd )

	end	

end


--
function UI.DebriefingOW_GENERAL_StatsRow:UpdateForData( data, bAnimated )

	self:Reset()

	if not data then
		return
	end

	for slotIdx = 1, #data.slots do

		self:ShowSlot( slotIdx )

		local slotWnd = self.slots[ slotIdx ]
		if slotWnd then
			slotWnd:Setup( data.slots[ slotIdx ] )
		end		

	end

end


--
function UI.DebriefingOW_GENERAL_StatsRow:HideSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd then

		slotWnd:Reset()
		slotWnd:UnlinkFromParent()

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
		end

	end

end


--
function UI.DebriefingOW_GENERAL_StatsRow:ShowSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if not slotWnd then
		sys.log( "UI.DebriefingOW_GENERAL_StatsRow:ShowSlot()[ERROR]: cannot find slot %d", slotIdx )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local locatorName = string.format( "%s%d", self.effectInfo.main.slotPrefix, slotIdx )

	UI:AddChildAndLink( self, slotWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

end


-- -------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_StatsSlot
-- -------------------------------------------------------------------

UI.DebriefingOW_GENERAL_StatsSlot = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_GENERAL_StatsSlot.def =
{
	className	= "Wnd",

	props =
	{
		name		= "DebriefingOW_GENERAL_StatsSlot",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName				= "debriefingOW_GENERAL_stats_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.DebriefingOW_GENERAL_StatsSlot.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1_vol",	
						layer		= "UI.DebriefingOW_GENERAL_StatsSlot.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_StatsSlot:SetSlot( slotIdx )

	self.slotIdx = slotIdx

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:GetSlot()

	return self.slotIdx

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:GetRow()

	local parent = self:GetParent()
	return parent and parent:GetRecord() or -1

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:Reset()

	self:SetText( "", self.layers.NAME )
	self.valMetaText:SetText( "", true )
	self.data = nil

	if self.zonesIcoWnd and self.zonesIcoWnd:IsChildOf( self ) then
		self.zonesIcoWnd:Reset()
		self.zonesIcoWnd:UnlinkFromParent()
	end

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:Setup( data )

	self:Reset()

	self.data = data

	self:UpdateName()
	self:UpdateVal()

end


-- ------------------------------
-- const
-- ------------------------------

UI.DebriefingOW_GENERAL_StatsSlot.layers =
{
	MAIN_EFFECT	= 0,
	NAME		= 1,
	VAL			= 2,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.DebriefingOW_GENERAL_StatsSlot.data			= nil
UI.DebriefingOW_GENERAL_StatsSlot.valMetaText	= nil
UI.DebriefingOW_GENERAL_StatsSlot.zonesIcoWnd	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_StatsSlot:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.valMetaText = UI.MetaText.GetNewInstance()
	self.valMetaText:InitFromLayer( self, self.layers.VAL ) 	

	self:Reset()

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:F_Shutdown()

	if self.valMetaText then
		self.valMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.DebriefingOW_GENERAL_StatsSlot:UpdateMetaTextPos()

	self.valMetaText:UpdateScreenOrgFromLayer( self, self.layers.VAL )

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.VAL then
		self.valMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:UpdateName()

	local strStatType = UI:Val2Key( UI.DebriefingOW_GENERAL_StatsWnd.statTypes, self.data.statType )
	local strId = string.format( "debriefingOW_stat_%s", strStatType )

	local str = UI:GetStringByName( strId )
	self:SetText( str, self.layers.NAME )
	
end


--
function UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()

	local debriefData = UI.DebriefingOWWnd:GetData()
	local statsData = debriefData.playerStats

	if type( statsData ) ~= "table" then
		sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats\"; \"table\" expected, got \"%s\"", type( statsData ) )
		statsData = {}
	end

	local str = ""

	if self.data.statType == UI.DebriefingOW_GENERAL_StatsWnd.statTypes.TIME then

		local time = 0

		if type( statsData.lifeTime ) == "number" then
			time = statsData.lifeTime
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.lifeTime\"; \"number\" expected, got \"%s\"", type( statsData.lifeTime ) )
		end

		str = UI:Time2Str3( time )


	elseif self.data.statType == UI.DebriefingOW_GENERAL_StatsWnd.statTypes.ZONES then

		local numZones = 0

		if type( debriefData.visitedZones ) == "table" then
			numZones = UI:GetTableLength( debriefData.visitedZones )
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"visitedZones\"; \"table\" expected, got \"%s\"", type( debriefData.visitedZones ) )
		end

		str = UI:Num2StrSeparatedBy3( numZones )

		if numZones > 0 then

			local zonesIcoWnd = self:ObtainZonesIcoWnd()
			self:AddChild( zonesIcoWnd )
			zonesIcoWnd:Setup( debriefData.visitedZones )

			local strIco = string.format( "$wndk [hWnd %u]$", zonesIcoWnd:GetUiHandle() )
			str = string.format( "%s%s", strIco, str )

		end


	elseif self.data.statType == UI.DebriefingOW_GENERAL_StatsWnd.statTypes.DISTANCE then

		local dist = 0

		if type( statsData.flyDistance ) == "number" then
			dist = statsData.flyDistance
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.flyDistance\"; \"number\" expected, got \"%s\"", type( statsData.flyDistance ) )
		end

		dist = dist * 10

		str = string.format( "%s %s", UI:FNum2StrSeparatedBy3( dist ), UI:GetStringByName( "meter" ) )


	elseif self.data.statType == UI.DebriefingOW_GENERAL_StatsWnd.statTypes.DAMAGE_RECEIVED then

		local damageReceived = 0

		if type( statsData.totalDamageReceive ) == "number" then
			damageReceived = statsData.totalDamageReceive
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.totalDamageReceive\"; \"number\" expected, got \"%s\"", type( statsData.totalDamageReceive ) )
		end

		str = UI:Num2StrSeparatedBy3( damageReceived )


	elseif self.data.statType == UI.DebriefingOW_GENERAL_StatsWnd.statTypes.DAMAGE_DONE then

		local damageDone = 0

		if type( statsData.totalDamageDone ) == "number" then
			damageDone = statsData.totalDamageDone
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.totalDamageDone\"; \"number\" expected, got \"%s\"", type( statsData.totalDamageDone ) )
		end

		str = UI:Num2StrSeparatedBy3( damageDone )


	elseif self.data.statType == UI.DebriefingOW_GENERAL_StatsWnd.statTypes.PLAYERS_KILLED then

		local playersKilled = 0

		if type( statsData.playerKills ) == "number" then
			playersKilled = statsData.playerKills
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.playerKills\"; \"number\" expected, got \"%s\"", type( statsData.playerKills ) )
		end

		str = UI:Num2StrSeparatedBy3( playersKilled )


	elseif self.data.statType == UI.DebriefingOW_GENERAL_StatsWnd.statTypes.PIRATES_KILLED then

		local piratesKilled = 0

		if type( statsData.pirateKillsShips ) == "number" then
			piratesKilled = piratesKilled + statsData.pirateKillsShips
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.pirateKillsShips\"; \"number\" expected, got \"%s\"", type( statsData.pirateKillsShips ) )
		end

		if type( statsData.pirateKillsTurrets ) == "number" then
			piratesKilled = piratesKilled + statsData.pirateKillsTurrets
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.pirateKillsTurrets\"; \"number\" expected, got \"%s\"", type( statsData.pirateKillsTurrets ) )
		end

		str = UI:Num2StrSeparatedBy3( piratesKilled )


	elseif self.data.statType == UI.DebriefingOW_GENERAL_StatsWnd.statTypes.POLICE_KILLED then

		local ploceKilled = 0

		if type( statsData.policeKillsShips ) == "number" then
			ploceKilled = ploceKilled + statsData.policeKillsShips
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.policeKillsShips\"; \"number\" expected, got \"%s\"", type( statsData.policeKillsShips ) )
		end

		if type( statsData.policeKillsTurrets ) == "number" then
			ploceKilled = ploceKilled + statsData.policeKillsTurrets
		else
			sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: invalid type of the field \"playerStats.policeKillsTurrets\"; \"number\" expected, got \"%s\"", type( statsData.policeKillsTurrets ) )
		end

		str = UI:Num2StrSeparatedBy3( ploceKilled )

	else
		sys.log( "UI.DebriefingOW_GENERAL_StatsSlot:UpdateVal()[ERROR]: unhandled stat type: %s", tostring( self.data.statType ) ) 
	end

	
	self.valMetaText:SetText( str, true )

end


--
function UI.DebriefingOW_GENERAL_StatsSlot:ObtainZonesIcoWnd()

	if not self.zonesIcoWnd then
		self.zonesIcoWnd = UI:CreateChildWnd( self, UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco, "" )
	end	

	return self.zonesIcoWnd

end

-- -------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco
-- -------------------------------------------------------------------

UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco.def =
{
	className	= "Wnd",

	props =
	{
		name		= "DebriefingOW_GENERAL_StatsSlot_ZonesIco",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "debriefingOW_GENERAL_stats_slot_zones",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco:Setup( zoneInfo )

	self:Reset()

	self.zoneInfo = UI:CopyTable2( zoneInfo )
	self:UpdateTooltip()

end


--
function UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco:Reset()

	self.zoneInfo = {}
	self.tooltipData = nil

end


--
function UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco.layers =
{
	MAIN_EFFECT	= 0
}

-- ------------------------------
-- vars
-- ------------------------------

UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco.zoneInfo		= {}
UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco.tooltipData	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_StatsSlot_ZonesIco:UpdateTooltip()

	self.tooltipData = nil

	if not next( self.zoneInfo ) then
		return
	end

	self.tooltipData = {}
	self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
	self.tooltipData.caption		= UI:GetStringByName( "debriefingOW_zonesTooltipCaption" )
	self.tooltipData.text			= ""

	local names = {}

	for strZoneId, numVisits in pairs( self.zoneInfo ) do

		local zoneName = UI:ZoneId2Name( tonumber( strZoneId ) )
		local localizedName = UI:Zone2Str( zoneName )

		table.insert( names, localizedName )

	end

	-- сортировка по локализованному имени
	table.sort( names )

	for idx = 1, #names do
		self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, self.tooltipData.text ~= "" and "|" or "", names[ idx ] )
	end

end


-- -------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_QuestsWnd
-- -------------------------------------------------------------------

UI.DebriefingOW_GENERAL_QuestsWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_GENERAL_QuestsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name	= "DebriefingOW_GENERAL_QuestsWnd",
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
				defName				= "debriefingOW_GENERAL_quests",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.DebriefingOW_GENERAL_QuestsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_quests" ),
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_QuestsWnd:FullUpdate()

	self:Clear()

	local questIds = self:GetQuests()

	for idx = 1, #questIds do
		local data = { questId = questIds[ idx ] }
		self:AddRecord( data )
	end

	local adventuresIds = self:GetAdventures()

	for idx = 1, #adventuresIds do
		local data = { atid = adventuresIds[ idx ] }
		self:AddRecord( data )
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.DebriefingOW_GENERAL_QuestsWnd.btnPrototypeName	= "DebriefingOW_GENERAL_QuestSlot"

UI.DebriefingOW_GENERAL_QuestsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_1_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

UI.DebriefingOW_GENERAL_QuestsWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.DebriefingOW_GENERAL_QuestsWnd.MAX_SLOTS			= 6

UI.DebriefingOW_GENERAL_QuestsWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_QuestsWnd:GetQuests()

	local data = UI.DebriefingOWWnd:GetData()
	local quests = data and data.questsCompleted

	if quests ~= nil then
		if type( quests ) ~= "table" then
			sys.log( "UI.DebriefingOW_GENERAL_QuestsWnd:GetQuests()[ERROR]: invalid type of \"questsCompleted\"; \"table\" or \"nil\" expected, got \"%s\"", type( quests ) )
			quests = nil
		end
	end	

	if quests == nil then
		quests = {}
	end

	return quests

end


--
function UI.DebriefingOW_GENERAL_QuestsWnd:GetAdventures()

	local data = UI.DebriefingOWWnd:GetData()
	local adventures = data and data.adventuresDebriefing

	if adventures ~= nil then
		if type( adventures ) ~= "table" then
			sys.log( "UI.DebriefingOW_GENERAL_QuestsWnd:GetAdventures()[ERROR]: invalid type of \"adventuresDebriefing\"; \"table\" or \"nil\" expected, got \"%s\"", type( adventures ) )
			adventures = nil
		end
	end

	if adventures == nil then
		adventures = {}
	end

	return adventures

end


-- -------------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_QuestSlot
-- -------------------------------------------------------------------------

UI.DebriefingOW_GENERAL_QuestSlot = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.DebriefingOW_GENERAL_QuestSlot.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "DebriefingOW_GENERAL_QuestSlot",
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
				defName 			= "debriefingOW_GENERAL_quests_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",	
						layer		= "UI.DebriefingOW_GENERAL_QuestSlot.layers.QUEST_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- QUEST_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.DebriefingOW_GENERAL_QuestSlot:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:SetText( "", self.layers.QUEST_NAME )

end     


-- -----------------------------------
-- layers
-- -----------------------------------

UI.DebriefingOW_GENERAL_QuestSlot.layers =
{
	MAIN_EFFECT	= 0,
	QUEST_NAME	= 1,
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.DebriefingOW_GENERAL_QuestSlot:UpdateForData( data, bAnimated )

	self:Reset()

	if data and data.questId then
		self:UpdateQuestName( data )
	elseif data and data.atid then
		self:UpdateAdventureName( data )
	end

end


--
function UI.DebriefingOW_GENERAL_QuestSlot:UpdateQuestName( data )

	local str = UI:Quest2Str( data.questId )
	self:SetText( str, self.layers.QUEST_NAME )

end


--
function UI.DebriefingOW_GENERAL_QuestSlot:UpdateAdventureName( data )

	local str = UI:Adventure2Str( data.atid, "name" )
	self:SetText( str, self.layers.QUEST_NAME )

end


-- -------------------------------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_LootWnd
-- -------------------------------------------------------------------------------------------

UI.DebriefingOW_GENERAL_LootWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_GENERAL_LootWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name	= "DebriefingOW_GENERAL_LootWnd",
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
				defName				= "debriefingOW_GENERAL_loot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.DebriefingOW_GENERAL_LootWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "msg_text",	
						layer		= "UI.DebriefingOW_GENERAL_LootWnd.layers.NO_LOOT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_loot" ),
		},

		-- NO_LOOT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_noLoot" ),
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_LootWnd:FullUpdate()

	self:Reset()

	local items = self:GetLootItems()
	if next( items ) then

		local slotIdx	= 1
		local rowData	= { slots = {} }

		for itemIdx, item in pairs( items ) do

			local slotData = { defName = item.defName, amount = item.amount, autogenItem = item.autogenItem }
			rowData.slots[ slotIdx ] = slotData

			slotIdx = slotIdx + 1

			if slotIdx > self.MAX_SLOTS_IN_ROW then

				self:AddRecord( rowData )

				slotIdx = 1
				rowData = { slots = {} }

			end

		end	

		if next( rowData.slots ) then
			self:AddRecord( rowData )
		end

	else
		self:SetLayerVisible( true, self.layers.NO_LOOT )
	end

end


--
function UI.DebriefingOW_GENERAL_LootWnd:GetNumSlotsForRecord( recordIdx )

	if recordIdx < 1 or recordIdx > self:GetNumRecords() then
		return 0
	end

	local rowWnd = self:GetButtonForRecord( recordIdx )
	if not rowWnd then
		return 0
	end

	return rowWnd:GetNumSlots()	

end


-- ------------------------------
-- const
-- ------------------------------

UI.DebriefingOW_GENERAL_LootWnd.btnPrototypeName	= "DebriefingOW_GENERAL_LootRow"

UI.DebriefingOW_GENERAL_LootWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

UI.DebriefingOW_GENERAL_LootWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.DebriefingOW_GENERAL_LootWnd.MAX_SLOTS			= 2
UI.DebriefingOW_GENERAL_LootWnd.MAX_SLOTS_IN_ROW	= 3

UI.DebriefingOW_GENERAL_LootWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	NO_LOOT		= 2,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_LootWnd:Reset()

	self:Clear()
	self:SetLayerVisible( false, self.layers.NO_LOOT )

end


--
function UI.DebriefingOW_GENERAL_LootWnd:GetLootItems()

	local items = UI.DebriefingOWWnd:GetLootItems()

	-- Антонов сказал ругаться в лог, если лута больше некой магической цифры - см. #0032982, описание
	local MAGIC_MAX = 6
	if #items > MAGIC_MAX then
		sys.log( "UI.DebriefingOW_GENERAL_LootWnd:GetLootItems()[WARNING]: more than %d loot items", MAGIC_MAX )
	end

	return items
	
end


--
function UI.DebriefingOW_GENERAL_LootWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self:Scroll( ticks < 0, math.abs( ticks ) )

	return true

end


-- -------------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_LootRow
-- -------------------------------------------------------------------------

UI.DebriefingOW_GENERAL_LootRow = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.DebriefingOW_GENERAL_LootRow.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "DebriefingOW_GENERAL_LootRow",
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
				defName 			= "debriefingOW_GENERAL_loot_row",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,			
					},
				}
			}}
		}
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.DebriefingOW_GENERAL_LootRow:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	for slotIdx, slotWnd in pairs( self.slots ) do
		self:HideSlot( slotIdx ) 
	end

end


--
function UI.DebriefingOW_GENERAL_LootRow:GetSlotData( slotIdx )

	local data = self:GetRecordData()
	return data and data.slots[ slotIdx ]

end


--
function UI.DebriefingOW_GENERAL_LootRow:GetSlotWnd( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd and slotWnd:IsChildOf( self ) then
		return slotWnd
	end

	return nil
	
end


--
function UI.DebriefingOW_GENERAL_LootRow:GetNumSlots()

	local numSlots = 0

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			numSlots = numSlots + 1
		end
	end

	return numSlots

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.DebriefingOW_GENERAL_LootRow.effectInfo =
{
	main =
	{
		slotPrefix = "slot_"
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.DebriefingOW_GENERAL_LootRow.slots = {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.DebriefingOW_GENERAL_LootRow:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.slots = {}

	self:CreateSlots()

end


--
function UI.DebriefingOW_GENERAL_LootRow:CreateSlots()

	for slotIdx = 1, UI.DebriefingOW_GENERAL_LootWnd.MAX_SLOTS_IN_ROW do

		local slotWnd = UI:CreateChildWnd( self, UI.DebriefingOW_GENERAL_LootSlot, tostring( slotIdx ) )

		slotWnd:SetSlot( slotIdx )
		table.insert( self.slots, slotWnd )

	end	

end


--
function UI.DebriefingOW_GENERAL_LootRow:UpdateForData( data, bAnimated )

	self:Reset()

	if not data then
		return
	end

	for slotIdx = 1, #data.slots do

		self:ShowSlot( slotIdx )

		local slotWnd = self.slots[ slotIdx ]
		if slotWnd then
			slotWnd:Setup( data.slots[ slotIdx ] )
		end		

	end

end


--
function UI.DebriefingOW_GENERAL_LootRow:HideSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd then

		slotWnd:Reset()
		slotWnd:UnlinkFromParent()

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
		end

	end

end


--
function UI.DebriefingOW_GENERAL_LootRow:ShowSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if not slotWnd then
		sys.log( "UI.DebriefingOW_GENERAL_LootRow:ShowSlot()[ERROR]: cannot find slot %d", slotIdx )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local locatorName = string.format( "%s%d", self.effectInfo.main.slotPrefix, slotIdx )

	UI:AddChildAndLink( self, slotWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

end


-- -------------------------------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_LootSlot
-- -------------------------------------------------------------------------------------------

UI.DebriefingOW_GENERAL_LootSlot = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_GENERAL_LootSlot.def =
{
	className		= "Wnd",

	props =
	{
		name		= "DebriefingOW_GENERAL_LootSlot",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName				= "debriefingOW_GENERAL_loot_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.DebriefingOW_GENERAL_LootSlot.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "money",	
						layer		= "UI.DebriefingOW_GENERAL_LootSlot.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE 
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_LootSlot:SetSlot( slotIdx )

	self.slotIdx = slotIdx

end


--
function UI.DebriefingOW_GENERAL_LootSlot:GetSlot()

	return self.slotIdx

end


--
function UI.DebriefingOW_GENERAL_LootSlot:GetRow()

	local parent = self:GetParent()
	return parent and parent:GetRecord() or -1

end


--
function UI.DebriefingOW_GENERAL_LootSlot:Reset()

	self.icoWnd:Reset()

	self.data = nil
	self.tooltipData = nil

end


--
function UI.DebriefingOW_GENERAL_LootSlot:Setup( data )

	self:Reset()

	self.data = data
	
	-- автоген-деф здесь временный и быстро протухнет, поэтому его надо пересоздавать непосредственно перед использованием
	if data.autogenItem then
		UI:AddTempAutogenDef( data.autogenItem )
	end

	self:UpdateIco()
	self:UpdateName()
	self:UpdatePrice()
	self:UpdateTooltip()

end


--
function UI.DebriefingOW_GENERAL_LootSlot:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.DebriefingOW_GENERAL_LootSlot.layers =
{
    MAIN_EFFECT		= 0,
	NAME			= 1,
	PRICE			= 2,
}

UI.DebriefingOW_GENERAL_LootSlot.effectInfo =
{
	main =
	{
		icoLocator	= "icon",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.DebriefingOW_GENERAL_LootSlot.icoWnd			= nil
UI.DebriefingOW_GENERAL_LootSlot.priceMetaText	= nil
UI.DebriefingOW_GENERAL_LootSlot.data			= nil
UI.DebriefingOW_GENERAL_LootSlot.tooltipData	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_GENERAL_LootSlot:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

    self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )
	
	self:CreateControls()

end


--
function UI.DebriefingOW_GENERAL_LootSlot:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.DebriefingOW_GENERAL_LootSlot:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.DebriefingOW_GENERAL_LootSlot:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.DebriefingOW_GENERAL_LootSlot:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.DebriefingOW_GENERAL_LootSlot:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.DebriefingOW_GENERAL_LootSlot:CreateControls()

	self.icoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.icoWnd, mainEffect, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS )

	self.icoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )
	
end


--
function UI.DebriefingOW_GENERAL_LootSlot:UpdateIco()

	self.icoWnd:SetupForItem( self.data.defName )
	
	if self.data.amount > 1 then
		self.icoWnd:SetCountResources( self.data.amount )
	end

end


--
function UI.DebriefingOW_GENERAL_LootSlot:UpdateName()

	local str = UI:GetEntityLocalizedNameByDef( self.data.defName, true, false, true )
	str = UI:GetCutTextWithEllipsesMultiline( str, self:GetLayerRect( self.layers.NAME ), self:GetFont( self.layers.NAME ), self:GetTextFormatFlags( self.layers.NAME ))

	self:SetText( str, self.layers.NAME )	

end


-- уточнить, как должна выглядеть цена в репутации и токенах (дополнительные слова, иконки и т.п.)
function UI.DebriefingOW_GENERAL_LootSlot:UpdatePrice()

	local strPrice = ""

	if UI:IsDefJunk( self.data.defName ) then

		local priceInfo = UI.DebriefingOWWnd:GetJunkPriceInfo( self.data.defName )

		if priceInfo.type == UI.junkPriceTypes.TOKENS then
			strPrice = string.format( "%s$tokens$", UI:Num2StrSeparatedBy3( priceInfo.tokens ) )

		elseif priceInfo.type == UI.junkPriceTypes.CREDITS then
			strPrice = string.format( "%s$credits_big$", UI:Num2StrSeparatedBy3( priceInfo.credits ) )

		else
			sys.log( "UI.DebriefingOW_GENERAL_LootSlot:UpdatePrice()[ERROR]: unhandled price type %s for junk item \"%s\"", tostring( priceInfo.type ), self.data.defName )
		end		

	end


	self.priceMetaText:SetText( strPrice, true )		

end


--
function UI.DebriefingOW_GENERAL_LootSlot:UpdateTooltip()

	self.tooltipData = nil

	local itemType = _G.GetStoreItemTypeByDef( self.data.defName )

	if UI:IsDefJunk( self.data.defName ) then

		self.tooltipData = {}

		self.tooltipData.tooltipType		= UI.tooltipTypes.JUNK
		self.tooltipData.defName			= self.data.defName
		self.tooltipData.priceInfo			= UI.DebriefingOWWnd:GetJunkPriceInfo( self.data.defName )
		
	else
		self.tooltipData = UI:GetTooltipForItem( self.data.defName )
	end

end


-- -------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_KarmaWnd
-- -------------------------------------------------------------------

UI.DebriefingOW_GENERAL_KarmaWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "KarmaBarWnd",

    	props =
    	{
    		name = "DebriefingOW_GENERAL_KarmaWnd",
    	},
    }
}


-- -------------------------------------------------------------------
-- UI.DebriefingOW_GENERAL_FactionRepWnd
-- -------------------------------------------------------------------

UI.DebriefingOW_GENERAL_FactionRepWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "FactionRepWnd",

    	props =
    	{
    		name = "DebriefingOW_GENERAL_FactionRepWnd",
    	},
    }
}

-- -------------------------------------------------------------------
-- UI.DebriefingOW_STATS
-- -------------------------------------------------------------------

UI.DebriefingOW_STATS = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.DebriefingOW_STATS.def =
{
	className	= "Wnd",
	prototype	= "DebriefingOW_PageWnd",

	props =
	{
		name		= "DebriefingOW_STATS",
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
				defName 			= "debriefingOW_STATS",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.DebriefingOW_STATS.layers.PLAYER_SHIP_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "stat_1",
						wnd			= "UI.DebriefingOW_STATS_StatsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
--						objName		= "stat_2",	-- #0032982, комм. (0113063) - пока синергии нет
						objName		= "stat_1",
						wnd			= "UI.DebriefingOW_STATS_PlayersWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PLAYER_SHIP_NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},

	children =
	{
		"UI.DebriefingOW_STATS_StatsWnd",
		"UI.DebriefingOW_STATS_PlayersWnd",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.DebriefingOW_STATS:FullUpdate()

	-- #0032982, комм. (0113063) - пока синергии нет
--	UI.DebriefingOW_STATS_StatsWnd:FullUpdate()

	UI.DebriefingOW_STATS_PlayersWnd:FullUpdate()

	self:UpdatePlayerShipName()

end


--
function UI.DebriefingOW_STATS:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.DebriefingOW_STATS_PlayersWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

end


--
function UI.DebriefingOW_STATS:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.DebriefingOW_STATS_PlayersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

end


--
function UI.DebriefingOW_STATS:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	UI.DebriefingOW_STATS_PlayersWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

end


-- ------------------------------
-- const
-- ------------------------------

UI.DebriefingOW_STATS.pageType = dw.pageTypes.STATS

UI.DebriefingOW_STATS.layers =
{
	MAIN_EFFECT				= 0,
    PLAYER_SHIP_NAME		= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.DebriefingOW_STATS.shipMetaText = UI.MetaText.GetNewInstance()

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.DebriefingOW_STATS:F_PostLoad()

	UI.DebriefingOW_PageWnd.F_PostLoad( self )

	self.shipMetaText:InitFromLayer( self, self.layers.PLAYER_SHIP_NAME ) 	

	-- #0032982, комм. (0113063) - пока синергии нет
	UI.DebriefingOW_STATS_StatsWnd:UnlinkFromParent()	

end


--
function UI.DebriefingOW_STATS:F_Shutdown()

	if self.shipMetaText then
		self.shipMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.DebriefingOW_STATS:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.DebriefingOW_STATS:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.DebriefingOW_STATS:UpdateMetaTextPos()

	self.shipMetaText:UpdateScreenOrgFromLayer( self, self.layers.PLAYER_SHIP_NAME )

end


--
function UI.DebriefingOW_STATS:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PLAYER_SHIP_NAME then
		self.shipMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.DebriefingOW_STATS:UpdatePlayerShipName()

	local shipDefName = ""

	local debriefData = UI.DebriefingOWWnd:GetData()
	if type( debriefData.ship ) == "string" then
		shipDefName = debriefData.ship
	else
		sys.log( "UI.DebriefingOW_STATS:UpdatePlayerShipName()[ERROR]: invalid type of the field \"ship\"; \"string\" expected, got \"%s\"", type( debriefData.ship ) )
	end

	-- имя
	local strShipName = "unknown"

	if shipDefName ~= "" then
		strShipName = UI:GetEntityLocalizedNameByDef( shipDefName, true, false, false )
	else
		sys.log( "UI.DebriefingOW_STATS:UpdatePlayerShipName()[ERROR]: no ship name found" )
	end

	-- информационная строка
	local strLabel = UI:GetStringByName( "debriefingOW_playerShip" )

	-- иконка расы
	local strRaceIco = ""

	if shipDefName ~= "" then

		local shipRace = UI:GetItemRace( shipDefName )
		if shipRace ~= -1 and shipRace ~= ai.Race.NUM then

			local hTex = UI:GetRaceIcoSmallColored( shipRace )
			strRaceIco = string.format( "$texture [handle %u]$", hTex )

		else
			sys.log( "UI.DebriefingOW_STATS:UpdatePlayerShipName()[ERROR]: invalid race for ship \"%s\"", shipDefName )
		end

	end

	-- все вместе
	local str = string.format( "%s%s: %s", strRaceIco, strLabel, strShipName )

	self.shipMetaText:SetText( str, true )

end

-- ---------------------------------------------------------------------------
-- UI.DebriefingOW_STATS_PlayersWnd
-- ---------------------------------------------------------------------------

UI.DebriefingOW_STATS_PlayersWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.DebriefingOW_STATS_PlayersWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "DebriefingOW_STATS_PlayersWnd",
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
				defName 			= "debriefingOW_STATS_players",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.DebriefingOW_STATS_PlayersWnd.layers.HEADER_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",	
						layer		= "UI.DebriefingOW_STATS_PlayersWnd.layers.HEADER_KILLED",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_3",	
						layer		= "UI.DebriefingOW_STATS_PlayersWnd.layers.HEADER_DAMAGE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					}, 
				}
			}}
		},

		-- HEADER_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_encaunterName" ),
		},

		-- HEADER_KILLED
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_encaunterKilled" ),
		},

		-- HEADER_DAMAGE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_encaunterDamage" ),
		}, 
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.DebriefingOW_STATS_PlayersWnd:FullUpdate()

	self:Clear()

	local players = self:GetPlayers()

	for idx = 1, #players do

		local data = { playerInfo = players[ idx ] }
		self:AddRecord( data )

	end

end


--
function UI.DebriefingOW_STATS_PlayersWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= -1 then

		for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

			local data = self:GetRecordData( recordIdx )
			if data.playerInfo.uid == uid then

    			local slotWnd = self:GetButtonForRecord( recordIdx )
    			if slotWnd then
					slotWnd:OnPlayerNameChanged()
    			end

			end

		end

	end

end


--
function UI.DebriefingOW_STATS_PlayersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= -1 then

		for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

			local data = self:GetRecordData( recordIdx )

	        local playerCid = UI:GetPlayerClanByUid( data.playerInfo.uid )
			if playerCid == cid then

    			local slotWnd = self:GetButtonForRecord( recordIdx )
    			if slotWnd then
					slotWnd:OnPlayerNameChanged()
    			end

			end

		end

	end

end


--
function UI.DebriefingOW_STATS_PlayersWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if field == _G.MasterServer.UserProfileField.UPF_CLAN_ID then

    	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
    	if firstVisibleRecordIdx ~= -1 then

    		for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

    			local data = self:GetRecordData( recordIdx )
    			if data.playerInfo.uid == uid then

        			local slotWnd = self:GetButtonForRecord( recordIdx )
        			if slotWnd then
    					slotWnd:OnPlayerNameChanged()
        			end

    			end

    		end

    	end

	elseif field == _G.MasterServer.UserProfileField.UPF_GENERAL_STATS then

    	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
    	if firstVisibleRecordIdx ~= -1 then

    		for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

    			local data = self:GetRecordData( recordIdx )
    			if data.playerInfo.uid == uid then

        			local slotWnd = self:GetButtonForRecord( recordIdx )
        			if slotWnd then
    					slotWnd:OnGeneralStatsChanged()
        			end

    			end

    		end

		end

	end

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.DebriefingOW_STATS_PlayersWnd.layers =
{
    MAIN_EFFECT		= 0,
    HEADER_NAME		= 1,
    HEADER_KILLED	= 2,
    HEADER_DAMAGE	= 3,
}

UI.DebriefingOW_STATS_PlayersWnd.btnPrototypeName	= "DebriefingOW_STATS_PlayersSlot"

UI.DebriefingOW_STATS_PlayersWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

UI.DebriefingOW_STATS_PlayersWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.DebriefingOW_STATS_PlayersWnd.MAX_SLOTS		= 18

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.DebriefingOW_STATS_PlayersWnd:GetPlayers()

	local players = {}

	local debriefData = UI.DebriefingOWWnd:GetData()

	if debriefData.encounters ~= nil then

		if type( debriefData.encounters ) == "table" then

    		-- первод из 0-based в 1-based
			if debriefData.encounters[ 0 ] ~= nil then
    			for idx, playerInfo in pairs( debriefData.encounters ) do
    				players[ idx + 1 ] = playerInfo
    			end
			else
				players = debriefData.encounters
			end

		else
			sys.log( "UI.DebriefingOW_STATS_PlayersWnd:GetPlayers()[ERROR]: invalid type of the field \"encounters\"; \"table\" or \"nil\" expected, got \"%s\"", type( debriefData.encounters ) )
		end

	end

	return players

end


-- ---------------------------------------------------------------------------
-- UI.DebriefingOW_STATS_PlayersSlot
-- ---------------------------------------------------------------------------

UI.DebriefingOW_STATS_PlayersSlot = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.DebriefingOW_STATS_PlayersSlot.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "DebriefingOW_STATS_PlayersSlot",
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
				defName 			= "debriefingOW_STATS_players_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,			
					},

					{
						objName		= "text_1",	
						layer		= "UI.DebriefingOW_STATS_PlayersSlot.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					}, 

					{
						objName		= "dead_ico",	
						layer		= "UI.DebriefingOW_STATS_PlayersSlot.layers.KILLED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					}, 

					{
						objName		= "text_1_vol",	
						layer		= "UI.DebriefingOW_STATS_PlayersSlot.layers.DAMAGE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					}, 
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- KILLED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "debriefingOW_STATS_players_slot_killed",
				defaultAnimation	= "idle",
			}}
		},

		-- DAMAGE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.DebriefingOW_STATS_PlayersSlot:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self.nameMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.KILLED_EFFECT )
	self:SetText( "", self.layers.DAMAGE )

end


--
function UI.DebriefingOW_STATS_PlayersSlot:OnPlayerNameChanged()

	local data = self:GetRecordData()
	self:UpdateName( data )

end


--
function UI.DebriefingOW_STATS_PlayersSlot:OnGeneralStatsChanged()

	self:UpdatePlayerTooltip()

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.DebriefingOW_STATS_PlayersSlot.layers =
{
    MAIN_EFFECT		= 0,
    NAME			= 1,
    KILLED_EFFECT	= 2,
    DAMAGE			= 3,
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.DebriefingOW_STATS_PlayersSlot.nameMetaText	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.DebriefingOW_STATS_PlayersSlot:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.nameMetaText = UI.MetaText.GetNewInstance()
	self.nameMetaText:InitFromLayer( self, self.layers.NAME ) 	

end


--
function UI.DebriefingOW_STATS_PlayersSlot:F_Shutdown()

	if self.nameMetaText then
		self.nameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.DebriefingOW_STATS_PlayersSlot:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.DebriefingOW_STATS_PlayersSlot:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.DebriefingOW_STATS_PlayersSlot:UpdateMetaTextPos()

	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.NAME )

end


--
function UI.DebriefingOW_STATS_PlayersSlot:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.DebriefingOW_STATS_PlayersSlot:UpdateForData( data )

	self:Reset()
	
	self:UpdateName( data )
	self:UpdateKilled( data )
	self:UpdateDamage( data )

end


--
function UI.DebriefingOW_STATS_PlayersSlot:UpdateName( data )

	-- имя игрока

	local uid = UI.INVALID_U64_ID

	if type( data.playerInfo.uid ) == "userdata" then
		uid = data.playerInfo.uid
	else
		sys.log( "UI.DebriefingOW_STATS_PlayersSlot:UpdateName()[ERROR]: invalid type of the field \"uid\"; \"userdata\" expected, got \"%s\"", type( data.playerInfo.uid ) )
	end

	local strPlayer = ""
	if uid ~= UI.INVALID_U64_ID then
		strPlayer = string.format( "$link [type PLAYER][params {uid=u64(%d,%d), bWithClan=true}]$", uid.h, uid.l )
	end


	-- название корабля

	local shipDefName = ""

	if type( data.playerInfo.ship ) == "string" then
		shipDefName = data.playerInfo.ship
	else
		sys.log( "UI.DebriefingOW_STATS_PlayersSlot:UpdateName()[ERROR]: invalid type of the field \"ship\"; \"string\" expected, got \"%s\"", type( data.playerInfo.ship ) )
	end

	local strShip = ""
	if shipDefName ~= "" then
		local bLocalPlayer = uid == UI:GetLocalPlayerUid()
		strShip = string.format( "$link [type SHIP][params {defName=\"%s\"}]$", shipDefName )
	end

	if strShip ~= "" then
		strShip = string.format( " (%s)", strShip )
	end

	-- все вместе

	local str = string.format( "%s%s", strPlayer, strShip )
	self.nameMetaText:SetText( str, true )

end


--
function UI.DebriefingOW_STATS_PlayersSlot:UpdateKilled( data )

	-- сейчас энкаунтеры - это всегда только убитые
	self:SetLayerVisible( true, self.layers.KILLED_EFFECT )
	
end


--
function UI.DebriefingOW_STATS_PlayersSlot:UpdateDamage( data )

	local damage = 0	

	if type( data.playerInfo.dmg ) == "number" then
		damage = data.playerInfo.dmg
	else
		sys.log( "UI.DebriefingOW_STATS_PlayersSlot:UpdateDamage()[ERROR]: invalid type of the field \"dmg\"; \"number\" expected, got \"%s\"", type( data.playerInfo.dmg ) )
	end

	local strDamage = UI:Num2StrSeparatedBy3( damage )
	self:SetText( strDamage, self.layers.DAMAGE )

end


--
function UI.DebriefingOW_STATS_PlayersSlot:UpdatePlayerTooltip()

	local child = self:GetFirstChild()

	while child do

		if UI:IsWndKindOf( child, "LinkWnd" ) and child:GetLinkType() == UI.LinkWnd.linkTypes.PLAYER then
			child:UpdateTooltip()
			break
		end

		child = child:GetNextSibling()

	end

end


-- ---------------------------------------------------------------------------
-- UI.DebriefingOW_STATS_StatsWnd
-- ---------------------------------------------------------------------------

UI.DebriefingOW_STATS_StatsWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.DebriefingOW_STATS_StatsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "DebriefingOW_STATS_StatsWnd",
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
				defName 			= "debriefingOW_STATS_stats",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.DebriefingOW_STATS_StatsWnd.layers.HEADER_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",	
						layer		= "UI.DebriefingOW_STATS_StatsWnd.layers.HEADER_RESULT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_3",	
						layer		= "UI.DebriefingOW_STATS_StatsWnd.layers.HEADER_EFFICIENCY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					}, 

					{
						objName		= "text_4",	
						layer		= "UI.DebriefingOW_STATS_StatsWnd.layers.HEADER_SYNERGY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},  
				}
			}}
		},

		-- HEADER_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_statsName" ),
		},

		-- HEADER_RESULT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_statsResult" ),
		},

		-- HEADER_EFFICIENCY
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_statsEfficiency" ),
		}, 

		-- HEADER_SYNERGY
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "debriefingOW_statsSynergy" ),
		}, 
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.DebriefingOW_STATS_StatsWnd:FullUpdate()

	self:Clear()

	local stats = self:GetStats()

	for statIdx = 1, #stats do

		local statData = {}		
		statData.slotType = self.slotTypes.STAT
		statData.statInfo = stats[ statIdx ]

		self:AddRecord( statData )

	end

	local bonusData = { slotType = self.slotTypes.BONUS }
	self:AddRecord( bonusData )

	local sumNoPremiumData = { slotType = self.slotTypes.SUM_NO_PREMIUM  }
	self:AddRecord( sumNoPremiumData )

	local sumPremiumData = { slotType = self.slotTypes.SUM_PREMIUM  }
	self:AddRecord( sumPremiumData )	

end

-- -------------------------------------
-- const
-- -------------------------------------

UI.DebriefingOW_STATS_StatsWnd.layers =
{
   	MAIN_EFFECT			= 0,
    HEADER_NAME			= 1,
    HEADER_RESULT		= 2,
    HEADER_EFFICIENCY	= 3,
    HEADER_SYNERGY		= 4,
}

UI.DebriefingOW_STATS_StatsWnd.btnPrototypeName	= "DebriefingOW_STATS_StatsSlot"

UI.DebriefingOW_STATS_StatsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

UI.DebriefingOW_STATS_StatsWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.DebriefingOW_STATS_StatsWnd.MAX_SLOTS		= 24

UI.DebriefingOW_STATS_StatsWnd.slotTypes =
{
	STAT			= 1,
	BONUS			= 2,
	SUM_NO_PREMIUM	= 3,
	SUM_PREMIUM		= 4,
}

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.DebriefingOW_STATS_StatsWnd:GetStats()

	-- TODO: где брать?

local stats = {}

-- TODO: убрать
--[[
for i = 1, 30 do
	table.insert( stats, {} )
end
]]
	return stats

end


-- ---------------------------------------------------------------------------
-- UI.DebriefingOW_STATS_StatsSlot
-- ---------------------------------------------------------------------------

UI.DebriefingOW_STATS_StatsSlot = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.DebriefingOW_STATS_StatsSlot.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "DebriefingOW_STATS_StatsSlot",
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
				defName 			= "debriefingOW_STATS_stats_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,			
					},

					-- не линкуется по шрифту
					{
						objName		= "text_1",	
						layer		= "UI.DebriefingOW_STATS_StatsSlot.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					}, 

					-- не линкуется по шрифту
					{
						objName		= "text_1_vol",	
						layer		= "UI.DebriefingOW_STATS_StatsSlot.layers.RESULT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					}, 

					-- не линкуется по шрифту
					{
						objName		= "text_2_vol",	
						layer		= "UI.DebriefingOW_STATS_StatsSlot.layers.EFFICIENCY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					}, 

					-- не линкуется по шрифту
					{
						objName		= "text_3_vol",	
						layer		= "UI.DebriefingOW_STATS_StatsSlot.layers.SYNERGY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					}, 

					-- не линкуется по шрифту
					{
						objName		= "gold_icon",	
						layer		= "UI.DebriefingOW_STATS_StatsSlot.layers.SYNERGY_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					}, 
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- RESULT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- EFFICIENCY
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SYNERGY
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SYNERGY_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_priceIco",
				defaultAnimation	= "synergy_s",
			}}
		}
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.DebriefingOW_STATS_StatsSlot:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.RESULT )
	self:SetText( "", self.layers.EFFICIENCY )
	self:SetText( "", self.layers.SYNERGY )

	self:SetLayerVisible( false, self.layers.SYNERGY_ICO_EFFECT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animStat )
	end

	self:SetupFonts( true )

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.DebriefingOW_STATS_StatsSlot.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
    RESULT				= 2,
    EFFICIENCY			= 3,
    SYNERGY				= 4,
    SYNERGY_ICO_EFFECT	= 5,
}

UI.DebriefingOW_STATS_StatsSlot.effectInfo =
{
	main =
	{
		animStat					= "idle",
		animBonus					= "bonus",
		animSumNoPremiumActive		= "nopremium_active",
		animSumNoPremiumInactive	= "nopremium_noactive",
		animSumPremiumActive		= "premium_active",
		animSumPremiumInactive		= "premium_noactive",
		smallLabelFontLocator		= "text_1",
		smallValFontLocator			= "text_1_vol",
		bigLabelFontLocator			= "font_1",
		bigValFontLocator			= "font_1_vol",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.DebriefingOW_STATS_StatsSlot.smallLabelFont	= -1
UI.DebriefingOW_STATS_StatsSlot.smallValFont	= -1
UI.DebriefingOW_STATS_StatsSlot.bigLabelFont	= -1
UI.DebriefingOW_STATS_StatsSlot.bigValFont		= -1

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.DebriefingOW_STATS_StatsSlot:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local smallLabelFontName	= mainEffect:GetObjFontName( self.effectInfo.main.smallLabelFontLocator )
		local smallValFontName		= mainEffect:GetObjFontName( self.effectInfo.main.smallValFontLocator )
		local bigLabelFontName		= mainEffect:GetObjFontName( self.effectInfo.main.bigLabelFontLocator )
		local bigValFontName		= mainEffect:GetObjFontName( self.effectInfo.main.bigValFontLocator )

        self.smallLabelFont	= _G.ObtainFont( smallLabelFontName )
        self.smallValFont	= _G.ObtainFont( smallValFontName )
        self.bigLabelFont	= _G.ObtainFont( bigLabelFontName )
        self.bigValFont		= _G.ObtainFont( bigValFontName )

	end

end


--
function UI.DebriefingOW_STATS_StatsSlot:UpdateForData( data )

	self:Reset()

	local slotTypeName = UI:Val2Key( UI.DebriefingOW_STATS_StatsWnd.slotTypes, data.slotType )
	local fnName = string.format( "Update_%s", slotTypeName )

	local fn = self[ fnName ]
	if fn then
		fn( self, data )
	else
		sys.log( "UI.DebriefingOW_STATS_StatsSlot:UpdateForData()[ERROR]: cannot find function %s", fnName )
	end

end


--
function UI.DebriefingOW_STATS_StatsSlot:Update_STAT( data )

	local strName		= "unknown"	-- TODO: где брать?
	self:SetText( strName, self.layers.NAME )

	local val			= 0		-- TODO: где брать?
	local efficiency	= 0		-- TODO: где брать?
	local synergy		= 0		-- TODO: где брать?

	local strVal		= UI:Num2StrSeparatedBy3( val )
	local strEfficiency	= UI:Num2StrSeparatedBy3( efficiency )
	local strSynergy	= UI:Num2StrSeparatedBy3( synergy )

	self:SetText( strVal, self.layers.RESULT )
	self:SetText( strEfficiency, self.layers.EFFICIENCY )
	self:SetText( strSynergy, self.layers.SYNERGY )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animStat )
	end

	self:SetupFonts( true )

end


--
function UI.DebriefingOW_STATS_StatsSlot:Update_BONUS( data )

	local strName = UI:GetStringByName( "debriefingOW_statsBonus" )
	self:SetText( strName, self.layers.NAME )

	local val			= 0		-- TODO: где брать?
	local efficiency	= 0		-- TODO: где брать?
	local synergy		= 0		-- TODO: где брать?

	local strVal		= UI:Num2StrSeparatedBy3( val )
	local strEfficiency	= UI:Num2StrSeparatedBy3( efficiency )
	local strSynergy	= UI:Num2StrSeparatedBy3( synergy )

	self:SetText( strVal, self.layers.RESULT )
	self:SetText( strEfficiency, self.layers.EFFICIENCY )
	self:SetText( strSynergy, self.layers.SYNERGY )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animBonus )
	end

	self:SetupFonts( true )
	
end


--
function UI.DebriefingOW_STATS_StatsSlot:Update_SUM_NO_PREMIUM( data )

	local bPremium = UI.DebriefingOWWnd:IsPremium()

	local strName = UI:GetStringByName( "debriefingOW_statsSumNoPremium" )
	self:SetText( strName, self.layers.NAME )

	local val			= 0		-- TODO: где брать?
	local efficiency	= 0		-- TODO: где брать?
	local synergy		= 0		-- TODO: где брать?

	local strVal		= UI:Num2StrSeparatedBy3( val )
	local strEfficiency	= UI:Num2StrSeparatedBy3( efficiency )
	local strSynergy	= UI:Num2StrSeparatedBy3( synergy )

	self:SetText( strVal, self.layers.RESULT )
	self:SetText( strEfficiency, self.layers.EFFICIENCY )
	self:SetText( strSynergy, self.layers.SYNERGY )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local anim = bPremium and self.effectInfo.main.animSumNoPremiumInactive or self.effectInfo.main.animSumNoPremiumActive
		mainEffect:StartAnimation( anim )
	end

	self:SetupFonts( bPremium )

	self:SetLayerVisible( true, self.layers.SYNERGY_ICO_EFFECT )	

end


--
function UI.DebriefingOW_STATS_StatsSlot:Update_SUM_PREMIUM( data )

	local bPremium = UI.DebriefingOWWnd:IsPremium()

	local strName = bPremium and UI:GetStringByName( "debriefingOW_statsSumPremium_isPremium" ) or UI:GetStringByName( "debriefingOW_statsSumPremium_noPremium" )
	self:SetText( strName, self.layers.NAME )

	local synergy		= 0		-- TODO: где брать?
	local strSynergy	= UI:Num2StrSeparatedBy3( synergy )
	self:SetText( strSynergy, self.layers.SYNERGY )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local anim = bPremium and self.effectInfo.main.animSumPremiumActive or self.effectInfo.main.animSumPremiumInactive
		mainEffect:StartAnimation( anim )
	end

	self:SetupFonts( not bPremium )

	self:SetLayerVisible( true, self.layers.SYNERGY_ICO_EFFECT )	

end


--
function UI.DebriefingOW_STATS_StatsSlot:SetupFonts( bSmall )

	local labelFont	= bSmall and self.smallLabelFont or self.bigLabelFont
	local valFont	= bSmall and self.smallValFont or self.bigValFont

	self:SetFont( labelFont, self.layers.NAME )
	self:SetFont( valFont, self.layers.RESULT )
	self:SetFont( valFont, self.layers.EFFICIENCY )
	self:SetFont( valFont, self.layers.SYNERGY )

end