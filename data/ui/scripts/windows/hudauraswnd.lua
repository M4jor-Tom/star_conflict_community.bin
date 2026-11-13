-- ------------------------------------------------------------------
-- UI.HudAurasWnd
-- ------------------------------------------------------------------

UI.HudAurasWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudAurasWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "HudAurasWnd",
		isPrototype	= true,
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

-- called from .cpp code 
function UI.HudAurasWnd:OnApplyAura( spaceShipEntity, auraEntityId )

	if self:IsOnScreen() then
		self:FullUpdate()	
	end
	
end


-- called from .cpp code 
function UI.HudAurasWnd:OnCancelAura( spaceShipEntity, auraEntityId )

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.HudAurasWnd:OnHoldAura( spaceShipEntity, auraEntityId )

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end



--
function UI.HudAurasWnd:OnDropAura( spaceShipEntity, auraEntityId )

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.HudAurasWnd:OnAuraStageChanged( auraEntityId )

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.HudAurasWnd:OnChangeStatus()

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudAurasWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.HudAurasWnd.btnPrototypeName	= "HudAuras_SlotWnd"
UI.HudAurasWnd.MAX_SLOTS		= 12
UI.HudAurasWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.HudAurasWnd.auraTypes =
{
	AURA			= 1,
	ACCOUNT_AURA	= 2,
	STATUS			= 3,
}

UI.HudAurasWnd.bBuffs	= false

-- ------------------------------
-- vars
-- ------------------------------

UI.HudAurasWnd.shipId	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudAurasWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:FullUpdate()

end


--
function UI.HudAurasWnd:Reset()

	self:Clear()
	self.shipId = -1

end


--
function UI.HudAurasWnd:FullUpdate()

	self:Reset()

	local myShip = UI.HudWnd.myShip
	self.shipId = myShip and myShip:GetId() or -1

	if not myShip then
		return
	end

	local datas = {}

	-- аккаунт-ауры

	for auraIdx = 0, myShip:GetAccountAurasNum() - 1 do

		local auraName = myShip:GetAccountAuraName( auraIdx )
		local auraDef = _G.AccountAura and _G.AccountAura[ auraName ]

		if auraDef then

			if auraDef.hud_visible then    			

				local isBuff = auraDef.isBuff or false				
				if isBuff == self.bBuffs then

					local data = {}
					data.auraType		= self.auraTypes.ACCOUNT_AURA
					data.auraName		= auraName
					data.bShowTimeLeft	= false
					data.isBuff			= isBuff
					
					table.insert( datas, data )
					
				end

			end

		else
			sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: cannot find def for account aura %s", auraName )
		end			

	end


	-- обычные ауры

	-- ауры, которые действуют на игрока

	for auraIdx = 0, myShip:GetAppliedAuraCount() - 1 do

		local auraEnt = myShip:GetAppliedAura( auraIdx )
		if auraEnt then

    		local spellName = auraEnt:GetSpellDefName()
    		local spellDef = UI:GetSpellDef( spellName )

			if spellDef then
			
				local auraIdx = auraEnt:GetAdditionalAuraIdx()
				
				if UI:IsAuraVisible( spellName, auraIdx ) and not( UI:IsAuraDisableZeroStage( spellName, auraIdx ) and auraEnt:GetAuraStage() == 0 )--[[#0107795(0516582)]] then

    				local isBuff = false
    				if auraIdx == 0 then
    					isBuff = spellDef.isBuff
    				else
    					isBuff = spellDef.additional_auras and spellDef.additional_auras[ auraIdx ] and spellDef.additional_auras[ auraIdx ].isBuff
    				end

    				if isBuff == nil then
    					isBuff = false
    				end
					
					if isBuff == self.bBuffs then

						local data = {}
						data.auraType		= self.auraTypes.AURA
						data.entId			= auraEnt:GetId()				
						data.ent			= auraEnt
						data.spellName		= spellName
						data.bShowTimeLeft	= auraEnt:GetAuraDuration() > 0 and not UI:IsAuraDisableDuration( spellName, auraIdx )	--[[#0107795(0516582)]]
						data.bShowStage_1	= not UI:IsAuraDisableZeroStage( spellName, auraIdx )
						data.isBuff			= isBuff
						data.moduleDefName	= auraEnt:GetItemDefName() or ""
						data.auraIdx		= auraIdx
						data.auraId			= UI:GetSpellAura( spellName, auraIdx )
						data.bHold			= false
						
						table.insert( datas, data )
						
					end

				end

			else
				sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: cannot find def for spell %s", spellName )
			end

		else
			sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: no applied aura entity for ship %s auraIdx %d", myShip:GetName(), auraIdx )
		end

	end	


	-- ауры, которые инициировал игрок

	for auraIdx = 0, myShip:GetHoldAuraCount() - 1 do

		local auraEnt = myShip:GetHoldAura( auraIdx )
		if auraEnt then

    		local spellName = auraEnt:GetSpellDefName()
    		local spellDef = UI:GetSpellDef( spellName )

			if spellDef then
			
				local auraIdx = auraEnt:GetAdditionalAuraIdx()

				if UI:IsAuraVisibleForHolder( spellName, auraIdx ) and not( UI:IsAuraDisableZeroStage( spellName, auraIdx ) and auraEnt:GetAuraStage() == 0 )--[[#0107795(0516582)]] then

    				local isBuff = false
    				if auraIdx == 0 then
    					isBuff = spellDef.isBuff_holder
    				else
    					isBuff = spellDef.additional_auras and spellDef.additional_auras[ auraIdx ] and spellDef.additional_auras[ auraIdx ].isBuff_holder
    				end

    				if isBuff == nil then
    					isBuff = false
    				end
					
					if isBuff == self.bBuffs then

						local data = {}
						data.auraType		= self.auraTypes.AURA
						data.entId			= auraEnt:GetId()
						data.ent			= auraEnt
						data.spellName		= spellName
						data.bShowTimeLeft	= auraEnt:GetAuraDuration() > 0 and not UI:IsAuraDisableDuration( spellName, auraIdx )	-- #0107795(0516582)
						data.bShowStage_1	= not UI:IsAuraDisableZeroStage( spellName, auraIdx )
						data.isBuff			= isBuff
						data.moduleDefName	= auraEnt:GetItemDefName() or ""
						data.auraIdx		= auraIdx
						data.auraId			= UI:GetSpellAura( spellName, auraIdx )
						data.bHold			= true
						
						table.insert( datas, data )
						
					end

				end

			else
				sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: cannot find def for spell %s", spellName )
			end

		else
			sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: no applied aura entity for ship %s auraIdx %d", myShip:GetName(), auraIdx )
		end

	end	


	-- статусы

	for statusIdx = 0, _G.CL_GetPlayerStatusNum() - 1 do

		local statusData = _G.CL_GetPlayerStatus( statusIdx )
		if type( statusData ) == "table" then

			if type( statusData.type ) == "number" then

    			if statusData.type == ai.StatusItemType.MODULE_COOLDOWN
					or statusData.type == ai.StatusItemType.TALENT_COOLDOWN
					or statusData.type == ai.StatusItemType.SENTINEL
					or statusData.type == ai.StatusItemType.AURA_COOLDOWN 
					or statusData.type == ai.StatusItemType.VITALPOINT_ATTACKER
					or statusData.type == ai.StatusItemType.VITALPOINT_DEFENDER
					or statusData.type == ai.StatusItemType.UNLIM_PVE_BUFF
					or statusData.type == ai.StatusItemType.HID_IN_FOG
					or statusData.type == ai.StatusItemType.TELEPORT_GATE_STATUS
					or statusData.type == ai.StatusItemType.RSS_RESPAWN_COOLDOWN
					or statusData.type == ai.StatusItemType.ROPE_TTL then

        			local isBuff = false

					if statusData.type == ai.StatusItemType.MODULE_COOLDOWN
						or statusData.type == ai.StatusItemType.TALENT_COOLDOWN
						or statusData.type == ai.StatusItemType.AURA_COOLDOWN
						or statusData.type == ai.StatusItemType.TELEPORT_GATE_STATUS
						or statusData.type == ai.StatusItemType.RSS_RESPAWN_COOLDOWN then
							isBuff = false
							
					elseif statusData.type == ai.StatusItemType.SENTINEL
						or statusData.type == ai.StatusItemType.VITALPOINT_ATTACKER
						or statusData.type == ai.StatusItemType.VITALPOINT_DEFENDER
						or statusData.type == ai.StatusItemType.UNLIM_PVE_BUFF
						or statusData.type == ai.StatusItemType.HID_IN_FOG
						or statusData.type == ai.StatusItemType.ROPE_TTL then
							isBuff = true
							
					else
						sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: unhandled status type: %d (%s)", statusData.type, UI:Val2Key( ai.StatusItemType, statusData.type ) )
					end	
					
					if isBuff == self.bBuffs then

						local data = {}
						data.auraType		= self.auraTypes.STATUS
						data.statusData		= statusData
						data.isBuff			= isBuff
						data.statusIdx		= statusIdx
						
						data.bShowTimeLeft =
							statusData.type ~= ai.StatusItemType.VITALPOINT_ATTACKER
							and statusData.type ~= ai.StatusItemType.VITALPOINT_DEFENDER
							and statusData.type ~= ai.StatusItemType.UNLIM_PVE_BUFF
							and statusData.type ~= ai.StatusItemType.HID_IN_FOG

						if statusData.type == ai.StatusItemType.MODULE_COOLDOWN then

							data.moduleDefName = ""

							if type( statusData.moduleSlot ) == "number" then

								local module = myShip:GetModule( statusData.moduleSlot )
								if module then
									data.moduleDefName = module:GetDefName()
								else
									sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: no module in slot %d for status MODULE_COOLDOWN", statusData.moduleSlot )
								end						

							else
								sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"moduleSlot\" for status MODULE_COOLDOWN; \"number\" expected, got \"%s\"", type( statusData.moduleSlot ) )
							end

						elseif statusData.type == ai.StatusItemType.TALENT_COOLDOWN then

							data.talentName = ""

							if type( statusData.talent ) == "string" then
								data.talentName = statusData.talent
							else
								sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"talent\" for status TALENT_COOLDOWN; \"string\" expected, got \"%s\"", type( statusData.talent ) )
							end

						elseif statusData.type == ai.StatusItemType.AURA_COOLDOWN then

							data.moduleDefName		= ""
							data.casterPlayerIdx	= -1
							data.casterDefName		= ""

							if type( statusData.sourceModuleDefName ) == "string" then
								data.moduleDefName = statusData.sourceModuleDefName
							else
								sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"sourceModuleDefName\" for status AURA_COOLDOWN; \"string\" expected, got \"%s\"", type( statusData.sourceModuleDefName ) )
							end

							if statusData.sourceIdx ~= nil then
								if type( statusData.sourceIdx ) == "number" then
									data.casterPlayerIdx = statusData.sourceIdx
								else
									sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"sourceIdx\" for status AURA_COOLDOWN; \"number\" or \"nil\" expected, got \"%s\"", type( statusData.sourceIdx ) )
								end
							end

							if statusData.sourceDefName ~= nil then
								if type( statusData.sourceDefName ) == "string" then
									data.casterDefName = statusData.sourceDefName
								else
									sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"sourceDefName\" for status AURA_COOLDOWN; \"string\" or \"nil\" expected, got \"%s\"", type( statusData.sourceDefName ) )
								end
							end

							if sourceIdx ~= -1 and sourceDefName ~= "" then
								sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: more than one source is specified for status AURA_COOLDOWN" )
								sourceDefName = ""
							end

						elseif statusData.type == ai.StatusItemType.VITALPOINT_ATTACKER or statusData.type == ai.StatusItemType.VITALPOINT_DEFENDER then

							data.vpDefName = ""

							if type( statusData.sourceDefName ) == "string" then
								data.vpDefName = statusData.sourceDefName
							else
								sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"sourceDefName\" for status %s; \"string\" expected, got \"%s\"", UI:Val2Key( ai.StatusItemType, statusData.type ), type( statusData.sourceDefName ) )
							end
							
						elseif statusData.type == ai.StatusItemType.UNLIM_PVE_BUFF then
						
							data.buffId		= -1
							data.hpMod		= 0
							data.shieldMod	= 0
							
							if type( statusData.buffId ) == "number" then
							
								if statusData.buffId == ai.ScalableBuffId.SBI_UNLIM_PVE_PLAYER_1 then
									data.buffId = 1
								elseif statusData.buffId == ai.ScalableBuffId.SBI_UNLIM_PVE_PLAYER_2 then
									data.buffId = 2
								else
									sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: unhanldel buffId (%d)", statusData.buffId )
								end
								
							else
								sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"buffId\" for status %s; \"number\" expected, got \"%s\"", UI:Val2Key( ai.StatusItemType, statusData.type ), type( statusData.buffId ) )
							end
						
							if type( statusData.hpMod ) == "number" then
								data.hpMod = statusData.hpMod
							else
								sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"hpMod\" for status %s; \"number\" expected, got \"%s\"", UI:Val2Key( ai.StatusItemType, statusData.type ), type( statusData.hpMod ) )
							end
							
							if type( statusData.shieldMod ) == "number" then
								data.shieldMod = statusData.shieldMod
							else
								sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"shieldMod\" for status %s; \"number\" expected, got \"%s\"", UI:Val2Key( ai.StatusItemType, statusData.type ), type( statusData.shieldMod ) )
							end

						end

						table.insert( datas, data )
						
					end

				else
					sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: unhandled status type: %d (%s)", statusData.type, UI:Val2Key( ai.StatusItemType, statusData.type ) )
				end

			else
				sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid type of field \"type\" for status; \"number\" expected, got \"%s\"", type( statusData.type ) )
			end

		else
			sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: invalid return value from _G.CL_GetPlayerStatus(); \"table\" expected, got \"%s\"", type( statusData ) )
		end

	end


	for idx, data in ipairs( datas ) do

		if self:GetNumRecords() < self.MAX_SLOTS then
			self:AddRecord( data )
		else
			sys.log( "UI.HudAurasWnd:FullUpdate()[ERROR]: cannot show aura; max number of slots reached" )
		end

	end

end


--
function UI.HudAurasWnd:F_OnNewFrame( hSender, dt_sys, dt_game )	

	local myShip = UI.HudWnd.myShip
	local shipId = myShip and myShip:GetId() or -1

	if shipId ~= self.shipId then

		if shipId == -1 then
			self:Reset()
		else
			self:FullUpdate()
		end

	end

end

-- ------------------------------------------------------------------
-- UI.HudAuras_SlotWnd
-- ------------------------------------------------------------------

UI.HudAuras_SlotWnd = {}
local as = UI.HudAuras_SlotWnd

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.HudAuras_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "HudAuras_SlotWnd",
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
				defName 			= "hud_auras_slot",
	
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
	
					{
						objName		= "title",
						layer		= "UI.HudAuras_SlotWnd.layers.TIME_LEFT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "title5",
						layer		= "UI.HudAuras_SlotWnd.layers.STACKS",
						animParams	= UI.EffectAnimParams.ALL,
					},
		
					{
						objName		= "buff_icon",
						layer		= "UI.HudAuras_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "agen_ico",
						layer		= "UI.HudAuras_SlotWnd.layers.AUTOGEN_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bg",
						layer		= "UI.HudAuras_SlotWnd.layers.INFLUENCE_COLOR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- INFLUENCE_COLOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
	
			effects =
			{{
				defName 			= "hud_auras_slot_influenceColor",
				defaultAnimation	= "friend",
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
	
			effects =
			{{
				defName 			= "hud_auras_slot_ico",
			}}
		},
		
		-- AUTOGEN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
	
			effects =
			{{
				defName 			= "hud_auras_slot_autogen",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "icon_1",
						layer		= "UI.HudAuras_SlotWnd.layers.AUTOGEN_AFFIX_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "icon_2",
						layer		= "UI.HudAuras_SlotWnd.layers.AUTOGEN_AFFIX_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- AUTOGEN_AFFIX_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
	
			effects =
			{{
				defName				= "hud_auras_slot_autogen_affix1",
				defaultAnimation	= "idle",
			}}
		},
		
		-- AUTOGEN_AFFIX_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
	
			effects =
			{{
				defName				= "hud_auras_slot_autogen_affix2",
				defaultAnimation	= "idle",
			}}
		},

		-- TIME_LEFT
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},
		
		-- STACKS
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.HudAuras_SlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.HudAuras_SlotWnd:HandleTooltip( targetWnd, tooltipData )

	if targetWnd ~= self then
		return false
	end

	local data = self:GetRecordData()
	self:UpdateTooltipChangable( data )

	local hTooltipWnd = self:UpdateTooltipWindow( true )

	return true, hTooltipWnd

end


--
function UI.HudAuras_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )
	
	self:SetLayerVisible( false, self.layers.INFLUENCE_COLOR_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.AUTOGEN_EFFECT )
	self:SetLayerVisible( false, self.layers.AUTOGEN_AFFIX_1_EFFECT )
	self:SetLayerVisible( false, self.layers.AUTOGEN_AFFIX_2_EFFECT )
	self:SetText( "", self.layers.TIME_LEFT )
	self:SetText( "", self.layers.STACKS )

	self.tooltipData		= nil
	self.strTooltipBase		= ""
	self.timeLeft			= -1
	self.numStacks			= -1
	self.tooltip_numStacks	= nil
	self.tooltip_timeLeft	= nil
	self.tooltip_auraParam	= nil
	
end


-- -------------------------------------
-- const
-- -------------------------------------

as.layers =
{
	MAIN_EFFECT				= 0,
	INFLUENCE_COLOR_EFFECT	= 1,
	ICO_EFFECT				= 2,
	AUTOGEN_EFFECT			= 3,
	AUTOGEN_AFFIX_1_EFFECT	= 4,
	AUTOGEN_AFFIX_2_EFFECT	= 5,
	TIME_LEFT				= 6,
	STACKS					= 7,
}

as.effectInfo =
{
	main =
	{
		animBuff	= "friend",
		animDebuff	= "enemy",
	},

	ico =
	{
		animRegular	= "color",
		animTalent	= "orang",
	},
	
	autogen =
	{
		icoSpriteName	= "ico",
	},
	
	autogenAffix =
	{
		icoSpriteName	= "ico",
	},
}

as.strTimeLeftLabel = UI:GetStringByName( "auraTimeLeft" )
as.strStacksLabel	= UI:GetStringByName( "auraTooltip_stacks" )

-- -------------------------------------
-- vars
-- -------------------------------------

as.parent				= nil
as.tooltipData			= nil
as.strTooltipBase		= ""
as.timeLeft				= -1
as.numStacks			= -1
as.tooltip_numStacks	= nil
as.tooltip_timeLeft		= nil
as.tooltip_auraParam	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.HudAuras_SlotWnd:UpdateForData( data, bAnimated )

	self:UpdateMainAnimation( data )
	self:UpdateIco( data )
	self:UpdateTooltipBase( data )
	self:UpdateTimeLeft( data )
	self:UpdateStacks( data )

end


--
function UI.HudAuras_SlotWnd:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local anim = data.isBuff and self.effectInfo.main.animBuff or self.effectInfo.main.animDebuff
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.HudAuras_SlotWnd:UpdateIco( data )

	self:SetLayerVisible( true, self.layers.ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.INFLUENCE_COLOR_EFFECT )
	self:SetLayerVisible( false, self.layers.AUTOGEN_EFFECT )
	self:SetLayerVisible( false, self.layers.AUTOGEN_AFFIX_1_EFFECT )
	self:SetLayerVisible( false, self.layers.AUTOGEN_AFFIX_2_EFFECT )

	if data.auraType == UI.HudAurasWnd.auraTypes.AURA then

    	local def = UI:GetSpellDef( data.spellName )
		local icoInfo = nil

		if data.auraIdx == 0 then

			icoInfo = def and def.ui_ico

			if icoInfo == nil then
				sys.log( "UI.HudAuras_SlotWnd:UpdateIco()[ERROR]: cannot find _G.Spell[\"%s\"].ui_ico", data.spellName )
			end

		else

			icoInfo = def and def.additional_auras and def.additional_auras[ data.auraIdx ] and def.additional_auras[ data.auraIdx ].ui_ico

			if icoInfo == nil then
				sys.log( "UI.HudAuras_SlotWnd:UpdateIco()[ERROR]: cannot find _G.Spell[\"%s\"].additional_auras[%d].ui_ico", data.spellName, data.auraIdx )
			end

		end		

		UI:UpdateSpellIco( icoInfo, self, self.layers.ICO_EFFECT )

		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
		if icoEffect then
			icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
		end
		
		local influenceColor = UI:GetAuraInfluenceColor( data.auraId, data.isBuff )
		if influenceColor then
		
			self:SetLayerVisible( true, self.layers.INFLUENCE_COLOR_EFFECT )
			
			local influenceEffect = UI:GetEffectFromLayer( self, self.layers.INFLUENCE_COLOR_EFFECT )
			if influenceEffect then
				influenceEffect:SetColor( influenceColor )
			end
			
		end
		

	elseif data.auraType == UI.HudAurasWnd.auraTypes.ACCOUNT_AURA then

		local def = _G.AccountAura and _G.AccountAura[ data.auraName ]
        local icoInfo = def and def.ui_ico
		UI:UpdateSpellIco( icoInfo, self, self.layers.ICO_EFFECT )

		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
		if icoEffect then
			icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
		end


	elseif data.auraType == UI.HudAurasWnd.auraTypes.STATUS then

		if data.statusData.type == ai.StatusItemType.MODULE_COOLDOWN then
		
			-- автоген
			if UI:IsDefAutogen( data.moduleDefName ) then
			
				local autogenItem = _G.GetAutogenItem( data.moduleDefName )
				local rollData = autogenItem and autogenItem.rollData
				if rollData then
			
					self:SetLayerVisible( false, self.layers.ICO_EFFECT )
					self:SetLayerVisible( true, self.layers.AUTOGEN_EFFECT )
					self:SetLayerVisible( true, self.layers.AUTOGEN_AFFIX_1_EFFECT )
					self:SetLayerVisible( true, self.layers.AUTOGEN_AFFIX_2_EFFECT )
					
					-- подложка, зависит от атоген-класса модуля
					
					local hBgTex = UI.INVALID_RESOURCE_HANDLE
					
					local autogenClassId = -1
					local decomposition = _G.DecompositeAutogenRollData( rollData )
					if decomposition and decomposition.autogenClass then
						autogenClassId = decomposition.autogenClass
					else
						sys.log( "UI.HudAuras_SlotWnd:UpdateIco(): fail to decomposite rollData" )
					end
					
					if autogenClassId ~= -1 then
						local autogenClassName = UI:Val2Key( _G.AutogenClass, autogenClassId )
						local texName = string.format( "autogen_%s_bg", autogenClassName )
						hBgTex = UI:GetTex( texName )
					end
					
					local autogenEffect = UI:GetEffectFromLayer( self, self.layers.AUTOGEN_EFFECT )
					if autogenEffect then
						autogenEffect:SetSpriteTexture( self.effectInfo.autogen.icoSpriteName, hBgTex )
					end
					
					-- иконки аффиксов
					
					local bestAffixes = UI:GetAutogenBestAffixes( rollData )
					
					local affix1 = bestAffixes[ 1 ]
					if affix1 then
					
						self:SetLayerVisible( true, self.layers.AUTOGEN_AFFIX_1_EFFECT )
						
						local hTex = UI:GetAutogenAffixIco( affix1.affixId )
						local color = UI:GetAutogenAffixColor( affix1.affixId, affix1.level )
						
						local affixEffect = UI:GetEffectFromLayer( self, self.layers.AUTOGEN_AFFIX_1_EFFECT )
						if affixEffect then
						
							affixEffect:SetSpriteTexture( self.effectInfo.autogenAffix.icoSpriteName, hTex )
							affixEffect:SetColor( color )
							
						end
						
					end
					
					local affix2 = bestAffixes[ 2 ]
					
					-- если нет второго аффикса, то единственный аффикс рисуется и сверху, и снизу
					if not affix2 then
						affix2 = affix1
					end
					
					if affix2 then
					
						self:SetLayerVisible( true, self.layers.AUTOGEN_AFFIX_2_EFFECT )
						
						local hTex = UI:GetAutogenAffixIco( affix2.affixId )
						local color = UI:GetAutogenAffixColor( affix2.affixId, affix2.level )
						
						local affixEffect = UI:GetEffectFromLayer( self, self.layers.AUTOGEN_AFFIX_2_EFFECT )
						if affixEffect then
						
							affixEffect:SetSpriteTexture( self.effectInfo.autogenAffix.icoSpriteName, hTex )
							affixEffect:SetColor( color )
							
						end
						
					end
					
				else
					sys.log( "UI.HudAuras_SlotWnd:UpdateIco()[ERROR]: cannot find rollData for %s", data.moduleDefName )
				end
			
			-- обычный модуль
			else

				UI:UpdateItemIco( data.moduleDefName, self, self.layers.ICO_EFFECT, false, -1 )

				local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
				if icoEffect then
					icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
				end
				
			end

		elseif data.statusData.type == ai.StatusItemType.TALENT_COOLDOWN then

			local hTex = UI:GetTalentIco( data.talentName )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

    		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
    		if icoEffect then
    			icoEffect:StartAnimation( self.effectInfo.ico.animTalent )
    		end

		elseif data.statusData.type == ai.StatusItemType.SENTINEL then

			local hTex = UI:GetTex( "status_SENTINEL" )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

    		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
    		if icoEffect then
    			icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
    		end

		elseif data.statusData.type == ai.StatusItemType.AURA_COOLDOWN then

			UI:UpdateItemIco( data.moduleDefName, self, self.layers.ICO_EFFECT, false, -1 )

    		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
    		if icoEffect then
    			icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
    		end

		elseif data.statusData.type == ai.StatusItemType.VITALPOINT_ATTACKER then

			local hTex = UI:GetTex( "beacon_atacker_ico" )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

    		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
    		if icoEffect then
    			icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
    		end

		elseif data.statusData.type == ai.StatusItemType.VITALPOINT_DEFENDER then

			local hTex = UI:GetTex( "beacon_defender_ico" )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

    		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
    		if icoEffect then
    			icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
    		end
			
		elseif data.statusData.type == ai.StatusItemType.UNLIM_PVE_BUFF then
		
			local hTex = UI:GetUnlimPveBuffIco( data.buffId )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

			local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
			if icoEffect then
				icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
			end
			
		elseif data.statusData.type == ai.StatusItemType.HID_IN_FOG then

			local hTex = UI:GetTex( "status_HID_IN_FOG" )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

    		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
    		if icoEffect then
    			icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
    		end
			
		elseif data.statusData.type == ai.StatusItemType.TELEPORT_GATE_STATUS then

			local hTex = UI:GetTex( "status_TELEPORT_GATE_STATUS" )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

			local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
			if icoEffect then
				icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
			end

		elseif data.statusData.type == ai.StatusItemType.RSS_RESPAWN_COOLDOWN then

			local hTex = UI:GetTex( "status_RSS_RESPAWN_COOLDOWN" )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

			local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
			if icoEffect then
				icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
			end

		elseif data.statusData.type == ai.StatusItemType.ROPE_TTL then

			local hTex = UI:GetTex( "status_ROPE_TTL" )
			UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

			local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
			if icoEffect then
				icoEffect:StartAnimation( self.effectInfo.ico.animRegular )
			end

		else
			sys.log( "UI.HudAuras_SlotWnd:UpdateIco()[ERROR]: unhandled status type: %d (%s)", data.statusData.type, UI:Val2Key( ai.StatusItemType, data.statusData.type ) )
		end


	else
		sys.log( "UI.HudAuras_SlotWnd:UpdateIco()[ERROR]: unhandled auraType %s", tostring( data.auraType ) )
	end

end


--
function UI.HudAuras_SlotWnd:UpdateTimeLeft( data )

	self.timeLeft = -1

	if data.bShowTimeLeft then

		if data.auraType == UI.HudAurasWnd.auraTypes.AURA then

			local timeLeft = -1

			if _G.IsEntIdValid( data.entId ) then
        		timeLeft = data.ent:GetAuraTimeLeft()
        		timeLeft = math.ceil( timeLeft * 10 ) * 0.1
        	end

			if timeLeft ~= self.timeLeft then
				self.timeLeft = timeLeft
		    	self:UpdateIcoTimeText()				
			end

		elseif data.auraType == UI.HudAurasWnd.auraTypes.STATUS then

			local timeLeft = _G.CL_GetPlayerStatusTimeLeft( data.statusIdx )

			if type( timeLeft ) ~= "number" then
				timeLeft = -1
			end

			if timeLeft ~= self.timeLeft then
				self.timeLeft = timeLeft
		    	self:UpdateIcoTimeText()				
			end

		else
			sys.log( "UI.HudAuras_SlotWnd:UpdateTimeLeft()[ERROR]: not supported for auraType %s", UI:Val2Key( UI.HudAurasWnd.auraTypes, data.auraType ) )
		end

	end

end


--
function UI.HudAuras_SlotWnd:UpdateIcoTimeText()	

	local strTimeLeft = self.timeLeft >= 0 and UI:Time2Str51( self.timeLeft ) or ""
	self:SetText( strTimeLeft, self.layers.TIME_LEFT )

end


--
function UI.HudAuras_SlotWnd:UpdateStacks( data )
	
	local numStacks = -1
	if data.auraType == UI.HudAurasWnd.auraTypes.AURA then
		numStacks = _G.IsEntIdValid( data.entId ) and data.ent:GetAuraStacksOrStage() or -1
	end
	
	if numStacks ~= self.numStacks then
	
		self.numStacks = numStacks
		
		-- количество стаков всегда отображается с двух и более, поэтому нет необходимости различать стадии и стаки при проверке bShowStage_1
		local str = numStacks >= 0 and ( data.bShowStage_1 or numStacks ~= 1 ) and tostring( numStacks ) or ""
		self:SetText( str, self.layers.STACKS )
	
	end
	
end


--
function UI.HudAuras_SlotWnd:UpdateTooltipWindow( bFirstShow )

	local hTooltipWnd = UI:GetDefaultTooltipWnd( UI.tooltipTypes.TEXT_LARGE )
	local tooltipWnd = UI:GetUiObjByHandleT( hTooltipWnd )

	if tooltipWnd then
		tooltipWnd:Setup( self.tooltipData, not bFirstShow )
	end

	return hTooltipWnd

end


--
function UI.HudAuras_SlotWnd:UpdateTooltipBase( data )

	self.tooltip_numStacks	= nil
	self.tooltip_timeLeft	= nil
	self.tooltip_auraParam	= nil

	self.tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE }

	if data.auraType == UI.HudAurasWnd.auraTypes.ACCOUNT_AURA then

		self.tooltipData.text		= UI:GetAccountAuraDesc( data.auraName )
		self.tooltipData.caption	= UI:AccountAura2Str( data.auraName )


	elseif data.auraType == UI.HudAurasWnd.auraTypes.AURA then

        local auraEnt = _G.Entities[ data.entId ]

		self.strTooltipBase = ""

		-- кастер

		local strCaster = ""

		local bHasCaster = false
		local casterName = ""		

		local casterPlayerIdx = auraEnt:GetCasterPlayerIdx()
		if casterPlayerIdx ~= -1 then
			
			bHasCaster = true
    		casterName = UI:MakePlayerNameById( casterPlayerIdx, true, false )

		else

			local casterEnt = auraEnt:GetCaster()
			if casterEnt then
				bHasCaster = true
				casterName = UI:GetEntityLocalizedName( casterEnt, false )
			end

		end

		if bHasCaster then
			local strCasterLabel = UI:GetStringByName( "auraCaster" )
			strCaster = string.format( "%s: %s", strCasterLabel, casterName )
		end


		-- модуль кастера, с помощью которого тот наложил ауру

		local strCasterObj = ""

		if data.moduleDefName ~= "" then

			local strCasterModuleName = UI:GetEntityLocalizedNameByDef( data.moduleDefName, true, false )
			strCasterObj = string.format( "(%s%s)", strCasterModuleName, UI:Color2Str( UI.TEXT_BASE_COLOR ) )

		end

		self.strTooltipBase = string.format( "%s%s%s", strCaster, strCaster ~= "" and " " or "", strCasterObj )


		if self.strTooltipBase ~= "" then
			self.strTooltipBase = string.format( "%s%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), self.strTooltipBase )
		end

		self.tooltipData.text = self.strTooltipBase		-- без времени; оно будет апдейтиться отдельно		

		-- заголовок тултипа
    	self.tooltipData.caption = UI:SpellAura2Str( data.auraId )


	elseif data.auraType == UI.HudAurasWnd.auraTypes.STATUS then

		if data.statusData.type == ai.StatusItemType.MODULE_COOLDOWN then

			-- текст

    		-- источник: имя игрока

    		local strCasterLabel = UI:GetStringByName( "auraCaster" )
			local casterPlayerIdx = _G.GetSpectatorTargetIdx()
        	local casterName = UI:MakePlayerNameById( casterPlayerIdx, true, false )
    		local strCaster = string.format( "%s: %s", strCasterLabel, casterName )

    		-- источник: модуль

    		local strModuleName = UI:GetEntityLocalizedNameByDef( data.moduleDefName, true, false )
    		local strCasterObj = string.format( "(%s%s)", strModuleName, UI:Color2Str( UI.TEXT_BASE_COLOR ) )

			-- описание

			local subType = UI:GetItemSubType( data.moduleDefName )
			local subTypeName = UI:Val2Key( _G.ItemSubtype, subType )
			local descId = string.format( "itemSubType_%s_cooldown", subTypeName )
			local strDesc = UI:GetStringByName( descId )

			-- все вместе

    		self.strTooltipBase = string.format( "%s%s %s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strCasterObj, strDesc )
			self.tooltipData.text = self.strTooltipBase		-- без времени; оно будет апдейтиться отдельно		

			-- заголовок

			self.tooltipData.caption = strModuleName
			

		elseif data.statusData.type == ai.StatusItemType.TALENT_COOLDOWN then

			-- текст

    		-- источник: имя игрока

    		local strCasterLabel = UI:GetStringByName( "auraCaster" )
			local casterPlayerIdx = _G.GetSpectatorTargetIdx()
        	local casterName = UI:MakePlayerNameById( casterPlayerIdx, true, false )
    		local strCaster = string.format( "%s: %s", strCasterLabel, casterName )

    		-- источник: талант

    		local strTalentName = UI:Talent2Str( data.talentName )
    		local strCasterObj = string.format( "(%s %s%s%s)", UI:GetStringByName( "hudAuras_talent" ), UI:Color2Str( UI.TEXT_SEL_COLOR ), strTalentName, UI:Color2Str( UI.TEXT_BASE_COLOR ) )

			-- описание

			local descId = string.format( "talent_%s_cooldown", data.talentName )
			local strDesc = UI:GetStringByName( descId )

			-- все вместе

    		self.strTooltipBase = string.format( "%s%s %s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strCasterObj, strDesc )
			self.tooltipData.text = self.strTooltipBase		-- без времени; оно будет апдейтиться отдельно		

			-- заголовок

			self.tooltipData.caption = strTalentName


		elseif data.statusData.type == ai.StatusItemType.SENTINEL then

			-- текст

			-- источник

    		local strCasterLabel = UI:GetStringByName( "auraCaster" )
        	local casterName = UI:GetStringByName( "status_source_SENTINEL" )
    		local strCaster = string.format( "%s: %s", strCasterLabel, casterName )

			-- описание

			local strDesc = UI:GetStringByName( "status_desc_SENTINEL" )

			-- все вместе

    		self.strTooltipBase = string.format( "%s%s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strDesc )
			self.tooltipData.text = self.strTooltipBase		-- без времени; оно будет апдейтиться отдельно		

			-- заголовок

			self.tooltipData.caption = UI:GetStringByName( "status_name_SENTINEL" )


		elseif data.statusData.type == ai.StatusItemType.AURA_COOLDOWN then

			-- текст

    		-- источник: имя игрока/объекта

    		local strCaster = ""

    		local bHasCaster = false
    		local casterName = ""		
    		
    		if data.casterPlayerIdx ~= -1 then
    			
    			bHasCaster = true
        		casterName = UI:MakePlayerNameById( data.casterPlayerIdx, true, false )

    		elseif data.casterDefName ~= "" then

    			bHasCaster = true
    			casterName = self:GetEntityLocalizedNameByDef( data.casterDefName, false )

    		end

    		if bHasCaster then
    			local strCasterLabel = UI:GetStringByName( "auraCaster" )
    			strCaster = string.format( "%s: %s", strCasterLabel, casterName )
    		end

        	-- источник: модуль

    		local strCasterObj = ""

    		if data.moduleDefName ~= "" then

    			local strCasterModuleName = UI:GetEntityLocalizedNameByDef( data.moduleDefName, true, false )
    			strCasterObj = string.format( "(%s%s)", strCasterModuleName, UI:Color2Str( UI.TEXT_BASE_COLOR ) )

    		end

    		-- описание

    		local subType = UI:GetItemSubType( data.moduleDefName )
    		local subTypeName = UI:Val2Key( _G.ItemSubtype, subType )
    		local descId = string.format( "itemSubType_%s_aura_cooldown", subTypeName )
    		local strDesc = UI:GetStringByName( descId )

    		-- все вместе

        	self.strTooltipBase = string.format( "%s%s%s%s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strCaster ~= "" and " " or "", strCasterObj, strDesc )
    		self.tooltipData.text = self.strTooltipBase		-- без времени; оно будет апдейтиться отдельно		

    		-- заголовок

    		self.tooltipData.caption = UI:GetEntityLocalizedNameByDef( data.moduleDefName, true, false )


		elseif data.statusData.type == ai.StatusItemType.VITALPOINT_ATTACKER or data.statusData.type == ai.StatusItemType.VITALPOINT_DEFENDER then

       		self.strTooltipBase = ""

       		-- кастер

       		local casterName = UI:GetEntityLocalizedNameByDef( data.vpDefName, true, false )
			casterName = string.format( "%s%s", casterName, UI:Color2Str( UI.TEXT_BASE_COLOR ) )
       		local strCasterLabel = UI:GetStringByName( "auraCaster" )
       		local strCaster = string.format( "%s: %s", strCasterLabel, casterName )

    		-- описание

			local statusName = UI:Val2Key( ai.StatusItemType, data.statusData.type )
			local descStrId = string.format( "aura_%s_desc", statusName )
    		local strDesc = UI:GetStringByName( descStrId )

    		-- все вместе

        	self.strTooltipBase = string.format( "%s%s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strDesc )
       		self.tooltipData.text = self.strTooltipBase		-- без времени; оно будет апдейтиться отдельно		

       		-- заголовок

			local nameStrId = string.format( "aura_%s_name", statusName )
			local strName = UI:GetStringByName( nameStrId )			
           	self.tooltipData.caption = strName
			
		elseif data.statusData.type == ai.StatusItemType.UNLIM_PVE_BUFF then
			
			-- текст

			-- источник - игрок

			local strCasterLabel = UI:GetStringByName( "auraCaster" )
			local casterName = UI:MakePlayerNameById( _G.GetSpectatorTargetIdx(), true, false )
			local strCaster = string.format( "%s: %s", strCasterLabel, casterName )
		
			-- описание
		
			local strDesc = UI:GetUnlimPveBuffDesc( data.buffId, UI.TooltipWnd_shared:GetTextColor() )	-- tODO: передавать данные
		
			-- все вместе
		
			self.strTooltipBase = string.format( "%s%s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strDesc )
			self.tooltipData.text = self.strTooltipBase
		
			-- заголовок
		
			self.tooltipData.caption = UI:GetUnlimPveBuffName( data.buffId )
			

		elseif data.statusData.type == ai.StatusItemType.HID_IN_FOG then

			-- текст

			-- источник

    		local strCasterLabel = UI:GetStringByName( "auraCaster" )
        	local casterName = UI:GetStringByName( "status_source_HID_IN_FOG" )
    		local strCaster = string.format( "%s: %s", strCasterLabel, casterName )

			-- описание

			local strDesc = UI:GetStringByName( "status_desc_HID_IN_FOG" )

			-- все вместе

    		self.strTooltipBase = string.format( "%s%s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strDesc )
			self.tooltipData.text = self.strTooltipBase

			-- заголовок

			self.tooltipData.caption = UI:GetStringByName( "status_name_HID_IN_FOG" )
			
			
		elseif data.statusData.type == ai.StatusItemType.TELEPORT_GATE_STATUS then

			-- текст

			-- источник

    		local strCasterLabel = UI:GetStringByName( "auraCaster" )
        	local casterName = UI:GetStringByName( "status_source_TELEPORT_GATE_STATUS" )
    		local strCaster = string.format( "%s: %s", strCasterLabel, casterName )

			-- описание

			local strDesc = UI:GetStringByName( "status_desc_TELEPORT_GATE_STATUS" )

			-- все вместе

    		self.strTooltipBase = string.format( "%s%s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strDesc )
			self.tooltipData.text = self.strTooltipBase

			-- заголовок

			self.tooltipData.caption = UI:GetStringByName( "status_name_TELEPORT_GATE_STATUS" )

		elseif data.statusData.type == ai.StatusItemType.RSS_RESPAWN_COOLDOWN then

			-- текст

			-- источник

    		local strCasterLabel = UI:GetStringByName( "auraCaster" )
        	local casterName = UI:GetStringByName( "status_source_RSS_RESPAWN_COOLDOWN" )
    		local strCaster = string.format( "%s: %s", strCasterLabel, casterName )

			-- описание

			local strDesc = UI:GetStringByName( "status_desc_RSS_RESPAWN_COOLDOWN" )

			-- все вместе

    		self.strTooltipBase = string.format( "%s%s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strDesc )
			self.tooltipData.text = self.strTooltipBase

			-- заголовок

			self.tooltipData.caption = UI:GetStringByName( "status_name_RSS_RESPAWN_COOLDOWN" )

		elseif data.statusData.type == ai.StatusItemType.ROPE_TTL then

			-- текст

			-- источник

    		local strCasterLabel = UI:GetStringByName( "auraCaster" )
        	local casterName = UI:GetStringByName( "status_source_ROPE_TTL" )
    		local strCaster = string.format( "%s: %s", strCasterLabel, casterName )

			-- описание

			local strDesc = UI:GetStringByName( "status_desc_ROPE_TTL" )

			-- все вместе

    		self.strTooltipBase = string.format( "%s%s||%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strCaster, strDesc )
			self.tooltipData.text = self.strTooltipBase

			-- заголовок

			self.tooltipData.caption = UI:GetStringByName( "status_name_ROPE_TTL" )

   		else
   			sys.log( "UI.HudAuras_SlotWnd:UpdateTooltipBase()[ERROR]: unhandled status type: %d (%s)", data.statusData.type, UI:Val2Key( ai.StatusItemType, data.statusData.type ) )
   		end


	else
		sys.log( "UI.HudAuras_SlotWnd:UpdateTooltipBase()[ERROR]: unhanlded aura type: %s", tostring( data.auraType ) )
	end

end


--
function UI.HudAuras_SlotWnd:UpdateTooltipChangable( data )

	if data.auraType == UI.HudAurasWnd.auraTypes.AURA then

    	local auraParam	= nil
    	local numStacks	= -1

    	if _G.IsEntIdValid( data.entId ) then
    		auraParam	= data.ent:GetAuraParam()
    		numStacks	= data.ent:GetAuraStacksOrStage()
    	end	

    	local bChanged = false

    	if auraParam ~= self.tooltip_auraParam then
    		self.tooltip_auraParam = auraParam
    		bChanged = true
    	end

        if numStacks ~= self.tooltip_numStacks then
    		self.tooltip_numStacks = numStacks
    		bChanged = true
    	end

    	if self.timeLeft ~= self.tooltip_timeLeft then
    		self.tooltip_timeLeft = self.timeLeft
    		bChanged = true
    	end

    	if not bChanged then
    		return
    	end

    	self.tooltipData.text = self.strTooltipBase

    	if _G.IsEntIdValid( data.entId ) then
    		local strDesc = UI:GetSpellDescEx( { defName = data.spellName, data = { auraEnt = data.ent, auraIdx = data.auraIdx, bHold = data.bHold } }, UI.TEXT_SEL_COLOR, UI.TEXT_BASE_COLOR )
    		self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, self.tooltipData.text ~= "" and strDesc ~= "" and "||" or "", strDesc )
    	end

		-- количество стаков всегда отображается с двух и более, поэтому нет необходимости различать стадии и стаки при проверке bShowStage_1
		local bShowStacks = numStacks >= 0 and ( data.bShowStage_1 or numStacks ~= 1 )

        if bShowStacks then
        	local strStacks = string.format( "%s: %d", self.strStacksLabel, numStacks )
    		self.tooltipData.text = string.format( "%s||%s", self.tooltipData.text, strStacks )
        end

        if self.timeLeft >= 0 then    			   
        	local strTimeVal = UI:Time2Str51( self.timeLeft )
        	local strTime = string.format( "%s: %s %s", self.strTimeLeftLabel, strTimeVal, UI.strSecs )
            self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, bShowStacks and "|" or "||", strTime )
        end

    	if UI:GetCurTooltipTarget() == self then
    		self:UpdateTooltipWindow( false )
    	end

	elseif data.auraType == UI.HudAurasWnd.auraTypes.STATUS then

    	local bChanged = false

    	if self.timeLeft ~= self.tooltip_timeLeft then
    		self.tooltip_timeLeft = self.timeLeft
    		bChanged = true
    	end

    	if not bChanged then
    		return
    	end

    	self.tooltipData.text = self.strTooltipBase

        if self.timeLeft >= 0 then    			   
        	local strTimeVal = UI:Time2Str51( self.timeLeft )
        	local strTime = string.format( "%s: %s %s", self.strTimeLeftLabel, strTimeVal, UI.strSecs )
            self.tooltipData.text = string.format( "%s||%s", self.tooltipData.text, strTime )
        end

    	if UI:GetCurTooltipTarget() == self then
    		self:UpdateTooltipWindow( false )
    	end

	end

end


--
function UI.HudAuras_SlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )			

	local data = self:GetRecordData()

	if data.bShowTimeLeft then
		self:UpdateTimeLeft( data )
	end

	if UI:GetCurTooltipTarget() == self then
		self:UpdateTooltipChangable( data )
	end
	
	self:UpdateStacks( data )

end


-- ------------------------------------------------------------------
-- UI.HudAurasWnd_buffs
-- ------------------------------------------------------------------

UI.HudAurasWnd_buffs =
{
	def =
	{
		className	= "Wnd",
		prototype	= "HudAurasWnd",

		props =
		{
			name		= "HudAurasWnd_buffs",
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
    				defName 			= "hud_auras_buffsList",
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
	},
	
	bBuffs = true
}


-- ------------------------------------------------------------------
-- UI.HudAurasWnd_debuffs
-- ------------------------------------------------------------------

UI.HudAurasWnd_debuffs =
{
	def =
	{
		className	= "Wnd",
		prototype	= "HudAurasWnd",

		props =
		{
			name		= "HudAurasWnd_debuffs",
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
    				defName 			= "hud_auras_debuffsList",
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
	},
	
	bBuffs = false
}