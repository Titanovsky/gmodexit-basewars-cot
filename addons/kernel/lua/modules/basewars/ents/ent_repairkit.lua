local C, SND = AMB.G.C, AMB.G.SND

local ENT = {}

ENT.Class       = 'bw_repairkit'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Ремонтный Комплект'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Basewars' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/props_lab/reciever01d.mdl',
    module = 'basewars',
    date = '30.04.2021 17:44:59'

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

    AMB.Entities.Initialize( self, self.Stats.model )
    AMB.Entities.Physics( self, nil, nil, nil, true, true )

end

function ENT:StartTouch( eObj )

    if not IsValid( eObj ) then return end

    if ( eObj:GetClass() == 'bw_moneyprinter' ) then

        local hp, max = eObj:Health(), eObj:GetMaxHealth()

        if ( hp < max ) then

            self:Remove()
            eObj:SetHealth( hp + 50 )
            if ( eObj:Health() > max ) then eObj:SetHealth( max ) end

        end

    end

end