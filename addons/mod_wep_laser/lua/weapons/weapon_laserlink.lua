SWEP.PrintName	= 'Лазерный Резак'
SWEP.Author	= "Ambition (Original: complover116)"
SWEP.Instructions	= 'Для добычи руды используется ЛКМ на камень'
SWEP.Spawnable = true

SWEP.Category = '[AMB] Инструменты'
SWEP.Primary.ClipSize	= 0
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic	= true
SWEP.Primary.Ammo	= "Pistol"
SWEP.Secondary.ClipSize	= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo	= "none"
SWEP.UseHands = true
SWEP.Weight	= 5
SWEP.AutoSwitchTo	= false
SWEP.AutoSwitchFrom	= false
SWEP.IronSightsPos = Vector(-11.881, 0, 2.079)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.HoldType = 'physgun'
SWEP.ViewModelFOV = 59.684210526316
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_physcannon.mdl"
SWEP.WorldModel = "models/weapons/w_physics.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {
	["Prong_B"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(-1.382, -0.197, -1.777), angle = Angle(0, 0, 0) },
	["Doodad_1"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -30), angle = Angle(0, 0, 0) },
	["Prong_A"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, -2.961, 0), angle = Angle(0, 0, 0) },
	["Doodad_2"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Doodad_4"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, -6.119, 0), angle = Angle(0, 0, 0) }
}

CreateClientConVar( "linkinglaser_cl_dynamiclights", 1)
SWEP.VElementsOld = {
	["battery"] = { type = "Model", model = "models/items/battery.mdl", bone = "Base", rel = "", pos = Vector(0.518, -3, -4.676), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ring2"] = { type = "Model", model = "models/props_junk/sawblade001a.mdl", bone = "Base", rel = "ring", pos = Vector(0, 0, 0), angle = Angle(0, 0, 90), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["battery_light"] = { type = "Sprite", sprite = "sprites/animglow02", bone = "Base", rel = "battery", pos = Vector(1, 0, 2), size = { x = 3, y = 3 }, color = Color(0, 181, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["ring"] = { type = "Model", model = "models/extras/crank.mdl", bone = "Base", rel = "", pos = Vector(0.5, 3, 14.026), angle = Angle(0, 0, 90), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "squad/orangebox", skin = 0, bodygroup = {} },
	["beam_light_big"] = { type = "Sprite", sprite = "sprites/blueglow1", bone = "Base", rel = "", pos = Vector(1, 0.518, 15.064), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["screen"] = { type = "Quad", bone = "Base", rel = "battery", pos = Vector(-3.458, 0, -5.433), angle = Angle(-180, -90, -45.556), size = 0.226, draw_func = nil},
	["beam_light"] = { type = "Sprite", sprite = "sprites/combineball_glow_blue_1", bone = "Base", rel = "", pos = Vector(1.557, 1.557, 11.947), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}
SWEP.VElements = {
	["cover"] = { type = "Model", model = "models/Items/car_battery01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "connect", pos = Vector(0.555, -0.201, -0.556), angle = Angle(0, -90, 90), size = Vector(0.808, 0.68, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["length"] = { type = "Model", model = "models/props_lab/labpart.mdl", bone = "Base", rel = "connect", pos = Vector(17.222, -0.35, -1.668), angle = Angle(22.6, 90, 0), size = Vector(1.57, 1.57, 1.57), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["beamlight"] = { type = "Sprite", sprite = "sprites/blueglow1", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(15.064, -67.014, -15.065), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["beamlight_small"] = { type = "Sprite", sprite = "sprites/glow2", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(15.064, -67.014, -15.065), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["connect"] = { type = "Model", model = "models/props_lab/incubatorplug.mdl", bone = "Base", rel = "body", pos = Vector(-1.668, 0, 3.888), angle = Angle(0, 180, 180), size = Vector(0.737, 0.737, 0.737), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["battery"] = { type = "Model", model = "models/Items/battery.mdl", bone = "Base", rel = "", pos = Vector(0, -2.779, -6.112), angle = Angle(0, 90, 0), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["upper"] = { type = "Model", model = "models/props_lab/lab_flourescentlight002b.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "connect", pos = Vector(16.111, 0.14, -7.223), angle = Angle(-90, 90, 0), size = Vector(0.182, 0.252, 0.6), color = Color(0, 205, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["spin"] = { type = "Model", model = "models/Items/combine_rifle_ammo01.mdl", bone = "Base", rel = "", pos = Vector(0, 2, 17.222), angle = Angle(0, 0, 0), size = Vector(2.125, 2.125, 0.737), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part2"] = { type = "Model", model = "models/props_lab/generatorconsole.mdl", bone = "Base", rel = "length", pos = Vector(1.667, -0.556, 2.778), angle = Angle(3.75, 73.75, 180), size = Vector(0.182, 0.182, 0.182), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["interface"] = { type = "Model", model = "models/props_lab/reciever01b.mdl", bone = "Base", rel = "length", pos = Vector(-0.5, 0, 1.7), angle = Angle(158, 0, 0), size = Vector(0.876, 0.876, 0.876), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["body"] = { type = "Model", model = "models/props_combine/combine_interface001.mdl", bone = "Base", rel = "", pos = Vector(0, 7.222, -8), angle = Angle(-90, -90, 180), size = Vector(0.182, 0.182, 0.182), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part"] = { type = "Model", model = "models/props_lab/miniteleport.mdl", bone = "Base", rel = "length", pos = Vector(-4.801, 0, -1), angle = Angle(108.75, 0, 0), size = Vector(0.114, 0.182, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["prongs"] = { type = "Model", model = "models/props_lab/crystalholder_bars.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "body", pos = Vector(-22.778, 0, 7.222), angle = Angle(-90, 180, 180), size = Vector(0.182, 0.182, 0.46), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElementsOld = {
	["battery"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.831, -0.519, -7.792), angle = Angle(-99.351, 0, -8.183), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ring2"] = { type = "Model", model = "models/props_junk/sawblade001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(22.337, -2.5, -4.676), angle = Angle(-5.844, 97.013, 90), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["battery_light"] = { type = "Sprite", sprite = "sprites/animglow02", bone = "ValveBiped.Bip01_R_Hand", rel = "battery", pos = Vector(1, 0, 2), size = { x = 3, y = 3 }, color = Color(0, 181, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["ring"] = { type = "Model", model = "models/extras/crank.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(20.26, -2.597, -4.676), angle = Angle(0, 100, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "squad/orangebox", skin = 0, bodygroup = {} },
	["screen"] = { type = "Quad", bone = "ValveBiped.Bip01_R_Hand", rel = "battery", pos = Vector(-3.458, 0, -5.433), angle = Angle(-180, -90, -45.556), size = 0.226, draw_func = nil}
}
SWEP.WElements = {
	["length"] = { type = "Model", model = "models/props_lab/labpart.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "connect", pos = Vector(15, -0.35, -1), angle = Angle(22.6, 90, 0), size = Vector(1.363, 1.363, 1.363), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["beamlight"] = { type = "Sprite", sprite = "sprites/blueglow1", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(37.922, -4.676, -5.023), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["connect"] = { type = "Model", model = "models/props_lab/incubatorplug.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(-1.668, 0, 3.888), angle = Angle(0, 180, 180), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["battery"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "connect", pos = Vector(6.111, 0, -5), angle = Angle(-90, 0, 180), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["spin"] = { type = "Model", model = "models/Items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "prongs", pos = Vector(0, 0, -9), angle = Angle(0, 180, 0), size = Vector(1.292, 1.292, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["upper"] = { type = "Model", model = "models/props_lab/lab_flourescentlight002b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "connect", pos = Vector(16.111, 0.14, -6.112), angle = Angle(-90, 90, 0), size = Vector(0.182, 0.252, 0.6), color = Color(0, 205, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part2"] = { type = "Model", model = "models/props_lab/generatorconsole.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "length", pos = Vector(1.667, -0.556, 2.778), angle = Angle(3.75, 73.75, 180), size = Vector(0.182, 0.182, 0.182), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["interface"] = { type = "Model", model = "models/props_lab/reciever01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "length", pos = Vector(-0.5, 0, 1), angle = Angle(158, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["prongs"] = { type = "Model", model = "models/props_lab/crystalholder_bars.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(-22.778, 0, 4.4), angle = Angle(-90, 180, 180), size = Vector(0.182, 0.182, 0.252), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part"] = { type = "Model", model = "models/props_lab/miniteleport.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "length", pos = Vector(-4.801, 0, -1), angle = Angle(108.75, 0, 0), size = Vector(0.114, 0.182, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["body"] = { type = "Model", model = "models/props_combine/combine_interface001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.111, 0, -0.556), angle = Angle(180, 6.25, -13.75), size = Vector(0.182, 0.182, 0.182), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
AddCSLuaFile()

function SWEP:doEffect(startp, endp, fromgun)
		initPos = startp
		lastPos = initPos
		endPos = endp
		for i = 1,3 do
			
			prevPos = lastPos
			lastPos = initPos + (endPos - initPos)/3*i
			lastPos = lastPos + Vector(math.random()*10 - 5,math.random()*10 - 5,math.random()*10 - 5)
			local effectdata = EffectData()
			effectdata:SetOrigin( lastPos )
			effectdata:SetStart( prevPos )
			if i == 1 && fromgun then
			effectdata:SetEntity(self)
			effectdata:SetAttachment(1)
		else
			effectdata:SetEntity(nil)
		end
			util.Effect( "beam", effectdata, true, true )
		end
end
--
-- Called when the left mouse button is pressed
--
function SWEP:PrimaryAttack()

	if ( !self:CanPrimaryAttack() ) then return end
	if ( self:Clip1() <= 0 ) then self.Owner:SetAmmo( 0, self.Primary.Ammo ) return end

	self:SetNextPrimaryFire( CurTime() + 0.75 )	
	
	traceres = self.Owner:GetEyeTrace()
	local ent = traceres.Entity
	local rocks = AMB.Mine.Config.mine_rocks

	if not IsValid( ent ) or not rocks[ ent:GetClass() ] then return end

	local distance = AMB.Mine.Config.mine_distance_extract
	if ( self.Owner:GetPos():Distance( ent:GetPos() ) > distance ) then return end

	self:doEffect(self.Owner:EyePos(), traceres.HitPos, true)

	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Owner:MuzzleFlash()
	self.Owner:SetAnimation( PLAYER_ATTACK1 )

	local damage, take_ammo = math.random( 10, 50 ), math.random( 1, 5 )
	take_ammo = ( self:Clip1() - take_ammo <= 0 ) and self:Clip1() or take_ammo

	self:ShootBullet( 0, 1, 0 )
	if SERVER then ent:TakeDamage( damage, self.Owner, self.Weapon ) end
	self:TakePrimaryAmmo( take_ammo )
	self.Owner:ViewPunch( Angle( -5, 0, 0 ) )

end

--
-- Called when the rightmouse button is pressed
--
function SWEP:SecondaryAttack()
end

function SWEP:DrawConnection(data)
	for k,v in pairs(data) do
	
		if k == 1 then
			curent = v
			if curent == nil || !curent:IsValid() then 
				return
			end
		else 
		if v[1] == nil || !v[1]:IsValid() then
			table.remove(data, k)
			self:EmitSound("npc/roller/mine/combine_mine_deactivate1.wav")
			return
		end
			if math.random() > 0.8 then self:doEffect(curent:GetPos() + Vector(0,0,20), 
			v[1]:GetPos() + Vector(0,0,20), false)
			end
			self:DrawConnection(v)
		end
	end
end
function SWEP:OwnerChange(ent)
	self.sound:Stop()
end
function SWEP:OnRemove(ent)
	self.sound:Stop()
end
function SWEP:Holster(ent)
	self.sound:Stop()
end
function SWEP:OnDrop(ent)
	self.sound:Stop()
end
function SWEP:MakeConnection(data)
local flag = false
	for k,v in pairs(data) do
	if flag then break end
	if k == 1 then
			for num, ent in pairs(ents.GetAll()) do
			if ent==nil or not ent:IsValid() or v==nil or not v:IsValid() then else
				if ent != nil 
				&& ent:IsValid()
				&& ((ent:IsPlayer()&&ent != self.Owner&&GetConVarNumber("linkinglaser_linkplayers") == 1)
				||ent:IsNPC()
				||(ent:GetClass() == "prop_physics"&&GetConVarNumber("linkinglaser_linkprops") == 1)) 
				&& ent.linked != true 
				&& ent:GetPos():Distance(v:GetPos()) < self.radius then
					self.radius = 0
					local newdata = {}
					table.insert(newdata, ent)
					table.insert(data, newdata)
					ent.linked = true
					self.cooldown = -19
					flag = true
					self.linksound:Stop()
					self.linksound:Play()
				end
				end
				end
				if flag then break end
			else
			if !self:GetNetworkedBool("active") then return end
			self:MakeConnection(v)
		end
	end
end
function SWEP:Reload()
if !self:GetNetworkedBool("reloading") then
	if self:Clip1() < 100 && self:Ammo1() > 0 then
		self:SetNetworkedBool("reloading", true)
		self:EmitSound("npc/attack_helicopter/aheli_charge_up.wav")
		timer.Create( "reloadtimer"..self.Owner:GetName(), 0.01, 0, function()
		if self.Weapon == nil || !self.Weapon:IsValid() then
	return
end
			self.Weapon:SetClip1( self.Weapon:Clip1() + 1 )
			if math.random() > 0.2 then
			self.Owner:RemoveAmmo( 1, self.Weapon:GetPrimaryAmmoType() )
			end
			if self:Clip1() == 100 || self:Ammo1() == 0 then
				self:SetNetworkedBool("reloading", false)
				self:EmitSound("plats/hall_elev_door.wav")
				timer.Destroy("reloadtimer"..self.Owner:GetName())
			end
		end)
	else
		self:EmitSound("buttons/combine_button2.wav")
	end
	end
end
function SWEP:Think()
if self.Weapon == nil || !self.Weapon:IsValid() then
	self.sound:Stop()
end
if !self.Owner:Alive() then self.sound:Stop() end
if self:GetNetworkedBool("active") then
			self.VElements["beamlight_small"].size.x = math.random()*25 + 10
			self.VElements["beamlight_small"].size.y = math.random()*25 + 10
			self.VElements["beamlight"].size.y = math.random()*10 + 25
			self.VElements["beamlight"].size.x = math.random()*30 + 50
			self.WElements["beamlight"].size.y = math.random()*10 + 25
			self.WElements["beamlight"].size.x = math.random()*30 + 50
			self.rotSpeed = self.rotSpeed + 0.2
		else
		self.VElements["beamlight_small"].size.x = 0
		self.VElements["beamlight_small"].size.y = 0
		self.VElements["beamlight"].size.x = 0
		self.VElements["beamlight"].size.y = 0
		self.WElements["beamlight"].size.x = 0
		self.WElements["beamlight"].size.y = 0
		end
		--self.VElements["battery"].pos = Vector(0.1, 0+self.batpos, -4)
--self.WElements["battery"].pos = Vector(8.831, -2, -4.792+self.batpos)
		if self:GetNetworkedBool("reloading") &&  !self:GetNetworkedBool("active") then
	self.rotSpeed = -2
	if self.batpos < 0 then
	self.batpos = self.batpos + 0.1
	end
	if !self:GetNetworkedBool("reloading") && self.batpos > -3 then
	self.batpos = self.batpos - 0.1
end
end
if CLIENT then
if !self:GetNetworkedBool("active") && self.prongpos < 0 then
	self.prongpos = self.prongpos + 0.5
end
if self:GetNetworkedBool("active") && self.prongpos > -15 then
	self.prongpos = self.prongpos - 0.5
end

self.VElements["prongs"].pos = Vector(-22.778+self.prongpos, 0, 7.222)
if self:GetNetworkedBool("reloading") &&  self:GetNetworkedBool("active") then
--self.VElements["battery_light"].color = Color(200+math.random()*55,200+math.random()*55,0)
self.VElements["battery"].color = Color(200+math.random()*55,200+math.random()*55,0)
else
--self.VElements["battery_light"].color = Color(255 - self:Clip1()/100*255,self:Clip1()/100*180,self:Clip1()/100*255)
self.VElements["battery"].color = Color(self:Clip1()/100*255,self:Clip1()/100*255,self:Clip1()/100*255)
end
		self.rotSpeed = self.rotSpeed * 0.99
		
		self.VElements["spin"].angle = self.VElements["spin"].angle + Angle(0,self.rotSpeed,0)
		self.WElements["spin"].angle = self.WElements["spin"].angle + Angle(0,self.rotSpeed,0)
		end
self:DrawConnection(self.entities)
	if self:GetNetworkedBool("active") then
	if CLIENT then
	local dlight = DynamicLight( LocalPlayer():EntIndex() )
	if ( dlight ) then
		dlight.pos = LocalPlayer():GetShootPos()
		dlight.r = 0
		dlight.g = 180
		dlight.b = 255
		dlight.brightness = 2
		dlight.Decay = 1000
		dlight.Size = 512
		dlight.DieTime = CurTime() + 1
	end
	end
	if !self.precisefire then self:MakeConnection(self.entities) end
	
	if self.entities[1] != nil && self.entities[1]:IsValid() then
	self:doEffect(self.Owner:EyePos(), self.entities[1]:GetPos(), true)
	end
	
	if self:GetNetworkedBool("reloading") then
		self.sound:ChangePitch(200, 2)
		if self.radius > 400 then
			if math.random()>1 - self.radius/20000  then
				if self.Owner:Health() <= 1 then
					self.sound:Stop()
				end
			end
		end
		if SERVER then
		self.damage = self.damage + 1
		self.radius = self.radius + 7
		if self:Ammo1() < 1 then
			self:SetNetworkedBool("active", false)
		end
			--self.Owner:RemoveAmmo( 1, self.Weapon:GetPrimaryAmmoType() )
		end
	else 
	self.sound:ChangePitch(100, 1)
	end
	
	if CLIENT then
	else
	
	
	--self.Weapon:SetClip1( self.Weapon:Clip1() - 1 )	
	self.radius = self.radius + 8
	
	if SERVER then
	
	self.damage = self.damage + 2
	end
	
	if self.precisefire then
	else
	
	end
	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		if self.entities[1]!= null && self.entities[1]:IsValid()&&(self.precisefire&&self.entities[1]:Health() < self.damage) || (!self.precisefire && !self.Owner:KeyDown(IN_ATTACK)) || (self.precisefire && self.Owner:KeyDown(IN_ATTACK)) || self.Weapon:Clip1() < 1 then
		if self:GetNetworkedBool("reloading") then
			timer.Simple(3, function()
			self.sound:Stop()
			end)
			self.sound:ChangePitch(0,3)
		else
			timer.Simple(1, function()
			self.sound:Stop()
			end)
			self.sound:ChangePitch(0,1)
		end
		self:EmitSound("weapons/airboat/airboat_gun_lastshot1.wav")
		self:SetNetworkedBool("active", false)
		self.entities = {}
		self:SetNetworkedInt("cooldown", 100)
		end
			self.Owner:ViewPunch( Angle( math.random()*2 - 1, math.random()*2 - 1, math.random()*2 - 1 ) )
	end
	end
end



function SWEP:Initialize()

	// other initialize code goes here
	self:SetWeaponHoldType( self.HoldType )
	self.Owner.OnTakeDamage = function(dmginfo)
		if dmginfo:GetDamage() > self.Owner:Health() then
			self.sound:Stop()
		end
	end
	self:SetNetworkedBool("active", false)
	self.entities = {}
	self:SetNetworkedInt("cooldown", 0)
	self.radius = 0
	self.sound = CreateSound( self, "linkinglaser/fire.wav" )
	self.linksound = CreateSound( self, "weapons/stunstick/stunstick_impact1.wav" )
	self.rotSpeed = 0
	self.batpos = 0
	if CLIENT then
		self.prongpos = 0
	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end
			end
		end
		
	end

end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end



