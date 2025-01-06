local w = ScrW()
local h = ScrH()

local C = AMB.G.C

local cvar_enable = CreateClientConVar( 'amb_quest_hud_enable', '1', true )

hook.Add( 'HUDPaint', 'AMB.Quest.HUD', function()

    if not cvar_enable:GetBool() then return end

    local quest = AMB.Quest.GetPlayerQuest( LocalPlayer() )
    if not quest then return end

    draw.RoundedBox( 4, 12, 12, 280, 50, C.AMB_BLACK )
    draw.RoundedBoxEx( 4, 12, 12, 280, 20, C.AMBITION, true, true )

    draw.SimpleTextOutlined( quest.name or '', '22 Ambition', 12 + 2, 10, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
    draw.SimpleTextOutlined( '[ '..AMB.Quest.GetPlayerQuestStep( LocalPlayer() )..'/'..#quest.steps..' ]', '14 Ambition', 288, 16, C.ABS_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

    local player_quest_step, step, player_quest_count = AMB.Quest.GetPlayerQuestStep( LocalPlayer() ), quest.steps[ AMB.Quest.GetPlayerQuestStep( LocalPlayer() ) ], AMB.Quest.GetPlayerQuestCount( LocalPlayer() )
    draw.SimpleTextOutlined( player_quest_step..'. '..step.desc, '20 Ambition', 12 + 2, 40, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
    if step.count and ( step.count > 1 ) then draw.SimpleTextOutlined( player_quest_count..'/'..step.count, '20 Ambition', 288, 40, C.ABS_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK ) end

end )