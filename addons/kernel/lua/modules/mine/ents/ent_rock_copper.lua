local C = AMB.G.C

local ENT = {}

ENT.Class       = 'mine_rock_copper'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Камень [Медь]'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Mine' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/props_wasteland/rockgranite02b.mdl',
    module = 'mine',
    color = Color( 184, 115, 51 ),
    date = '15.04.2021 22:04:53'

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
    
        local rand = math.random( 0, 25 )
        if ( rand == 25 ) then

            local rock, rock_count = ents.Create( 'mine_copper' ), math.random( 1, 4 )
            rock:SetPos( self:GetPos() + Vector( 0, 0, 12 ) )
            rock:Spawn()
            rock:SetCount( rock_count )

            timer.Simple( 25, function()  

                if IsValid( rock ) then rock:Remove() end

            end )

        end

        attacker:AddXPEco( math.random( 2, 6 ) )
        self:Remove() 
        
    end

    local attacker = dmgInfo:GetAttacker()
    if IsValid( attacker ) and attacker:IsPlayer() and IsValid( attacker:GetActiveWeapon() ) and AMB.Mine.Config.mine_tools_for_extract[ attacker:GetActiveWeapon():GetClass() ] then

        local rand_type, rand_successful = Random( 0, 4 ), Random( 1, 4 )
        if ( rand_successful >= 1 ) and ( rand_successful <= 3 ) then return end

        local rand_count = ( rand_type == 4 ) and Random( 0, 2 ) or Random( 0, 3 )
        if ( rand_count == 0 ) then return end

        attacker:AddItemInv( ( rand_type == 4 ) and 'copper' or 'stone', rand_count )

        local name, color = ( rand_type == 4 ) and 'Медь' or 'Камень', ( rand_type == 4 ) and Color( 203, 109, 81 ) or Color( 123, 159, 176 )
        local _text, _color, _type, _time = name..' ( x'..rand_count..' )', color, 7, 1.5
        AMB.Re.Notify( attacker, { text = _text, color = _color, type = _type, time = _time } )

    end

end