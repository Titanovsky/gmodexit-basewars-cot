local C = AMB.G.C

local ENT = {}

ENT.Class       = 'mine_copper'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Медь'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Mine' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/props_junk/rock001a.mdl',
    module = 'mine',
    color_name = Color( 184, 115, 51 ),
    date = '20.03.2021 01:10:01'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:DrawTranslucent()

        AMB.Entities.Draw( self, false )

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 440 ) then return end

        local _, max = self:GetRotatedAABB( self:OBBMins(), self:OBBMaxs() )
        local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90
        local center = self:LocalToWorld( self:OBBCenter() )

        cam.Start3D2D( center + Vector( 0, 0, 12 ), Angle( 0, rot, 90 ), 0.1 )

            draw.SimpleTextOutlined( 'Медь', '32 Ambition', 4, -4, self.Stats.color_name, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
            draw.SimpleTextOutlined( 'x'..self:GetNWInt( 'Count' ), '24 Ambition', 4, 26, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        cam.End3D2D()

    end

    return

end 

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model, nil, self.Stats.color_name )
    AMB.Entities.Physics( self, MOVETYPE_VPHYSICS, SOLID_VPHYSICS, COLLISION_GROUP_WEAPON, true, true )
    self:SetHealth( 120 )
    self:SetCount( 1 )
    self:SetTrigger( true )

end

function ENT:AddCount( nCount )

    nCount = math.floor( nCount )

    local count = AMB.NW.GetInt( self, 'Count' )
    local value = count + nCount
    if ( value <= 0 ) then self:Remove() return end

    AMB.NW.SetInt( self, 'Count', value )

end

function ENT:Touch( eObj )

    if not IsValid( eObj ) or ( eObj:GetClass() ~= self:GetClass() ) then return end

    local new_count = AMB.NW.GetInt( eObj, 'Count' )
    
    timer.Simple( math.random( 0.15, 1.75 ), function()

        if not IsValid( self ) then return end
        if not IsValid( eObj ) then return end

        self:AddCount( new_count )
        eObj:Remove()

    end )

end

function ENT:SetCount( nCount )

    nCount = math.floor( nCount )

    if ( nCount <= 0 ) then self:Remove() return end

    AMB.NW.SetInt( self, 'Count', nCount )

end

function ENT:OnTakeDamage( dmgInfo )

    local damage, hp = dmgInfo:GetDamage(), self:Health()

    self:SetHealth( hp - damage )

    if ( self:Health() <= 0 ) and IsValid( self ) then self:Remove() end

end
