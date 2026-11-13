-- ----------------------------------------------------------------------------
--
-- Workfile: hudtutorialinfownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudTutorialInfoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.HudTutorialInfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudTutorialInfoWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "hud_tutorialInfo",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.HudTutorialInfoWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по размеру
					{
						objName		= "description",
						layer		= "UI.HudTutorialInfoWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по по позиции
					{
						objName		= "icon",
						layer		= "UI.HudTutorialInfoWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
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

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_tutorialInfo_ico",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -------------------------------
-- const
-- -------------------------------

UI.HudTutorialInfoWnd.layers =
{
    MAIN_EFFECT		= 0,
    NAME			= 1,
    DESC			= 2,
    ICO_EFFECT		= 3,
}

UI.HudTutorialInfoWnd.effectInfo =
{
	main =
	{
		animIdle	= "idle",
		animShow	= "show",
		animHide	= "hide",

		descLocator	= "description",
		icoLocator	= "icon",
	},

	ico =
	{
		icoSpriteName	= "ico"
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.HudTutorialInfoWnd.missionName		= ""
UI.HudTutorialInfoWnd.curObjectiveIdx	= -1

UI.HudTutorialInfoWnd.space_desc_ico	= 0
UI.HudTutorialInfoWnd.space_ico_btm		= 0
UI.HudTutorialInfoWnd.icoHeight			= 0

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.HudTutorialInfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:PrepareLayout()
	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )

end


--
function UI.HudTutorialInfoWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )

	local descLocatorPos	= mainEffect:GetObjPos( self.effectInfo.main.descLocator )
	local descLocatorSize	= mainEffect:GetObjSize( self.effectInfo.main.descLocator )
	local icoLocatorPos		= mainEffect:GetObjPos( self.effectInfo.main.icoLocator )
	local icoSize			= icoEffect and icoEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local selfSize			= mainEffect:GetObjSize( "self" )

	self.space_desc_ico	= icoLocatorPos.y - ( descLocatorPos.y + descLocatorSize.y )
	self.space_ico_btm	= selfSize.y - ( icoLocatorPos.y + icoSize.y )
	self.icoHeight		= icoSize.y

	self:SetLayerWidth( descLocatorSize.x, self.layers.DESC )

	if icoEffect then
		icoEffect:SetPos( UI:Vec2( icoLocatorPos.x, 0 ) )
	end

	self:SetWidth( selfSize.x )

end


--
function UI.HudTutorialInfoWnd:Reset()

	self:ResetContent()

	self.missionName		= ""
	self.curObjectiveIdx	= -1

	self:SetVisible( false )

end


--
function UI.HudTutorialInfoWnd:ResetContent()

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.DESC )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

end


--
function UI.HudTutorialInfoWnd:SetVisible( bVisible )

	if bVisible then
		self:RemoveStyle( UI.WS_NOT_DRAW )
	else
		self:AddStyle( UI.WS_NOT_DRAW )
	end

end


--
function UI.HudTutorialInfoWnd:FullUpdate()

	self:Reset()

	self.missionName = UI:GetCurTutorialMissionName()
	if self.missionName == "" then
		sys.log( "UI.HudTutorialInfoWnd:FullUpdate()[ERROR]: no tutorial mission" )
		return
	end

	self.curObjectiveIdx = UI:GetTutorialMissionCurObjective()
	if self.curObjectiveIdx == -1 then
		return
	end

	self:SetVisible( true )
	self:UpdateContent()

end


--
function UI.HudTutorialInfoWnd:UpdateContent()

	self:ResetContent()

	self:UpdateName()
	self:UpdateDesc()
	self:UpdateIco()

	self:RecalcLayout()

end


--
function UI.HudTutorialInfoWnd:UpdateName()

	local strName = UI:GetTutorialMissionObjectiveName( self.missionName, self.curObjectiveIdx )
	self:SetText( strName, self.layers.NAME )

end


--
function UI.HudTutorialInfoWnd:UpdateDesc()

	local strDesc = UI:GetTutorialMissionObjectiveDesc( self.missionName, self.curObjectiveIdx )
	self:SetText( strDesc, self.layers.DESC )

end


--
function UI.HudTutorialInfoWnd:UpdateIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if not icoEffect then
		return
	end

	local hTex = UI:GetTutorialMissionObjectiveIco( self.missionName, self.curObjectiveIdx )
	icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )

end


--
function UI.HudTutorialInfoWnd:RecalcLayout()

	-- описание - размер по вертикали

	local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 1000000 )

    local descHeight = _G.MeasureText(
   		self:GetText( self.layers.DESC ),
   		self:GetFont( self.layers.DESC ),
    	descFormatRect,
   		self:GetTextFormatFlags( self.layers.DESC ),
    	descFormatRect).w

	self:SetLayerHeight( descHeight, self.layers.DESC )


	-- иконка - позиция по вертикали

	local descY = self:GetLayerTop( self.layers.DESC )
	local icoY = descY + descHeight + self.space_desc_ico

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then

		local icoPos = icoEffect:GetPos()
		icoPos.y = icoY

		icoEffect:SetPos( icoPos )

	end


	-- собственный размер по вертикали

	local selfHeight = icoY + self.icoHeight + self.space_ico_btm
	self:SetHeight( selfHeight )


	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.HudTutorialInfoWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:Update( 0 )
	end	

end


--
function UI.HudTutorialInfoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.missionName == "" then
		return
	end

	local curObjectiveIdx = UI:GetTutorialMissionCurObjective()

	if curObjectiveIdx == self.curObjectiveIdx then
		return
	end

	local prevObjectiveIdx = self.curObjectiveIdx
	self.curObjectiveIdx = curObjectiveIdx

	if self.curObjectiveIdx ~= -1 then

		if prevObjectiveIdx ~= -1 then
			self:HideAnimated()

		else
			self:UpdateContent()
			self:ShowAnimated()
		end

	else		

		self:HideAnimated()

	end

end


--
function UI.HudTutorialInfoWnd:ShowAnimated()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	mainEffect:StartAnimation( self.effectInfo.main.animShow )

	self:SetVisible( true )

end


--
function UI.HudTutorialInfoWnd:HideAnimated()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	mainEffect:StartAnimation( self.effectInfo.main.animHide )

	self:SetVisible( true )

end


--
function UI.HudTutorialInfoWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ) then

		if animName == self.effectInfo.main.animShow then

			effect:StartAnimation( self.effectInfo.main.animIdle )

		elseif animName == self.effectInfo.main.animHide then

			if self.curObjectiveIdx ~= -1 then
				self:UpdateContent()
				self:ShowAnimated()
			else
				self:ResetContent()
				self:SetVisible( false )
			end 

		else
			sys.log( "UI.HudTutorialInfoWnd:F_OnEffectAnimationEnded()[ERROR]: unhanled animation: %s", animName )
		end

	else	
		sys.log( "UI.HudTutorialInfoWnd:F_OnEffectAnimationEnded()[ERROR]: unhandled effect: %s", effect:GetName() )
	end

end


--
function UI.HudTutorialInfoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()
	
end


--
function UI.HudTutorialInfoWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	-- резет нельзя вызывать в F_OnAfterShowOnScreen(). т.к. при любом переключении модов все элементы сначала отлинковываются;
	-- даже если в новом моде элемент по прежнему нужен;
	-- при этом анимация прервется

	if not self:IsOnScreen() then
		self:Reset()
	end

end