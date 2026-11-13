-- ----------------------------------------------------------------------------
--
-- Workfile: EffectScrollWnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id: effectscrollwnd.lua 3458 2011-06-09 04:56:26Z $
-- ----------------------------------------------------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.EffectScrollWnd = {}
local ht = UI.EffectScrollWnd

-- --------------------------------
-- window definition
-- --------------------------------

UI.EffectScrollWnd.def =
{
	className	= "ScrollWnd",

	props =
	{
		name			= "EffectScrollWnd",
		isPrototype		= true,
		style			= UI.WS_UPDATE_IF_VISIBLE,
		scrollStyle 	= UI.SWS_STEPWISE_THUMB_MOVEMENT + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0x55, 0xff, 0xff, 0x00 ),
			visible		= _BORDERS_DEBUG == true,
		}				
	},
}

-- --------------------------------
-- const
-- --------------------------------

UI.EffectScrollWnd.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
}

UI.EffectScrollWnd.effectInfo =
{
	main =
	{
		thumbObjName	= "",
		btnPrevObjName	= "",
		btnNextObjName	= "",
	},
}

UI.EffectScrollWnd.btnPrevPrototypeName		= ""
UI.EffectScrollWnd.btnNextPrototypeName		= ""
UI.EffectScrollWnd.pagePrevPrototypeName	= ""
UI.EffectScrollWnd.pageNextPrototypeName	= ""
UI.EffectScrollWnd.thumbPrototypeName		= ""

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.EffectScrollWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:UpdateLayout()

end


--
function UI.EffectScrollWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local btnPrev	= UI:CreateChildWnd( self, UI[ self.btnPrevPrototypeName ], "btnPrev" )
	local btnNext	= UI:CreateChildWnd( self, UI[ self.btnNextPrototypeName ], "btnNext" )
	local pagePrev	= UI:CreateChildWnd( self, UI[ self.pagePrevPrototypeName], "pagePrev" )
	local pageNext	= UI:CreateChildWnd( self, UI[ self.pageNextPrototypeName ], "pageNext" )
	local thumb 	= UI:CreateChildWnd( self, UI[ self.thumbPrototypeName ], "thumb" )

	if self.effectInfo.main.btnPrevObjName ~= "" then
		UI:AddChildAndLink( self, btnPrev, mainEffect, self.effectInfo.main.btnPrevObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
	else
		self:AddChild( btnPrev )
	end

	if self.effectInfo.main.btnNextObjName ~= "" then
		UI:AddChildAndLink( self, btnNext, mainEffect, self.effectInfo.main.btnNextObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
	else
		self:AddChild( btnNext )
	end

	UI:AddChildAndLink( self, thumb, mainEffect, self.effectInfo.main.thumbObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
	self:AddChild( pagePrev )
	self:AddChild( pageNext )

	self:SetPrevBtnHandle( btnPrev and btnPrev:GetUiHandle() or UI.INVALID_UI_HANDLE )
	self:SetNextBtnHandle( btnNext and btnNext:GetUiHandle() or UI.INVALID_UI_HANDLE )
	self:SetPrevPageHandle( pagePrev and pagePrev:GetUiHandle() or UI.INVALID_UI_HANDLE )
	self:SetNextPageHandle( pageNext and pageNext:GetUiHandle() or UI.INVALID_UI_HANDLE )
	self:SetThumbHandle( thumb and thumb:GetUiHandle() or UI.INVALID_UI_HANDLE )

end


--
function UI.EffectScrollWnd:UpdateLayout()

	local btnPrev	= UI:GetUiObjByHandleT( self:GetPrevBtnHandle() )
	local btnNext	= UI:GetUiObjByHandleT( self:GetNextBtnHandle() )
	local thumb		= UI:GetUiObjByHandleT( self:GetThumbHandle() )
	local pagePrev	= UI:GetUiObjByHandleT( self:GetPrevPageHandle() )
	local pageNext	= UI:GetUiObjByHandleT( self:GetNextPageHandle() )

	local btnPrevPos	= UI:ZeroVec2()
	local btnNextPos	= UI:ZeroVec2()
	local thumbPos		= UI:ZeroVec2()
	local selfSize		= UI:ZeroVec2()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:Update( 0 )

		if self.effectInfo.main.btnPrevObjName ~= "" then
			btnPrevPos = mainEffect:GetObjPos( self.effectInfo.main.btnPrevObjName )
		end

		if self.effectInfo.main.btnNextObjName ~= "" then
			btnNextPos = mainEffect:GetObjPos( self.effectInfo.main.btnNextObjName )
		else
			if self:IsVertical() then
				btnNextPos = UI:Vec2( 0, self:GetHeight() - btnNext:GetHeight() )
			else
				btnNextPos = UI:Vec2( self:GetWidth() - btnNext:GetWidth(), 0 )
			end
		end

		thumbPos	= mainEffect:GetObjPos( self.effectInfo.main.thumbObjName )		
		selfSize	= mainEffect:GetObjSize( "self" )

	end

	if self:IsVertical() then

		self:SetWidth( selfSize.x )

		self:SetSpaceEdgeBtn( btnPrevPos.y )
		self:SetSpaceBtnBar( thumbPos.y - ( btnPrevPos.y + ( btnPrev and btnPrev:GetHeight() or 0 ) ) )

    	if pagePrev then
    		pagePrev:SetLeft( 0 )
    		pagePrev:SetWidth( selfSize.x )
    	end

    	if pageNext then
    		pageNext:SetLeft( 0 )
    		pageNext:SetWidth( selfSize.x )
    	end	

	else

		self:SetHeight( selfSize.y )

		self:SetSpaceEdgeBtn( btnPrevPos.x )
		self:SetSpaceBtnBar( thumbPos.x - ( btnPrevPos.x + ( btnPrev and btnPrev:GetWidth() or 0 ) ) )

    	if pagePrev then
    		pagePrev:SetTop( 0 )
    		pagePrev:SetHeight( selfSize.y )
    	end

    	if pageNext then
    		pageNext:SetTop( 0 )
    		pageNext:SetHeight( selfSize.y )
    	end	

	end

	if btnPrev then
		btnPrev:SetLeft( btnPrevPos.x )
		btnPrev:SetTop( btnPrevPos.y )
	end

	if btnNext then
		btnNext:SetLeft( btnNextPos.x )
		btnNext:SetTop( btnNextPos.y )
	end

	if thumb then

		thumb:SetLeft( thumbPos.x )
		thumb:SetTop( thumbPos.y )

		local minThumbSize = 15

		local thumbEffect = UI:GetEffectFromLayer( thumb, thumb.layers.MAIN_EFFECT )
		if thumbEffect then

			local thumbObjSize = thumbEffect:GetObjSize( thumb.effectInfo.main.minSizeObjName )
			minThumbSize = self:IsVertical() and thumbObjSize.y or thumbObjSize.x

		end

		self:SetMinThumbSize( minThumbSize )

	end


	self:RecalcLayout()

end


--
function UI.EffectScrollWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.EffectScrollWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.EffectScrollWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Btn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Btn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.EffectScroll_Btn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "EffectScroll_Btn",
		selectSound	= UI.sounds.btnMouseOver,
		clickSound	= UI.sounds.btnClick,
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		}
	}
}


-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.EffectScroll_Btn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.EffectScroll_Btn:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.EffectScroll_Btn:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Page
-- --------------------------------------------------------------------------------

UI.EffectScroll_Page =
{
	def =
	{
		className 	= "ButtonWnd",

		props =
		{
			name		= "EffectScroll_Page",
			clickSound	= UI.sounds.btnClick,
			style		= 0,
			isPrototype	= true,
		},

    	layers =
    	{
    		-- DEBUG
    		{
    			layerType	= UI.LAYER_TEXTURE,
    			layerStyle	= UI.WLS_RESIZABLE,
    			texture		= "white",
    			color		= UI:ARGB( 0x55, 0x00, 0xff, 0xff ),
    			visible		= _BORDERS_DEBUG == true,
    		}				
    	}
	},
}

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Thumb
-- --------------------------------------------------------------------------------

UI.EffectScroll_Thumb = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

UI.EffectScroll_Thumb.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "EffectScroll_Thumb",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numBaseBtnLayers + 2,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- BG_EFFECT
		{
			id			= l_numBaseBtnLayers,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},
	},
}

-- --------------------------------------------
-- const
-- --------------------------------------------

UI.EffectScroll_Thumb.layers =
{
    MAIN_EFFECT		= 0,
	DEBUG			= 1,
    BG_EFFECT		= 2,
    SEL_EFFECT		= 3,
}

UI.EffectScroll_Thumb.effectInfo =
{
	main =
	{
		animationIdle 		= "",
		animationSelect		= "",
		animationPressed	= "",
		minSizeObjName		= "",
	}
}

UI.EffectScroll_Thumb.isVertical = true

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.EffectScroll_Thumb:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local selfSz = mainEffect:GetObjSize( "self" )

		if self.isVertical then
			self:SetWidth( selfSz.x )
		else
			self:SetHeight( selfSz.y )
		end

	end

end


--
function UI.EffectScroll_Thumb:F_OnSizeChanged( oldWidth, oldHeight )

	self:OnSizeChanged( oldWidth, oldHeight )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end  


--
function UI.EffectScroll_Thumb:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.EffectScroll_Thumb:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end	

	local selfSize = mainEffect:GetObjSize( "self" )

	local baseSz	= self.isVertical and selfSize.y or selfSize.x
	local sz		= self.isVertical and self:GetHeight() or self:GetWidth()

	if sz > baseSz then
		sys.log( "UI.EffectScroll_Thumb:F_OnSizeChanged()[ERROR]: not enough size in effect" )
	end

	local t = sz / baseSz

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if bgEffect then		
		bgEffect:SetAnimationTime( t )
		bgEffect:Update( 0 )		
	end

	local selEffect = UI:GetEffectFromLayer( self, self.layers.SEL_EFFECT )
	if selEffect then		
		selEffect:SetAnimationTime( t )
		selEffect:Update( 0 )		
	end	

end


--
function UI.EffectScroll_Thumb:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end



-- -----------------------------------------------------------------
-- UI.EffectScrollWnd_Vrt
-- -----------------------------------------------------------------

UI.EffectScrollWnd_Vrt =
{
	def =
    {
    	className	= "ScrollWnd",
    	prototype	= "EffectScrollWnd",

    	props =
    	{
    		name			= "EffectScrollWnd_Vrt",
    		scrollStyle 	= UI.SWS_VERTICAL + UI.SWS_STEPWISE_THUMB_MOVEMENT + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
    		isPrototype		= true,
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
    				defName 			= "scrollVrt_main",
    				defaultAnimation	= "idle",
    			}}			
    		},
    	}
    },

    effectInfo =
    {
    	main =
    	{
			thumbObjName	= "scroll_thumb",
			btnPrevObjName	= "btn_top",
			btnNextObjName	= "btn_bottom",
    	},
    },

	btnPrevPrototypeName	= "EffectScroll_Vrt_PrevBtn",
	btnNextPrototypeName	= "EffectScroll_Vrt_NextBtn",
	pagePrevPrototypeName	= "EffectScroll_Page",
	pageNextPrototypeName	= "EffectScroll_Page",
	thumbPrototypeName		= "EffectScroll_Vrt_Thumb",	
}



-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_PrevBtn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_PrevBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Vrt_PrevBtn",
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
    				defName				= "scrollVrt_prevBtn",
    				defaultAnimation    = "idle",

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
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_NextBtn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_NextBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Vrt_NextBtn",
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
    				defName				= "scrollVrt_nextBtn",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					}, 
					}
				}}
			},
		}
	},

	effectInfo =
	{
		main =
		{
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_Thumb
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_Thumb =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "EffectScroll_Thumb",

    	props =
    	{
    		name		= "EffectScroll_Vrt_Thumb",
    		isPrototype	= true,
    	},

    	layers =
    	{
			numLayers = l_numBaseBtnLayers + 2,

    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName				= "scrollVrt_thumb_main",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "scroll_thumb",
    						layer		= "UI.EffectScroll_Thumb.layers.BG_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "scroll_thumb_over",
    						layer		= "UI.EffectScroll_Thumb.layers.SEL_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}				
    			}}
    		},

    		-- BG_EFFECT
    		{
    			id			= l_numBaseBtnLayers,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName				= "scrollVrt_thumb_bg",
    				defaultAnimation    = "idle",
    			}}
    		},

    		-- SEL_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName				= "scrollVrt_thumb_sel",
    				defaultAnimation    = "idle",
    			}}
    		},
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		minSizeObjName		= "scroll_min",
    	}
    }
}   


-- -----------------------------------------------------------------
-- UI.EffectScrollWnd_Hrz
-- -----------------------------------------------------------------

UI.EffectScrollWnd_Hrz =
{
	def =
    {
    	className	= "ScrollWnd",
    	prototype	= "EffectScrollWnd",

    	props =
    	{
    		name			= "EffectScrollWnd_Hrz",
    		scrollStyle 	= UI.SWS_HORIZONTAL + UI.SWS_STEPWISE_THUMB_MOVEMENT + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
    		isPrototype		= true,
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
    				defName 			= "scrollHrz_main",
    				defaultAnimation	= "idle",

    			}}			
    		},
    	}
    },

    effectInfo =
    {
    	main =
    	{
			thumbObjName	= "scroll_thumb",
			btnPrevObjName	= "btn_top",
			btnNextObjName	= "btn_bottom",
    	},
    },

	btnPrevPrototypeName	= "EffectScroll_Hrz_PrevBtn",
	btnNextPrototypeName	= "EffectScroll_Hrz_NextBtn",
	pagePrevPrototypeName	= "EffectScroll_Page",
	pageNextPrototypeName	= "EffectScroll_Page",
	thumbPrototypeName		= "EffectScroll_Hrz_Thumb",	
} 

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Hrz_PrevBtn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Hrz_PrevBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Hrz_PrevBtn",
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
    				defName				= "scrollHrz_prevBtn",
    				defaultAnimation    = "idle",

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
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Hrz_NextBtn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Hrz_NextBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Hrz_NextBtn",
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
    				defName				= "scrollHrz_nextBtn",
    				defaultAnimation    = "idle",

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
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}    

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Hrz_Thumb
-- --------------------------------------------------------------------------------

UI.EffectScroll_Hrz_Thumb =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "EffectScroll_Thumb",

    	props =
    	{
    		name		= "EffectScroll_Hrz_Thumb",
    		isPrototype	= true,
    	},

    	layers =
    	{
			numLayers = l_numBaseBtnLayers + 2,

    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName				= "scrollHrz_thumb_main",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "scroll_thumb",
    						layer		= "UI.EffectScroll_Thumb.layers.BG_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "scroll_thumb_over",
    						layer		= "UI.EffectScroll_Thumb.layers.SEL_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}				
    			}}
    		},

    		-- BG_EFFECT
    		{
    			id			= l_numBaseBtnLayers,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName				= "scrollHrz_thumb_bg",
    				defaultAnimation    = "idle",
    			}}
    		},

    		-- SEL_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName				= "scrollHrz_thumb_sel",
    				defaultAnimation    = "idle",
    			}}
    		},
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		minSizeObjName		= "scroll_min",
    	}
    },

	isVertical = false,
}


-- -----------------------------------------------------------------
-- UI.EffectScrollWnd_Vrt_2
-- -----------------------------------------------------------------

UI.EffectScrollWnd_Vrt_2 =
{
	def =
    {
    	className	= "ScrollWnd",
    	prototype	= "EffectScrollWnd",

    	props =
    	{
    		name			= "EffectScrollWnd_Vrt_2",
    		scrollStyle 	= UI.SWS_VERTICAL + UI.SWS_ALLOW_DISABLE_BTNS,
    		isPrototype		= true,
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
    				defName 			= "scrollVrt_2_main",
    				defaultAnimation	= "idle",
    			}}			
    		},
    	}
    },

    effectInfo =
    {
    	main =
    	{
			thumbObjName	= "scroll_thumb",
			btnPrevObjName	= "",
			btnNextObjName	= "",
    	},
    },

	btnPrevPrototypeName	= "EffectScroll_Btn",
	btnNextPrototypeName	= "EffectScroll_Btn",
	pagePrevPrototypeName	= "EffectScroll_Page",
	pageNextPrototypeName	= "EffectScroll_Page",
	thumbPrototypeName		= "EffectScroll_Vrt_2_Thumb",	
}

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_2_Thumb
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_2_Thumb =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "EffectScroll_Thumb",

    	props =
    	{
    		name		= "EffectScroll_Vrt_2_Thumb",
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
    				defName				= "scrollVrt_2_thumb",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self40",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}				
    			}}
    		},
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		minSizeObjName		= "self40",
    	}
    }
}   

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.EffectScroll_Vrt_2_Thumb:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

end


--
function UI.EffectScroll_Vrt_2_Thumb:F_OnSizeChanged( oldWidth, oldHeight )

	self:OnSizeChanged( oldWidth, oldHeight )

end


--
function UI.EffectScroll_Vrt_2_Thumb:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

end


--
function UI.EffectScroll_Vrt_2_Thumb:UpdateEffects()
end


--
function UI.EffectScroll_Vrt_2_Thumb:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

end


-- -----------------------------------------------------------------
-- UI.EffectScrollWnd_Vrt_2_1080
-- -----------------------------------------------------------------

UI.EffectScrollWnd_Vrt_2_1080 =
{
	def =
    {
    	className	= "ScrollWnd",
    	prototype	= "EffectScrollWnd",

    	props =
    	{
    		name			= "EffectScrollWnd_Vrt_2_1080",
    		scrollStyle 	= UI.SWS_VERTICAL + UI.SWS_ALLOW_DISABLE_BTNS,
    		isPrototype		= true,
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
    				defName 			= "scrollVrt_2_main_1080",
    				defaultAnimation	= "idle",
    			}}			
    		},
    	}
    },

    effectInfo =
    {
    	main =
    	{
			thumbObjName	= "scroll_thumb",
			btnPrevObjName	= "",
			btnNextObjName	= "",
    	},
    },

	btnPrevPrototypeName	= "EffectScroll_Btn",
	btnNextPrototypeName	= "EffectScroll_Btn",
	pagePrevPrototypeName	= "EffectScroll_Page",
	pageNextPrototypeName	= "EffectScroll_Page",
	thumbPrototypeName		= "EffectScroll_Vrt_2_Thumb_1080",	
}

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_2_Thumb_1080
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_2_Thumb_1080 =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "EffectScroll_Thumb",

    	props =
    	{
    		name		= "EffectScroll_Vrt_2_Thumb_1080",
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
    				defName				= "scrollVrt_2_thumb_1080",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self40",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}				
    			}}
    		},
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		minSizeObjName		= "self40",
    	}
    }
}   

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.EffectScroll_Vrt_2_Thumb_1080:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

end


--
function UI.EffectScroll_Vrt_2_Thumb_1080:F_OnSizeChanged( oldWidth, oldHeight )

	self:OnSizeChanged( oldWidth, oldHeight )

end


--
function UI.EffectScroll_Vrt_2_Thumb_1080:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

end


--
function UI.EffectScroll_Vrt_2_Thumb_1080:UpdateEffects()
end


--
function UI.EffectScroll_Vrt_2_Thumb_1080:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

end


-- -----------------------------------------------------------------
-- UI.EffectScrollWnd_Hrz_2
-- -----------------------------------------------------------------

UI.EffectScrollWnd_Hrz_2 =
{
	def =
    {
    	className	= "ScrollWnd",
    	prototype	= "EffectScrollWnd",

    	props =
    	{
    		name			= "EffectScrollWnd_Hrz_2",
    		scrollStyle 	= UI.SWS_HORIZONTAL + UI.SWS_ALLOW_DISABLE_BTNS,
    		isPrototype		= true,
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
    				defName 			= "scrollHrz_2_main",
    				defaultAnimation	= "idle",
    			}}			
    		},
    	}
    },

    effectInfo =
    {
    	main =
    	{
			thumbObjName	= "scroll_thumb",
			btnPrevObjName	= "",
			btnNextObjName	= "",
    	},
    },

	btnPrevPrototypeName	= "EffectScroll_Btn",
	btnNextPrototypeName	= "EffectScroll_Btn",
	pagePrevPrototypeName	= "EffectScroll_Page",
	pageNextPrototypeName	= "EffectScroll_Page",
	thumbPrototypeName		= "EffectScroll_Hrz_2_Thumb",	
}

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Hrz_2_Thumb
-- --------------------------------------------------------------------------------

UI.EffectScroll_Hrz_2_Thumb =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "EffectScroll_Thumb",

    	props =
    	{
    		name		= "EffectScroll_Hrz_2_Thumb",
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
    				defName				= "scrollHrz_2_thumb",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self40",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}				
    			}}
    		},
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		minSizeObjName		= "self40",
    	}
    }
}   

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.EffectScroll_Hrz_2_Thumb:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

end


--
function UI.EffectScroll_Hrz_2_Thumb:F_OnSizeChanged( oldWidth, oldHeight )

	self:OnSizeChanged( oldWidth, oldHeight )

end


--
function UI.EffectScroll_Hrz_2_Thumb:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

end


--
function UI.EffectScroll_Hrz_2_Thumb:UpdateEffects()
end


--
function UI.EffectScroll_Hrz_2_Thumb:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

end


-- -----------------------------------------------------------------
-- UI.EffectScrollWnd_Vrt_3
-- -----------------------------------------------------------------

UI.EffectScrollWnd_Vrt_3 = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

--
UI.EffectScrollWnd_Vrt_3.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	BG_EFFECT	= 2,
}

--
UI.EffectScrollWnd_Vrt_3.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd",

	props =
	{
		name			= "EffectScrollWnd_Vrt_3",
		scrollStyle 	= UI.SWS_VERTICAL + UI.SWS_ALLOW_DISABLE_BTNS,
		isPrototype		= true,
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.EffectScrollWnd_Vrt_3.layers ),

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "scrollVrt_3_main",
				defaultAnimation	= "idle",
			}}			
		},

		-- BG_EFFECT
		{
			id 			= UI.EffectScrollWnd_Vrt_3.layers.BG_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "scrollVrt_3_bg",
				defaultAnimation	= "idle",
			}}			
		},
	}
}

-- --------------------------------------------
-- const
-- --------------------------------------------

UI.EffectScrollWnd_Vrt_3.effectInfo =
{
	main =
	{
		thumbObjName	= "thumb",
		btnPrevObjName	= "btn_up",
		btnNextObjName	= "btn_down",
		bgLocator		= "bg",
	},
}

UI.EffectScrollWnd_Vrt_3.btnPrevPrototypeName	= "EffectScroll_Vrt_3_PrevBtn"
UI.EffectScrollWnd_Vrt_3.btnNextPrototypeName	= "EffectScroll_Vrt_3_NextBtn"
UI.EffectScrollWnd_Vrt_3.pagePrevPrototypeName	= "EffectScroll_Page"
UI.EffectScrollWnd_Vrt_3.pageNextPrototypeName	= "EffectScroll_Page"
UI.EffectScrollWnd_Vrt_3.thumbPrototypeName		= "EffectScroll_Vrt_3_Thumb"


-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.EffectScrollWnd_Vrt_3:F_OnSizeChanged( oldWidth, oldHeight )

	self:OnSizeChanged( oldWidth, oldHeight )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	self:UpdateBgLayout()

end  


--
function UI.EffectScrollWnd_Vrt_3:UpdateBgLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )

	if not mainEffect or not bgEffect then
		return
	end

	local bgBaseSize	= bgEffect:GetObjSize( "self" )
	local selfBaseSize	= mainEffect:GetObjSize( "self" )
	local bgPos			= mainEffect:GetObjPos( self.effectInfo.main.bgLocator )
	local selfHeight	= self:GetHeight()

	local space_bg_btm = selfBaseSize.y - ( bgPos.y + bgBaseSize.y )
	local bgHeight = selfHeight - bgPos.y - space_bg_btm
	local animTime = bgHeight / bgBaseSize.y
	bgEffect:SetAnimationTimeAndUpdate( animTime )

	bgEffect:SetPos( bgPos )

end


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_3_PrevBtn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_3_PrevBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Vrt_3_PrevBtn",
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
    				defName				= "scrollVrt_3_prevBtn",
    				defaultAnimation    = "idle",

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
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_3_NextBtn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_3_NextBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Vrt_3_NextBtn",
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
    				defName				= "scrollVrt_3_nextBtn",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					}, 
					}
				}}
			},
		}
	},

	effectInfo =
	{
		main =
		{
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_3_Thumb
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_3_Thumb =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "EffectScroll_Thumb",

    	props =
    	{
    		name		= "EffectScroll_Vrt_3_Thumb",
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
    				defName				= "scrollVrt_3_thumb",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}				
    			}}
    		},
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		minSizeObjName		= "self",
    	}
    }
}   

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.EffectScroll_Vrt_3_Thumb:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

end


--
function UI.EffectScroll_Vrt_3_Thumb:F_OnSizeChanged( oldWidth, oldHeight )

	self:OnSizeChanged( oldWidth, oldHeight )

end


--
function UI.EffectScroll_Vrt_3_Thumb:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

end


--
function UI.EffectScroll_Vrt_3_Thumb:UpdateEffects()
end


--
function UI.EffectScroll_Vrt_3_Thumb:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

end


-- -----------------------------------------------------------------
-- UI.EffectScrollWnd_Hrz_3
-- -----------------------------------------------------------------

UI.EffectScrollWnd_Hrz_3 = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

--
UI.EffectScrollWnd_Hrz_3.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	BG_EFFECT	= 2,
}

--
UI.EffectScrollWnd_Hrz_3.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd",

	props =
	{
		name			= "EffectScrollWnd_Hrz_3",
		scrollStyle 	= UI.SWS_HORIZONTAL + UI.SWS_ALLOW_DISABLE_BTNS,
		isPrototype		= true,
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.EffectScrollWnd_Hrz_3.layers ),

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "scrollHrz_3_main",
				defaultAnimation	= "idle",
			}}			
		},

		-- BG_EFFECT
		{
			id 			= UI.EffectScrollWnd_Hrz_3.layers.BG_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "scrollHrz_3_bg",
				defaultAnimation	= "idle",
			}}			
		},
	}
}

-- --------------------------------------------
-- const
-- --------------------------------------------

UI.EffectScrollWnd_Hrz_3.effectInfo =
{
	main =
	{
		thumbObjName	= "thumb",
		btnPrevObjName	= "btn_up",
		btnNextObjName	= "btn_down",
		bgLocator		= "bg",
	},
}

UI.EffectScrollWnd_Hrz_3.btnPrevPrototypeName	= "EffectScroll_Hrz_3_PrevBtn"
UI.EffectScrollWnd_Hrz_3.btnNextPrototypeName	= "EffectScroll_Hrz_3_NextBtn"
UI.EffectScrollWnd_Hrz_3.pagePrevPrototypeName	= "EffectScroll_Page"
UI.EffectScrollWnd_Hrz_3.pageNextPrototypeName	= "EffectScroll_Page"
UI.EffectScrollWnd_Hrz_3.thumbPrototypeName		= "EffectScroll_Hrz_3_Thumb"


-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.EffectScrollWnd_Hrz_3:F_OnSizeChanged( oldWidth, oldHeight )

	self:OnSizeChanged( oldWidth, oldHeight )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	self:UpdateBgLayout()

end  


--
function UI.EffectScrollWnd_Hrz_3:UpdateBgLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )

	if not mainEffect or not bgEffect then
		return
	end

	local bgBaseSize	= bgEffect:GetObjSize( "self" )
	local selfBaseSize	= mainEffect:GetObjSize( "self" )
	local bgPos			= mainEffect:GetObjPos( self.effectInfo.main.bgLocator )
	local selfWidth		= self:GetWidth()

	local space_bg_btm = selfBaseSize.x - ( bgPos.x + bgBaseSize.x )
	local bgWidth = selfWidth - bgPos.x - space_bg_btm
	local animTime = bgWidth / bgBaseSize.x
	bgEffect:SetAnimationTimeAndUpdate( animTime )

	bgEffect:SetPos( bgPos )

end


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Hrz_3_PrevBtn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Hrz_3_PrevBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Hrz_3_PrevBtn",
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
    				defName				= "scrollHrz_3_prevBtn",
    				defaultAnimation    = "idle",

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
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Hrz_3_NextBtn
-- --------------------------------------------------------------------------------

UI.EffectScroll_Hrz_3_NextBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Hrz_3_NextBtn",
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
    				defName				= "scrollHrz_3_nextBtn",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					}, 
					}
				}}
			},
		}
	},

	effectInfo =
	{
		main =
		{
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}

-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Hrz_3_Thumb
-- --------------------------------------------------------------------------------

UI.EffectScroll_Hrz_3_Thumb =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Vrt_3_Thumb",
	
		props =
		{
			name		= "EffectScroll_Hrz_3_Thumb",
			isPrototype	= true,
		},
	}
}

-- -----------------------------------------------------------------
-- UI.EffectScrollWnd_Vrt_1080
-- -----------------------------------------------------------------

UI.EffectScrollWnd_Vrt_1080 =
{
	def =
	{
		className	= "ScrollWnd",
		prototype	= "EffectScrollWnd",
	
		props =
		{
			name			= "EffectScrollWnd_Vrt_1080",
			scrollStyle 	= UI.SWS_VERTICAL + UI.SWS_STEPWISE_THUMB_MOVEMENT + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
			isPrototype		= true,
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
					defName 			= "scrollVrt_main_1080",
					defaultAnimation	= "idle",
				}}			
			},
		}
	},
	
	effectInfo =
	{
		main =
		{
			thumbObjName	= "scroll_thumb",
			btnPrevObjName	= "btn_top",
			btnNextObjName	= "btn_bottom",
		},
	},

	btnPrevPrototypeName	= "EffectScroll_Vrt_PrevBtn_1080",
	btnNextPrototypeName	= "EffectScroll_Vrt_NextBtn_1080",
	pagePrevPrototypeName	= "EffectScroll_Page",
	pageNextPrototypeName	= "EffectScroll_Page",
	thumbPrototypeName		= "EffectScroll_Vrt_Thumb_1080",
}



-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_PrevBtn_1080
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_PrevBtn_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Vrt_PrevBtn_1080",
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
    				defName				= "scrollVrt_prevBtn_1080",
    				defaultAnimation    = "idle",

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
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_NextBtn_1080
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_NextBtn_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Btn",

		props =
		{
			name		= "EffectScroll_Vrt_NextBtn_1080",
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
    				defName				= "scrollVrt_nextBtn_1080",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					}, 
					}
				}}
			},
		}
	},

	effectInfo =
	{
		main =
		{
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "press",
			animationDisabled	= "disable",
		}
	}
}


-- --------------------------------------------------------------------------------
-- UI.EffectScroll_Vrt_Thumb_1080
-- --------------------------------------------------------------------------------

UI.EffectScroll_Vrt_Thumb_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectScroll_Thumb",
	
		props =
		{
			name		= "EffectScroll_Vrt_Thumb_1080",
			isPrototype	= true,
		},
	
		layers =
		{
			numLayers = l_numBaseBtnLayers + 2,
	
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,
	
				effects =
				{{
					defName				= "scrollVrt_thumb_main_1080",
					defaultAnimation    = "idle",
	
					links =
					{
						{
							objName		= "scroll_thumb",
							layer		= "UI.EffectScroll_Thumb.layers.BG_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
	
						{
							objName		= "scroll_thumb_over",
							layer		= "UI.EffectScroll_Thumb.layers.SEL_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}				
				}}
			},
	
			-- BG_EFFECT
			{
				id			= l_numBaseBtnLayers,
	
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				updatable	= false,
	
				effects =
				{{
					defName				= "scrollVrt_thumb_bg_1080",
					defaultAnimation    = "idle",
				}}
			},
	
			-- SEL_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				updatable	= false,
	
				effects =
				{{
					defName				= "scrollVrt_thumb_sel_1080",
					defaultAnimation    = "idle",
				}}
			},
		},
	},
	
	effectInfo =
	{
		main =
		{
			animationIdle 		= "idle",
			animationSelect		= "over",
			animationPressed	= "over",
			minSizeObjName		= "scroll_min",
		}
	}
}   