-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfocustomwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesInfoCustomWnd = {}
local fi = UI.HudForcesInfoCustomWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoCustomWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoCustomWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "hud_forcesInfoCustom_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesInfoCustomWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
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
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoCustomWnd:Setup( strId, param1, param2 )
	
	if type( strId ) ~= "string" then
		sys.log( "UI.HudForcesInfoCustomWnd:Setup()[ERROR]: cannot show window - invalid type of the 1-st param (\"strId\"); \"string\" expected, got \"%s\"", type( strId ) )
		return
	end
	
	if strId == "" then
		sys.log( "UI.HudForcesInfoCustomWnd:Setup()[ERROR]: cannot show window - empty string id" )
		return
	end
	
	self:Reset()
	
	self.data =
	{
		strId	= strId,
		param1	= param1,
		param2	= param2,
		
	}
	
	self:FullUpdate()
	
	self:NotifyHudOnDataChanged()
	
end


--
function UI.HudForcesInfoCustomWnd:IsDataToShow()

	return self.data ~= nil

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudForcesInfoCustomWnd.layers =
{
    MAIN_EFFECT		= 0,
	TEXT			= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesInfoCustomWnd.data = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoCustomWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_END_LEVEL )

end


--
function UI.HudForcesInfoCustomWnd:Reset()

	self.data = nil
	self:SetText( "", self.layers.TEXT )
	
	self:NotifyHudOnDataChanged()
	
end


--
function UI.HudForcesInfoCustomWnd:FullUpdate()
	
	local text = ""
	
	if self.data then
	
		text = UI:GetStringByName( self.data.strId )
		
		-- случай, когда нет одного или обоих параметров, считается законным
		
		if self.data.param1 ~= nil then
		
			local numSubst = 0
			text, numSubst = string.gsub( text, "%$param1%$", tostring( self.data.param1 ) )
			
			if numSubst == 0 then
				sys.log( "UI.HudForcesInfoCustomWnd:FullUpdate()[ERROR]: param1 is not nil, but cannot find placeholder \"$param1$\" in string \"%s\"", self.data.strId )
			end
			
		end
		
		if self.data.param2 ~= nil then
		
			local numSubst = 0
			text, numSubst = string.gsub( text, "%$param2%$", tostring( self.data.param2 ) )
			
			if numSubst == 0 then
				sys.log( "UI.HudForcesInfoCustomWnd:FullUpdate()[ERROR]: param2 is not nil, but cannot find placeholder \"$param2$\" in string \"%s\"", self.data.strId )
			end
			
		end
		
	end
	
	self:SetText( text, self.layers.TEXT )

end


--
function UI.HudForcesInfoCustomWnd:NotifyHudOnDataChanged()

	if UI.HudWnd.OnHudForcesInfoCustomWndDataChanged then
		UI.HudWnd:OnHudForcesInfoCustomWndDataChanged()
	else
		sys.log( "UI.HudForcesInfoCustomWnd:NotifyHudOnDataChanged()[ERROR]: cannot find function UI.HudWnd:OnHudForcesInfoCustomWndDataChanged()" )
	end

end


--
function UI.HudForcesInfoCustomWnd:F_OnEventSaveUiState()
	
	UI.store.HudForcesInfoCustomWnd =
	{
		data	= self.data
	}
	
end


--
function UI.HudForcesInfoCustomWnd:F_OnEventRestoreUiState()
	
	if UI.store.HudForcesInfoCustomWnd then
	
		if UI.store.HudForcesInfoCustomWnd.data then
			self:Setup( UI.store.HudForcesInfoCustomWnd.data.strId, UI.store.HudForcesInfoCustomWnd.data.param1, UI.store.HudForcesInfoCustomWnd.data.param2 )
		end
	
		UI.store.HudForcesInfoCustomWnd = nil
	end
	
end


--
function UI.HudForcesInfoCustomWnd:F_OnEventEndLevel( hSender, iParam0, iParam1, fParam0, fParam1 )

	-- резет этого окна не происходит c собщим резетом худа UI.HudWnd:Reset(),
	-- т.к. если общий резет вдруг будет вызван посреди геймлпея, то эту информацию потом невозможно будет восстановить в UI.HudWnd:Init()

	if self.data then
		self:Reset()
	end	

end