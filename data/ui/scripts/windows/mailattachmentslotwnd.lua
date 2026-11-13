-- ----------------------------------------------------------------------------
--
-- Workfile: mailattachmentslotwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------


-- --------------------------------------------------------
-- UI.MailAttachmentSlotWnd
-- --------------------------------------------------------

UI.MailAttachmentSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.MailAttachmentSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "MailAttachmentSlotWnd",	
		isPrototype	= true,
	},
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.MailAttachmentSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.itemIcoWnd:Reset()

end

-- ---------------------------
-- vars
-- ---------------------------

UI.MailAttachmentSlotWnd.itemIcoWnd	= nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.MailAttachmentSlotWnd:F_PostLoad()

    UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()	

end


--
function UI.MailAttachmentSlotWnd:CreateControls()	

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self:AddChild( self.itemIcoWnd )

	self:SetWidth( self.itemIcoWnd:GetWidth() )
	self:SetHeight( self.itemIcoWnd:GetHeight() )

end


--
function UI.MailAttachmentSlotWnd:UpdateForData( data )

	self:Reset()

	local itemType = UI:GetMailAttachmentType( data.attachment )
	local itemTypeName = UI:Val2Key( UI.mailAttachmentTypes, itemType )

	local fnUpdateName = string.format( "Update_%s", itemTypeName )
	local fnUpdate = self[ fnUpdateName ]

	if fnUpdate then
		fnUpdate( self, data )
	else
		sys.log( "UI.MailAttachmentSlotWnd:UpdateForData()[ERROR]: cannot find function \"%s()\"", fnUpdateName )
	end

end


--
function UI.MailAttachmentSlotWnd:Update_ITEM( data )

	local defName		= UI:GetMailAttachmentItemDefName( data.attachment )
	local count			= UI:GetMailAttachmentItemCount( data.attachment )
	local bEnchanted	= UI:GetMailAttachmentItemEnchantedStatus( data.attachment )

	-- иконка

	self.itemIcoWnd:SetupForItem( defName, bEnchanted )

	if count > 1 then
		self.itemIcoWnd:SetCountInventory( count )
	end

	-- тултип

	local tooltipData = UI:GetTooltipForItem( defName )
	self.itemIcoWnd:SetTooltipData( tooltipData )	

end


--
function UI.MailAttachmentSlotWnd:Update_CREDITS( data )

	local money = UI:GetMailAttachmentCredits( data.attachment )	

	-- иконка

	local hTex = UI:GetMailAttachmentCreditsIco()
	self.itemIcoWnd:SetupIco( hTex )

	self.itemIcoWnd:SetCountInventory( money )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_GOLD( data )

	local money = UI:GetMailAttachmentGold( data.attachment )	

	-- иконка

	local hTex = UI:GetMailAttachmentGoldIco()
	self.itemIcoWnd:SetupIco( hTex )

	self.itemIcoWnd:SetCountInventory( money )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


-- #0100779 лояльность больше нет, но на всякий случай письма поддерживаются, вдруг остались старые
function UI.MailAttachmentSlotWnd:Update_LOYALTY_LEGACY( data )

	local rep = UI:GetMailAttachmentLoyalty( data.attachment )

	-- иконка

	local hTex = UI:GetMailAttachmentLoyaltyIco()
	self.itemIcoWnd:SetupIco( hTex )

	self.itemIcoWnd:SetCountInventory( rep )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета


	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_RACE_REP( data )

	local race = UI:GetMailAttachmentRace( data.attachment )
	local rep = UI:GetMailAttachmentRaceRep( data.attachment )

	-- иконка

	local hTex = UI:GetMailAttachmentRaceRepIco( race )	
	self.itemIcoWnd:SetupIco( hTex )

	self.itemIcoWnd:SetCountInventory( rep )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета


	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_TOKENS( data )

	local tokens = UI:GetMailAttachmentTokens( data.attachment )	

	-- иконка

	local hTex = UI:GetMailAttachmentTokensIco()
	self.itemIcoWnd:SetupIco( hTex )

	self.itemIcoWnd:SetCountInventory( tokens )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_SYNERGY_FREE( data )

	local synergy = UI:GetMailAttachmentSynergyFree( data.attachment )	

	-- иконка

	local hTex = UI:GetMailAttachmentSynergyFreeIco()
	self.itemIcoWnd:SetupIco( hTex )

	self.itemIcoWnd:SetCountInventory( synergy )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_SYNERGY_SHIP( data )

	local synergy = UI:GetMailAttachmentSynergyShip( data.attachment )	

	-- иконка

	local hTex = UI:GetMailAttachmentSynergyShipIco()
	self.itemIcoWnd:SetupIco( hTex )

	self.itemIcoWnd:SetCountInventory( synergy )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_PREMIUM( data )

	local time = UI:GetMailAttachmentPremiumTime( data.attachment )	

	-- иконка

	local hTex = UI:GetMailAttachmentPremiumIco()
	self.itemIcoWnd:SetupIco( hTex )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_TITLE( data )

	local titleId = UI:GetMailAttachmentTitle( data.attachment )

	-- иконка

	local hTex = UI:GetMailAttachmentTitleIco()
	self.itemIcoWnd:SetupIco( hTex )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
	tooltipData.caption		= UI:MailAttachment2Str( data.attachment )
	tooltipData.text		= UI:GetTitleDesc( titleId )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_TALENT_SET( data )

	local talentSetId = UI:GetMailAttachmentTalentSet( data.attachment )

	-- иконка

	local hTex = UI:GetMailAttachmentTalentSetIco( talentSetId )
	self.itemIcoWnd:SetupIco( hTex )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_ACCOUNT_AURA( data )

	local defName = UI:GetMailAttachmentAccountAura( data.attachment )

	-- иконка

	local hTex = UI:GetMailAttachmentAccountAuraIco( defName )
	self.itemIcoWnd:SetupIco( hTex )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
	tooltipData.caption		= UI:AccountAura2Str( defName )
	tooltipData.text		= UI:GetAccountAuraDesc( defName )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_EVENT_CREDITS( data )

	local eventCredits  = UI:GetMailAttachmentEventCredits( data.attachment )	

	-- иконка

	local hTex = UI:GetMailAttachmentEventCreditsIco()
	self.itemIcoWnd:SetupIco( hTex )

	self.itemIcoWnd:SetCountInventory( eventCredits )
	-- self.itemIcoWnd:ShowColorBg2( UI:GetItemQualityColor( UI.MK1_QUALITY ) )	-- #0100859 - без цвета
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_CUSTOM_ELEMENT( data )	

	local customElement = UI:GetMailAttachmentCustomElement( data.attachment )

	-- иконка
	
	self.itemIcoWnd:SetupShipCustomuzation( customElement )	
	

	-- тултип

	local tooltipData = {}
	tooltipData.tooltipType	= UI.tooltipTypes.CUSTOMIZATION
	tooltipData.defName		= customElement

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_AVATAR( data )

	local avatar = UI:GetMailAttachmentAvatar( data.attachment )

	-- иконка
	
	local hTex = UI:GetMailAttachmentAvatarIco( avatar )
	self.itemIcoWnd:SetupIco( hTex )
	

	-- тултип

	local tooltipData = {}
	tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_MOTTO( data )

	-- иконка

	local hTex = UI:GetMailAttachmentMottoIco()
	self.itemIcoWnd:SetupIco( hTex )
	

	-- тултип

	local tooltipData = {}
    tooltipData.tooltipType = UI.tooltipTypes.TEXT_SMALL
	tooltipData.text		= UI:MailAttachment2Str( data.attachment )

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.MailAttachmentSlotWnd:Update_AUTOGEN( data )

	local autogenItem = UI:GetMailAttachmentAutogenItem( data.attachment )
	local defName = UI:AddTempAutogenDef( autogenItem )

	-- иконка
	
	self.itemIcoWnd:SetupForItem( defName, false )
	

	-- тултип

	local tooltipData = UI:GetTooltipForItem( defName )
	self.itemIcoWnd:SetTooltipData( tooltipData )

end