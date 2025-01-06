local C = AMB.G.C

local ENT = {}

ENT.Class       = 'mine_rock_iron'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Камень [Железо]'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Mine' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/props_wasteland/rockgranite02b.mdl',
    module = 'mine',
    color = Color( 125, 156, 173 ),
    date = '19.03.2021 14:52:19'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:DrawTranslucent()

        AMB.Entities.Draw( self, false )

    end

    return

end 

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model, nil, self.Stats.color )
    AMB.Entities.Physics( self, MOVETYPE_VPHYSICS, SOLID_VPHYSICS, COLLISION_GROUP_NONE, false, false, true )
    self:SetHealth( 250 )

end

local Random = math.random

function ENT:OnTakeDamage( dmgInfo )
	
    local attacker = dmgInfo:GetAttacker()
    if not IsValid( attacker ) or not attacker:IsPlayer() then return end
    
    local wep = attacker:GetActiveWeapon()
    if not IsValid( wep ) or ( wep:GetClass() ~= 'weapon_laserlink' ) then return end

    self:SetHealth( self:Health() - dmgInfo:GetDamage() )

    if ( self:Health() <= 0 ) then 
    
        local rand = math.random( 0, 3 )
        if ( rand == 3 ) then

            local rock, rock_count = ents.Create( 'mine_iron' ), math.random( 1, 4 )
            rock:SetPos( self:GetPos() + Vector( 0, 0, 12 ) )
            rock:Spawn()
            rock:SetCount( rock_count )

            timer.Simple( 60, function()  

                if IsValid( rock ) then rock:Remove() end

            end )

        end

        attacker:AddXPEco( math.random( 1, 4 ) )
        self:Remove() 
        
    end

    local attacker = dmgInfo:GetAttacker()
    if IsValid( attacker ) and attacker:IsPlayer() and IsValid( attacker:GetActiveWeapon() ) and AMB.Mine.Config.mine_tools_for_extract[ attacker:GetActiveWeapon():GetClass() ] then

        local rand_type, rand_successful = tobool( Random( 0, 1 ) ), Random( 0, 1 )
        if ( rand_successful == 0 ) then return end

        local rand_count = rand_type and Random( 1, 4 ) or Random( 1, 6 )

        attacker:AddItemInv( rand_type and 'iron' or 'stone', rand_count )

        local name, color = rand_type and 'Железо' or 'Камень', rand_type and C.AMB_GRAY or Color( 123, 159, 176 )
        local _text, _color, _type, _time = name..' ( x'..rand_count..' )', color, 7, 1.5
        AMB.Re.Notify( attacker, { text = _text, color = _color, type = _type, time = _time } )

    end

end
