-- ------------------------------------------------------------
-- UI.Marketing_VouchersWnd
-- ------------------------------------------------------------

UI.Marketing_VouchersWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Marketing_VouchersWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Marketing_VouchersWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "marketing_vouchers_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "desription2",	
						layer		= "UI.Marketing_VouchersWnd.layers.NO_VOUCHERS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "bundle_list2",
						wnd			= "UI.Marketing_Vouchers_VouchersListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "info1",
						wnd			= "UI.Marketing_Vouchers_SelVoucherWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- NO_VOUCHERS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "vouchers_noVouchers" ),
		},
	},

	children =
	{
		"UI.Marketing_Vouchers_VouchersListWnd",
		"UI.Marketing_Vouchers_SelVoucherWnd",
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Marketing_VouchersWnd:GetVouchers()

	local vouchers = {}

	for idx, auraInfo in pairs( UI.serverData.accountAuras ) do

		if UI:IsAccountAuraVoucher( auraInfo.defName ) then
			table.insert( vouchers, auraInfo.defName )
		end

	end

	table.sort( vouchers )

	return vouchers

end


--
function UI.Marketing_VouchersWnd:OnSelVoucherSlotChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateSelVoucher()

end


--
function UI.Marketing_VouchersWnd:GetVoucherTimeLeft( defName )

	return self.times[ defName ], self.battles[ defName ]

end


--
function UI.Marketing_VouchersWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Marketing_VouchersWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Marketing_VouchersWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end

-- ---------------------------------
-- const
-- ---------------------------------

UI.Marketing_VouchersWnd.layers =
{
	MAIN_EFFECT	= 0,
	NO_VOUCHERS	= 1,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Marketing_VouchersWnd.times		= {}
UI.Marketing_VouchersWnd.battles	= {}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Marketing_VouchersWnd:Reset()

	self.times		= {}
	self.battles	= {}

	UI.Marketing_Vouchers_VouchersListWnd:Reset()

	if UI.Marketing_Vouchers_SelVoucherWnd:IsChildOf( self ) then
		UI.Marketing_Vouchers_SelVoucherWnd:Reset()
		UI.Marketing_Vouchers_SelVoucherWnd:UnlinkFromParent()
	end

	self:SetLayerVisible( false, self.layers.NO_VOUCHERS )

end


--
function UI.Marketing_VouchersWnd:FullUpdate()

	self:Reset()

	self:UpdateTimesData()

	UI.Marketing_Vouchers_VouchersListWnd:FullUpdate()
	self:UpdateNoVouchersText()

end


--
function UI.Marketing_VouchersWnd:UpdateSelVoucher()

	local selSlotWnd = UI.Marketing_Vouchers_VouchersListWnd:GetSelSlot()

	if selSlotWnd then
		self:AddChild( UI.Marketing_Vouchers_SelVoucherWnd )
		UI.Marketing_Vouchers_SelVoucherWnd:Setup( selSlotWnd:GetDefName() )
	else
		UI.Marketing_Vouchers_SelVoucherWnd:Reset()
		UI.Marketing_Vouchers_SelVoucherWnd:UnlinkFromParent()
	end
	
end


--
function UI.Marketing_VouchersWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.Marketing_VouchersWnd:OnAccountAurasChanged()

	UI.Marketing_Vouchers_VouchersListWnd:FullUpdate( true )
	self:UpdateNoVouchersText()

end


--
function UI.Marketing_VouchersWnd:UpdateNoVouchersText()

	local numVouchers = UI.Marketing_Vouchers_VouchersListWnd:GetNumVouchers()
	self:SetLayerVisible( numVouchers == 0, self.layers.NO_VOUCHERS )	

end


--
function UI.Marketing_VouchersWnd:UpdateTimesData()

	self.times		= {}
	self.battles	= {}

	local accountAuras = _G.MasterServer_GetAccountAuras()
	
	for idx, auraInfo in pairs( accountAuras ) do
	
		local timeDur, battlesDur = UI:GetAccountAuraDuration( auraInfo.defName )

		if timeDur then
			local isBP = UI:IsAccountAuraOnlyForBattlePass( auraInfo.defName )
			local timeLeft = auraInfo.timeLeft
			
			if isBP then
				local bpEndTime = UI:GetBattlePassEndTime()
				local bpTimeLeft = UI:GetLeftTimeFor( bpEndTime )
				
				if bpTimeLeft < timeLeft then
					timeLeft = bpTimeLeft
				end
			end
			
			self.times[ auraInfo.defName ] = timeLeft	-- предполагается, что не может быть наложено аур с одинаковыми дефами
		end

		if battlesDur then
			self.battles[ auraInfo.defName ] = auraInfo.counterLeft -- предполагается, что не может быть наложено аур с одинаковыми дефами
		end

	end

end


--
function UI.Marketing_VouchersWnd:UpdateTimes( bNewFrame )

	UI.Marketing_Vouchers_VouchersListWnd:UpdateTimes( bNewFrame )

	if UI.Marketing_Vouchers_SelVoucherWnd:IsChildOf( self ) then
		UI.Marketing_Vouchers_SelVoucherWnd:UpdateTime( bNewFrame )
	end

end


--
function UI.Marketing_VouchersWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimesData()
	self:UpdateTimes( true )

end


-- ----------------------------------------------------------------------------
-- UI.Marketing_Vouchers_VouchersListWnd
-- ----------------------------------------------------------------------------

UI.Marketing_Vouchers_VouchersListWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.Marketing_Vouchers_VouchersListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Marketing_Vouchers_VouchersListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "marketing_vouchers_vouchersList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "pages",	
						wnd			= "UI.Marketing_Vouchers_PagesWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		}
	},

	children = { "UI.Marketing_Vouchers_PagesWnd" }
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.Marketing_Vouchers_VouchersListWnd:FullUpdate( bRestoreLayout )

	if bRestoreLayout == nil then
		bRestoreLayout = false
	end

	local oldSelVoucher	= self:GetSelVoucher()
	local oldSelPage	= self.curPage

	self:Reset()

	self.vouchers = UI.Marketing_VouchersWnd:GetVouchers()
	self.numVouchers = #self.vouchers

	self:UpdatePagesList()

	if bRestoreLayout then

    	if oldSelVoucher ~= "" then

    		self:TryOpenVoucher( oldSelVoucher )

			if self:GetSelVoucher() ~= oldSelVoucher then
				if oldSelPage ~= -1 and oldSelPage <= self:GetNumPages() then
					self:SetPage( oldSelPage )
				end
			end

    	end

	end

	if self.curPage == -1 and self.numVouchers > 0 then
		self:SetPage( 1 )
	end
	
end


--
function UI.Marketing_Vouchers_VouchersListWnd:UpdateTimes( bNewFrame )

	for idx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:UpdateTime( bNewFrame )
		end
	end

end


--
function UI.Marketing_Vouchers_VouchersListWnd:Reset()

	self.curPage		= -1
	self.vouchers		= {}
	self.numVouchers	= 0

	self:ResetSlots()
	self:ResetPagesList()

end


--
function UI.Marketing_Vouchers_VouchersListWnd:GetSelSlot()

	return self.selSlot

end


--
function UI.Marketing_Vouchers_VouchersListWnd:GetSelVoucher()

	return self.selSlot and self.selSlot:GetDefName() or ""

end


--
function UI.Marketing_Vouchers_VouchersListWnd:TryOpenVoucher( selDefName )

	local page = -1

	for idx, defName in pairs( self.vouchers ) do

		if defName == selDefName then
			page = math.floor( ( idx - 1 ) / self.MAX_SLOTS ) + 1
			break
		end

	end

	if page == -1 then
		return
	end

	self:SetPage( page )

	local slotWnd = self:GetSlotForVoucher( selDefName )
	if slotWnd then
		self:SelectSlot( slotWnd, false )
	else
		sys.log( "UI.Marketing_Vouchers_PagesWnd:TryOpenVoucher()[ERROR]: cannot find slot" )
	end

end


--
function UI.Marketing_Vouchers_VouchersListWnd:GetNumVouchers()

	return self.numVouchers

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.Marketing_Vouchers_VouchersListWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Marketing_Vouchers_VouchersListWnd.MAX_SLOTS	= 20

UI.Marketing_Vouchers_VouchersListWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "slot_2_",
	}
}

UI.Marketing_Vouchers_VouchersListWnd.sounds =
{
	pageChange		= UI.sounds.btnClick,
	slotSelect		= UI.sounds.btnClick,
	slotMouseOver	= UI.sounds.btnMouseOver,
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.Marketing_Vouchers_VouchersListWnd.vouchers		= {}
UI.Marketing_Vouchers_VouchersListWnd.numVouchers	= 0
UI.Marketing_Vouchers_VouchersListWnd.slots			= {}
UI.Marketing_Vouchers_VouchersListWnd.curPage		= -1
UI.Marketing_Vouchers_VouchersListWnd.selSlot		= nil
UI.Marketing_Vouchers_VouchersListWnd.pagesList		= nil

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.Marketing_Vouchers_VouchersListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.pagesList = UI.Marketing_Vouchers_PagesWnd

	self:CreateControls()

end


--
function UI.Marketing_Vouchers_VouchersListWnd:CreateControls()

    local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for slotIdx = 1, self.MAX_SLOTS do

    	local slotWnd = UI:CreateChildWnd( self, UI.Marketing_Vouchers_VoucherSlotWnd, tostring( slotIdx ) )
    	table.insert( self.slots, slotWnd )

    	if mainEffect then
    		mainEffect:LinkWnd( slotWnd:GetUiHandle(), string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, slotIdx ), UI.EffectAnimParams.POS )
    	end

	end

end


--
function UI.Marketing_Vouchers_VouchersListWnd:ResetSlots()

	self:SelectSlot( nil, false )

	for slotIdx, slotWnd in pairs( self.slots ) do

		if slotWnd:IsChildOf( self ) then
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end

	end

end


--
function UI.Marketing_Vouchers_VouchersListWnd:ResetPagesList()

	self.pagesList:Reset()
	self.pagesList:UnlinkFromParent()

end


--
function UI.Marketing_Vouchers_VouchersListWnd:SetPage( page )

	if page == self.curPage then
		return
	end

	if page ~= -1 and page < 1 or page > self:GetNumPages() then
		sys.log( "UI.Marketing_Vouchers_VouchersListWnd:SetPage()[ERROR]: invalid page: %d", page )
		return
	end

	self.curPage = page

	self:UpdateSlots()
	self:UpdatePagesListForCurPage()

	self:ValidateSelSlot()

end


--
function UI.Marketing_Vouchers_VouchersListWnd:GetNumPages()

	return math.ceil( self.numVouchers / self.MAX_SLOTS )

end


--
function UI.Marketing_Vouchers_VouchersListWnd:UpdateSlots()

	self:ResetSlots()

	if self.numVouchers == 0 or self.curPage == -1 then
		return
	end

	local firstVisibleVoucherIdx	= ( self.curPage - 1 ) * self.MAX_SLOTS + 1
	local lastVisibleVoucherIdx		= math.min( firstVisibleVoucherIdx + self.MAX_SLOTS - 1, self.numVouchers )

	local slotIdx = 1

	for voucherIdx = firstVisibleVoucherIdx, lastVisibleVoucherIdx do

		local defName = self.vouchers[ voucherIdx ]

		local slotWnd = self.slots[ slotIdx ]

		self:AddChild( slotWnd )
		slotWnd:Setup( defName, false )

		slotIdx = slotIdx + 1

	end

end


--
function UI.Marketing_Vouchers_VouchersListWnd:UpdatePagesList()

	local numPages = self:GetNumPages()

	if numPages > 1 then

		self:AddChild( self.pagesList )
		self.pagesList:Setup( numPages, self.curPage )

	else
		self:ResetPagesList()
	end

end


--
function UI.Marketing_Vouchers_VouchersListWnd:UpdatePagesListForCurPage()	

	if not self.pagesList:IsChildOf( self ) then
		return
	end

	self.pagesList:SetSelPage( self.curPage )

end


--
function UI.Marketing_Vouchers_VouchersListWnd:SelectSlot( slotWnd, bSound )

	if self.selSlot == slotWnd then
		return
	end

	local selSlotOld = self.selSlot
	self.selSlot = slotWnd

	if selSlotOld then
		selSlotOld:Select( false )
	end

	if self.selSlot then

		self.selSlot:Select( true )

		if bSound and self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.slotSelect )
		end

	end

	UI.Marketing_VouchersWnd:OnSelVoucherSlotChanged()

end


--
function UI.Marketing_Vouchers_VouchersListWnd:ValidateSelSlot()

	if self.selSlot then
		return	
	end

	if self.numVouchers == 0 then
		return
	end

	local slotWnd = self.slots[ 1 ]
	self:SelectSlot( slotWnd, false )

end


--
function UI.Marketing_Vouchers_VouchersListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Pages_LeftArrowBtn" ) then

		self:SetPage( self.curPage - 1 )
		UI:PlayGlobalSound( self.sounds.pageChange )

	elseif UI:IsWndKindOf( wnd, "Pages_RightArrowBtn" ) then

		self:SetPage( self.curPage + 1 )
		UI:PlayGlobalSound( self.sounds.pageChange )

	elseif UI:IsWndKindOf( wnd, "Pages_SlotWnd" ) then

		local page = wnd:GetPage()
		if page ~= self.curPage then
			self:SetPage( page )
			UI:PlayGlobalSound( self.sounds.pageChange )
		end

	elseif UI:IsWndKindOf( wnd, "Marketing_Vouchers_VoucherSlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "Marketing_Vouchers_VoucherSlotWnd" ) then

		local slotWnd = UI:IsWndKindOf( wnd, "Marketing_Vouchers_VoucherSlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "Marketing_Vouchers_VoucherSlotWnd" )
		if not slotWnd:IsSelected() then
			self:SelectSlot( slotWnd, true )
		end
		
	end

	return false

end


--
function UI.Marketing_Vouchers_VouchersListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.curPage ~= -1 then

		local nextPage = UI:Clamp( self.curPage - ticks, 1, self:GetNumPages() )

		if nextPage ~= self.curPage then
			self:SetPage( nextPage )
			UI:PlayGlobalSound( self.sounds.pageChange )
		end

	end

	return true

end


--
function UI.Marketing_Vouchers_VouchersListWnd:GetSlotForVoucher( defName )

	local voucherSlotWnd = nil

	for idx, slotWnd in pairs( self.slots ) do
		if slotWnd:GetDefName() == defName then
			voucherSlotWnd = slotWnd
			break
		end
	end

	return voucherSlotWnd

end


-- ----------------------------------------------------------------------------
-- UI.Marketing_Vouchers_VoucherSlotWnd
-- ----------------------------------------------------------------------------

UI.Marketing_Vouchers_VoucherSlotWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

--
UI.Marketing_Vouchers_VoucherSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    TIME				= 1,
	SEL_EFFECT			= 2,
	MOUSE_OVER_EFFECT	= 3,
}


--
UI.Marketing_Vouchers_VoucherSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Marketing_Vouchers_VoucherSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true
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
				defName 			= "marketing_vouchers_voucherSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "price6",	
						layer		= "UI.Marketing_Vouchers_VoucherSlotWnd.layers.TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "select",	
						layer		= "UI.Marketing_Vouchers_VoucherSlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",	
						layer		= "UI.Marketing_Vouchers_VoucherSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "marketing_vouchers_voucherSlot_selection",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "marketing_vouchers_voucherSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}	

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.Marketing_Vouchers_VoucherSlotWnd:Setup( defName, bSelected )

	self:Reset()

	self.defName	= defName
	self.bSelected	= bSelected

	self:FullUpdate()

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:GetDefName()

	return self.defName

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:Reset()

	self.defName	= ""
	self.bSelected	= false

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.TIME )

	self:SetLayerVisible( false, self.layers.SEL_EFFECT )

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:Select( bSelected )

	self.bSelected = bSelected

	self:UpdateSelEffect()

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:IsSelected()

	return self.bSelected

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:UpdateTime( bNewFrame )

	local time, battles = UI.Marketing_VouchersWnd:GetVoucherTimeLeft( self.defName )

	if bNewFrame and not time then
		return
	end

	if time then

		local str = UI:Time2Str45( time )

		self:SetText( str, self.layers.TIME )

	elseif battles then

		local str = UI:SubstituteValLocalizedByStringId( "vouchers_timeLeft_fights_single", battles, "val" )
		str = string.format( str, battles )
		self:SetText( str, self.layers.TIME )

	end

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.Marketing_Vouchers_VoucherSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
	},
}

UI.Marketing_Vouchers_VoucherSlotWnd.sounds =
{
	mouseOver	= UI.sounds.btnMouseOver,
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.Marketing_Vouchers_VoucherSlotWnd.defName	= ""
UI.Marketing_Vouchers_VoucherSlotWnd.bSelected	= false

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.Marketing_Vouchers_VoucherSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:FullUpdate()

	self:UpdateSelEffect()
	self:UpdateIco()
	self:UpdateTime( false )

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:UpdateIco()

	local hTex = UI:GetAccountAuraIco3( self.defName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:UpdateSelEffect()

	self:SetLayerVisible( self.bSelected,self.layers.SEL_EFFECT )

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Marketing_Vouchers_VoucherSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ----------------------------------------------------------------------------
-- UI.Marketing_Vouchers_SelVoucherWnd
-- ----------------------------------------------------------------------------

UI.Marketing_Vouchers_SelVoucherWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Marketing_Vouchers_SelVoucherWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Marketing_Vouchers_SelVoucherWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "marketing_vouchers_selVoucher",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "bundle_ico",	
						layer		= "UI.Marketing_Vouchers_SelVoucherWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title",	
						layer		= "UI.Marketing_Vouchers_SelVoucherWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "desription",	
						layer		= "UI.Marketing_Vouchers_SelVoucherWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price13",	
						layer		= "UI.Marketing_Vouchers_SelVoucherWnd.layers.TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "bundleBigIco",
				defaultAnimation	= "idle",
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Marketing_Vouchers_SelVoucherWnd:Setup( defName )

	self:Reset()

	self.defName = defName

	self:FullUpdate()

end


--
function UI.Marketing_Vouchers_SelVoucherWnd:Reset()

	self.defName = ""

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.DESC )
	self:SetText( "", self.layers.TIME )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Marketing_Vouchers_SelVoucherWnd.layers =
{
    MAIN_EFFECT	= 0,
    ICO_EFFECT	= 1,
    NAME		= 2,
    DESC		= 3,
    TIME		= 4,
}

UI.Marketing_Vouchers_SelVoucherWnd.effectInfo =
{
	ico =
	{
		spriteName	= "ico1"
	}
}

UI.Marketing_Vouchers_SelVoucherWnd.strTime	= UI:GetStringByName( "vouchers_timeLeft" )

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Marketing_Vouchers_SelVoucherWnd.defName	= ""

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Marketing_Vouchers_SelVoucherWnd:FullUpdate()	

	self:UpdateIco()
	self:UpdateName()
	self:UpdateDesc()
	self:UpdateTime( false )

end


--
function UI.Marketing_Vouchers_SelVoucherWnd:UpdateIco()

	local hTex = UI:GetAccountAuraIco4( self.defName )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

end


--
function UI.Marketing_Vouchers_SelVoucherWnd:UpdateName()

	local str = UI:AccountAura2Str( self.defName )
	self:SetText( str, self.layers.NAME )

end


--
function UI.Marketing_Vouchers_SelVoucherWnd:UpdateDesc()

	local str = UI:GetAccountAuraDesc( self.defName )
	self:SetText( str, self.layers.DESC )

end


--
function UI.Marketing_Vouchers_SelVoucherWnd:UpdateTime( bNewFrame )

	local time, battles = UI.Marketing_VouchersWnd:GetVoucherTimeLeft( self.defName )

	if bNewFrame and not time then
		return
	end

	if time then

    	local strTime = UI:Time2Str45( time )

    	local str, numSubst = string.gsub( self.strTime, "%$time%$", strTime )

    	if numSubst == 0 then
    		-- не ругается в лог, т.к. вызывается каждый кадр
    		str = string.format( "[INVALID_STRING] Expired after|%s", strTime )
    	end

    	self:SetText( str, self.layers.TIME )

	elseif battles then

    	local strBattles = UI:SubstituteValLocalizedByStringId( "vouchers_timeLeft_fights_inString", battles, "val" )

    	local str, numSubst = string.gsub( self.strTime, "%$time%$", strBattles )

    	if numSubst == 0 then
    		str = string.format( "[INVALID_STRING] Expired after|%s", strBattles )
    	end

    	self:SetText( str, self.layers.TIME )

	end

end


-- ----------------------------------------------------------------------------
-- UI.Marketing_Vouchers_PagesWnd
-- ----------------------------------------------------------------------------

UI.Marketing_Vouchers_PagesWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.Marketing_Vouchers_PagesWnd.def =
{
	className 	= "Wnd",
	prototype	= "PagesWnd",

	props =
	{
		name	= "Marketing_Vouchers_PagesWnd",
	},
}