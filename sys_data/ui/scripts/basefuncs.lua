-- ----------------------------------------------------------------------------
--
-- Workfile: BaseFuncs.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------


--
function UI:SetupWndInheritance( wnd )

	if not wnd or type( wnd ) ~= "table" then
		error( "invalid table" )
	end

	local def = wnd.def
	if not def or type( def ) ~= "table" then
		error( "cannot find 'def' table" )
	end

	local prototypeName = def.prototype	
	local hPrototype	= def.hPrototype

	local prototype = nil
	if prototypeName then
		prototype = self:GetUiObjByHandleT( self:GetPrototypeByName( prototypeName ) )
	elseif hPrototype then
		prototype = self:GetUiObjByHandleT( hPrototype )
	end

	if prototype then
		self:InheritWnd( wnd, prototype ) 
	elseif def.className then
		local class = self:GetTableByName( "UI."..def.className )
		if class then
			self:InheritWnd( wnd, class )
		end
	end

end
         

-- рекурсивно наследуются все подтаблицы
function UI:DeepInherit( child, parent )

	if not self:ShallowInherit( child, parent ) then
		return
	end

	for key, val in pairs( parent ) do

		local childVal = rawget( child, key )
		if childVal ~= nil then
			UI:DeepInherit( childVal, val )
		end		
		
	end

	local meta = getmetatable( parent )
	if meta then
    	for key, val in pairs( meta.__index ) do

    		local childVal = rawget( child, key )
    		if childVal ~= nil then
    			UI:DeepInherit( childVal, val )
    		end		
    		
    	end
	end

end


-- наследуется только первый уровень (без подтаблиц)
function UI:ShallowInherit( child, parent )

	if not child or not parent or type( child ) ~= "table" or type( parent ) ~= "table" then
		return false
	end

	setmetatable( child, parent )
	parent.__index = parent
	return true

end


-- глубокое наследование (но кроме подтаблицы "def", которая не наследуется)
function UI:InheritWnd( child, parent )

	local bHadDef = child and child.def ~= nil

	if not self:ShallowInherit( child, parent ) then
		return
	end

	if not bHadDef and child.def then
		child.def = nil
	end

	for key, val in pairs( parent ) do

		if key ~= "def" then	
        	local childVal = rawget( child, key )
      		if childVal ~= nil then
      			UI:DeepInherit( childVal, val )
      		end		
		end
		
	end

	local meta = getmetatable( parent )
	if meta then
    	for key, val in pairs( meta.__index ) do

    		if key ~= "def" then	
        		local childVal = rawget( child, key )
        		if childVal ~= nil then
        			UI:DeepInherit( childVal, val )
        		end		
    		end
    		
    	end
	end 

end


-- пвозвращает таблицу по строке-полному имени (список таблиц через точку, напр: UI.LoadingScreen.Modes)
function UI:GetTableByName( fullName )               

	if not fullName then
		return nil
	end

	local tt = {}
	local i = 1

	for name in string.gmatch( fullName, "([%w_]+)%.*" ) do
		local t = nil
		if i == 1 then
			t = _G[ name ]
		else
			t = tt[ i - 1 ][ name ]
		end
			
		if not t or type( t ) ~= "table" then
--			error( "invalid table name: "..fullName )			
			return nil
		end

		table.insert( tt, t )
		i = i + 1
	end

	return next( tt ) and tt[ #tt ]

end



-- ---------------------------------------------------------
-- temp Quat/Vec3/Vec2 buffers
-- ---------------------------------------------------------

if not UI.tempBufs then

    UI.tempBufs =
    {
    	numQ	= 20,
		numV3	= 20,
		numV2	= 20,

    	bufQ	= {},
    	bufV3	= {},
    	bufV2	= {},

    	idxQ	= 1,
    	idxV3	= 1,
    	idxV2	= 1,
    }

    for i = 1, UI.tempBufs.numQ do
    	table.insert( UI.tempBufs.bufQ, Quat( 0, 0, 0, 0 ) )
	end

    for i = 1, UI.tempBufs.numV3 do
    	table.insert( UI.tempBufs.bufV3, Vec3( 0, 0, 0 ) )
	end

    for i = 1, UI.tempBufs.numV2 do
    	table.insert( UI.tempBufs.bufV2, Vec2( 0, 0 ) )
    end

end


--
function UI:Quat( x, y, z, w )

	local q = self.tempBufs.bufQ[ self.tempBufs.idxQ ]
	q.x, q.y, q.z, q.w = x, y, z, w

	self.tempBufs.idxQ = self.tempBufs.idxQ % self.tempBufs.numQ + 1
	
	return q	

end


--
function UI:QuatCopy( q )

	return self:Quat( q.x, q.y, q.z, q.w )

end


--
function UI:QuatCopyStable( q )

	return Quat( q.x, q.y, q.z, q.w )

end


--
function UI:QuatCopyInplace( qSrc, qDst )

	qDst.x, qDst.y, qDst.z, qDst.w = qSrc.x, qSrc.y, qSrc.z, qSrc.w

end


--
function UI:ZeroQuat()

	return self:Quat( 0, 0, 0, 0 )

end


--
function UI:Vec3( x, y, z )

	local v = self.tempBufs.bufV3[ self.tempBufs.idxV3 ]
	v.x, v.y, v.z = x, y, z

	self.tempBufs.idxV3 = self.tempBufs.idxV3 % self.tempBufs.numV3 + 1
	
	return v

end


--
function UI:Vec3Copy( v )

	return self:Vec3( v.x, v.y, v.z )

end


--
function UI:Vec3CopyStable( v )

	return Vec3( v.x, v.y, v.z )

end


--
function UI:Vec2FromVec3( v3 )

	return self:Vec2( v3.x, v3.y )
	
end


--
function UI:Vec3CopyInplace( vSrc, vDst )

	vDst.x, vDst.y, vDst.z = vSrc.x, vSrc.y, vSrc.z

end


--
function UI:ZeroVec3()

	return self:Vec3( 0, 0, 0 )

end


--
function UI:Vec2( x, y )

	local v = self.tempBufs.bufV2[ self.tempBufs.idxV2 ]
	v.x, v.y = x, y

	self.tempBufs.idxV2 = self.tempBufs.idxV2 % self.tempBufs.numV2 + 1
	
	return v

end


--
function UI:Vec2Copy( v )

	return self:Vec2( v.x, v.y )

end


--
function UI:Vec2CopyStable( v )

	return Vec2( v.x, v.y )

end 


--
function UI:Vec2CopyInplace( vSrc, vDst )

	vDst.x, vDst.y = vSrc.x, vSrc.y

end


--
function UI:ZeroVec2()

	return self:Vec2( 0, 0 )

end


--
function UI:IsStrEmpty( str )

	return not str or str == ""

end


--
function UI:GetStrLength( str )

	return str and string.len( str )

end


--
function UI:Substr( str, firstCharIdx, lastCharIdx )

	local firstByteIdx	= _G.Utf8CharIdxToByteOffset( str, firstCharIdx - 1 ) + 1

	local lastByteIdx = -1
	if lastCharIdx ~= -1 then
		local len = _G.Utf8StrLen( str )
		if lastCharIdx < len then
			lastByteIdx = _G.Utf8CharIdxToByteOffset( str, lastCharIdx + 1 - 1 ) + 1 - 1
		end
	end

	return string.sub( str, firstByteIdx, lastByteIdx )

end


-- -----------------------------------------------
-- EffectAnimation
-- -----------------------------------------------


UI.EffectAnimation = {}

UI.EffectAnimation.effect 	= nil
UI.EffectAnimation.animName	= ""
UI.EffectAnimation.loop = true
UI.EffectAnimation.length = 100000



--
function UI.EffectAnimation:CreateInstance()

	local newInst = UI:CopyTable2( self )

	newInst.effect		= nil
	newInst.animName	= ""

	return newInst	

end


--
function UI.EffectAnimation:Init( effect, animName )

	self.effect		= effect
	self.animName	= animName	

end


--
function UI.EffectAnimation:onStart( w, animation )

	if self.effect then
		self.effect:StartAnimation( self.animName )	
	end

end


--
function UI.EffectAnimation:onStop( w, animation )

	if self.effect and self.effect:GetCurAnimation() == self.animName then
		self.effect:StopAnimation()
	end

end


--
function UI.EffectAnimation:onUpdate( w, animation, dt )

	if not self.effect then
		return
	end

	if self.effect:GetCurAnimation() ~= self.animName then
   		animation:Stop()
		return
	end

   	self.effect:Update( dt )

	if self.effect:GetCurAnimation() ~= self.animName then
   		animation:Stop()
	end

end
