-- ----------------------------------------------------------------------------
--
-- Workfile: choicewnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ChoiceWnd = {}
local cw = UI.ChoiceWnd

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.ChoiceWnd.def =
{
	className	= "Wnd",

	props =
	{
		name 			= "ChoiceWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
				defName				= "choice",
				defaultAnimation    = "idle",

				links =
				{     
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.ChoiceWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	},
}


-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.ChoiceWnd:Setup( text, bLeftArrow, bRightArrow )

	self:SetChoiceText( text )

	self:EnableLeftArrow( bLeftArrow )
	self:EnableRightArrow( bRightArrow )

end


--
function UI.ChoiceWnd:Reset()

	self:SetChoiceText( "" )

	self:EnableLeftArrow( false )
	self:EnableRightArrow( false )

end


--
function UI.ChoiceWnd:OnScroll( bForward )

	local btn = bForward and self.rightArrow or self.leftArrow
	btn:Press()	

end


--
function UI.ChoiceWnd:HideArrows()

	self.leftArrow:UnlinkFromParent()
	self.rightArrow:UnlinkFromParent()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( self.leftArrow:GetUiHandle(), "" )
		mainEffect:UnlinkWnd( self.rightArrow:GetUiHandle(), "" )
	end

end


--
function UI.ChoiceWnd:ShowArrows()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.leftArrow, mainEffect, self.effectInfo.main.leftArrowObjName, UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
	UI:AddChildAndLink( self, self.rightArrow, mainEffect, self.effectInfo.main.rightArrowObjName, UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )

end


--
function UI.ChoiceWnd:EnableLeftArrow( bEnable )

	if bEnable then
		self.leftArrow:RemoveStyle( UI.WS_DISABLE )
	else
		self.leftArrow:AddStyle( UI.WS_DISABLE )
	end

end


--
function UI.ChoiceWnd:EnableRightArrow( bEnable )

	if bEnable then
		self.rightArrow:RemoveStyle( UI.WS_DISABLE )
	else
		self.rightArrow:AddStyle( UI.WS_DISABLE )
	end

end


--
function UI.ChoiceWnd:SetChoiceText( text )

	self:SetText( text, self.layers.TEXT )

end


-- ------------------------------------
-- const
-- ------------------------------------

cw.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}  

cw.effectInfo =
{
	main =
	{
		leftArrowObjName	= "btn_left",
		rightArrowObjName   = "btn_right",
	}
}

cw.leftArrowPrototypeName	= "Choice_ArrowBtn_Left"
cw.rightArrowPrototypeName	= "Choice_ArrowBtn_Right"

-- ------------------------------------
-- vars
-- ------------------------------------

cw.leftArrow = nil
cw.rightArrow = nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.ChoiceWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateArrows()
	self:ShowArrows()

end   


--
function UI.ChoiceWnd:F_Shutdown()

	self:DeleteControls()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ChoiceWnd:DeleteControls()

	if self.leftArrow then
		UI:RemoveUiObj( self.leftArrow:GetUiHandle() )
		self.leftArrow = nil
	end

	if self.rightArrow then
		UI:RemoveUiObj( self.rightArrow:GetUiHandle() )
		self.rightArrow = nil
	end

end    


--
function UI.ChoiceWnd:CreateArrows()

	local protoLeft = UI:GetUiObjByHandleT( UI:GetPrototypeByName( self.leftArrowPrototypeName ) )
	local protoRight = UI:GetUiObjByHandleT( UI:GetPrototypeByName( self.rightArrowPrototypeName ) )

	self.leftArrow	= UI:CreateChildWnd( self, protoLeft, "" )
	self.rightArrow	= UI:CreateChildWnd( self, protoRight, "" )

end


-- ---------------------------------------------------------------------------
-- UI.Choice_ArrowBtn
-- ---------------------------------------------------------------------------

UI.Choice_ArrowBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "Choice_ArrowBtn",
			selectSound	= UI.sounds.btnMouseOver,
			isPrototype	= true,
    	},	
	},

	CHOICE_ARROW = true,
}

-- ---------------------------------------------------------------------------
-- UI.Choice_ArrowBtn_Left
-- ---------------------------------------------------------------------------

UI.Choice_ArrowBtn_Left =
{
	def =
	{
    	className 	= "ButtonWnd",
		prototype	= "Choice_ArrowBtn",

    	props =
    	{
    		name		= "Choice_ArrowBtn_Left",
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
    				defName				= "choice_leftBtn",
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

	CHOICE_ARROW_LEFT = true,

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},
    },
}

-- ---------------------------------------------------------------------------
-- UI.Choice_ArrowBtn_Right
-- ---------------------------------------------------------------------------

UI.Choice_ArrowBtn_Right =
{
	def =
	{
    	className 	= "ButtonWnd",
		prototype	= "Choice_ArrowBtn",

    	props =
    	{
    		name		= "Choice_ArrowBtn_Right",
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
    				defName				= "choice_rightBtn",
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

	CHOICE_ARROW_RIGHT = true,

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},
    },
}