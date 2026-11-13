-- ----------------------------------------------------------------------------
--
-- Workfile: msgbox.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.MsgBox = {}
local mb = UI.MsgBox

-- --------------------------------
-- window definition
-- --------------------------------

--
mb.layers =
{
	MAIN_EFFECT		= 0,
	BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    MSG				= 4,
}

--
UI.MsgBox.def =
{
	className = "MsgBoxWnd",

	props =
	{
		name				= "MsgBox",
		style				= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN + UI.WS_CHANGE_ACTIVE_BY_LR + UI.WS_CHANGE_ACTIVE_CYCLED,
		rectAbs				= Quat( 0, 0, 1024, 768 ),
		isPrototype			= true,

    	captionLayerIdx		= mb.layers.CAPTION,
    	msgLayerIdx			= mb.layers.MSG,
    	bgLayerIdx			= mb.layers.MAIN_EFFECT,
        okBtnPrototype		= "MsgBox_OkBtn",
        yesBtnPrototype		= "MsgBox_YesBtn",
        noBtnPrototype		= "MsgBox_NoBtn",
        cancelBtnPrototype	= "MsgBox_CancelBtn",
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
				defName				= "msgBox_main",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "window",
						layer		= "UI.MsgBox.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.MsgBox.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "blackBg",
				defaultAnimation    = "idle",
			}}
		},
  
		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "msgBox_work",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.MsgBox.layers.CAPTION",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text",
						layer		= "UI.MsgBox.layers.MSG",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- CAPTION
   		{
   			layerType	= UI.LAYER_TEXT,

  			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			font =
  			{
  				fontName = "Small",
   			},
   		},

		-- MSG
   		{
   			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

  			formatInfoSz = { 10, 5 },
   			formatFlags	= FONT.TF_WORDBREAK,
   			font =
  			{
  				fontName = "Small",
   			},
   		},
	},		
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.MsgBox:AllowOnEscape( bAllowOnEscape )

	if type( bAllowOnEscape ) ~= "boolean" then
		sys.log( "UI.MsgBox:AllowOnEscape()[ERROR]: invalid type of the 1-st parameter (\"bAllowOnEscape\"); \"boolean\" expected, got \"%s\"", type( bAllowOnEscape ) )
		return
	end

	self.bAllowOnEscape = bAllowOnEscape

end


-- --------------------------------
-- const
-- --------------------------------

mb.effectInfo =
{
	work =
	{
		btnProto2ObjName =
		{
			MsgBox_OkBtn	= "button_2",
			MsgBox_YesBtn	= "button_1",
			MsgBox_NoBtn	= "button_2",
		},

		btnProto2ObjNameCancelMode =
		{
			MsgBox_OkBtn		= "button_2",
			MsgBox_YesBtn		= "button_3",
			MsgBox_NoBtn		= "button_1",
			MsgBox_CancelBtn	= "button_2",
		},
		
		minMsgHeightObjName = "dist_min",
	}
}

mb.sounds =
{
	changeBtnFocus	= "",
	btnMouseOver	= UI.sounds.btnMouseOver,
}

-- --------------------------------
-- vars
-- --------------------------------

mb.msgMetaText 		= nil
mb.bAllowOnEscape	= true

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.MsgBox:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.msgMetaText = UI.MetaText.GetNewInstance()
	self.msgMetaText:InitFromLayer( self, self.layers.MSG ) 

end


--
function UI.MsgBox:F_Shutdown()

	if not self:IsPrototype() then
		self.msgMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.MsgBox:F_RecalcLayot()

	-- метатекст; т.к. нет специального коллбэка на функцию Setup(), то метатексту присваивается строка здесь (эта функция гарантированно вызывается из Setup())
                                                                                                                                                                
	local msg = self:GetText( self.layers.MSG )
	msg = UI:SubstituteLinks( msg )

	self.msgMetaText:SetText( msg, true )


	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	-- кнопки

	local child = self:GetFirstChild()
	while child do

		if UI:IsWndKindOf( child, "MsgBox_Btn" ) then

    		local protoName = child:GetPrototypeName()
    		local objName = self.effectInfo.work.btnProto2ObjName[ protoName ]

    		if bit.band( self:GetMsgBoxStyle(), UI.MBS_YES_NO_CANCEL ) == UI.MBS_YES_NO_CANCEL then
    			objName = self.effectInfo.work.btnProto2ObjNameCancelMode[ protoName ]
	   		end
	   		
    		workEffect:LinkWnd( child:GetUiHandle(), objName, UI.EffectAnimParams.POS ) 

		end

		child = child:GetNextSibling()

	end


	-- изменение размера окна в зависимости от размера текста

	local formatRect = UI:ZeroQuat()
	formatRect.z = self:GetLayerWidth( self.layers.MSG )
	formatRect.w = 1000000
	
	local msgHeight = _G.MeasureText(
   		self:GetMsg(),
   		self:GetFont( self.layers.MSG ),
   		formatRect,
   		self:GetTextFormatFlags( self.layers.MSG ),
   		formatRect ).w


	local minMsgHeight = workEffect:GetObjSize( self.effectInfo.work.minMsgHeightObjName ).y 
	local maxMsgHeight = self:GetLayerHeight( self.layers.MSG ) 

	local animTime = ( msgHeight - minMsgHeight ) / ( maxMsgHeight - minMsgHeight )

	workEffect:SetAnimationTime( animTime )
	workEffect:Update( 0 )

end


--
function UI.MsgBox:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	local res = false
	local oldActiveChild = self.w:GetActiveChild()

	-- в базовой реализации месседжбокса эти клавиши обрабатываются, но здесь пресекается их обработка
	if key == UI.Keys.KEY_TAB or key == UI.Keys.KEY_SPACE then		
		res = true

	-- #0044596 - не нравится, что закрывается по эскейпу месседжбокс и возвращении в игру - можно по инерции нажать, пытаясь закрыть окно с рекламой
	elseif key == UI.Keys.KEY_ESCAPE and not self.bAllowOnEscape then
		res = true

	-- базовая реализация месседжбокса (клавиши ENTER и ESCAPE; а также LEFT и RIGHT + благодаря стилю окна WS_CHANGE_ACTIVE_BY_LR)
	else
		res = self:OnKeyboardKeyDown( key, wndThatReceivedInput )
	end

	local activeChild = self.w:GetActiveChild()
	if activeChild and activeChild ~= oldActiveChild then
		if self.sounds.changeBtnFocus and self.sounds.changeBtnFocus ~= "" then
			UI:PlayGlobalSound( self.sounds.changeBtnFocus )
		end
	end

	return res

end


--
function UI.MsgBox:F_OnJoystickKeyDown( key, wndThatReceivedInput, gamepadType, controllerIdx )

	-- в данном проекте геймпад не поддерживается
	return true

end


--
function UI.MsgBox:F_OnBeforeMsgBoxReturn( retCode )

	-- предполагается, что на нажатие кнопки "да" должен проиграть звук тот, кто заказывал месседжбокс
	-- (т.к. действие в результате может выполняться разное, звук наверно тоже может быть разный)

	if retCode ~= UI.MBRET_YES then
		UI:PlayGlobalSound( UI.sounds.msgBoxClose )
	end

end


--
function UI.MsgBox:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	
	-- #0104461(0487573)(0487582) для этого тикета было сделано, что если поле ввода имеет фокус, то оно его не отдает автоматически при появлении других окон;
	-- в результате месседжбокс появляется без фокуса; поэтому ставим здесь фокус явно
	UI:SetKeyboardFocus( self:GetUiHandle() )

end


--
function UI.MsgBox:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.MsgBox:UpdateMetaTextPos()

	self.msgMetaText:UpdateScreenOrgFromLayer( self, self.layers.MSG )

end



--
function UI.MsgBox:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MSG then
		self.msgMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- --------------------------------------------------------
-- UI.MsgBox_Btn
-- --------------------------------------------------------

UI.MsgBox_Btn = {}
local mbb = UI.MsgBox_Btn

-- --------------------------------
-- window definition
-- --------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.MsgBox_Btn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name			= "MsgBox_Btn",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype		= true,
		selectSound		= UI.MsgBox.sounds.btnMouseOver,
	},

	layers =
	{  
		numLayers = l_numBaseBtnLayers + 1,
		    			
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName				= "msgBox_btn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.MsgBox_Btn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- TEXT
		{
			id			= l_numBaseBtnLayers,

			layerType	= UI.LAYER_TEXT,

			formatFlags	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},
	},
}

-- --------------------------------
-- const
-- --------------------------------

mbb.layers =
{
    MAIN_EFFECT		= 0,
	DEBUG			= 1,
    TEXT			= 2,
}

mbb.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over_nofocus",
		animationPressed		= "press_nofocus",
		animationDisabled		= "disable",
		animationIdle_focus 	= "select",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}

-- --------------------------------------------------------
-- UI.MsgBox_OkBtn, UI.MsgBox_YesBtn, UI.MsgBox_NoBtn
-- --------------------------------------------------------

--
UI.MsgBox_OkBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		
		props =
		{
			name			= "MsgBox_OkBtn",
			activationOrder	= 0,
			isPrototype		= true,
		},

		layers =
		{
			-- TEXT
			{
				id		= mbb.layers.TEXT,
				text	= "^OK",
			},
		}
	}
}


--
UI.MsgBox_YesBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		
		props =
		{
			name			= "MsgBox_YesBtn",
			activationOrder	= 1,
			isPrototype		= true,
		},

		layers =
		{
			-- TEXT
			{
				id		= mbb.layers.TEXT,
				text	= "^Yes",
			},
		}
	}
}


--
UI.MsgBox_NoBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		
		props =
		{
			name			= "MsgBox_NoBtn",
			activationOrder	= 2,
			isPrototype		= true,
		},

		layers =
		{
			-- TEXT
			{
				id		= mbb.layers.TEXT,
				text	= "^No",
			},
		}
	}
}


--
UI.MsgBox_CancelBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		
		props =
		{
			name			= "MsgBox_CancelBtn",
			activationOrder	= 3,
			isPrototype		= true,
		},

		layers =
		{
			-- TEXT
			{
				id		= mbb.layers.TEXT,
				text	= "^cancel",
			},
		}
	}
}