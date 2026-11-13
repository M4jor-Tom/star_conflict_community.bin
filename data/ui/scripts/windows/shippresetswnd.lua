-- ----------------------------------------------------------------
-- UI.ShipPresetsWnd
-- ----------------------------------------------------------------

--[[ формат таблицы пресетов

UI.shipPresets =
{
	[ <ship_def_name> ]	=
	{
		presets =
		{
			[ <preset_idx> ] = -- регулярный массив, preset_idx не совпадает с id пресета!, preset_idx для пресета может меняться при удалении пресетов из массива
			{
				id		= <number>,	-- идентификтор, от 1 до 4
				name	= <string>,	-- кастомное название
				
				modules =
				{
					[ <module_slot_id> ] =
					{
						defName		= <string>,
						enchanted	= <boolean>,
					},
					...
				},
				
				ammo =
				{
					[ <module_slot_id> ] = <string>,
					...
				}
			},
			...
		},
		
		selPresetId = <number>	-- соответствует полю 'id' пресета
	},
	...
}
]]

UI.ShipPresetsWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.ShipPresetsWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "ShipPresetsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "shipPresets_main_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "preset_btns",
						wnd			= "UI.ShipPresets_PresetListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "save",
						wnd			= "UI.ShipPresets_SaveBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "load",
						wnd			= "UI.ShipPresets_ApplyBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "add",
						wnd			= "UI.ShipPresets_AddBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "remove",
						wnd			= "UI.ShipPresets_RemoveBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		}
	},
	
	children =
	{
		"UI.ShipPresets_PresetListWnd",
		"UI.ShipPresets_SaveBtn",
		"UI.ShipPresets_ApplyBtn",
		"UI.ShipPresets_AddBtn",
		"UI.ShipPresets_RemoveBtn",
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

-- совпдадает ли то оборудование, которое сохранено в пресете с текущим установленным на корабле оборудованием;
-- совпадение нужно точное - деф (конкретно  этот, без апгрейдов), энчантмент, номер слота
function UI.ShipPresetsWnd:IsPresetEqualToCurrent( preset )

	if not self.shipItem then
		sys.log( "UI.ShipPresetsWnd:IsPresetEqualToCurrent()[ERROR]: no shipItem" )
		return false
	end
	
	local bEqualToCurrent = true
	
	-- проверка модулей
	for moduleSlotIdx, moduleSlotName in pairs( self.presetModuleSlots ) do
	
		local moduleSlotId = ai.SpaceShipModuleSlot[ moduleSlotName ]
		
		local defName_preset	= ""
		local bEnchanted_preset	= false
		local defName_cur		= ""
		local bEnchanted_cur	= false

		local presetModuleData = preset.modules and preset.modules[ moduleSlotId ]
		if presetModuleData then
			defName_preset		= presetModuleData.defName or ""
			bEnchanted_preset	= presetModuleData.enchanted or false
		end
		
		local iid = self.shipItem.equipModules[ moduleSlotId ] or UI.INVALID_U64_ID
		if iid ~= UI.INVALID_U64_ID then
			local item = UI:GetInventoryItem( iid )
			if item then
				defName_cur		= item.defName or ""
				bEnchanted_cur	= UI:IsInventoryItemEnchanted( item )
			end
		end
		
		if defName_preset ~= defName_cur or bEnchanted_preset ~= bEnchanted_cur then
			bEqualToCurrent = false
			break
		end

	end
	
	-- проверка аммуниции
	if bEqualToCurrent then
	
		for ammoSlotName, ammoSlotId in pairs( ai.MunitionBayType ) do
		
			if ammoSlotId ~= ai.MunitionBayType.MBT_NUM then
			
				local defName_preset	= preset.ammo and preset.ammo[ ammoSlotId ] or ""
				local defName_cur		= self.shipItem.equipAmmo[ ammoSlotId ] and self.shipItem.equipAmmo[ ammoSlotId ].def or ""
				
				if defName_preset ~= defName_cur then
					bEqualToCurrent = false
					break
				end
				
			end
			
		end
		
	end
	
	return bEqualToCurrent

end


-- возвращает список оборудования (дефов), которое есть в пресете, но которое не нельзя установить на корабль (его нет в инвентаре и оно не установлено сейчас на корабле)
function UI.ShipPresetsWnd:GetPresetLostItems( preset )
	
	local lostItems = {}
	
	if not self.shipItem then
		sys.log( "UI.ShipPresetsWnd:GetPresetLostItems()[ERROR]: no shipItem" )
		return lostItems
	end
	
	-- поиск модулей
	-- подходящими считаются неустановленные модули, или установленные на этот корабль,
	-- если в пресете сохранено несколько одинаковых модулей, то количества должно хватать
	local needModulesCountMap = {}
	
	if preset.modules then
	
		for moduleSlotId, presetModuleData in pairs( preset.modules ) do
		
			local defName = presetModuleData.defName or ""
			if defName ~= "" then
			
				local bEnchanted = presetModuleData.enchanted or false
				
				if not needModulesCountMap[ defName ] then
					needModulesCountMap[ defName ] = { count = 0, count_ench = 0 }
				end
				
				if bEnchanted then
					needModulesCountMap[ defName ].count_ench = needModulesCountMap[ defName ].count_ench + 1
				else
					needModulesCountMap[ defName ].count = needModulesCountMap[ defName ].count + 1
				end
				
			end
			
		end
		
	end
	
	for defName, needCountData in pairs( needModulesCountMap ) do
	
		local isCount = 0
		local isCount_ench = 0
	
		local items = UI:GetInventoryItemsByDef( defName )
		for itemIdx, item in pairs( items ) do

			local equipShipItem = UI:GetEquippedShipItem( item.iid )
			if not equipShipItem or equipShipItem == self.shipItem then
			
				if UI:IsInventoryItemEnchanted( item ) then
					isCount_ench = isCount_ench + 1
				else
					isCount = isCount + 1
				end
				
			end

		end
		
		if isCount < needCountData.count or isCount_ench < needCountData.count_ench then
			table.insert( lostItems, defName )
		end
	
	end
	
	-- поиск аммуниции
	-- одходящей считается неустановленная аммуниция, или установленная на этот корабль
	if preset.ammo then
	
		for ammoSlotId, defName in pairs( preset.ammo ) do
		
			if defName ~= "" then
		
				local bFound = false
				
				-- проверка установленной на этом корабле
				if self.shipItem.equipAmmo[ ammoSlotId ] and self.shipItem.equipAmmo[ ammoSlotId ].def == defName then
					bFound = true
				end
				
				-- проверка неустановленной (в инвентаре)
				if not bFound then
				
					local items = UI:GetInventoryItemsByDef( defName )
					for itemIdx, item in pairs( items ) do
						if item.amount > 0 then
							bFound = true
							break
						end
					end
					
				end
				
				if not bFound then
					table.insert( lostItems, defName )
				end
				
			end
		
		end
	
	end
	
	return lostItems
	
end


--
function UI.ShipPresetsWnd:ShipPreset_OnSaveCurrentToPreset( vid, presetId )

	if not self:IsOnScreen() then
		return
	end
	
	if not self.shipItem or self.shipItem.vid ~= vid then
		return
	end

	local selPreset = self:GetSelPreset()
	local selPresetId = selPreset and selPreset.id or -1
	if presetId == selPresetId then
	
		self:UpdateSaveBtn()
		self:UpdateApplyBtn()
	
	end
	
	UI.ShipPresets_PresetListWnd:ShipPreset_OnSaveCurrentToPreset( presetId )

end


--
function UI.ShipPresetsWnd:ShipPreset_OnAddPreset( vid, id )

	if not self:IsOnScreen() then
		return
	end
	
	if not self.shipItem or self.shipItem.vid ~= vid then
		return
	end
	
	self:UpdateShipPresets()
	
end


--
function UI.ShipPresetsWnd:ShipPreset_OnRemovePreset( shipDefName, presetId )

	if not self:IsOnScreen() then
		return
	end
	
	if not self.shipItem then
		return
	end
	
	local selfShipDefName = self.shipItem.defName
	if UI:IsShipEvolving( selfShipDefName ) then
		selfShipDefName = UI:GetEvolvingShipBaseDef( selfShipDefName )
	end

	if selfShipDefName ~= shipDefName then
		return
	end
	
	self:UpdateShipPresets()

end


--
function UI.ShipPresetsWnd:ShipPreset_OnSetSelPreset( shipDefName, presetId )

	if not self:IsOnScreen() then
		return
	end
	
	if not self.shipItem then
		return
	end
	
	local selfShipDefName = self.shipItem.defName
	if UI:IsShipEvolving( selfShipDefName ) then
		selfShipDefName = UI:GetEvolvingShipBaseDef( selfShipDefName )
	end

	if selfShipDefName ~= shipDefName then
		return
	end
	
	local selPreset = self:GetSelPreset()
	local selPresetId = selPreset and selPreset.id or -1
	if selPresetId ~= presetId then	
		UI.ShipPresets_PresetListWnd:SelectPreset( presetId )
	end
	
end


--
function UI.ShipPresetsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.applyPresetRequestId = 0

end


--
function UI.ShipPresetsWnd:GameStore_OnChangeEquipmentMulti( result, requestId, param1, param2, u64Param )

	if requestId == self.applyPresetRequestId then
	
		if result ~= _G.GameStore.ModuleEquipResult.MER_OK then
			UI:ShowMessageOnEquipError( result )
		end
		
		self.applyPresetRequestId = 0
		
	end
	
	-- апдейт элементов происходит в F_OnEventInvItemsChanged()

end


--
function UI.ShipPresetsWnd:F_OnEventInvItemsChanged()

	if not self:IsOnScreen() then
		return
	end
	
	self:UpdateSaveBtn()
	self:UpdateApplyBtn()
	UI.ShipPresets_PresetListWnd:F_OnEventInvItemsChanged()

end

-- ---------------------------
-- const
-- ---------------------------

-- слоты модулей, которые запоминаются в пресетах
-- (остальные игрок не может менять вручную)
UI.ShipPresetsWnd.presetModuleSlots =
{
	"PRIMARY_WEAPON_01",
	"ACTIVE_01",
	"ACTIVE_02",
	"ACTIVE_03",
	"ACTIVE_04",
	"ENGINE_MOD_01",
	"ENGINE_MOD_02",
	"ENGINE_MOD_03",
	"CAPACITOR_MOD_01",
	"CAPACITOR_MOD_02",
	"CAPACITOR_MOD_03",
	"SHIELD_MOD_01",
	"SHIELD_MOD_02",
	"SHIELD_MOD_03",
	"ARMOR_MOD_01",
	"ARMOR_MOD_02",
	"ARMOR_MOD_03",
	"CPU_MOD_01",
	"CPU_MOD_02",
	"CPU_MOD_03",
}

-- ---------------------------
-- vars
-- ---------------------------

UI.ShipPresetsWnd.shipItem				= nil
UI.ShipPresetsWnd.shipPresetsData		= nil
UI.ShipPresetsWnd.hMsgSavePreset		= UI.INVALID_UI_HANDLE
UI.ShipPresetsWnd.hMsgApplyPreset		= UI.INVALID_UI_HANDLE
UI.ShipPresetsWnd.hMsgRemovePreset		= UI.INVALID_UI_HANDLE
UI.ShipPresetsWnd.applyPresetRequestId	= 0

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.ShipPresetsWnd:F_PostLoad()    

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )

end


--
function UI.ShipPresetsWnd:Reset()
	
	self.shipItem			= nil
	self.shipPresetsData	= nil
	
	UI.ShipPresets_PresetListWnd:Clear()
	UI.ShipPresets_SaveBtn:UnlinkFromParent()
	UI.ShipPresets_ApplyBtn:UnlinkFromParent()
	UI.ShipPresets_AddBtn:UnlinkFromParent()
	UI.ShipPresets_RemoveBtn:UnlinkFromParent()
	
	self:HideChildModals()

end


--
function UI.ShipPresetsWnd:FullUpdate()
	
	self:Reset()
	
	self:UpdateShipItem()
	self:UpdateShipPresets()

end


--
function UI.ShipPresetsWnd:UpdateShipItem()

	self.shipItem = UI.EquipmentWnd:GetSelShipItem()
	if not self.shipItem then
		sys.log( "UI.ShipPresetsWnd:UpdateShipItem()[ERROR]: no shipItem" )
		return
	end

end


--
function UI.ShipPresetsWnd:UpdateShipPresets()

	self:HideChildModals()

	self.shipPresetsData = nil
	
	if self.shipItem then
	
		local shipDefName = self.shipItem.defName
		if UI:IsShipEvolving( shipDefName ) then
			shipDefName = UI:GetEvolvingShipBaseDef( shipDefName )
		end
		
		self.shipPresetsData = UI.shipPresets[ shipDefName ]
		
	end
	
	self:UpdatePresetsList()
	self:UpdateSaveBtn()
	self:UpdateApplyBtn()
	self:UpdateAddBtn()
	self:UpdateRemoveBtn()
	
end


--
function UI.ShipPresetsWnd:UpdatePresetsList()
	
	if self.shipPresetsData and self.shipPresetsData.presets then
	
		UI.ShipPresets_PresetListWnd:SetPresets( self.shipPresetsData.presets )
		
		-- восстанавливаем запомненное выделение
		local selPresetId = self.shipPresetsData.selPresetId or -1
		UI.ShipPresets_PresetListWnd:SelectPreset( selPresetId )
		
	else
		UI.ShipPresets_PresetListWnd:Clear()
	end
	
end


--
function UI.ShipPresetsWnd:UpdateSaveBtn()

	if UI.ShipPresets_PresetListWnd:GetNumRecords() > 0 then
	
		self:AddChild( UI.ShipPresets_SaveBtn )
		
		local bEnable = false
		
		local selPreset = self:GetSelPreset()
		if selPreset then
			
			if not self:IsPresetEqualToCurrent( selPreset ) then	-- сохранять можно только если этот презет не совпадает с текущей раскладкой
				bEnable = true
			end
			
		end
		
		UI.ShipPresets_SaveBtn:Enable( bEnable )
		
	else
		UI.ShipPresets_SaveBtn:UnlinkFromParent()
	end

end


--
function UI.ShipPresetsWnd:UpdateApplyBtn()

	if UI.ShipPresets_PresetListWnd:GetNumRecords() > 0 then
	
		self:AddChild( UI.ShipPresets_ApplyBtn )
		
		local bEnable = false
		
		local selPreset = self:GetSelPreset()
		if selPreset and not self:IsPresetEqualToCurrent( selPreset ) then
		
			if not self:IsPresetEqualToCurrent( selPreset ) then	-- применить можно только если этот презет не совпадает с текущей раскладкой
				bEnable = true
			end
			
		end
		
		UI.ShipPresets_ApplyBtn:Enable( bEnable )

	
	else
		UI.ShipPresets_ApplyBtn:UnlinkFromParent()
	end

end


--
function UI.ShipPresetsWnd:UpdateAddBtn()

	if UI.ShipPresets_PresetListWnd:GetNumRecords() < UI.SHIP_PRESET_MAX_PRESETS_PER_SHIP then
		self:AddChild( UI.ShipPresets_AddBtn )
	else
		UI.ShipPresets_AddBtn:UnlinkFromParent()
	end
	
end


--
function UI.ShipPresetsWnd:UpdateRemoveBtn()

	if UI.ShipPresets_PresetListWnd:GetNumRecords() > 0 then
	
		self:AddChild( UI.ShipPresets_RemoveBtn )
		
		local bEnable = UI.ShipPresets_PresetListWnd:GetSelectedRecord() ~= -1
		UI.ShipPresets_RemoveBtn:Enable( bEnable )
		
		
	else
		UI.ShipPresets_RemoveBtn:UnlinkFromParent()
	end

end


--
function UI.ShipPresetsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:FullUpdate()

end


--
function UI.ShipPresetsWnd:GetSelPreset()

	local selPreset = nil

	local selRecordIdx = UI.ShipPresets_PresetListWnd:GetSelectedRecord()
	if selRecordIdx ~= -1 then
		local data = UI.ShipPresets_PresetListWnd:GetRecordData( selRecordIdx )
		selPreset = data.preset
	end
	
	return selPreset

end


--
function UI.ShipPresetsWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == UI.ShipPresets_PresetListWnd:GetUiHandle() then
		self:OnSelPresetChanged()
	end

end


--
function UI.ShipPresetsWnd:OnSelPresetChanged()
	
	self:UpdateSaveBtn()
	self:UpdateApplyBtn()
	self:UpdateRemoveBtn()
	
	self:HideChildModals()
	
end


--
function UI.ShipPresetsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if wnd == UI.ShipPresets_SaveBtn then
		
		if not UI.ShipPresets_SaveBtn:IsGray() then
			self:TrySaveCurrentToSelPreset()
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end
		
	elseif wnd == UI.ShipPresets_ApplyBtn then
		
		if not UI.ShipPresets_ApplyBtn:IsGray() then
			if not UI:IsWaitingRequests() then
				self:TryApplySelPresetToCurrent()
				UI:PlayGlobalSound( UI.sounds.btnClick )
			end
		end
	
	elseif wnd == UI.ShipPresets_AddBtn then
		
		if not UI.ShipPresets_AddBtn:IsGray() then
			self:TryAddPreset()
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end
		
	elseif wnd == UI.ShipPresets_RemoveBtn then
		
		if not UI.ShipPresets_RemoveBtn:IsGray() then
			self:TryRemoveSelPreset()
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end
		
	elseif UI:IsWndKindOf( wnd, "ShipPresets_PresetSlotWnd" ) then
		
		if not wnd:IsSelected() then
			
			local presetId = wnd:GetRecordData().preset.id
			UI:ShipPreset_SetSelPreset( self.shipItem.defName, presetId )
			
			UI:PlayGlobalSound( UI.sounds.btnClick )
			
		end
		
	end
	
	return true
	
end


--
function UI.ShipPresetsWnd:TrySaveCurrentToSelPreset()
	
	if not self:GetSelPreset() then
		sys.log( "UI.ShipPresetsWnd:TrySaveCurrentToSelPreset()[ERROR]: no sel preset" )
		return
	end
	
	if self.hMsgSavePreset ~= UI.INVALID_UI_HANDLE then
		sys.log( "UI.ShipPresetsWnd:TrySaveCurrentToSelPreset()[ERROR]: request is already on screen" )
		return
	end
	
	self.hMsgSavePreset = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "shipPresets_savePresetConfirm_text" ), UI.MBS_YES_NO )
	
end


--
function UI.ShipPresetsWnd:DoSaveCurrentToSelPreset()
	
	local preset = self:GetSelPreset()
	if not preset then
		sys.log( "UI.ShipPresetsWnd:DoSaveCurrentToSelPreset()[ERROR]: no sel preset" )
		return
	end
	
	if not self.shipItem then
		sys.log( "UI.ShipPresetsWnd:DoSaveCurrentToSelPreset()[ERROR]: no shipItem" )
		return
	end
	
	UI:ShipPreset_SaveCurrentToPreset( self.shipItem.vid, preset.id )

end


--
function UI.ShipPresetsWnd:TryApplySelPresetToCurrent()

	if not self:GetSelPreset() then
		sys.log( "UI.ShipPresetsWnd:TryApplySelPresetToCurrent()[ERROR]: no sel preset" )
		return
	end
	
	if self.hMsgApplyPreset ~= UI.INVALID_UI_HANDLE then
		sys.log( "UI.ShipPresetsWnd:TryApplySelPresetToCurrent()[ERROR]: request is already on screen" )
		return
	end
	
	self.hMsgApplyPreset = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "shipPresets_applyPresetConfirm_text" ), UI.MBS_YES_NO )

end


--
function UI.ShipPresetsWnd:DoApplySelPresetToCurrent()
	
	local preset = self:GetSelPreset()
	if not preset then
		sys.log( "UI.ShipPresetsWnd:DoApplySelPresetToCurrent()[ERROR]: no sel preset" )
		return
	end
	
	if not self.shipItem then
		sys.log( "UI.ShipPresetsWnd:DoApplySelPresetToCurrent()[ERROR]: no shipItem" )
		return
	end
	
	self.applyPresetRequestId = UI:ShipPreset_ApplyPresetToCurrent( self.shipItem.vid, preset.id )	
	
	if self.applyPresetRequestId ~= 0 then
		UI:AddWaitingRequest( self.applyPresetRequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )	-- ждем апдейта инвентаря, который будет вызван из кода cpp
	else
		UI:ShowMessageOnEquipError( _G.GameStore.ModuleEquipResult.MER_ERROR )
	end

end


--	
function UI.ShipPresetsWnd:TryAddPreset()
	
	if not self.shipItem then
		sys.log( "UI.ShipPresetsWnd:TryAddPreset()[ERROR]: no shipItem" )
		return
	end
	
	UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.SHIP_PRESET_ADD, nil, { vid = self.shipItem.vid } )
	
end


--
function UI.ShipPresetsWnd:TryRemoveSelPreset()
	
	if not self:GetSelPreset() then
		sys.log( "UI.ShipPresetsWnd:TryRemoveSelPreset()[ERROR]: no sel preset" )
		return
	end
	
	if self.hMsgRemovePreset ~= UI.INVALID_UI_HANDLE then
		sys.log( "UI.ShipPresetsWnd:TryRemoveSelPreset()[ERROR]: request is already on screen" )
		return
	end
	
	self.hMsgRemovePreset = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "shipPresets_removePresetConfirm_text" ), UI.MBS_YES_NO )

end


--
function UI.ShipPresetsWnd:DoRemoveSelPreset()
	
	local preset = self:GetSelPreset()
	if not preset then
		sys.log( "UI.ShipPresetsWnd:DoRemoveSelPreset()[ERROR]: no sel preset" )
		return
	end
	
	if not self.shipItem then
		sys.log( "UI.ShipPresetsWnd:DoSaveCurrentToSelPreset()[ERROR]: no shipItem" )
		return
	end
	
	UI:ShipPreset_RemovePreset( self.shipItem.defName, preset.id )
	
end


--
function UI.ShipPresetsWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgSavePreset then
	
		self.hMsgSavePreset = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoSaveCurrentToSelPreset()
		end
		
	elseif boxHandle == self.hMsgApplyPreset then
	
		self.hMsgApplyPreset = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoApplySelPresetToCurrent()
		end
		
	elseif boxHandle == self.hMsgRemovePreset then
	
		self.hMsgRemovePreset = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoRemoveSelPreset()
		end
		
	end

end


--
function UI.ShipPresetsWnd:F_OnEventSaveUiState()

	self:HideChildModals()
	
	UI.store.ShipPresetsWnd =
	{
		applyPresetRequestId = self.applyPresetRequestId,
	}
	
end


--
function UI.ShipPresetsWnd:F_OnEventRestoreUiState()

	if UI.store.ShipPresetsWnd then
		self.applyPresetRequestId = UI.store.ShipPresetsWnd.applyPresetRequestId
		UI.store.ShipPresetsWnd = nil
	end
	
end


--
function UI.ShipPresetsWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		return
	end

	if self.hMsgSavePreset ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgSavePreset )
		UI:Purge()
		self.hMsgSavePreset = UI.INVALID_UI_HANDLE
	end

	if self.hMsgApplyPreset ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgApplyPreset )
		UI:Purge()
		self.hMsgApplyPreset = UI.INVALID_UI_HANDLE
	end
	
	if self.hMsgRemovePreset ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgRemovePreset )
		UI:Purge()
		self.hMsgRemovePreset = UI.INVALID_UI_HANDLE
	end

end


-- ----------------------------------------------------------------
-- UI.ShipPresets_PresetListWnd
-- ----------------------------------------------------------------

UI.ShipPresets_PresetListWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.ShipPresets_PresetListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",
	
	props =
	{
		name		= "ShipPresets_PresetListWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "shipPresets_presetList_1080",
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

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.ShipPresets_PresetListWnd:SetPresets( shipPresets )

	self:Clear()
	
	if not shipPresets then
		return
	end
	
	local presetDatas = {}
	for presetIdx, preset in ipairs( shipPresets ) do	-- регулярный массив
		table.insert( presetDatas, { preset = preset } )
	end
	
	-- выравниваине слотов идет по правому краю (нумерация слотов в эффекте также по правому краю)
	for recordIdx = #presetDatas, 1, -1 do
		self:AddRecord( presetDatas[ recordIdx ] )
	end

end



--
function UI.ShipPresets_PresetListWnd:GetRecordForPreset( presetId )

	local presetRecordIdx = -1
	
	if presetId ~= -1 then
	
		for recordIdx = 1, self:GetNumRecords() do
		
			local data = self:GetRecordData( recordIdx )
			if data.preset.id == presetId then
			
				presetRecordIdx = recordIdx
				break
				
			end
		
		end
		
	end
	
	return presetRecordIdx
	
end


--
function UI.ShipPresets_PresetListWnd:SelectPreset( presetId )

	local recordIdx = self:GetRecordForPreset( presetId )
	self:SelectRecord( recordIdx )

end


--
function UI.ShipPresets_PresetListWnd:ShipPreset_OnSaveCurrentToPreset( presetId )
	
	for recordIdx = 1, self:GetNumRecords() do
	
		local data = self:GetRecordData( recordIdx )
		if data.preset.id == presetId then
		
			local slotWnd = self:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:ShipPreset_OnSaveCurrentToPreset()
			end
			
			break
		
		end
	
	end

end


--
function UI.ShipPresets_PresetListWnd:F_OnEventInvItemsChanged()

	for recordIdx = 1, self:GetNumRecords() do
		
		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:F_OnEventInvItemsChanged()
		end
	
	end

end

-- ---------------------------
-- const
-- ---------------------------

UI.ShipPresets_PresetListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "preset_btn_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.ShipPresets_PresetListWnd.btnPrototypeName	= "ShipPresets_PresetSlotWnd"
UI.ShipPresets_PresetListWnd.MAX_SLOTS			= 4
UI.ShipPresets_PresetListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

-- ----------------------------------------------------------------
-- UI.ShipPresets_PresetSlotWnd
-- ----------------------------------------------------------------

UI.ShipPresets_PresetSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.ShipPresets_PresetSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",
	
	props =
	{
		name		= "ShipPresets_PresetSlotWnd",
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
				defName 			= "shipPresets_presetSlot_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "value",
						layer		= "UI.ShipPresets_PresetSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "on_off",
						layer		= "UI.ShipPresets_PresetSlotWnd.layers.STATE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "over",
						layer		= "UI.ShipPresets_PresetSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Large" },
		},
		
		-- STATE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipPresets_presetSlot_state_1080",
			}}
		},
		
		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shipPresets_presetSlot_mouseOver_1080",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.ShipPresets_PresetSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )
	
	self:SetText( "", self.layers.NAME )
	self:SetLayerVisible( false, self.layers.STATE_ICO_EFFECT )
	self.tooltipData = nil
	
end


--
function UI.ShipPresets_PresetSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	
	self:UpdateMainAnimation()
	self:UpdateMouseOver()
	
end


--
function UI.ShipPresets_PresetSlotWnd:ShipPreset_OnSaveCurrentToPreset()
	
	local data = self:GetRecordData()
	self:UpdateStateIco( data )
	self:UpdateTooltip( data )

end


--
function UI.ShipPresets_PresetSlotWnd:F_OnEventInvItemsChanged()

	local data = self:GetRecordData()
	self:UpdateStateIco( data )
	self:UpdateTooltip( data )

end


--
function UI.ShipPresets_PresetSlotWnd:GetTooltipData()

	return self.tooltipData
	
end

-- ---------------------------
-- const
-- ---------------------------

UI.ShipPresets_PresetSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	NAME				= 1,
	STATE_ICO_EFFECT	= 2,
	MOUSE_OVER_EFFECT	= 3,
}

UI.ShipPresets_PresetSlotWnd.effectInfo =
{
	main =
	{
		animUnsel	= "idle",
		animSel		= "select",
	},
	
	stateIco =
	{
		animEqualToCurrent	= "on",
		animLostItems		= "off",
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.ShipPresets_PresetSlotWnd.tooltipData = nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.ShipPresets_PresetSlotWnd:UpdateForData( data, bAnimated )
	
	self:UpdateMainAnimation()
	self:UpdateName( data )
	self:UpdateStateIco( data )
	self:UpdateTooltip( data )
	self:UpdateMouseOver()
	
end


--
function UI.ShipPresets_PresetSlotWnd:UpdateMainAnimation()

	local anim = self:IsSelected() and self.effectInfo.main.animSel or self.effectInfo.main.animUnsel
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.ShipPresets_PresetSlotWnd:UpdateName( data )

	local presetName = data.preset.name or ""
	if presetName == "" then
		presetName = "no name"
	end
	
	presetName = UI:ShieldSpecSymbols( presetName )
	
	local str = UI:GetCutTextWithEllipses( presetName, self:GetLayerWidth( self.layers.NAME ), self:GetFont( self.layers.NAME ) )
	self:SetText( str, self.layers.NAME )
	
end


--
function UI.ShipPresets_PresetSlotWnd:UpdateStateIco( data )

	local bNeedStateIco = false
	local anim = ""

	if UI.ShipPresetsWnd:IsPresetEqualToCurrent( data.preset ) then
	
		bNeedStateIco = true
		anim = self.effectInfo.stateIco.animEqualToCurrent
		
	elseif #UI.ShipPresetsWnd:GetPresetLostItems( data.preset ) > 0 then
	
		bNeedStateIco = true
		anim = self.effectInfo.stateIco.animLostItems

	end
	
	if bNeedStateIco then
	
		self:SetLayerVisible( true, self.layers.STATE_ICO_EFFECT )
		
		local stateIcoEffect = UI:GetEffectFromLayer( self, self.layers.STATE_ICO_EFFECT )
		if stateIcoEffect then
			stateIcoEffect:StartAnimation( anim )
		end

	else
		self:SetLayerVisible( false, self.layers.STATE_ICO_EFFECT )
	end

end


--
function UI.ShipPresets_PresetSlotWnd:UpdateTooltip( data )

	self.tooltipData = {}
	self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
	
	-- заголовок
	local caption = UI:GetStringByName( "shipPresets_presetSlot_tooltipCaption" )
	
	local presetName = data.preset.name or ""
	if presetName == "" then
		presetName = "no name"
	end
	
	presetName = UI:ShieldSpecSymbols( presetName )
	
	local caption, numSubst = string.gsub( caption, "%$name%$", presetName )
	if numSubst == 0 then
		sys.log( "UI.ShipPresets_PresetSlotWnd:UpdateTooltip()[ERROR]: cannot find placeholder '$name$' in string 'shipPresets_presetSlot_tooltipCaption'" )
		caption = string.format( "[INVALID STRING]Preset '%s'", presetName )
	end
	
	self.tooltipData.caption = caption
	
	-- текст
	local text = UI:GetStringByName( "shipPresets_presetSlot_tooltipText" )
	
	local itemsSorted = {}

	if data.preset.modules then
		for slotId, moduleData in pairs( data.preset.modules ) do
			if moduleData.defName ~= "" then
				table.insert( itemsSorted, moduleData.defName )
			end
		end
	end
	
	if data.preset.ammo then
		for slotId, defName in pairs( data.preset.ammo ) do
			if defName ~= "" then
				table.insert( itemsSorted, defName )
			end
		end
	end

	table.sort( itemsSorted )	-- сортировка по техническому имени дефа, просто чтобы всегда в одном порядке были
	
	for itemIdx, defName in ipairs( itemsSorted ) do
		local itemName = UI:GetEntityLocalizedNameByDef( defName, true, false, nil, nil, false )
		text = string.format( "%s|%s", text, itemName )	
	end
	
	if UI.ShipPresetsWnd:IsPresetEqualToCurrent( data.preset ) then
	
		local strEqualToCurrent = string.format( "%s%s", UI:Color2Str( UI.GREEN_COLOR ), UI:GetStringByName( "shipPresets_presetSlot_tooltipText_equalToCurrent" ) )
		text = string.format( "%s||%s", text, strEqualToCurrent )
		
	else
	
		local lostItems = UI.ShipPresetsWnd:GetPresetLostItems( data.preset )
		if next( lostItems ) then
		
			local strLostItems = string.format( "%s%s", UI:Color2Str( UI.RED_COLOR ), UI:GetStringByName( "shipPresets_presetSlot_tooltipText_lostItems" ) )
		
			table.sort( lostItems )	-- сортировка по техническому имени дефа, просто чтобы всегда в одном порядке были
			
			for itemIdx, defName in pairs( lostItems ) do
				local itemName = UI:GetEntityLocalizedNameByDef( defName, true, false, nil, nil, false )
				strLostItems = string.format( "%s|%s", strLostItems, itemName )	
			end
			
			text = string.format( "%s||%s", text, strLostItems )
		
		end
		
	end
	
	self.tooltipData.text = text
	
end


--
function UI.ShipPresets_PresetSlotWnd:UpdateMouseOver()

	local bMouseOver = false
	
	if not self:IsSelected() then
		wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipPresets_PresetSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.ShipPresets_PresetSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ShipPresets_PresetSlotWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ShipPresets_PresetSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end

-- ----------------------------------------------------------------
-- UI.ShipPresets_SaveBtn
-- ----------------------------------------------------------------

UI.ShipPresets_SaveBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "ShipPresets_SaveBtn",
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
					defName 			= "shipPresets_saveBtn_1080",
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
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "press",
			animationDisabled		= "disable",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}

-- ----------------------------------------------------------------
-- UI.ShipPresets_ApplyBtn
-- ----------------------------------------------------------------

UI.ShipPresets_ApplyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "ShipPresets_ApplyBtn",
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
					defName 			= "shipPresets_applyBtn_1080",
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
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "press",
			animationDisabled		= "disable",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}

-- ----------------------------------------------------------------
-- UI.ShipPresets_AddBtn
-- ----------------------------------------------------------------

UI.ShipPresets_AddBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "ShipPresets_AddBtn",
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
					defName 			= "shipPresets_addBtn_1080",
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
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "press",
			animationDisabled		= "disable",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}

-- ----------------------------------------------------------------
-- UI.ShipPresets_RemoveBtn
-- ----------------------------------------------------------------

UI.ShipPresets_RemoveBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "ShipPresets_RemoveBtn",
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
					defName 			= "shipPresets_removeBtn_1080",
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
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "press",
			animationDisabled		= "disable",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}
