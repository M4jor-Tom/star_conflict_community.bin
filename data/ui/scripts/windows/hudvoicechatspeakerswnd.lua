-- ----------------------------------------------------------------------------
--
-- Workfile: hudvoicechatspeakerswnd.lua
-- Copyright é 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudVoiceChatSpeakersWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudVoiceChatSpeakersWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "HudVoiceChatSpeakersWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_voiceChatSpeakers_list",
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
function UI.HudVoiceChatSpeakersWnd:Reset()

	self:Clear()
	self:UpdateVisibity()
	
end


--
function UI.HudVoiceChatSpeakersWnd:OnVoiceChatRecording( bSet )

	local localPlayerId = UI.HudWnd.localPlayerId

	if bSet then
		self:AddSpeaker( localPlayerId )
	else
		self:RemoveSpeaker( localPlayerId )
	end
	
end


--
function UI.HudVoiceChatSpeakersWnd:OnVoiceChatPlayerTalking( playerId, bSet ) 

	local localPlayerId = UI.HudWnd.localPlayerId
	if playerId ~= localPlayerId then

    	if bSet then
    		self:AddSpeaker( playerId )
    	else
    		self:RemoveSpeaker( playerId )
    	end

	end

end


--
function UI.HudVoiceChatSpeakersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if result ~= 0 then
		return
	end

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		local playerCid = UI:GetPlayerClanById( data.playerId )
		
		if playerCid == cid then
			local slotWnd = self:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnClanNameChanged()
			end
		end

	end	

end


--
function UI.HudVoiceChatSpeakersWnd:UpdateVisibity()

	if self:GetNumRecords() > 0 then
		self:RemoveStyle( UI.WS_NOT_DRAW )
	else
		self:AddStyle( UI.WS_NOT_DRAW )
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudVoiceChatSpeakersWnd.btnPrototypeName = "HudVoiceChatSpeakers_SlotWnd"

UI.HudVoiceChatSpeakersWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.HudVoiceChatSpeakersWnd.MAX_SLOTS = 12
UI.HudVoiceChatSpeakersWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudVoiceChatSpeakersWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.HudVoiceChatSpeakersWnd:AddSpeaker( playerId )

	if self:GetNumRecords() >= self.MAX_SLOTS then
		sys.log( "UI.HudVoiceChatSpeakersWnd:AddSpeaker()[ERROR]: cannot show speaker; max slots reached" )
		return
	end

	local data = { playerId = playerId }
	self:AddRecord( data )

	self:UpdateVisibity()
	
end


--
function UI.HudVoiceChatSpeakersWnd:RemoveSpeaker( playerId )

	local datas = {}
	local numRecords_old = self:GetNumRecords()

	for recordIdx = 1, numRecords_old do

		local data = self:GetRecordData( recordIdx )

		if data.playerId ~= playerId then
			table.insert( datas, data )
		end

	end

	local numRecords_new = #datas

	if numRecords_new == numRecords_old then
		return
	end

	self:Clear()

	for recordIdx = 1, numRecords_new do
		self:AddRecord( datas[ recordIdx ] )
	end

	self:UpdateVisibity()

end


--
function UI.HudVoiceChatSpeakersWnd:F_OnEventSaveUiState()

	local numRecords = self:GetNumRecords()
	if numRecords == 0 then
		return
	end

	local datas = {}

	for recordIdx = 1, numRecords do
		local data = self:GetRecordData( recordIdx )
		table.insert( datas, data )
	end

	UI.store.HudVoiceChatSpeakersWnd =
	{
		datas = datas,
	}

end


--
function UI.HudVoiceChatSpeakersWnd:F_OnEventRestoreUiState()

	if UI.store.HudVoiceChatSpeakersWnd then

		for recordIdx = 1, #UI.store.HudVoiceChatSpeakersWnd.datas do
			self:AddRecord( UI.store.HudVoiceChatSpeakersWnd.datas[ recordIdx ] )
		end

		self:UpdateVisibity()

		UI.store.HudVoiceChatSpeakersWnd = nil

	end

end


-- ----------------------------------------------------------------------------
-- UI.HudVoiceChatSpeakers_SlotWnd
-- ----------------------------------------------------------------------------

UI.HudVoiceChatSpeakers_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudVoiceChatSpeakers_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name	= "HudVoiceChatSpeakers_SlotWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "hud_voiceChatSpeakers_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "icon",
						layer		= "UI.HudVoiceChatSpeakers_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text",
						layer		= "UI.HudVoiceChatSpeakers_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_voiceChatSpeakers_slot_ico",
			}}
		},

		-- NAME
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
		},  
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudVoiceChatSpeakers_SlotWnd:OnClanNameChanged()

	local data = self:GetRecordData()
	self:UpdateName( data )

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudVoiceChatSpeakers_SlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    ICO_EFFECT	= 1,
    NAME		= 2,
}

UI.HudVoiceChatSpeakers_SlotWnd.effectInfo =
{
	ico =
	{
		animLocalPlayer		= "mic",
		animNonLocalPlayer	= "idle",
	}
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudVoiceChatSpeakers_SlotWnd:Reset()

	self:SetLayerVisible( false, self.layers.ICO_EFFECT )
	self:SetText( "", self.layers.NAME )

end


--
function UI.HudVoiceChatSpeakers_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateName( data )

end


--
function UI.HudVoiceChatSpeakers_SlotWnd:UpdateIco( data )

	self:SetLayerVisible( true, self.layers.ICO_EFFECT )

	local bLocal = data.playerId == UI.HudWnd.localPlayerId
	local anim = bLocal and self.effectInfo.ico.animLocalPlayer or self.effectInfo.ico.animNonLocalPlayer

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:StartAnimation( anim )
	end

end


--
function UI.HudVoiceChatSpeakers_SlotWnd:UpdateName( data )

	local name = UI:MakePlayerNameById( data.playerId, true, false, false )
	self:SetText( name, self.layers.NAME )	

end