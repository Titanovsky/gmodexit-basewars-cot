local CFG = AMB.Quest.Config
local C = AMB.G.C

function AMB.Quest.AddEntity( eEnt, nQuestID, nQuestStep, nQuestCount )

    if not eEnt or not IsValid( eEnt ) then AMB.ErrorLog( 'Quest', 'Entity has not valid' ) return end
    if not nQuestID or not nQuestStep then AMB.ErrorLog( 'Quest', 'Unspecified nQuestID or nQuestStep' ) return end
    if ( nQuestID <= 0 ) or ( nQuestStep <= 0 ) then AMB.ErrorLog( 'Quest', 'nQuestID and nQuestStep <= 0' ) return end
    nQuestCount = nQuestCount or 1

    AMB.NW.SetInt( eEnt, 'Quest', nQuestID )
    AMB.NW.SetInt( eEnt, 'QuestStep', nQuestStep )
    AMB.NW.SetInt( eEnt, 'QuestCount', nQuestCount )

    AMB.Debug( function() 
    
        MsgC( C.ABS_RED, '[DEBUG] ', C.ABS_WHITE, 'Quest.AddEntity '..tostring( eEnt )..' Quest[ Q:'..nQuestID..' S:'..nQuestStep..' C:'..nQuestCount..' ]\n' )
        
    end )

end

hook.Add( 'OnNPCKilled', 'AMB.Quest.Verification', function( eNPC, eAttacker, eInflictor )

    if not IsValid( eAttacker ) or not eAttacker:IsPlayer() then return end
    if not AMB.Quest.GetPlayerQuest( eAttacker ) then return end

    local npc_quest_id, npc_quest_step, npc_quest_count, player_quest_id, player_quest_step = AMB.Quest.GetEntityQuestID( eNPC ), AMB.Quest.GetEntityQuestStep( eNPC ), AMB.Quest.GetEntityQuestCount( eNPC ), AMB.Quest.GetPlayerQuestID( eAttacker ), AMB.Quest.GetPlayerQuestStep( eAttacker )
    if not npc_quest_id or ( npc_quest_id <= 0 ) then return end
    if ( npc_quest_id ~= player_quest_id ) or ( npc_quest_step ~= player_quest_step ) then return end

    AMB.Debug( function() 
    
        MsgC( C.ABS_RED, '[DEBUG] ', C.ABS_WHITE, 'Quest '..tostring( eAttacker )..' to killed '..tostring( eNPC )..' Quest NPC[ Q: '..npc_quest_id..' S: '..npc_quest_step..' C: '..npc_quest_count..' ]\n' )
        
    end )

    AMB.Quest.AddCount( eAttacker, npc_quest_count, npc_quest_id, npc_quest_step )

end )

hook.Add( 'PlayerUse', 'AMB.Quest.Verification', function( ePly, eObj )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if not AMB.Quest.GetPlayerQuest( ePly ) then return end
    
    local ent_quest_id, ent_quest_step, ent_quest_count = AMB.Quest.GetEntityQuestID( eObj ), AMB.Quest.GetEntityQuestStep( eObj ), AMB.Quest.GetEntityQuestCount( eObj )
    local player_quest_id, player_quest_step = AMB.Quest.GetPlayerQuestID( ePly ), AMB.Quest.GetPlayerQuestStep( ePly )
    
    if not ent_quest_id or ( ent_quest_id <= 0 ) then return end
    if ( ent_quest_id ~= player_quest_id ) or ( ent_quest_step ~= player_quest_step ) then return end

    AMB.Quest.AddCount( ePly, ent_quest_count, ent_quest_id, ent_quest_step )

end )