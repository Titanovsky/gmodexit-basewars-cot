local CFG = AMB.Quest.Config
local GUI = AMB.UI.GUI
local UT = AMB.Utility
local C = AMB.G.C

local w = ScrW()
local h = ScrH()

local COLOR_PANEL = Color( 0, 0, 0, 240 )
local COLOR_QUEST = Color( 20, 0, 100, 100 )

AMB.Quest.ready_quests = AMB.Quest.ready_quests or {}

function AMB.Quest.OpenMenu()

    local CFG = AMB.Quest.Config
    local quests = AMB.Quest.Config.quests

    local frame = GUI.DrawFrame( nil, 340, 290, 0, 0, nil, true, true, true, function( self, w, h ) 

        draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )

    end )
    frame:Center()

    for id, quest in ipairs( quests ) do

        local name = id..'. '..quest.name
        local name_size = UT.GetTextSizeX( id..'. '..quest.name, '20 Ambition' )
        local panel = GUI.DrawPanel( frame, name_size + 10, 32, 4, 4 + ( 32 + 4 ) * ( id - 1 ), function( self, w, h ) 

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_QUEST )
            draw.SimpleText( name, '20 Ambition', 4, h / 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

        end )

        local ready = AMB.Quest.ready_quests[ id ]
        local name, color, font = ready and 'Пройден' or 'Взять', ready and C.AMBITION or C.AMB_GREEN, '16 Ambition'
        local text_size_x = UT.GetTextSizeX( name, font )
        local take = GUI.DrawButton( frame, text_size_x + 6, 32, 4 + panel:GetWide() + 4, 4 + ( 32 + 4 ) * ( id - 1 ), nil, nil, nil, function()

            if AMB.Quest.GetPlayerQuest( LocalPlayer() ) then return end
            if not LocalPlayer():Alive() then return end
            if ready then return end

            net.Start( CFG.net_take_quest )
                net.WriteUInt( id, 4 )
            net.SendToServer()

            frame:Remove()

        end, function( self, w, h ) 

            draw.RoundedBox( 4, 0, 0, w, h, color )
            draw.SimpleTextOutlined( name, font, w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )

    end

end

net.Receive( CFG.net_send_ready_quests_to_client, function() table.Merge( AMB.Quest.ready_quests, net.ReadTable() ) end )