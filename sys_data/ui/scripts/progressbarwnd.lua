-- ----------------------------------------------------------------------------
--
-- Workfile: ProgressBarWnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
-- 
-- Table for base ProgressBarWnd class
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

UI.ProgressBarWnd = {}
   	
function UI.ProgressBarWnd:SetRange( min, max )				self.w:SetRange( min, max ) end
function UI.ProgressBarWnd:SetMin( min )					self.w:SetMin( min ) end
function UI.ProgressBarWnd:SetMax( max )					self.w:SetMax( max ) end
function UI.ProgressBarWnd:GetMin()				    		return self.w:GetMin() end
function UI.ProgressBarWnd:GetMax()							return self.w:GetMax() end
function UI.ProgressBarWnd:SetPos( pos )					self.w:SetPos( pos ) end
function UI.ProgressBarWnd:GetPos()							return self.w:GetPos() end
function UI.ProgressBarWnd:SetNumSteps( steps )				self.w:SetNumSteps( steps ) end
function UI.ProgressBarWnd:GetNumSteps()					return self.w:GetNumSteps() end
function UI.ProgressBarWnd:SetProgressBarStyle( style )		self.w:SetProgressBarStyle( style ) end
function UI.ProgressBarWnd:GetProgressBarStyle()			return self.w:GetProgressBarStyle() end
function UI.ProgressBarWnd:AddProgressBarStyle( style )		self.w:AddProgressBarStyle( style ) end
function UI.ProgressBarWnd:RemoveProgressBarStyle( style )	self.w:RemoveProgressBarStyle( style ) end
function UI.ProgressBarWnd:HasProgressBarStyle( style )		return self.w:HasProgressBarStyle( style ) end
function UI.ProgressBarWnd:RecalcLayot()					self.w:RecalcLayot() end

UI:InheritWnd( UI.ProgressBarWnd, UI.Wnd )


