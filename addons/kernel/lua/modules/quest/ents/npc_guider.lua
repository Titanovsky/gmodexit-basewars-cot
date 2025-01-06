local C = AMB.G.C

local ENT = {}

ENT.Class       = 'quest_guider'
ENT.Base	    = 'base_ai'
ENT.Type	    = 'ai'

ENT.PrintName	= 'NPC Guider'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Quest' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'NPC',
    model = 'models/Barney.mdl',
    module = 'guide',
    date = '16.03.2021 21:53:26'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:DrawTranslucent()

        AMB.Entities.Draw( self, false )

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 800 ) then return end

        local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90
        local head_bone = self:LookupBone( 'ValveBiped.Bip01_Head1' )
        local head = self:GetBonePosition( head_bone )

        cam.Start3D2D( head + Vector( 0, 0, 12 ), Angle( 0, rot, 90 ), 0.1 )

            draw.SimpleTextOutlined( 'NPC Солдат', '26 Ambition', 4, 0, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        cam.End3D2D()

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

    if ( AMB.Quest.GetPlayerQuestID( ePly ) == 1 ) then return end

    ePly:SendLua( 'AMB.Quest.OpenMenu()' )

end