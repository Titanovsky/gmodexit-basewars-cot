AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function doEffect(startp, endp, fromgun)
		initPos = startp
		lastPos = initPos
		endPos = endp
		for i = 1,3 do
			
			prevPos = lastPos
			lastPos = initPos + (endPos - initPos)/3*i
			lastPos = lastPos + Vector(math.random()*40 - 20,math.random()*40 - 20,math.random()*40 - 20)
			local effectdata = EffectData()
			effectdata:SetOrigin( lastPos )
			effectdata:SetStart( prevPos )
			effectdata:SetEntity(nil)
		effectdata:SetColor(2)
			util.Effect( "beam", effectdata, true, true )
		end
end

function ENT:Initialize()
	self.spawnDelay = 25
	self.time = 0
	self:SetModel( "models/hunter/blocks/cube025x025x025.mdl" )
	//self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	//self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	//self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	//self:SetColor(Color(255,255,255,0))
           // local phys = self:GetPhysicsObject()
	//if (phys:IsValid()) then
		//phys:Wake()
	//end
self:SetUseType(SIMPLE_USE)
end
 
 
function ENT:Think()
self:SetPos(self.Target:GetPos())
	self.time = self.time + 1
	if self.time < 2 || math.random()>0.9 then
	lines = {}
		for i = 0, 5 do
			lines[i] = Vector(math.random()*800 - 400,math.random()*800 - 400,math.random()*800 - 400)			
		end
	end
	for i = 0, 5 do
	trace = {}
	trace.start = self:GetPos()
	trace.filter = {}
	trace.filter[1] = self
	trace.filter[2] = self.Target
	trace.endpos = self:GetPos()+lines[i]
	traceres = util.TraceLine(trace)
	doEffect(self:GetPos(), traceres.HitPos)
	end
	if self.time > 20 then
		self:Remove()
	end
	self:NextThink( CurTime()+ 0.05 )
	return true
end
