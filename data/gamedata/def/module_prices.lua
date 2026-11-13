DefItemPrice = {}

sys.execscript( 'gamedata/def/ex/prices_ship.lua' )
sys.execscript( 'gamedata/def/ex/prices_modules.lua' )
sys.execscript( 'gamedata/def/ex/prices_expendables.lua' )
sys.execscript( 'gamedata/def/ex/prices_openspace.lua' )
sys.execscript( 'gamedata/def/ex/prices_tradegoods.lua' )

-- #34680 цены на товары теперь задаются в отдельной таблице. а потом мы их сливаем воедино
local function FixupDefItemPrices()

	for name, def in pairs( Def ) do
		if def.storeItemId and def.storeItemId ~= 0 then
			local overrideT = DefItemPrice[ name ]
			if overrideT then
				sys.mergeTable( def, overrideT )
				overrideT.fixup_processed = true
			else
--				sys.log( "Def %40s has non zero storeItemId, but hasn't overriden price", name )
			end
		end
	end

	for name, tab in pairs( DefItemPrice ) do
		if not tab.fixup_processed then 
--			sys.log( "Def %40s not exist to override its price", name )
		end
	end
	
	DefItemPrice = nil
end

-- call
FixupDefItemPrices() 