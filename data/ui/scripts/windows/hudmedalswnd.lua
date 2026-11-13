-- ----------------------------------------------------------------------------
--
-- Workfile: hudmedalswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudMedalsWnd = {}
local mw = UI.HudMedalsWnd

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.HudMedalsWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "HudMedalsWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "hud_medals_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "medals",	
						layer		= "UI.HudMedalsWnd.layers.ICONS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "medals_name",	
						layer		= "UI.HudMedalsWnd.layers.NAMES_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ICONS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_medals_icons",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.HudMedalsWnd.layers.ICONS_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- NAMES_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_medals_names",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.HudMedalsWnd.layers.NAMES_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ICONS_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_medals_icons_bg",
				defaultAnimation	= "idle",
			}}
		},

		-- NAMES_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_medals_names_bg",
				defaultAnimation	= "idle",
			}}
		}
	},
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.HudMedalsWnd:OnMedalEarned( medalId, level, exp )

	if not self:IsOnScreen() then
		return
	end

	if UI:Val2Key( ai.MedalType, medalId ) == "" then
		sys.log( "UI.HudMedalsWnd:OnMedalEarned()[ERROR]: invalid 1-st param (\"medalId\"); one of the \"ai.MedalType\" values expected, got \"%s\"", tostring( medalId ) )
		return
	end

	if type( level ) ~= "number" then
		sys.log( "UI.HudMedalsWnd:OnMedalEarned()[ERROR]: invalid type of the 2-nd param (\"level\"); \"number\" expected, got \"%s\"", type( level ) )
		return
	end

	self.delayTimer = self.DELAY_TIME

	local data =
	{
		medalId	= medalId,
		level	= level,
		exp		= exp,
	}

	self:AddRecord( data )

end


--
function UI.HudMedalsWnd:Reset()

	self:ResetRecords()
	self.queue = {}
	self:HideBg( false )
	self.delayTimer = -1

end


-- -----------------------------------
-- const
-- -----------------------------------

mw.layers =
{
	MAIN_EFFECT		= 0,
	ICONS_EFFECT	= 1,
	NAMES_EFFECT	= 2,
	ICONS_BG_EFFECT	= 3,
	NAMES_BG_EFFECT	= 4,
}

mw.MAX_RECORDS	= 5	-- при анимации реально может быть на 1 больше

mw.MIN_SHOW_TIME	= 1
mw.MAX_SHOW_TIME	= 4
mw.ANIM_TIME		= 0.1

mw.effectInfo =
{
	icons =
	{
		firstSlotLocator	= "medals_1",
		secondSlotLocator	= "medals_2",
	},

	names =
	{
		firstSlotLocator	= "line_1",
		secondSlotLocator	= "line_2",
	},

	bg_ico =
	{
		animIdle	= "idle",
		animShow	= "show",
		animHide	= "hide",
	},

	bg_name =
	{
		animIdle	= "idle",
		animShow	= "show",
		animHide	= "hide",
	}
}

mw.sounds =
{
	showMedal	= "sound/ui/medal"
}

mw.DELAY_TIME = 1	-- т.к. медали часто даются одновременно с такими собятиями в игре, как взрыв, залержка необходима для того, чтобы был лучше слышен звук (см. #0022399)

-- -----------------------------------
-- vars
-- -----------------------------------

mw.records				= {}
mw.numRecords			= 0
mw.queue				= {}
mw.animTime				= -1

mw.allSlotWnds_ico		= {}
mw.dist_slots_ico		= 0
mw.firstSlotPos_ico		= Vec2( 0, 0 )
mw.zeroAlphaX_ico		= 0
mw.fullAlphaX_ico		= 0

mw.allSlotWnds_name		= {}
mw.dist_slots_name		= 0
mw.firstSlotPos_name	= Vec2( 0, 0 )
mw.zeroAlphaY_name		= 0
mw.fullAlphaY_name		= 0
mw.delayTimer			= -1
mw.mainEffect			= nil
mw.iconsEffect			= nil
mw.namesEffect			= nil
mw.iconsBgEffect		= nil
mw.namesBgEffect		= nil

-- -----------------------------------
-- work functions 
-- -----------------------------------

--
function UI.HudMedalsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.iconsEffect	= UI:GetEffectFromLayer( self, self.layers.ICONS_EFFECT )
	self.namesEffect	= UI:GetEffectFromLayer( self, self.layers.NAMES_EFFECT )
	self.iconsBgEffect	= UI:GetEffectFromLayer( self, self.layers.ICONS_BG_EFFECT )
	self.namesBgEffect	= UI:GetEffectFromLayer( self, self.layers.NAMES_BG_EFFECT )

	if self.iconsEffect then

		local iconsEffectPos = self.iconsEffect:GetPos()

		local firstSlotLocatorPos	= self.iconsEffect:GetObjPos( self.effectInfo.icons.firstSlotLocator )
		local secondSlotLocatorPos	= self.iconsEffect:GetObjPos( self.effectInfo.icons.secondSlotLocator )

		self.firstSlotPos_ico = Vec2( firstSlotLocatorPos.x + iconsEffectPos.x, firstSlotLocatorPos.y + iconsEffectPos.y )
		self.dist_slots_ico = firstSlotLocatorPos.x - secondSlotLocatorPos.x

		self.zeroAlphaX_ico = self.firstSlotPos_ico.x - self.dist_slots_ico * self.MAX_RECORDS
		self.fullAlphaX_ico = self.firstSlotPos_ico.x - self.dist_slots_ico * ( self.MAX_RECORDS - 1 )

	end


	if self.namesEffect then

		local namesEffectPos = self.namesEffect:GetPos()

		local firstSlotLocatorPos	= self.namesEffect:GetObjPos( self.effectInfo.names.firstSlotLocator )
		local secondSlotLocatorPos	= self.namesEffect:GetObjPos( self.effectInfo.names.secondSlotLocator )

		self.firstSlotPos_name = Vec2( firstSlotLocatorPos.x + namesEffectPos.x, firstSlotLocatorPos.y + namesEffectPos.y )
		self.dist_slots_name = secondSlotLocatorPos.y - firstSlotLocatorPos.y

		self.zeroAlphaY_name = self.firstSlotPos_name.y + self.dist_slots_name * self.MAX_RECORDS
		self.fullAlphaY_name = self.firstSlotPos_name.y + self.dist_slots_name * ( self.MAX_RECORDS - 1 )

	end

	self:InitSlots()

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )

end


--
function UI.HudMedalsWnd:InitSlots()

	for i = 1, self.MAX_RECORDS + 1 do	-- +1 - для обеспечения анимации
		self:CreateSlotWnd_ico()
		self:CreateSlotWnd_name()
	end

end


--
function UI.HudMedalsWnd:ResetRecords()

	while self.numRecords > 0 do
		self:RemoveRecord( self.numRecords )
	end

end


--
function UI.HudMedalsWnd:RemoveRecord( recordIdx )

	local record = self.records[ recordIdx ]
	if not record then
		return
	end

	if record.slotWnd_ico then
		record.slotWnd_ico:Reset()
		record.slotWnd_ico:UnlinkFromParent()
	end

	if record.slotWnd_name then
		record.slotWnd_name:Reset()
		record.slotWnd_name:UnlinkFromParent()
	end

	table.remove( self.records, recordIdx )
	self.numRecords = self.numRecords - 1

end


--
function UI.HudMedalsWnd:AddRecord( data )

	if self:CanAddRecordNow( false ) then
		self:AddRecordInternal( data )
	else
		self:EnqueueRecord( data )
	end

end


--
function UI.HudMedalsWnd:CanAddRecordNow( bIgnoreQueue )

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

	if self.delayTimer ~= -1 then
		return false		
	end

	return true	

end


--
function UI.HudMedalsWnd:AddRecordInternal( data )

	local record = {}

	record.data		= data
	record.time		= 0

	record.dstX_ico	= 0
	local slotWnd_ico = self:ObtainFreeSlotWnd_ico()
	record.slotWnd_ico = slotWnd_ico
	self:AddChild( slotWnd_ico )
	slotWnd_ico:Init( record.data )
	slotWnd_ico:PlayShowAnimation()
	self:SetSlotPos_ico( slotWnd_ico, self.firstSlotPos_ico.x )

	record.dstY_name = 0
	local slotWnd_name = self:ObtainFreeSlotWnd_name()
	record.slotWnd_name = slotWnd_name
	self:AddChild( slotWnd_name )
	slotWnd_name:Init( record.data )
	slotWnd_name:PlayShowAnimation()
	self:SetSlotPos_name( slotWnd_name, self.firstSlotPos_name.y )

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	if self.numRecords > 1 then
		self:StartMoveAnimation()
	end

	self:UpdateBg( true )

	self.delayTimer = -1

	UI:PlayGlobalSound( self.sounds.showMedal )

end


--
function UI.HudMedalsWnd:EnqueueRecord( data )

	table.insert( self.queue, data )

end


--
function UI.HudMedalsWnd:ObtainFreeSlotWnd_ico()

	for idx, slotWnd in ipairs( self.allSlotWnds_ico ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	return self:CreateSlotWnd_ico()	

end


--
function UI.HudMedalsWnd:ObtainFreeSlotWnd_name()

	for idx, slotWnd in ipairs( self.allSlotWnds_name ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	return self:CreateSlotWnd_name()	

end


--
function UI.HudMedalsWnd:CreateSlotWnd_ico()

	local slotWnd = UI:CreateChildWnd( self, UI.HudMedals_IcoSlotWnd, tostring( #self.allSlotWnds_ico + 1 ) )
	slotWnd:SetLeft( self.firstSlotPos_ico.x )

	table.insert( self.allSlotWnds_ico, slotWnd )

	return slotWnd

end


--
function UI.HudMedalsWnd:CreateSlotWnd_name()

	local slotWnd = UI:CreateChildWnd( self, UI.HudMedals_NameSlotWnd, tostring( #self.allSlotWnds_name + 1 ) )
	slotWnd:SetLeft( self.firstSlotPos_name.x )

	table.insert( self.allSlotWnds_name, slotWnd )

	return slotWnd

end


--
function UI.HudMedalsWnd:StartMoveAnimation()

	if self.animTime ~= -1 then
		sys.log( "UI.HudMedalsWnd:StartMoveAnimation()[ERROR]: already animating" )
		return
	end

	if self.numRecords < 2 then
		sys.log( "UI.HudMedalsWnd:StartMoveAnimation()[ERROR]: < 2 records" )
	end

	self.animTime = 0

	for recordIdx = 1, self.numRecords - 1 do

		local record = self.records[ recordIdx ]

		local x_ico = self:GetSlotPos_ico( record.slotWnd_ico )
		record.dstX_ico = x_ico - self.dist_slots_ico

		local y_name = self:GetSlotPos_name( record.slotWnd_name )
		record.dstY_name = y_name + self.dist_slots_name

	end 	

end


--
function UI.HudMedalsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateDelayTimer( dt_sys )
	self:UpdateRecordsShowTime( dt_sys )
	self:UpdateMoveAnimation( dt_sys )
	self:RemoveExpiredRecords()
	self:CheckQueue()

end


--
function UI.HudMedalsWnd:UpdateMoveAnimation( dt )

	if self.animTime == -1 then
		return
	end

	local speed_ico = self.dist_slots_ico / self.ANIM_TIME
	local speed_name = self.dist_slots_name / self.ANIM_TIME

	for recordIdx = 1, self.numRecords - 1 do

		local record = self.records[ recordIdx ]


		local x_ico = self:GetSlotPos_ico( record.slotWnd_ico )
		x_ico = x_ico - speed_ico * dt

		if x_ico <= record.dstX_ico then
			x_ico = record.dstX_ico
		end

		self:SetSlotPos_ico( record.slotWnd_ico, x_ico )


		local y_name = self:GetSlotPos_name( record.slotWnd_name )
		y_name = y_name + speed_name * dt

		if y_name >= record.dstY_name then
			y_name = record.dstY_name
		end

		self:SetSlotPos_name( record.slotWnd_name, y_name )

	end	

	self.animTime = self.animTime + dt

	if self.animTime >= self.ANIM_TIME then
		self.animTime = -1
	end
	
end


--
function UI.HudMedalsWnd:RemoveExpiredRecords()

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

		if record.time == -1 and not record.slotWnd_ico:IsPlayingAnimation() and not record.slotWnd_name:IsPlayingAnimation() then
			self:RemoveRecord( 1 )
		else
			break
		end
	end

	self:UpdateBg( true )

end


--
function UI.HudMedalsWnd:SetSlotPos_ico( slotWnd, x )

	slotWnd:SetLeft( x )

	local alphaCf = self:GetAlphaForX_ico( x )
	slotWnd:SetAlpha( alphaCf )	

end


--
function UI.HudMedalsWnd:SetSlotPos_name( slotWnd, y )

	slotWnd:SetTop( y )

	local alphaCf = self:GetAlphaForY_name( y )
	slotWnd:SetAlpha( alphaCf )	

end


--
function UI.HudMedalsWnd:GetSlotPos_ico( slotWnd )

	return slotWnd:GetLeft()

end


--
function UI.HudMedalsWnd:GetSlotPos_name( slotWnd )

	return slotWnd:GetTop()

end


-- returns 0..1
function UI.HudMedalsWnd:GetAlphaForX_ico( x )

	return UI:Clamp( ( x - self.zeroAlphaX_ico ) / ( self.fullAlphaX_ico - self.zeroAlphaX_ico ), 0, 1 )

end


-- returns 0..1
function UI.HudMedalsWnd:GetAlphaForY_name( y )

	return UI:Clamp( ( y - self.zeroAlphaY_name ) / ( self.fullAlphaY_name - self.zeroAlphaY_name ), 0, 1 )

end


--
function UI.HudMedalsWnd:CheckQueue()

	if not self.queue[ 1 ] then
		return
	end

	if self:CanAddRecordNow( true ) then
		local data = table.remove( self.queue, 1 )
		self:AddRecordInternal( data )
	end

end


--
function UI.HudMedalsWnd:UpdateRecordsShowTime( dt )

	if self.numRecords == 0 then
		return
	end

	for idx, record in ipairs( self.records ) do

		if record.time ~= -1 then

			record.time = record.time + dt

        	if record.time >= self.MAX_SHOW_TIME then
        		record.time = -1
        		record.slotWnd_ico:PlayHideAnimation()
        		record.slotWnd_name:PlayHideAnimation()
        	end	

		end
	end

end


--
function UI.HudMedalsWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	-- резет нельзя вызывать в F_OnAfterShowOnScreen(). т.к. при любом переключении модов все элементы сначала отлинковываются;
	-- даже если в новом моде элемент по прежнему нужен

	if self:IsOnScreen() then
		self:UpdateBg( false )
	else
		self:Reset()
	end

end


--
function UI.HudMedalsWnd:UpdateBg( bAnimated )

	if self:NeedBg() then
		self:ShowBg( bAnimated )
	else
		self:HideBg( bAnimated )
	end

end


--
function UI.HudMedalsWnd:NeedBg()

	if self.numRecords == 0 then
		return false
	end

	local hudMode = UI.HudWnd:GetMode()
	return UI.HudWnd:IsWorldLookMode( hudMode )

end


--
function UI.HudMedalsWnd:HideBg( bAnimated )

	self:HideBg_ico( bAnimated )
	self:HideBg_name( bAnimated )

end


--
function UI.HudMedalsWnd:ShowBg( bAnimated )

	self:ShowBg_ico( bAnimated )
	self:ShowBg_name( bAnimated )

end


--
function UI.HudMedalsWnd:HideBg_ico( bAnimated )

	if not self:IsLayerVisible( self.layers.ICONS_BG_EFFECT ) then
		return
	end

	if bAnimated then
		if self.iconsBgEffect then
			self.iconsBgEffect:StartAnimation( self.effectInfo.bg_ico.animHide )
		end
	else
		self:SetLayerVisible( false, self.layers.ICONS_BG_EFFECT )
	end

end


--
function UI.HudMedalsWnd:HideBg_name( bAnimated )

	if not self:IsLayerVisible( self.layers.NAMES_BG_EFFECT ) then
		return
	end

	if bAnimated then
		if self.namesBgEffect and self.namesBgEffect:GetCurAnimation() ~= self.effectInfo.bg_name.animHide then
			self.namesBgEffect:StartAnimation( self.effectInfo.bg_name.animHide )
		end
	else
		self:SetLayerVisible( false, self.layers.NAMES_BG_EFFECT )
	end

end


--
function UI.HudMedalsWnd:ShowBg_ico( bAnimated )

	self:SetLayerVisible( true, self.layers.ICONS_BG_EFFECT )

	if bAnimated then
		if self.iconsBgEffect then

			local curAnim = self.iconsBgEffect:GetCurAnimation()
			if curAnim ~= self.effectInfo.bg_ico.animShow and curAnim ~= self.effectInfo.bg_ico.animIdle then
				self.iconsBgEffect:StartAnimation( self.effectInfo.bg_ico.animShow )
			end

		end
	end

end


--
function UI.HudMedalsWnd:ShowBg_name( bAnimated )

	self:SetLayerVisible( true, self.layers.NAMES_BG_EFFECT )

	if bAnimated then
		if self.namesBgEffect then

			local curAnim = self.namesBgEffect:GetCurAnimation()
			if curAnim ~= self.effectInfo.bg_name.animShow and curAnim ~= self.effectInfo.bg_name.animIdle then
				self.namesBgEffect:StartAnimation( self.effectInfo.bg_name.animShow )
			end

		end
	end

end


--
function UI.HudMedalsWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.iconsBgEffect then

		if animName == self.effectInfo.bg_ico.animHide then
			self:HideBg_ico( false )

		elseif animName == self.effectInfo.bg_ico.animShow then
			effect:StartAnimation( self.effectInfo.bg_ico.animIdle )
		end

	elseif effect == self.namesBgEffect then

		if animName == self.effectInfo.bg_name.animHide then
			self:HideBg_name( false )

		elseif animName == self.effectInfo.bg_name.animShow then
			effect:StartAnimation( self.effectInfo.bg_name.animIdle )
		end

	end

end


--
function UI.HudMedalsWnd:UpdateDelayTimer( dt )

	if self.delayTimer ~= -1 then
		self.delayTimer = self.delayTimer - dt
		if self.delayTimer <= 0 then
			self.delayTimer = -1
		end
	end

end


--
function UI.HudMedalsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	-- во время, пока окно было скрыто, таймер не обновлялся, поэтому здесь, при показе, он уже не актуален
	self.delayTimer = -1

end


-- ---------------------------------------------------------------------------------
-- UI.HudMedals_IcoSlotWnd
-- ---------------------------------------------------------------------------------

UI.HudMedals_IcoSlotWnd = {}
local mi = UI.HudMedals_IcoSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudMedals_IcoSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudMedals_IcoSlotWnd",
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
				defName 			= "hud_medals_icoSlot",
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

		-- ANIM_ALPHA_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_medals_icoSlot_animAlpha",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudMedals_IcoSlotWnd:Init( data )

	self.data = data
	self:UpdateIco()

end


--
function UI.HudMedals_IcoSlotWnd:Reset()

	self.data = nil
	self:SetAlpha( 1 )

	if self.mainEffect then
		self.mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	if self.animAlphaEffect then
		self.animAlphaEffect:StartAnimation( self.effectInfo.animAlpha.animIdle )
	end

end


--
function UI.HudMedals_IcoSlotWnd:SetAlpha( alphaCf )

	self.alphaCf = UI:Clamp( alphaCf, 0, 1 )
	self:UpdateAlpha()

end


--
function UI.HudMedals_IcoSlotWnd:PlayShowAnimation()

	if self.animAlphaEffect then
		self.animAlphaEffect:StartAnimation( self.effectInfo.animAlpha.animShow )
	end

end


--
function UI.HudMedals_IcoSlotWnd:PlayHideAnimation()

	if self.animAlphaEffect then
		self.animAlphaEffect:StartAnimation( self.effectInfo.animAlpha.animHide )
	end

end


--
function UI.HudMedals_IcoSlotWnd:IsPlayingAnimation()

	return self.animAlphaEffect and self.animAlphaEffect:IsAnimationPlaying()

end

-- ------------------------------
-- const
-- ------------------------------

mi.layers =
{
	MAIN_EFFECT			= 0,
	ANIM_ALPHA_EFFECT	= 1,
}

mi.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",		
	},

	animAlpha =
	{
    	animIdle		= "idle",
    	animShow		= "show",
    	animHide		= "hide",
		locator			= "name",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

mi.data				= nil
mi.mainEffect		= nil
mi.animAlphaEffect	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudMedals_IcoSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect			= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.animAlphaEffect	= UI:GetEffectFromLayer( self, self.layers.ANIM_ALPHA_EFFECT )

end


--
function UI.HudMedals_IcoSlotWnd:UpdateAlpha()

	if not self.mainEffect or not self.animAlphaEffect then
		return
	end

	local alpha = self.animAlphaEffect:GetObjAlpha( self.effectInfo.animAlpha.locator ) * self.alphaCf
	self.mainEffect:SetAlpha( alpha )

end


--
function UI.HudMedals_IcoSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateAlpha()

end


--
function UI.HudMedals_IcoSlotWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.animAlphaEffect then

		if animName == self.effectInfo.animAlpha.animShow then
			effect:StartAnimation( self.effectInfo.animAlpha.animIdle )
		end

	end

end


--
function UI.HudMedals_IcoSlotWnd:UpdateIco()

	if not self.mainEffect then
		return
	end

	local hTex = UI:GetMedalIco( self.data.medalId, self.data.level )
	self.mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


-- ---------------------------------------------------------------------------------
-- UI.HudMedals_NameSlotWnd
-- ---------------------------------------------------------------------------------

UI.HudMedals_NameSlotWnd = {}
local mn = UI.HudMedals_NameSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudMedals_NameSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudMedals_NameSlotWnd",
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
				defName 			= "hud_medals_nameSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.HudMedals_NameSlotWnd.layers.TEXT",
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
function UI.HudMedals_NameSlotWnd:Init( data )

	self.data = data
	self:UpdateText()

end


--
function UI.HudMedals_NameSlotWnd:Reset()

	self.data = nil
	self:SetText( "", self.layers.TEXT )
	self:SetAlpha( 1 )

	if self.mainEffect then
		self.mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

end


--
function UI.HudMedals_NameSlotWnd:SetAlpha( alphaCf )

	if not self.mainEffect then
		return
	end

	local a = alphaCf * 255	
	local color = UI:MakeArgb( a, a, a, a )

	self.mainEffect:SetColor( color )
	self.mainEffect:SetAlpha( a )	

end


--
function UI.HudMedals_NameSlotWnd:PlayShowAnimation()

	if self.mainEffect then
		self.mainEffect:StartAnimation( self.effectInfo.main.animShow )
	end

end


--
function UI.HudMedals_NameSlotWnd:PlayHideAnimation()

	if self.mainEffect then
		self.mainEffect:StartAnimation( self.effectInfo.main.animHide )
	end

end


--
function UI.HudMedals_NameSlotWnd:IsPlayingAnimation()

	return self.mainEffect and self.mainEffect:IsAnimationPlaying()

end

-- ------------------------------
-- const
-- ------------------------------

mn.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

mn.effectInfo =
{
	main =
	{
    	animIdle	= "idle",
    	animShow	= "show",
    	animHide	= "hide",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

mn.data			= nil
mn.mainEffect	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudMedals_NameSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.HudMedals_NameSlotWnd:F_OnEffectAnimationEnded( effect, animName )

	if animName == self.effectInfo.main.animShow then
		effect:StartAnimation( self.effectInfo.main.animIdle )		
	end

end


--
function UI.HudMedals_NameSlotWnd:UpdateText()

	local strMedal	= UI:Medal2Str( self.data.medalId, self.data.level )
	local strExp	= self.data.exp > 0 and UI:Num2StrSeparatedBy3( self.data.exp ) or ""

	local str = string.format( "\"%s\"%s%s", strMedal, strExp ~= "" and " " or "", strExp )
	self:SetText( str, self.layers.TEXT )	

end
