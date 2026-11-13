-- ----------------------------------------------------------------------------
--
-- Workfile: antechamberwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.AntechamberWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.AntechamberWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "AntechamberWnd",
		style	= 0,
		rectAbs	= Quat( 0, 0, 1024, 768 ),
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "Black",
		}
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.AntechamberWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.AntechamberWnd:Hide( bPlayAnim, bPlayFinalAnim )

	self:UnlinkFromParent()		

end   


--
function UI.AntechamberWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	if self:IsOnScreen() then
		self:DecideWhatToDo()
	end
	
end

-- -----------------------------------
-- const
-- -----------------------------------

UI.AntechamberWnd.IS_FULL_SCREEN = true

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.AntechamberWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_TUTORIAL_STOP )	

end


--
function UI.AntechamberWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_WND_HIDED )

	self:DecideWhatToDo()

end



--
function UI.AntechamberWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_WND_HIDED )
		UI.NY2018PromoWnd:Hide()
	end

end


--
function UI.AntechamberWnd:F_OnEventWndHided( hSender, hWnd )

	if self:IsOnScreen() and UI.NY2018PromoWnd and UI.NY2018PromoWnd.w and UI.NY2018PromoWnd:GetUiHandle() == hWnd then
		self:DecideWhatToDo()
	end

end


--
function UI.AntechamberWnd:DecideWhatToDo()

	-- нет коннекта?
	if not _G.MasterServer_IsConnected() then
		self:UnlinkFromParent()
		UI.LoginWnd:Show()
		return
	end

	-- если есть еще уровни геймплейного туториала, то между ними ангар не загружается
	if UI.Tutorial:IsActive() and UI.Tutorial:GetNextStageToPlay() ~= -1 then
		return
	end
	
	-- приветственный экран
	if not UI.Tutorial:IsActive() then
		if UI.NY2018PromoWnd:NeedShow() and not UI.NY2018PromoWnd:IsOnScreen() then
			UI.NY2018PromoWnd:Show( true )
		end
	else
		UI.NY2018PromoWnd:Hide( false )
	end
	
	if UI.NY2018PromoWnd:IsOnScreen() then
		return
	end

	-- старт туториала
	if not UI.Tutorial:IsActive() and not UI.HangarWnd:IsShownInLoginSession() then
		if UI.Tutorial:NeedStartFirstTime() then
			UI.Tutorial:Start( UI.Tutorial.modes.FIRST )
			return
		end
	end

	-- ок, запуск ангара
	self:LaunchHangar()
	
end


--
function UI.AntechamberWnd:LaunchHangar()

	local levelName = UI:GetCurLevelName()
	local rightMainMenuLevelName = UI:GetRightMainMenuLevelName()
	
	if UI:IsValidMainMenuLevelName( levelName ) and rightMainMenuLevelName ~= levelName then
		UI:LoadMainMenuLevel()
	else
		if not UI.HangarWnd:IsOnScreen() then
			UI:HideAllWindows()
			UI.HangarWnd:Show()
		end
	end

end


--
function UI.AntechamberWnd:F_OnEventTutorialStop( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:DecideWhatToDo()

end