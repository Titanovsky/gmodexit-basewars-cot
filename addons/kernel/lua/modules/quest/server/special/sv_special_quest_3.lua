local C, SND, Quest = AMB.G.C, AMB.G.SND, AMB.Quest
local Check, Add = Quest.CheckPlayer, Quest.AddCount

local quest = 3

local step = 1
hook.Add( 'AmbitionClansConnectedPlayer', 'AMB.Quest.ForQuest3', function( ePly, nClan, tClan )

    if Check( ePly, quest, step ) then Add( ePly, 1, quest, step ) end

end )
hook.Add( 'AmbitionClansCreateClan', 'AMB.Quest.ForQuest3', function( ePly, nClan, tClan )

    if ePly and Check( ePly, quest, step ) then Add( ePly, 1, quest, step ) end

end )

local step = 2
hook.Add( 'AmbitionClansSetBalance', 'AMB.Quest.ForQuest3', function( ePly, nMoney, bPut, nClan, tClan )

    if Check( ePly, quest, step ) and bPut then Add( ePly, nMoney, quest, step ) end

end )

local step = 3
hook.Add( 'AmbitionClansCapture', 'AMB.Quest.ForQuest3', function( ePly, sChunk, bOwnerZone )

    if Check( ePly, quest, step ) then Add( ePly, 1, quest, step ) end

end )

local step = 4
hook.Add( 'PlayerUse', 'AMB.Quest.ForQuest3', function( ePly, eObj )

    if Check( ePly, quest, step ) and ( eObj:GetClass() == 'quest_guider' ) then Add( ePly, 1, quest, step ) return false end

end )