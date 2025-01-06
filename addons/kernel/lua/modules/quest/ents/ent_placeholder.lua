local ENT = {}

ENT.Class       = 'quest_placeholder'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Placeholder'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Quest' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/hunter/plates/plate3x5.mdl',
    material = 'models/wireframe',
    module = 'guide',
    date = '16.03.2021 21:36:39'

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

    AMB.Entities.Initialize( self, self.Stats.model, self.Stats.material )
    AMB.Entities.Physics( self, MOVETYPE_NONE, SOLID_VPHYSICS, COLLISION_GROUP_WEAPON, false, false, false )
    self:SetTrigger( true )

end

function ENT:Touch( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if not AMB.Quest.GetPlayerQuest( ePly ) then return end

    local self_quest_id, self_quest_step, self_quest_count = AMB.Quest.GetEntityQuestID( self ), AMB.Quest.GetEntityQuestStep( self ), AMB.Quest.GetEntityQuestCount( self )
    if not self_quest_id or ( self_quest_id <= 0 ) then return end
    if ( self_quest_id ~= AMB.Quest.GetPlayerQuestID( ePly ) ) then return end
    if ( self_quest_step ~= AMB.Quest.GetPlayerQuestStep( ePly ) ) then return end

    AMB.Quest.AddCount( ePly, self_quest_count, self_quest_id, self_quest_step )

end
