-- ----------------------------------------------------------------------------
--
-- Workfile: shipcustomizationtooltipwnd.lua
-- Copyright é 2016, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ShipCustomizationTooltipWnd = {}

-- --------------------------
-- window definition
-- --------------------------

UI.ShipCustomizationTooltipWnd.def =
{
	className	= "Wnd",
	prototype	= "TooltipWnd",

	props =
	{
		name	= "ShipCustomizationTooltipWnd",
	}
}

-- --------------------------
-- interface functions
-- --------------------------

--
function UI.ShipCustomizationTooltipWnd:Setup( _data, bRestorePos )

	self.metaText:SetText( "", true )
	self:SetText( "", self.layers.CAPTION )

	if type( _data ) ~= "table" then
		sys.log( "UI.ShipCustomizationTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( _data ) )
		return
	end

	local data = UI:CopyTable2( _data )

	if data.defName ~= nil then
    	if type( data.defName ) ~= "string" then
    		sys.log( "UI.ShipCustomizationTooltipWnd:Setup()[ERROR]: invalid type of field \"defName\"; \"string\" expected, got \"%s\"", type( data.defName ) )
    		return
    	end
	end

	if data.defName == nil then
		data.defName = ""
	end

	if data.type ~= nil then
    	if type( data.type ) ~= "number" then
    		sys.log( "UI.ShipCustomizationTooltipWnd:Setup()[ERROR]: invalid type of field \"type\"; \"number\" expected, got \"%s\"", type( data.type ) )
    		return
    	end
	end

	if data.type == nil then
		data.type = -1
	end

	if data.defName == "" and data.type == -1 then
		sys.log( "UI.ShipCustomizationTooltipWnd:Setup()[ERROR]: invalid data - neither \"defName\" nor \"type\" are specified" )
		return
	end

	if data.defName ~= "" and data.type ~= -1 then
		sys.log( "UI.ShipCustomizationTooltipWnd:Setup()[ERROR]: invalid data - both \"defName\" and \"type\" are specified" )
		return
	end	

	local baseData =
	{
		caption	= self:MakeCaption( data ),
		text	= self:MakeText( data ),
	}

	UI.TooltipWnd.Setup( self, baseData, bRestorePos )

end

-- --------------------------
-- work functions
-- --------------------------

--
function UI.ShipCustomizationTooltipWnd:MakeCaption( data )

	return UI:GetStringByName( "customizationTooltip_caption" )

end


--
function UI.ShipCustomizationTooltipWnd:MakeText( data )

	local str = "error"

	local customizationType =
		data.type ~= -1
			and data.type
			or UI:GetCustomizationTypeByName( data.defName )


	if customizationType == ai.VesselCustomElementType.STICKER then

		local strUpCategory = UI:GetStringByName( "customization_STICKER" )

		local strCategory = ""

		if data.defName ~= "" then

			strCategory = "unknown group"

    		local groupId = UI:GetShipCustomizationGroup( data.defName )
    		if groupId ~= -1 then

    			local groupName = UI:Val2Key( _G.StickerGroups, groupId )
    			local strIdCategory = string.format( "customization_STICKER_%s", groupName )
				strCategory = UI:GetStringByName( strIdCategory )

    		else
    			sys.log( "UI.ShipCustomizationTooltipWnd:MakeText()[ERROR]: cannot find group for sticker \"%s\"", data.defName )
    		end

		end

		if strCategory ~= "" then
			strCategory = string.format( "(%s)", strCategory )
		end
		
		local strName =
			data.defName ~= ""
				and UI:ShipCustomization2Str( data.defName )
				or UI:GetStringByName( "sticker_none" )


		str = string.format( "%s%s%s: %s", strUpCategory, strCategory ~= "" and " " or "", strCategory, strName )


	elseif customizationType == ai.VesselCustomElementType.MATERIAL then

		local strUpCategory	= UI:GetStringByName( "customization_DYE" )
		local strCategory	= UI:GetStringByName( "customizationType_MATERIAL" )

		local strName =
			data.defName ~= ""
				and UI:ShipCustomization2Str( data.defName )
				or UI:GetStringByName( "shipColor_none" )

		str = string.format( "%s (%s): %s", strUpCategory, strCategory, strName )


	elseif customizationType == ai.VesselCustomElementType.MPRESET then

		local strUpCategory	= UI:GetStringByName( "customization_DYE" )
		local strCategory	= UI:GetStringByName( "customization_PRESET" )

		local strName =
			data.defName ~= ""
				and UI:ShipCustomization2Str( data.defName )
				or UI:GetStringByName( "shipPreset_none" )

		str = string.format( "%s (%s): %s", strUpCategory, strCategory, strName )

	elseif customizationType == ai.VesselCustomElementType.CHILD then

		local strCategory = UI:GetStringByName( "customization_CHILD" )

		local strName =
			data.defName ~= ""
				and UI:ShipCustomization2Str( data.defName )
				or UI:GetStringByName( "shipChild_none" )

		str = string.format( "%s: %s", strCategory, strName )

	else
		sys.log( "UI.ShipCustomizationTooltipWnd:MakeText()[ERROR]: unhandled customization type %d (\"%s\")", customizationType, UI:Val2Key( ai.VesselCustomElementType, customizationType ) )
	end

	return str

end                              	