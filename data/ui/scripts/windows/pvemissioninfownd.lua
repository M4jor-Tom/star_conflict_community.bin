-- ----------------------------------------------------------------------------

-- Workfile: pvemissioninfownd.lua
-- копия UI.GameplayScenarioDescriptionWnd, переделанная в прототип

-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.PveMissionInfoWnd = 
{
	def =
	{
		className = "Wnd",
		props =
		{
			name			= "PveMissionInfoWnd",
			style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
			isPrototype		= true,
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
					defName 			= "gameplay_scenario_description",
	       			defaultAnimation	= "idle",
	       			links =
	           		{
	           			{
	           				objName		= "self",
	           				animParams	= UI.EffectAnimParams.SIZE,
	           			},
	           			{
	           				objName		= "title19",
	           				layer 		= "UI.PveMissionInfoWnd.layers.TITLE_TEXT",
	           				animParams	= UI.EffectAnimParams.ALL,
	           			},
	           			{
	           				objName		= "history_text",
	           				layer 		= "UI.PveMissionInfoWnd.layers.TEXT_EFFECT",
	           				animParams	= UI.EffectAnimParams.POS,
	           			},
	           		}
	       		}}
			},
			-- TITLE_TEXT
			{
				layerType		= UI.LAYER_TEXT,
	   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
			-- TEXT_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				updatable	= false,
				effects =
				{{
					defName				= "gameplay_scenario_description_text",
					defaultAnimation    = "idle",
					links =
	           		{
	           			{
	           				objName		= "title20",
	           				layer 		= "UI.PveMissionInfoWnd.layers.TEXT_TEXT",
	           				animParams	= UI.EffectAnimParams.ALL,
	           			},
	           		}
				}}
			},
			-- TEXT_TEXT
			{
				layerType		= UI.LAYER_TEXT,
	   			formatFlags		= FONT.TF_WORDBREAK,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
		},
	},
}

UI.PveMissionInfoWnd.layers = 
{
	MAIN_EFFECT 			= 0,
	TITLE_TEXT 				= 1,
	TEXT_EFFECT 			= 2,
	TEXT_TEXT 				= 3,
}

UI.PveMissionInfoWnd.curTextId = 1
UI.PveMissionInfoWnd.scenarioName = ""
UI.PveMissionInfoWnd.crossBtn	= nil
UI.PveMissionInfoWnd.backBtn	= nil
UI.PveMissionInfoWnd.nextkBtn	= nil


--
function UI.PveMissionInfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.PveMissionInfoWnd:CreateControls()

	self.crossBtn	= UI:CreateChildWnd( self, UI.CrossBtn, "" )
	self.backBtn	= UI:CreateChildWnd( self, UI.PveMissionInfo_BackBtn, "" )
	self.nextkBtn	= UI:CreateChildWnd( self, UI.PveMissionInfo_NextBtn, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.crossBtn, mainEffect, "btn_x5", UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.backBtn, mainEffect, "btn_1_14", UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.nextkBtn, mainEffect, "btn_1_13", UI.EffectAnimParams.POS )

end


--
function UI.PveMissionInfoWnd:SetTextId( id )
	local texts = PvE_Missions[ self.scenarioName ].scenario_description or { "str1", "str2", "str3" }
	self.curTextId = UI:Clamp( id, 1, #texts )
	if id < 2 then
		self.backBtn:AddStyle( UI.WS_DISABLE )
	else
		self.backBtn:RemoveStyle( UI.WS_DISABLE )
	end
	if id >= #texts then
		self.nextkBtn:SetText( UI:GetStringByName( "gameplay_scenario_description_close" ), 2 )
	else
		self.nextkBtn:SetText( UI:GetStringByName( "gameplay_scenario_description_next" ), 2 )
	end
	local text = UI:GetStringByName( texts[ id ] )
	self:SetText( text, self.layers.TEXT_TEXT )
	local selfRect = self:GetLayerRect( self.layers.TEXT_TEXT )
	local height = _G.MeasureText( text, self:GetFont( self.layers.TEXT_TEXT ), selfRect, FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_WORDBREAK, selfRect ).w
	local textEffect = UI:GetEffectFromLayer( self, self.layers.TEXT_EFFECT )
	local top = textEffect:GetObjPos( "title20" ).y
	height = height + 2 * top
	local max = textEffect:GetObjSize( "self" ).y
	local min = textEffect:GetObjSize( "dist_min" ).y
	local time = ( height - min ) / ( max - min )
	textEffect:SetAnimationTime( time )
	textEffect:Update( 0 )
end

--
function UI.PveMissionInfoWnd:UpdateForData( scenarioName )
	self.scenarioName = scenarioName
	self:SetText( UI:GetLevelLocalizedName( PvE_Missions[ self.scenarioName ].levelName ), self.layers.TITLE_TEXT )
	self:SetTextId( 1 )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetSpriteTexture( "ico", UI:GetLevelScenarioImage( PvE_Missions[ self.scenarioName ].levelName ) )
end

--
function UI.PveMissionInfoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if self.crossBtn == wnd then
		UI:PlayGlobalSound( "sound/ui/MsgHide" )
		self:UnlinkFromParent()
	elseif self.backBtn == wnd then
		self:SetTextId( self.curTextId - 1 )
		UI:PlayGlobalSound( UI.sounds.btnClick )
	elseif self.nextkBtn == wnd then
		local texts = PvE_Missions[ self.scenarioName ].scenario_description or { "str1", "str2", "str3" }
		if self.curTextId >= #texts then
			self:UnlinkFromParent()
		else
			self:SetTextId( self.curTextId + 1 )
		end
		UI:PlayGlobalSound( UI.sounds.btnClick )
	end
	return true
end


--
--
function UI.PveMissionInfoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.PveMissionInfoWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.PveMissionInfoWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	if btnIdx ~= 0 then
		return
	end

	-- если клик на элемент, не пиндлежащий к данному окну, то скрыть
	-- исключение: если показывается перекрывающее окно (месседжбокс и т.п.) - тогда вообще не реагировать

	if UI:GetFirstOverlayWnd() then
		return
	end

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )
	if wndUnderMouse and wndUnderMouse ~= self and not wndUnderMouse:IsChildOf( self ) then
		self:UnlinkFromParent()
	end

end

-- -----------------------------------------------------------
-- UI.PveMissionInfo_BackBtn
-- -----------------------------------------------------------
UI.PveMissionInfo_BackBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		props =
		{
			name		= "PveMissionInfo_BackBtn",
			isPrototype	= true,
		}
	},

	textId = "gameplay_scenario_description_back"
}

-- -----------------------------------------------------------
-- UI.PveMissionInfo_NextBtn
-- -----------------------------------------------------------
UI.PveMissionInfo_NextBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		props =
		{
			name		= "PveMissionInfo_NextBtn",
			isPrototype	= true,
		}
	},

	textId = "gameplay_scenario_description_next"
}