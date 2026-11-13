-- ----------------------------------------------------------------------------
--
-- Workfile: effectsliderwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.EffectSliderWnd = {}
local sw = UI.EffectSliderWnd

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.EffectSliderWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "EffectSliderWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},
	}
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.EffectSliderWnd:SetMin( min )
	
	self.min = min

	self:Validate()
	self:UpdateControls()

end


--
function UI.EffectSliderWnd:SetMax( max )

	self.max = max

	self:Validate()
	self:UpdateControls()

end


--
function UI.EffectSliderWnd:SetMinMax( min, max )

	self.min = min
	self.max = max

	self:Validate()
	self:UpdateControls()

end


--
function UI.EffectSliderWnd:GetMin()

	return self.min

end


--
function UI.EffectSliderWnd:GetMax()

	return self.max

end


--
function UI.EffectSliderWnd:GetMinMax()

	return self.min, self.max

end


--
function UI.EffectSliderWnd:SetVal( val, eventSrc )

	val = UI:Clamp( val, self.min, self.max )

	if val == self.val then
		return
	end

	if eventSrc == nil then
		eventSrc = self.eventSources.UNKNOWN

	else
		if UI:Val2Key( self.eventSources, eventSrc ) == "" then
			sys.log( "UI.EffectSliderWnd:SetVal()[ERROR]: invalid event source: one of the \"UI.EffectSliderWnd.eventSources\" members or nil expected; got \"%s\"", tostring( eventSrc ) )
			eventSrc = self.eventSources.UNKNOWN
		end
	end

	self.val = val

	self:UpdateControls()

	UI:SendUiEvent( UI.EV_SLIDER_CHANGED, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, eventSrc, 0, 0, 0 )	

end


--
function UI.EffectSliderWnd:GetVal()

	return self.val

end


--
function UI.EffectSliderWnd:SetStep( step )

	self.step = step

end


--
function UI.EffectSliderWnd:GetStep( )

	return self.step

end


--
function UI.EffectSliderWnd:HasSliderStyle( sliderStyle )

	return bit.band( self.sliderStyle, sliderStyle ) ~= 0

end


--
function UI.EffectSliderWnd:Enable( bEnable )

	if bEnable then

		self:RemoveStyle( UI.WS_GRAYED )	-- UI.WS_DISABLE нельзя использовать, т.к. он включает в себя UI.WS_NOT_MOUSE_REACT, а реакции на мышб для главного окна не надо

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then

			local anim = self.effectInfo.main.animIdle
			if anim ~= mainEffect:GetCurAnimation() then
				mainEffect:StartAnimation( anim )
			end

		end

		if self.barWnd then

			self.barWnd:RemoveStyle( UI.WS_DISABLE )

			local barMainEffect = UI:GetEffectFromLayer( self.barWnd, self.barWnd.layers.MAIN_EFFECT )
			if barMainEffect then

        		local anim = self.barWnd.effectInfo.main.animIdle
        		if anim ~= barMainEffect:GetCurAnimation() then

					local animTime = barMainEffect:GetAnimationTime()

        			barMainEffect:StartAnimation( anim )
					barMainEffect:GetAnimationTime( animTime )

        		end

			end

		end

		if self.editWnd then
			self.editWnd:RemoveStyle( UI.WS_DISABLE )
			self.editWnd:RemoveEditStyle( UI.ES_READ_ONLY )
		end

		self:UpdateBtns()

	else

		self:AddStyle( UI.WS_GRAYED )	

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then

			local anim = self.effectInfo.main.animDisabled
			if anim ~= mainEffect:GetCurAnimation() then
				mainEffect:StartAnimation( anim )
			end

		end

		if self.barWnd then

			self.barWnd:AddStyle( UI.WS_DISABLE )

			local barMainEffect = UI:GetEffectFromLayer( self.barWnd, self.barWnd.layers.MAIN_EFFECT )
			if barMainEffect then

        		local anim = self.barWnd.effectInfo.main.animDisabled
        		if anim ~= barMainEffect:GetCurAnimation() then

					local animTime = barMainEffect:GetAnimationTime()

        			barMainEffect:StartAnimation( anim )
					barMainEffect:GetAnimationTime( animTime )

        		end

			end

		end

		if self.editWnd then

			self.editWnd:AddStyle( UI.WS_DISABLE )
			self.editWnd:AddEditStyle( UI.ES_READ_ONLY )

        	if UI:GetKeyboardFocus() == self.editWnd:GetUiHandle() then
        		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
        		UI:ValidateKeyboardFocus()
        	end

		end

		self:UpdateBtns()

	end

end


--
function UI.EffectSliderWnd:IsEnabled()

	return not self:HasStyle( UI.WS_GRAYED )

end


-- -----------------------------------------
-- const
-- -----------------------------------------

sw.layers =
{
	MAIN_EFFECT	= 0
}

sw.sliderStyles =
{
	HAS_BTNS		= 1,
	HAS_EDIT		= 2,
	HAS_BAR			= 4,
}

sw.sliderBarPrototypeName	= ""
sw.leftBtnPrototypeName		= ""
sw.rightBtnPrototypeName	= ""
sw.editPrototypeName		= ""

sw.effectInfo =
{
	main =
	{
		sliderBarObjName	= "",
		btnLeftObjName		= "",
		btnRightObjName		= "",
		editObjName			= "",
		animIdle			= "idle",
		animDisabled		= "",
	}
}

sw.scrollSpeeds =
{
	{ time = 0,	steps = 10 },
	{ time = 1,	steps = 50 },
}

sw.SCROLL_REPEAT_DELAY = 0.5

sw.sounds =
{
	print		= UI.sounds.print,
	barClick	= UI.sounds.btnClick,
}

sw.eventSources =
{
	BTNS	= 1,
	EDIT	= 2,
	BAR		= 3,	
	UNKNOWN	= -1,
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

sw.min						= 0
sw.max						= 0
sw.val						= 0
sw.step						= 1
sw.sliderStyle				= 0
sw.barWnd					= nil
sw.leftBtn					= nil
sw.rigthBtn					= nil
sw.editWnd					= nil
sw.btnScrollRepeatDelayTimer= -1
sw.btnScrollTime			= 0
sw.btnScrollDir				= 0
sw.btnScrolledStepsFloat	= 0
sw.btnScrolledStepsInt		= 0
sw.barInputRect				= Quat( 0, 0, 0, 0 )

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.EffectSliderWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )	

	if self:IsPrototype() then
		return	
	end

	self:CreateControls()	

	if self:HasSliderStyle( self.sliderStyles.HAS_BAR ) then

       	local barEffect = UI:GetEffectFromLayer( self.barWnd, self.barWnd.layers.MAIN_EFFECT )
       	if barEffect then

       		local pos = barEffect:GetObjPos( self.barWnd.effectInfo.main.inputRectObjName )
       		local sz = barEffect:GetObjSize( self.barWnd.effectInfo.main.inputRectObjName )

       		self.barInputRect = UI:Quat( pos.x, pos.y, sz.x, sz.y )
       		self.barInputRect = UI:QuatCopyStable( self.barWnd:ToParent( self.barInputRect ) )

       	end	

	end

	if self:HasSliderStyle( self.sliderStyles.HAS_EDIT ) then

	   	local handle = self:GetUiHandle()
   		UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )

	end

	self:Enable( true )

end


--
function UI.EffectSliderWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if self:HasSliderStyle( self.sliderStyles.HAS_BAR ) then

    	local sliderBarProto = UI[ self.sliderBarPrototypeName ]
    	self.barWnd = UI:CreateChildWnd( self, sliderBarProto, "" )
    	UI:AddChildAndLink( self, self.barWnd, mainEffect, self.effectInfo.main.sliderBarObjName, UI.EffectAnimParams.POS )

	end

	if self:HasSliderStyle( self.sliderStyles.HAS_BTNS ) then

		local leftBtnProto = UI[ self.leftBtnPrototypeName ]
		self.leftBtn = UI:CreateChildWnd( self, leftBtnProto, "" )
		UI:AddChildAndLink( self, self.leftBtn, mainEffect, self.effectInfo.main.btnLeftObjName, UI.EffectAnimParams.POS )

		local rightBtnProto = UI[ self.rightBtnPrototypeName ]
		self.rightBtn = UI:CreateChildWnd( self, rightBtnProto, "" )
		UI:AddChildAndLink( self, self.rightBtn, mainEffect, self.effectInfo.main.btnRightObjName, UI.EffectAnimParams.POS )

	end

	if self:HasSliderStyle( self.sliderStyles.HAS_EDIT ) then

		local editProto = UI[ self.editPrototypeName ]
		self.editWnd = UI:CreateChildWnd( self, editProto, "" )
		UI:AddChildAndLink( self, self.editWnd, mainEffect, self.effectInfo.main.editObjName, UI.EffectAnimParams.POS )

	end

end


--
function UI.EffectSliderWnd:Validate()

	if self.max < self.min then
		self.max = self.min
	end

	local val = UI:Clamp( self.val, self.min, self.max )
	if val ~= self.val then
		self:SetVal( val, self.eventSources.UNKNOWN )
	end

end


--
function UI.EffectSliderWnd:UpdateControls()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateBar()
	self:UpdateBtns()
	self:UpdateEditWnd()

end


--
function UI.EffectSliderWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateControls()

end


--
function UI.EffectSliderWnd:UpdateBar()

	if not self:HasSliderStyle( self.sliderStyles.HAS_BAR ) then
		return
	end

	local barEffect = UI:GetEffectFromLayer( self.barWnd, self.barWnd.layers.MAIN_EFFECT )
	if not barEffect then
		return
	end

	local animTime = ( self.max == self.min ) and 0 or ( self.val - self.min ) / ( self.max - self.min )

	barEffect:SetAnimationTime( animTime )
	barEffect:Update( 0 )	

end


--
function UI.EffectSliderWnd:UpdateBtns()

	if not self:HasSliderStyle( self.sliderStyles.HAS_BTNS ) then
		return
	end

	if self:IsEnabled() then

    	local bLeft		= self.val > self.min
    	local bRight	= self.val < self.max

    	self.leftBtn:Enable( bLeft )
    	self.rightBtn:Enable( bRight )

	else

    	self.leftBtn:Enable( false )
    	self.rightBtn:Enable( false )

	end
	
end


--
function UI.EffectSliderWnd:UpdateEditWnd()

	if not self:HasSliderStyle( self.sliderStyles.HAS_EDIT ) then
		return
	end

	local oldText = self.editWnd:GetEditText()

	local strVal = tostring( self.val )

	if oldText ~= strVal then
		self.editWnd:SetEditText( strVal )
	end
	
end


--
function UI.EffectSliderWnd:F_OnEventEditChange( hSender, eventSrc )

	if not self.editWnd or hSender ~= self.editWnd:GetUiHandle() then
		return
	end

	if eventSrc == UI.EVENT_SRC_UNKNOWN then
		return
	end

	local text = self.editWnd:GetEditText()
	local val = text ~= "" and tonumber( text ) or 0

	if not val or val < self.min or val > self.max then
		val = val and UI:Clamp( val, self.min, self.max ) or self.min
		self.editWnd:SetEditText( tostring( val ) )
	end

	self:SetVal( val, self.eventSources.EDIT )

	if self:IsOnScreen() and eventSrc ~= UI.EVENT_SRC_UNKNOWN then
		UI:PlayGlobalSound( self.sounds.print )
	end

end


--
function UI.EffectSliderWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.leftBtn or wnd == self.rightBtn then	

		self:StopBarScroll()
		self:StartBtnScroll( wnd == self.leftBtn and -1 or 1 )

	elseif wnd == self.barWnd then
	
		self:StopBtnScroll()
		self:StartBarScroll()

		self:SetValFromPoint( mouseX, mouseY )

	end

	return true

end


--
function UI.EffectSliderWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:StopBtnScroll()
	self:StopBarScroll()

	return true

end


--
function UI.EffectSliderWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if self:IsBarScrolling() then
		self:SetValFromPoint( mouseX, mouseY )
	end	

	return true

end


--
function UI.EffectSliderWnd:StopBtnScroll()

	self.btnScrollDir				= 0
	self.btnScrollRepeatDelayTimer	= -1
	self.btnScrollTime 				= 0
	self.btnScrolledStepsFloat		= 0
	self.btnScrolledStepsInt		= 0

end


--
function UI.EffectSliderWnd:StartBtnScroll( dir )

	if not self:HasSliderStyle( self.sliderStyles.HAS_BTNS ) then
		sys.log( "UI.EffectSliderWnd:StartBtnScroll()[ERROR]: no HAS_BTNS style" )
		return
	end

	self:StopBtnScroll()

	self.btnScrollDir = dir
	self.btnScrollRepeatDelayTimer = self.SCROLL_REPEAT_DELAY

	self:ScrollInternal( self.btnScrollDir, 1, self.eventSources.BTNS )
	
end


--
function UI.EffectSliderWnd:GetScrolSpeed( time )

	for stage = #self.scrollSpeeds, 1, -1 do

		local speedInfo = self.scrollSpeeds[ stage ]
		if time >= speedInfo.time then
			return speedInfo.steps
		end

	end

	return 1

end


--
function UI.EffectSliderWnd:IsBtnScrolling()

	return self.btnScrollDir ~= 0

end


--
function UI.EffectSliderWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateBtnScroll( dt_sys )

end


--
function UI.EffectSliderWnd:UpdateBtnScroll( dt )

	if self.btnScrollDir == 0 then
		return
	end

	if self.btnScrollRepeatDelayTimer ~= -1 then

		self.btnScrollRepeatDelayTimer = self.btnScrollRepeatDelayTimer - dt
		if self.btnScrollRepeatDelayTimer <= 0 then
			self.btnScrollRepeatDelayTimer = -1
		end		

	else

    	self.btnScrollTime = self.btnScrollTime + dt

    	local scrollSpeed = self:GetScrolSpeed( self.btnScrollTime )
    	
    	self.btnScrolledStepsFloat = self.btnScrolledStepsFloat + scrollSpeed * dt

    	local steps = math.floor( self.btnScrolledStepsFloat ) - self.btnScrolledStepsInt
    	if steps > 0 then
    		self:ScrollInternal( self.btnScrollDir, steps, self.eventSources.BTNS )
    		self.btnScrolledStepsInt = self.btnScrolledStepsInt + steps
    	end

    	if self.val <= self.min or self.val >= self.max then
    		self:StopBtnScroll()
    	end

	end

end


--
function UI.EffectSliderWnd:ScrollInternal( dir, steps, eventSrc )

	local val = self.val + self.step * steps * dir
	self:SetVal( val, eventSrc )

end


--
function UI.EffectSliderWnd:StopBarScroll()

	if not self:IsBarScrolling() then
		return
	end

	UI:CaptureMouse( UI.INVALID_UI_HANDLE )

end


--
function UI.EffectSliderWnd:StartBarScroll()

	if not self:HasSliderStyle( self.sliderStyles.HAS_BAR ) then
		sys.log( "UI.EffectSliderWnd:StartBtnScroll()[ERROR]: no HAS_BAR style" )
		return
	end

	if self:IsBarScrolling() then
		return
	end

	UI:CaptureMouse( self:GetUiHandle() )
	
	UI:PlayGlobalSound( self.sounds.barClick )

end


--
function UI.EffectSliderWnd:IsBarScrolling()

	return self:HasSliderStyle( self.sliderStyles.HAS_BAR ) and UI:GetMouseCapture() == self:GetUiHandle()

end


--
function UI.EffectSliderWnd:SetValFromPoint( x, y )

	local t = self.barInputRect.z ~= 0 and ( x - self.barInputRect.x ) / self.barInputRect.z or 1
	local val = UI:Lerp( self.min, self.max, t )
	val = UI:Round( val / self.step ) * self.step
	val = UI:Clamp( val, self.min, self.max )

	self:SetVal( val, self.eventSources.BAR )

end


--
function UI.EffectSliderWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:StopBtnScroll()
	self:StopBarScroll()

end


--
function UI.EffectSliderWnd:OnEditMissMouse( editWnd )

	if UI:GetKeyboardFocus() == editWnd:GetUiHandle() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
		UI:ValidateKeyboardFocus()
	end

end

-- ----------------------------------------------------------------------
-- UI.EffectSlider_BarWnd
-- ----------------------------------------------------------------------

UI.EffectSlider_BarWnd =
{
	def =
	{
		className = "Wnd",

		props =
		{
			name		= "EffectSlider_BarWnd",
			style		= UI.WS_UPDATE_IF_VISIBLE,
			isPrototype	= true,
		},

    	layers =
    	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
				main		= true,
				updatable	= false,
    		},
    	}
	},

	layers =
	{
		MAIN_EFFECT		= 0
	},

	effectInfo =
	{
		main =
		{
			inputRectObjName	= "",
			animIdle			= "idle",
			animDisabled		= "",
		}
	}
}

-- ----------------------------------------------------------------------
-- UI.EffectSlider_LeftBtn
-- ----------------------------------------------------------------------

UI.EffectSlider_LeftBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "EffectSlider_LeftBtn",
			isPrototype	= true,
		}
	}
}

-- ----------------------------------------------------------------------
-- UI.EffectSlider_RightBtn
-- ----------------------------------------------------------------------

UI.EffectSlider_RightBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "EffectSlider_RightBtn",
			isPrototype	= true,
		}
	}
}

-- ----------------------------------------------------------------------
-- UI.EffectSlider_EditWnd
-- ----------------------------------------------------------------------

UI.EffectSlider_EditWnd =
{
	def =
	{
		className	= "EditWnd",
		prototype	= "EffectEditWnd",

		props =
		{
			name				= "EffectSlider_EditWnd",
	 		activationOrder		= -1,
			editStyle			= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL + UI.ES_NUM,
			forbiddenChars		= "+-.",
			isPrototype			= true,
		}
	}
}
    


-- реализации с конкретными эффектами

-- ------------------------------------------------------------------------
-- UI.Slider1Wnd
-- ------------------------------------------------------------------------

UI.Slider1Wnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "EffectSliderWnd",

    	props =
    	{
    		name		= "Slider1Wnd",
    		isPrototype	= true,
    	},

    	layers =
    	{
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName 			= "shop_buy_slider_main",
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
    	},
    },

    sliderStyle = UI.EffectSliderWnd.sliderStyles.HAS_BTNS + UI.EffectSliderWnd.sliderStyles.HAS_EDIT + UI.EffectSliderWnd.sliderStyles.HAS_BAR,

    sliderBarPrototypeName	= "Slider1_BarWnd",
    leftBtnPrototypeName	= "Slider1_LeftBtn",
    rightBtnPrototypeName	= "Slider1_RightBtn",
    editPrototypeName		= "Slider1_EditWnd",

    effectInfo =
    {
    	main =
    	{
    		sliderBarObjName	= "buy_slider",
    		btnLeftObjName		= "slider_btn_left",
    		btnRightObjName		= "slider_btn_right",
    		editObjName			= "buy_input",
    	}
    },
}

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- UI.Slider1_BarWnd, UI.Slider1_LeftBtn, UI.Slider1_RightBtn, UI.Slider1_EditWnd
-- ---------------------------------------------------------------------------------------------------------------------------------------

--
UI.Slider1_BarWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "EffectSlider_BarWnd",

		props =
		{
			name		= "Slider1_BarWnd",
			isPrototype	= true,
		},

    	layers =
    	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
				main		= true,
				updatable	= false,

    			effects =
    			{{
    				defName 			= "shop_buy_slider_bar",
    				defaultAnimation	= "idle",

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
			inputRectObjName	= "slider_size"
		}
	}
}


--
UI.Slider1_LeftBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectSlider_LeftBtn",

		props =
		{
			name			= "Slider1_LeftBtn",
			isPrototype		= true,
			selectSound		= UI.sounds.btnMouseOver,
			clickSound		= UI.sounds.btnClick,
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
    				defName 			= "shop_buy_slider_leftBtn",
    				defaultAnimation	= "idle",

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


--
UI.Slider1_RightBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectSlider_RightBtn",

		props =
		{
			name			= "Slider1_RightBtn",
			isPrototype		= true,
			selectSound		= UI.sounds.btnMouseOver,
			clickSound		= UI.sounds.btnClick,
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
    				defName 			= "shop_buy_slider_rightBtn",
    				defaultAnimation	= "idle",

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


--
UI.Slider1_EditWnd =
{
	def =
	{
		className	= "EditWnd",
		prototype	= "EffectSlider_EditWnd",

		props =
		{
			name		= "Slider1_EditWnd",
			isPrototype	= true,
			symbolsLimit= 2,
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
    				defName 			= "shop_buy_slider_edit",
    				defaultAnimation	= "deselect",

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
    		textObjName				= "text",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "select",
    		animInactive			= "deselect",
    	}
    }
}

-- ------------------------------------------------------------------------
-- UI.Slider2Wnd
-- ------------------------------------------------------------------------

UI.Slider2Wnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "EffectSliderWnd",

    	props =
    	{
    		name		= "Slider2Wnd",
    		isPrototype	= true,
    	},

    	layers =
    	{
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName 			= "slider2_main",
    				defaultAnimation	= "idle_1",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		}
    	},
    },

    sliderStyle = UI.EffectSliderWnd.sliderStyles.HAS_BAR,

    sliderBarPrototypeName	= "Slider2_BarWnd",

    effectInfo =
    {
    	main =
    	{
    		sliderBarObjName	= "slider",
			animIdle			= "idle_1",
    	}
    },
}

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- UI.Slider2_BarWnd
-- ---------------------------------------------------------------------------------------------------------------------------------------

--
UI.Slider2_BarWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "EffectSlider_BarWnd",

		props =
		{
			name		= "Slider2_BarWnd",
			isPrototype	= true,
		},

    	layers =
    	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
				main		= true,
				updatable	= false,

    			effects =
    			{{
    				defName 			= "slider2_bar",
    				defaultAnimation	= "idle_1",

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
			inputRectObjName	= "slider_size",
			animIdle			= "idle_1",
		}
	}
}


-- элемент без собственно слайдера - только поле ввода и кнопки
-- ------------------------------------------------------------------------
-- UI.NumericInputWnd
-- ------------------------------------------------------------------------

UI.NumericInputWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "EffectSliderWnd",

    	props =
    	{
    		name		= "NumericInputWnd",
    		isPrototype	= true,
    	},

    	layers =
    	{
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName 			= "numericInput_main",
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
    	},
    },

    sliderStyle = UI.EffectSliderWnd.sliderStyles.HAS_BTNS + UI.EffectSliderWnd.sliderStyles.HAS_EDIT,

    leftBtnPrototypeName	= "NumericInputWnd_PrevBtn",
    rightBtnPrototypeName	= "NumericInputWnd_NextBtn",
    editPrototypeName		= "NumericInputWnd_EditWnd",

    effectInfo =
    {
    	main =
    	{
    		btnLeftObjName		= "btn_up",
    		btnRightObjName		= "btn_down",
    		editObjName			= "buy_input",
    	}
    },
}

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- UI.NumericInputWnd_PrevBtn, UI.NumericInputWnd_NextBtn, UI.NumericInputWnd_EditWnd
-- ---------------------------------------------------------------------------------------------------------------------------------------

--
UI.NumericInputWnd_PrevBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectSlider_LeftBtn",

		props =
		{
			name			= "NumericInputWnd_PrevBtn",
			isPrototype		= true,
			selectSound		= UI.sounds.btnMouseOver,
			clickSound		= UI.sounds.btnClick,
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
    				defName 			= "numericInput_prevBtn",
    				defaultAnimation	= "idle",

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


--
UI.NumericInputWnd_NextBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectSlider_RightBtn",

		props =
		{
			name			= "NumericInputWnd_NextBtn",
			isPrototype		= true,
			selectSound		= UI.sounds.btnMouseOver,
			clickSound		= UI.sounds.btnClick,
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
    				defName 			= "numericInput_nextBtn",
    				defaultAnimation	= "idle",

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


--
UI.NumericInputWnd_EditWnd =
{
	def =
	{
		className	= "EditWnd",
		prototype	= "EffectSlider_EditWnd",

		props =
		{
			name		= "NumericInputWnd_EditWnd",
			isPrototype	= true,
			symbolsLimit= 14,
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
    				defName 			= "numericInput_edit",
    				defaultAnimation	= "deselect",

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
    		textObjName				= "text",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "select",
    		animInactive			= "deselect",
    	}
    }
}