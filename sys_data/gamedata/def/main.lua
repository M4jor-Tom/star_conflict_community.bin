
-- global entity def table
Def = {}
-- empty define AccountAura
AccountAura = {}

-- load Spell table
Spell = {}

-- load all EntityDefs
sys.execscript( 'gamedata/def/designersdefs.lua' )
sys.execscript( 'gamedata/def/logic.lua' )
sys.execscript( 'gamedata/def/joints.lua' )
sys.execscript( 'gamedata/def/filters.lua' )
sys.execscript( 'gamedata/def/base_defs.lua' )
sys.execscript( 'gamedata/def/sounds.lua' )


sys.execscript( 'gamedata/spell/spell.lua' )

sys.execscript( 'gamedata/developer.lua' )

-- fix inheritance
ai.FixupEntityDefs( "Def", "DefExtension" )
ai.FixupEntityDefs( "Spell", "SpellExtension" )


-- iterate through all sub-table in given table and check speciefied field is unique in all sub-tables
local CheckUniqueField = function( tabName, field1, field2 )
	local tab = _G[ tabName ]
	if not tab then return end
	for k, t in pairs( tab ) do
		local v = t[ field1 ]
		if v ~= nil then
			for k2, t2 in pairs( tab ) do
				if v == t2[ field2 ] and k ~= k2 then
					error( tabName .. " has two tables (" .. k .. ", " .. k2 .. ") with same " .. field1 )
				end
			end
		end
	end
end

CheckUniqueField( "Titles", "id", "id" )
