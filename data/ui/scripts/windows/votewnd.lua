-- ----------------------------------------------------------------------------
--
-- Workfile: votewnd.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -------------------------------------------------------------------
-- UI.Vote_ListWnd
-- -------------------------------------------------------------------

UI.Vote_Wnd = {}


-- --------------------------
-- window definition
-- --------------------------


UI.Vote_Wnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "Vote_Wnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "vote_main",
				defaultAnimation	= "idle",

				-- умышленно не линкуется по size
				{
					objName		= "description",	
					layer		= "UI.VoteList_CheckSlotWnd.layers.TEXT",
					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR,
				},

				{
					objName		= "title",	
					layer		= "UI.VoteList_CheckSlotWnd.layers.CAPTION",
					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT --[[+ UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR]],
				},

				{
					objName		= "btn_x",	
					wnd 		= "UI.VoteWnd_CrossBtn",
					animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
				},


				{
					objName		= "btn_2",	
					wnd			= "UI.VoteWnd_VoteBtn",
					animParams	= UI.EffectAnimParams.POS,
				},

				{
					objName		= "btn_1",	
					wnd			= "UI.VoteWnd_CancelBtn",
					animParams	= UI.EffectAnimParams.POS,
				},
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },

   			text			= "^vote_window_caption"
		},
	},

	children = { "UI.Vote_ListWnd", "UI.VoteWnd_VoteBtn", "UI.VoteWnd_CancelBtn", "UI.VoteWnd_CrossBtn", "UI.VoteWnd_RewardWnd" }
}

-- ------------------------------
-- consts
-- ------------------------------

UI.Vote_Wnd.layers = 
{
	MAIN_EFFECT 			= 0,
	TEXT					= 1,
	CAPTION					= 2,
}

UI.Vote_Wnd.effectInfo =
{
	workList =
	{
		textLocator			= "description",
		maxSizeLocator		= "self",
		minSizeLocator		= "dist_min",
		variantsLocator		= "variants",
		leftButtonPosLocator		= "btn_2",
		rightButtonPosLocator		= "btn_1",
		xButtonPosLocator		= "btn_x",
		titlePosLocator		= "title",
		priceLocator	= "price",
	}
}

-- --------------------------
-- vars
-- --------------------------

UI.Vote_Wnd.metaText			= nil
UI.Vote_Wnd.maxTextHeight		= 0
UI.Vote_Wnd.btnFreeSpace		= 0
UI.Vote_Wnd.variantListSpace	= 0
UI.Vote_Wnd.spaceAvfterVariants = 0
UI.Vote_Wnd.minHeight			= 0
UI.Vote_Wnd.answers				= {}


-- --------------------------
-- interface functions
-- --------------------------

--
function UI.Vote_Wnd:SetData( data, isResults )

	if data == nil then
		data = self.data
		isResults = self.isResults
	end
	self.data = data
	self.isResults = isResults
	if self.data == nil then
		return
	end
	local text = UI:ConvertServerString( data.question )
	local textHeight

	-- сет текст
	if text then
		-- set text
		self.metaText:SetText( text, true )

		-- get height
		local fp = self.metaText:GetFormatParams()
		local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )

		textHeight = _G.MeasureText(
	   		self.metaText:GetFormattedText(),
	   		fp.hFont,
	   		formatRect,
	   		fp.formatFlags,
	   		formatRect ).w

		if textHeight > self.maxTextHeight then
			textHeight = self.maxTextHeight
		end
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local textPos = mainEffect:GetObjPos( self.effectInfo.workList.textLocator )
	if self.isResults then
		UI.Vote_ListWnd:SetMode( UI.Vote_ListWnd.modes.RESULTS )
	else
		if data.multiple == 1 then
			UI.Vote_ListWnd:SetMode( UI.Vote_ListWnd.modes.MULTIPLY_SELECTION )
		else
			UI.Vote_ListWnd:SetMode( UI.Vote_ListWnd.modes.SINGLE_SELECTION )
		end
	end
	UI.Vote_ListWnd:Reset()
	if self.isResults then
		UI.Vote_ListWnd:SetData( data.answers, data.results, data.totalVoted )
	else
		UI.Vote_ListWnd:SetData( data.answers )
	end
	UI.Vote_ListWnd:SetTop( textPos.y + textHeight + self.variantListSpace )
	local selfHeight = UI.Vote_ListWnd:GetHeight() + UI.Vote_ListWnd:GetTop() + self.spaceAvfterVariants
	self:SetHeight( selfHeight )
	mainEffect:SetAnimationTime( ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight ) )
	mainEffect:Update( 0 )
	local leftBtnPos = mainEffect:GetObjPos( self.effectInfo.workList.leftButtonPosLocator )
	local rightBtnPos = mainEffect:GetObjPos( self.effectInfo.workList.rightButtonPosLocator )
	UI.VoteWnd_VoteBtn:SetLeft( leftBtnPos.x )
	UI.VoteWnd_VoteBtn:SetTop( leftBtnPos.y )
	UI.VoteWnd_CancelBtn:SetLeft( rightBtnPos.x )
	UI.VoteWnd_CancelBtn:SetTop( rightBtnPos.y )

	local xBtnPos = mainEffect:GetObjPos( self.effectInfo.workList.xButtonPosLocator )
	UI.VoteWnd_CrossBtn:SetLeft( xBtnPos.x )
	UI.VoteWnd_CrossBtn:SetTop( xBtnPos.y )

	if isResults then
		self:RemoveChild( UI.VoteWnd_VoteBtn )
		self:RemoveChild( UI.VoteWnd_RewardWnd )
	else
		if UI.Vote:HasVote() then
			UI:AddChildAndLink( self, UI.VoteWnd_VoteBtn, mainEffect, "btn_2", UI.EffectAnimParams.POS )
		end

		if data.reward and data.reward > 0 then
    		self:AddChild( UI.VoteWnd_RewardWnd )
    		UI.VoteWnd_RewardWnd:SetReward( data.reward, data.isGoldReward )
    		local pricePos = mainEffect:GetObjPos( self.effectInfo.workList.priceLocator )
    		UI.VoteWnd_RewardWnd:SetLeft( pricePos.x )
    		UI.VoteWnd_RewardWnd:SetTop( pricePos.y )
		else
			self:RemoveChild( UI.VoteWnd_RewardWnd )
		end

	end

	UI.HangarWnd:UpdateVoteWndPosition()

end


--
function UI.Vote_Wnd:GetBaseHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect and mainEffect:GetObjSize( "self" ).y or 0

end


-- --------------------------
-- work functions
-- --------------------------

--
function UI.Vote_Wnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:Update( 0 )

		local maxSize = mainEffect:GetObjSize( self.effectInfo.workList.maxSizeLocator )
		local maxPos = mainEffect:GetObjPos( self.effectInfo.workList.maxSizeLocator )
		local textSize = mainEffect:GetObjSize( self.effectInfo.workList.textLocator )
		local textPos = mainEffect:GetObjPos( self.effectInfo.workList.textLocator )
		local minSize = mainEffect:GetObjSize( self.effectInfo.workList.minSizeLocator )
		local varPos = mainEffect:GetObjPos( self.effectInfo.workList.variantsLocator )
		local varSize = mainEffect:GetObjSize( self.effectInfo.workList.variantsLocator )
		local titlePos = mainEffect:GetObjPos( self.effectInfo.workList.titlePosLocator )
		local titleSize = mainEffect:GetObjSize( self.effectInfo.workList.titlePosLocator )

		self.maxHeight	= maxSize.y
		self.minHeight	= minSize.y
		self.maxTextHeight	= textSize.y
		self.variantListSpace = varPos.y - ( textPos.y + textSize.y )

		self:SetWidth( maxSize.x )
		self:SetHeight( maxSize.y )
		self:SetLeft( maxPos.x )
		self:SetLayerWidth( textSize.x, self.layers.TEXT )
		self:SetLayerLeft( textPos.x, self.layers.TEXT )
		self:SetLayerTop( textPos.y, self.layers.TEXT )

		self:SetLayerWidth( titleSize.x, self.layers.CAPTION )
		self:SetLayerHeight( titleSize.y, self.layers.CAPTION )
		self:SetLayerLeft( titlePos.x, self.layers.CAPTION )
		self:SetLayerTop( titlePos.y, self.layers.CAPTION )

		UI.Vote_ListWnd:SetLeft( varPos.x )

		self.spaceAvfterVariants = maxSize.y - ( varPos.y + varSize.y )
		self:SetText( UI:GetStringByName( "vote_window_caption" ), self.layers.CAPTION )
		UI.VoteWnd_VoteBtn:SetText( UI:GetStringByName( "vote_vote" ), UI.VoteWnd_VoteBtn.layers.TEXT )
		UI.VoteWnd_CancelBtn:SetText( UI:GetStringByName( "close" ), UI.VoteWnd_VoteBtn.layers.TEXT )

	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), 1000000 ), true )

end

--
function UI.Vote_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI.VoteWnd_VoteBtn == wnd then
		if UI.Vote_ListWnd:GetAnswers()[ 1 ] ~= nil then
			UI.Vote:RecieveVote( UI.Vote_ListWnd:GetAnswers() )
			self:RemoveChild( UI.VoteWnd_VoteBtn )
			--self:UnlinkFromParent()
			UI:PlayGlobalSound( UI.sounds.btnClick )
		else
			UI:PlayGlobalSound( "sound/ui/invalid" )
		end
	elseif UI.VoteWnd_CancelBtn == wnd or wnd == UI.VoteWnd_CrossBtn then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self:UnlinkFromParent()
	end

	return true

end

--
function UI.Vote_Wnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end

--
function UI.Vote_Wnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end

--
function UI.Vote_Wnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end

--
function UI.Vote_Wnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

	self:UpdateMetaTextPos()

end

--
function UI.Vote_Wnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end

--
function UI.Vote_Wnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	
	self:UpdateEffects()
	self:UpdateMetaTextPos()
	self:SetData()
end

--
function UI.Vote_Wnd:F_OnAfterHideFromScreen()
	self:OnAfterHideFromScreen()
	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end
end

--
function UI.Vote_Wnd:F_OnEventMouseButtonDown( hSender, btnIdx )
	local firstMsgBox = UI:GetFirstMsgBox()
	if firstMsgBox then
		return
	end
	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	
	local rect = self:GetRect()
	local parent = self:GetParent()
	if parent then
		rect = parent:ToScreen( rect )
	end
	if not UI:IsPtInRect( rect, mouseX, mouseY ) then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )
		if wndUnderMouse ~= UI.Hangar_VoteBtn then
			self:UnlinkFromParent()
		end
	end
end

-- -------------------------------------------------------------------
-- UI.Vote_ListWnd
-- -------------------------------------------------------------------

UI.Vote_ListWnd = {}


-- --------------------------
-- window definition
-- --------------------------


UI.Vote_ListWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "Vote_ListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "vote_variants_list",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ------------------------------
-- consts
-- ------------------------------

UI.Vote_ListWnd.layers = 
{
	MAIN_EFFECT = 0,
}

UI.Vote_ListWnd.effectInfo =
{
	workList =
	{
		firstSlotLocator	= "slot_1",
		secondSlotLocator	= "slot_2",
		maxSizeLocator		= "self",
		minSizeLocator		= "dist_min"
	}
}

UI.Vote_ListWnd.modes = 
{
	MULTIPLY_SELECTION		= 0,
	SINGLE_SELECTION		= 1,
	RESULTS					= 2,
}

-- --------------------------
-- vars
-- --------------------------

UI.Vote_ListWnd.records			= {}
UI.Vote_ListWnd.firstId			= -1
UI.Vote_ListWnd.lastId			= -1
-- checkboxes
UI.Vote_ListWnd.slotWnds		= {}
-- radiobuttons
UI.Vote_ListWnd.slot2Wnds		= {}
-- results
UI.Vote_ListWnd.slot3Wnds		= {}
UI.Vote_ListWnd.slotVisible		= {}
UI.Vote_ListWnd.slotsLeft		= 0
UI.Vote_ListWnd.firstSlotTop	= 0
UI.Vote_ListWnd.space_slots		= 0
UI.Vote_ListWnd.minHeight		= 0
UI.Vote_ListWnd.maxHeight		= 0
UI.Vote_ListWnd.mode			= UI.Vote_ListWnd.modes.MULTIPLY_SELECTION
UI.Vote_ListWnd.answers			= {}

-- --------------------------
-- interface functions
-- --------------------------

--
function UI.Vote_ListWnd:GetAnswers()

	local result = {}
	for i = 1, #self.answers do
		table.insert( result, self.data[ self.answers[ i ] ].recordIdx )
	end
	return result
	
end

--
function UI.Vote_ListWnd:SetData( data, results, totalVoted )

	self.data = UI:CopyTable2( data )
	if self.mode == self.modes.RESULTS then
		self.results = results
		local total = 0
		--self.totalVoted = totalVoted
		for k,v in pairs( results ) do
			total = total + v.l
		end
		self.totalVoted = _G.u64( 0, total )
	end
	self:FullUpdate()

end


--
function UI.Vote_ListWnd:Select( id )

	if self.mode == UI.Vote_ListWnd.modes.MULTIPLY_SELECTION then
		table.insert( self.answers, id )
	else
		self.answers = {}
		table.insert( self.answers, id )
	end
	self:UpdateButtonsState()

end

--
function UI.Vote_ListWnd:IsSelected( id )

	if self.mode == UI.Vote_ListWnd.modes.MULTIPLY_SELECTION then
		for i = 1, #self.answers do
			if self.answers[ i ] == id then
				return true
			end
		end
	else
		if self.answers[ 1 ] == id then
			return true
		end
	end
	return false

end

--
function UI.Vote_ListWnd:SetMode( mode )

	self.mode = mode

end

--
function UI.Vote_ListWnd:GetMode()

	return self.mode

end

--
function UI.Vote_ListWnd:Deselect( id )

	if self.mode == UI.Vote_ListWnd.modes.MULTIPLY_SELECTION then
		for i = 1, #self.answers do
			if self.answers[ i ] == id then
				table.remove(self.answers, i)
				return
			end
		end
	end
	self:UpdateButtonsState()

end

-- --------------------------
-- work functions
-- --------------------------

--
function UI.Vote_ListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:MakeConstParams()
	self:Reset()

end

--
function UI.Vote_ListWnd:UpdateButtonsState()

	for i = 1, #self.slotVisible do
		self.slotVisible[ i ]:Update()
	end

end

--
function UI.Vote_ListWnd:MakeConstParams()

	local slotSize		= UI:ZeroVec2()
	local firstSlotPos	= UI:ZeroVec2()
	local secondSlotPos	= UI:ZeroVec2()

	local tempSlotEffect = _G.UI_SpawnEffect( "vote_checkbox_slot", self:GetUiHandle() )
	if tempSlotEffect then
		slotSize = tempSlotEffect:GetObjSize( "self" )
		_G.UI_DestroyEffect( tempSlotEffect )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local workListRect = mainEffect:GetObjSize( "self" )
	self.minHeight = mainEffect:GetObjSize( self.effectInfo.workList.minSizeLocator ).y
	self.maxHeight = workListRect.y
	self:SetWidth( workListRect.x )

	local workListEffect = mainEffect
	if workListEffect then
		firstSlotPos	= workListEffect:GetObjPos( self.effectInfo.workList.firstSlotLocator )
		secondSlotPos	= workListEffect:GetObjPos( self.effectInfo.workList.secondSlotLocator )
	end

	self.space_slots = secondSlotPos.y - firstSlotPos.y - slotSize.y
	self.slotsLeft = firstSlotPos.x
	self.firstSlotTop = firstSlotPos.y

end

--
function UI.Vote_ListWnd:Reset()

	self:ResetRecords()
	self.slotVisible = {}
	self.answers = {}

end

--
function UI.Vote_ListWnd:ResetRecords()

	for id, record in pairs( self.records ) do
		self:RemoveRecord( id )
	end

	self.records	= {}
	self.firstId	= -1
	self.lastId		= -1

end

--
function UI.Vote_ListWnd:RemoveRecord( id )

	local record = self.records[ id ]
	if not record then
		return
	end

	record.slotWnd:Reset()
	record.slotWnd:UnlinkFromParent()
	self.records[ id ] = nil	

end

--
function UI.Vote_ListWnd:AddRecord( id )

	if self.records[ id ] then
		sys.log( "UI.Vote_ListWnd:AddRecord()[ERROR]: already exists" )
		return self.records[ id ]
	end

	local record = {}

	record.id = id
	record.slotWnd = self:ObtainFreeSlotWnd()

	record.slotWnd:SetLeft( self.slotsLeft )	
	record.slotWnd:Setup( id )

	self.records[ id ] = record

	return record

end

--
function UI.Vote_ListWnd:ObtainFreeSlotWnd()

	if self.mode == self.modes.MULTIPLY_SELECTION then
		for idx, slotWnd in pairs( self.slotWnds ) do
			if slotWnd:GetUid() == -1 then
				return slotWnd
			end
		end

		local slotWnd = UI:CreateChildWnd( self, UI.VoteList_CheckSlotWnd, tostring( #self.slotWnds + 1 ) )
		table.insert( self.slotWnds, slotWnd )

		return slotWnd
	elseif self.mode == self.modes.SINGLE_SELECTION then
		for idx, slotWnd in pairs( self.slot2Wnds ) do
			if slotWnd:GetUid() == -1 then
				return slotWnd
			end
		end

		local slotWnd = UI:CreateChildWnd( self, UI.VoteList_RadioSlotWnd, tostring( #self.slot2Wnds + 1 ) )
		table.insert( self.slot2Wnds, slotWnd )

		return slotWnd

	else
		for idx, slotWnd in pairs( self.slot3Wnds ) do
			if slotWnd:GetUid() == -1 then
				return slotWnd
			end
		end

		local slotWnd = UI:CreateChildWnd( self, UI.VoteList_ResultSlotWnd, tostring( #self.slot3Wnds + 1 ) )
		table.insert( self.slot3Wnds, slotWnd )

		return slotWnd
	end

end

--
function UI.Vote_ListWnd:FullUpdate()

	self:Reset()

	local count = #self.data
	if count == 0 then
		return
	end

	self:UpdateAppearance()

end

--
function UI.Vote_ListWnd:UpdateAppearance()

	local firstId = 1
	local lastId = #self.data
	local top = self.firstSlotTop

	if self.mode ~= self.modes.RESULTS then
		for i = 1, #self.data do
			self.data[ i ] = { text = self.data[ i ], recordIdx = i }
		end
		local counter = #self.data
		while counter > 1 do
			local index = math.random( counter )
			self.data[ index ], self.data[ counter ] = self.data[ counter ], self.data[ index ]
			counter = counter - 1
		end
	end

	for id = firstId, lastId do

		local record = self.records[ id ]

		if not record then
			record = self:AddRecord( id )
			if self.mode == self.modes.RESULTS then
				record.slotWnd:SetData( self.data[ id ], self.results[ tostring( id ) ], self.totalVoted )
			else
				record.slotWnd:SetData( self.data[ id ] )
			end
			record.slotWnd:SetTop( top )
			if not record.slotWnd:IsChildOf( self ) then
				self.slotVisible[ #self.slotVisible + 1 ] = record.slotWnd
				self:AddChild( record.slotWnd )
			end
		end		

		local slotHeight = record.slotWnd:GetHeight()
		slotHeight = slotHeight + self.space_slots
		top = top + slotHeight

	end

	UI:Clamp( top, self.minHeight, self.maxHeight )
	self:SetHeight( top )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetAnimationTime( ( top - self.minHeight ) / ( self.maxHeight - self.minHeight ) )
	mainEffect:Update( 0 )
	self:UpdateButtonsState()

end

--
function UI.Vote_ListWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end

--
function UI.Vote_ListWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end

--
function UI.Vote_ListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end   


--
UI.VoteList_CheckSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

--
UI.VoteList_CheckSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "VoteList_CheckSlotWnd",
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
				defName 			= "vote_checkbox_slot",
				defaultAnimation	= "idle",
				-- умышленно не линкуется по SIZE

				{
					objName		= "value",	
					layer		= "UI.VoteList_CheckSlotWnd.layers.TEXT",
					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR,
				},
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
		},
	}
}

-- ------------------------------
-- consts
-- ------------------------------

--
UI.VoteList_CheckSlotWnd.layers = 
{
	MAIN_EFFECT				= 0,
	TEXT					= 1,
}

--
UI.VoteList_CheckSlotWnd.effectInfo =
{
	main =
	{
		minSizeLocator		= "dist_min",		
		maxSizeLocator		= "self",
		textLocator			= "value",
	},
}

--
UI.VoteList_CheckSlotWnd.sounds =
{
	over	= "sound/ui/btnMouseOver",
}

-- ------------------------------
-- vars
-- ------------------------------

--
UI.VoteList_CheckSlotWnd.metaText 			= nil
UI.VoteList_CheckSlotWnd.maxHeight			= 0
UI.VoteList_CheckSlotWnd.minHeight			= 0
UI.VoteList_CheckSlotWnd.uid				= -1
UI.VoteList_CheckSlotWnd.isMouseOver		= false

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.VoteList_CheckSlotWnd:Setup( uid )

	-- set text
	self.uid = uid

end

--
function UI.VoteList_CheckSlotWnd:Reset()

	-- set text
	self.uid = -1

end

--
function UI.VoteList_CheckSlotWnd:GetUid()

	-- set text
	return self.uid

end

--
function UI.VoteList_CheckSlotWnd:Update()

	if UI.Vote_ListWnd:GetMode() ~= UI.Vote_ListWnd.modes.RESULTS then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if UI.Vote_ListWnd:IsSelected( self.uid ) then
			if self.isMouseOver then
				mainEffect:StartAnimation( "chek_over" )
			else
				mainEffect:StartAnimation( "chek" )
			end
		else
			if self.isMouseOver then
				mainEffect:StartAnimation( "idle_over" )
			else
				mainEffect:StartAnimation( "idle" )
			end
		end
	end

end

--
function UI.VoteList_CheckSlotWnd:SetData( text )

	local text = text.text or text

	if text then
		-- set text
		self.metaText:SetText( text, true )

		-- get height
		local fp = self.metaText:GetFormatParams()
		local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )

		local textHeight = _G.MeasureText(
	   		self.metaText:GetFormattedText(),
	   		fp.hFont,
	   		formatRect,
	   		fp.formatFlags,
	   		formatRect ).w

		if textHeight < self.minHeight then
			textHeight = self.minHeight
		end

		if textHeight > self.maxHeight then
			textHeight = self.maxHeight
		end

		self:SetHeight( textHeight )
	end

end


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.VoteList_CheckSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:Update( 0 )

		local maxSize = mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
		local textSize = mainEffect:GetObjSize( self.effectInfo.main.textLocator )
		local textPos = mainEffect:GetObjPos( self.effectInfo.main.textLocator )
		local minSize = mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )

		self.maxHeight	= maxSize.y
		self.minHeight	= minSize.y

		self:SetWidth( maxSize.x )
		self:SetLayerWidth( textSize.x, self.layers.TEXT )
		self:SetLayerLeft( textPos.x, self.layers.TEXT )
		self:SetLayerTop( textPos.y, self.layers.TEXT )

	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), 1000000 ), true )

end


--
function UI.VoteList_CheckSlotWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end

--
function UI.VoteList_CheckSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end

--
function UI.VoteList_CheckSlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end		

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if UI.Vote_ListWnd:IsSelected( self.uid ) then
		if UI.Vote_ListWnd:GetMode() == UI.Vote_ListWnd.modes.MULTIPLY_SELECTION then
			UI:PlayGlobalSound( "sound/ui/btnClick" )
			mainEffect:StartAnimation( "idle_over" )
		end
		UI.Vote_ListWnd:Deselect( self.uid )
	else
		UI:PlayGlobalSound( "sound/ui/btnClick" )
		UI.Vote_ListWnd:Select( self.uid )
		mainEffect:StartAnimation( "chek_over" )
	end

	return true

end

--
function UI.VoteList_CheckSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if UI.Vote_ListWnd:GetMode() ~= UI.Vote_ListWnd.modes.RESULTS then
		self.isMouseOver = false
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if UI.Vote_ListWnd:IsSelected( self.uid ) then
			mainEffect:StartAnimation( "chek" )
		else
			mainEffect:StartAnimation( "idle" )
		end
	end

	return true

end

--
function UI.VoteList_CheckSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if UI.Vote_ListWnd:GetMode() ~= UI.Vote_ListWnd.modes.RESULTS then
		UI:PlayGlobalSound( self.sounds.over )
		self.isMouseOver = true
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if UI.Vote_ListWnd:IsSelected( self.uid ) then
			mainEffect:StartAnimation( "chek_over" )
		else
			mainEffect:StartAnimation( "idle_over" )
		end
	end

	return true

end

--
function UI.VoteList_CheckSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
		self:UpdateMetaTextPos()
	end

end

--
function UI.VoteList_CheckSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end

--
function UI.VoteList_CheckSlotWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end

--
function UI.VoteList_CheckSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()
	self:UpdateMetaTextPos()

end


--
UI.VoteList_RadioSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

--
UI.VoteList_RadioSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "VoteList_CheckSlotWnd",

	props =
	{
		name		= "VoteList_RadioSlotWnd",

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
				defName 			= "vote_radiobox_slot",
				defaultAnimation	= "idle",
				-- умышленно не линкуется по SIZE

				{
					objName		= "value",	
					layer		= "UI.VoteList_CheckSlotWnd.layers.TEXT",
					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR,
				},
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
		},
	}
}


--
UI.VoteList_ResultSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

--
UI.VoteList_ResultSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "VoteList_CheckSlotWnd",

	props =
	{
		name		= "VoteList_ResultSlotWnd",

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
				defName 			= "vote_result_slot",
				defaultAnimation	= "idle",
				-- умышленно не линкуется по SIZE

				{
					objName		= "description",	
					layer		= "UI.VoteList_ResultSlotWnd.layers.TEXT",
					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR,
				},

				{
					objName		= "progress",	
					layer		= "UI.VoteList_ResultSlotWnd.layers.PROGRESS_EFFECT",
					animParams	= 0,
				},
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_WORDBREAK--[[ + FONT.TF_NOCLIP]],
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
		},

		-- PROGRESS_EFFECT
		--[[{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			--updatable	= false,

			effects =
			{{
				defName 			= "vote_result_slot_progress",
				defaultAnimation	= "idle",
			}}
		},]]
	}
}


UI.VoteList_ResultSlotWnd.layers = 
{
	MAIN_EFFECT				= 0,
	TEXT					= 1,
}



function UI.VoteList_ResultSlotWnd:SetData( text, result, totalVoted )

	local colorEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	--local color = colorEffect:GetObjColor( "color_2" )
	local colorStr = "@ffffdeb4"--UI:Color2Str( color )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if result == nil then
		result = _G.u64( 0, 0 )
	end

	--UI:LocalizeFloat( strFloat )
	local text = text.text or text

	if text then
		local format = UI:GetStringByName( "vote_result_str" )
		local str = string.gsub( format, "%$vote%$", _G.U64ToStr( result ) )
		local percent = result.l / totalVoted.l
		str = string.gsub( str, "%$percent%$", UI:LocalizeFloat( string.format( "%.2f", percent * 100 ) ) )
		-- set text
		local t = text.." "..colorStr..""..str
		self.metaText:SetText( t, true )

		-- get height
		local fp = self.metaText:GetFormatParams()
		local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )

		local textHeight = _G.MeasureText(
	   		self.metaText:GetFormattedText(),
	   		fp.hFont,
	   		formatRect,
	   		fp.formatFlags,
	   		formatRect ).w

		if textHeight < self.minHeight then
			textHeight = self.minHeight
		end

		if textHeight > self.maxHeight then
			textHeight = self.maxHeight
		end

		self.progressWnd:SetTop( textHeight + self.spaceSize )
		self.progressWnd:SetProgress( percent )
		textHeight = textHeight + self.progressSize
		self:SetHeight( textHeight )
	end

end


--
UI.VoteList_ResultSlotWnd.effectInfo =
{
	main =
	{
		maxSizeLocator		= "description",
		textLocator			= "description",
		progressLocator		= "progress",
	},
}

UI.VoteList_ResultSlotWnd.spaceSize = 0
UI.VoteList_ResultSlotWnd.progressSize = 0

--
function UI.VoteList_ResultSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:Update( 0 )

		local maxSize = mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
		local textSize = mainEffect:GetObjSize( self.effectInfo.main.textLocator )
		local textPos = mainEffect:GetObjPos( self.effectInfo.main.textLocator )
		local progressPos = mainEffect:GetObjPos( self.effectInfo.main.progressLocator )
		local progressSize = mainEffect:GetObjSize( self.effectInfo.main.progressLocator )

		self.maxHeight = maxSize.y
		self.spaceSize = progressPos.y - ( textSize.y + textPos.y )
		self.progressSize = progressSize.y
		self.textPos = textPos.y

		self:SetWidth( maxSize.x )
		self:SetLayerWidth( textSize.x, self.layers.TEXT )
		self:SetLayerLeft( textPos.x, self.layers.TEXT )

		self.progressWnd = UI:CreateChildWnd( self, UI.VoteList_ResultSlotProgressWnd, "" )
		self:AddChild( self.progressWnd )
		self.progressWnd:SetLeft( progressPos.x )
		self.progressWnd:SetWidth( progressSize.x )
		self.progressWnd:SetHeight( progressSize.y )

	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), 1000000 ), true )

end


--
UI.VoteList_ResultSlotProgressWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

--
UI.VoteList_ResultSlotProgressWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "VoteList_ResultSlotProgressWnd",

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
			updatable	= false,

			effects =
			{{
				defName 			= "vote_result_slot_progress",
				defaultAnimation	= "idle",
			}}
		},
	}
}


UI.VoteList_ResultSlotProgressWnd.layers = 
{
	MAIN_EFFECT				= 0,
}

--
function UI.VoteList_ResultSlotProgressWnd:SetProgress( value )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetAnimationTime( value )

end


--
function UI.VoteList_ResultSlotProgressWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end

--
function UI.VoteList_ResultSlotProgressWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end

--
function UI.VoteList_ResultSlotProgressWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end

--
UI.VoteWnd_VoteBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "VoteWnd_VoteBtn",
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
					defName				= "shop_buyBtn",
					defaultAnimation    = "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "text",
							layer		= "UI.MsgBox_Btn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
						},
					}
				}}
			},

			-- TEXT
			{
				id			= l_numBaseBtnLayers,

				layerType	= UI.LAYER_TEXT,

				formatFlags	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz = { 1, 1 },
				font =
				{
					fontName = "Small",
				},

				text		= "^vote_vote"
			},
   		}
	},
}

UI.VoteWnd_VoteBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "press",
		animationPressed		= "",
		animationDisabled		= "",
		animationIdle_focus 	= "over",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

UI.VoteWnd_VoteBtn.layers = 
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
}


--
UI.VoteWnd_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "VoteWnd_CancelBtn",
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
					defName				= "shop_buyBtn",
					defaultAnimation    = "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "text",
							layer		= "UI.MsgBox_Btn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
						},
					}
				}}
			},

			-- TEXT
			{
				id			= l_numBaseBtnLayers,

				layerType	= UI.LAYER_TEXT,

				formatFlags	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz = { 1, 1 },
				font =
				{
					fontName = "Small",
				},
			},
   		}
	},
}

UI.VoteWnd_CancelBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "press",
		animationPressed		= "",
		animationDisabled		= "",
		animationIdle_focus 	= "over",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}


-- ------------------------------------------------------------------------
-- UI.VoteWnd_CrossBtn
-- ------------------------------------------------------------------------

UI.VoteWnd_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "VoteWnd"
		}
	}
}


--
UI.VoteWnd_RewardWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name		= "VoteWnd_RewardWnd",
		},

   		layers =
   		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 			= "shop_items_slot_price",

					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "gold_icon",	
							layer		= "UI.VoteWnd_RewardWnd.layers.PRICE_ICO_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},

						{
							objName		= "price",	
							layer		= "UI.VoteWnd_RewardWnd.layers.PRICE_VAL",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},

			-- PRICE_ICO_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName 	= "shop_items_slot_priceIco",
				}}
			},

			-- PRICE_VAL
			{
				layerType		= UI.LAYER_TEXT,


	   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },

			},
		}
	}
}

UI.VoteWnd_RewardWnd.layers = 
{
	MAIN_EFFECT				= 0,
	PRICE_ICO_EFFECT		= 1,
	PRICE_VAL				= 2,
}


--
function UI.VoteWnd_RewardWnd:SetReward( reward, isGold )

	if isGold == 1 then
		UI:GetEffectFromLayer( self, self.layers.PRICE_ICO_EFFECT ):StartAnimation( "gold" )
	else
		UI:GetEffectFromLayer( self, self.layers.PRICE_ICO_EFFECT ):StartAnimation( "money" )
	end

	local rewardStr = UI:GetStringByName( "vote_reward_text" )
	self:SetText( rewardStr.." "..UI:Num2StrSeparatedBy3( reward ), self.layers.PRICE_VAL )

end

--
function UI.VoteWnd_RewardWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end

--
function UI.VoteWnd_RewardWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end

--
function UI.VoteWnd_RewardWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end  