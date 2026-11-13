-- 
--SSS = {}
print_modules = false
if print_modules then 
	sort_by_role = { {}, {}, {},  {}, {},{}, {},{},{},{}}
end
Salvage_Array = {
--Iridium_plate  	--3
--Pure_silicon   		--3
--Tungsten_plate	--5
--Computing_chip 	--4
--Explosion		--4
--Processor_block	--3+
--Screened_battery	--4+
--T1		
		{
--mk2 
			{ 
--[[ 				{}, --def = "Iridium_plate", count = 1 
				{}, --def = "Pure_silicon", count = 1  ]]
			},
--mk3
			{ 
--[[ 				{{ def = "Iridium_plate", count = 1 },{ def = "Pure_silicon", count = 1 } },
				{{ def = "Pure_silicon", count = 3 }},
				{{ def = "Iridium_plate", count = 3 }},
				{{ def = "Iridium_plate", count = 2 },{ def = "Pure_silicon", count = 1 } },
				{{ def = "Iridium_plate", count = 2 },{ def = "Pure_silicon", count = 2 } }, ]]
			},
--mk4	
			{ 
				{{ def = "ow_Impure_iridium", count = 1 },},
				{{ def = "ow_Tungsten_ore", count = 1 },}, 
			},

--mk5
			{ 
				{{ def = "ow_Impure_iridium", count = 1 },{ def = "Pure_silicon", count = 3 }},
				{{ def = "ow_Tungsten_ore", count = 1 },{ def = "Iridium_plate", count = 3 }},
			},
		},
--T2		
		{
--mk2 
			{ 
--[[ 				{{ def = "Iridium_plate", count = 1 }},
				{{ def = "Pure_silicon", count = 1 }}, ]]
			},
--mk3
 			{ 
--[[ 				{{ def = "ow_Impure_iridium", count = 1 }, },
				{{ def = "ow_Tungsten_ore", count = 1 }},
				{{ def = "ow_Osmium_ore", count = 1 }}, ]]
			}, 
--mk4	
			{ 
				{{ def = "ow_Impure_iridium", count = 1 }, },
				{{ def = "ow_Tungsten_ore", count = 1 }},
				{{ def = "ow_Osmium_ore", count = 1 }},
			},

--mk5
			{ 
				{{ def = "Iridium_plate", count = 1 },},
				{{ def = "Pure_silicon", count = 1 },},
				{{ def = "Tungsten_plate", count = 1 },},
				{{ def = "Explosion", count = 1 },},
				{{ def = "Computing_chip", count = 1 },},
			},
		},		
--T3		
		{
--mk2 
			{ 
				{{ def = "ow_Impure_iridium", count = 1 }},
				{{ def = "ow_Tungsten_ore", count = 1 }},
				{{ def = "ow_Osmium_ore", count = 1 }},
			},
--mk3
			{ 
				{{ def = "Iridium_plate", count = 1 },{ def = "Pure_silicon", count = 1 } },
				{{ def = "Pure_silicon", count = 1 }, { def = "Computing_chip", count = 1 }},
			},
--mk4	
			{ 
				{{ def = "Computing_chip", count = 1 },{ def = "Pure_silicon", count = 2 }},
				{{ def = "Tungsten_plate", count = 1 },{ def = "Iridium_plate", count = 2 }},
			},

--mk5
			{ 
				{{ def = "Computing_chip", count = 2 },{ def = "Pure_silicon", count = 2 }},
				{{ def = "Processor_block", count = 1 },{ def = "Iridium_plate", count = 1 }},
			},
		},
--T4		
		{
--mk2 
			{ 
				{{ def = "Computing_chip", count = 2 },{ def = "Iridium_plate", count = 1 }},
				{{ def = "Explosion", count = 2 },{ def = "Pure_silicon", count = 1 }},
			},
--mk3
			{ 
				{{ def = "Computing_chip", count = 2 },	{ def = "Pure_silicon", count = 2 } },
				{{ def = "Iridium_plate", count = 2 },	{ def = "Explosion", count = 2 } },
				{{ def = "Processor_block", count = 1 }},
			},
--mk4	
			{ 
				{{ def = "Computing_chip", count = 2 },	{ def = "Pure_silicon", count = 3 } },
				{{ def = "Iridium_plate", count = 2 },	{ def = "Explosion", count = 3 } },
				{{ def = "Processor_block", count = 1 }},
				{{ def = "Screened_battery", count = 1 }},
			},

--mk5
			{ 
				{{ def = "Screened_battery", count = 2 },	{ def = "Pure_silicon", count = 6 } },
				{{ def = "Screened_battery", count = 2 },	{ def = "Explosion", count = 5 } },
				{{ def = "Screened_battery", count = 2 },	{ def = "Processor_block", count = 2 } },
				{{ def = "Screened_battery", count = 2 },	{ def = "Computing_chip", count = 5 } },
				
			},
		},		
--T5		
		{
--mk2 
			{ 
				{{ def = "Tungsten_plate", count = 2 },{ def = "Iridium_plate", count = 3 }},
				{{ def = "Tungsten_plate", count = 2 },{ def = "Pure_silicon", count = 3 }},
				{{ def = "Explosion", count = 4 },{ def = "Pure_silicon", count = 3 }},
				{{ def = "Computing_chip", count = 5 },{ def = "Iridium_plate", count = 5 }},
			},
--mk3
			{ 
				{{ def = "Tungsten_plate", count = 5 },{ def = "Computing_chip", count = 6 } },
				{{ def = "Explosion", count = 7 },{ def = "Computing_chip", count = 6 } },
				{{ def = "Tungsten_plate", count = 10 }},
			},
--mk4	
			{ 
				{{ def = "Screened_battery", count = 1 },	{ def = "Computing_chip", count = 6 } },
				{{ def = "Screened_battery", count = 1 },	{ def = "Explosion", count = 6 } },
				{{ def = "Screened_battery", count = 1 },	{ def = "Pure_silicon", count = 6 } },
				{{ def = "Screened_battery", count = 1 },	{ def = "Tungsten_plate", count = 6 } },				
				{{ def = "Screened_battery", count = 1 },	{ def = "Processor_block", count = 1 } },
			},

--mk5
			{ 
				{{ def = "Screened_battery", count = 1 },{ def = "Processor_block", count = 7 }},
				{{ def = "Screened_battery", count = 1 },{ def = "Processor_block", count = 5 }},
			},
		},		
	}


--[[ built chains should look like that:
ModuleUpgradeChain[ ItemSubtype.LaserBasic ] =
{
	{ "Weapon_Laser_Basic_T1_Mk1", "Weapon_Laser_Basic_T1_Rare", "Weapon_Laser_Basic_T1_Mk3", "Weapon_Laser_Basic_T1_Epic" }, -- T1
	*, -- T2
	*, -- T3
	*, -- T4
	*, -- T5
}
]]

-- Специальные токены для апгрейда вещей в зелень и фиолет заполняются здесь.
-- Так же формируется последовательность что из чего апгрейдится.
-- Прописываются детали на которые 
local function BuildUpgradeChain()
	
	
	
	function SetSalvageParts( item ) --
		local mk_ = nil
		if item.tier and item.mark  then
			if item.mark == 2 or item.mark == 6 then
				mk_ = 2
			elseif	item.mark == 3 or item.mark == 4 then
				mk_ = 3
			elseif	item.mark == 7 then
				mk_ = 4
			elseif	item.mark == 5 then
				mk_ = 5
			end
			if mk_ and #Salvage_Array[ item.tier ][ mk_-1 ] > 0 then
				local n = item.item_subtype and math.mod( item.item_subtype, #Salvage_Array[ item.tier ][ mk_-1 ] ) + 1 or 1
				item.salvage = Salvage_Array[ item.tier ][ mk_-1 ][ n ]
			end
		end
	end


	
	

	local ModuleUpgradeChain = {}
	local bp_Rel_set = {}
	for k, isubtype in pairs( ItemSubtype ) do
		ModuleUpgradeChain[ isubtype ] = {}
		for tier= 1, 5 do
			ModuleUpgradeChain[ isubtype ][ tier ] = {}
		end
	end	
	local PremiumShips = {}
	
	local cur_storeItemId = 500
	for defName, def in pairs( Def ) do
		if def.tier ~= nil and def.item_subtype ~= nil
				and def.storeItemId ~= nil and def.mark ~= nil
				and def.module_type ~= nil and def.module_type ~= ai.ModuleType.MUNITION and def.module_type < ai.ModuleType.SPECIAL then
			local pos = nil
			if def.mark == 1 and string.sub( defName, -4 ) == "_Mk1" then
				pos = 1
			--elseif def.mark == 2 and string.sub( defName, -4 ) == "_Mk2" then
			--	pos = 2
			elseif def.mark == 6 and string.sub( defName, -5 ) == "_Rare" then
				pos = 2
			elseif def.mark == 3 and string.sub( defName, -4 ) == "_Mk3" then
				pos = 3
			elseif def.mark == 7 and string.sub( defName, -5 ) == "_Epic" then
				pos = 4				
			elseif def.mark == 5 and string.sub( defName, -4 ) == "_Rel" then
				pos = 5				
			end
			if pos ~= nil then
				ModuleUpgradeChain[ def.item_subtype ][ def.tier ][ pos ] = defName 
				SetSalvageParts( def )
			end
		end
		--собирем все БП которые апают вещи до релика. (предпологаем что они используются в цепочке)
		if def.is_blueprint and  Def[ def.craft_result ] and Def[ def.craft_result ].mark == 5 then
			bp_Rel_set[ def.craft_result ] = true
		
			if def.hide_from_player == true  then
				Def[ def.craft_result ].HideFromPlayer = true --97990 скрываю модуль, если его блупринт скрыт от игрока
			end
		end
		
		--Обновляем storeItemId
		if def.ods_export and def.storeItemId and def.storeItemId > 0 then
			def.storeItemId = cur_storeItemId 
			cur_storeItemId = cur_storeItemId + 1
		end
		
		
		--Вставляем зеленые корабли в дерево
		if def.insert_into_VesselTree then
			VesselTree[ defName ] = { module_upgrade_chain = true }
		end
		
		-- генерим список премиум-классик кораблей 
		if def.role and def.isPremium then
			if not PremiumShips[def.role] then 
				PremiumShips[def.role] = {}
			end
			PremiumShips[def.role][defName] =  def 
		end
	end
--dprint( "MaxGenerated storeItemId started from 500 = " .. tostring( cur_storeItemId ) )

	local storeItemId = 26000  --отсюда начинаем пул токенов 
	local token_ilvl_rare = { 16, 17.5, 20, 22, 25 }
	local token_ilvl_epic = { 16, 19, 21, 23.1, 25.5 }
	local token_ilvl_rel = { 16, 19, 21, 23.1, 25.5 }
	for k, isubtype in pairs( ItemSubtype ) do
		for isubtype, isub_array in pairs( ModuleUpgradeChain[ isubtype ] ) do
			if Def[ isub_array[ 3 ] ] and Def[ isub_array[ 3 ] ].premiumPrice then
				for n, def  in pairs( isub_array ) do
					--значения позолоты
					Def[ def ].enchanting_price = math.floor( Def[ isub_array[ 3 ] ].premiumPrice * 0.25 )
					Def[ def ].enchant_exp_mul = 0.03
				end
				--Значения итем ЛВЛ для спец токенов
				if Def[ isub_array[ 2 ] ] and  Def[ isub_array[ 2 ] ].upgrade_cost_negator then
					--debug
								if not ( isub_array[ 2 ] and Def[ isub_array[ 2 ] ] and Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ] and Def[ isub_array[ 2 ] ].tier ) then
									dprint("Warning - error in data  ---   possible error in EXEL data export!")
									dprint( Def[ isub_array[ 2 ] ] )
									dprint("---------------------")
									dprint( Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ] )
								end 
					---------
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].item_lvl = token_ilvl_rare[ Def[ isub_array[ 2 ] ].tier ]
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].class = "SpaceShipModule"
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].storeItemId = storeItemId
					storeItemId = storeItemId + 1
					if Def[ isub_array[ 2 ] ].module_type then
						Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].module_type = Def[ isub_array[ 2 ] ].module_type
					end
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].tier = Def[ isub_array[ 2 ] ].tier
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].rank = Def[ isub_array[ 2 ] ].rank
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].item_subtype = Def[ isub_array[ 2 ] ].item_subtype
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].default_icon = Def[ isub_array[ 2 ] ].default_icon
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].cant_be_bought = true
					--Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].upgrade_to_item = isub_array[ 2 ]
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].shopCategory	 = "TOKEN"  --Def[ isub_array[ 2 ] ].shopCategory 
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].shopSubCategory = "RARE" --Def[ isub_array[ 2 ] ].shopSubCategory
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].mark = Def[ isub_array[ 2 ] ].mark
					Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ].price = math.floor( Def[ isub_array[ 2 ] ].price / 1 ) 
					SetSalvageParts( Def[ Def[ isub_array[ 2 ] ].upgrade_cost_negator ] )
					--uiName 
					--upgrade_to_item
				end
				if Def[ isub_array[ 4 ] ] and  Def[ isub_array[ 4 ] ].upgrade_cost_negator then
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].item_lvl = token_ilvl_epic[ Def[ isub_array[ 4 ] ].tier ]
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].class = "SpaceShipModule"
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].storeItemId = storeItemId
					storeItemId = storeItemId + 1
					if Def[ isub_array[ 4 ] ].module_type then
						Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].module_type = Def[ isub_array[ 4 ] ].module_type
					end					
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].tier = Def[ isub_array[ 4 ] ].tier
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].rank = Def[ isub_array[ 4 ] ].rank
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].item_subtype = Def[ isub_array[ 4 ] ].item_subtype
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].default_icon = Def[ isub_array[ 4 ] ].default_icon
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].cant_be_bought = true
					--Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].upgrade_to_item = isub_array[ 4 ]
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].shopCategory	 = "TOKEN"   --Def[ isub_array[ 4 ] ].shopCategory 
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].shopSubCategory = "EPIC" --Def[ isub_array[ 4 ] ].shopSubCategory					
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].mark = Def[ isub_array[ 4 ] ].mark
					Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ].price = math.floor( Def[ isub_array[ 4 ] ].price / 1 ) 
					--SetSalvageParts( Def[ Def[ isub_array[ 4 ] ].upgrade_cost_negator ] )
				end		
				--токены для реликов есть только для модов компьютеров, но я как понимаю мы  их никогда никому не дропали.
				if Def[ isub_array[ 5 ] ] and  Def[ isub_array[ 5 ] ].upgrade_cost_negator then
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].item_lvl = token_ilvl_rel[ Def[ isub_array[ 5 ] ].tier ]
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].class = "SpaceShipModule"
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].storeItemId = storeItemId
					storeItemId = storeItemId + 1
					if Def[ isub_array[ 5 ] ].module_type then
						Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].module_type = Def[ isub_array[ 4 ] ].module_type
					end					
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].tier = Def[ isub_array[ 5 ] ].tier
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].rank = Def[ isub_array[ 5 ] ].rank
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].item_subtype = Def[ isub_array[ 5 ] ].item_subtype
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].default_icon = Def[ isub_array[ 5 ] ].default_icon
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].cant_be_bought = true
					--Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].upgrade_to_item = isub_array[ 5 ]
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].shopCategory	 = "TOKEN"   --Def[ isub_array[ 4 ] ].shopCategory 
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].shopSubCategory = "EPIC" --Def[ isub_array[ 4 ] ].shopSubCategory					
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].mark = Def[ isub_array[ 5 ] ].mark
					Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ].price = math.floor( Def[ isub_array[ 5 ] ].price / 1 ) 
					--SetSalvageParts( Def[ Def[ isub_array[ 5 ] ].upgrade_cost_negator ] )
				end
			end
			
			-- проверка что этот модуль можно "шарить" с премиум кораблями
			local def = Def[ isub_array[ 1 ] ]
			
			-- проверим "существуют премы с униками на которые можно ставить новые уники, это превращает премы в пей ту вин. надо разобраться есть ли такое и если есть, то сделать уникальные модули с			тэгом "уник"
--[[ 			if def and def.required_ship and Def[ def.required_ship ] and Def[ def.required_ship ].premiumPrice and ( not Def[ def.required_ship ].craftable_reagents ) then
				if print_modules then
					sys.out( "premium MODULE: " .. tostring( isub_array[ 1 ] ))
				end
				for n, def1  in pairs( isub_array ) do
					Def[ def1 ].tags_mask = Def[ def1 ].tags_mask and ( Def[ def1 ].tags_mask + ai.ModuleTagsMask.UNIQUE ) or ai.ModuleTagsMask.UNIQUE
				end
			end ]]
			
			 -- модуль требует корабль и корабль этот серебряный, продающийся, некрафтовый,   и корабль этот с ролью и у нас есть премиум корабли этой роли
			if def and def.required_ship and Def[ def.required_ship ] and Def[ def.required_ship ].price and ( not Def[ def.required_ship ].cant_be_bought ) and ( not Def[ def.required_ship ].craftable_reagents ) and 
										Def[ def.required_ship ].role and PremiumShips[ Def[ def.required_ship ].role ] then
				--sys.out( isub_array[ 1 ] )
				--[[
				--вывод итем субтайп
				if not SSS[def.item_subtype] then
					for iii, vvv in pairs(ItemSubtype) do
						if def.item_subtype == vvv then
							sys.out( iii )
							SSS[def.item_subtype] = true
						end
					end
				end
				]]
-- вывод списка модулей в лог
				if print_modules then
					my_module_type = { [0]= "WEAPON", [4] = "ACTIVE", [6] = "ENGINE_MOD", [8] = "CAPACITOR_MOD", [10] = "SHIELD_MOD",[12] = "ARMOR_MOD",[14] = "CPU_MOD", }
					my_role = { [ai.ShipRoles.SCOUT] = "SCOUT(RAZVEDKA)", [ai.ShipRoles.RECON] = "RECON(DIVERSANT)", [ai.ShipRoles.ECM] = "ECM(REB)", [ai.ShipRoles.ATTACK] = "ATTACK(UDARKA)", [ai.ShipRoles.TACKLER] = "TACKLER(ZAGRAD)", [ai.ShipRoles.COMMAND] = "COMMAND", [ai.ShipRoles.ENGINEER] = "ENGINEER", [ai.ShipRoles.GUARD] = "GUARD", [ai.ShipRoles.SNIPER] = "SNIPER", }
					my_weapon_class = { [ai.WeaponClass.LASER] = "LASER", [ai.WeaponClass.PLASMAGUN] = "PLASMAGUN", [ai.WeaponClass.RAILGUN] = "RAILGUN", }
					local weapon_class  = def.weapon_class and my_weapon_class[def.weapon_class] or "" 
					if def.required_role then 
						table.insert( sort_by_role[def.required_role], tostring( isub_array[ 1 ] ) .." " .. tostring( my_role[ def.required_role ] ) .." " .. tostring( def.required_ship ).." " .. tostring( def.rank ) .. " ".. my_module_type[def.module_type] .. " ".. weapon_class )  
					else 
						sys.out("WARNING вывод списка модулей: ".. tostring(def.required_role) .. " " .. isub_array[ 1 ])
					end
				end
				--sys.out( tostring( isub_array[ 1 ] ) .." " .. tostring( my_role[ def.required_role ] ) .." " .. tostring( def.required_ship ).." " .. tostring( def.rank ) .. " ".. my_module_type[def.module_type] ..  " ".. weapon_class )
-- вписать  премиумы в себя:
				local temp_table = { def.required_ship }
				for ii, ship_def in pairs( PremiumShips[Def[ def.required_ship ].role] ) do
					if ship_def.rank >= def.rank_min and ship_def.rank <= def.rank_max then
						if ship_def.progress then
							local prev_ii = ship_def.prev
							while prev_ii do
								ii = prev_ii
								prev_ii = Def[ ii ].prev
							end
						end
						table.insert( temp_table, ii )
					end
				--Def[ def.required_ship ].role
				end
				for n, def1  in pairs( isub_array ) do
					Def[ def1 ].enchanting_price = math.floor( Def[ isub_array[ 3 ] ].premiumPrice * 0.25 )
					if #temp_table > 1 then
						Def[ def1 ].required_ship = temp_table
					end
					-- таги модулей для эвента 2017 #85081
					Def[ def1 ].tags_mask = Def[ def1 ].tags_mask and Def[ def1 ].tags_mask + ai.ModuleTagsMask.NEW_YEAR_2017 or ai.ModuleTagsMask.NEW_YEAR_2017 
					-- #85547 модули, надевание которых ограничено, прописываем тут, если появятся новые модули то надо доработать алгоритм выдавания тэга
					Def[ def1 ].tags_mask = Def[ def1 ].tags_mask + ai.ModuleTagsMask.UNIQUE 
				end
			end
			
			--цепочки апгрейдов для Лены
	--[[CreditsType =
	{
		CT_INVALID			= 0,
		CT_CREDITS			= 1,
		CT_GOLD				= 2,
		CT_TOKENS			= 3,
	},]]	
			if Def[ isub_array[ 1 ] ]  then
				Def[ isub_array[ 1 ] ].next_upgrade = isub_array[ 2 ]
				Def[ isub_array[ 1 ] ].prev_upgrade = nil
				Def[ isub_array[ 1 ] ].upgrade_currency = { GameStore.CreditsType.CT_GOLD } 
				Def[ isub_array[ 1 ] ].current_upgrade_level = 1				
			end
			if Def[ isub_array[ 2 ] ]  then
				Def[ isub_array[ 2 ] ].next_upgrade = isub_array[ 3 ]
				Def[ isub_array[ 2 ] ].prev_upgrade = isub_array[ 1 ]
				Def[ isub_array[ 2 ] ].upgrade_currency = { GameStore.CreditsType.CT_GOLD } 
				Def[ isub_array[ 2 ] ].current_upgrade_level = 2
			end
			if Def[ isub_array[ 3 ] ]  then
				Def[ isub_array[ 3 ] ].next_upgrade = isub_array[ 4 ]
				Def[ isub_array[ 3 ] ].prev_upgrade = isub_array[ 2 ]
				Def[ isub_array[ 3 ] ].upgrade_currency = { GameStore.CreditsType.CT_GOLD } 
				Def[ isub_array[ 3 ] ].current_upgrade_level = 3
			end
			if Def[ isub_array[ 4 ] ]  then
				Def[ isub_array[ 4 ] ].next_upgrade = ""
				Def[ isub_array[ 4 ] ].prev_upgrade = isub_array[ 3 ]
				Def[ isub_array[ 4 ] ].current_upgrade_level = 4
				-- апгрейд по крафту
				if Def[ isub_array[ 5 ] ] and bp_Rel_set[ isub_array[ 5 ] ] then
					Def[ isub_array[ 4 ] ].next_upgrade = isub_array[ 5 ]
					Def[ isub_array[ 5 ] ].upgrade_through_craft = true
					Def[ isub_array[ 5 ] ].current_upgrade_level = 5
					--Def[ isub_array[ 4 ] ].upgrade_craftable = true
					--Def[ isub_array[ 4 ] ].upgrade_currency = { GameStore.CreditsType.CT_GOLD } 
					--Def[ isub_array[ 4 ] ].upgrade_currency =  { 0 } 
				end
			end
			if Def[ isub_array[ 5 ] ]  then
				Def[ isub_array[ 5 ] ].next_upgrade = ""
				Def[ isub_array[ 5 ] ].prev_upgrade = isub_array[ 4 ]
			end
		end
	end
	if storeItemId > 28999 then
		sys.log( "Warning: too many tokens" )
	end	
	
end

-- autocall
BuildUpgradeChain()


if print_modules then
	local summ = 0
	for i,v in pairs( sort_by_role ) do
		summ = summ + #v
		for ii, vv in pairs (v) do
			sys.out(vv)
		end
	end
	sys.out("Modules_count: "..tostring(summ))
end