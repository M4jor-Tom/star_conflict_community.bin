-- ----------------------------------------------------------------------------
--
-- Workfile: agreementwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.AgreementWnd = {}
local aw = UI.AgreementWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.AgreementWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "AgreementWnd",
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
				defName 			= "agreement_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.AgreementWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "agreement_win",	
						layer		= "UI.AgreementWnd.layers.WORK_EFFECT",
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
				defName 			= "blackBg",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "agreement_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.AgreementWnd.layers.INFO",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",	
						wnd			= "UI.Agreement_TextBox",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_1",	
						wnd			= "UI.Agreement_AcceptBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",	
						wnd			= "UI.Agreement_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",	
						wnd			= "UI.Agreement_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- INFO
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 3, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	},

	children =
	{
		"UI.Agreement_TextBox",
		"UI.Agreement_AcceptBtn",
		"UI.Agreement_CancelBtn",
		"UI.Agreement_CloseBtn",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.AgreementWnd:SetupForNDA( bNeedAccept )

	self:Reset()

	self.mode = self.modes.NDA	
	self.bNeedAccept = bNeedAccept
	
	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.AgreementWnd:SetupForEula( eulaIdx, bNeedAccept )

	self:Reset()

	self.mode		= self.modes.EULA
	self.eulaIdx	= eulaIdx
	self.bNeedAccept = bNeedAccept

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.AgreementWnd:MasterServer_OnSetUserdata( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end
	
	UI.LoginWnd:OnAgreementAccept( self.returnResults.ACCEPT )

end

-- ------------------------------
-- const
-- ------------------------------

aw.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    INFO			= 3,
}

aw.modes =
{
	EULA		= 1,
	NDA			= 2,
}

aw.sounds =
{
	accept		= "sound/ui/btnClick",
	cancel		= "sound/ui/btnClick",
	close		= "sound/ui/btnClick",
}

aw.effectInfo =
{
	work =
	{
		acceptBtnLocator	= "button_1",
		cancelBtnLocator	= "button_2",
		closeBtnLocator		= "button_2",		
	}
}

aw.returnResults =
{
	ACCEPT		= 1,
	REJECT		= 2,
	CLOSE		= 3,
}

-- ------------------------------
-- vars
-- ------------------------------

aw.mode			= -1
aw.textBox		= nil
aw.acceptBtn	= nil
aw.cancelBtn	= nil
aw.closeBtn		= nil
aw.eulaIdx		= -1
aw.bNeedAccept	= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.AgreementWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self.textBox	= UI.Agreement_TextBox
	self.acceptBtn	= UI.Agreement_AcceptBtn
	self.cancelBtn	= UI.Agreement_CancelBtn
	self.closeBtn	= UI.Agreement_CloseBtn

	self:Reset()

end


--
function UI.AgreementWnd:Reset()

	self:SetText( "", self.layers.INFO )
	self.textBox:Reset()

	self:RemoveControl( self.acceptBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( self.cancelBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( self.closeBtn, self.layers.WORK_EFFECT )

	self.mode 			= -1
	self.eulaIdx		= -1
	self.bNeedAccept	= false

end


--
function UI.AgreementWnd:FullUpdate()

	self:UpdateInfo()
	self:UpdateText()	
	self:UpdateAcceptControlsVisibility()

end


--
function UI.AgreementWnd:UpdateInfo()

	if self.mode == self.modes.NDA then
		self:SetText( UI:GetStringByName( "NDA_info" ), self.layers.INFO )

	elseif self.mode == self.modes.EULA then	

		local eulaInfo = _G.EULA and _G.EULA[ self.eulaIdx ]
		local prefix = eulaInfo and eulaInfo.prefix or ""

		local strId = string.format( "%sinfo", prefix )
		self:SetText( UI:GetStringByName( strId ), self.layers.INFO )

	else
		sys.log( "UI.AgreementWnd:UpdateInfo()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

end


--
function UI.AgreementWnd:UpdateText()

	if self.mode == self.modes.NDA then
		self.textBox:SetScrollText( UI:GetStringByName( "NDA_text" ) )

	elseif self.mode == self.modes.EULA then

		local eulaInfo = _G.EULA and _G.EULA[ self.eulaIdx ]
		local prefix = eulaInfo and eulaInfo.prefix or ""

		local baseStrId = string.format( "%stext", prefix )

		local text = ""

		-- текст эулы может состоять из нескольких частей, т.к. в утилите локализации есть ограничение на количество символов

		local partIdx = 1
		while true do

			local partStrId = string.format( "%s_%d", baseStrId, partIdx )
--[[ #0031105
			local strHandle = UI:GetResourceHandleByName( partStrId, UI.RES_STRING, true )
			if strHandle == UI.INVALID_RESOURCE_HANDLE then
				break
			end	

			local rc = UI:GetResourceByHandle( strHandle )
			if rc then
				local partText = rc:GetStr()
				text = string.format( "%s%s%s", text, text ~= "" and "|" or "", partText )
			end

			UI:ReleaseResourceHandle( strHandle )
]]

			-- #0031105			
			do
    			local partText = UI:GetStringByName( partStrId, false )
    			if not partText then
    				break
    			end

    			text = string.format( "%s%s%s", text, text ~= "" and "|" or "", partText )
			end

			partIdx = partIdx + 1
						
		end

		self.textBox:SetScrollText( text )

	else
		sys.log( "UI.AgreementWnd:UpdateText()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

end


--
function UI.AgreementWnd:UpdateAcceptControlsVisibility()

	if self.bNeedAccept then

		self:AddControl( self.acceptBtn, self.layers.WORK_EFFECT, self.effectInfo.work.acceptBtnLocator )
		self:AddControl( self.cancelBtn, self.layers.WORK_EFFECT, self.effectInfo.work.cancelBtnLocator )

		self:RemoveControl( self.closeBtn, self.layers.WORK_EFFECT )		

	else

		self:RemoveControl( self.acceptBtn, self.layers.WORK_EFFECT )
		self:RemoveControl( self.cancelBtn, self.layers.WORK_EFFECT )

		self:AddControl( self.closeBtn, self.layers.WORK_EFFECT, self.effectInfo.work.closeBtnLocator )		

	end

end


--
function UI.AgreementWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	UI.store.AgreementWnd =
	{
		mode		= self.mode,
		eulaIdx		= self.eulaIdx,
		bNeedAccept	= self.bNeedAccept,
	}

end


--
function UI.AgreementWnd:F_OnEventRestoreUiState()

	if UI.store.AgreementWnd then

		self.mode			= UI.store.AgreementWnd.mode
		self.eulaIdx		= UI.store.AgreementWnd.eulaIdx
		self.bNeedAccept	= UI.store.AgreementWnd.bNeedAccept

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.AgreementWnd = nil
	end

end


--
function UI.AgreementWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.acceptBtn then
		UI:PlayGlobalSound( self.sounds.accept )
		self:DoAccepion()

	elseif wnd == self.cancelBtn then
		UI:PlayGlobalSound( self.sounds.cancel )
		self:CancelAcception()

	elseif wnd == self.closeBtn then
		UI:PlayGlobalSound( self.sounds.close )
		self:Close()
	end

	return true

end


--
function UI.AgreementWnd:DoAccepion()

	if not self.bNeedAccept then
		sys.log( "UI.AgreementWnd:DoAccepion()[ERROR]: bNeedAccept=false" )
	end	

	if self.mode == self.modes.NDA then

		UI.serverData.userData.NDA =
		{
			appVersion	= _G.GetAppVersion(),
			time		= _G.GetU64Time(),
		}

		UI:SaveServerUserData()

	elseif self.mode == self.modes.EULA then
		UI.LoginWnd:OnAgreementAccept( self.returnResults.ACCEPT )

	else
		sys.log( "UI.AgreementWnd:DoAccepion()[ERROR]: unhandled mode" )
	end

end


--
function UI.AgreementWnd:CancelAcception()

	if not self.bNeedAccept then
		sys.log( "UI.AgreementWnd:CancelAcception()[ERROR]: bNeedAccept=false" )
	end	

	UI.LoginWnd:OnAgreementAccept( self.returnResults.REJECT )

end  


--
function UI.AgreementWnd:Close()

	if self.bNeedAccept then
		sys.log( "UI.AgreementWnd:CancelAcception()[ERROR]: bNeedAccept=true" )
	end	

	UI.LoginWnd:OnAgreementAccept( self.returnResults.CLOSE )

end


--
function UI.AgreementWnd:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS )

end


--
function UI.AgreementWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end


--
function UI.AgreementWnd:OnEscape( key, controllerIdx )

	if not self.bNeedAccept then
		UI:PlayGlobalSound( self.sounds.close )
		self:Close()
	end

	return true

end


-- ----------------------------------------------------------------------------
--  UI.Agreement_TextBox
-- ----------------------------------------------------------------------------

UI.Agreement_TextBox = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.Agreement_TextBox.def =
{
	className	= "Wnd",
	prototype	= "EffectTextBoxWnd",

	props =
	{
		name	= "Agreement_TextBox"
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
				defName 			= "agreement_textBox",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "description",	
						layer		= "UI.EffectTextBoxWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE --[[+ UI.EffectAnimParams.ALIGNMENT]] + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatInfoSz= { 1024, 3 },
   			formatFlags	= FONT.TF_FULL + FONT.TF_TOP + FONT.TF_WORDBREAK,
   			font =
			{
   				fontName = "Small",
   			},

			visible = false
		},
	},

	children = { "UI.Agreement_TextBox_MaskedWnd" }
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.Agreement_TextBox:SetScrollText( text )

	text = UI:SubstituteLinks( text )
	self.metaText:SetText( text, true )

	UI.EffectTextBoxWnd.SetScrollText( self, self.metaText:GetFormattedText() )

end


--
function UI.Agreement_TextBox:Reset()

	UI.EffectTextBoxWnd.Reset( self )
	self.metaText:SetText( "", true )

end 


-- --------------------------------
-- const
-- --------------------------------

UI.Agreement_TextBox.effectInfo =
{
	main =
	{
		scrollObjName		= "scroll",
		textObjName			= "description",
	}
}

UI.Agreement_TextBox.scrollBarPrototypeName	= "EffectScrollWnd_Vrt"
UI.Agreement_TextBox.WHEEL_STEP				= 5

-- --------------------------------
-- vars
-- --------------------------------

UI.Agreement_TextBox.metaText 	= UI.MetaText.GetNewInstance()
UI.Agreement_TextBox.maskedWnd	= nil -- вспомогательное окно, чтобы с его помощью применялась маска только на текст (исключая дргуие элементы типа скроллюбара, фона и т.п.)

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.Agreement_TextBox:F_PostLoad()

	UI.EffectTextBoxWnd.F_PostLoad( self )

	self:InitMaskedWnd()

	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetParentWindow( self.maskedWnd )
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), 1000000 ), false )

end


--
function UI.Agreement_TextBox:F_Shutdown()

	self.metaText:Clear()

	self:DeleteControls()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Agreement_TextBox:InitMaskedWnd()

	self.maskedWnd = UI.Agreement_TextBox_MaskedWnd
	self.maskedWnd:SetRect( self.textFieldRect )	

end


--
function UI.Agreement_TextBox:UpdateTextLayerOnChangeVisibleRange()

	UI.EffectTextBoxWnd.UpdateTextLayerOnChangeVisibleRange( self )

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


-- 
function UI.Agreement_TextBox:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	-- ничего не делать (перегрузка базовой реализации, которая рисует текст),
	-- т.к. отрисовка текста будет вызвана из UI.Agreement_TextBox_MaskedWnd:F_DrawLayer

end


--
function UI.Agreement_TextBox:DrawText( clipX0, clipY0, clipWidth, clipHeight )

	self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

end


-- -------------------------------------------------------------------------------
-- UI.Agreement_TextBox_MaskedWnd
-- -------------------------------------------------------------------------------

UI.Agreement_TextBox_MaskedWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Agreement_TextBox_MaskedWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Agreement_TextBox_MaskedWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	layers =
	{
		-- TEXT
		{
			layerType	= UI.LAYER_INVALID,
			layerStyle	= UI.WLS_OWNERDRAW + UI.WLS_RESIZABLE,
		},

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x4400ffff,
			visible		= false,
		}
	}
}

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.Agreement_TextBox_MaskedWnd.layers =
{
	TEXT	= 0,
	DEBUG	= 1,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Agreement_TextBox_MaskedWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.Agreement_TextBox_MaskedWnd.parent	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Agreement_TextBox_MaskedWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.Agreement_TextBox_MaskedWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.Agreement_TextBox_MaskedWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.Agreement_TextBox_MaskedWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


--
function UI.Agreement_TextBox_MaskedWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.parent:DrawText( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- ----------------------------------------------------------------------------
--  UI.Agreement_Btn
-- ----------------------------------------------------------------------------

local l_numBtnBaseLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.Agreement_Btn = {}
UI.Agreement_Btn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

 	props =
 	{
 		name			= "Agreement_Btn",
		selectSound		= UI.sounds.btnMouseOver,
		isPrototype		= true,
 	},

 	layers =
 	{
		numLayers = l_numBtnBaseLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "shop_buyBtn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Agreement_Btn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}			
		},

		-- TEXT
		{
			id			= l_numBtnBaseLayers,

			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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

UI.Agreement_Btn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
	}
}

UI.Agreement_Btn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

-- --------------------------------
-- vars
-- --------------------------------

UI.Agreement_Btn.textId = ""


-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.Agreement_Btn:F_PostLoad()

	UI.EffectButtonWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:SetText( UI:GetStringByName( self.textId ), self.layers.TEXT )

end


-- ----------------------------------------------------------------------------
--  UI.Agreement_AcceptBtn, UI.Agreement_CancelBtn, UI.Agreement_CloseBtn
-- ----------------------------------------------------------------------------

--
UI.Agreement_AcceptBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Agreement_Btn",

		props =
		{
			name = "Agreement_AcceptBtn"
		}
	},

	textId = "agreement_acceptBtn"
}


--
UI.Agreement_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Agreement_Btn",

		props =
		{
			name = "Agreement_CancelBtn"
		}
	},

	textId = "agreement_cancelBtn"
}

--
UI.Agreement_CloseBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Agreement_Btn",

		props =
		{
			name = "Agreement_CloseBtn"
		}
	},

	textId = "agreement_closeBtn"
}