-- ----------------------------------------------------------------------------
--
-- Workfile: effectcheckboxwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

-- ------------------------------------------------------------------------
-- UI.EffectCheckBoxWnd
-- ------------------------------------------------------------------------

UI.EffectCheckBoxWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.EffectCheckBoxWnd.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "EffectCheckBoxWnd",
		isPrototype	= true,
	},
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.EffectCheckBoxWnd:Check( isChecked )

	self.isChecked = isChecked
	self:UpdateEffectAnimation()

end


--
function UI.EffectCheckBoxWnd:ToggleCheck()

	self:Check( not self:IsChecked() )	

end


--
function UI.EffectCheckBoxWnd:IsChecked()

	return self.isChecked

end

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.EffectCheckBoxWnd.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "",
		animationSelect		= "",
		animationPressed	= "",
		animationDisabled	= "",
	},

	main_checked =
	{
		animationIdle 		= "",
		animationSelect		= "",
		animationPressed	= "",
		animationDisabled	= "",
	},
}

UI.EffectCheckBoxWnd.layers =
{
	MAIN_EFFECT			= 0,
	DEBUG				= 1,
}

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.EffectCheckBoxWnd.isChecked = false

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.EffectCheckBoxWnd:UpdateEffectAnimation()

	if UI:IsInRemovingAllWindows() then
		return
	end	

	self.effectInfo.main = self.isChecked and self.effectInfo.main_checked or self.effectInfo.main_unchecked

	UI.EffectButtonWnd.UpdateEffectAnimation( self )

end