-- ----------------------------------------------------------------------------
--
-- Workfile: hudefficiencywnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- ----------------------------------------------------------------------------
-- UI.HudEfficiencyWnd
-- ----------------------------------------------------------------------------

UI.HudEfficiencyWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudEfficiencyWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudEfficiencyWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "hud_efficiency",
				defaultAnimation	= "idle",
			}}
		},   
	},

	children = { "UI.HudEfficiencyDockedWnd", "UI.HudEfficiencyFlyingWnd" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudEfficiencyWnd:OnPlayerBattleReward( playerIdx, reward, rewardReason, value, killedPlayerIdx, worldPos )

	if not self:IsOnScreen() then
		return
	end

	if type( playerIdx ) ~= "number" then
		sys.log( "UI.HudEfficiencyWnd:OnPlayerBattleReward()[ERROR]: invalid type of the 1-st param (\"playerIdx\"); \"number\" expected, got \"%s\"", type( playerIdx ) )
		return
	end

	if playerIdx ~= UI.HudWnd.localPlayerId then  
		return
	end

	if UI:Val2Key( ai.Reward, reward ) == "" then
		sys.log( "UI.HudEfficiencyWnd:OnPlayerBattleReward()[ERROR]: invalid 2-nd param (\"reward\"); one  of the \"ai.Reward\" values expected, got \"%s\"", tostring( reward ) )
		return
	end

	if reward ~= ai.Reward.EXP then
		return
	end

	if UI:Val2Key( ai.RewardReason, rewardReason ) == "" then
		sys.log( "UI.HudEfficiencyWnd:OnPlayerBattleReward()[ERROR]: invalid 3-rd param (\"rewardReason\"); one  of the \"ai.RewardReason\" values expected, got \"%s\"", tostring( rewardReason ) )
		return
	end

	if type( value ) ~= "number" then
		sys.log( "UI.HudEfficiencyWnd:OnPlayerBattleReward()[ERROR]: invalid type of the 4-th param (\"value\"); \"number\" expected, got \"%s\"", type( value ) )
		return
	end

	if worldPos ~= nil then
		if type( worldPos ) ~= "userdata" then
			sys.log( "UI.HudEfficiencyWnd:OnPlayerBattleReward()[ERROR]: invalid type of the 6-th param (\"worldPos\"); \"nil\" or \"userdata\" expected, got \"%s\"", type( worldPos ) )
			worldPos = nil
		end
	end

	local rewardData =
	{
		rewardReason	= rewardReason,
		bExpForDamage	= rewardReason == ai.RewardReason.DAMAGE or rewardReason == ai.RewardReason.TURRET_DAMAGE or rewardReason == ai.RewardReason.HEAL or rewardReason == ai.RewardReason.TURRET_HEAL,
		value			= value,
		worldPos		= worldPos,
	}

	self.flyingWnd:OnPlayerBattleReward( rewardData )

end


--
function UI.HudEfficiencyWnd:Reset()

	self.flyingWnd:Reset()
	self.dockedWnd:Reset()

end


--
function UI.HudEfficiencyWnd:GetDockingPos( rewardData )

	local dockingPos = self.dockedWnd:GetDockingPos( rewardData )

	dockingPos.x = dockingPos.x + self.dockedWnd:GetLeft()
	dockingPos.y = dockingPos.y + self.dockedWnd:GetTop()

	return dockingPos

end


--
function UI.HudEfficiencyWnd:Reward2Text( rewardData )

	local rewardReason = rewardData.bExpForDamage and ai.RewardReason.DAMAGE or rewardData.rewardReason
	local strRewardReason = UI:RewardReason2Str( rewardReason, true )
	return string.format( "%s %s", strRewardReason, UI:Num2StrSeparatedBy3( rewardData.value ) )

end


--
function UI.HudEfficiencyWnd:DockRecord( rewardData )

	self.dockedWnd:AddRecord( rewardData )

end


--
function UI.HudEfficiencyWnd:SetDockedWndPos( pos )

	self.dockedWnd:SetPos( pos.x, pos.y )
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.HudEfficiencyWnd.layers =
{
	MAIN_EFFECT	= 0,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudEfficiencyWnd.flyingWnd	= nil
UI.HudEfficiencyWnd.dockedWnd	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudEfficiencyWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.flyingWnd	= UI.HudEfficiencyFlyingWnd
	self.dockedWnd	= UI.HudEfficiencyDockedWnd

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )

end


--
function UI.HudEfficiencyWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	-- резет нельзя вызывать в F_OnAfterShowOnScreen(). т.к. при любом переключении модов все элементы сначала отлинковываются;
	-- даже если в новом моде элемент по прежнему нужен

	if not self:IsOnScreen() then
		self:Reset()
	end

end


-- ----------------------------------------------------------------------------
-- UI.HudEfficiencyDockedWnd
-- ----------------------------------------------------------------------------

UI.HudEfficiencyDockedWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudEfficiencyDockedWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudEfficiencyDockedWnd",
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
				defName 			= "hud_efficiencyDocked_main",
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
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudEfficiencyDockedWnd:Reset()

	self:ResetRecords()
	self.queue = {}

end


--
function UI.HudEfficiencyDockedWnd:AddRecord( rewardData )

	if self:CanAddRecordNow( false ) then
		self:AddRecordInternal( rewardData )
	else
		self:EnqueueRecord( rewardData )
	end

end


--
function UI.HudEfficiencyDockedWnd:CanAddRecordNow( bIgnoreQueue )

	if not bIgnoreQueue then
    	if self.queue[ 1 ] then
    		return false
    	end
	end
	
	if self.animTime ~= -1 then
		return false
	end

	if self.numRecords > 0 and self.records[ self.numRecords ].time < self.MIN_SHOW_TIME then
		return false
	end

	return true	

end


--
function UI.HudEfficiencyDockedWnd:GetDockingPos( rewardData )

	local dockingPos = UI:ZeroVec2()

	local slotWnd = self.allSlotWnds[ 1 ]
	if not slotWnd then
		return dockingPos
	end

	local text = UI.HudEfficiencyWnd:Reward2Text( rewardData )
	local textRect = slotWnd:MeasureTextRect( text )

	local dockingPos = UI:Vec2( textRect.x + textRect.z * 0.5, textRect.y + textRect.w * 0.5 )

	dockingPos.x = dockingPos.x + self.firstSlotPos.x
	dockingPos.y = dockingPos.y + self.firstSlotPos.y

	return dockingPos

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudEfficiencyDockedWnd.layers =
{
	MAIN_EFFECT		= 0
}

UI.HudEfficiencyDockedWnd.MAX_RECORDS	= 5	-- при анимации реально может быть на 1 больше

UI.HudEfficiencyDockedWnd.MIN_SHOW_TIME	= 1
UI.HudEfficiencyDockedWnd.MAX_SHOW_TIME	= 4
UI.HudEfficiencyDockedWnd.ANIM_TIME		= 0.1

UI.HudEfficiencyDockedWnd.effectInfo =
{
	main =
	{
		firstSlotLocator	= "line_1",
		secondSlotLocator	= "line_2",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudEfficiencyDockedWnd.records		= {}
UI.HudEfficiencyDockedWnd.queue			= {}
UI.HudEfficiencyDockedWnd.allSlotWnds	= {}
UI.HudEfficiencyDockedWnd.numRecords	= 0
UI.HudEfficiencyDockedWnd.animTime		= -1
UI.HudEfficiencyDockedWnd.dist_slots	= 0
UI.HudEfficiencyDockedWnd.firstSlotPos	= Vec2( 0, 0 )
UI.HudEfficiencyDockedWnd.zeroAlphaY	= 0
UI.HudEfficiencyDockedWnd.fullAlphaY	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudEfficiencyDockedWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local firstSlotLocatorPos	= mainEffect:GetObjPos( self.effectInfo.main.firstSlotLocator )
		local secondSlotLocatorPos	= mainEffect:GetObjPos( self.effectInfo.main.secondSlotLocator )

		self.firstSlotPos = firstSlotLocatorPos
		self.dist_slots = secondSlotLocatorPos.y - firstSlotLocatorPos.y

		self.zeroAlphaY = self.firstSlotPos.y + self.dist_slots * self.MAX_RECORDS
		self.fullAlphaY = self.firstSlotPos.y + self.dist_slots * ( self.MAX_RECORDS - 1 )

	end

	self:InitSlots()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )

end


--
function UI.HudEfficiencyDockedWnd:InitSlots()

	for i = 1, self.MAX_RECORDS + 1 do	-- +1 - для обеспечения анимации
		self:CreateSlotWnd()
	end

end


--
function UI.HudEfficiencyDockedWnd:ResetRecords()

	while self.numRecords > 0 do
		self:RemoveRecord( self.numRecords )
	end

end


--
function UI.HudEfficiencyDockedWnd:RemoveRecord( recordIdx )

	local record = self.records[ recordIdx ]
	if not record then
		return
	end

	if record.slotWnd then
		record.slotWnd:Reset()
		record.slotWnd:UnlinkFromParent()
	end

	table.remove( self.records, recordIdx )
	self.numRecords = self.numRecords - 1

end


--
function UI.HudEfficiencyDockedWnd:AddRecordInternal( rewardData )

	local record = {}

	record.rewardData	= rewardData
	record.time			= 0
	record.dstY			= 0

	local slotWnd = self:ObtainFreeSlotWnd()
	record.slotWnd = slotWnd

	self:AddChild( slotWnd )
	slotWnd:Init( record.rewardData )
	self:SetRecordPos( record, self.firstSlotPos.y )

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	if self.numRecords > 1 then
		self:StartMoveAnimation()
	end

end


--
function UI.HudEfficiencyDockedWnd:EnqueueRecord( rewardData )

	local bStacked = false

	if next( self.queue ) then
		
		local lastQueuedData = self.queue[ #self.queue ]

		if lastQueuedData.rewardReason == rewardData.rewardReason then

			lastQueuedData.value = lastQueuedData.value + rewardData.value
			bStacked = true

		end	

	end

	if not bStacked then
		table.insert( self.queue, rewardData )
	end

end


--
function UI.HudEfficiencyDockedWnd:ObtainFreeSlotWnd()

	for idx, slotWnd in ipairs( self.allSlotWnds ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	return self:CreateSlotWnd()	

end


--
function UI.HudEfficiencyDockedWnd:CreateSlotWnd()

	local slotWnd = UI:CreateChildWnd( self, UI.HudEfficiencyDocked_SlotWnd, tostring( #self.allSlotWnds + 1 ) )
	slotWnd:SetLeft( self.firstSlotPos.x )

	table.insert( self.allSlotWnds, slotWnd )

	return slotWnd

end


--
function UI.HudEfficiencyDockedWnd:StartMoveAnimation()

	if self.animTime ~= -1 then
		sys.log( "UI.HudEfficiencyDockedWnd:StartMoveAnimation()[ERROR]: already animating" )
		return
	end

	if self.numRecords < 2 then
		sys.log( "UI.HudEfficiencyDockedWnd:StartMoveAnimation()[ERROR]: < 2 records" )
	end

	self.animTime = 0

	for recordIdx = 1, self.numRecords - 1 do
		local record = self.records[ recordIdx ]
		local y = self:GetRecordPos( record )
		record.dstY = y + self.dist_slots		
	end 	

end


--
function UI.HudEfficiencyDockedWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateRecordsShowTime( dt_sys )
	self:UpdateMoveAnimation( dt_sys )
	self:RemoveExpiredRecords()
	self:CheckQueue()

end


--
function UI.HudEfficiencyDockedWnd:UpdateMoveAnimation( dt )

	if self.animTime == -1 then
		return
	end

	local speed = self.dist_slots / self.ANIM_TIME

	for recordIdx = 1, self.numRecords - 1 do

		local record = self.records[ recordIdx ]

		local y = self:GetRecordPos( record )
		y = y + speed * dt

		if y >= record.dstY then
			y = record.dstY
		end

		self:SetRecordPos( record, y )

	end	

	self.animTime = self.animTime + dt

	if self.animTime >= self.ANIM_TIME then
		self.animTime = -1
	end
	
end


--
function UI.HudEfficiencyDockedWnd:RemoveExpiredRecords()

	if self.numRecords == 0 then
		return		
	end

	if self.animTime ~= -1 then
		return
	end

	for i = 1, self.numRecords - self.MAX_RECORDS do
		self:RemoveRecord( 1 )
	end

	while self.numRecords > 0 do
		local record = self.records[ 1 ]

		if record.time == -1 and not record.slotWnd:IsPlayingAnimation() then
			self:RemoveRecord( 1 )			
		else
			break
		end
	end

end


--
function UI.HudEfficiencyDockedWnd:SetRecordPos( record, y )

	record.slotWnd:SetTop( y )

	local alphaCf = self:GetAlphaForY( y )
	record.slotWnd:SetAlpha( alphaCf )	

end


--
function UI.HudEfficiencyDockedWnd:GetRecordPos( record )

	return record.slotWnd:GetTop()

end


-- returns 0..1
function UI.HudEfficiencyDockedWnd:GetAlphaForY( y )

	return UI:Clamp( ( y - self.zeroAlphaY ) / ( self.fullAlphaY - self.zeroAlphaY ), 0, 1 )

end


--
function UI.HudEfficiencyDockedWnd:CheckQueue()

	if not self.queue[ 1 ] then
		return
	end

	if self:CanAddRecordNow( true ) then
		local rewardData = table.remove( self.queue, 1 )
		self:AddRecordInternal( rewardData )
	end

end


--
function UI.HudEfficiencyDockedWnd:UpdateRecordsShowTime( dt )

	if self.numRecords == 0 then
		return
	end

	for idx, record in ipairs( self.records ) do

		if record.time ~= -1 then

			record.time = record.time + dt

        	if record.time >= self.MAX_SHOW_TIME then
        		record.time = -1
        		record.slotWnd:PlayHideAnimation()
        	end	

		end
	end

end


--
function UI.HudEfficiencyDockedWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	-- резет нельзя вызывать в F_OnAfterShowOnScreen(). т.к. при любом переключении модов все элементы сначала отлинковываются;
	-- даже если в новом моде элемент по прежнему нужен

	if not self:IsOnScreen() then
		self:Reset()
	end

end


-- ---------------------------------------------------------------------------------
-- UI.HudEfficiencyDocked_SlotWnd
-- ---------------------------------------------------------------------------------

UI.HudEfficiencyDocked_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudEfficiencyDocked_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudEfficiencyDocked_SlotWnd",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "hud_efficiencyDocked_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.HudEfficiencyDocked_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
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
function UI.HudEfficiencyDocked_SlotWnd:Init( rewardData )

	self.rewardData = rewardData
	self:UpdateText()

end


--
function UI.HudEfficiencyDocked_SlotWnd:Reset()

	self.rewardData = nil
	self:SetText( "", self.layers.TEXT )
	self:SetAlpha( 1 )
	self.mainEffect:StartAnimation( self.effectInfo.main.animIdle )

end


--
function UI.HudEfficiencyDocked_SlotWnd:SetAlpha( alphaCf )

	local a = alphaCf * 255	
	local color = UI:MakeArgb( a, a, a, a )

	self.mainEffect:SetColor( color )
	self.mainEffect:SetAlpha( a )	

end


--
function UI.HudEfficiencyDocked_SlotWnd:PlayHideAnimation()

	self.mainEffect:StartAnimation( self.effectInfo.main.animHide )

end


--
function UI.HudEfficiencyDocked_SlotWnd:IsPlayingAnimation()

	return self.mainEffect:IsAnimationPlaying()

end


--
function UI.HudEfficiencyDocked_SlotWnd:MeasureTextRect( text )

	local formatRect = self:GetLayerRect( self.layers.TEXT )

	return _G.MeasureText(
   		text,
   		self:GetFont( self.layers.TEXT ),
   		formatRect,
   		self:GetTextFormatFlags( self.layers.TEXT ),
   		formatRect )

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudEfficiencyDocked_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.HudEfficiencyDocked_SlotWnd.effectInfo =
{
	main =
	{
    	animIdle	= "idle",
    	animHide	= "hide",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudEfficiencyDocked_SlotWnd.rewardData 	= nil
UI.HudEfficiencyDocked_SlotWnd.mainEffect	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudEfficiencyDocked_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.HudEfficiencyDocked_SlotWnd:UpdateText()

	local str = UI.HudEfficiencyWnd:Reward2Text( self.rewardData )
	self:SetText( str, self.layers.TEXT )	

end

-- ----------------------------------------------------------------------------
-- UI.HudEfficiencyFlyingWnd
-- ----------------------------------------------------------------------------

UI.HudEfficiencyFlyingWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudEfficiencyFlyingWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudEfficiencyFlyingWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudEfficiencyFlyingWnd:OnPlayerBattleReward( rewardData )

	self:AddRecord( rewardData )

end


--
function UI.HudEfficiencyFlyingWnd:Reset()

	for idx, record in ipairs( self.records ) do

		if record.slotWnd then
			record.slotWnd:Reset()
			record.slotWnd:UnlinkFromParent()
		end

	end

	self.records = {}
	self.centerScreenRecord = nil
	self.expForDamageRecord = nil

	self.queue = {}

end

-- ------------------------------
-- const
-- ------------------------------

UI.HudEfficiencyFlyingWnd.flyStates =
{
	START_POS	= 1,
	DOCKING		= 2,
}

UI.HudEfficiencyFlyingWnd.START_POS_TIME	= 2
UI.HudEfficiencyFlyingWnd.DOCKING_SPEED		= UI:XTo1024x768( 2000, { x = 1280, y = 720 } )	-- pix/sec
UI.HudEfficiencyFlyingWnd.MIN_DOCKING_TIME	= 0.3

UI.HudEfficiencyFlyingWnd.effectInfo =
{
	main =
	{
		effectName			= "hud_efficiency",
		expForDamageLocator	= "effectiv",
	},

	dist =
	{
		effectName			= "hud_objectsMarks",
		screenEdgeLocator	= "dist_out_efficiency",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudEfficiencyFlyingWnd.allSlots				= {}
UI.HudEfficiencyFlyingWnd.records				= {}
UI.HudEfficiencyFlyingWnd.centerScreenRecord	= nil
UI.HudEfficiencyFlyingWnd.expForDamageRecord	= nil
UI.HudEfficiencyFlyingWnd.queue					= {}
UI.HudEfficiencyFlyingWnd.screenEdge_abs		= 0
UI.HudEfficiencyFlyingWnd.screenEdgeY_rel		= 0
UI.HudEfficiencyFlyingWnd.dockingSpeed_abs		= 0
UI.HudEfficiencyFlyingWnd.expForDamagePos		= Vec2( 0, 0 )

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudEfficiencyFlyingWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

    local distEffect = _G.UI_SpawnEffect( self.effectInfo.dist.effectName, self:GetUiHandle() )
	if distEffect then
		self.screenEdgeY_rel = distEffect:GetObjSize( self.effectInfo.dist.screenEdgeLocator ).y
		_G.UI_DestroyEffect( distEffect )
	end

    local mainEffect = _G.UI_SpawnEffect( self.effectInfo.main.effectName, self:GetUiHandle() )
	if mainEffect then

		self.expForDamagePos = mainEffect:GetObjPos( self.effectInfo.main.expForDamageLocator )

		local expForDamageSize = mainEffect:GetObjSize( self.effectInfo.main.expForDamageLocator )
		self.expForDamagePos.x = self.expForDamagePos.x + expForDamageSize.x * 0.5
		self.expForDamagePos.y = self.expForDamagePos.y + expForDamageSize.y * 0.5

		_G.UI_DestroyEffect( mainEffect )

	end

	self:RecalcAbsVals()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )

end


--
function UI.HudEfficiencyFlyingWnd:AddRecord( rewardData )

	if self:CanAddRecordNow( rewardData, false ) then
		self:AddRecordInternal( rewardData )
	else
		self:EnqueueRecord( rewardData )
	end

end


--
function UI.HudEfficiencyFlyingWnd:CanAddRecordNow( rewardData, bIgnoreQueue )

	if rewardData.bExpForDamage then
		return not self.expForDamageRecord or self.expForDamageRecord.flyState == self.flyStates.START_POS		
	end

   	if rewardData.worldPos then
   		return true	
   	end

   	if not bIgnoreQueue then
       	if self.queue[ 1 ] then
       		return false
       	end
   	end

   	if self.centerScreenRecord then
       	return false
   	end

   	return true	

end


--
function UI.HudEfficiencyFlyingWnd:AddRecordInternal( rewardData )

	local bAddNew = true

	if rewardData.bExpForDamage then

		if self.expForDamageRecord then

    		if self.expForDamageRecord.flyState == self.flyStates.START_POS then

        		self.expForDamageRecord.rewardData.value = self.expForDamageRecord.rewardData.value + rewardData.value
    			self.expForDamageRecord.slotWnd:OnRewardValChanged()

        		self.expForDamageRecord.time			= 0
        		self.expForDamageRecord.textRect		= UI:QuatCopyStable( self.expForDamageRecord.slotWnd:GetTextRect() )
        		self.expForDamageRecord.dstDockingPos	= UI:Vec2CopyStable( self:GetDstDockingPos( self.expForDamageRecord.rewardData ) )

    	    	self:UpdateSlotPos( self.expForDamageRecord )

    			bAddNew = false

			else
				sys.log( "UI.HudEfficiencyFlyingWnd:AddRecordInternal()[ERROR]: invalid record state" )
			end

		end

	end

	if bAddNew then

    	local record = {}

    	local slotWnd = self:ObtainFreeSlot()
    	slotWnd:Init( rewardData )

    	record.rewardData		= rewardData
    	record.slotWnd			= slotWnd
    	record.flyState			= self.flyStates.START_POS
    	record.time				= 0
    	record.textRect			= UI:QuatCopyStable( slotWnd:GetTextRect() )
    	record.dstDockingPos	= UI:Vec2CopyStable( self:GetDstDockingPos( rewardData ) )
    	record.srcDockingPos	= Vec2( 0, 0 )
    	record.maxDockingTime	= 0
    	record.pos				= nil

		if rewardData.bExpForDamage then

			record.pos = UI:Vec2CopyStable( self.expForDamagePos )

		else   	

        	if record.rewardData.worldPos then
        		record.pos = Vec2( self:World2ScreenPos( record.rewardData.worldPos, record.textRect.z, record.textRect.w ) )
			else
				record.pos = Vec2( 1024/2, 768/2 )
        	end

        	record.pos.x = self:XToWindow( record.pos.x )
        	record.pos.y = self:YToWindow( record.pos.y )

		end

    	self:UpdateSlotPos( record )

		if rewardData.bExpForDamage then
			self.expForDamageRecord = record

    	elseif not record.rewardData.worldPos then
    		self.centerScreenRecord = record
		end

    	table.insert( self.records, record )

	end

end


--
function UI.HudEfficiencyFlyingWnd:EnqueueRecord( rewardData )

	table.insert( self.queue, rewardData )

end


--
function UI.HudEfficiencyFlyingWnd:RemoveRecord( recordIdx )

	local record = self.records[ recordIdx ]
	if record then

		if record.slotWnd then
			record.slotWnd:Reset()
			record.slotWnd:UnlinkFromParent()
		end

		if record == self.centerScreenRecord then
			self.centerScreenRecord = nil
		end

		if record == self.expForDamageRecord then
			self.expForDamageRecord = nil
		end

	end

	table.remove( self.records, recordIdx )

end


--
function UI.HudEfficiencyFlyingWnd:ObtainFreeSlot()

	local slotWnd = nil

	for idx, wnd in ipairs( self.allSlots ) do
		if not wnd:IsChildOf( self ) then
			slotWnd = wnd
			break
		end
	end

	if not slotWnd then
		slotWnd = UI:CreateChildWnd( self, UI.HudEfficiencyFlying_SlotWnd, tostring( #self.allSlots + 1 ) )
		table.insert( self.allSlots, slotWnd )	
	end

	if slotWnd then
		self:AddChild( slotWnd )
	end

	return slotWnd

end


--
function UI.HudEfficiencyFlyingWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if not self.records[ 1 ] then
		return
	end

	local expiredRecordIdxs = {}

	for recordIdx, record in ipairs( self.records ) do

		if record.flyState == self.flyStates.START_POS then

			record.time = record.time + dt_sys

			if record.time >= self.START_POS_TIME and not record.slotWnd:IsAnimating() then

				record.flyState			= self.flyStates.DOCKING
				record.srcDockingPos	= UI:Vec2CopyStable( record.pos )
				record.time				= 0				

				local srcDockingPos_abs = UI:PtToAbs( record.srcDockingPos )
				local dstDockingPos_abs = UI:PtToAbs( record.dstDockingPos )

				local dockingDir_abs = UI:Vec2( dstDockingPos_abs.x - srcDockingPos_abs.x, dstDockingPos_abs.y - srcDockingPos_abs.y )
				local dockingDist_abs = UI:V2Length( dockingDir_abs )

				record.maxDockingTime = dockingDist_abs / self.dockingSpeed_abs

				if record.maxDockingTime < self.MIN_DOCKING_TIME then
					record.maxDockingTime = self.MIN_DOCKING_TIME
				end

			end


		elseif record.flyState == self.flyStates.DOCKING then
			
			record.time = record.time + dt_sys
			if record.time >= record.maxDockingTime then
				record.time = record.maxDockingTime
			end

			local t = record.maxDockingTime ~= 0 and record.time / record.maxDockingTime or 1

			record.pos.x = UI:Lerp( record.srcDockingPos.x, record.dstDockingPos.x, t )
			record.pos.y = UI:Lerp( record.srcDockingPos.y, record.dstDockingPos.y, t )			
			self:UpdateSlotPos( record )

			if record.time >= record.maxDockingTime then

				table.insert( expiredRecordIdxs, recordIdx )
				self:DockRecord( record )

			end

		end

	end

	for idx, recordIdx in ipairs( expiredRecordIdxs ) do
		self:RemoveRecord( recordIdx )
	end

	if expiredRecordIdxs[ 1 ] then
		self:CheckQueue()
	end

end


--
function UI.HudEfficiencyFlyingWnd:DockRecord( record )

	local parent = self:GetParent()
	if parent then
		return parent:DockRecord( record.rewardData )
	end

end


--
function UI.HudEfficiencyFlyingWnd:CheckQueue()

	if not self.queue[ 1 ] then
		return
	end

	local rewardDataIdx = 1
	local rewardData = self.queue[ rewardDataIdx ]

	if self:CanAddRecordNow( rewardData, true ) then
		table.remove( self.queue, rewardDataIdx )
		self:AddRecordInternal( rewardData )
	end

end


--
function UI.HudEfficiencyFlyingWnd:GetDstDockingPos( rewardData )

	local parent = self:GetParent()
	if parent then
		
		local pos = parent:GetDockingPos( rewardData )
		pos.x = pos.x - self:GetLeft()
		pos.y = pos.y - self:GetTop()

		return pos

	else
		return UI:ZeroVec2()
	end

end


--
function UI.HudEfficiencyFlyingWnd:World2ScreenPos( worldPos, textSizeX, textSizeY )

	local screenPos_abs_x, screenPos_abs_y, screenPos_abs_z = _G.ProjectPointToScreen( worldPos )

	local bInsideEdges	=
		screenPos_abs_z > 0 and
		screenPos_abs_x >= self.screenEdge_abs and
		screenPos_abs_x <= UI.screenWidth - self.screenEdge_abs and
		screenPos_abs_y >= self.screenEdge_abs and
		screenPos_abs_y <= UI.screenHeight - self.screenEdge_abs

	if not bInsideEdges then

		local dirX_abs, dirY_abs = _G.GetDirToPoint2d( worldPos )
		local angle	= math.atan2( -dirY_abs, dirX_abs )

		-- здесь размер текста не учитывается умышленно, так него лучше выглядит; он учитывается потом, клампом
		screenPos_abs_x, screenPos_abs_y = self:GetOnEdgePos( angle, self.screenEdge_abs, self.screenEdge_abs )

	end

	local edgeX_abs = UI:XToAbs( textSizeX * 0.5 ) + self.screenEdge_abs
	local edgeY_abs = UI:YToAbs( textSizeY * 0.5 ) + self.screenEdge_abs

	screenPos_abs_x = UI:Clamp( screenPos_abs_x, edgeX_abs, UI.screenWidth - edgeX_abs )
	screenPos_abs_y = UI:Clamp( screenPos_abs_y, edgeY_abs, UI.screenHeight - edgeY_abs )

	return UI:XToRel( screenPos_abs_x ), UI:YToRel( screenPos_abs_y )

end


--
function UI.HudEfficiencyFlyingWnd:GetOnEdgePos( angle, edgeX, edgeY )

	angle		= UI:AngleNormalizePI( angle )

	local w		= UI.screenWidth * 0.5 - edgeX
	local h		= UI.screenHeight * 0.5 - edgeY
	local tn	= math.tan( angle )
	local a		= math.atan( h / w )

	local x		= 0
	local y		= 0

	-- сверху

	if angle >= a and angle <=  math.pi - a then
		x = h / tn
		y = -h

	-- снизу
	elseif angle <= -a and angle >= -math.pi + a then
		x = - h / tn
		y = h

	-- слева
	elseif math.abs( angle ) > math.pi - a then
		x = -w
		y = w * tn

	-- справа
	else
		x = w
		y = - w * tn
	end

	return x + UI.screenWidth * 0.5, y + UI.screenHeight * 0.5

end


--
function UI.HudEfficiencyFlyingWnd:UpdateSlotPos( record )

	record.slotWnd:SetPos( record.pos.x - ( record.textRect.x + record.textRect.z * 0.5 ), record.pos.y - ( record.textRect.y + record.textRect.w * 0.5 ) )

end


--
function UI.HudEfficiencyFlyingWnd:F_OnResetDevice()

	self:OnResetDevice()
	self:RecalcAbsVals()

end


--
function UI.HudEfficiencyFlyingWnd:RecalcAbsVals()

	self.screenEdge_abs = UI:YToAbs( self.screenEdgeY_rel )
	self.dockingSpeed_abs = UI:XToAbs( self.DOCKING_SPEED )

end


--
function UI.HudEfficiencyFlyingWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	-- резет нельзя вызывать в F_OnAfterShowOnScreen(). т.к. при любом переключении модов все элементы сначала отлинковываются;
	-- даже если в новом моде элемент по прежнему нужен

	if not self:IsOnScreen() then
		self:Reset()
	end

end


-- ----------------------------------------------------------------------------
-- UI.HudEfficiencyFlying_SlotWnd
-- ----------------------------------------------------------------------------

UI.HudEfficiencyFlying_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudEfficiencyFlying_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudEfficiencyFlying_SlotWnd",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "hud_efficiencyFlying_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "etext_name",
						layer		= "UI.HudEfficiencyFlying_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},   

		-- TEXT
		{
			layerType		= UI.LAYER_ETEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			spriteName			= "etext_name_sprite",
			spriteEffectLayer	= "UI.HudEfficiencyFlying_SlotWnd.layers.MAIN_EFFECT",
		}, 
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudEfficiencyFlying_SlotWnd:Init( rewardData )

	self.rewardData = rewardData

	self:UpdateText()
	self:PlayShowAnimation()

end


--
function UI.HudEfficiencyFlying_SlotWnd:Reset()

	self.rewardData = nil
	self:SetText( "", self.layers.TEXT )
	self:PlayIdleAnimation()

end


--
function UI.HudEfficiencyFlying_SlotWnd:IsAnimating()

	local curAnimation = self.mainEffect:GetCurAnimation() or ""	
	return curAnimation ~= "" and curAnimation ~= self.effectInfo.main.animIdle

end


--
function UI.HudEfficiencyFlying_SlotWnd:GetTextRect()

	local formatRect = self:GetLayerRect( self.layers.TEXT )

	return _G.MeasureText(
   		self:GetText( self.layers.TEXT ),
   		self:GetFont( self.layers.TEXT ),
   		formatRect,
   		self:GetTextFormatFlags( self.layers.TEXT ),
   		formatRect )

end


--
function UI.HudEfficiencyFlying_SlotWnd:OnRewardValChanged()

	self:UpdateText()

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudEfficiencyFlying_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.HudEfficiencyFlying_SlotWnd.effectInfo =
{
	main =
	{
    	animIdle	= "idle",
    	animShow	= "show",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudEfficiencyFlying_SlotWnd.rewardData	= nil
UI.HudEfficiencyFlying_SlotWnd.mainEffect	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudEfficiencyFlying_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.HudEfficiencyFlying_SlotWnd:F_OnEffectAnimationEnded( effect, animName )

	if animName == self.effectInfo.main.animShow then
		self:PlayIdleAnimation()
	end

end


--
function UI.HudEfficiencyFlying_SlotWnd:UpdateText()

	local str = UI.HudEfficiencyWnd:Reward2Text( self.rewardData )
	self:SetText( str, self.layers.TEXT )	

end


--
function UI.HudEfficiencyFlying_SlotWnd:PlayShowAnimation()

	self.mainEffect:StartAnimation( self.effectInfo.main.animShow )

end


--
function UI.HudEfficiencyFlying_SlotWnd:PlayIdleAnimation()

	self.mainEffect:StartAnimation( self.effectInfo.main.animIdle )

end