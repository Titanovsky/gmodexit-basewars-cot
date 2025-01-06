AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
SWEP.HoldType = "melee"

--[[ Moved to cl_init.lua
SWEP.Category = "Crossfire Axes"
SWEP.PrintName = "Crossfire Axe Royal Dragon"
SWEP.Author = "PeridotPower"
SWEP.Slot = 0
SWEP.Slotpos = 2
--]]
SWEP.ViewModelFOV = "64"
SWEP.CSMuzzleFlashes = false

function SWEP:Precache()
	util.PrecacheSound("npc/zombie/claw_miss2.wav")
	util.PrecacheSound("weapons/ar_impact.wav")
    	util.PrecacheModel("models/weapons/v_octan_t.mdl")
	util.PrecacheModel("models/weapons/w_octan_t.mdl")
end

SWEP.data = {}
SWEP.data.newclip = false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.ViewModel			= "models/weapons/v_octan_t.mdl"
SWEP.WorldModel			= "models/weapons/w_octan_t.mdl"
SWEP.ViewModelFlip		= false

SWEP.Offset = {
Pos = {Up = 7, Right = 2, Forward = 3, },
Ang = {Up = 180, Right = 0, Forward = 180,}
}
function SWEP:DrawWorldModel( )
	local hand, offset, rotate
	local pl = self:GetOwner()
    if IsValid( pl ) then
		local boneIndex = pl:LookupBone( "ValveBiped.Bip01_R_Hand" )
		if boneIndex then
		local pos, ang = pl:GetBonePosition( boneIndex )
		pos = pos + ang:Forward() *              self.Offset.Pos.Forward + ang:Right() * self.Offset.Pos.Right + ang:Up() * self.Offset.Pos.Up
		ang:RotateAroundAxis( ang:Up(),        self.Offset.Ang.Up)
		ang:RotateAroundAxis( ang:Right(),     self.Offset.Ang.Right )
		ang:RotateAroundAxis( ang:Forward(),  self.Offset.Ang.Forward )
		self:SetRenderOrigin( pos )
		self:SetRenderAngles( ang )
		self:DrawModel()
	end
	else
		self:SetRenderOrigin( nil )
		self:SetRenderAngles( nil )
		self:DrawModel()
	end
end

--[[
SWEP.WElements = {
	["iceaxe"] = { type = "Model", model = "models/weapons/w_royal_t.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.099, 2.2, -60.779), angle = Angle(180, 85.324, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
--]]

SWEP.Drawammo = false
SWEP.DrawCrosshair = false 

SWEP.Weight			= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound		= Sound( "npc/zombie/claw_miss2" )
SWEP.Primary.Recoil		= 0
SWEP.Primary.Damage		= 80
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone		= 0
SWEP.Primary.ClipSize		= 1
SWEP.Primary.Delay		= 0.8
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.SetHoldType = "melee"
SWEP.UseHands = false

function SWEP:Initialize()
	self:SetWeaponHoldType("melee")
	
	--[[ Doesn't work. Replacing with above
	if (SERVER) then
		self:SetWeaponHoldType("melee")
	end
	--]]
end

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(CurTime() + 0.25)
	-- if SERVER then self.Owner:EmitSound(Sound("weapons/ar_impact.wav")) end --TODO: Replace sound file
	if SERVER then self.Owner:EmitSound(Sound("npc/zombie/claw_miss2.wav")) end
	local ang = self.Owner:GetAimVector()
	local spos = self.Owner:GetShootPos()

	local trace = {}
	trace.start = spos
	trace.endpos = spos + (ang * 150)
	trace.filter = self.Owner

	local tr = util.TraceLine(trace)

	if tr.HitNonWorld then
		local bullet = {}
		bullet.Num= 1
		bullet.Src = self.Owner:GetShootPos()
		bullet.Dir= self.Owner:GetAimVector()
		bullet.Spread = Vector(0.15,0.15,0.15)
		bullet.Tracer = 0
		bullet.Force = 1
		bullet.Damage = 50
		self.Owner:FireBullets(bullet)
		self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )

	elseif tr.HitWorld then
		local bullet = {}
		bullet.Num= 1
		bullet.Src = self.Owner:GetShootPos()
		bullet.Dir= self.Owner:GetAimVector()
		bullet.Spread = Vector(0.15,0.15,0.15)
		bullet.Tracer = 0
		bullet.Force = 1
		bullet.Damage = 50
		self.Owner:FireBullets(bullet)
		self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
	elseif !tr.Hit then
		self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		end
end

function SWEP:SecondaryAttack()
--Do absolutely nothing
end