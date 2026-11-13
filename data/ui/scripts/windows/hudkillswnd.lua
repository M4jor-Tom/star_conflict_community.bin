-- ----------------------------------------------------------------------------
--
-- Workfile: hudkillswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudKillsWnd = {}
local hk = UI.HudKillsWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudKillsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudKillsWnd",
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
				defName 			= "hud_kills_main",
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
function UI.HudKillsWnd:GameChat_AddBattleLogMessage( id, params )

	if not self:IsOnScreen() then
		return
	end

	if type( id ) ~= "string" then
		sys.log( "UI.HudKillsWnd:GameChat_AddBattleLogMessage()[ERROR]: invalid type of the 1-st parameter (\"id\"); \"string\" expected, got \"%s\"", type( id ) )
		return
	end

	-- #0050763 - реагирование на специфичные для битвы дредноутов сообщения убрано
	if id ~= "kill" --[[ and id ~= "clanship_damage"]] then
		return
	end

	-- необходимо текст получить сразу же, т.к. если это будет сделано с задержкой (после анимации), то энтити уже перестанут существовать
	local text = self:MakeString( id, params )

	local data =
	{
		params			= params,
		text			= text,
	}

	self:AddRecord( data )

end


--
function UI.HudKillsWnd:Reset()

	self:ResetRecords()
	self.queue = {}

end


-- ------------------------------
-- const
-- ------------------------------

hk.layers =
{
	MAIN_EFFECT		= 0
}

hk.MAX_RECORDS	= 5	-- при анимации реально может быть на 1 больше

hk.MIN_SHOW_TIME	= 1
hk.MAX_SHOW_TIME	= 4
hk.ANIM_TIME		= 0.1

hk.effectInfo =
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

hk.records			= {}
hk.queue			= {}
hk.allSlotWnds		= {}
hk.numRecords		= 0
hk.animTime			= -1
hk.dist_slots		= 0
hk.firstSlotPos		= Vec2( 0, 0 )
hk.zeroAlphaY		= 0
hk.fullAlphaY		= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudKillsWnd:F_PostLoad()

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
	UI:SubscribeUiObjOnEvent( handle, UI.EV_PLAYER_STATUS_CHANGED )

end


--
function UI.HudKillsWnd:InitSlots()

	for i = 1, self.MAX_RECORDS + 1 do	-- +1 - для обеспечения анимации
		self:CreateSlotWnd()
	end

end


--
function UI.HudKillsWnd:ResetRecords()

	while self.numRecords > 0 do
		self:RemoveRecord( self.numRecords )
	end

end


--
function UI.HudKillsWnd:RemoveRecord( recordIdx )

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
function UI.HudKillsWnd:AddRecord( data )

	if self:CanAddRecordNow( false ) then
		self:AddRecordInternal( data )
	else
		self:EnqueueRecord( data )
	end

end


--
function UI.HudKillsWnd:CanAddRecordNow( bIgnoreQueue )

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
function UI.HudKillsWnd:AddRecordInternal( data )

	local record = {}

	record.data		= data
	record.time		= 0
	record.dstY		= 0

	local slotWnd = self:ObtainFreeSlotWnd()
	record.slotWnd = slotWnd

	self:AddChild( slotWnd )
	slotWnd:Init( record.data )
	slotWnd:PlayShowAnimation()
	self:SetRecordPos( record, self.firstSlotPos.y )

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	if self.numRecords > 1 then
		self:StartMoveAnimation()
	end

end


--
function UI.HudKillsWnd:EnqueueRecord( data )

	table.insert( self.queue, data )

end


--
function UI.HudKillsWnd:ObtainFreeSlotWnd()

	for idx, slotWnd in ipairs( self.allSlotWnds ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	return self:CreateSlotWnd()	

end


--
function UI.HudKillsWnd:CreateSlotWnd()

	local slotWnd = UI:CreateChildWnd( self, UI.HudKills_SlotWnd, tostring( #self.allSlotWnds + 1 ) )
	slotWnd:SetLeft( self.firstSlotPos.x )

	table.insert( self.allSlotWnds, slotWnd )

	return slotWnd

end


--
function UI.HudKillsWnd:StartMoveAnimation()

	if self.animTime ~= -1 then
		sys.log( "UI.HudKillsWnd:StartMoveAnimation()[ERROR]: already animating" )
		return
	end

	if self.numRecords < 2 then
		sys.log( "UI.HudKillsWnd:StartMoveAnimation()[ERROR]: < 2 records" )
	end

	self.animTime = 0

	for recordIdx = 1, self.numRecords - 1 do
		local record = self.records[ recordIdx ]
		local y = self:GetRecordPos( record )
		record.dstY = y + self.dist_slots		
	end 	

end


--
function UI.HudKillsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateRecordsShowTime( dt_sys )
	self:UpdateMoveAnimation( dt_sys )
	self:RemoveExpiredRecords()
	self:CheckQueue()

end


--
function UI.HudKillsWnd:UpdateMoveAnimation( dt )

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
function UI.HudKillsWnd:RemoveExpiredRecords()

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
function UI.HudKillsWnd:SetRecordPos( record, y )

	record.slotWnd:SetTop( y )

	local alphaCf = self:GetAlphaForY( y )
	record.slotWnd:SetAlpha( alphaCf )	

end


--
function UI.HudKillsWnd:GetRecordPos( record )

	return record.slotWnd:GetTop()

end


-- returns 0..1
function UI.HudKillsWnd:GetAlphaForY( y )

	return UI:Clamp( ( y - self.zeroAlphaY ) / ( self.fullAlphaY - self.zeroAlphaY ), 0, 1 )

end


--
function UI.HudKillsWnd:CheckQueue()

	if not self.queue[ 1 ] then
		return
	end

	if self:CanAddRecordNow( true ) then
		local data = table.remove( self.queue, 1 )
		self:AddRecordInternal( data )
	end

end


--
function UI.HudKillsWnd:UpdateRecordsShowTime( dt )

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
function UI.HudKillsWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	-- резет нельзя вызывать в F_OnAfterShowOnScreen(). т.к. при любом переключении модов все элементы сначала отлинковываются;
	-- даже если в новом моде элемент по прежнему нужен

	if not self:IsOnScreen() then
		self:Reset()
	end

end


--
function UI.HudKillsWnd:MakeString( id, params )

	local str = ""

	if id == "kill" then
		str = self:MakeKillString( params )

	elseif id == "clanship_damage" then
		str = self:MakeClanshipDamageString( params )
	end

	return str

end


--
function UI.HudKillsWnd:MakeKillString( params )

	local str = "error"

	if type( params ) ~= "table" then
		sys.log( "UI.HudKillsWnd:MakeKillString()[ERROR]: invalid type of the 1-st parameter (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
		return str
	end

	if type( params.killer ) ~= "table" then
		sys.log( "UI.HudKillsWnd:MakeKillString()[ERROR]: invalid type of (\"params.killer\"); \"table\" expected, got \"%s\"", type( params.killer ) )	
		return str
	end

	if type( params.victim ) ~= "table" then
		sys.log( "UI.HudKillsWnd:MakeKillString()[ERROR]: invalid type of (\"params.victim\"); \"table\" expected, got \"%s\"", type( params.victim ) )	
		return str
	end

	if type( params.killer.playerId ) ~= "number" then
		sys.log( "UI.HudKillsWnd:MakeKillString()[ERROR]: invalid type of (\"params.killer.playerId\"); \"number\" expected, got \"%s\"", type( params.killer.playerId ) )
		return str
	end

	if type( params.victim.playerId ) ~= "number" then
		sys.log( "UI.HudKillsWnd:MakeKillString()[ERROR]: invalid type of (\"params.victim.playerId\"); \"number\" expected, got \"%s\"", type( params.victim.playerId ) )
		return str
	end

	if type( params.itemDefName ) ~= "string" then
		sys.log( "UI.HudKillsWnd:MakeKillString()[ERROR]: invalid type of (\"params.itemDefName\"); \"string\" expected, got \"%s\"", type( params.itemDefName ) )	
		return str
	end	

	local slotWnd = self.allSlotWnds[ 1 ]
	local baseColor = slotWnd and slotWnd:GetMsgColor()	or UI.TEXT_BASE_COLOR

	local bNeedKillerName	= false

	if params.itemDefName == "(crash)" then

		local killerParams = params.killer

		local bIsKillerShip = false

		if type( killerParams.isShip ) == "boolean" then
			bIsKillerShip = killerParams.isShip
		else
			sys.log( "UI.HudKillsWnd:MakeKillString()[ERROR]: invalid type of (\"params.killer.isShip\"); \"boolean\" expected, got \"%s\"", type( killerParams.isShip ) )	
		end

		local strId = bIsKillerShip and "kill_message_kill_crash" or "kill_message_self_crash"
		str = UI:GetStringByName( strId )

		bNeedKillerName = bIsKillerShip

	elseif params.itemDefName == "(suicide)" then
		str = UI:GetStringByName( "kill_message_kill_suicide" )

	else
    	str = UI:GetStringByName( "kill_message_kill" )
		bNeedKillerName = true
	end

	local victimNickName = UI:GetPlayerNameFromKillInfo( params, false, baseColor )

	local tSubst =
	{
		victim = victimNickName,
	}

	if bNeedKillerName then
		local killerNickName = UI:GetPlayerNameFromKillInfo( params, true, baseColor )
		tSubst.killer = killerNickName
	end

	str = string.gsub( str, "%$(.-)%$", tSubst )


	-- очки в битве дредноутов

    local victimTeam = -1

	if type( params.victim.team ) == "number" then
		victimTeam = params.victim.team
	else
		sys.log( "UI.HudKillsWnd:MakeKillString()[ERROR]: invalid type of (\"params.victim.team\"); \"number\" expected, got \"%s\"", type( params.victim.team ) )
	end

	local strClanshipPoints = self:MakeClanshipPointsString( params.clanShipPoints, true, victimTeam, baseColor )
	if strClanshipPoints ~= "" then
		str = string.format( "%s %s", str, strClanshipPoints )
	end

	return str

end


--
function UI.HudKillsWnd:MakeClanshipDamageString( params )

	local str = "unknown damage type"
	local bTotalStringColored = false


	if params.damageType == ai.ClanShipDamageType.MAIN_TURRET then

		str = UI:GetStringByName( "kill_message_clanship_MAIN_TURRET" )
		bTotalStringColored = true


	elseif params.damageType == ai.ClanShipDamageType.TORPEDO then

		str = UI:GetStringByName( "kill_message_clanship_TORPEDO" )
		bTotalStringColored = true


	elseif params.damageType == ai.ClanShipDamageType.BOMB then

		str = UI:GetStringByName( "kill_message_clanship_BOMB" )

		local strPlayer	= self:GetPlayerNameFromClanshipDamageInfo( params )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$player%$", strPlayer )

		if numSubst == 0 then
			sys.log( "UI.HudKillsWnd:MakeClanshipDamageString()[ERROR]: cannot find placeholder \"$player$\" in string \"kill_message_clanship_BOMB\"" )
			str = string.format( "[INVALID STRING] Player %s delivered the bomb", strPlayer )
		end


	elseif params.damageType == ai.ClanShipDamageType.MARINOS then

		str = UI:GetStringByName( "kill_message_clanship_MARINOS" )

		local strPlayer	= self:GetPlayerNameFromClanshipDamageInfo( params )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$player%$", strPlayer )

		if numSubst == 0 then
			sys.log( "UI.HudKillsWnd:MakeClanshipDamageString()[ERROR]: cannot find placeholder \"$player$\" in string \"kill_message_clanship_MARINOS\"" )
			str = string.format( "[INVALID STRING] Player %s troopers attack", strPlayer )
		end


	elseif params.damageType == ai.ClanShipDamageType.GENERATOR then

		str = UI:GetStringByName( "kill_message_clanship_GENERATOR" )
		bTotalStringColored = true


	else
		sys.log( "UI.HudKillsWnd:MakeClanshipDamageString()[ERROR]: unhandled damage type: %s", tostring( params.damageType ) )
	end


	-- очки

    local victimTeam = -1

	if type( params.victimTeam ) == "number" then
		victimTeam = params.victimTeam
	else
		sys.log( "UI.HudKillsWnd:MakeClanshipDamageString()[ERROR]: invalid type of (\"params.victimTeam\"); \"number\" expected, got \"%s\"", type( params.victimTeam ) )
	end

	local strClanshipPoints = ""

	if bTotalStringColored then

    	strClanshipPoints = self:MakeClanshipPointsString( params.clanShipPoints, false )

	else

    	local slotWnd = self.allSlotWnds[ 1 ]
    	local baseColor = slotWnd and slotWnd:GetMsgColor()	or UI.TEXT_BASE_COLOR

    	strClanshipPoints = self:MakeClanshipPointsString( params.clanShipPoints, true, victimTeam, baseColor )

	end

	if strClanshipPoints ~= "" then
		str = string.format( "%s %s", str, strClanshipPoints )
	end

	if bTotalStringColored then
		local color = self:GetDualColorByVictim( victimTeam )
		str = string.format( "%s%s", UI:Color2Str( color ), str )
	end

	return str

end


--
function UI.HudKillsWnd:GetPlayerNameFromClanshipDamageInfo( params )

	local nickName = "unknown"

	if type( params ) ~= "table" then
		sys.log( "UI.HudKillsWnd:GetPlayerNameFromClanshipDamageInfo()[ERROR]: invalid type of the 1-st parameter (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
		return nickName
	end

	if type( params.attackerPlayerIdx ) ~= "number" then
		sys.log( "UI.HudKillsWnd:GetPlayerNameFromClanshipDamageInfo()[ERROR]: invalid type of (\"params.attackerPlayerIdx\"); \"number\" expected, got \"%s\"", type( params.attackerPlayerIdx ) )
		return nickName
	end

	if params.attackerPlayerIdx ~= -1 then
		nickName = UI:MakePlayerNameById( params.attackerPlayerIdx, true, false )
    else
		sys.log( "UI.HudKillsWnd:GetPlayerNameFromClanshipDamageInfo()[ERROR]: invalid \"params.attackerPlayerIdx\"" )
	end


	-- определение цвета

    local team = -1

	if type( params.attackerTeam ) == "number" then
		team = params.attackerTeam
	else
		sys.log( "UI.HudKillsWnd:GetPlayerNameFromClanshipDamageInfo()[ERROR]: invalid type of (\"params.attackerTeam\"); \"number\" expected, got \"%s\"", type( playerParams.attackerTeam ) )
	end

	local slotWnd = self.allSlotWnds[ 1 ]
	local baseColor = slotWnd and slotWnd:GetMsgColor()	or UI.TEXT_BASE_COLOR

	local objColor = UI:GetKillMsgPlayerColor( params.attackerPlayerIdx, team )
	nickName = string.format( "%s%s%s", UI:Color2Str( objColor ), nickName, UI:Color2Str( baseColor ) )

	return nickName

end


--
function UI.HudKillsWnd:MakeClanshipPointsString( clanShipPoints, bWithColor, victimTeam, baseColor )

	local str = ""

	if clanShipPoints == nil then
		return str
	end

	if type( clanShipPoints ) ~= "number" then
		sys.log( "UI.HudKillsWnd:MakeClanshipPointsString()[ERROR]: invalid type of (\"params.clanShipPoints\"); \"number\" or \"nil\" expected, got \"%s\"", type( clanShipPoints ) )
		return str
	end

	if clanShipPoints == 0 then
		return str
	end


	str = UI:GetStringByName( "kill_message_clanship_points" )
	local strVal = UI:Num2StrSeparatedBy3( clanShipPoints )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$val%$", strVal )

	if numSubst == 0 then
		sys.log( "UI.HudKillsWnd:MakeClanshipPointsString()[ERROR]: cannot find placeholder \"$val$\" in string \"kill_message_clanship_points\"" )
		str = string.format( "(-%s)", strVal )
	end


	-- цвет

	if bWithColor then

    	local color = baseColor

    	if type( victimTeam ) == "number" then
        	color = self:GetDualColorByVictim( victimTeam )
    	else
    		sys.log( "UI.HudKillsWnd:MakeClanshipPointsString()[ERROR]: invalid type \"victimTeam\"; \"number\" expected, got \"%s\"", type( victimTeam ) )
    	end

    	str = string.format( "%s%s%s", UI:Color2Str( color ), str, UI:Color2Str( baseColor ) )

	end

	return str

end


--
function UI.HudKillsWnd:GetDualColorByVictim( victimTeam ) 

	local localPlayerId = UI.HudWnd.localPlayerId

	local myTeam = _G.CL_GetPlayerTeam( localPlayerId )
	if myTeam == 0 then
		myTeam = 1
	end

	local relationship = ai.Relationship:GetRelationship( victimTeam, myTeam )

	local colorScheme = -1

	if relationship == ai.RelatioshipType.FRIEND then
		colorScheme = UI.gameObjColorSchemes.ENEMY

	elseif relationship == ai.RelatioshipType.ENEMY then
		colorScheme = UI.gameObjColorSchemes.FRIEND

	elseif relationship == ai.RelatioshipType.NEUTRAL then
		colorScheme = UI.gameObjColorSchemes.NEUTRAL

	else
		sys.log( "UI.HudKillsWnd:GetDualColorByVictim()[ERROR]: unhandled relationship %d", relationship )
	end

	return UI:GameObjColorScheme2Color( colorScheme )

end


--
function UI.HudKillsWnd:MakePlayerJoinedString( params )

	local str = UI:GetStringByName( "hud_playerJoined" )
	local playerName = UI:MakePlayerNameById( params.playerId, true, false )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$player%$", playerName )
	if numSubst == 0 then
		sys.log( "UI.HudKillsWnd:MakePlayerJoinedString()[ERROR]: cannot find placeholder \"$player$\" in string \"hud_playerJoined\"" )
		str = string.format( "[INVALID STRING] Player joined: %s", playerName )
	end

	local playerTeam = _G.CL_GetPlayerTeam( params.playerId )

	local localPlayerId = _G.Game_LocalClientNum()

	local localPlayerTeam = _G.CL_GetPlayerTeam( localPlayerId )
	if localPlayerTeam == 0 then
		localPlayerTeam = 1
	end

	local colorScheme = ( playerTeam == localPlayerTeam ) and UI.gameObjColorSchemes.FRIEND or UI.gameObjColorSchemes.ENEMY
	local color = UI:GameObjColorScheme2Color( colorScheme )

	str = string.format( "%s%s", UI:Color2Str( color ), str )

	return str

end


--
function UI.HudKillsWnd:F_OnEventPlayerStatusChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if UI:IsPvpGameplay( _G.GetCurrentGameMode() ) then

		local playerId = iParam0

		local playerInfo = _G.GetPlayerInfo( playerId )
		if playerInfo and not playerInfo.isBot and playerInfo.status == _G.network.PlayerStatus.PS_ACTIVE and playerId ~= _G.Game_LocalClientNum() then

			local params	= { playerId = playerId }
			local text		= UI.HudKillsWnd:MakePlayerJoinedString( params )

        	local data =
        	{
        		params	= params,
        		text	= text,
        	}

        	self:AddRecord( data )

		end

	end

end


-- ---------------------------------------------------------------------------------
-- UI.HudKills_SlotWnd
-- ---------------------------------------------------------------------------------

UI.HudKills_SlotWnd = {}
local hes = UI.HudKills_SlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudKills_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudKills_SlotWnd",
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
				defName 			= "hud_kills_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name_2",
						layer		= "UI.HudKills_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
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
function UI.HudKills_SlotWnd:Init( data )

	self.data = data
	self:UpdateText()

end


--
function UI.HudKills_SlotWnd:Reset()

	self.data				= nil
	self.bTextAlphaDirty	= false

	self:SetText( "", self.layers.TEXT )

	self.mainEffect:SetAlpha( 255 )
	self.mainEffect:StartAnimationById( self.animIdIdle )

end


--
function UI.HudKills_SlotWnd:SetAlpha( alphaCf )

	self.mainEffect:SetAlpha( alphaCf * 255 )
	self.bTextAlphaDirty = true

end


--
function UI.HudKills_SlotWnd:PlayShowAnimation()

	self.mainEffect:StartAnimationById( self.animIdShow )
	self.bTextAlphaDirty = true

end


--
function UI.HudKills_SlotWnd:PlayHideAnimation()

	self.mainEffect:StartAnimationById( self.animIdHide )
	self.bTextAlphaDirty = true

end


--
function UI.HudKills_SlotWnd:IsPlayingAnimation()

	return self.mainEffect:IsAnimationPlaying()

end


--
function UI.HudKills_SlotWnd:GetMsgColor()

	return self:GetColor( self.layers.TEXT )

end


-- ------------------------------
-- const
-- ------------------------------

hes.layers =
{
	MAIN_EFFECT		= 0,
	TEXT			= 1,
}

hes.effectInfo =
{
	main =
	{
    	animIdle			= "idle",
    	animShow			= "show",
    	animHide			= "hide",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

hes.data			= nil
hes.mainEffect		= nil
hes.bTextAlphaDirty	= false
hes.animIdIdle		= -1
hes.animIdShow		= -1
hes.animIdHide		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudKills_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.animIdIdle		= self.mainEffect:GetAnimationId( self.effectInfo.main.animIdle )
	self.animIdShow		= self.mainEffect:GetAnimationId( self.effectInfo.main.animShow )
	self.animIdHide		= self.mainEffect:GetAnimationId( self.effectInfo.main.animHide )

end


--
function UI.HudKills_SlotWnd:F_OnEffectAnimationEnded( effect, animName )

	if animName == self.effectInfo.main.animShow then
		effect:StartAnimationById( self.animIdIdle )
		self.bTextAlphaDirty = true
	end

end


--
function UI.HudKills_SlotWnd:UpdateText()

	local alpha = UI:GetAlpha( self:GetColor( self.layers.TEXT ) )

	local strWithAlpha = _G.SetInternalTextAlpha( self.data.text, alpha )
	if strWithAlpha then
		self:SetText( strWithAlpha, self.layers.TEXT )
	else
		self:SetText( self.data.text, self.layers.TEXT )
	end

	self.bTextAlphaDirty = false

end


--
function UI.HudKills_SlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local bNeedUpdateTextAlpha = self.bTextAlphaDirty or self:IsAnimating()
	if bNeedUpdateTextAlpha then
		self:UpdateTextAlpha()
	end

end


--
function UI.HudKills_SlotWnd:UpdateTextAlpha()

	local alpha = UI:GetAlpha( self:GetColor( self.layers.TEXT ) )

	local strWithAlpha = _G.SetInternalTextAlpha( self.data.text, alpha )
	if strWithAlpha then
		self:SetText( strWithAlpha, self.layers.TEXT )
	end

	self.bTextAlphaDirty = false

end


--
function UI.HudKills_SlotWnd:IsAnimating()

	local curAnimationId = self.mainEffect:GetCurAnimationId()
	return curAnimationId == self.animIdShow or curAnimationId == self.animIdHide

end