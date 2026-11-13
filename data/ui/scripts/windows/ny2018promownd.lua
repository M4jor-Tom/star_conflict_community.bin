-- -----------------------------------------------------------------------------
-- UI.NY2018PromoWnd
-- -----------------------------------------------------------------------------

UI.NY2018PromoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.NY2018PromoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name 			= "NY2018PromoWnd",
		rectAbs			= Quat( 0, 0, 1024, 768 ),
		activationOrder	= 0,
	},

	layers =
	{
		-- BLACK_BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "Black",			
		},

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "ny2018Promo",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "button",	
						wnd			= "UI.NY2018Promo_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children = { "UI.NY2018Promo_CloseBtn" }
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.NY2018PromoWnd:Show( bSound )

	UI.Root:AddChild( self )

	if bSound == nil then
		bSound = false
	end

	if bSound then
		UI:PlayGlobalSound( self.sounds.show )
	end

end


--
function UI.NY2018PromoWnd:Hide( bSound )

	self:UnlinkFromParent()

	if bSound == nil then
		bSound = false
	end

	if bSound then
		UI:PlayGlobalSound( self.sounds.hide )
	end

end



--
function UI.NY2018PromoWnd:NeedShow()

	return not UI:IsTrueEx( UI.serverData.userData.ny2018PromoShown_v2 )

end


-- -------------------------------
-- const
-- -------------------------------

UI.NY2018PromoWnd.IS_FULL_SCREEN = true

UI.NY2018PromoWnd.layers =
{
	BLACK_BG	= 0,
	MAIN_EFFECT	= 1,
}

UI.NY2018PromoWnd.effectInfo =
{
	main =
	{
		icoSpriteName = "ico",
	}
}

UI.NY2018PromoWnd.sounds =
{
	show	= UI.sounds.btnClick,
	hide	= UI.sounds.msgBoxClose,
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.NY2018PromoWnd:ResetImage()
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.NY2018PromoWnd:UpdateImage()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local hTex = UI:GetTex( "ny2018promo" )
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.NY2018PromoWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:ResetImage()

end


--
function UI.NY2018PromoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateImage()

	UI.serverData.userData.ny2018PromoShown_v2 = true
	UI:SaveServerUserData()

end


--
function UI.NY2018PromoWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key ~= UI.Keys.KEY_TAB then

    	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
    		return true
		else 
			return self:HandleKey( key, -2 )
    	end

	end		

	if self.OnTab then
		return self:HandleKey( key, -2 )
	else
		return true
	end

end


--
function UI.NY2018PromoWnd:OnEnter()

	self:Hide( true )
	return true

end


--
function UI.NY2018PromoWnd:OnEscape()

	self:Hide( true )
	return true

end


--
function UI.NY2018PromoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.NY2018Promo_CloseBtn then
		self:Hide( true )
	end

	return true

end
                            

-- -----------------------------------------------------------------------------
-- UI.NY2018Promo_CloseBtn
-- -----------------------------------------------------------------------------

UI.NY2018Promo_CloseBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "NY2018Promo_CloseBtn"
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
					defName 			= "ny2018Promo_closeBtn",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "value43",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},

	textId = "close"
}