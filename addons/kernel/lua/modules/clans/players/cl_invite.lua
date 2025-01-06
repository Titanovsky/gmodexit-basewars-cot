local w = ScrW()
local h = ScrH()

local C = AMB.G.C

CreateClientConVar( 'amb_clan_off_invite', '0', true )

function AMB.Clans.ShowInvite( nIndex )

    if GetConVar( 'amb_clan_off_invite' ):GetBool() then return end
    if AMB.Clans.PlayerIsClan( LocalPlayer() ) then return end
    if not AMB.Clans.GetClan( nIndex ) then return end

    local CFG = AMB.Clans.Config
    local clan = AMB.Clans.GetClan( nIndex )

    local frame = AMB.UI.GUI.DrawFrame( nil, 240, 160, 8, 32, '', false, false, false, function( self, w, h ) 
    
        draw.RoundedBox( 0, 0, 0, w, h, ColorAlpha( C.ABS_BLACK, 200 ) ) 
        draw.SimpleTextOutlined( clan.name, '28 Ambition', w / 2, 4, clan.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
                
    end )

    local accept = AMB.UI.GUI.DrawButton( frame, 140, 26, frame:GetWide() / 2 - 140 / 2, frame:GetTall() - 26 - 4, nil, nil, nil, function()

        AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )
        frame:Remove() 

        if AMB.Clans.PlayerIsClan( LocalPlayer() ) then return end

        net.Start( 'amb_clans_players_accept_invite' )
        net.SendToServer()

    end, function( self, w, h ) 

        local text = not AMB.Clans.PlayerIsClan( LocalPlayer() ) and 'Принять' or 'Отказать'
        local text_color = not AMB.Clans.PlayerIsClan( LocalPlayer() ) and C.AMB_GREEN or C.AMB_RED

        draw.RoundedBox( 4, 0, 0, w, h, C.AMB_BLACK )
        draw.SimpleTextOutlined( text..' ('..math.floor( timer.TimeLeft( 'AMBTimeClanInvite' ) )..')', '20 Ambition', w / 2, h / 2, text_color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

    end )

    timer.Create( 'AMBTimeClanInvite', CFG.invite_delay - 1, 1, function() 

        if not ValidPanel( frame ) then return end

        frame:Remove()

    end )

end

net.Receive( 'amb_clans_players_to_invite', function()

    local ID = net.ReadUInt( 16 )

    AMB.Clans.ShowInvite( ID )

end )