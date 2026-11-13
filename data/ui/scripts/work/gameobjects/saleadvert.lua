-- ----------------------------------------------------------------------------
--
-- Workfile: Vote.lua
-- Copyright é 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: vote.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

if UI.SaleAdvert then
	return
end
UI.SaleAdvert = {}

UI.SaleAdvert.loaded = false
UI.SaleAdvert.inited = false
UI.SaleAdvert.isAlreadyShow = false
UI.SaleAdvert.data = {}
UI.SaleAdvert.numData = 0
UI.SaleAdvert.textures = {}

--
function UI.SaleAdvert:Init()
	if not self.inited then
		_G.MasterServer_RequestWebAdvertisement()
		self.inited = true
	end
end

--
function UI.SaleAdvert:MasterServer_OnWebAdvertisement( result, desc )

	self:UnloadTextures()

	self.data = {}
	self.numData = 0
	local waitImage = false
	for k, v in ipairs( desc ) do
		if v.header ~= nil then
			v.hTex = UI.INVALID_RESOURCE_HANDLE
			table.insert( self.data, v )
			if v.imageUrl then
				waitImage = true
				-- wait MasterServer_OnWebAdvertImage( error, textureName )
			end
		end
	end

	self.numData = #self.data

	if not waitImage then
		self.loaded = true
		UI:OnSaleAdvertLoaded()
	end
end

--
function UI.SaleAdvert:MasterServer_OnWebAdvertImage( error, textureName, textureNameSmall )
	self.loaded = true
	for k, v in pairs( self.data ) do
		if v.imageUrl then
			v.textureName = textureName[ k ]
			v.textureNameSmall = textureNameSmall[ k ]
			if v.textureNameSmall == "" then
				v.textureNameSmall = nil
			end
		end
	end

	self:LoadTextures()

	UI:OnSaleAdvertLoaded()
end

--
function UI.SaleAdvert:OnShutdown()

	self:UnloadTextures()

end

--
function UI.SaleAdvert:IsLoaded()
	return self.loaded
end

--
function UI.SaleAdvert:IsAlreadyShow()
	return self.isAlreadyShow
end


--
function UI.SaleAdvert:SetAlreadyShow()
	self.isAlreadyShow = true
end

--
function UI.SaleAdvert:GetData()
	return self.data
end


--
function UI.SaleAdvert:GetNumData()
	return self.numData
end


--
function UI.SaleAdvert:UnloadTextures()

	for idx, data in pairs( self.data ) do
		if data.hTex and data.hTex ~= UI.INVALID_RESOURCE_HANDLE then
			UI:UnloadTexture( data.hTex, false )
			data.hTex = UI.INVALID_RESOURCE_HANDLE
		end
	end

end


--
function UI.SaleAdvert:LoadTextures()

	self:UnloadTextures()

	for idx, data in pairs( self.data ) do

		if type( data.textureName ) == "string" then

			if data.textureName ~= "" then

				data.hTex = UI:LoadTexture( data.textureName, data.textureName )

				if data.hTex == UI.INVALID_RESOURCE_HANDLE then
					sys.log( "UI.SaleAdvert:LoadTextures()[ERROR]: fail to load texture fora action %s", tostring( data.header ) )
				end

			else
				sys.log( "UI.SaleAdvert:LoadTextures()[ERROR]: empty \"textureName\" for action \"%s\"", tostring( data.header ) )
			end

		else
			sys.log( "UI.SaleAdvert:LoadTextures()[ERROR]: invalid type of \"textureName\" for action \"%s\"; \"string\" expected, got \"%s\"", tostring( data.header ), type( data.textureName ) )
		end

	end

end