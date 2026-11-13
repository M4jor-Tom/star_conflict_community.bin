-- ----------------------------------------------------------------------------
--
-- Workfile: UiWorkFuncs.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
-- ----------------------------------------------------------------------------
--  $Id: uiworkfuncs.lua 3506 2011-06-10 09:35:37Z $
-- ----------------------------------------------------------------------------



-- TODO: remove from here!!! - ui just need cvars during loading
SystemExecFile( "scripts/m3dsys.lua" )

UI.screenWidth	= cvars.r_width
UI.screenHeight	= cvars.r_height

UI.abs2Rel_x = 1024 / UI.screenWidth
UI.abs2Rel_y = 768 / UI.screenHeight
UI.rel2Abs_x = UI.screenWidth / 1024
UI.rel2Abs_y = UI.screenHeight / 768

UI.uiScaleFactor = cvars.ui_scaleCf

UI.strMonths	= UI:GetStringByName( "months" )
UI.strDays		= UI:GetStringByName( "days" )
UI.strHours		= UI:GetStringByName( "hours" )
UI.strMinutes	= UI:GetStringByName( "minutes" )
UI.strSecs		= UI:GetStringByName( "units_second" )

UI.minuteSec	= 60
UI.hourSec		= UI.minuteSec * 60
UI.daySecs 		= UI.hourSec * 24
UI.monthSecs	= UI.daySecs * 30

UI.strDecimalDot = "."

UI.strNonBreakableSpace = string.char( 0xc2, 0xa0 )
UI.strNonBreakableSpace_reverse = string.reverse( UI.strNonBreakableSpace )


--
function UI:Lerp( a, b, t )

	return a + ( t * ( b - a ) )

end          


--
function UI:LerpColor( c1, c2, t )

	local a1 = UI:GetAlpha( c1 )
	local r1 = UI:GetRed( c1 )
	local g1 = UI:GetGreen( c1 )
	local b1 = UI:GetBlue( c1 )

	local a2 = UI:GetAlpha( c2 )
	local r2 = UI:GetRed( c2 )
	local g2 = UI:GetGreen( c2 )
	local b2 = UI:GetBlue( c2 )

	local a = a1 + ( t * ( a2 - a1 ) )
	local r = r1 + ( t * ( r2 - r1 ) )
	local g = g1 + ( t * ( g2 - g1 ) )
	local b = b1 + ( t * ( b2 - b1 ) )

	return UI:MakeArgb( a, r, g, b )

end


--
function UI:LerpColor2( argb1, argb2, t )

	local a = argb1.a + ( t * ( argb2.a - argb1.a ) )
	local r = argb1.r + ( t * ( argb2.r - argb1.r ) )
	local g = argb1.g + ( t * ( argb2.g - argb1.g ) )
	local b = argb1.b + ( t * ( argb2.b - argb1.b ) )

	return UI:MakeArgb( a, r, g, b )

end                                    


local _argb1 = { a = 0, r = 0, g = 0, b = 0 }
local _argb2 = { a = 0, r = 0, g = 0, b = 0 }

--
function UI:InterpolateColor( c1, c2, speed, elapsedTime )

	if c1 == c2 then
		return c1
	end

	_argb1.a = UI:GetAlpha( c1 )
	_argb1.r = UI:GetRed( c1 )
	_argb1.g = UI:GetGreen( c1 )
	_argb1.b = UI:GetBlue( c1 )

	_argb2.a = UI:GetAlpha( c2 )
	_argb2.r = UI:GetRed( c2 )
	_argb2.g = UI:GetGreen( c2 )
	_argb2.b = UI:GetBlue( c2 )

	local maxDelta = 0
	for key, val in pairs( _argb1 ) do
		local delta = math.abs( val - _argb2[ key ] )
		if delta > maxDelta then
			maxDelta = delta
		end
	end

	local t = elapsedTime * speed / maxDelta
	if t >= 1 then
		return c2
	end

	local a = _argb1.a + ( t * ( _argb2.a - _argb1.a ) )
	local r = _argb1.r + ( t * ( _argb2.r - _argb1.r ) )
	local g = _argb1.g + ( t * ( _argb2.g - _argb1.g ) )
	local b = _argb1.b + ( t * ( _argb2.b - _argb1.b ) )

	return UI:MakeArgb( a, r, g, b )

end


--
function UI:ColorMul( c1, c2 )

	local a1 = UI:GetAlpha( c1 )
	local r1 = UI:GetRed( c1 )
	local g1 = UI:GetGreen( c1 )
	local b1 = UI:GetBlue( c1 )

	local a2 = UI:GetAlpha( c2 )
	local r2 = UI:GetRed( c2 )
	local g2 = UI:GetGreen( c2 )
	local b2 = UI:GetBlue( c2 )

	local a = a1 * a2 / 255
	local r = r1 * r2 / 255
	local g = g1 * g2 / 255
	local b = b1 * b2 / 255

	return UI:MakeArgb( a, r, g, b )

end


--
function UI:Clamp( x, min, max )

	x = math.min( x, max )
	x = math.max( x, min )

	return x

end


--
function UI:Swap( a, b )

	local t = b
	b = a
	a = t

	return a, b

end


-- округление до ближайшего целого
function UI:Round( f )

	return math.floor( f + 0.5 )

end


-- округление до ближайшего целого; значения больше 0 но меньше 1 округляются до единицы
function UI:RoundClampOne( f )

	if f <= 1e-3 then
		return 0
	elseif f <= 1 then
		return 1
	else
		return self:Round( f )
	end
	
end


--
function UI:Rotate2( vec, angle, ox, oy )

	local s = math.sin( angle )
	local c = math.cos( angle )

	local xr = vec.x - ox;
	local yr = vec.y - oy;

	local xx = xr * c - yr * s;
	local yy = xr * s + yr * c;

	return UI:Vec2( xx + ox, yy + oy )

end


--
function UI:Rotate2_sc( vec, s, c, ox, oy )

	local xr = vec.x - ox;
	local yr = vec.y - oy;

	local xx = xr * c - yr * s;
	local yy = xr * s + yr * c;

	return UI:Vec2( xx + ox, yy + oy )

end


-- длина вектора
function UI:VLength( vec )

	return math.sqrt( vec.x * vec.x + vec.y * vec.y + vec.z * vec.z )

end


-- длина вектора
function UI:VLength3( x, y, z )

	return math.sqrt( x * x + y * y + z * z )

end



-- квадрат длины вектора
function UI:VLengthSq( vec )

	return vec.x * vec.x + vec.y * vec.y + vec.z * vec.z

end


function UI:V2Length( vec )

	return math.sqrt( vec.x * vec.x + vec.y * vec.y )

end    


function UI:V2Length2( x, y )

	return math.sqrt( x * x + y * y )

end


-- квадрат длины вектора
function UI:V2LengthSq( vec )

	return vec.x * vec.x + vec.y * vec.y

end


--
function UI:V3GetNormalized( v )

	local len = v.x * v.x + v.y * v.y + v.z * v.z
	if len > 1e-5 then
	   	len = 1 / math.sqrt( len )
		return UI:Vec3( v.x * len, v.y * len, v.z * len )
	else
		return UI:Vec3( 0, 0, 0 )
	end

end


--
function UI:V3NormalizeInplace( v )

	local len = v.x * v.x + v.y * v.y + v.z * v.z
	if len > 1e-5 then
	   	len = 1 / math.sqrt( len )
		v.x = v.x * len
		v.y = v.y * len
		v.z = v.z * len
	else
		v.x = 0
		v.y = 0
		v.z = 0
	end

end


--
function UI:V2GetNormalized( v )

	local len = v.x * v.x + v.y * v.y
	if len > 1e-5 then
	   	len = 1 / math.sqrt( len )
		return UI:Vec2( v.x * len, v.y * len )
	else
		return UI:Vec2( 0, 0 )
	end

end


--
function UI:V2GetNormalized2( x, y )

	local len = x * x + y * y
	if len > 1e-5 then
	   	len = 1 / math.sqrt( len )
		return x * len, y * len
	else
		return 0, 0
	end

end


--
function UI:V2NormalizeInplace( v )

	local len = v.x * v.x + v.y * v.y
	if len > 1e-5 then
	   	len = 1 / math.sqrt( len )
		v.x = v.x * len
		v.y = v.y * len
	else
		v.x = 0
		v.y = 0
	end

end


--
function UI:V3DotProduct( v1, v2 )

	return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z

end


--
function UI:V2DotProduct( v1, v2 )

	return v1.x * v2.x + v1.y * v2.y

end


--
function UI:ARGB( alpha, red, green, blue )

	return bit.bor( bit.bor( bit.lshift( alpha, 24 ), bit.lshift( red, 16 ) ), bit.bor( bit.lshift( green, 8 ), blue ) )

end


--
function UI:GetCoordinateSystemForAspect( aspect )

	-- that is a base resolution for all effects
	return { x = 1920, y = 1080 }

end


-- TODO: убрать, использовать UI:RectToRel() с нужными параметрами
function UI:RectTo1024x768( rect, srcResolution )

	local tl = UI:PtTo1024x768( UI:Vec3( rect.x, rect.y, 0 ), srcResolution )
	local wh = UI:PtTo1024x768( UI:Vec3( rect.z, rect.w, 0 ), srcResolution )
	return Quat( tl.x, tl.y, wh.x, wh.y )

end


-- TODO: убрать, использовать UI:PtToRel() с нужными параметрами
function UI:PtTo1024x768( pt, srcResolution )

	return Vec2( self:XTo1024x768( pt.x, srcResolution ), self:YTo1024x768( pt.y, srcResolution ) )

end


-- TODO: убрать, использовать UI:XToRel() с нужными параметрами
function UI:XTo1024x768( x, srcResolution )

	return UI:XToRel( x, true, srcResolution )

end


-- TODO: убрать, использовать UI:YToRel() с нужными параметрами
function UI:YTo1024x768( y, srcResolution )

	return UI:YToRel( y, true, srcResolution )

end


--
function UI:CopyTable( srcT, dstT )

   	for key, val in pairs( srcT ) do

   		if type( val ) == "table" then
			dstT[ key ] = {}
			self:CopyTable( val, dstT[ key ] )
		else		
   			dstT[ key ] = val
		end

   	end

end


--
function UI:CopyTable2( srcT )

	local dstT = {}
	self:CopyTable( srcT, dstT )
	return dstT

end


-- yaw/pitch/roll ==> quaternion conversion
function UI:YPRToQuat( y, p, r )

	local xd2 = p * 0.5
	local yd2 = y * 0.5
	local zd2 = r * 0.5

	local cosX = math.cos( xd2 )
	local sinX = math.sin( xd2 )
	local cosY = math.cos( yd2 )
	local sinY = math.sin( yd2 )
	local cosZ = math.cos( zd2 )
	local sinZ = math.sin( zd2 )

	local q = UI:Quat( 0, 0, 0, 1 )

	q.x = cosZ * cosY * sinX - sinZ * sinY * cosX
	q.y = cosZ * sinY * cosX + sinZ * cosY * sinX
	q.z = sinZ * cosY * cosX - cosZ * sinY * sinX
	q.w = cosZ * cosY * cosX + sinZ * sinY * sinX

	return q

end


--
function UI:IntersectRect( r1, r2 )

	local right1	= r1.x + r1.z
	local right2	= r2.x + r2.z
	local btm1		= r1.y + r1.w
	local btm2		= r2.y + r2.w

   	if r1.x > right2 or right1 < r2.x or r1.y > btm2 or btm1 < r2.y then   	
   		return UI:ZeroQuat()
   	end

   	local x0 = r1.x > r2.x and r1.x or r2.x
   	local x1 = right1 < right2 and right1 or right2
   	local y0 = r1.y > r2.y and r1.y or r2.y
   	local y1 = btm1 < btm2 and btm1 or btm2

   	return UI:Quat( x0, y0, x1 - x0, y1 - y0 )

end


--   
function UI:InflateRect( rect, deltaX, deltaY )	

	return UI:Quat( rect.x - deltaX, rect.y - deltaY, rect.z + deltaX * 2, rect.w + deltaY * 2 )

end	


--
function UI:InflateRectInPlace( rect, deltaX, deltaY )	

	rect.x = rect.x - deltaX
	rect.y = rect.y - deltaY
	rect.z = rect.z + deltaX * 2
	rect.w = rect.w + deltaY * 2

end	


--
function UI:OffsetRect( rect, deltaX, deltaY )

	return UI:Quat( rect.x + deltaX, rect.y + deltaY, rect.z, rect.w )

end



--
function UI:CenterRect( rectToCenter, rectToCenterAgainst )

	return UI:Quat( rectToCenterAgainst.x + ( rectToCenterAgainst.z - rectToCenter.z ) * 0.5, rectToCenterAgainst.y + ( rectToCenterAgainst.w - rectToCenter.w ) * 0.5, rectToCenter.z, rectToCenter.w )

end


--
function UI:CenterRectX( rectToCenter, rectToCenterAgainst )

	return UI:Quat( rectToCenterAgainst.x + ( rectToCenterAgainst.z - rectToCenter.z ) * 0.5, rectToCenter.y, rectToCenter.z, rectToCenter.w )

end


--
function UI:CenterRectY( rectToCenter, rectToCenterAgainst )

	return UI:Quat( rectToCenter.x, rectToCenterAgainst.y + ( rectToCenterAgainst.w - rectToCenter.w ) * 0.5, rectToCenter.z, rectToCenter.w )

end


--
function UI:IsPtInRect( rect, x, y )

 	return x >= ( rect.x - 1e-3 ) and x < ( rect.x - 1e-3 ) + ( rect.z + 1e-3 ) and y >= ( rect.y - 1e-3 ) and y < ( rect.y - 1e-3 ) + ( rect.w + 1e-3 )

end


--
function UI:CombineRects( rect1, rect2 )

	local x_min = math.min( rect1.x, rect2.x )
	local y_min = math.min( rect1.y, rect2.y )
	local x_max = math.max( rect1.x + rect1.z, rect2.x + rect2.z )
	local y_max = math.max( rect1.y + rect1.w, rect2.y + rect2.w )

	return UI:Quat( x_min, y_min, x_max - x_min, y_max - y_min )

end


--
function UI:RectToRel( rect, bScaled, baseResolution )

	local relRect = UI:ZeroQuat()

	relRect.x = UI:XToRel( rect.x, bScaled, baseResolution )
	relRect.y = UI:YToRel( rect.y, bScaled, baseResolution )
	relRect.z = UI:XToRel( rect.z, bScaled, baseResolution )
	relRect.w = UI:YToRel( rect.w, bScaled, baseResolution )

	return relRect

end


--
function UI:PtToRel( pt, bScaled, baseResolution )

	return UI:Vec2( UI:XToRel( pt.x, bScaled, baseResolution ), UI:YToRel( pt.y, bScaled, baseResolution ) )

end


--
function UI:XToRel( x, bScaled, baseResolution )

	if bScaled == nil then
		bScaled = false
	end

	if bScaled then
        x = x * UI:GetUiScale( baseResolution )
	end

	x = x * self.abs2Rel_x

	return x

end


--
function UI:YToRel( y, bScaled, baseResolution )

	if bScaled == nil then
		bScaled = false
	end

	if bScaled then
    	y = y * UI:GetUiScale( baseResolution )
	end

	y = y * self.abs2Rel_y

	return y

end


--
function UI:RectToAbs( rect, bScaled, baseResolution )	

	local absRect = UI:ZeroQuat()

	absRect.x = UI:XToAbs( rect.x, bScaled, baseResolution )
	absRect.y = UI:YToAbs( rect.y, bScaled, baseResolution )
	absRect.z = UI:XToAbs( rect.z, bScaled, baseResolution )
	absRect.w = UI:YToAbs( rect.w, bScaled, baseResolution )

	return absRect

end


--
function UI:PtToAbs( pt, bScaled, baseResolution )

	return UI:Vec2( UI:XToAbs( pt.x, bScaled, baseResolution ), UI:YToAbs( pt.y, bScaled, baseResolution ) )

end


--
function UI:XToAbs( x, bScaled, baseResolution )

	x = x * self.rel2Abs_x

	if bScaled == nil then
		bScaled = false
	end

	if bScaled then
    	x = x / UI:GetUiScale( baseResolution )
	end

	return x

end


--
function UI:YToAbs( y, bScaled, baseResolution )

	y = y * self.rel2Abs_y

	if bScaled == nil then
		bScaled = false
	end

	if bScaled then
    	y = y / UI:GetUiScale( baseResolution )
	end

	return y

end


--
function UI:GetUiScale( baseResolution )

	if not baseResolution then
		baseResolution = { x = 1920, y = 1080 }
	end

	local baseScale = math.min( UI.screenWidth / baseResolution.x, UI.screenHeight / baseResolution.y )
	local scaleCf = baseScale < 1 and 1 or UI.uiScaleFactor 

	return UI:Lerp( 1, baseScale, scaleCf )

end


-- подсчитывает количество членов таблицы (с любыми индексами); линейная сложность
function UI:GetTableLength( t )
	
	local count = 0
	for id, val in pairs( t ) do
		if id ~= "__index" then
			count = count + 1
		end
	end

	return count

end


-- returns mm:ss.ss (с десятичной частью секунд)
function UI:Time2Str( time )

	local absTime = math.abs( time )

	local min = math.floor( absTime / 60 )
	local sec = absTime - min * 60

	local strSec = UI:LocalizeFloat( string.format( "%05.2f", sec ) )

	return string.format( "%s%d:%s", time < 0 and "-" or "", min, strSec )

end


-- returns hh::mm::ss
function UI:Time2Str2( time )

	local absTime = math.abs( time )
	
	local hours	= math.floor( absTime / 3600 )
	local min	= math.floor( ( absTime - hours * 3600 ) / 60 )
	local sec	= math.floor( absTime - hours * 3600 - min * 60 )

	return string.format( "%s%02d:%02d:%02d", time < 0 and "-" or "", hours, min, sec )

end


-- returns mm:ss
function UI:Time2Str3( time )

	local absTime = math.abs( time )

	local min = math.floor( absTime / 60 )
	local sec = math.floor( absTime - min * 60 )

	return string.format( "%s%02d:%02d", time < 0 and "-" or "", min, sec )

end


-- returns m:ss (минуты без ведущего нуля)
function UI:Time2Str31( time )

	local absTime = math.abs( time )

	local min = math.floor( absTime / 60 )
	local sec = math.floor( absTime - min * 60 )

	return string.format( "%s%d:%02d", time < 0 and "-" or "", min, sec )

end


-- returns [hh ч,] [mm мин,] ss сек
function UI:Time2Str4( time )

	local absTime = math.abs( time )
	
	local hours	= math.floor( absTime / 3600 )
	local min	= math.floor( ( absTime - hours * 3600 ) / 60 )
	local sec	= math.floor( absTime - hours * 3600 - min * 60 )

	local str = ""

	if hours > 0 then
		str = string.format( "%s%d %s ", str, hours, self.strHours )
	end

	if hours > 0 or min > 0 then
		str = string.format( "%s%d %s ", str, min, self.strMinutes )
	end

	str = string.format( "%s%d %s", str, sec, self.strSecs )

	return str

end


-- returns [dd дн] [hh ч] mm мин
function UI:Time2Str41( time )

	local absTime = math.abs( time )
	
	local days	= math.floor( absTime / (3600*24) )
	local hours	= math.floor( ( absTime - days * (3600*24) ) / 3600 )
	local min	= math.floor( ( absTime - days * (3600*24) - hours * 3600 ) / 60 )

	local str = ""

	if days > 0 then
		str = string.format( "%s%d %s ", str, days, self.strDays )
	end

	if days > 0 or hours > 0 then
		str = string.format( "%s%d %s ", str, hours, self.strHours )
	end

	str = string.format( "%s%d %s", str, min, self.strMinutes )

	return str

end


-- returns [mm мес][dd дн][hh ч][mm мин][ss сек] - пропускает нулевые промежутки времени (например: 1д 2мин)
function UI:Time2Str42( time )

	local absTime = math.abs( time )
	
	local months	= math.floor( absTime / self.monthSecs )
	local days		= math.floor( ( absTime - months * self.monthSecs ) / self.daySecs )
	local hours		= math.floor( ( absTime - months * self.monthSecs - days * self.daySecs ) / self.hourSec )	
	local minutes	= math.floor( ( absTime - months * self.monthSecs - days * self.daySecs - hours * self.hourSec ) / self.minuteSec )
	local secs		= math.floor( absTime - months * self.monthSecs - days * self.daySecs - hours * self.hourSec - minutes * self.minuteSec )

	local str = ""

	if months > 0 then
		str = string.format( "%s%d %s ", str, months, self.strMonths )
	end

	if days > 0 then
		str = string.format( "%s%d %s ", str, days, self.strDays )
	end

	if hours > 0 then
		str = string.format( "%s%d %s ", str, hours, self.strHours )
	end

	if minutes > 0 then
		str = string.format( "%s%d %s ", str, minutes, self.strMinutes )
	end

	if secs > 0 then
		str = string.format( "%s%d %s", str, secs, self.strSecs )
	end

	if str == "" then
		str = string.format( "0 %s", self.strSecs )
	end

	return str

end


-- returns [dd дн][hh ч][mm мин][ss сек] - пропускает нулевые промежутки времени (например: 1д 2мин)
function UI:Time2Str44( time )

	local absTime = math.abs( time )
	
	local days		= math.floor( ( absTime ) / self.daySecs )
	local hours		= math.floor( ( absTime - days * self.daySecs ) / self.hourSec )	
	local minutes	= math.floor( ( absTime - days * self.daySecs - hours * self.hourSec ) / self.minuteSec )
	local secs		= math.floor( absTime - days * self.daySecs - hours * self.hourSec - minutes * self.minuteSec )

	local str = ""

	if days > 0 then
		str = string.format( "%s%d %s ", str, days, self.strDays )
	end

	if hours > 0 then
		str = string.format( "%s%d %s ", str, hours, self.strHours )
	end

	if minutes > 0 then
		str = string.format( "%s%d %s ", str, minutes, self.strMinutes )
	end

	if secs > 0 then
		str = string.format( "%s%d %s", str, secs, self.strSecs )
	end

	if str == "" then
		str = string.format( "0 %s", self.strSecs )
	end

	return str

end


-- [mm месяцев][dd дней][hh часов][mm минут][ss секунд]	- пропускает нулевые промежутки времени, локализованные единицы склоняются (например: 1 день 2 минуты)
function UI:Time2Str421( time, postfix )

	if not postfix then
		postfix = ""
	end

	if postfix ~= "" then
		postfix = string.format( "_%s", postfix )
	end

	local absTime = math.abs( time )
	
	local months	= math.floor( absTime / self.monthSecs )
	local days		= math.floor( ( absTime - months * self.monthSecs ) / self.daySecs )
	local hours		= math.floor( ( absTime - months * self.monthSecs - days * self.daySecs ) / self.hourSec )	
	local minutes	= math.floor( ( absTime - months * self.monthSecs - days * self.daySecs - hours * self.hourSec ) / self.minuteSec )
	local secs		= math.floor( absTime - months * self.monthSecs - days * self.daySecs - hours * self.hourSec - minutes * self.minuteSec )

	local str = ""

	if months > 0 then
		local strMonths = UI:SubstituteValLocalizedByStringId( string.format( "months_full%s", postfix ), months, "month", nil )
		str = string.format( "%s%s ", str, strMonths )
	end

	if days > 0 then
		local strDays = UI:SubstituteValLocalizedByStringId( string.format( "days_full%s", postfix ), days, "day", nil ) 
		str = string.format( "%s%s ", str, strDays )
	end

	if hours > 0 then
		local strHours = UI:SubstituteValLocalizedByStringId( string.format( "hours_full%s", postfix ), hours, "hour", nil )
		str = string.format( "%s%s ", str, strHours )
	end

	if minutes > 0 then
		local strMinutes = UI:SubstituteValLocalizedByStringId( string.format( "minutes_full%s", postfix ), minutes, "minute", nil )
		str = string.format( "%s%s ", str, strMinutes )
	end

	if secs > 0 or str == "" then
		local strSecs = UI:SubstituteValLocalizedByStringId( string.format( "seconds_full%s", postfix ), secs, "second", nil ) 
		str = string.format( "%s%s ", str, strSecs )
	end

	return str

end



-- returns [dd дн] [hh ч] [mm мин] sec сек - НЕ пропускае нулевые промежутки времени (например: 1д 0ч 2мин)
function UI:Time2Str43( time )

	local absTime = math.abs( time )

	local days		= math.floor( absTime / self.daySecs )
	local hours		= math.floor( ( absTime - days * self.daySecs ) / self.hourSec )		
	local minutes	= math.floor( ( absTime - days * self.daySecs - hours * self.hourSec ) / self.minuteSec )		
	local secs		= math.floor( absTime - days * self.daySecs - hours * self.hourSec - minutes * self.minuteSec )

	local str = ""

	if days > 0 then
		str = string.format( "%s%d %s ", str, days, self.strDays )
	end

	if days > 0 or hours > 0 then
		str = string.format( "%s%d %s ", str, hours, self.strHours )
	end

	if days > 0 or hours > 0 or minutes > 0 then
		str = string.format( "%s%d %s ", str, minutes, self.strMinutes )
	end

	str = string.format( "%s%d %s", str, secs, self.strSecs )

	return str

end


-- returns [dd дн] [hh ч] [mm мин] [sec сек] - возвращает 2а старших значения
function UI:Time2Str45( time )

	local absTime = math.abs( time )
	
	local days	= math.floor( absTime / ( 3600 * 24 ) )
	local hours	= math.floor( ( absTime - days * 24 * 3600 )  / 3600 )
	local minutes	= math.floor( ( absTime - days * 24 * 3600 - hours * 3600 ) / 60 )
	local secs	= math.floor( absTime - days * 3600 * 24 - hours * 3600 - minutes * 60 )

	local str = ""

	if days > 0 then
		return string.format( "%d%s %d%s", days, self.strDays, hours, self.strHours )
	end

	if hours > 0 then
		return string.format( "%d%s %d%s", hours, self.strHours, minutes, self.strMinutes )
	end

	if minutes > 0 then
		return string.format( "%d%s %d%s", minutes, self.strMinutes, secs, self.strSecs )
	end

	return string.format( "%d%s", secs, self.strSecs )

end


-- returns s.ss (секунды с десятичной частью с точностью до сотых)
function UI:Time2Str5( time )

	local sec = math.abs( time )
	local strSec = UI:LocalizeFloat( string.format( "%.2f", sec ) )
	return string.format( "%s%s", sec < 0 and "-" or "", strSec )

end  


-- returns s.s (секунды с десятичной частью с точностью до десятых)
function UI:Time2Str51( time )

	local sec = math.abs( time )
	local strSec = UI:LocalizeFloat( string.format( "%.1f", sec ) )
	return string.format( "%s%s", sec < 0 and "-" or "", strSec )

end  


-- dd дн | hh ч | mm мин | ss сек	(возвращает только что-то одно - самое большое)
function UI:Time2Str6( time )

	local absTime = math.abs( time )	

	local days = math.floor( absTime / self.daySecs )
	if days > 0 then
		return string.format( "%d %s", days, self.strDays )
	end

	local hours = math.floor( absTime / self.hourSec )	
	if hours > 0 then
		return string.format( "%d %s", hours, self.strHours )
	end

	local minutes = math.floor( absTime / self.minuteSec )	
	if minutes > 0 then
		return string.format( "%d %s", minutes, self.strMinutes )
	end

	return string.format( "%d %s", time, self.strSecs )

end


-- dd дней | hh часов | mm минут | ss секунд	(возвращает только что-то одно - самое большое, локализованные единицы склоняются)
function UI:Time2Str61( time, postfix )

	if not postfix then
		postfix = ""
	end

	if postfix ~= "" then
		postfix = string.format( "_%s", postfix )
	end

	local absTime = math.abs( time )	

	local days = math.floor( absTime / self.daySecs )
	if days > 0 then
		return UI:SubstituteValLocalizedByStringId( string.format( "days_full%s", postfix ), days, "day", nil )
	end

	local hours = math.floor( absTime / self.hourSec )	
	if hours > 0 then
		return UI:SubstituteValLocalizedByStringId( string.format( "hours_full%s", postfix ), hours, "hour", nil )
	end

	local minutes = math.floor( absTime / self.minuteSec )	
	if minutes > 0 then
		return UI:SubstituteValLocalizedByStringId( string.format( "minutes_full%s", postfix ), minutes, "minute", nil )
	end

	local seconds = UI:Round( time )
	return UI:SubstituteValLocalizedByStringId( string.format( "seconds_full%s", postfix ), seconds, "second", nil )

end


-- dd дней | hh часов | mm минут | ss секунд	(возвращает два значения - самое большое и следующее за ним, локализованные единицы склоняются)
function UI:Time2Str62( time, postfix )

	if not postfix then
		postfix = ""
	end

	if postfix ~= "" then
		postfix = string.format( "_%s", postfix )
	end

	local absTime = math.abs( time )	

	local days = math.floor( absTime / self.daySecs )
	if days > 0 then
		local hours = math.floor( absTime / self.hourSec ) - days * 24
		return UI:SubstituteValLocalizedByStringId( string.format( "days_full%s", postfix ), days, "day", nil ).." "..UI:SubstituteValLocalizedByStringId( string.format( "hours_full%s", postfix ), hours, "hour", nil )
	end

	local hours = math.floor( absTime / self.hourSec )	
	if hours > 0 then
		local minutes = math.floor( absTime / self.minuteSec ) - hours * 60
		return UI:SubstituteValLocalizedByStringId( string.format( "hours_full%s", postfix ), hours, "hour", nil ).." "..UI:SubstituteValLocalizedByStringId( string.format( "minutes_full%s", postfix ), minutes, "minute", nil )
	end

	local minutes = math.floor( absTime / self.minuteSec )
	if minutes > 0 then
		local seconds = UI:Round( time ) - minutes * 60
		return UI:SubstituteValLocalizedByStringId( string.format( "minutes_full%s", postfix ), minutes, "minute", nil ).." "..UI:SubstituteValLocalizedByStringId( string.format( "seconds_full%s", postfix ), seconds, "second", nil )
	end

	local seconds = UI:Round( time )
	return UI:SubstituteValLocalizedByStringId( string.format( "seconds_full%s", postfix ), seconds, "second", nil )

end


-- mm мин | ss сек	(возвращает только что-то одно - самое большое, но не больше минут)
function UI:Time2Str63( time )

	local absTime = math.abs( time )

	local minutes = math.floor( absTime / self.minuteSec )	
	if minutes > 0 then
		return string.format( "%d %s", minutes, self.strMinutes )
	end

	return string.format( "%d %s", time, self.strSecs )

end


-- returns hh::mm
function UI:Time2Str7( time )

	local absTime = math.abs( time )
	
	local hours	= math.floor( absTime / 3600 )
	local min	= math.floor( ( absTime - hours * 3600 ) / 60 )

	return string.format( "%s%02d:%02d", time < 0 and "-" or "", hours, min )

end 


-- returns dd:hh::mm::ss
function UI:Time2Str8( time )

	local absTime = math.abs( time )
	
	local days	= math.floor( absTime / ( 3600 * 24 ) )
	local hours	= math.floor( ( absTime - days * 24 * 3600 )  / 3600 )
	local min	= math.floor( ( absTime - days * 24 * 3600 - hours * 3600 ) / 60 )
	local sec	= math.floor( absTime - days * 3600 * 24 - hours * 3600 - min * 60 )

	if days > 0 then
		return string.format( "%s%02d:%02d", time < 0 and "-" or "", days, hours, min )
	else
		return string.format( "%s%02d:%02d:%02d", time < 0 and "-" or "", hours, min, sec )
	end

end


-- return ex: Jun 29 1012, 20h 53m 14s (datetime format may be localized )
function UI:DateTime2FullDateTime( dateTime )

	local format = UI:GetStringByName( "datetime_format" )
	local month = UI:GetStringByName( "datetime_month_"..tostring( dateTime.month ) )
	local str = string.gsub( format, "%$month%$", tostring( month ) )
	str = string.gsub( str, "%$year%$", tostring( dateTime.year ) )
	str = string.gsub( str, "%$day%$", string.format( "%02d", dateTime.day ) )
	str = string.gsub( str, "%$hour%$", string.format( "%02d", dateTime.hour ) )
	str = string.gsub( str, "%$minute%$", string.format( "%02d", dateTime.minute ) )
	str = string.gsub( str, "%$second%$", string.format( "%02d", dateTime.second ) )
	return str

end


-- return ex: 07 29 1012
function UI:DateTime2Date( dateTime )

	local format = UI:GetStringByName( "date_format_numbers" )
	local str = string.gsub( format, "%$month%$", string.format( "%02d", dateTime.month ) )
	str = string.gsub( str, "%$year%$", string.format( "%02d", dateTime.year ) )
	str = string.gsub( str, "%$day%$", string.format( "%02d", dateTime.day ) )
	return str

end

--
function UI:DateTime2Time( dateTime )
	return ( dateTime.l + dateTime.h * ( 2 ^ 32 ) ) / 1000
end


--
function UI:DateTime2Str( dateTime )

	return string.format( "%02d.%02d.%04d %02d:%02d:%02d", dateTime.day, dateTime.month, dateTime.year, dateTime.hour, dateTime.minute, dateTime.second )

end


-- абсолютное -> в относительное, заснэпленное к пикселу
function UI:XAbs2SnappedRel( x )

	return UI:XToRel( UI:Round( x ) )

end


-- абсолютное -> в относительное, заснэпленное к пикселу
function UI:YAbs2SnappedRel( y )

	return UI:YToRel( UI:Round( y ) )

end


-- относительное -> в относительное, заснэпленное к пикселу
function UI:XRel2Snapped( x )

	return UI:XToRel( UI:Round( UI:XToAbs( x ) ) )

end


-- относительное -> в относительное, заснэпленное к пикселу
function UI:YRel2Snapped( y )

	return UI:YToRel( UI:Round( UI:YToAbs( y ) ) )

end


--[[
	Представляет число в виде массива одноразрядных чисел.
	Возвращаемый массив содержит числа в обратном порядке (от младших разрядов исходного числа к старшим).
	Например, результатом разбиения числа  321 будет: {1,2,3}.
	Знак исходного числа игнорируется. Дробная часть числа после запятой игнорируется.
]]
function UI:SplitNumberIntoDigits( val )

	local digits = {}
    local v = math.floor( math.abs( val ) )

    repeat
    	local d = math.fmod( v, 10 )
    	v = ( v - d ) / 10
    	table.insert( digits, d )
	until v == 0

	return digits

end


--[[
-- многоугольник должен быть выпуклым
function UI:IsPointInsidePoligon( pt, verts )

	local numVerts = #verts
	local count = 0

	for i = 0, numVerts - 1 do
		local j = math.fmod( i + 1, numVerts )
		local curVert = verts[ i + 1 ]
		local nextVert = verts[ j + 1 ]

		if	curVert.y ~= nextVert.y and 
			not( curVert.y > pt.y and nextVert.y > pt.y ) and
			not( curVert.y < pt.y and nextVert.y < pt.y ) then

			if math.max( curVert.y, nextVert.y ) == pt.y then
				count = count + 1
			elseif not ( math.min( curVert.y, nextVert.y ) == pt.y ) then
				local t = ( pt.y - curVert.y ) / ( nextVert.y - curVert.y )
				local xx = UI:Lerp( curVert.x, nextVert.x, t )
				if UI:Lerp( curVert.x, nextVert.x, t ) >= pt.x then
					count = count + 1
				end
			end
		
		end
	end

	return math.fmod( count, 2 ) ~= 0

end]]


-- еще одна версия
-- многоугольник должен быть выпуклым
function UI:IsPointInsidePoligon( pt, verts )

	local numVerts = #verts
	
	if numVerts < 3 then
		sys.log( "UI:IsPointInsidePoligon()[ERROR]: invalid verts number, must be >=3" )
		return false
	end
	
	local isPrevProductNegative = nil

	for vertIdx, vert in ipairs( verts ) do
		
		local nextVertIdx = math.fmod( vertIdx + 1 - 1, numVerts ) + 1
		local nextVert = verts[ nextVertIdx ]
		
		local product = ( nextVert.x - vert.x ) * ( pt.y - vert.y ) - ( nextVert.y - vert.y ) * ( pt.x - vert.x )
		
		if product ~= 0 then
		
			local isNegative = product < 0
			
			if isPrevProductNegative ~= nil and isNegative ~= isPrevProductNegative then
				return false
			end
		
			isPrevProductNegative = isNegative
			
		end
	
	end
	
	return true

end


--
function UI:Color2Str( color )

	return string.format( "@%08x", color )

end


--
function UI:InscribeImageInRect( hTex, rect, bHorizontal, bVertical )

	if not bHorizontal and not bVertical then
		sys.out( "UI:InscribeImageInRect()[ERROR]: 'bHorizontal' and 'bVertical' parameters cannot both be false" )
		return UI:ZeroQuat()
	end

	local rc = UI:GetResourceByHandle( hTex )

	if not rc then
		return self:ZeroQuat()
	end

	local texW = rc:GetTextureWidth()
	local texH = rc:GetTextureHeight()

	local u0 = rc:GetU0()
	local v0 = rc:GetV0()
	local u1 = rc:GetU1()
	local v1 = rc:GetV1()

	local imageW = texW * ( u1 - u0 )
	local imageH = texH * ( v1 - v0 )

	return self:InscribeRect( UI:PtToRel( UI:Vec2( imageW, imageH ) ), rect, bHorizontal, bVertical ) 

end


-- вписать одну прямоугольную область в другую
-- sizeToInscribe - размер прямоугольника, который нужно вписать
-- maxRect - прямоугльник, куда нужно вписать
-- bHorizontal, bVertical - можно только по горизонтали или вертикали, или по обоим осям

function UI:InscribeRect( sizeToInscribe, maxRect, bHorizontal, bVertical )

	local outRect = UI:QuatCopy( maxRect )

    local fnTryInscribe = function( bHorizontal, bClip )

    	local bFullFit = true

    	if bHorizontal then
    	   	outRect.w = sizeToInscribe.y * outRect.z / sizeToInscribe.x
    		if outRect.w > maxRect.w then
    			bFullFit = false
    			if bClip then
    				outRect.w = maxRect.w
    				outRect.y = maxRect.y
    				return bFullFit
    			end
    		end
    	   	outRect.y = maxRect.y + ( maxRect.w - outRect.w ) * 0.5
    	else
    		outRect.z = sizeToInscribe.x * outRect.w / sizeToInscribe.y
    		if outRect.z > maxRect.z then
    			bFullFit = false
    			if bClip then
    				outRect.z = maxRect.z
    				outRect.x = maxRect.x
    				return bFullFit
    			end
    		end
    		outRect.x = maxRect.x + ( maxRect.z - outRect.z ) * 0.5
    	end

    	return bFullFit

    end


	if bHorizontal and not bVertical then
    	fnTryInscribe( true, false )		

	elseif not bHorizontal and bVertical then
    	fnTryInscribe( false, false )

	else	
    	if sizeToInscribe.x > sizeToInscribe.y then
    		if not fnTryInscribe( true, true ) then
    			fnTryInscribe( false, true )
    		end
    	else
    		if not fnTryInscribe( false, true ) then
    			fnTryInscribe( true, true )
    		end
    	end	
	end

	return outRect		

end


--
function UI:GetFileNameFromPath( path, bWithExtention )

   	local rpath = string.reverse( path )
   	local idx = string.find( rpath, "[%\\%/]")
   	local rname = idx and string.sub( rpath, 1, idx - 1 ) or rpath

	if not bWithExtention then
		idx = string.find( rname, "[%.]" )
		rname = idx and string.sub( rname, idx + 1 ) or rname
	end

	return string.reverse( rname )

end 


--
function UI:GetDirFromPath( path )

   	local rpath = string.reverse( path )
   	local idx = string.find( rpath, "[%\\%/]")
   	local rdir = idx and string.sub( rpath, idx + 1, -1 ) or ""

	return string.reverse( rdir )

end


-- returns dir, file name, extention; f.e.: "aa/bb/file.sanim" -> "aa/bb", "file", "sanim"

function UI:DecompositePath( path )

	local rpath = string.reverse( path )

   	local slashIdx	= string.find( rpath, "[%\\%/]")
	local dotIdx	= string.find( rpath, "[%.]" )

	local rdir	= slashIdx and string.sub( rpath, slashIdx + 1, -1 ) or ""
   	local rfile	= slashIdx and string.sub( rpath, ( dotIdx and dotIdx + 1 or 1 ), slashIdx - 1 ) or string.sub( rpath, ( dotIdx and dotIdx + 1 or 1 ), -1 )
	local rext	= dotIdx and string.sub( rpath, 1, dotIdx - 1 ) or ""

	return string.reverse( rdir ), string.reverse( rfile ), string.reverse( rext )

end


--
function UI:Key2InputSpecific( key, dstInputType )

	local keyInputType = UI:GetInputTypeByKey( key, true )
	if keyInputType == dstInputType or keyInputType == -1 then
		return key
	end

	local vKey = UI.key2VKey[ key ]

	local candidateKeys = {}
	for k, vk in pairs( UI.key2VKey ) do
		if vk == vKey then
			table.insert( candidateKeys, k )
		end
	end 

	for idx, k in pairs( candidateKeys ) do

		if dstInputType == self.inputTypes.KB then
			if k < UI.Keys.KEY_XINPUT_BEGIN_KEYS then
				return k
			end

		elseif dstInputType == self.inputTypes.XINPUT then
    		if k >= UI.Keys.KEY_XINPUT_BEGIN_KEYS and k <= UI.Keys.KEY_XINPUT_END_KEYS then
    			return k
    		end

		elseif dstInputType == self.inputTypes.PS3 then
    		if k >= UI.Keys.KEY_CELL_BEGIN_KEYS and k <= UI.Keys.KEY_CELL_END_KEYS then
				if _G.IsEnterCancelButtonSwaped() then	
					k = UI:SwapPS3Key( k )
				end
    			return k
    		end

		elseif dstInputType == self.inputTypes.JOY then
    		if k >= UI.Keys.KEY_JOY_BEGIN_KEYS and k <= UI.Keys.KEY_JOY_END_KEYS then
    			return k
    		end

		elseif dstInputType == self.inputTypes.MOVE then
    		if k >= UI.Keys.KEY_MOVE_BEGIN_KEYS and k <= UI.Keys.KEY_MOVE_END_KEYS then
    			return k
    		end
		end 
	end

--	sys.log( "UI:Key2InputSpecific()[ERROR]: cannot convert key \"%d\" to input type \"%d\"", key, dstInputType )
	return key

end


--
function UI:GetInputTypeByKey( key, bExtended )

	if bExtended == nil then
		bExtended = true
	end

	if key >= UI.Keys.KEY_XINPUT_BEGIN_KEYS and key <= UI.Keys.KEY_XINPUT_END_KEYS then
		return self.inputTypes.XINPUT

	elseif key >= UI.Keys.KEY_CELL_BEGIN_KEYS and key <= UI.Keys.KEY_CELL_END_KEYS then
		return self.inputTypes.PS3

	elseif key >= UI.Keys.KEY_JOY_BEGIN_KEYS and key <= UI.Keys.KEY_JOY_END_KEYS then
		return bExtended and self.inputTypes.JOY or self.inputTypes.KB

	elseif key >= UI.Keys.KEY_MOVE_BEGIN_KEYS and key <= UI.Keys.KEY_MOVE_END_KEYS then
		return bExtended and self.inputTypes.MOVE or self.inputTypes.PS3

	elseif key < UI.Keys.KEY_XINPUT_BEGIN_KEYS then
		return self.inputTypes.KB

	else
		return -1
	end

end


--
function UI:GetGamepadTypeByKey( key )

	local inputType = self:GetInputTypeByKey( key, true )

	if inputType == self.inputTypes.XINPUT then
		return UI.GAMEPAD_TYPE_XINPUT

	elseif inputType == self.inputTypes.PS3 then
		return UI.GAMEPAD_TYPE_PS3

	elseif inputType == self.inputTypes.JOY then
		return UI.GAMEPAD_TYPE_OTHER

	elseif inputType == self.inputTypes.MOVE then
		return UI.GAMEPAD_TYPE_MOVE

	else
		return -1
	end

end


--
function UI:KeyId2Str( key )

	local ignoredKeys =
	{
        KEY_XINPUT_BEGIN_KEYS = true,
        KEY_XINPUT_END_KEYS	= true,
        KEY_CELL_BEGIN_KEYS	= true,
        KEY_CELL_END_KEYS	= true,
        KEY_MOVE_BEGIN_KEYS	= true,
        KEY_MOVE_END_KEYS	= true,
        KEY_JOY_BEGIN_KEYS	= true,
        KEY_JOY_END_KEYS	= true,
        EX_START			= true,
        EX_END				= true,
		EX_XINPUT_START		= true,
		EX_XINPUT_START_0	= true,
		EX_XINPUT_END_0		= true,
		EX_XINPUT_START_1	= true,
		EX_XINPUT_END_1		= true,
		EX_XINPUT_END		= true,
		EX_PS3_START		= true,
		EX_PS3_START_0		= true,
		EX_PS3_END_0		= true,
		EX_PS3_START_1		= true,
		EX_PS3_END_1		= true,
		EX_PS3_END			= true,
	}

	for k, v in pairs( UI.Keys ) do
	    if v == key and not ignoredKeys[ k ] then
			return k
		end
	end	

	return ""

end  


--
function UI:Val2Key( t, val )

	for k, v in pairs( t ) do
	    if v == val then
			return k
		end
	end	

	return ""

end


--
function UI:ValidateWindowEffectPos( wnd, eff )    

	if not wnd or not eff then
		return
	end

	local rect = wnd:GetRect()
	local parent = wnd:GetParent()
	if parent then
		rect = parent:ToScreen( rect )
	end

	local wndOrg = UI:Vec2( rect.x, rect.y )

	if type( eff ) == "table" then

		local effect = eff[ 1 ]
		if effect then

			effect:SetPos( wndOrg )

			if eff.forceAnimation and not effect:IsAnimationPlaying() then
				effect:StartAnimation( eff.forceAnimation )
				effect:StopAnimation()
			end

			L_ValidateEffectHierarchyPos( wnd, eff )
		end

	else		
		eff:SetPos( wndOrg )
	end

end


--
function UI:CreateChildWnd( tParent, tProto, namePostfix )

	return UI:CreateWnd( tParent:GetScriptTableName(), tProto, namePostfix )

end


--
function UI:CreateWnd( parentTableName, tProto, namePostfix )

	local tParent = UI:GetValByName( parentTableName )
	if type( tParent ) ~= "table" then
		sys.log( "UI:CreateWnd()[ERROR]: \"%s\" is not a table", parentTableName )
		return
	end

	local wChild = UI:GetUiObjByHandle( UI:CreateUiObj( tProto:GetClassName() ) )

  	local name = string.format( "%s%s", tProto:GetName(), namePostfix and namePostfix ~= "" and "_"..namePostfix or "" )
  	wChild:SetName( name )

  	local tChild = { def = { prototype = tProto:GetName() } }
  	tParent[ name ] = tChild
  	wChild:SetScriptTable( string.format( "%s.%s", parentTableName, name ) )

  	wChild:InitFromPrototype( tProto.w )
	tChild:F_PostLoad()

	return tChild

end


--
function UI:CreateWndFromTable( tableName )

	local wnd = UI:GetUiObjByHandleT( UI:CreateUiObjFromScript( tableName ) )

	if wnd then
		if wnd.F_PostLoad then
			wnd:F_PostLoad()
		else
			wnd:PostLoad()
		end
	end

	return wnd

end


--
function UI:GetEffectFromLayer( wnd, layer )

	local pool = wnd:GetEffectsPool( layer )
	if pool and pool:GetNumEffects() > 0 then
		return pool:GetEffectById( 0 )
	end

	return nil

end


-- 
function UI:AddChildAndLink( parentWnd, childWnd, parentEffect, parentEffectObj, animParams )

	if not parentWnd or not childWnd then
		return
	end

	local oldParent = childWnd:GetParent()
	if oldParent and oldParent ~= parentWnd then
		sys.log( "UI:AddChildAndLink()[ERROR]: window \"%s\" cannot link to parent \"%s\"; it already has another parent \"%s\"", childWnd:GetScriptTableName(), parentWnd:GetScriptTableName(), oldParent:GetScriptTableName() )
		return
	end

	parentWnd:AddChild( childWnd )

	if parentEffect then
		parentEffect:LinkWnd( childWnd:GetUiHandle(), parentEffectObj, animParams )
	end

end


--
function UI:AngleNormalize360( angle )

 	if angle >= 360 or angle < 0 then 	
 		angle = angle - math.floor( angle / 360 ) * 360
 	end

 	return angle

end


--
function UI:AngleNormalize180( angle )

	if angle < -180 or angle < 180 then
		angle = angle - math.floor( angle / 180 ) * 180
	end

	return angle

end


--
function UI:AngleNormalizePI2( angle )

	local PI2 = math.pi * 2

	if angle >= PI2 or angle < 0 then	
		angle = angle - math.floor( angle / PI2 ) * PI2
	end

	return angle

end


--
function UI:AngleNormalizePI( angle )

	if angle < -math.pi or angle > math.pi then
		angle = angle - math.floor( angle / math.pi ) * math.pi
	end

	return angle

end	


--
function UI:IsWndKindOf( wnd, prototypeName )

	if type( wnd ) ~= "table" or type( wnd.w ) ~= "userdata" or type( prototypeName ) ~= "string" then
		sys.log( "UI:IsWndKindOf()[ERROR]: invalid params" )
		return false
	end

	if wnd:IsPrototype() and wnd:GetName() == prototypeName then
		return true
	end

	local proto = UI:GetPrototypeWndHacked( wnd )
	while proto do
		if proto:GetName() == prototypeName then
			return true
		end

		proto = UI:GetPrototypeWndHacked( proto )
	end

	return false

end


--
function UI:HasWndAncestorKindOf( wnd, ancestorPrototypeName )

	return UI:GetAncestorKindOf( wnd, ancestorPrototypeName ) ~= nil

end


--
function UI:GetAncestorKindOf( wnd, ancestorPrototypeName )

	if type( wnd ) ~= "table" or type( wnd.w ) ~= "userdata" or type( ancestorPrototypeName ) ~= "string" then
		sys.log( "UI:GetAncestorKindOf()[ERROR]: invalid params" )
		return nil
	end

	local parent = wnd:GetParent()
	while parent do

		if UI:IsWndKindOf( parent, ancestorPrototypeName ) then
			return parent
		end

		parent = parent:GetParent()

	end

	return nil

end


-- TODO: вместо wnd:GetPrototypeWnd(), чтобы не ругалось в лог, если прототип есть, но в ресурсы не занесен (напрмер, у thumb скрооблара и др.)
function UI:GetPrototypeWndHacked( wnd )
	
	local proto = nol

	local protoName = wnd:GetPrototypeName()

	local hRc = UI:GetResourceHandleByName( protoName, UI.RES_PROTOTYPE, true )
	if hRc ~= UI.INVALID_RESOURCE_HANDLE then

		local rc = UI:GetResourceByHandle( hRc )
		local hProto = rc:GetObjHandle()

		proto = UI:GetUiObjByHandleT( hProto )

		UI:ReleaseResourceHandle( hRc )

	end

	return proto

end


-- различает конструкции типа $s%X$ (число со знаком) и $u%X$ (число без знака), где X - число;
-- после после отбрасывания знака число форматируется стандартным способом cpp

function UI:FormatText( text, ... )

	local params = {...}
	local paramIdx = 1

	local fnFormat = function( capture1, capture2 )
		
		if capture1 == "s" or capture1 == "u" then

			local param = params[ paramIdx ]

			if type( param ) == "number" then
				if capture1 == "u" then
					params[ paramIdx ] = math.abs( param )
				end
			else
				sys.log( "UI:CustomFormatText()[ERROR]: parameter with index %d is not a number, so cannot be formatted with formatter \"%s\"", paramIdx, capture1 )
			end			


		elseif capture1 ~= "" then

			sys.log( "UI:CustomFormatText()[ERROR]: unhandled formatter: \"%s\"", capture1 )

		end

		paramIdx = paramIdx + 1
		return capture2

	end   

	text = string.gsub( text, "%$([su]?)(%%.+)%$", fnFormat )
	text = string.format( text, unpack( params ) )

	return text

end


--
function UI:GetFontPattern( baseName )

	if cvars.r_width <= 1024 and not _G.IsPC() then

		if self.lowResFonts[ baseName ] then
			baseName = self.lowResFonts[ baseName ]
		end
	end

	return baseName

end


-- вызывается из *.cpp кода ui эффектов
function UI:GetFontByPatternName( patterName )

	local patterName = self:GetFontPattern( patterName )
	local hFont = ObtainFont( patterName or "" )

	if hFont == FONT.INVALID_FONT_HANDLE then
		sys.out( "UI:GetFontByPatternName()[ERROR]: cannot find font pattern with name \"%s\"", tostring( patterName ) )
	end

	return hFont

end


--
function UI:A2WCharId( aText, aCharId )

	local wCharId = 0

	for i = 1, aCharId do

		local code = string.byte( aText, i )
		if code < 128 or code >= 192 then
			wCharId = wCharId + 1
		end

	end

	return wCharId

end


--
function UI:BitTst( o, p )

	local n = bit.lshift( 1, p )
	return bit.band( o, n ) == n

end


--
function UI:BitSet( o, p )

	return bit.bor( o, bit.lshift( 1, p ) )

end


--
function UI:BitRst( o, p )

	return bit.band( o, bit.bnot( bit.lshift( 1, p ) ) )

end


--
function UI:BitTgl( o, p )

	return bit.bxor( o, bit.lshift( 1, p ) )

end


--
function UI:Bit( n )

	return bit.lshift( 1, n )

end


--
function UI:BitTstU64( o, p )

	if p < 32 then
		return UI:BitTst( o.l, p )
	else
		return UI:BitTst( o.h, p - 32 )
	end

end


-- in place
function UI:BitSetU64( o, p )

	if p < 32 then
		o.l = UI:BitSet( o.l, p )
	else
		o.h = UI:BitSet( o.h, p - 32 )
	end
	
	return o

end


-- in place
function UI:BitRstU64( o, p )

	if p < 32 then
		o.l = UI:BitRst( o.l, p )
	else
		o.h = UI:BitRst( o.h, p - 32 )
	end
	
	return o

end


-- in place
function UI:BitTglU64( o, p )

	if p < 32 then
		o.l = UI:BitTgl( o.l, p )
	else
		o.h = UI:BitTgl( o.h, p - 32 )
	end
	
	return o

end


--
function UI:BitU64( n )

	local val = u64( 0, 0 ) 

	if n < 32 then
		val.l = UI:Bit( n )
	else
		val.h = UI:Bit( n - 32 )
	end

	return val

end


--
function UI:BitBorU64( val1, val2 )

	local h = bit.bor( val1.h, val2.h )
	local l = bit.bor( val1.l, val2.l )
	return u64( h, l )

end


-- число в строку с разбиением на группы по три разряда (разделенные пробелами); конвертится в int
function UI:Num2StrSeparatedBy3( num )

	if type( num ) ~= "number" then
		sys.log( "UI:Num2StrSeparatedBy3()[ERROR]: invalid type of the 1-st parameter (\"num\"); \"number\" expected, got \"%s\"", type( num ) )
		return "error"
	end

	local MAX = 999999999999

	local bNegative = num < 0

	if bNegative then
		num = -num
	end

	num = math.floor( num )
	if num > MAX then
		num = MAX
	end

	local str = tostring( num )
	str = string.reverse( str )
	str = string.gsub( str, "(%d%d%d)", "%1"..self.strNonBreakableSpace_reverse )
	str = string.gsub( str, self.strNonBreakableSpace_reverse.."$", "" )

	str = string.reverse( str )

	if bNegative then
		str = string.format( "-%s", str )
	end

	return str

end


-- число в строку с разбиением на группы по три разряда (разделенные пробелами); допускается float
function UI:FNum2StrSeparatedBy3( num )

	if type( num ) ~= "number" then
		sys.log( "UI:FNum2StrSeparatedBy3()[ERROR]: invalid type of the 1-st parameter (\"num\"); \"number\" expected, got \"%s\"", type( num ) )
		return "error"
	end

	local intPart, fractPart = math.modf( num )
	fractPart = UI:Round( fractPart * 100 ) / 100

	local strIntPart = UI:Num2StrSeparatedBy3( intPart )

	if fractPart == 0 then
		return strIntPart
	else
		local strFractPart = tostring( fractPart )
		strFractPart = string.gsub( strFractPart, "^(.+%.)(.+)$", "%2" )
		
		local str = string.format( "%s.%s", strIntPart, strFractPart )
		return UI:LocalizeFloat( str )
	end

end


-- число в строку с разбиением на группы по три разряда (разделенные пробелами); конвертится в строку
function UI:U642StrSeparatedBy3( num )

	local str = ""

	str = _G.U64ToStr( num )

	str = string.reverse( str )
	str = string.gsub( str, "(%d%d%d)", "%1"..self.strNonBreakableSpace_reverse )
	str = string.gsub( str, self.strNonBreakableSpace_reverse.."$", "" )

	str = string.reverse( str )

	if bNegative then
		str = string.format( "-%s", str )
	end

	return str

end


-- число в строку с разбиением на группы по три разряда (разделенные пробелами); конвертится в строку
function UI:I642StrSeparatedBy3( num )

	local str = ""

	str = _G.I64ToStr( num )

	str = string.reverse( str )
	str = string.gsub( str, "(%d%d%d)", "%1"..self.strNonBreakableSpace_reverse )
	str = string.gsub( str, self.strNonBreakableSpace_reverse.."$", "" )

	str = string.reverse( str )

	if bNegative then
		str = string.format( "-%s", str )
	end

	return str

end


--
function UI:IsKeyFromGamepad( key )

	return
		key >= UI.Keys.KEY_XINPUT_BEGIN_KEYS and key <= UI.Keys.KEY_XINPUT_END_KEYS or
		key >= UI.Keys.EX_XINPUT_START and key <= UI.Keys.EX_XINPUT_END or
		key >= UI.Keys.KEY_CELL_BEGIN_KEYS and key <= UI.Keys.KEY_CELL_END_KEYS or
		key >= UI.Keys.EX_PS3_START and key <= UI.Keys.EX_PS3_END

end


local l_numpadKeys =
{
    [ UI.Keys.KEY_NUMPAD0 ]		= true,
    [ UI.Keys.KEY_NUMPAD1 ]		= true,
    [ UI.Keys.KEY_NUMPAD2 ]		= true,
    [ UI.Keys.KEY_NUMPAD3 ]		= true,
    [ UI.Keys.KEY_NUMPAD4 ]		= true,
    [ UI.Keys.KEY_NUMPAD5 ]		= true,
    [ UI.Keys.KEY_NUMPAD6 ]		= true,
    [ UI.Keys.KEY_NUMPAD7 ]		= true,
    [ UI.Keys.KEY_NUMPAD8 ]		= true,
    [ UI.Keys.KEY_NUMPAD9 ]		= true,
    [ UI.Keys.KEY_MULTIPLY ]	= true,
    [ UI.Keys.KEY_ADD ]			= true,
    [ UI.Keys.KEY_SUBTRACT ]	= true,
    [ UI.Keys.KEY_DECIMAL ]		= true,
    [ UI.Keys.KEY_DIVIDE ]		= true,
}

--
function UI:IsKeyFromNumpadKb( key )

	-- ВНИМАНИЕ! Нельзя проверить key >= UI.Keys.KEY_NUMPAD0 and key <= UI.Keys.KEY_DIVIDE,
	-- т.к. на Макинтоше номера клавиш - в другом порядке

	return l_numpadKeys[ key ] ~= nil

end


--
function UI:IsKeyFromKb( key )

	return key < UI.Keys.KEY_XINPUT_BEGIN_KEYS

end


--
function UI:GetStringForPlatform( strId )

--[[ #0031105 cosmosim
	local hStr = UI:GetResourceForPlatform( strId, UI.RES_STRING )

	if hStr ~= UI.INVALID_RESOURCE_HANDLE then	
		local rc = UI:GetResourceByHandle( hStr )
		return rc:GetStr()
	else
		return string.format( "%s_MISSING", strId )
	end
]]

	-- #0031105 cosmosim
	do
		local str = ""
	
		if _G.IsPC() then
			str = UI:GetStringByName( string.format( "%s_pc", strId ), false )
	
		elseif _G.IsX360() then
			str = UI:GetStringByName( string.format( "%s_xbox", strId ), false )
	
		elseif _G.IsPS3() then
			str = UI:GetStringByName( string.format( "%s_ps3", strId ), false )
	
		elseif _G.IsMac() then
	
			str = UI:GetStringByName( string.format( "%s_mac", strId ), false )
	
			if not str then
				str = UI:GetStringByName( string.format( "%s_pc", strId ), false )
			end
	
		elseif _G.IsLinux() then
	
			str = UI:GetStringByName( string.format( "%s_linux", strId ), false )
	
			if not str then
				str = UI:GetStringByName( string.format( "%s_pc", strId ), false )
			end
	
		end
	
		if UI:IsStrEmpty( str ) then	
			str = UI:GetStringByName( strId, true )
		end
	
		return str
	end

end


--
function UI:GetTexForPlatform( texName )

	local hTex = UI:GetResourceForPlatform( texName, UI.RES_TEXTURE )

	if hTex == UI.INVALID_RESOURCE_HANDLE then
		hTex = UI:GetResourceHandleByName( "NoData", UI.RES_TEXTURE )
		UI:ReleaseResourceHandle( hTex )
	end

	return hTex

end       


--
function UI:GetResourceForPlatform( name, resourceType )

	local hResource = UI.INVALID_RESOURCE_HANDLE

--[[
	if _G.IsWindowsLive() then

		local hResource = UI:GetResourceHandleByName( string.format( "%s_winlive", name ), resourceType, true )

		if hResource == UI.INVALID_RESOURCE_HANDLE then
			hResource = UI:GetResourceHandleByName( string.format( "%s_pc", name ), resourceType, true )			
		end
]]

	if _G.IsPC() then
		hResource = UI:GetResourceHandleByName( string.format( "%s_pc", name ), resourceType, true )			

	elseif _G.IsX360() then
		hResource = UI:GetResourceHandleByName( string.format( "%s_xbox", name ), resourceType, true )			

	elseif _G.IsPS3() then
		hResource = UI:GetResourceHandleByName( string.format( "%s_ps3", name ), resourceType, true )			

	elseif _G.IsMac() then

		hResource = UI:GetResourceHandleByName( string.format( "%s_mac", name ), resourceType, true )

		if hResource == UI.INVALID_RESOURCE_HANDLE then
			hResource = UI:GetResourceHandleByName( string.format( "%s_pc", name ), resourceType, true )			
		end

	elseif _G.IsLinux() then

		hResource = UI:GetResourceHandleByName( string.format( "%s_linux", name ), resourceType, true )

		if hResource == UI.INVALID_RESOURCE_HANDLE then
			hResource = UI:GetResourceHandleByName( string.format( "%s_pc", name ), resourceType, true )			
		end

	end

	if hResource == UI.INVALID_RESOURCE_HANDLE then	
		hResource = UI:GetResourceHandleByName( name, resourceType, false )
	end

	if hResource ~= UI.INVALID_RESOURCE_HANDLE then	
		UI:ReleaseResourceHandle( hResource )
	end

	return hResource

end


--
function UI:GetStringForInputType( strId, inputType )

	local strInputType = UI:Val2Key( UI.inputTypes, inputType )
	strInputType = string.lower( strInputType )

	local strIdInputSpecific = string.format( "%s_%s", strId, strInputType )
--[[ #0031105 cosmosim
	local hStr = UI:GetResourceHandleByName( strIdInputSpecific, UI.RES_STRING, true )			

	if hStr ~= UI.INVALID_RESOURCE_HANDLE then
	
		local rc = UI:GetResourceByHandle( hStr )
		return rc:GetStr()

	else
		return UI:GetStringByName( strId )
	end
]]

	-- #0031105 cosmosim
	do 
		local str = UI:GetResourceHandleByName( strIdInputSpecific, false )
	
		if str then	
			return str
		else
			return UI:GetStringByName( strId )
		end
	end

end


-- только для одной строки; для многострочного текста см. UI:GetCutTextWithEllipsesMultiline
function UI:GetCutTextWithEllipses( text, maxWidth, hFont )

	local maxFormatRect	= UI:Quat( 0, 0, 1024, 768 )
	local clipRect		= UI:Quat( 0, 0, maxWidth, 768 )
	local formatFlags	= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE

	local width = _G.MeasureText( text, hFont, maxFormatRect, formatFlags, maxFormatRect ).z

	if width <= maxWidth then
		return text, false
	end

	local strEllipses	= UI:GetStringByName( "ellipses" )
	local ellipsesWidth	= _G.MeasureText( strEllipses, hFont, maxFormatRect, formatFlags, maxFormatRect ).z  

	local lastVisibleCharIdx = _G.GetLastVisibleCharIdForString( text, 0, hFont, maxFormatRect, formatFlags, clipRect )

	for lastCharIdx = lastVisibleCharIdx - 1, 0, -1 do

		local width = _G.GetSubstringRect( text, 0, lastCharIdx, hFont, maxFormatRect, formatFlags, maxFormatRect ).z

		if width + ellipsesWidth <= maxWidth then

			local cutText = UI:Substr( text, 1, lastCharIdx + 1 )
			cutText = string.format( "%s%s", cutText, strEllipses )

			return cutText, true

		end

	end

	return strEllipses, true  

end


--
function UI:GetCutTextWithEllipsesMultiline( text, rect, hFont, formatFlags )

	local numStrings = _G.GetStringsNumber(
		text,
		hFont,
		rect,
		formatFlags,
		rect )

	local stringHeight = _G.GetFontLineHeight( hFont )

	local maxStrings = stringHeight ~= 0 and math.floor( rect.w / stringHeight ) or 0
	if maxStrings <= 0 then
		maxStrings = 1
	end

	if numStrings <= maxStrings then
		return text, false
	end

	-- весь текст после первого символа последней видимой строки и до первого знака переноса строки '|' обрезется по правилам однострочного текста

	-- поиск первого символ последней видимой строки
	local tailFirstSymbolIdx = _G.GetFirstCharIdForString(
		text,
		maxStrings - 1,
		hFont,
		rect,
		formatFlags,
		rect ) + 1

	-- поиск знака переноса строки '|'

	local newLineSymbolIdx = nil
	local searchStartByteIdx = _G.Utf8CharIdxToByteOffset( text, tailFirstSymbolIdx - 1 ) + 1

	while true do

		local newLineFirstByteIdx, newLineLastByteIdx, escapeSymbols = string.find( text, "(#-)|", searchStartByteIdx )	-- знак '#' выступает в качестве эскейп-символа

    	-- символ переноса строки '|' не найден
    	if newLineFirstByteIdx == nil then
			break
		end

		-- символ переноса строки '|' найден и не заэкранирован эскейп-символом '#'
		if math.fmod( string.len( escapeSymbols ), 2 ) == 0 then	-- эскейп-символов может быть несколько подряд (например ####$); если их четное число, то они экранируют друг друга, и на '|' не повлияют 
			newLineSymbolIdx = _G.Utf8ByteOffsetToCharIdx( text, newLineFirstByteIdx - 1 ) + 1
			break
		end

	    searchStartByteIdx = newLineLastByteIdx + 1

	end

	local tailLastSymbolIdx = -1	-- конец строки
	if newLineSymbolIdx then
		tailLastSymbolIdx = newLineSymbolIdx - 1
	end

	local tailString = UI:Substr( text, tailFirstSymbolIdx, tailLastSymbolIdx )

	-- если строка кончилась по переносу строки, то в однострочной версси функции многоточие не подставится, т.к. эта строка может влезть;
	-- здесь не проверяется, что само многоточие влезает; если оно не влезет, то будет поставлено на новую правильную позицию в ооднострочной версси функции

	tailString = string.format( "%s%s", tailString, UI:GetStringByName( "ellipses" ) )
	tailString = UI:GetCutTextWithEllipses( tailString, rect.z, hFont )

	local headString = UI:Substr( text, 1, tailFirstSymbolIdx - 1 )

	return string.format( "%s%s", headString, tailString ), true

end


--
function UI:GetValByName( fullName )

	return assert( loadstring( "return "..fullName ) )()

end


--
function UI:GetTex( texName )

	local hTex = UI:GetResourceHandleByName( texName, UI.RES_TEXTURE )

	if hTex == UI.INVALID_RESOURCE_HANDLE then
		hTex = UI:GetResourceHandleByName( "NoData", UI.RES_TEXTURE )
	end

	UI:ReleaseResourceHandle( hTex )

	return hTex

end


--
function UI:LerpVec3Inplace( dstVec, a, b, t )

	dstVec.x = a.x + ( t * ( b.x - a.x ) )
	dstVec.y = a.y + ( t * ( b.y - a.y ) )
	dstVec.z = a.z + ( t * ( b.z - a.z ) )

end


--
function UI:QuatMul( a, b )

	local q = UI:ZeroQuat()

	q.x = a.w*b.x + a.x*b.w + a.y*b.z - a.z*b.y
	q.y = a.w*b.y + a.y*b.w + a.z*b.x - a.x*b.z
	q.z = a.w*b.z + a.z*b.w + a.x*b.y - a.y*b.x
	q.w = a.w*b.w - a.x*b.x - a.y*b.y - a.z*b.z

	return q

end


--
function UI:Vec3Add( v1, v2 )

	local v = UI:ZeroVec3()

	v.x = v1.x + v2.x
	v.y = v1.y + v2.y
	v.z = v1.z + v2.z

	return v

end


--
function UI:Vec3Sub( v1, v2 )

	local v = UI:ZeroVec3()

	v.x = v1.x - v2.x
	v.y = v1.y - v2.y
	v.z = v1.z - v2.z

	return v

end


--
function UI:Vec3Set( v, x, y, z )

	v.x = x
	v.y = y
	v.z = z

end


-- пред спец. символами вставляется #;
-- учитываются только внутренние спец.символы

function UI:ShieldSpecSymbols( text )

	local subst =
	{
		[ "@" ]		= "#@",
		[ "^" ] 	= "#^",
		[ "|" ] 	= "#|",
		[ "#" ]		= "##",
	}

	return string.gsub( text, ".", subst )	

end


-- пред спец. символами вставляется #;
-- учитываются внутренние спец.символы, а также некоторые общие спец.символы, которые могут быть в тексте

function UI:ShieldSpecSymbolsEx( text )

	local tags1 =
	{
		[ "\r" ]	= "",		-- CR
		[ "\n" ]	= "",		-- LF
		[ "@" ]		= "#@",		-- внутренний специальный символ
		[ "^" ] 	= "#^",		-- внутренний специальный символ
		[ "|" ] 	= "#|",		-- внутренний специальный символ
		[ "#" ]		= "##",		-- внутренний специальный символ
	}

	local tags2 =
	{
		[ "<br>" ]	= "|",		-- перевод строки в html
	}

	text = string.gsub( text, ".", tags1 )
	text = string.gsub( text, "<%w+>", tags2 )

	return text

end


-- пред спец. символами вставляется #;
-- учитываются внутренние спец.символы, а также некоторые общие спец.символы, которые могут быть в тексте, так же спец символы метатекста

--
function UI:ShieldSpecSymbolsForMetatext( text )

	local subst =
	{
		[ "@" ]		= "#@",
		[ "^" ] 	= "#^",
		[ "|" ] 	= "#|",
		[ "#" ]		= "##",
		[ "$" ]		= "#$",
	}

	return string.gsub( text, ".", subst )	

end


-- перед символом % вставляется ещё один символ % (для string.gsub )

--
function UI:ShieldSpecSymbolsForLuaGsub( text )

	local newText = ""
	local add = 0
	local temp = "%"
	local code = string.byte( temp )

	for i = 1, string.len( text ) do
		if string.byte( text, i ) == code then
			newText = newText.."%"
		end
		newText = newText .. string.char( string.byte( text, i ) )
	end

	return newText

end


--
function UI:LocalizeFloat( strFloat )

	return string.gsub( strFloat, "%.", self.strDecimalDot )

end


-- некоторые данные с сервера не содержат bool значений, а только 0/1 или nil
function UI:IsTrueEx( val )

	return val ~= nil and val ~= 0 and val ~= false

end


--
function UI:Utf8ClampByBufSize( str, bufSizeInBytes )

	if bufSizeInBytes <= 1 then
		return ""
	end

	local strLen = string.len( str )	

	if strLen + 1 <= bufSizeInBytes then
		return str
	end

	str = string.sub( str, 1, bufSizeInBytes - 1 )

	return self:Ut8ValidateLastSymbol( str )
	
end


--
function UI:Ut8ValidateLastSymbol( str )

	local strLen = string.len( str )
	
	local byteIdx = strLen
	local strByte = string.sub( str, byteIdx, byteIdx )
	local intByte = string.byte( strByte )

	if bit.band( intByte, 0x80 ) ~= 0x80 then
		return str
	end	

	for i = 1, math.min( strLen, 4 ) do

		if bit.band( intByte, 0xC0 ) == 0xC0 then

			local numBytesInSymbolNeed = 0

			local numBytesInSymbolData = bit.band( intByte, 0xF0 )
			if numBytesInSymbolData == 0xE0 then
				numBytesInSymbolNeed = 3
			elseif numBytesInSymbolData == 0xF0 then
				numBytesInSymbolNeed = 4
			else
				numBytesInSymbolNeed = 2
			end

			local numBytesInSymbolReal = ( strLen - byteIdx ) + 1

			if numBytesInSymbolReal ~= numBytesInSymbolNeed and byteIdx > 1 then
				str = string.sub( str, 1, byteIdx - 1 )
			end

			break

		end

		byteIdx = byteIdx - 1
		strByte = string.sub( str, byteIdx, byteIdx )
		intByte = string.byte( strByte )

	end	

	return str

end


-- меньше ли значение 1, чем значение 2
function UI:IsU64Less( val1, val2 )

	return UI:IsHiLowLess( val1.h, val1.l, val2.h, val2.l )

end


-- больше ли значение 1, чем значение 2
function UI:IsU64Greater( val1, val2 )

	return UI:IsHiLowGreater( val1.h, val1.l, val2.h, val2.l )

end


--
function UI:IsHiLowLess( h1, l1, h2, l2 )

	if h1 < h2 then
		return true

	elseif h1 > h2 then
		return false

	else
		return l1 < l2
	end

end


--
function UI:IsHiLowGreater( h1, l1, h2, l2 )

	if h1 > h2 then
		return true

	elseif h1 < h2 then
		return false

	else
		return l1 > l2
	end

end  


--
function UI:SubstituteValLocalizedByStringId( strId, val, placeholder, valAsString )

	if type( strId ) ~= "string" then
		sys.log( "UI:SubstituteValLocalizedByStringId()[ERROR]: invalid type of the 1-st parameter (\"text\"); \"string\" expected, got \"%s\"", type( strId ) )
		return ""
	end	

--[[ -- #0031105 cosmosim
	local hResource = UI:GetResourceHandleByName( strId, UI.RES_STRING )
	if hResource == UI.INVALID_RESOURCE_HANDLE then
		sys.log( "UI:SubstituteValLocalizedByStringId()[ERROR]: invalid strId: %s", strId )
		return string.format( "%s_MISSING", strId )
	end

	UI:ReleaseResourceHandle( hResource )

	local rc = UI:GetResourceByHandle( hResource )
	if not rc then
		sys.log( "UI:SubstituteValLocalizedByStringId()[ERROR]: cannot find string resource with name %s", strId )
		return string.format( "%s_MISSING", strId )
	end

	local language = UI:GetLanguage()

	if rc:GetResourceType() == UI.RES_DEFAULT_STRING then
		language = "ENGLISH"
	end

	local text = rc:GetStr()

	return UI:SubstituteValLocalized( text, val, placeholder, valAsString, language )
]]

	-- #0031105 cosmosim
	do
		local text = UI:GetStringByName( strId )
		return UI:SubstituteValLocalized( text, val, placeholder, valAsString )
	end

end


--
function UI:SubstituteValLocalized( text, val, placeholder, valAsString, language )

	if type( text ) ~= "string" then
		sys.log( "UI:SubstituteValLocalized()[ERROR]: invalid type of the 1-st parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		return ""
	end

	if type( val ) ~= "number" then
		sys.log( "UI:SubstituteValLocalized()[ERROR]: invalid type of the 2-nd parameter (\"val\"); \"number\" expected, got \"%s\"", type( val ) )
		return text
	end

	if type( placeholder ) ~= "string" then
		sys.log( "UI:SubstituteValLocalized()[ERROR]: invalid type of the 3-rd parameter (\"placeholder\"); \"string\" expected, got \"%s\"", type( placeholder ) )
		return text
	end

	if valAsString ~= nil and type( valAsString ) ~= "string" then
		sys.log( "UI:SubstituteValLocalized()[ERROR]: invalid type of the 4-th parameter (\"valAsString\"); \"string\" or \"nil\" expected, got \"%s\"", type( valAsString ) )
		valAsString = nil
	end

	if language ~= nil then
		if type( language ) ~= "string" then
			sys.log( "UI:SubstituteValLocalized()[ERROR]: invalid type of the 5-th parameter (\"language\"); \"string\" or \"nil\" expected, got \"%s\"", type( language ) )
			language = nil
		end
	end

	if language == nil then
		language = UI:GetLanguage()
	end

	local fnName = string.format( "SubstituteValLocalized_%s", language )

	local fn = UI[ fnName ]
	
	if fn == nil then
		fn = UI.SubstituteValLocalized_ENGLISH
	end
	
	text = fn( self, text, val, placeholder, valAsString )

	-- простая подстановка;
	-- выполнется даже если до этого была выполнена локализованная, т.к. в тексте могут быть и нелокализованные плейсхолдеры

	local strPattern = "%$"..placeholder.."%$"
	local strVal = valAsString or tostring( val )

	return string.gsub( text, strPattern, strVal )

end


--
function UI:SubstituteValLocalized_RUSSIAN( text, val, placeholder, valAsString )

	-- пример словоформ
	-- 1. стол		оканчивающиеся на 1 ( кроме оканчивающихся на 11 )
	-- 2. стола		оканчивающиеся на 2,3,4 ( кроме оканчивающихся на 12,13,14 ), а также дробные
	-- 3. столов	все остальные

	if not valAsString then
		valAsString = tostring( val )
	end

	local unitsFormId = 1

	local valAbs = math.abs( val )
	local intPart, floatPart = math.modf( valAbs )	

	if floatPart ~= 0 then

		-- "стола"
		unitsFormId = 2

	else

		local digit1 = math.fmod( intPart, 10 )	-- количество единиц
		local digit10 = math.floor( math.fmod( intPart, 100 ) / 10 ) -- количество десятков

		-- "стол" 
		if digit1 == 1 and digit10 ~= 1 then
			unitsFormId = 1

		-- "стола"
		elseif ( digit1 >= 2 and digit1 <= 4 ) and digit10 ~= 1 then
			unitsFormId = 2

		-- "столов"
		else
			unitsFormId = 3
		end

	end

	local strPattern = "{%s*%$"..placeholder.."%$%s*;%s*(.-)%s*;%s*(.-)%s*;%s*(.-)%s*}"
	local strSubst = valAsString ~= "" and valAsString.." %"..unitsFormId or "%"..unitsFormId

	return string.gsub( text, strPattern, strSubst )

end


--
function UI:SubstituteValLocalized_ENGLISH( text, val, placeholder, valAsString )

	-- пример словоформ
	-- 1. table		оканчивающиеся на 1 ( кроме оканчивающихся на 11 )
	-- 2. tables	все остальные целые, а также дробные

	if not valAsString then
		valAsString = tostring( val )
	end

	local unitsFormId = 1

	local valAbs = math.abs( val )
	local intPart, floatPart = math.modf( valAbs )	

	if floatPart ~= 0 then

		-- "tables"
		unitsFormId = 2

	else

		local digit1 = math.fmod( intPart, 10 )	-- количество единиц
		local digit10 = math.floor( math.fmod( intPart, 100 ) / 10 ) -- количество десятков

		-- "table" 
		if digit1 == 1 and digit10 ~= 1 then
			unitsFormId = 1

		-- "tables"
		else
			unitsFormId = 2
		end

	end

	local strPattern = "{%s*%$"..placeholder.."%$%s*;%s*(.-)%s*;%s*(.-)%s*}"
	local strSubst = valAsString.." %"..unitsFormId

	return string.gsub( text, strPattern, strSubst )

end


--
function UI:SubstituteValLocalized_POLISH( text, val, placeholder, valAsString )

	return UI:SubstituteValLocalized_RUSSIAN( text, val, placeholder, valAsString )

end


--
function UI:IntersectSegments( start1, end1, start2, end2 )

	--[[local denominator = ( v2e.y - v2b.y ) * ( v1e.x - v1b.x ) - ( v2e.x - v2b.x ) * ( v1e.y - v1b.y ) --( y4 - y3 ) * ( x2 - x1 ) - ( x4 - x3 ) * ( y2-y1 )

	if denominator == 0 then
		return nil
	end

	local numerator = ( v2e.x - v2b.x ) * ( v1b.y - v2b.y ) - ( v2e.y - v2b.y ) * ( v1b.x - v2b.x ) --( x4 - x3 ) * ( y1 - y3) - ( y4 - y3 ) * ( x1 - x3 )

	local k = numerator / denominator

	if k >= 0 and k <= 1 then
		return UI:Vec2( ( v1b.x + k * ( v1e.x - v1b.x ) ), v1b.y + k * ( v1e.y - v1b.y ) )
	end

	return nil]]

	local dir1 = end1 - start1;
	local dir2 = end2 - start2;

	--считаем уравнения прямых проходящих через отрезки
	local a1 = -dir1.y;
	local b1 = dir1.x;
	local d1 = -( a1 * start1.x + b1 * start1.y );

	local a2 = -dir2.y;
	local b2 = dir2.x;
	local d2 = -( a2 * start2.x + b2 * start2.y );

	--подставляем концы отрезков, для выяснения в каких полуплоскотях они
	local seg1_line2_start = a2 * start1.x + b2 * start1.y + d2;
	local seg1_line2_end = a2 * end1.x + b2 * end1.y + d2;

	local seg2_line1_start = a1 * start2.x + b1 * start2.y + d1;
	local seg2_line1_end = a1 * end2.x + b1 * end2.y + d1;

	--если концы одного отрезка имеют один знак, значит он в одной полуплоскости и пересечения нет.
	if seg1_line2_start * seg1_line2_end >= 0 or seg2_line1_start * seg2_line1_end >= 0 then
		return nil;
	end

	local u = seg1_line2_start / ( seg1_line2_start - seg1_line2_end );
	return UI:Vec2( start1.x + u * dir1.x, start1.y + u * dir1.y );

end


--
function UI:IsVertexConvex( vertPrev, vert, vertNext, bClockwise )

	if bClockwise == nil then
		bClockwise = true
	end

	local v1 = vert - vertPrev
	local v2 = vertNext - vert
	
	local product = v1.x * v2.y - v1.y * v2.x
	local isNegative = product < 0
	
	if bClockwise then
		return not isNegative
	else
		return isNegative
	end

end


-- bClockwise - порядок в котором заданы точки (по или против часовой стрелки),
-- полученные треугольники в результате все равно будут содержать вершины ПО часовой стрелке, иначе они не нарисуются
function UI:TriangulatePoligon( verts, bClockwise )

	-- по методу "обрезания ушей"
	-- images/e9893249957ed90093d7c6239431.png

	local triangles = {}
	
	local numVerts = #verts
	if numVerts < 3 then
		sys.log( "UI:TriangulatePoligon()[ERROR]: invalid verts number; must be >=3" )
		return triangles
	end
	
	local vertsLeft = UI:CopyTable2( verts )
	local numVertsLeft = numVerts
	
	local vertIdx = 1
	local iterationIdx = 1
	
	while numVertsLeft ~= 3 do
	
		-- гард, чтобы цикл не получился вечным, если неправильный набор точек или для них задан неправильный порядок обхода
		-- (сам факт повторного прохождения одной и той же точки - это нормально)
		-- TODO это хаковая проверка, надо определить это как-то правильно, что мы попали в вечный цикл
		if iterationIdx >= numVerts * 2 then
			sys.log( "UI:TriangulatePoligon()[ERROR]: invalid vertices or bClockwise param" )
			break
		end
	
		local prevVertIdx = vertIdx - 1
		prevVertIdx = math.fmod( numVertsLeft + prevVertIdx - 1, numVertsLeft ) + 1
		
		local nextVertIdx = vertIdx + 1
		nextVertIdx = math.fmod( numVertsLeft + nextVertIdx - 1, numVertsLeft ) + 1
		
		local vert = vertsLeft[ vertIdx ]
		local vertPrev = vertsLeft[ prevVertIdx ]
		local vertNext = vertsLeft[ nextVertIdx ]
		
		local triangle = { vertPrev, vert, vertNext }	-- потенциальный треугольник
		
		-- "ухо" - значит вершина выпуклая, и ни одна другая вершина многоугольника не принадлежит к этому треугольнику
		local bIsEar = false
		
		-- вершина выпуклая?
		if UI:IsVertexConvex( vertPrev, vert, vertNext, bClockwise ) then
			
			-- ни одна другая вершина многоугольника не принадлежит к этому треугольнику?
			local bHasPointInsideTriangle = false
			for _vertIdx, _vert in pairs( vertsLeft ) do
				if _vertIdx ~= vertIdx and _vertIdx ~= prevVertIdx and _vertIdx ~= nextVertIdx then
					if UI:IsPointInsidePoligon( _vert, triangle ) then
						bHasPointInsideTriangle = true
						break
					end
				end
			end
			
			if not bHasPointInsideTriangle then
				bIsEar = true
			end
		
		end
		
		-- отрезаем "ухо"
		if bIsEar then
		
			-- добавляем новый треугольник в коллекцию;
			-- вершины в нем всегда будут по часовой стрелке, независимо от того, в каком порядке поданы вершины исходного многоугольника,
			-- т.к. иначе они не нарисуются
			local triangleClockwise = triangle
			if not bClockwise then
				triangleClockwise = { triangle[3], triangle[2], triangle[1] }
			end
				
			table.insert( triangles, triangleClockwise )
			
			table.remove( vertsLeft, vertIdx )
			numVertsLeft = numVertsLeft - 1
			vertIdx = math.fmod( numVertsLeft + vertIdx - 1, numVertsLeft ) + 1	-- фикс индекса, т.к. индекс мог быть последним в массиве, а массив мог уменьшиться
			
		else
			vertIdx = nextVertIdx
		end
		
		iterationIdx = iterationIdx + 1
	
	end

	-- добавляем оставший последний треугольник
	if numVertsLeft == 3 then
		table.insert( triangles, vertsLeft )
	else
		sys.log( "UI:TriangulatePoligon()[ERROR]: logic error: numVertsLeft ~= 3" )
	end
	
	return triangles

end


--
function UI:MakeThickLine( verts, lineWidth, bClosed--[[замкнутая линия]], bClockwise --[[todo bClockwise или убрать или обрабатывать]] )
	
	local quads = {}
	
	local numVerts = #verts
	if numVerts < 2 then
		sys.log( "UI:MakeThickLine()[ERROR]: invalid num verts (%d); minimum 2 espected", numVerts )
	end 
	
	if numVerts == 2 and bClosed then
		sys.log( "UI:MakeThickLine()[ERROR]: line with 2 verts cant be closed" )
		bClosed = false
	end
	
	if bClockwise == nil then
		bClockwise = true
	end
	
	-- нормали к ребрам (направление наружу)
	local normals = {}
	for vertIdx = 1, numVerts do
		
		local vertNextIdx = vertIdx + 1
		if vertIdx == numVerts and bClosed then
			vertNextIdx = 1
		end
		
		local vert = verts[ vertIdx ]
		local vertNext = verts[ vertNextIdx ]
		
		if vertNext then
			local dir = vertNext - vert
			local normal = UI:Vec2CopyStable( UI:V2GetNormalized( UI:Rotate2( dir, -math.pi/2, 0, 0 ) ) )
			table.insert( normals, normal )
		end
		
	end
	
	local lineHalfWidth = lineWidth / 2
	local INTERSECTION_MIN_ANGLE = math.rad( 30 )	-- углы меньше этого будут срезаться
	
	-- точки пересечения внутреннего и внешнего контуров на углах (для не срезанных вершин)
	local intersections = {}
	for vertIdx = 1, numVerts do
	
		local vertPrevIdx = vertIdx - 1
		if vertIdx == 1 and bClosed then
			vertPrevIdx = numVerts
		end
		
		local vertNextIdx = vertIdx + 1
		if vertIdx == numVerts and bClosed then
			vertNextIdx = 1
		end
		
		local vert = verts[ vertIdx ]
		local vertPrev = verts[ vertPrevIdx ]
		local vertNext = verts[ vertNextIdx ]
		
		if vertPrev and vertNext then
			
			-- угол между ребрами (меньший)
			local dirPrev = UI:V2GetNormalized( vertPrev - vert )
			local dirNext = UI:V2GetNormalized( vertNext - vert )
			local dotProduct = UI:V2DotProduct( dirPrev, dirNext )
			local angle = UI:AngleNormalizePI2( math.acos( dotProduct ) )
			
			local bConvex = UI:IsVertexConvex( vertPrev, vert, vertNext, bClockwise )
		
			-- направление от вершины к точке пересечения ребер контура (будет ли это направление вовнутрь или наружу, зависит от выпуклости вершины)
			local dir = UI:ZeroVec2()
			if angle == math.pi then
				dir = bConvex and -normals[ vertIdx ] or normals[ vertIdx ]
			else
				dir = UI:V2GetNormalized( dirPrev + dirNext )
			end
			
			-- длина отрезка от вершины до точки пересечения ребер контура
			local sin = math.sin( angle / 2 )
			local len = sin ~= 0 and lineHalfWidth / sin or lineHalfWidth
			
			local bNeedCut_out = angle < INTERSECTION_MIN_ANGLE and bConvex
			local bNeedCut_in = angle < INTERSECTION_MIN_ANGLE and not bConvex
			
			intersections[ vertIdx ] = {}
			
			-- пересечение на внешнем контуре
			if not bNeedCut_out then
				intersections[ vertIdx ].outer = vert + dir * len * ( bConvex and -1 or 1 )
			end
			
			-- пересечение на внутреннем контуре
			if not bNeedCut_in then
				intersections[ vertIdx ].inner = vert + dir * len * ( bConvex and 1 or -1 )
			end
			
		end
	
	end
	
	-- создание квадов
	for vertIdx = 1, numVerts do
		
		local vertPrevIdx = vertIdx - 1
		if vertIdx == 1 and bClosed then
			vertPrevIdx = numVerts
		end
		
		local vertNextIdx = vertIdx + 1
		if vertIdx == numVerts and bClosed then
			vertNextIdx = 1
		end
		
		local vert = verts[ vertIdx ]
		local vertPrev = verts[ vertPrevIdx ]
		local vertNext = verts[ vertNextIdx ]
		
		if not vertNext then
			break
		end
		
		local intersection_out		= intersections[ vertIdx ] and intersections[ vertIdx ].outer			-- т. пересечения ребер внешнего контура для текущей вершины
		local intersection_in		= intersections[ vertIdx ] and intersections[ vertIdx ].inner			-- т. пересечения ребер внутреннего контура для текущей вершины
		local intersection_next_out	= intersections[ vertNextIdx ] and intersections[ vertNextIdx ].outer	-- т. пересечения ребер внешнего контура для следующей вершины
		local intersection_next_in	= intersections[ vertNextIdx ] and intersections[ vertNextIdx ].inner	-- т. пересечения ребер внутреннего контура для следующей вершины
		
		local n_out_1				= vert + normals[ vertIdx ] * lineHalfWidth						-- т. пересечения нормали, исходящей из текущей вершины, и внешнего контура
		local n_out_2				= vertNext + normals[ vertIdx ] * lineHalfWidth					-- т. пересечения нормали, исходящей из следующей вершины, и внешнего контура
		local n_in_1				= vert - normals[ vertIdx ] * lineHalfWidth						-- т. пересечения нормали, исходящей из текущей вершины, и внутреннего контура
		local n_in_2				= vertNext - normals[ vertIdx ] * lineHalfWidth					-- т. пересечения нормали, исходящей из следующей вершины, и внутреннего контура
		local n_prev_out_2			= vertPrev and vert + normals[ vertPrevIdx ] * lineHalfWidth	-- т. пересечения нормали, исходящей из текущей вершины, и внешнего контура предыдущего ребра (нужно для создания связующего треугольника на срезанной вершине)
		local n_prev_in_2			= vertPrev and vert - normals[ vertPrevIdx ] * lineHalfWidth	-- т. пересечения нормали, исходящей из текущей вершины, и внутреннего контура предыдущего ребра (нужно для создания связующего треугольника на срезанной вершине)
		
		-- для срезанной по внешнему контуру вершины добавляется связующий треугольник,
		-- его точки - вершина внутреннего контура + две точки на пересечения нормалей, исходящих из нее, с внешним контуром
		if vertPrev and not intersection_out then
		
			local connectionQuad = { pos = {}, tcs = {} }
			
			connectionQuad.pos[1] = n_prev_out_2
			connectionQuad.pos[2] = n_out_1
			connectionQuad.pos[3] = intersection_in or --[[ошибка]]Vec2( 0, 0 ) 
			connectionQuad.pos[4] = connectionQuad.pos[3]

			connectionQuad.tcs[1] = Vec2( 0, 0 )
			connectionQuad.tcs[2] = Vec2( 0, 0 )
			connectionQuad.tcs[3] = Vec2( 0, 1 )
			connectionQuad.tcs[4] = connectionQuad.tcs[3]
			
			table.insert( quads, connectionQuad )
			
		end
		
		-- для срезанной по внутреннему контуру вершины добавляется связующий треугольник,
		-- его точки - вершина внешнего контура + две точки на пересечения нормалей, исходящих из нее, с внутренним контуром
		if vertPrev and not intersection_in then
		
			local connectionQuad = { pos = {}, tcs = {} }
			
			connectionQuad.pos[1] = intersection_out or --[[ошибка]]Vec2( 0, 0 ) 
			connectionQuad.pos[2] = n_in_1
			connectionQuad.pos[3] = n_prev_in_2
			connectionQuad.pos[4] = connectionQuad.pos[3]

			connectionQuad.tcs[1] = Vec2( 0, 0 )
			connectionQuad.tcs[2] = Vec2( 0, 1 )
			connectionQuad.tcs[3] = Vec2( 0, 1 )
			connectionQuad.tcs[4] = connectionQuad.tcs[3]
			
			table.insert( quads, connectionQuad )
		
		end
		
		-- ребро от текущей до следующей вершины
		local quad = { pos = {}, tcs = {} }
		
		quad.pos[1] = intersection_out or n_out_1
		quad.pos[2] = intersection_next_out or n_out_2
		quad.pos[3] = intersection_next_in or n_in_2
		quad.pos[4] = intersection_in or n_in_1
		
		quad.tcs[1] = Vec2( 0, 0 )
		quad.tcs[2] = Vec2( 0, 0 )
		quad.tcs[3] = Vec2( 0, 1 )
		quad.tcs[4] = Vec2( 0, 1 )
		
		table.insert( quads, quad )
	
	end
	
	return quads
	
end