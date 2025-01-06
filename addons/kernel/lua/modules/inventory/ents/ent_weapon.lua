local C = AMB.G.C

local ENT = {}

ENT.Class       = 'inv_weapon'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Weapon Replace'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Inventory' )
ENT.Spawnable   = false

ENT.Stats = {

    type = 'Entity',
    model = 'models/weapons/w_irifle.mdl',
    module = 'inventory',
    date = '05.05.2021 21:03:58'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:DrawTranslucent()

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 600 ) then return end

        AMB.Entities.Draw( self, false )

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 400 ) then return end

        local pos = self:GetPos()
        local _, bounds = self:GetModelBounds()
	    local ang = Angle( 0, 0, 90 )
        local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90

        cam.Start3D2D( pos + Vector( 0, 0, bounds.z ) + ang:Up() * 1 + ang:Right() * -8 + ang:Forward() * -1, Angle( 0, rot, 90 ), 0.1 )

		    draw.SimpleTextOutlined( AMB.NW.GetString( self, 'Header' ), '28 Ambition', 4, 0, C.FLAT_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
            
	    cam.End3D2D()

    end

    AMB.Entities.Register( ENT.Class, 'ents', ENT )

    return

end 

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model )
    AMB.Entities.Physics( self, MOVETYPE_VPHYSICS, SOLID_VPHYSICS, COLLISION_GROUP_WEAPON, true, true )

end

function ENT:SetHeader( sHeader )

    AMB.NW.SetString( self, 'Header', sHeader or '' )

end

function ENT:SetWeapon( sClass )

    self.weapon = sClass or ''
    self:SetHeader( sClass )

end

function ENT:GetWeaponClass()

    return self.weapon

end

function ENT:Use( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if ePly:KeyDown( IN_WALK ) then return end 

    if self.weapon then 

        ePly:Give( self.weapon, true )
        self:Remove()

    end

end
