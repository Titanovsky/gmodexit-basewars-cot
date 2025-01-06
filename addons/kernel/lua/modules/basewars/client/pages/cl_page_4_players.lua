local C, GUI, UT = AMB.G.C, AMB.UI.GUI, AMB.Utility

local w = ScrW()
local h = ScrH()

local COLOR_PANEL = Color( 0, 0, 0, 80 )
local COLOR_MAIN_FRAME = Color( 45, 45, 48 )

local DrawBox, DrawText, DrawTextOutline = draw.RoundedBox, draw.SimpleText, draw.SimpleTextOutlined

local tooltip = 'Scoreboard меню показывает таблицу с игроками\nПозволяет выполнять различные действия с игроками с помощью панели информаций о игроке'

local function RemoveAdminButtons( vguiFrame )

    for _, btn in pairs( vguiFrame.admin_buttons ) do 

        btn:Remove() 
        
    end

    vguiFrame.admin_buttons = nil

end

local function ShowAdminButtons( vguiFrame, ePly )
    
    local panel = vguiFrame

    if vguiFrame.admin_buttons then RemoveAdminButtons( vguiFrame ) return end

    local _goto = GUI.DrawButton( panel, 46, 24, panel:GetWide() / 2 - 46 * 3, panel:GetTall() - 24 - 4, nil, nil, nil, function( self )

        LocalPlayer():ConCommand( 'adm goto "'..AMB.Gamemode.GetStats( ePly, 'Gamename' )..'"' )

    end, function( self, w, h )

        DrawBox( 6, 0, 0, w, h, C.AMB_WHITE )
        DrawTextOutline( 'Goto', '20 Ambition', w / 2, h / 2, C.AMB_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.AMB_BLACK )

    end ) 

    local _bring = GUI.DrawButton( panel, 46, 24, panel:GetWide() / 2 - 44 * 2, panel:GetTall() - 24 - 4, nil, nil, nil, function( self )

        LocalPlayer():ConCommand( 'adm bring "'..AMB.Gamemode.GetStats( ePly, 'Gamename' )..'"' )

    end, function( self, w, h )

        DrawBox( 6, 0, 0, w, h, C.AMB_WHITE )
        DrawTextOutline( 'Bring', '20 Ambition', w / 2, h / 2, C.AMB_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.AMB_BLACK )

    end ) 

    local _return = GUI.DrawButton( panel, 52, 24, panel:GetWide() / 2 - 38, panel:GetTall() - 24 - 4, nil, nil, nil, function( self )

        LocalPlayer():ConCommand( 'adm return "'..AMB.Gamemode.GetStats( ePly, 'Gamename' )..'"' )

    end, function( self, w, h )

        DrawBox( 6, 0, 0, w, h, C.AMB_WHITE )
        DrawTextOutline( 'Return', '20 Ambition', w / 2, h / 2, C.AMB_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.AMB_BLACK )

    end ) 

    local _kick = GUI.DrawButton( panel, 40, 24, panel:GetWide() / 2 + 18, panel:GetTall() - 24 - 4, nil, nil, nil, function( self )

        LocalPlayer():ConCommand( 'adm kick "'..AMB.Gamemode.GetStats( ePly, 'Gamename' )..'" !' )

    end, function( self, w, h )

        DrawBox( 6, 0, 0, w, h, C.AMB_WHITE )
        DrawTextOutline( 'Kick', '20 Ambition', w / 2, h / 2, C.FLAT_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.AMB_BLACK )

    end )

    vguiFrame.admin_buttons = { 

        _goto, _bring, _return, _kick 
        
    }

end

local function GetColorClan( cColor )

    local r, g, b = cColor.r, cColor.g, cColor.b
    if ( r <= 60 ) and ( g <= 60 ) and ( b <= 60 ) then return Color( 200, 200, 200 ) end

    return cColor

end

local page = AMB.UI.MainMenu.Pages.AddPage( 4, 'Игроки', C.ABS_WHITE )
AMB.UI.MainMenu.Pages.SetPage( page, function( vguiFrame ) 

    local Ranks =  AMB.Adminus.Ranks
    
    local frame, main = GUI.Ambition.DrawFrame( vguiFrame, 640, 600, 0, 0, '', tooltip, function() 

        AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )

    end )
    frame:Center()

    local main = GUI.DrawPanel( main, main:GetWide(), main:GetTall(), 0, 0, function( self, ww, hh )

        DrawTextOutline( 'Scale Off', '18 Arial Bold', 4, 4, C.RU_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( w..'x'..h, '18 Arial Bold', 4 * 2 + UT.GetTextSizeX( 'Scale Off', '18 Arial Bold' ), 4, C.AMB_ORANGE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( self:GetParent():GetWide()..'x'..self:GetParent():GetTall()+32, '18 Arial Bold', 4 * 3 + UT.GetTextSizeX( 'Scale Off', '18 Arial Bold' ) + UT.GetTextSizeX( w..'x'..h, '18 Arial Bold' ), 4, C.ABS_YELLOW, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        DrawTextOutline( #player.GetHumans()..'/'..game.MaxPlayers(), '18 Arial Bold', ww - 4, 4, C.ABS_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

    end )

    local frame = AMB.UI.GUI.DrawScrollPanel( main, main:GetWide(), main:GetTall() - 25, 0, 25, function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, COLOR_MAIN_FRAME ) end )
    local sbar = frame:GetVBar()
    sbar:SetSize( 0, 0 )

    local panels = {}
    for id, ply in ipairs( player.GetAll() ) do
        
        if not IsValid( ply ) then end

        local panel = GUI.DrawButton( frame, frame:GetWide(), 54, 0, ( 54 + 4 ) * ( id - 1 ), nil, nil, nil, function( self ) 
        
            if not IsValid( ply ) then return end

            for k, v in ipairs( panels ) do

                if ( k > id ) then

                    local clicked = self.clicked
                    local x, y = v:GetPos()
                    local y, tall = clicked and y - 60 or y + 60, clicked and self:GetTall() - 60 or self:GetTall() + 60

                    v:MoveTo( x, y, 0.25, 0, -1, function() end )
                    self:SizeTo( self:GetWide(), tall, 0.26, 0, -1, function() end )

                    if ( k == #panels ) then self.clicked = not clicked end
                    
                elseif ( k == #panels ) then

                    local clicked = self.clicked
                    local x, y = v:GetPos()
                    local y, tall = clicked and y - 60 or y + 60, clicked and self:GetTall() - 60 or self:GetTall() + 60

                    self:SizeTo( self:GetWide(), tall, 0.26, 0, -1, function() end )
                    self.clicked = not clicked

                end

            end

            if ( Ranks.GetRank( LocalPlayer() ) ~= 'user' ) then ShowAdminButtons( self, ply ) end
            
         end, function( self, w, h ) 
        
            if not IsValid( ply ) then 
            
                RemoveAdminButtons( self )

                return 
                
            end

            local name = ply:IsAuth() and AMB.Gamemode.GetStats( ply, 'Gamename' ) or ( ply:IsBot() and ply:Nick() or 'Заходит..' )
            draw.RoundedBox( 4, 0, 0, w, h, self.color ) 
            draw.SimpleText( name, '28 Arial', 4 + 50 + 8, 2, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

            draw.SimpleText( 'Ping', '16 Arial', w - 24, 30, C.AMB_GRAY, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
            draw.SimpleText( ply:IsBot() and 'BOT' or ply:Ping(), '20 Arial', w - 35, 12, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

            draw.SimpleText( 'Deaths', '16 Arial', w - 24 - 56, 30, C.AMB_GRAY, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
            draw.SimpleText( ply:Deaths(), '20 Arial', w - 24 - 38 * 2, 12, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

            draw.SimpleText( 'Frags', '16 Arial', w - 24 - 60 * 2, 30, C.AMB_GRAY, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
            draw.SimpleText( ply:Frags(), '20 Arial', w - 24 - 45 * 3, 12, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

            if ply:IsClan() then

                local clan = AMB.Clans.PlayerGetClan( ply )
                draw.SimpleTextOutlined( clan.name, '20 Arial', 4 + 50 + 8, 30, GetColorClan( clan.color ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

            end

        end )
        GUI.OnCursorButton( panel, function( self ) 

            self.color = ColorAlpha( self.color, 120 )
            self:SetCursor( 'arrow' )

        end, function( self ) 
        
            self.color = COLOR_PANEL 
            
        end )
        panel.color = COLOR_PANEL

        panels[ #panels + 1 ] = panel

        local avatar = GUI.DrawPanel( panel, 50, 50, 4, 2, function( self, w, h ) 
        
            if not IsValid( ply ) then return end

            DrawBox( 0, 0, 0, w, 2, AMB.Clans.PlayerGetColor( ply ) ) -- top
            DrawBox( 0, 0, h - 2, w, 2, AMB.Clans.PlayerGetColor( ply ) ) -- bottom
            DrawBox( 0, w - 2, 0, 2, h, AMB.Clans.PlayerGetColor( ply ) ) -- right
            DrawBox( 0, 0, 0, 2, h, AMB.Clans.PlayerGetColor( ply ) ) -- left
            if ply:IsBot() then DrawTextOutline( '◔◡◔', '32 Arial', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK ) end

        end )

        if not ply:IsBot() then

            AMB.UI.GUI.DrawAvatar( avatar, avatar:GetWide() - 4, avatar:GetTall() - 4, 2, 2, 72, ply )

            local workaround = GUI.DrawButton( avatar, avatar:GetWide(), avatar:GetTall(), 0, 0, nil, nil, nil, function() 

                if not IsValid( ply ) then 

                    if ValidPanel( avatar ) then avatar:Remove() end

                    return 
                    
                end

                ply:ShowProfile()

            end, function( self, w, h ) end )

        end

    end

end )