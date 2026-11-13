-- ----------------------------------------------------------------------------
--
-- Workfile: hudincomingstates.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudIncomingStates = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HudIncomingStates.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "HudIncomingStates",
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
				defName 			= "hud_incomingStates",
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

		-- RECORDS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.HudIncomingStates:OnPlayerGotDamage( damageVal, attackerEntityId, attackerPlayerIdx, damageFlags, worldPos )

	if not self:IsOnScreen() then
		return
	end

	if not self.bAllowed then
		return
	end

	self:AddDamageRecord( damageVal, damageFlags )

end


--
function UI.HudIncomingStates:OnPlayerGotHeal( healVal, healerEntityId, healerPlayerIdx )

	if not self:IsOnScreen() then
		return
	end

	if not self.bAllowed then
		return
	end

	self:AddHealRecord( healVal )

end


--
function UI.HudIncomingStates:OnApplyAura( spaceShipEntity, auraEntityId )

	if not self:IsOnScreen() then
		return
	end

	if not self.bAllowed then
		return
	end

	self:TryAddAuraRecord( auraEntityId )
	
end


--
function UI.HudIncomingStates:OnShowIncomingStatesOptionChanged()

	if not self:IsOnScreen() then
		return
	end	

	self:UpdateAllowed()

	if not self.bAllowed then
		self:Reset()
	end

end


-- ---------------------------------
-- UI.HudIncomingStates.RecordsQueue
-- ---------------------------------

--
UI.HudIncomingStates.RecordsQueue = {}


--
UI.HudIncomingStates.RecordsQueue.items		= {}
UI.HudIncomingStates.RecordsQueue.firstIdx	= -1
UI.HudIncomingStates.RecordsQueue.numItems	= 0


--
function UI.HudIncomingStates.RecordsQueue:PushBack( item )

	local idx = self.firstIdx == -1 and 1 or self.firstIdx + self.numItems

	self.items[ idx ] = item

	self.numItems = self.numItems + 1

	if self.firstIdx == -1 then
		self.firstIdx = idx
	end	

end


--
function UI.HudIncomingStates.RecordsQueue:PopFront()

	if self.firstIdx == -1 then
		return nil
	end

	local item = self.items[ self.firstIdx ]
	self.items[ self.firstIdx ] = nil

	self.firstIdx = self.firstIdx + 1
	self.numItems = self.numItems - 1

	if self.numItems == 0 then
		self.firstIdx = -1
	end	

	return item

end


--
function UI.HudIncomingStates.RecordsQueue:GetCount()

	return self.numItems

end


--
function UI.HudIncomingStates.RecordsQueue:Get( idx )

	if self.firstIdx == -1 then
		sys.log( "UI.HudIncomingStates.RecordsQueue()[ERROR]: empty container" )
		return nil
	end

	if idx < 1 or idx > self.numItems then
		sys.log( "UI.HudIncomingStates.RecordsQueue()[ERROR]: invalid idx" )
		return nil
	end

	return self.items[ idx + self.firstIdx - 1 ]

end


--
function UI.HudIncomingStates.RecordsQueue:GetFront()

	return self:Get( 1 )

end


--
function UI.HudIncomingStates.RecordsQueue:Clear()

	self.items		= {}
	self.firstIdx	= -1
	self.numItems	= 0

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HudIncomingStates.layers =
{
    MAIN_EFFECT	= 0,
    RECORDS		= 1,
}

UI.HudIncomingStates.effectInfo =
{
	main =
	{
		fontRegularLocator	= "text_1",
		fontCritLocator		= "text_2",
		colorHealLocator	= "health",
		colorBuffLocator	= "aura_positive",
		colorDebuffLocator	= "aura_negative",
		centerLocator		= "center",
		firstStringLocator	= "text_1",
		secondStringLocator	= "text_2",
		alphaAreaLocator	= "in_alpha",
	},

	damageColors =
	{
		effectName	= "hud_objectsMark_insideShip_damageRecords",

		colorLocators =
		{
			GENERIC	= "text",
			KINETIC	= "color_2",
			EMP		= "color_3",
			THERMAL	= "color_1",
		}
	}
}

UI.HudIncomingStates.SPEED = UI:YTo1024x768( 100, { x = 1280, y = 720 } )	-- скорость скроллирования (пикс/сек)

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HudIncomingStates.hFontRegular		= 0
UI.HudIncomingStates.hFontCrit			= 0
UI.HudIncomingStates.fontRegularHeight	= 0
UI.HudIncomingStates.fontCritHeight		= 0
UI.HudIncomingStates.alphaAreaHight		= 0
UI.HudIncomingStates.alphaAreaY			= 0
UI.HudIncomingStates.radius_abs			= 0
UI.HudIncomingStates.centerPos			= Vec2( 0, 0 )
UI.HudIncomingStates.minRecordsSpace	= 0
UI.HudIncomingStates.colorHeal			= UI.WHITE_COLOR
UI.HudIncomingStates.colorBuff			= UI.WHITE_COLOR
UI.HudIncomingStates.colorDebuff		= UI.WHITE_COLOR
UI.HudIncomingStates.colorsDamage		= {}
UI.HudIncomingStates.records			= UI.HudIncomingStates.RecordsQueue
UI.HudIncomingStates.firstRecordPos		= Vec2( 0, 0 )
UI.HudIncomingStates.selfHeight			= 0
UI.HudIncomingStates.bAllowed			= UI.hudOptionsDefaultVals.showIncomingStates

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HudIncomingStates:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.selfHeight = self:GetHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ) 
	if mainEffect then

    	local fontNameRegular = mainEffect:GetObjFontName( self.effectInfo.main.fontRegularLocator )
    	self.hFontRegular = _G.ObtainFont( fontNameRegular )

    	local fontNameCrit = mainEffect:GetObjFontName( self.effectInfo.main.fontCritLocator )
    	self.hFontCrit = _G.ObtainFont( fontNameCrit )

		self.fontRegularHeight	= _G.GetFontLineHeight( self.hFontRegular )
		self.fontCritHeight		= _G.GetFontLineHeight( self.hFontCrit )

    	self.colorHeal		= mainEffect:GetObjColor( self.effectInfo.main.colorHealLocator )
    	self.colorBuff		= mainEffect:GetObjColor( self.effectInfo.main.colorBuffLocator )
    	self.colorDebuff	= mainEffect:GetObjColor( self.effectInfo.main.colorDebuffLocator )	

		self.alphaAreaHight = mainEffect:GetObjSize( self.effectInfo.main.alphaAreaLocator ).y
		self.alphaAreaY		= self.selfHeight - self.alphaAreaHight

		local firstStringPos = mainEffect:GetObjPos( self.effectInfo.main.firstStringLocator )
		local secondStringPos = mainEffect:GetObjPos( self.effectInfo.main.secondStringLocator )
		local firstStringSize = mainEffect:GetObjSize( self.effectInfo.main.firstStringLocator )

		self.minRecordsSpace = secondStringPos.y - ( firstStringPos.y + firstStringSize.y )

		self.centerPos = mainEffect:GetObjPos( self.effectInfo.main.centerLocator )

	end

	self:UpdateAbsVals()

end


--
function UI.HudIncomingStates:InitDamageColors()

	local colorEffect = _G.UI_SpawnEffect( self.effectInfo.damageColors.effectName, self:GetUiHandle() )
	if colorEffect then

		for damageTypeName, locatorName in pairs( self.effectInfo.damageColors.colorLocators ) do

			local damageType = ai.DamageType[ damageTypeName ]
			if damageType then
				self.colorsDamage[ damageType ] = colorEffect:GetObjColor( locatorName )
			else
				sys.log( "UI.HudIncomingStates:InitDamageColors()[ERROR]: invalid damage type name: %s", damageTypeName )
			end

		end

		_G.UI_DestroyEffect( colorEffect )

	end

end


--
function UI.HudIncomingStates:Reset()

	self.records:Clear()
	self:SetLayerVisible( false, self.layers.RECORDS )

end


--
function UI.HudIncomingStates:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:InitDamageColors()
	self:UpdateAllowed()

	self:Reset()

end


--
function UI.HudIncomingStates:AddDamageRecord( val, damageFlags )

	local damageType, bCrit = UI:DamageFlags2DamageType( damageFlags )

	local text	= tostring( UI:RoundClampOne( val ) )
	local hFont	= bCrit and self.hFontCrit or self.hFontRegular
	local color	= self.colorsDamage[ damageType ] or UI.WHITE_COLOR

	self:AddRecord( text, hFont, color )

end


--
function UI.HudIncomingStates:AddHealRecord( val )

	local text	= tostring( UI:RoundClampOne( val ) )
	local hFont	= self.hFontRegular
	local color	= self.colorHeal

	self:AddRecord( text, hFont, color )

end


--
function UI.HudIncomingStates:TryAddAuraRecord( auraEntityId )

	local auraEnt = _G.Entities[ auraEntityId ]
	if auraEnt then

		local spellName = auraEnt:GetSpellDefName()

		local spellDef = UI:GetSpellDef( spellName )
		if spellDef then

			local auraIdx	= auraEnt:GetAdditionalAuraIdx()
			local auraId	= UI:GetSpellAura( spellName, auraIdx )
			
			if UI:IsAuraVisible( spellName, auraIdx ) and spellDef.disable_aura_duration ~= true--[[#0107795(0516582)]] then

				-- баф/дебаф

				local bIsBuff = false

				if auraIdx == 0 then
					bIsBuff = spellDef.isBuff
				else
					bIsBuff = spellDef.additional_auras and spellDef.additional_auras[ auraIdx ] and spellDef.additional_auras[ auraIdx ].isBuff
				end

				if type( bIsBuff ) ~= "boolean" then
					bIsBuff = false
					sys.log( "UI.HudIncomingStates:TryAddAuraRecord()[ERROR]: invalid type of the \"isBuff\" for spell %s auraIdx %d; \"boolean\" expected, got \"%s\"", spellName, auraIdx, type( spellDef.isBuff ) )
				end

				-- имя

				local auraName = UI:SpellAura2Str( auraId )

				-- кастер

				local casterName = ""		

				local casterPlayerIdx = auraEnt:GetCasterPlayerIdx()
				if casterPlayerIdx ~= -1 then			
					casterName = UI:MakePlayerNameById( casterPlayerIdx, true, false )
				else
					local casterEnt = auraEnt:GetCaster()
					if casterEnt then
						casterName = UI:GetEntityLocalizedName( casterEnt, false )
					end
				end
			
				local text	= string.format( "%s%s%s", auraName, casterName ~= "" and " " or "", casterName ) 		
				local hFont	= self.hFontRegular
				local color	= bIsBuff and self.colorBuff or self.colorDebuff

				self:AddRecord( text, hFont, color )
				
			end

		else
			sys.log( "UI.HudIncomingStates:TryAddAuraRecord()[ERROR]: cannot find _G.Spell[%s]", spellName )
		end

	else
		sys.log( "UI.HudIncomingStates:TryAddAuraRecord()[ERROR]: cannot find aura entity with id %s", tostring( auraEntityId ) )
	end

end


--
function UI.HudIncomingStates:AddRecord( text, hFont, color )

	local record = {}

	record.text		= text
	record.hFont	= hFont
	record.height	= hFont == self.hFontCrit and self.fontCritHeight or self.fontRegularHeight
	record.color	= color
	record.alpha	= 255	
	record.x		= self.firstRecordPos.x
	record.y		= self.firstRecordPos.y
	record.bNew		= true

	self.records:PushBack( record )

	self:SetLayerVisible( true, self.layers.RECORDS )

end


--
function UI.HudIncomingStates:F_OnNewFrame( hSender, dt_sys, dt_game )

	if not self.bAllowed then
		return
	end

	self:UpdateRecords( dt_sys )

end


--
function UI.HudIncomingStates:UpdateRecords( dt )

    local numRecords = self.records:GetCount()
	if numRecords == 0 then
		return
	end

	local deltaDist			= dt * self.SPEED
	local firstPopRecordIdx	= -1

	for recordIdx = numRecords, 1, - 1 do

		local record = self.records:Get( recordIdx )

		if not record.bNew then
			record.y = record.y + deltaDist
		end

		if recordIdx < numRecords then
			local prevRecord = self.records:Get( recordIdx + 1 )
			record.y = math.max( record.y, prevRecord.y + prevRecord.height + self.minRecordsSpace )
		end

		if record.y + record.height <= self.selfHeight then

			local angle = -math.asin( UI:YToAbs( self.centerPos.y - record.y ) / self.radius_abs )
			record.x = UI:XToRel( self.radius_abs * math.cos( angle ) ) + self.centerPos.x

            record.alpha = 255
			if record.y > self.alphaAreaY then
				record.alpha = UI:Lerp( 255, 0, ( record.y - self.alphaAreaY ) / ( self.alphaAreaHight - record.height ) )
				record.alpha = UI:Clamp( record.alpha, 0, 255 )
			end		

		else

			firstPopRecordIdx = recordIdx
			break

		end

		record.bNew = false

	end

	if firstPopRecordIdx ~= -1 then

		for i = 1, firstPopRecordIdx do
			self.records:PopFront()
		end

    	if self.records:GetCount() == 0 then
    		self:SetLayerVisible( false, self.layers.RECORDS )
    	end

	end

end


--
function UI.HudIncomingStates:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.RECORDS then
		self:DrawRecords()
	end

end


--
function UI.HudIncomingStates:DrawRecords()

	local numRecords = self.records:GetCount()
	if numRecords == 0 then
		return
	end

	UI.drawer:EndUiDrawing()
	
	local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
	_G.SetTextPixelSnapping( false, false )

	for recordIdx = 1, numRecords do

		local record = self.records:Get( recordIdx )

		local rect = self:ToScreen( UI:Quat( record.x, record.y, 1000000, record.height ) )
		local color = UI:SetAlpha( record.color, record.alpha )

		_G.UI_DrawText(
   			record.text,
   			record.hFont,
   			rect,
			color,
			0,
			FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			rect
		)
	end
	
	_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )
	UI.drawer:BeginUiDrawing()

end


--
function UI.HudIncomingStates:UpdateAbsVals()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.radius_abs = UI:V2Length( Vec2( 0, 0 ) - UI:PtToAbs( self.centerPos ) )
	end

end


--
function UI.HudIncomingStates:F_OnResetDevice()

	self:OnResetDevice()
	self:UpdateAbsVals()

end


--
function UI.HudIncomingStates:UpdateAllowed()

	self.bAllowed = UI.Options:GetHudOptionVal( "showIncomingStates" )

end