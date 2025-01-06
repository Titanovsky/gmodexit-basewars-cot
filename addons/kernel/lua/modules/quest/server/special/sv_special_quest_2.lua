local C, SND, Quest = AMB.G.C, AMB.G.SND, AMB.Quest
local Check, Add = Quest.CheckPlayer, Quest.AddCount

local quest = 2

local step = 1
hook.Add( 'ShowSpare2', 'AMB.Quest.ForQuest2', function( ePly )

    if Check( ePly, quest, step ) then Add( ePly, 1, quest, step ) end

end )

timer.Simple( 1, function()

    hook.Add( 'PlayerSay', 'das', function( ePly, sText )

        local text = string.lower( sText )

        if ( text == '/stopsound' ) and Check( ePly, quest, 2 ) then Add( ePly, 1, quest, 2 ) end
        if ( text == '/kit starter' ) and Check( ePly, quest, 3 ) then Add( ePly, 1, quest, 3 ) end

    end )

end )

local step = 4
hook.Add( 'AmbitionEconomicBuyWeapon', 'AMB.Quest.ForQuest2', function( ePly, sTag, tItem )

    if Check( ePly, quest, step ) then Add( ePly, 1, quest, step ) end
    if Check( ePly, quest, 13 ) and ( sTag == 'weapon_laserlink' ) then Add( ePly, 1, quest, 13 ) end

end )

local step = 5
hook.Add( 'AmbitionGamemodeBuyAutoAmmo', 'AMB.Quest.ForQuest2', function( ePly )

    if Check( ePly, quest, step ) then Add( ePly, 1, quest, step ) end

end )

local step = 7
hook.Add( 'PlayerSpawnedProp', 'AMB.Quest.ForQuest2', function( ePly )

    if Check( ePly, quest, step ) then Add( ePly, 1, quest, step ) end

end )

local step = 8
hook.Add( 'CanTool', '123123', function( ePly, _, sTool )

    if ( sTool == 'precision' ) and Check( ePly, quest, step ) then Add( ePly, 1, quest, step ) end

end )

local step = 9
hook.Add( 'AmbitionEconomicBuyEntity', 'AMB.Quest.ForQuest2', function( ePly, sTag, tItem )

    if Check( ePly, quest, step ) and ( sTag == 'moneyprinter1' ) then Add( ePly, 1, quest, step ) end
    if Check( ePly, quest, 10 ) and ( sTag == 'repair_kit' ) then Add( ePly, 1, quest, 10 ) end

end )

local step = 11
hook.Add( 'OnNPCKilled', 'AMB.Quest.ForQuest2NPCKilled', function( eNPC, eKiller )

    if not IsValid( eKiller ) or not eKiller:IsPlayer() then return end
    if ( eNPC:GetClass() ~= 'npc_combine_s' ) then return end

    if Check( eKiller, quest, step ) then Add( eKiller, 1, quest, step ) end

end )

local step = 14
hook.Add( 'AmbitionEconomicSendSeller', 'AMB.Quest.ForQuest2', function( ePly, eObj )

    if Check( ePly, quest, step ) and ( eObj:GetClass() == 'acwatt_optic_aimpoint' ) then Add( ePly, 1, quest, step ) end

end )

local step = 16
hook.Add( 'AmbitionGamemodeUpLevel', 'AMB.Quest.ForQuest2', function( ePly, nOldLevel, nNewLevel )

    if ePly:IsPlayer() and Check( ePly, quest, step ) and ( nOldLevel >= 4 ) then Add( ePly, 1, quest, step ) end

end )

local step = 18
hook.Add( 'PlayerUse', 'AMB.Quest.ForQuest2', function( ePly, eObj )

    if Check( ePly, quest, step ) and ( eObj:GetClass() == 'quest_guider' ) then Add( ePly, 1, quest, step ) return false end

end )