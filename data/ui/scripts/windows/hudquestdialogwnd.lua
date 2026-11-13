-- ----------------------------------------------------------------------------
--
-- Workfile: hudquestwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudQuestDialogWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.HudQuestDialogWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudQuestDialogWnd",
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
				defName 			= "hud_quest",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self25",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.HudQuestDialogWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",
						layer		= "UI.HudQuestDialogWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.HudQuestDialogWnd:ShowDialog( data )

	if type( data ) ~= "table" then
		sys.log( "UI.HudQuestDialogWnd:ShowDialog()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( data ) )
		return
	end

	if not next( data ) then
		sys.log( "UI.HudQuestDialogWnd:ShowDialog()[ERROR]: empty data" )
		return
	end

	local dataFixed = self:ValidateData( data )

	if not next( dataFixed ) then
		sys.log( "UI.HudQuestDialogWnd:ShowDialog()[ERROR]: cannot show dialogs; invalid data format" )
		return
	end

	if not self.curData then
		self:StartDialogSeriesAnimated( dataFixed )
	else
		self:EnqueDialogSeries( dataFixed )
	end	

end


--
function UI.HudQuestDialogWnd:ShowDialogForQuest( questId, stage, eventIdx )

	if type( questId ) ~= "number" then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForQuest()[ERROR]: invalid type of the 1-st parameter (\"questId\"); \"number\" expected, got \"%s\"", type( questId ) )
		return
	end

	if type( stage ) ~= "number" then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForQuest()[ERROR]: invalid type of the 2-nd parameter (\"stage\"); \"number\" expected, got \"%s\"", type( stage ) )
		return
	end

	if type( eventIdx ) ~= "number" then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForQuest()[ERROR]: invalid type of the 3-rd parameter (\"eventIdx\"); \"number\" expected, got \"%s\"", type( eventIdx ) )
		return
	end


	local numDialogs = UI:GetQuestNumDialogsForEvent( questId, stage, eventIdx )
	if numDialogs == 0 then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForQuest()[ERROR]: no dialogs found for quest %d stage %d event %d", questId, stage, eventIdx )
		return
	end

	local data = {}

	for dialogIdx = 1, numDialogs do

		local dialogData = self:MakeEmptyDialogData()

    	local dialogInfo = UI:GetQuestDialogInfo( questId, stage, eventIdx, dialogIdx )
    	if dialogInfo then

    		if type( dialogInfo.character ) == "string" then
    			dialogData.character = dialogInfo.character
			else
				sys.log( "UI.HudQuestDialogWnd:ShowDialogForQuest()[ERROR]: invalid type of the find _Quests[%d].stages[%d].info_events[%d].dialogs[%d].character; \"string\" expected, got \"%s\"", questId, stage, eventIdx, dialogIdx, type( dialogInfo.character ) )
			end

    		if type( dialogInfo.text ) == "string" then
    			dialogData.text = dialogInfo.text
			else
				sys.log( "UI.HudQuestDialogWnd:ShowDialogForQuest()[ERROR]: invalid type of the find _Quests[%d].stages[%d].info_events[%d].dialogs[%d].text; \"string\" expected, got \"%s\"", questId, stage, eventIdx, dialogIdx, type( dialogInfo.text ) )
			end

		else
			sys.log( "UI.HudQuestDialogWnd:ShowDialogForQuest()[ERROR]: cannot find dialog info for quest %d stage %d event %d", questId, stage, eventIdx )
		end

		if dialogData.character and dialogData.text then
			table.insert( data, dialogData )
		end

	end

	if not next( data ) then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForQuest()[ERROR]: cannot show dialogs for quest %d stage %d event %d", questId, stage, eventIdx )
		return
	end


	self:ShowDialog( data )

end


--
function UI.HudQuestDialogWnd:ShowDialogForAdventure( atid, stage, eventIdx )

	if type( atid ) ~= "number" then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForAdventure()[ERROR]: invalid type of the 1-st parameter (\"atid\"); \"number\" expected, got \"%s\"", type( atid ) )
		return
	end

	if type( stage ) ~= "number" then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForAdventure()[ERROR]: invalid type of the 2-nd parameter (\"stage\"); \"number\" expected, got \"%s\"", type( stage ) )
		return
	end

	if type( eventIdx ) ~= "number" then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForAdventure()[ERROR]: invalid type of the 3-rd parameter (\"eventIdx\"); \"number\" expected, got \"%s\"", type( eventIdx ) )
		return
	end


	local numDialogs = UI:GetAdventureNumDialogsForEvent( atid, stage, eventIdx )
	if numDialogs == 0 then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForAdventure()[ERROR]: no dialogs found for adventure %d stage %d event %d", atid, stage, eventIdx )
		return
	end

	local data = {}

	for dialogIdx = 1, numDialogs do

		local dialogData = self:MakeEmptyDialogData()

    	local dialogInfo = UI:GetAdventureDialogInfo( atid, stage, eventIdx, dialogIdx )
    	if dialogInfo then

    		if type( dialogInfo.character ) == "string" then
    			dialogData.character = dialogInfo.character
			else
				sys.log( "UI.HudQuestDialogWnd:ShowDialogForAdventure()[ERROR]: invalid type of the find Adventures[%d].stages[%d].info_events[%d].dialogs[%d].character; \"string\" expected, got \"%s\"", atid, stage, eventIdx, dialogIdx, type( dialogInfo.character ) )
			end

    		if type( dialogInfo.text ) == "string" then
    			dialogData.text = dialogInfo.text
			else
				sys.log( "UI.HudQuestDialogWnd:ShowDialogForAdventure()[ERROR]: invalid type of the find Adventures[%d].stages[%d].info_events[%d].dialogs[%d].text; \"string\" expected, got \"%s\"", atid, stage, eventIdx, dialogIdx, type( dialogInfo.text ) )
			end

		else
			sys.log( "UI.HudQuestDialogWnd:ShowDialogForAdventure()[ERROR]: cannot find dialog info for adventure %d stage %d event %d", atid, stage, eventIdx )
		end

		if dialogData.character and dialogData.text then
			table.insert( data, dialogData )
		end

	end

	if not next( data ) then
		sys.log( "UI.HudQuestDialogWnd:ShowDialogForAdventure()[ERROR]: cannot show dialogs for adventure %d stage %d event %d", atid, stage, eventIdx )
		return
	end


	self:ShowDialog( data )

end


--
function UI.HudQuestDialogWnd:ShowScriptedDialog( dialogId, params )

	if type( dialogId ) ~= "number" then
		sys.log( "UI.HudQuestDialogWnd:ShowScriptedDialog()[ERROR]: invalid type of the 1-st parameter (\"dialogId\"); \"number\" expected, got \"%s\"", type( dialogId ) )
		return
	end
	
	local params = self:ValidateScriptedDialogParams( params )
	
	local dialogData = self:MakeEmptyDialogData()
	dialogData.ico				= params.portrait_id
	dialogData.caption			= params.name_text_id
	dialogData.text				= params.text_id
	dialogData.time				= params.time
	dialogData.sound			= params.sound
	dialogData.scriptedDialogId	= dialogId
	
	local data = { dialogData }	-- Каждый скриптовый диалог оформляется как серия из одного диалога
	
	self:ShowDialog( data )

end


--
function UI.HudQuestDialogWnd:HideScriptedDialog( dialogId )

	if type( dialogId ) ~= "number" then
		sys.log( "UI.HudQuestDialogWnd:HideScriptedDialog()[ERROR]: invalid type of the 1-st parameter (\"dialogId\"); \"number\" expected, got \"%s\"", type( dialogId ) )
		return
	end
	
	local bFound = false
	
	-- проверяем отображаемый диалог
	if self.curData then
	
		-- в скриптовых диалогах в серии всегда только один диалог, поэтому достаточно проверить только текущий диалог
		local dialogData = self.curData[ self.dialogIdx ]
		if dialogData then
			if dialogData.scriptedDialogId == dialogId then
				self.timer = 0
				bFound = true
			end
		else
			sys.log( "UI.HudQuestDialogWnd:HideScriptedDialog()[ERROR]: no dialog data" )
		end
		
	end
	
	-- проверяем очередь
	if not bFound then
	
		for queueIdx, queuedData in pairs( self.queue ) do
		
			for dialogIdx, dialogData in pairs( queuedData ) do
			
				if dialogData.scriptedDialogId == dialogId then
					table.remove( self.queue, queueIdx )	-- удаляется вся серия, т.к. в с вкриптовых диалогах в серии только один диалог
					bFound = true
					break
				end
				
			end
			
			if bFound then
				break
			end
			
		end
	end

end


--
function UI.HudQuestDialogWnd:Reset()

	self:ResetDialogSeries()
	self:ResetQueue()

	self.bNeedPlayShowSound = false

end


--
function UI.HudQuestDialogWnd:HasContentToShow()

	return self.curData ~= nil or next( self.queue ) ~= nil

end


-- --------------------------------
-- const
-- --------------------------------

UI.HudQuestDialogWnd.layers =
{
	MAIN_EFFECT	= 0,
	NAME		= 1,
	TEXT		= 2,
}

UI.HudQuestDialogWnd.effectInfo =
{
	main =
	{
		animIdle				= "idle",
		animDialogSeriesShow	= "show",
		animDialogSeriesHide	= "hide",
		animDialogShow			= "show_alpha",
		animDialogHide			= "hide_alpha",
		icoSpriteName			= "ico",
	}
}

UI.HudQuestDialogWnd.SHOW_TIME	= 10

UI.HudQuestDialogWnd.sounds =
{
	showDialogSeries = "sound/ui/hudShowQuest"
}

-- --------------------------------
-- vars
-- --------------------------------

UI.HudQuestDialogWnd.curData				= nil
UI.HudQuestDialogWnd.queue					= {}
UI.HudQuestDialogWnd.dialogIdx				= -1
UI.HudQuestDialogWnd.timer					= -1
UI.HudQuestDialogWnd.mainEffect				= nil
UI.HudQuestDialogWnd.bInPostLoad			= false
UI.HudQuestDialogWnd.bNeedPlayShowSound		= false
UI.HudQuestDialogWnd.bNeedPlayDialogSound	= false
UI.HudQuestDialogWnd.playingDialogSound		= ""

-- --------------------------------
-- work funtions
-- --------------------------------

--
function UI.HudQuestDialogWnd:F_PostLoad()

	self.bInPostLoad = true

	UI.Wnd.F_PostLoad( self )

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

	self.bInPostLoad = false

end


--
function UI.HudQuestDialogWnd:ResetDialogSeries()

	self.curData	= nil
	self.dialogIdx	= -1
	self.timer		= -1

	self:ResetContent()
	self:PlayAnimation( self.effectInfo.main.animIdle )
	
	self:StopDialogSound()
	self.bNeedPlayDialogSound = false

end


--
function UI.HudQuestDialogWnd:ResetContent()

	self.mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.TEXT )

end


--
function UI.HudQuestDialogWnd:ResetQueue()

	self.queue = {}

end


--
function UI.HudQuestDialogWnd:ValidateData( data )

	local emptyDialogData = self:MakeEmptyDialogData()

	local dataFixed = {}

	for dialogIdx, dialogData in ipairs( data ) do

		if type( dialogData ) == "table" then

			local dialogDataFixed = UI:CopyTable2( emptyDialogData )
			
			if dialogData.character ~= nil then

				if type( dialogData.character ) == "string" then
					dialogDataFixed.character = dialogData.character
				else
					sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of \"character\" field for dialog %d; \"string\" or \"nil\" expected, got \"%s\"", dialogIdx, type( dialogData.character ) )
				end
				
			end
			
			if dialogData.ico ~= nil then

				if type( dialogData.ico ) == "string" then
					dialogDataFixed.ico = dialogData.ico
				else
					sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of \"ico\" field for dialog %d; \"string\" or \"nil\" expected, got \"%s\"", dialogIdx, type( dialogData.ico ) )
				end
				
			end
			
			if dialogData.caption ~= nil then

				if type( dialogData.caption ) == "string" then
					dialogDataFixed.caption = dialogData.caption
				else
					sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of \"caption\" field for dialog %d; \"string\" or \"nil\" expected, got \"%s\"", dialogIdx, type( dialogData.caption ) )
				end

			end
			
			if dialogDataFixed.character == "" and dialogDataFixed.ico == "" then
				sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: no ico for dialog %d - 'character' and 'ico' both empty", dialogIdx )
			end
			
			if dialogDataFixed.character == "" and dialogDataFixed.caption == "" then
				sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: no caption for dialog %d - 'character' and 'caption' both empty", dialogIdx )
			end

			if type( dialogData.text ) == "string" then

				if dialogData.text ~= "" then
					dialogDataFixed.text = dialogData.text
				else
					sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: empty \"text\" field for dialog %d", dialogIdx )
				end

			else
				sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of \"text\" field for dialog %d; \"string\" expected, got \"%s\"", dialogIdx, type( dialogData.text ) )
			end
			
			if dialogData.time ~= nil then
			
				if type( dialogData.time ) == "number" then
					dialogDataFixed.time = dialogData.time
				else
					sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of \"time\" field for dialog %d; \"number\" or \"nil\" expected, got \"%s\"", dialogIdx, type( dialogData.time ) )
				end

			end
			
			if dialogData.time ~= nil then
			
				if type( dialogData.time ) == "number" then
					dialogDataFixed.time = dialogData.time
				else
					sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of \"time\" field for dialog %d; \"number\" or \"nil\" expected, got \"%s\"", dialogIdx, type( dialogData.time ) )
				end

			end
			
			if dialogData.sound ~= nil then
			
				if type( dialogData.sound ) == "string" then
					dialogDataFixed.sound = dialogData.sound
				else
					sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of \"sound\" field for dialog %d; \"string\" or \"nil\" expected, got \"%s\"", dialogIdx, type( dialogData.sound ) )
				end

			end
			
			if dialogData.scriptedDialogId ~= nil then
			
				if type( dialogData.scriptedDialogId ) == "number" then
					dialogDataFixed.scriptedDialogId = dialogData.scriptedDialogId
				else
					sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of \"scriptedDialogId\" field for dialog %d; \"number\" or \"nil\" expected, got \"%s\"", dialogIdx, type( dialogData.scriptedDialogId ) )
				end

			end
			
			table.insert( dataFixed, dialogDataFixed )

		else
			sys.log( "UI.HudQuestDialogWnd:ValidateData()[ERROR]: invalid type of dialog info for dialog %d; \"table\" expected, got \"%s\"", dialogIdx, type( dialogData ) )
		end

	end

	return dataFixed

end


--
function UI.HudQuestDialogWnd:ValidateScriptedDialogParams( _params )

	local emptyParams =
	{
		portrait_id		= "",
		name_text_id	= "",
		text_id			= "",
		time			= -1,
		sound			= "",
	}
	
	local params = nil

	if type( _params ) == "table" then
	
		params = UI:CopyTable2( _params )
	
		if type( params.portrait_id ) ~= "string" then
			sys.log( "UI.HudQuestDialogWnd:ValidateScriptedDialogParams()[ERROR]: invalid type of params.portrait_id ; 'string' expected, got '%s'", type( params.portrait_id ) )
			params.portrait_id = emptyParams.portrait_id
		end
		
		if type( params.name_text_id ) ~= "string" then
			sys.log( "UI.HudQuestDialogWnd:ValidateScriptedDialogParams()[ERROR]: invalid type of params.name_text_id ; 'string' expected, got '%s'", type( params.name_text_id ) )
			params.name_text_id = emptyParams.name_text_id
		end
		
		if type( params.text_id ) ~= "string" then
			sys.log( "UI.HudQuestDialogWnd:ValidateScriptedDialogParams()[ERROR]: invalid type of params.text_id ; 'string' expected, got '%s'", type( params.text_id ) )
			params.text_id = emptyParams.text_id
		end
		
		if params.time ~= nil then
			if type( params.time ) ~= "number" then
				sys.log( "UI.HudQuestDialogWnd:ValidateScriptedDialogParams()[ERROR]: invalid type of params.time ; 'number' or 'nil' expected, got '%s'", type( params.time ) )
				params.time = nil
			end
		end
		if params.time == nil then
			params.time = emptyParams.time
		end
		
		if params.sound ~= nil then
			if type( params.sound ) ~= "string" then
				sys.log( "UI.HudQuestDialogWnd:ValidateScriptedDialogParams()[ERROR]: invalid type of params.sound ; 'string' or 'nil' expected, got '%s'", type( params.sound ) )
				params.sound = nil
			end
		end
		if params.sound == nil then
			params.sound = emptyParams.sound
		end
	
	else
	
		sys.log( "UI.HudQuestDialogWnd:ValidateScriptedDialogParams()[ERROR]: invalid type of the 1-st param ('params'); 'table' expected, got '%s'", type( _params ) )
		params = emptyParams
		
	end
	
	return params
	
end


--
function UI.HudQuestDialogWnd:MakeEmptyDialogData()

	local dialogData =
	{
		text				= "",
		character			= "",	-- если прописан character, то ico и caption не надо - иконка и имя возьмутся из персонажа (если прописано и character, и ico/caption, то возьмутся последние)
		ico					= "",
		caption				= "",
		time				= -1,
		sound				= "",
		scriptedDialogId	= -1,
	}
	
	return dialogData

end


--
function UI.HudQuestDialogWnd:StartDialogSeriesAnimated( data )

	self:ResetDialogSeries()

	self.curData = data

	self:StartDialogAnimated( 1, true )

	if self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.showDialogSeries )
		self.bNeedPlayShowSound = false
	else
		self.bNeedPlayShowSound = true
	end

end


--
function UI.HudQuestDialogWnd:StartDialogAnimated( dialogIdx, bStartSeries )

	self.dialogIdx	= dialogIdx
	
	local dialogData = self.curData and self.curData[ dialogIdx ]
	if not dialogData then
		sys.log( "UI.HudQuestDialogWnd:StartDialogAnimated()[ERROR]: no dialog data" )
	end
	
	self.timer = self.SHOW_TIME
	if dialogData and dialogData.time and dialogData.time ~= -1 then
		self.timer = dialogData.time
	end

	self:UpdateContent()

	local anim = bStartSeries and self.effectInfo.main.animDialogSeriesShow or self.effectInfo.main.animDialogShow
	self:PlayAnimation( anim )
	
	self:StopDialogSound()
	self.bNeedPlayDialogSound = false
	
	if dialogData and dialogData.sound and dialogData.sound ~= "" then
		if self:IsOnScreen() then
			self:PlayDialogSound( dialogData.sound )
		else
			self.bNeedPlayDialogSound = true
		end
	end

	return true

end


--
function UI.HudQuestDialogWnd:UpdateContent()

	self:ResetContent()

	if self.dialogIdx == -1 then
		return
	end

	self:UpdateIco()
	self:UpdateName()
	self:UpdateText()

end


--
function UI.HudQuestDialogWnd:UpdateIco()

	local hTex = UI:GetTex( "NoData" )

	local dialogData = self.curData and self.curData[ self.dialogIdx ]
	
	if dialogData then
	
		if dialogData.ico and dialogData.ico ~= "" then
			hTex = UI:GetTex( dialogData.ico )
			
		elseif dialogData.character and dialogData.character ~= "" then
			hTex = UI:GetQuestCharacterIcoMedium( dialogData.character )
		end
		
	else
		sys.log( "UI.HudQuestDialogWnd:UpdateIco()[ERROR]: no dialog data" )
	end

	self.mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.HudQuestDialogWnd:UpdateName()

	local str = "unknown"

	local dialogData = self.curData and self.curData[ self.dialogIdx ]
	
	if dialogData then
	
		if dialogData.caption and dialogData.caption ~= "" then
			str = UI:GetStringByName( dialogData.caption )
		
		elseif dialogData.character and dialogData.character ~= "" then
			str = UI:GetQuestCharacterNameShort( dialogData.character )
		end
		
	else
		sys.log( "UI.HudQuestDialogWnd:UpdateName()[ERROR]: no dialog data" )
	end

	self:SetText( str, self.layers.NAME )

end


-- 
function UI.HudQuestDialogWnd:UpdateText()

	local text	= ""
	local name	= ""

	local dialogData = self.curData and self.curData[ self.dialogIdx ]

	if dialogData then
	
		text = UI:GetStringByName( dialogData.text )
		
		if dialogData.caption and dialogData.caption ~= "" then
			name = UI:GetStringByName( dialogData.caption )
			
		elseif dialogData.character and dialogData.character ~= "" then
			name = UI:GetQuestCharacterNameShort( dialogData.character )
		end
		
	else
		sys.log( "UI.HudQuestDialogWnd:UpdateText()[ERROR]: no dialog data" )
	end

	-- TODO: почему это здесь?!
	UI.Chat:AddQuestMessage( name, text )

	self:SetText( text, self.layers.TEXT )

end


--
function UI.HudQuestDialogWnd:EnqueDialogSeries( data )

	if not self.curData then
		sys.log( "UI.HudQuestDialogWnd:EnqueDialogSeries()[ERROR]: no current dialog series; so no need to enqueue" )
	end

	table.insert( self.queue, data )

end


--
function UI.HudQuestDialogWnd:CheckShowEnqueudDialogSeries()

	if not self.queue[ 1 ] then
		return false
	end

	if self:IsAnimating() then
		return false
	end

	local enquedData = table.remove( self.queue, 1 )
	self:StartDialogSeriesAnimated( enquedData )

	return true

end


--
function UI.HudQuestDialogWnd:CheckShowNextDialog()

	if self.dialogIdx ~= -1 then

		local numDialogs = self.curData and #self.curData or 0

    	if self.dialogIdx < numDialogs then
			self:StartDialogAnimated( self.dialogIdx + 1, false )
    		return true
    	end

	end

	return false

end


--
function UI.HudQuestDialogWnd:StopDialogSeriesAnimated()

	self.timer = -1
	self:PlayAnimation( self.effectInfo.main.animDialogSeriesHide )

end


--
function UI.HudQuestDialogWnd:StopDialogAnimated()

	self.timer = -1
	self:PlayAnimation( self.effectInfo.main.animDialogHide )

end


--
function UI.HudQuestDialogWnd:PlayAnimation( anim )

	if self.mainEffect:GetCurAnimation() ~= anim then
		self.mainEffect:StartAnimation( anim )
	end

end


--
function UI.HudQuestDialogWnd:IsAnimating()

	local curAnim = self.mainEffect:GetCurAnimation()
	return curAnim ~= "" and curAnim ~= self.effectInfo.main.animIdle

end


--
function UI.HudQuestDialogWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.mainEffect then

		local bHiding = animName == self.effectInfo.main.animDialogSeriesHide or animName == self.effectInfo.main.animDialogHide
		if bHiding then

			if not self:CheckShowNextDialog() then
				if not self:CheckShowEnqueudDialogSeries() then
					self:Reset()
					UI.HudWnd:OnQuestDialogHide()
				end
			end

		else
			self:PlayAnimation( self.effectInfo.main.animIdle )
		end

	end

end


--
function UI.HudQuestDialogWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.timer ~= -1 then

		self.timer = self.timer - dt_sys

		if self.timer <= 0 then			
			self.timer = -1
			self:OnDialogTimerExpired( true )
		end		

	end

end


--
function UI.HudQuestDialogWnd:OnDialogTimerExpired( bAnimated )

	local numDialogs = self.curData and #self.curData or 0
	local bEndSeries = self.dialogIdx >= numDialogs

	if bEndSeries then
		self:StopDialogSeriesAnimated()
	else
		self:StopDialogAnimated()
	end

end


--
function UI.HudQuestDialogWnd:F_OnEventSaveUiState()

	local timer = self.timer
	if self.dialogIdx ~= -1 and timer == -1 then
		timer = 0
	end

	UI.store.HudQuestDialogWnd =
	{
		curData			= self.curData,
		queue			= self.queue,
		dialogIdx		= self.dialogIdx,
		timer			= timer,
	}

end


--
function UI.HudQuestDialogWnd:F_OnEventRestoreUiState()

	if UI.store.HudQuestDialogWnd then

		self.curData		= UI.store.HudQuestDialogWnd.curData
		self.queue			= UI.store.HudQuestDialogWnd.queue
		self.dialogIdx		= UI.store.HudQuestDialogWnd.dialogIdx
		self.timer			= UI.store.HudQuestDialogWnd.timer

		if self.dialogIdx ~= -1 then
			self:UpdateContent()
			self:PlayAnimation( self.effectInfo.main.animIdle )
		end

		UI.store.HudQuestDialogWnd = nil

	end

end


--
function UI.HudQuestDialogWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	-- проигрывание звуков, если инициализация диалогов была произведена, когда окно не находилось на экране

	-- звук на старт серии диалогов
	if self.bNeedPlayShowSound then
		UI:PlayGlobalSound( self.sounds.showDialogSeries )
		self.bNeedPlayShowSound = false
	end
	
	-- звук текущего диалога (голос)
	if self.bNeedPlayDialogSound then
		
		local dialogData = self.curData and self.curData[ self.dialogIdx ]
		if dialogData then
		
			if dialogData.sound and dialogData.sound ~= "" then
				self:PlayDialogSound( dialogData.sound )
			else
				sys.log( "UI.HudQuestDialogWnd:F_OnAfterShowOnScreen()[ERROR]: no dialog sound" )
			end
			
		else
			sys.log( "UI.HudQuestDialogWnd:F_OnAfterShowOnScreen()[ERROR]: no dialog data" )
		end
		
		self.bNeedPlayDialogSound = false
	
	end

end


--
function UI.HudQuestDialogWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	
	self:StopDialogSound()

end


--
function UI.HudQuestDialogWnd:PlayDialogSound( sound )

	if not self:IsOnScreen() then
		sys.log( "UI.HudQuestDialogWnd:PlayDialogSound()[ERROR]: not on screen" )
		return
	end

	self:StopDialogSound()
	
	UI:PlayGlobalSound( sound )
	self.playingDialogSound = sound
	
end


--
function UI.HudQuestDialogWnd:StopDialogSound()

	if not UI:IsInShutdown() then
		if self.playingDialogSound ~= "" then
			UI:StopGlobalSound( self.playingDialogSound )
			self.playingDialogSound = ""
		end
	end

end