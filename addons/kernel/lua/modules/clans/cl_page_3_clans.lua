local CFG = AMB.Clans.Config
local GUI = AMB.UI.GUI
local C = AMB.G.C
local SND = AMB.G.SND

local w = ScrW()
local h = ScrH()

local COLOR_PANEL = Color( 0, 0, 0, 160 )
local COLOR_PANEL2 = Color( 53, 56, 92, 220 )
local COLOR_MEMBERS_PANEL = Color( 20, 20, 20, 120 )

local tooltip = '3. Клан\n\nМеню создания клана, или если вы состоите в нём, редактирования\nМожно прочекать баланс, пригласить, уволить, улучшить'
local tooltop_block_symbols = 'Запрещены:\n\n\' \n\" \n` \n/ \n\\ \n| \n;'

local block_symbols = {

    [ '\'' ] = true,
    [ '"' ] = true,
    [ '/' ] = true,
    [ '\\' ] = true,
    [ '|' ] = true,
    [ '`' ] = true,
    [ ';' ] = true

}

local tax_amount = {}
for i = CFG.tax_xp_min, CFG.tax_xp_max + 0.01, 0.01 do 

    tax_amount[ i ] = i
    
end

local function CallTextFrame( nText, bNumeric, fAction )

    local frame = GUI.DrawFrame( nil, 300, 140, 0, 0, nil, true, true, true, function( self, w, h ) 

        draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL2 )
        draw.SimpleText( nText, '22 Ambition', 4, 22, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

    end )
    frame:Center()

    local text = GUI.DrawTextEntry( frame, frame:GetWide() - 8, 40, 4, 52, '18 Ambition', C.ABS_BLACK, nil, C.AMB_GRAY, 'Вводить здесь', false, bNumeric )

    local send = GUI.DrawButton( frame, 120, 32, frame:GetWide() / 2 - 120 / 2, frame:GetTall() - 32 - 4, '20 Ambition Bold', C.AMB_BLACK, 'Выполнить', function() 
    
        fAction( text:GetValue() ) 
        frame:Remove()

    end )

end

local function GetPercent( nMax, nCount )

    return math.Round( nCount * 100 / nMax, 1 )

end

local pages_clan = {

    [ '1. Инфо' ] = { access = 0, func = function( vguiFrame, vguiPage )

        local clan = AMB.Clans.PlayerGetClan( LocalPlayer() )
        local id = AMB.Clans.PlayerGetClanID( LocalPlayer() )
        local online = AMB.Clans.GetClanOnlineMembers( id )

        local chunks = AMB.Territory.GetChunksCapter()
        local chunks_all, chunks_clan = #chunks, clan.territory
        local precent_chunks = GetPercent( chunks_all, chunks_clan )

        local frame = GUI.DrawPanel( vguiFrame, vguiFrame:GetWide(), vguiFrame:GetTall(), 0, 0, function( self, w, h ) 

            local id = AMB.Clans.PlayerGetClanID( LocalPlayer() )
            if ( id == -1 ) then return end

            local clan = AMB.Clans.PlayerGetClan( LocalPlayer() )
            if not clan then return end

            local online = AMB.Clans.GetClanOnlineMembers( id )

            draw.SimpleText( 'Название: '..clan.name..' ['..id..']', '20 Ambition', 4, 4, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Лидер: '..clan.leader, '20 Ambition', 4, 4 + 20 * 1, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Уровень: '..clan.level..' [ '..clan.xp..' / '..clan.nxp..' ]', '20 Ambition', 4, 4 + 20 * 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            local margin = AMB.Utility.GetTextSizeX( 'Уровень: '..clan.level..' [ '..clan.xp..' / '..clan.nxp..' ]', '20 Ambition' ) + 10
            draw.SimpleText( AMB.Clans.GetClanTag( id ), '16 Ambition', margin, 6 + 20 * 2, C.AMB_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Баланс: '..clan.balance..'$', '20 Ambition', 4, 4 + 20 * 3, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Внутренний Налог: '..( clan.tax * 100 )..'%', '20 Ambition', 4, 4 + 20 * 4, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Внешний Налог: '..AMB.Clans.CalcOuterTax( id )..'$', '20 Ambition', 4, 4 + 20 * 5, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Участники: '.. #clan.members ..' / '.. AMB.Clans.GetClanSlots( id ), '20 Ambition', 4, 4 + 20 * 6, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            local margin = AMB.Utility.GetTextSizeX( 'Участники: '.. #clan.members ..' / '.. AMB.Clans.GetClanSlots( id ), '20 Ambition' ) + 10
            draw.SimpleText( 'Online: '.. #online, '16 Ambition', 4 + margin, 6 + 20 * 6, C.AMB_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Улучшения: '.. clan.upgrade ..' / 6', '20 Ambition', 4, 4 + 20 * 7, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Территорий: '.. chunks_clan ..' / '.. chunks_all ..' ('.. precent_chunks ..'%)', '20 Ambition', 4, 4 + 20 * 8, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

            draw.SimpleText( 'Имя: '.. AMB.Gamemode.GetStats( LocalPlayer(), 'Gamename' ), '20 Ambition', 4, 4 + 20 * 10, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'ИД: '.. LocalPlayer():SteamID(), '20 Ambition', 4, 4 + 20 * 11, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Ранг: '.. AMB.Clans.PlayerGetRank( LocalPlayer() ), '20 Ambition', 4, 4 + 20 * 12, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            local margin = AMB.Utility.GetTextSizeX( 'Ранг: '.. AMB.Clans.PlayerGetRank( LocalPlayer() ), '20 Ambition' ) + 10
            draw.SimpleText( AMB.Clans.PlayerGetRankName( LocalPlayer() ), '20 Ambition', margin + 4, 4 + 20 * 12, C.AMBITION, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'Доступ: '.. AMB.Clans.PlayerGetAccess( LocalPlayer() ), '20 Ambition', 4, 4 + 20 * 13, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

        end )

        local leave = GUI.DrawButton( frame, 120, 32, frame:GetWide() / 2 - 120 / 2, frame:GetTall() - 32 - 8, nil, nil, nil, function()

            AMB.UI.MainMenu.Pages.ClosePage( 3, vguiFrame )
            AMB.UI.MainMenu.ShowMenu()
            vguiFrame:GetParent():Remove()

            if not AMB.Clans.PlayerIsClan( LocalPlayer() ) then return end

            if AMB.Clans.PlayerIsLeader( LocalPlayer() ) then
            
                local confirm = AMB.UI.GUI.Ambition.DrawConfirmPanel( 0, 0, 'Вы хотите удалить клан за '..string.Comma( CFG.register_remove_clan_pay )..'$ ?', 'Да', 'Нет', function()

                    if not AMB.Clans.PlayerIsClan( LocalPlayer() ) then return end
                    if not AMB.Clans.PlayerIsLeader( LocalPlayer() ) then return end
                    if ( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) < CFG.register_remove_clan_pay ) then return end
                    if ( AMB.Clans.GetClanLevel( id ) == 5 ) then return end

                    net.Start( 'amb_clans_remove_clan' )
                    net.SendToServer()

                end )
                confirm:Center()

            else

                local confirm = AMB.UI.GUI.Ambition.DrawConfirmPanel( 0, 0, 'Вы точно хотите выйти из клана ?', 'Выйти', 'Остаться', function()

                    if not AMB.Clans.PlayerIsClan( LocalPlayer() ) then return end
                    if AMB.Clans.PlayerIsLeader( LocalPlayer() ) then return end

                    net.Start( 'amb_clans_players_leave' )
                    net.SendToServer()

                end )
                confirm:Center()

            end

        end, function( self, w, h ) 

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )

            local text = AMB.Clans.PlayerIsLeader( LocalPlayer() ) and 'Удалить' or 'Выйти'
            draw.SimpleText( text, '24 Ambition', w / 2, h / 2, C.AMB_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

        end )

        if ( AMB.Clans.GetClanLevel( id ) == 5 ) and AMB.Clans.PlayerIsLeader( LocalPlayer() ) then leave:Remove() end

        if AMB.Clans.PlayerIsLeader( LocalPlayer() ) then

            local change_leader = GUI.DrawButton( frame, 80, 26, frame:GetWide() / 2 - 80 / 2, frame:GetTall() - 32 - 8 - 26 - 4, nil, nil, nil, function()

                if not AMB.Clans.PlayerIsLeader( LocalPlayer() ) then return end

                CallTextFrame( 'Введите SteamID участника, которому хотите передать Клан', false, function( sValue )

                    if not AMB.Clans.PlayerIsLeader( LocalPlayer() ) then return end
                    if not sValue then return end

                    net.Start( 'amb_clans_hand_over' )
                        net.WriteString( sValue )
                    net.SendToServer()

                end )

            end, function( self, w, h ) 

                draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )

                draw.SimpleText( 'Передать', '20 Ambition', w / 2, h / 2, C.AMB_BLUE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

            end )

        end

    end },

    [ '2. Баланс' ] = { access = 0, func = function( vguiFrame, vguiPage ) 

        local clan = AMB.Clans.PlayerGetClan( LocalPlayer() )
        local id = AMB.Clans.PlayerGetClanID( LocalPlayer() )
        local frame = GUI.DrawPanel( vguiFrame, vguiFrame:GetWide(), vguiFrame:GetTall(), 0, 0, function( self, w, h ) 

            local clan = AMB.Clans.PlayerGetClan( LocalPlayer() )
            draw.SimpleTextOutlined( string.Comma( clan.balance )..'$', '24 Ambition', w / 2, 6, ( clan.balance >= 0 ) and C.AMB_GREEN or C.AMB_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
            draw.SimpleTextOutlined( 'Outer Tax: '..string.Comma( AMB.Clans.CalcOuterTax( id ) )..'$ / Day', '18 Ambition', w / 2, 100, C.RU_PINK, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        end )

        local put = GUI.DrawButton( frame, 100, 32, frame:GetWide() / 2 - 100 - 4, 46, nil, nil, nil, function() 
        
            CallTextFrame( 'Какую сумму Вы хотите положить?', true, function( sValue ) 

                if not sValue then return end
                if not AMB.Clans.PlayerIsClan( LocalPlayer() ) then return end

                local summ = math.floor( tonumber( sValue ) )
                if not summ then return end
                if ( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) < summ ) then return end

                net.Start( 'amb_clans_change_balance' )
                    net.WriteBool( true )
                    net.WriteUInt( summ, 24 )
                net.SendToServer()

            end )

        end, function( self, w, h ) 

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
            draw.RoundedBox( 0, 0, h - 4, w, 4, C.FLAT_GREEN )
            draw.SimpleText( 'Положить', '20 Ambition Bold', w / 2, 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

        end )

        if ( AMB.Clans.PlayerGetAccess( LocalPlayer() ) < 5 ) then return end

        local take = GUI.DrawButton( frame, 100, 32, frame:GetWide() / 2 + 6, 46, nil, nil, nil, function()

            CallTextFrame( 'Какую сумму Вы хотите снять?', true, function( sValue ) 

                if not sValue then return end
                if ( AMB.Clans.PlayerGetAccess( LocalPlayer() ) < 5 ) then return end

                local summ = math.floor( tonumber( sValue ) )
                if not summ then return end
                if ( summ > clan.balance ) then return end
            
                net.Start( 'amb_clans_change_balance' )
                    net.WriteBool( false )
                    net.WriteUInt( summ, 24 )
                net.SendToServer()

            end )

        end, function( self, w, h ) 

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
            draw.RoundedBox( 0, 0, h - 4, w, 4, C.FLAT_RED )
            draw.SimpleText( 'Взять', '20 Ambition Bold', w / 2, 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

        end )

    end },

    [ '3. Магазин' ] = { access = 1, func = function( vguiFrame, vguiPage ) end },

    [ '4. Участники' ] = { access = 3, func = function( vguiFrame, vguiPage ) 

        local id = AMB.Clans.PlayerGetClanID( LocalPlayer() )
        local clan = AMB.Clans.PlayerGetClan( LocalPlayer() )
        local frame = GUI.DrawPanel( vguiFrame, vguiFrame:GetWide(), vguiFrame:GetTall(), 0, 0, function( self, w, h ) draw.SimpleText( 'Online: '..#AMB.Clans.GetClanOnlineMembers( id )..' / '..#clan.members, '30 Ambition', 6, 6, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK ) end )

        local members_panel = GUI.DrawScrollPanel( frame, frame:GetWide() - 8, frame:GetTall() - 50 - 4, 4, 50, function( self, w, h ) 

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_MEMBERS_PANEL )

        end )

        for i, member in ipairs( clan.members ) do

            local panel = GUI.DrawPanel( nil, members_panel:GetWide(), 48, 0, 52 * ( i - 1 ), function( self, w, h ) 

                draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
                draw.SimpleTextOutlined( member.name, '22 Ambition', 2, 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

                local margin = AMB.Utility.GetTextSizeX( member.name, '22 Ambition' )
                draw.SimpleTextOutlined( 'ИД: '..member.steamid..'   Ранг: '..member.rank, '14 Ambition', margin + 12, h - 4, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )

            end )
            members_panel:AddItem( panel )

            if ( AMB.Clans.PlayerGetAccess( LocalPlayer() ) < 3 ) then continue end

            local rankup = GUI.DrawButton( panel, 16, 16, 4, panel:GetTall() - 16 - 4, nil, nil, nil, function() 
        
                if not AMB.Clans.table[ id ].members[ i ] then AMB.Re.ChatError( 'Игрок не находится в клане' ) return end
                if ( AMB.Clans.PlayerGetAccess( LocalPlayer() ) < 3 ) then AMB.Re.ChatError( 'Доступ отказан' ) return end
                if ( member.rank >= 5 ) then AMB.Re.ChatError( 'Нельзя изменить ранг выше 5' ) return end
                if ( member.rank >= AMB.Clans.PlayerGetRank( LocalPlayer() ) ) then AMB.Re.ChatError( 'Нельзя изменить ранг со-клановцу с равным/старшим рангом' ) return end
                if ( member.steamid == LocalPlayer():SteamID() ) then AMB.Re.ChatError( 'Нельзя изменить ранг самому себе' ) return end

                net.Start( 'amb_clans_players_set_rank' )
                    net.WriteBit( true )
                    net.WriteString( member.steamid )
                net.SendToServer()

                member.rank = member.rank + 1

            end, function( self, w, h ) 

                draw.RoundedBox( 4, 0, 0, w, h, C.AMB_GREEN )
                draw.SimpleText( '+', '18 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

            end ) 

            local rankdown = GUI.DrawButton( panel, 16, 16, 4 + rankup:GetWide() + 4, panel:GetTall() - 16 - 4, nil, nil, nil, function() 
        
                if not AMB.Clans.table[ id ].members[ i ] then AMB.Re.ChatError( 'Игрок не находится в клане' ) return end
                if ( AMB.Clans.PlayerGetAccess( LocalPlayer() ) < 3 ) then AMB.Re.ChatError( 'Доступ отказан' ) return end
                if ( member.rank <= 1 ) then AMB.Re.ChatError( 'Нельзя изменить ранг ниже 1' ) return end
                if ( member.rank >= AMB.Clans.PlayerGetRank( LocalPlayer() ) ) then AMB.Re.ChatError( 'Нельзя изменить ранг со-клановцу с равным/старшим рангом' ) return end
                if ( member.steamid == LocalPlayer():SteamID() ) then AMB.Re.ChatError( 'Нельзя изменить ранг самому себе' ) return end

                net.Start( 'amb_clans_players_set_rank' )
                    net.WriteBit( false )
                    net.WriteString( member.steamid )
                net.SendToServer()

                member.rank = member.rank - 1

            end, function( self, w, h ) 

                draw.RoundedBox( 4, 0, 0, w, h, C.AMB_BLUE )
                draw.SimpleText( '-', '18 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

            end )

            if ( AMB.Clans.PlayerGetAccess( LocalPlayer() ) < 4 ) then continue end

            local demote = GUI.DrawButton( panel, 54, 16, 4 + rankup:GetWide() + 4 + rankdown:GetWide() + 4, panel:GetTall() - 16 - 4, nil, nil, nil, function( self ) 
        
                if not AMB.Clans.table[ id ].members[ i ] then AMB.Re.ChatError( 'Игрок не находится в клане' ) return end
                if ( AMB.Clans.PlayerGetAccess( LocalPlayer() ) < 4 ) then AMB.Re.ChatError( 'Доступ отказан' ) return end
                if ( member.rank >= AMB.Clans.PlayerGetRank( LocalPlayer() ) ) then AMB.Re.ChatError( 'Нельзя выгнать со-клановца с равным/старшим рангом' ) return end
                if ( member.steamid == LocalPlayer():SteamID() ) then AMB.Re.ChatError( 'Нельзя выгнать самого себя' ) return end

                net.Start( 'amb_clans_players_demote' )
                    net.WriteString( member.steamid )
                net.SendToServer()

                self:GetParent():Remove()

            end, function( self, w, h ) 

                draw.RoundedBox( 4, 0, 0, w, h, C.AMB_RED )
                draw.SimpleText( 'Выгнать', '16 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

            end )

        end

    end },

    [ '5. Настройки' ] = { access = 6, func = function( vguiFrame, vguiPage )

        local id = AMB.Clans.PlayerGetClanID( LocalPlayer() )
        local clan = AMB.Clans.PlayerGetClan( LocalPlayer() )
        local ranks = clan.ranks
        local frame = GUI.DrawPanel( vguiFrame, vguiFrame:GetWide(), vguiFrame:GetTall(), 0, 0, function( self, w, h ) end )

        local setting_ranks = GUI.DrawScrollPanel( frame, 160, 220, 4, 4, function( self, w, h ) 

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_MEMBERS_PANEL )

        end )

        local names = {}
        local accesses = {}

        for i, rank in ipairs( ranks ) do

            local name = GUI.DrawTextEntry( setting_ranks, 120, 28, 2, 30 * ( i - 1 ) + 2, '18 Ambition', C.ABS_BLACK, nil, C.AMB_GRAY, i..'. '..rank.name )
            setting_ranks:AddItem( name )

            names[ i ] = name

            if ( i == 1 ) or ( i == 6 ) then continue end
            
            local access = AMB.UI.GUI.DrawComboBox( setting_ranks, 32, 28, 2 + name:GetWide() + 2, 30 * ( i - 1 ) + 2, '18 Ambition', rank.access )
            for j = 1, 5 do access:AddChoice( j ) end
            setting_ranks:AddItem( access )

            accesses[ i ] = access            

        end

        accesses[ 1 ] = {}
        accesses[ 1 ].GetValue = function() return 0 end
        accesses[ 6 ] = {}
        accesses[ 6 ].GetValue = function() return 6 end


        local send = GUI.DrawButton( setting_ranks, 90, 24, setting_ranks:GetWide() / 2 - 90 / 2, setting_ranks:GetTall() - 24 - 8, nil, nil, nil, function()

            if ( AMB.Clans.PlayerGetAccess( LocalPlayer() ) < 6 ) then return end

            local new_ranks = {}

            for i = 1, 6 do
                
                local name_rank = AMB.Utility.StringIsNullOrWhitespaces( names[ i ]:GetValue() ) and ranks[ i ].name or names[ i ]:GetValue()
                new_ranks[ i ] = { name = name_rank, access = tonumber( accesses[ i ]:GetValue() ) }

            end

            net.Start( 'amb_clans_change_ranks' )
                net.WriteTable( new_ranks )
            net.SendToServer()

            AMB.Re.Notify( { text = 'Изменение рангов/доступов выполнено!', sound = 'ambition/bf5/collapse1.ogg', time = 4, color = C.AMB_BLUE, type = 4 } )

        end, function( self, w, h )

            draw.RoundedBox( 6, 0, 0, w, h, C.FLAT_GREEN )
            draw.SimpleTextOutlined( 'Изменить', '18 Ambition Bold', w / 2, h / 2, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )

    end },

}

local function ValidateString( sStr, nMaxLen, bBlockSymbols )

    if AMB.Utility.StringIsNullOrWhitespaces( sStr ) then return false end
    if ( utf8.len( sStr ) > nMaxLen ) then return false end
    for char, _ in pairs( block_symbols ) do 
        
        if not bBlockSymbols then return true end
        if string.match( sStr, char ) then return false end 
                
    end

    return true

end

local page = AMB.UI.MainMenu.Pages.AddPage( 3, 'Клан', C.AMB_WHITE )
AMB.UI.MainMenu.Pages.SetPage( page, function( vguiFrame )

    local frame, main = GUI.Ambition.DrawFrame( vguiFrame, 512, 428, 0, 0, 'Клан', tooltip, function() 

        AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )

    end )
    frame:Center()

    if not AMB.Clans.PlayerIsClan( LocalPlayer() ) then

        local wm, hm = main:GetWide(), main:GetTall()

        local verificated_name = true
        local panel_name = GUI.DrawPanel( main, wm - 8, 64, 4, 4, function( self, w, h )

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
            draw.SimpleText( 'Регистрация Клана', '20 Ambition Bold', w / 2, 2, C.AMB_ORANGE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
            draw.SimpleText( '1. Название', '24 Ambition', 4, h - 15, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( '( Максимум 24 символа,                                        )', '14 Ambition', 4, h - 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )

            local verif_text = verificated_name and '✓' or '✘'
            local verif_color = verificated_name and C.AMB_GREEN or C.AMB_RED
            draw.SimpleText( verif_text, '26 Ambition', w - 2, 0, verif_color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

        end )
        local list_block_symbols1 = AMB.UI.GUI.DrawButton( panel_name, 116, 16, 138, panel_name:GetTall() - 16 - 1, nil, nil, nil, nil, function( self, w, h )

            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL2 )
            draw.SimpleText( 'запретные символы', '14 Ambition', 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

        end )
        list_block_symbols1:SetTooltip( tooltop_block_symbols )
        AMB.UI.GUI.OnCursorButton( list_block_symbols1, function() surface.PlaySound( 'buttons/button16.wav' ) end )
        local name = GUI.DrawTextEntry( panel_name, 236, 28, panel_name:GetWide() - 236 - 2, panel_name:GetTall() - 28 - 2, '20 Ambition', C.ABS_BLACK, nil, C.AMB_GRAY, 'Введите название клана' )
        name.Think = function( self )

            local val = self:GetValue()

            verificated_name = ValidateString( val, 24, true )

        end

        local limit_words = 200
        local verificated_desc = false
        local margin_y = panel_name:GetTall() + 4
        local panel_desc = GUI.DrawPanel( main, wm - 8, 72, 4, margin_y + 2, function( self, w, h )

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
            draw.SimpleText( '2. Описание', '24 Ambition', 4, h - 15, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( '( Макс. 200 символов,                                        )', '14 Ambition', 4, h - 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( limit_words, '12 Ambition', 267, 16, C.AMB_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

            local verif_text = verificated_desc and '✓' or '✘'
            local verif_color = verificated_desc and C.AMB_GREEN or C.AMB_RED
            draw.SimpleText( verif_text, '26 Ambition', w - 2, 0, verif_color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

        end )
        local list_block_symbols2 = AMB.UI.GUI.DrawButton( panel_desc, 116, 16, 126, panel_desc:GetTall() - 16 - 1, nil, nil, nil, nil, function( self, w, h )

            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL2 )
            draw.SimpleText( 'запретные символы', '14 Ambition', 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

        end )
        list_block_symbols2:SetTooltip( tooltop_block_symbols )
        AMB.UI.GUI.OnCursorButton( list_block_symbols2, function() surface.PlaySound( 'buttons/button16.wav' ) end )
        local description = AMB.UI.GUI.DrawTextEntry( panel_desc, 236, 42, panel_desc:GetWide() - 236 - 2, panel_desc:GetTall() - 42 - 2, '20 Ambition', C.ABS_BLACK, nil, C.AMB_GRAY, 'Опишите кратко клан' )
        description:SetMultiline( true )
        description.Think = function( self )

            local val = self:GetValue()

            limit_words = 200 - utf8.len( val )

            verificated_desc = ValidateString( val, 200, true )

        end

        local verificated_tax = false
        local margin_y = margin_y + panel_desc:GetTall() + 2
        local panel_tax = GUI.DrawPanel( main, wm - 8, 56, 4, margin_y + 2, function( self, w, h )

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
            draw.SimpleText( '3. Налог', '24 Ambition', 4, h - 15, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( '( Налог на XP в процентах, собирается у игроков  '..(CFG.tax_xp_min * 100)..'%  <  Налог  <  '..(CFG.tax_xp_max * 100)..'% )', '14 Ambition', 4, h - 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )

            local verif_text = verificated_tax and '✓' or '✘'
            local verif_color = verificated_tax and C.AMB_GREEN or C.AMB_RED
            draw.SimpleText( verif_text, '26 Ambition', w - 2, 0, verif_color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

        end )
        local tax = AMB.UI.GUI.DrawComboBox( panel_tax, 90, 26, panel_tax:GetWide() - 90 - 2, panel_tax:GetTall() - 26 - 2, '18 Ambition', '%' )
        for amount, _ in pairs( tax_amount ) do tax:AddChoice( amount * 100 ) end
        tax.Think = function( self )

            local val = self:GetSelected()

            if not val and not tonumber( val ) then verificated_tax = false return end 
            if ( val < 15 ) and ( val > 75 ) then verificated_tax = false return end

            verificated_tax = true

        end

        local mixer_color = C.ABS_WHITE
        local verificated_color = false
        local margin_y = margin_y + panel_tax:GetTall() + 2
        local panel_color = GUI.DrawPanel( main, 300, 140, 4, margin_y + 2, function( self, w, h )

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
            draw.SimpleText( '4. Цвет', '24 Ambition', 4, h, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )

            local verif_text = verificated_color and '✓' or '✘'
            local verif_color = verificated_color and C.AMB_GREEN or C.AMB_RED
            draw.SimpleText( verif_text, '26 Ambition', w - 2, 0, verif_color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

            draw.SimpleTextOutlined( '•', '64 Ambition', w - 16, h - 2, mixer_color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )
            draw.SimpleTextOutlined( 'Клан', '14 Ambition', w - 14, h - 4, mixer_color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )

        end )
        local color = AMB.UI.GUI.DrawColorMixer( panel_color, 210, 110, panel_color:GetWide() - 210 - 2, panel_color:GetTall() - 110 - 2, C.ABS_WHITE, false, true, false )
        color.ValueChanged = function( self, cColor ) mixer_color = cColor verificated_color = true end

        local panel_info_outer_tax = GUI.DrawPanel( main, 202, 140, 4 + panel_color:GetWide() + 2, margin_y + 2, function( self, w, h )

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
            draw.SimpleText( 'Внешний Налог', '28 Ambition', w / 2, 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
            draw.SimpleText( '• Внешний налог взимает с', '18 Ambition', 2, 32, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'баланса клана определённую', '18 Ambition', 2, 32 + 16, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'сумму денег.', '18 Ambition', 2, 32 + 16 * 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( '19.000$ + 1.000$ * Участники', '16 Ambition', w / 2, 32 + 16 * 3.5, C.AMB_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
            draw.SimpleText( '* Все участники (offline и online)', '14 Ambition', 2, h - 12, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( '** Взимается раз в сутки', '14 Ambition', 2, h, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )

        end )

        local verif_full = false
        local register = AMB.UI.GUI.DrawButton( main, 180, 42, wm / 2 - 180 / 2, main:GetTall() - 42 - 6, nil, nil, nil, function()

            if AMB.Clans.PlayerIsClan( LocalPlayer() ) then surface.PlaySound( SND.ERROR ) return end
            if not verif_full then surface.PlaySound( SND.ERROR ) return end

            local name = name:GetValue()
            local desc = description:GetValue()
            local tax = tonumber( tax:GetValue() ) / 100
            local color = color:GetColor()
            color = Color( color.r, color.g, color.b, color.a )

            net.Start( 'amb_clans_register_clan' )
                net.WriteString( name )
                net.WriteString( desc )
                net.WriteFloat( tax )
                net.WriteColor( color )
            net.SendToServer()

            AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )
            frame:Remove() 

        end, function( self, w, h ) 

            local verif_color = verif_full and C.AMB_GREEN or C.AMB_RED

            draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL2 )
            draw.SimpleTextOutlined( 'Создать ('..string.Comma( CFG.register_pay )..'$)', '24 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

            draw.RoundedBox( 0, 0, 0, w, 2, verif_color )
            draw.RoundedBox( 0, 0, h - 2, w, 2, verif_color )
            draw.RoundedBox( 0, 0, 0, 2, h, verif_color )
            draw.RoundedBox( 0, w - 2, 0, 2, h, verif_color )

        end )
        register.Think = function()

            if ( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) >= CFG.register_pay ) and verificated_color and verificated_tax and verificated_desc and verificated_name then verif_full = true return end
            
            verif_full = false

        end

        return

    end

    local sidebar = GUI.DrawScrollPanel( main, 128, main:GetTall(), 0, 0, function( self, w, h ) 

        draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )

    end )
    local general = GUI.DrawScrollPanel( main, main:GetWide() - 128, main:GetTall(), 128, 0, function( self, w, h ) end )

    pages_clan[ '1. Инфо' ].func( general, frame ) 

    local access = tonumber( AMB.Clans.PlayerGetAccess( LocalPlayer() ) )
    local i = 0
    for page_name, page_tab in SortedPairs( pages_clan ) do

        if access and ( access >= page_tab.access ) then

            local page = GUI.DrawButton( sidebar, sidebar:GetWide() - 4, 32, 2, 2 + 32 * i, '18 Ambition', nil, page_name, function() 
            
                general:Clear()
                page_tab.func( general ) 
                
            end )

            i = i + 1

        end

    end

end )