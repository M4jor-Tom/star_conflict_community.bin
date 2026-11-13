-- ---------------------------------------------------------------
-- UI.SquadFinder_CreateMyGroupWnd
-- ---------------------------------------------------------------

UI.SquadFinder_CreateMyGroupWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.SquadFinder_CreateMyGroupWnd.layers =
{
    MAIN_EFFECT		= 0,
    CAPTION			= 1,
	ACTIVITY_LABEL	= 2,
	DESC_LABEL		= 3,
	RANK_LABEL		= 4,
	INFO			= 5,
    WAIT_EFFECT		= 6,
    WAIT_TEXT		= 7,
}


--
UI.SquadFinder_CreateMyGroupWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "SquadFinder_CreateMyGroupWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		activationOrder	= 0,
	},

	layers =
	{
		firstOverlayLayer = UI.SquadFinder_CreateMyGroupWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "squadFinder_createMyGroup",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",	
						layer		= "UI.SquadFinder_CreateMyGroupWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_1",	
						layer		= "UI.SquadFinder_CreateMyGroupWnd.layers.ACTIVITY_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_2",	
						layer		= "UI.SquadFinder_CreateMyGroupWnd.layers.DESC_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_3",	
						layer		= "UI.SquadFinder_CreateMyGroupWnd.layers.RANK_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "load",	
						layer		= "UI.SquadFinder_CreateMyGroupWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.SquadFinder_CreateMyGroup_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "drop_down1",	
						wnd			= "UI.SquadFinder_CreateMyGroup_ActivitiesCB",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "self95",	
						wnd			= "UI.SquadFinder_CreateMyGroup_DescEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "drop_down2",	
						wnd			= "UI.SquadFinder_CreateMyGroup_RanksCB",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_8",	
						wnd			= "UI.SquadFinder_CreateMyGroup_ActionBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "note",	
						layer		= "UI.SquadFinder_CreateMyGroupWnd.layers.INFO",
						animParams	= UI.EffectAnimParams.ALL,
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
		},		

		-- ACTIVITY_LABEL 
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "squadFinder_createMyGroup_activityLabel" ),
		},

		-- DESC_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "squadFinder_createMyGroup_descLabel" ),
		},

		-- RANK_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "squadFinder_createMyGroup_rankLabel" ),
		},

		-- INFO
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "squadFinder_createMyGroup_info" ),
		},

		-- WAIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.SquadFinder_CreateMyGroupWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hangar_loading" ),
		},
	},

	children =
	{
		"UI.SquadFinder_CreateMyGroup_CrossBtn",
		"UI.SquadFinder_CreateMyGroup_ActivitiesCB",
		"UI.SquadFinder_CreateMyGroup_DescEditWnd",
		"UI.SquadFinder_CreateMyGroup_RanksCB",
		"UI.SquadFinder_CreateMyGroup_ActionBtn",
	}
}

-- ----------------------------
-- interface funcitons
-- ----------------------------

--
function UI.SquadFinder_CreateMyGroupWnd:Setup( bEditMode )

	if type( bEditMode ) ~= "boolean" then
		sys.log( "UI.SquadFinder_CreateMyGroupWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"bEditMode\"); \"boolean\" expected, got \"%s\"", type( bEditMode ) )
		return
	end

	self:Reset()

	self.bEditMode = bEditMode

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.SquadFinder_CreateMyGroupWnd:SquadFinder_OnWaitingChanged()

	if not self:IsOnScreen() then	
		return
	end

	self:UpdateWaiting()

end


--
function UI.SquadFinder_CreateMyGroupWnd:SquadFinder_OnMyGroupCreate()

	if not self:IsOnScreen() then	
		return
	end

	if self.bEditMode then
		sys.log( "UI.SquadFinder_CreateMyGroupWnd:SquadFinder_OnMyGroupCreate()[ERROR]: unexpected" )
	end

	UI.HangarWnd:HideSquadFinderCreateMyGroupWnd( false )
	UI.HangarWnd:ShowSquadFinderMyGroupWnd( true )

end


--
function UI.SquadFinder_CreateMyGroupWnd:SquadFinder_OnMyGroupEdit()

	if not self:IsOnScreen() then	
		return
	end

	if not self.bEditMode then
		sys.log( "UI.SquadFinder_CreateMyGroupWnd:SquadFinder_OnMyGroupEdit()[ERROR]: unexpected" )
	end

	UI.HangarWnd:HideSquadFinderCreateMyGroupWnd( false )
	UI.HangarWnd:ShowSquadFinderMyGroupWnd( true )

end


--
function UI.SquadFinder_CreateMyGroupWnd:OnEditMissMouse( editWnd )

	if editWnd:GetUiHandle() == UI:GetKeyboardFocus() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
		UI:ValidateKeyboardFocus()
	end

end


-- ----------------------------
-- vars
-- ----------------------------

UI.SquadFinder_CreateMyGroupWnd.bEditMode		= false
UI.SquadFinder_CreateMyGroupWnd.crossBtn		= nil
UI.SquadFinder_CreateMyGroupWnd.activitiesCB	= nil
UI.SquadFinder_CreateMyGroupWnd.ranksCB			= nil
UI.SquadFinder_CreateMyGroupWnd.descEditWnd		= nil
UI.SquadFinder_CreateMyGroupWnd.actionBtn		= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.SquadFinder_CreateMyGroupWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

    self.crossBtn		= UI.SquadFinder_CreateMyGroup_CrossBtn
    self.activitiesCB	= UI.SquadFinder_CreateMyGroup_ActivitiesCB
    self.ranksCB		= UI.SquadFinder_CreateMyGroup_RanksCB
    self.descEditWnd	= UI.SquadFinder_CreateMyGroup_DescEditWnd
    self.actionBtn		= UI.SquadFinder_CreateMyGroup_ActionBtn

end


--
function UI.SquadFinder_CreateMyGroupWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:InitActivities()
	self:InitRanks()

	self:FullUpdate()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.SquadFinder_CreateMyGroupWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.SquadFinder_CreateMyGroupWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	-- если клик на элемент, не приндлежащий к данному окну, то скрыть
	-- исключение: если показывается перекрывающее окно (месседжбокс и т.п.) - тогда вообще не реагировать

	if UI:GetFirstOverlayWnd() then
		return
	end

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()
	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )

	if wndUnderMouse and wndUnderMouse ~= self and not wndUnderMouse:IsChildOf( self ) and not self.activitiesCB:IsUnderMouse() and not self.ranksCB:IsUnderMouse() and wndUnderMouse ~= UI.Hangar_SquadBtn then
		UI.HangarWnd:HideSquadFinderCreateMyGroupWnd( false )
	end

end


--
function UI.SquadFinder_CreateMyGroupWnd:Reset()

	self.bEditMode = false

    self.activitiesCB:SelectRecord( -1 )
	self.activitiesCB:Enable( false )

    self.ranksCB:SelectRecord( -1 )
	self.ranksCB:Enable( false )

	self:SetText( "", self.layers.CAPTION )
    self.descEditWnd:SetEditText( "" )
    self.actionBtn:SetBtnText( "" )

end


--
function UI.SquadFinder_CreateMyGroupWnd:FullUpdate()

	self:UpdateCaption()
	self:UpdateActionBtn()
	self:UpdateActivitiesState()
	self:UpdateRanksState()

	self:SetDefaultActivity()
	self:SetDefaultDesc()
	self:SetDefaultRank()

	self:UpdateWaiting()
	
end


--
function UI.SquadFinder_CreateMyGroupWnd:UpdateCaption()

	local str = self.bEditMode and UI:GetStringByName( "squadFinder_createMyGroup_caption_edit" ) or UI:GetStringByName( "squadFinder_createMyGroup_caption_create" )
	self:SetText( str, self.layers.CAPTION )	

end


--
function UI.SquadFinder_CreateMyGroupWnd:InitActivities()

	if self.activitiesCB:GetNumRecords() > 0 then
		return
	end

	if type( _G.SquadSearchAct ) == "table" then

		local activityTypes = {}

		for name, activityType in pairs( _G.SquadSearchAct ) do

			if type( activityType ) == "number" then

				if activityType ~= UI.SquadFinder.ACTIVITY_TYPE_ALL and activityType ~= -1 then
					table.insert( activityTypes, activityType )
				else
					sys.log( "UI.SquadFinder_CreateMyGroupWnd:InitActivities()[ERROR]: invalid activity %d in _G.SquadSearchAct.%s", UI.SquadFinder.ACTIVITY_TYPE_ALL, name )
				end			

			else
				sys.log( "UI.SquadFinder_CreateMyGroupWnd:InitActivities()[ERROR]: invalid type of _G.SquadSearchAct.%s; \"number\" expected, got \"%s\"", name, type( activityType ) )				
			end

		end

		table.sort( activityTypes )

		for idx, activityType in ipairs( activityTypes ) do

			local data =
			{
				activityType	= activityType,
				text			= UI:SquadFinderActivityType2Str( activityType ),
			}

			self.activitiesCB:AddRecord( data )

		end

	else
		sys.log( "UI.SquadFinder_CreateMyGroupWnd:InitActivities()[ERROR]: invalid type of _G.SquadSearchAct; \"table\" expected, got \"%s\"", type( _G.SquadSearchAct ) )
	end

end


--
function UI.SquadFinder_CreateMyGroupWnd:UpdateActivitiesState()

	local bEnable = not self:IsWaiting() and not self.bEditMode
	self.activitiesCB:Enable( bEnable )

end


--
function UI.SquadFinder_CreateMyGroupWnd:SetDefaultActivity()

	if self.bEditMode then

		local selActivity = -1

		local myGroupInfo = UI.SquadFinder:GetMyGroupInfo()
		if myGroupInfo then
			selActivity = myGroupInfo.activityType
		else
			sys.log( "UI.SquadFinder_CreateMyGroupWnd:SetDefaultActivity(): no my group" )
		end

		self:SelectActivity( selActivity )

	else
		self.activitiesCB:SelectRecord( 1 )
	end	

end


--
function UI.SquadFinder_CreateMyGroupWnd:SelectActivity( activityType )

	local selRecordIdx = -1

	if activityType ~= -1 then

    	for recordIdx = 1, self.activitiesCB:GetNumRecords() do

    		local data = self.activitiesCB:GetRecordData( recordIdx )
    		if data.activityType == activityType then

    			selRecordIdx = recordIdx
    			break

    		end

    	end

	end

	self.activitiesCB:SelectRecord( selRecordIdx )

end


--
function UI.SquadFinder_CreateMyGroupWnd:GetSelActivity()

	local activityType = -1

	local selRecordIdx = self.activitiesCB:GetSelectedRecord()
	if selRecordIdx ~= -1 then
		activityType = self.activitiesCB:GetRecordData( selRecordIdx ).activityType
	end

	return activityType	

end


--
function UI.SquadFinder_CreateMyGroupWnd:SetDefaultDesc()

	local str = ""

	if self.bEditMode then

		local myGroupInfo = UI.SquadFinder:GetMyGroupInfo()
		if myGroupInfo then
			str = myGroupInfo.message
		else
			sys.log( "UI.SquadFinder_CreateMyGroupWnd:SetDefaultDesc(): no my group" )
		end

	end

	self.descEditWnd:SetEditText( str )

end


--
function UI.SquadFinder_CreateMyGroupWnd:InitRanks()

	if self.ranksCB:GetNumRecords() > 0 then
		return
	end

	local dataAllRanks = {}
	dataAllRanks.rank = UI.SquadFinder.RANK_All
	dataAllRanks.text = UI:GetStringByName( "squadFinder_createMyGroup_allRanks" )
	self.ranksCB:AddRecord( dataAllRanks )

	for rank = 1, UI:GetMaxRank() do

		local data = {}
		data.rank = rank
		data.text = tostring( rank )
		self.ranksCB:AddRecord( data )

	end

end


--
function UI.SquadFinder_CreateMyGroupWnd:SetDefaultRank()

	local rank = UI.SquadFinder.RANK_All

	if self.bEditMode then

		local myGroupInfo = UI.SquadFinder:GetMyGroupInfo()
		if myGroupInfo then
			rank = myGroupInfo.minRank
		else
			sys.log( "UI.SquadFinder_CreateMyGroupWnd:SetDefaultRank(): no my group" )
		end

	end

	self:SelectRank( rank )

end


--
function UI.SquadFinder_CreateMyGroupWnd:UpdateRanksState()

	local bEnable = not self:IsWaiting() and not self.bEditMode
	self.ranksCB:Enable( bEnable )

end


--
function UI.SquadFinder_CreateMyGroupWnd:UpdateActionBtn()

	local text = self.bEditMode and UI:GetStringByName( "squadFinder_createMyGroup_editBtn" ) or UI:GetStringByName( "squadFinder_createMyGroup_createBtn" )
	self.actionBtn:SetBtnText( text )	

end


--
function UI.SquadFinder_CreateMyGroupWnd:SelectRank( rank )

	local selRecordIdx = -1

	if rank ~= -1 then

    	for recordIdx = 1, self.ranksCB:GetNumRecords() do

    		local data = self.ranksCB:GetRecordData( recordIdx )
    		if data.rank == rank then

    			selRecordIdx = recordIdx
    			break

    		end

    	end

	end

	self.ranksCB:SelectRecord( selRecordIdx )

end


--
function UI.SquadFinder_CreateMyGroupWnd:GetSelRank()

	local rank = -1

	local selRecordIdx = self.ranksCB:GetSelectedRecord()
	if selRecordIdx ~= -1 then
		rank = self.ranksCB:GetRecordData( selRecordIdx ).rank
	end

	return rank

end


--
function UI.SquadFinder_CreateMyGroupWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.crossBtn then
		UI.HangarWnd:HideSquadFinderCreateMyGroupWnd( true )

	elseif wnd == self.actionBtn then

		if self.bEditMode then
			self:EditMyGroup()
		else
			self:CreateMyGroup()
		end
		
	end

	return true

end


--
function UI.SquadFinder_CreateMyGroupWnd:IsWaiting()

	return UI.SquadFinder:IsWaiting()

end


--
function UI.SquadFinder_CreateMyGroupWnd:SetWaitingEffectVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.WAIT_TEXT )	

end


--
function UI.SquadFinder_CreateMyGroupWnd:UpdateWaiting()

	self:SetWaitingEffectVisible( self:IsWaiting() )

	self:UpdateActivitiesState()
	self:UpdateRanksState()

end


--
function UI.SquadFinder_CreateMyGroupWnd:CreateMyGroup()

	local groupParams = {}

	groupParams.minRank			= self:GetSelRank()
	groupParams.activityType	= self:GetSelActivity()
	groupParams.message			= self.descEditWnd:GetEditText()

	UI.SquadFinder:CreateMyGroup( groupParams )

end


--
function UI.SquadFinder_CreateMyGroupWnd:EditMyGroup()

	UI.SquadFinder:EditMyGroup( self.descEditWnd:GetEditText() )

end


-- ---------------------------------------------------------------
-- UI.SquadFinder_CreateMyGroup_ActivitiesCB
-- ---------------------------------------------------------------

UI.SquadFinder_CreateMyGroup_ActivitiesCB =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "SquadFinder_CreateMyGroup_ActivitiesCB"
		},
	},

	MAX_VISIBLE_RECORDS = 5
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_CreateMyGroup_RanksCB
-- ---------------------------------------------------------------

UI.SquadFinder_CreateMyGroup_RanksCB =
{
	def =
	{
    	className 	= "Wnd",
    	prototype	= "ComboBox1",

    	props =
    	{
    		name = "SquadFinder_CreateMyGroup_RanksCB"
    	}
	},

	MAX_VISIBLE_RECORDS = 5
}

-- ------------------------------------------------------------------------
-- UI.SquadFinder_CreateMyGroup_DescEditWnd
-- ------------------------------------------------------------------------

UI.SquadFinder_CreateMyGroup_DescEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditMultilineWnd",

     	props =
     	{
     		name			= "SquadFinder_CreateMyGroup_DescEditWnd",
    		symbolsLimit	= 128,
			bytesLimit		= 512+1,
	     	activationOrder	= 1,
    	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "squadFinder_createMyGroup_descEditWnd",
    				defaultAnimation    = "idle",

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
    },

    effectInfo =
    {
    	main =
    	{
    		textObjName				= "title_2",
    		selectionColorObjName	= "color_select",
    		cursorColorObjName		= "color_cursor",
    		animActive				= "idle",
    		animInactive			= "idle",
			scrollBarLocator		= "scroll",
    	}
    }
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_CreateMyGroup_CrossBtn
-- ---------------------------------------------------------------

UI.SquadFinder_CreateMyGroup_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "SquadFinder_CreateMyGroup_CrossBtn"
    	}
	}
}

-- ---------------------------------------------------------------
-- UI.SquadFinder_CreateMyGroup_ActionBtn
-- ---------------------------------------------------------------

UI.SquadFinder_CreateMyGroup_ActionBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3",

		props =
		{
			name	= "SquadFinder_CreateMyGroup_ActionBtn",
		}
	},	
}