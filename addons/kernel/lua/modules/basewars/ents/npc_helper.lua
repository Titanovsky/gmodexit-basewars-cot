local ENT = {}

ENT.Class       = 'bw_helper'
ENT.Base	    = 'base_ai'
ENT.Type	    = 'ai'

ENT.PrintName	= 'NPC Helper'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Basewars' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'NPC',
    model = 'models/Eli.mdl',
    module = 'basewars',
    date = '04.03.2021 19:35:16'

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
    AMB.Entities.Hull( self )
    AMB.Entities.Physics( self, MOVETYPE_NONE, SOLID_BBOX, COLLISION_GROUP_PLAYER, false, false, true )
    AMB.Entities.Capability( self, CAP_ANIMATEDFACE )
    AMB.Entities.Capability( self, CAP_TURN_HEAD )

end

function ENT:Use( ePly )

    ePly:Kill()

end
