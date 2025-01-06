local C = AMB.G.C
local GUI = AMB.UI.GUI

local w = ScrW()
local h = ScrH()

local margin_frame = 54

local COLOR_MAIN_PANEL = ColorAlpha( C.ABS_BLACK, 240 )
local COLOR_PANEL = Color( 0, 0, 0, 100 )

local DrawBox, DrawText, DrawTextOuline = draw.RoundedBox, draw.SimpleText, draw.SimpleTextOutlined

local function GetItemIcon( nSlot )

    local item = LocalPlayer():GetItemInv( nSlot )
    if not item or item.empty then return end

    local options = item.options
    if options and options.icon then return Material( options.icon ) end

    local item_class = AMB.Inventory.Config.objects[ item.class ]
    if not item_class then return end

    local icon = item_class.icon
    if not icon then return end

    return Material( 'ambition/'..AMB.Config.server_dir..'/inventory/icons/'..icon..'.png', 'noclamp' )

end

local function GetItemModelIcon( nSlot )

    local item = LocalPlayer():GetItemInv( nSlot )
    if not item or item.empty then return end

    local options = item.options
    if options and options.model then return options.model end

    local item_class = AMB.Inventory.Config.objects[ item.class ]
    if not item_class then return end

    return item_class.model

end

local function GetItemName( sClass )

    return AMB.Inventory.Config.objects[ sClass ].name or ''

end

local function GetFontSize( sStr )

    if not sStr then return end

    return 32 - #sStr

end

local pages = { 

    { name = 'Контракты' },
    { name = 'Наборы' },

}
local page_color = ColorAlpha( C.AMB_BLUE, 50 )

local function DrawButtons( vguiFrame )

    local pw, ph = vguiFrame:GetWide(), vguiFrame:GetTall()

    local buttons = GUI.DrawPanel( vguiFrame, pw, ph / 20, 2, 2, function( self, w, h )

        DrawBox( 0, 0, 0, w, h, C.AMB_PANEL )

    end )

    local page1 = GUI.DrawButton( buttons, pw / #pages - 2, 20, 2, 2, nil, nil, nil, function()
    end, function( self, w, h ) 

        DrawBox( 4, 0, 0, w, h, page_color )
        DrawText( pages[ 1 ].name, '18 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end )

    local page2 = GUI.DrawButton( buttons, pw / #pages - 4, 20, page1:GetWide() + 2 * 2, 2, nil, nil, nil, function()
    end, function( self, w, h ) 

        DrawBox( 4, 0, 0, w, h, page_color )
        DrawText( pages[ 2 ].name, '18 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end )

    return buttons:GetTall()

end

local function DrawCraft( vguiFrame, nOffsetY )

    local pw, ph = vguiFrame:GetWide(), vguiFrame:GetTall()

    local list = GUI.DrawScrollPanel( vguiFrame, pw, ph / 3.2, 2, nOffsetY + 4, function( self, w, h )

        DrawBox( 0, 0, 0, w, h, C.AMB_PANEL )
        DrawText( 'Craft', '54 Arial', w / 2 + 2, h / 2 + 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end )

end

local page = AMB.UI.MainMenu.Pages.AddPage( 1, 'Персонаж', C.ABS_WHITE )
AMB.UI.MainMenu.Pages.SetPage( page, function( vguiFrame ) 

    local frame, main = GUI.Ambition.DrawFrame( vguiFrame, vguiFrame:GetWide() - margin_frame * 2, vguiFrame:GetTall() - margin_frame * 2, margin_frame, margin_frame, 'Инвентарь', 'Он деревянными членами торгует!', function() 

        AMB.UI.MainMenu.Pages.ClosePage( page )

    end )
    
    local mw, mh = main:GetWide(), main:GetTall()

    local panel_info = GUI.DrawPanel( main, mw / 6, mh - 4 * 2, 4, 4, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL ) end )
    local margin_x = 4 + panel_info:GetWide() + 4
    local fps = math.floor( 1 / FrameTime() ) -- DEBUG
    local delay = 0 -- DEBUG
    local panel_model = GUI.DrawPanel( main, mw / 3, mh - 4 * 2, margin_x, 4, function( self, pw, ph )
    
        draw.RoundedBox( 0, 0, 0, pw, ph, COLOR_PANEL ) 

        draw.SimpleTextOutlined( 'FPS '..fps, '22 Ambition', 2, 2, C.AMB_YELLOW, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleTextOutlined( w..'x'..h, '22 Ambition', 2, 2 + 18 * 1, C.FLAT_YELLOW, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleTextOutlined( mw..'x'..mh, '22 Ambition', 2, 2 + 18 * 2, C.FLAT_YELLOW, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleTextOutlined( 'Scale On', '18 Ambition', 2, 2 + 20 * 3, C.AMB_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        if CurTime() >= delay then -- DEBUG

            delay = CurTime() + 1
            fps = math.floor( 1 / FrameTime() )

        end
        
    end )
    local margin_x = margin_x + panel_model:GetWide() + 4
    local panel_other = GUI.DrawPanel( main, mw - panel_info:GetWide() - panel_model:GetWide() - 4 * 4, mh - 4 * 2, margin_x, 4, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL ) end )

    -- ## Panel Info ########
    local informatin = GUI.DrawPanel( panel_info, panel_info:GetWide(), panel_info:GetTall(), 0, 0, function( self, w, h )

        --draw.SimpleText( '', '26 Ambition', w / 2, 4, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
        --draw.SimpleText( '', '26 Ambition', w / 2, 4, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

        draw.SimpleTextOutlined( 'Stats', '26 Ambition', w / 2, 4, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        draw.SimpleText( '1. '..LocalPlayer():EntIndex(), '14 Ambition', 2, 30 + 16 * 1, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '2. '..LocalPlayer():SteamID(), '14 Ambition', 2, 30 + 16 * 2, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '3. '..LocalPlayer():SteamID64(), '14 Ambition', 2, 30 + 16 * 3, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '4. P '..LocalPlayer():Ping(), '14 Ambition', 2, 30 + 16 * 4, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '5. K '..LocalPlayer():Frags(), '14 Ambition', 2, 30 + 16 * 5, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '6. D '..LocalPlayer():Deaths(), '14 Ambition', 2, 30 + 16 * 6, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '7. % '..math.Round( LocalPlayer():Frags()/ LocalPlayer():Deaths(), 2 ), '14 Ambition', 2, 30 + 16 * 7, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '8. '..math.floor( CurTime() ), '14 Ambition', 2, 30 + 16 * 8, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '9. '..LocalPlayer():Nick(), '14 Ambition', 2, 30 + 16 * 9, C.ABS_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

        draw.SimpleText( '10. '..AMB.Gamemode.GetStats( LocalPlayer(), 'Gamename' ), '14 Ambition', 2, 45 + 16 * 10, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '11. '..string.Comma( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) )..'$', '14 Ambition', 2, 45 + 16 * 11, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '12. '..AMB.Gamemode.GetStats( LocalPlayer(), 'Level' )..' LVL', '14 Ambition', 2, 45 + 16 * 12, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '13. '..AMB.Gamemode.GetStats( LocalPlayer(), 'XP' )..' / '..AMB.Gamemode.GetStats( LocalPlayer(), 'NXP' ), '14 Ambition', 2, 45 + 16 * 13, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '14. Skin '..AMB.Gamemode.GetStats( LocalPlayer(), 'Skin' ), '14 Ambition', 2, 45 + 16 * 14, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

        draw.SimpleText( '15. HP '..LocalPlayer():Health(), '14 Ambition', 2, 60 + 16 * 15, C.FLAT_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '16. ARM '..LocalPlayer():Armor(), '14 Ambition', 2, 60 + 16 * 16, C.FLAT_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '17. MDL '..LocalPlayer():GetModel(), '14 Ambition', 2, 60 + 16 * 17, C.FLAT_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        local wep = IsValid( LocalPlayer():GetActiveWeapon() ) and LocalPlayer():GetActiveWeapon():GetClass() or ''
        draw.SimpleText( '18. WEP '.. wep, '14 Ambition', 2, 60 + 16 * 18, C.FLAT_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

        if not AMB.Clans.PlayerIsClan( LocalPlayer() ) then return end

        local clan = AMB.Clans.PlayerGetClan( LocalPlayer() )
        local id = AMB.Clans.PlayerGetClanID( LocalPlayer() )
        draw.SimpleText( '19. ID '..id, '14 Ambition', 2, 75 + 16 * 19, C.FLAT_PURPLE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.SimpleText( '20. '..clan.name, '14 Ambition', 2, 75 + 16 * 20, C.FLAT_PURPLE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

    end )

    -- ## 3D Model #####
    local model = vgui.Create( 'DModelPanel', panel_model )
    model:SetSize( panel_model:GetWide(), panel_model:GetTall() )
    model:SetModel( LocalPlayer():GetModel() ) 
    model:SetAnimated( true )
    model.Entity.GetPlayerColor = function( vColor ) return LocalPlayer():GetPlayerColor() end

    -- ## Other (Inventory, Craft, Buttons) ########
    local pw, ph = panel_other:GetWide(), panel_other:GetTall()

    -- Buttons
    local return_y = DrawButtons( panel_other )
    DrawCraft( panel_other, return_y )

    -- Inventory
    local CFG = AMB.Inventory.Config

    local inventory = GUI.DrawScrollPanel( panel_other, pw - 6 * 2, ph / 1.6, 10, ph - ph / 1.6, function( self, w, h ) end )
    local shells = GUI.DrawGrid( inventory, inventory:GetWide() / 5, inventory:GetTall() / 4, 0, 0, 5 )

    for id = 1, CFG.max_slots do

        local shell = GUI.DrawPanel( nil, shells:GetColWide() - 4, shells:GetRowHeight() - 4, 0, 0, function( self, w, h ) 
    
            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL )
            --draw.SimpleTextOutlined( id, '14 Ambition', 2, 2, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        
        end )
        shells:AddItem( shell )

        local icon = GetItemIcon( id )
        local start_item = LocalPlayer():GetItemInv( id )

        local slot = GUI.DrawPanel( shell, shell:GetWide(), shell:GetTall(), 0, 0, function( self, w, h ) 

            local item = LocalPlayer():GetItemInv( id )
            if item.empty then return end

            if icon then 

                surface.SetMaterial( icon )
                surface.SetDrawColor( 255, 255, 255, 255 )
                surface.DrawTexturedRect( self:GetWide()/2 - 32, self:GetTall()/2 - 32, 64, 64 )

            end

            local name = GetItemName( item.class )
            if item.options then 
            
                if item.options.class then name = item.options.class end
                if item.options.name then name = item.options.name end

            end

            local count = ( item.count > 1 ) and 'x'..item.count or ''

            draw.SimpleTextOutlined( name, GetFontSize( name )..' Ambition', w / 2, 0, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
            draw.SimpleTextOutlined( count, '16 Ambition', w / 2, 18, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

            if ( item == start_item ) then return end

            icon = GetItemIcon( id ) 
            start_item = item

        end )

        local mdl = nil
        local model = GetItemModelIcon( id )
        if model then

            mdl = vgui.Create( 'ModelImage', slot )
            mdl:SetSize( 54, 54 )
            mdl:SetPos( slot:GetWide() / 2 - 54/2, slot:GetTall() - 50 )
            mdl:SetModel( model )

        end

        local item = LocalPlayer():GetItemInv( id )

        if item.empty then continue end

        local drop = GUI.DrawButton( slot, 34, 18, slot:GetWide() - 34 - 2, slot:GetTall() - 18 - 2, nil, nil, nil, function( self )

            local item = LocalPlayer():GetItemInv( id )
            if item.empty then return end

            if ValidPanel( mdl ) then mdl:Remove() end

            net.Start( AMB.Inventory.Config.net_drop_item )
                net.WriteUInt( id, 8 )
                net.WriteUInt( item.count, 16)
            net.SendToServer()

        end, function( self, w, h ) 

            local item = LocalPlayer():GetItemInv( id )
            if item.empty then return end

            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL )
            draw.SimpleTextOutlined( 'Drop All', '16 Ambition', 2, 2, C.AMB_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        end )

        if not CFG.objects[ item.class ].use then continue end

        local use = GUI.DrawButton( slot, 34, 18, 2, slot:GetTall() - 18 - 2, nil, nil, nil, function( self )

            if not CFG.objects[ item.class ].use then return end
            local item = LocalPlayer():GetItemInv( id )
            if item.empty then return end

            if ValidPanel( mdl ) then mdl:Remove() end

            if ( item.count == 1 ) then self:Remove() end

            net.Start( AMB.Inventory.Config.net_use_item )
                net.WriteUInt( id, 8 )
            net.SendToServer()

        end, function( self, w, h ) 

            local item = LocalPlayer():GetItemInv( id )
            if item.empty then return end

            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL )
            draw.SimpleTextOutlined( 'Use', '16 Ambition', 2, 2, C.AMB_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        end )

    end
    -- ##############################
    --[[

    for id = 1, 12 do
        
        local shell = AMB.UI.GUI.DrawPanel( nil, grid:GetColWide() - 6, grid:GetRowHeight() - 6, 0, 0, function( self, w, h ) 
    
            draw.RoundedBox( 4, 0, 0, w, h, ColorAlpha( C.ABS_BLACK, 248 ) )
            --draw.SimpleTextOutlined( id, '22 Ambition', w / 2, 6, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        
        end )
        grid:AddItem( shell )

        local icon = not AMB.Inventory.inv[ id ].is_empty and Material( 'ambition/'..AMB.Config.server_dir..'/inv_icon/'..AMB.Inventory.inv[ id ].icon, 'noclamp' ) or ''
    
        local slot = AMB.UI.GUI.DrawPanel( shell, shell:GetWide(), shell:GetTall(), 0, 0, function( self, w, h ) 
    
            draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 0, 0 ) )

            if AMB.Inventory.inv[ id ].is_empty then return end

            draw.SimpleTextOutlined( AMB.Inventory.inv[ id ].name or '', '22 Ambition', w / 2, 0, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
            draw.SimpleTextOutlined( 'x'..AMB.Inventory.inv[ id ].count or '', '16 Ambition', w / 2, 18, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

            surface.SetMaterial( icon )
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.DrawTexturedRect( w / 2 - 32, 34, 64, 64 )
        
        end )
        AMB.Inventory.inv[ id ].panel = slot

    end
    ]]
    --[[
    for id, v1 in ipairs( inv ) do

        for id_receiver, v2 in ipairs( inv ) do

            v2.panel:Receiver( 'a'..id, function( vguiReceiver, tDroppedPanel, bDropped, nMenuIndex, xMouse, yMouse ) 

                if not bDropped then return end

                local shell1 = v1.panel:GetParent()
                local shell2 = v2.panel:GetParent()

                inv[ id ].color, inv[ id_receiver ].color = inv[ id_receiver ].color, inv[ id ].color

            end )
            v1.panel:Droppable( 'a'..id )

        end

    end
    ]]

end )

local CFG = AMB.Inventory.Config
net.Receive( CFG.net_send_inv_client, function()

    local slot = net.ReadUInt( 8 )
    local item = net.ReadTable()

    if not AMB.Inventory.players_inv[ LocalPlayer():SteamID64() ] then AMB.Inventory.players_inv[ LocalPlayer():SteamID64() ] = {} end
    AMB.Inventory.players_inv[ LocalPlayer():SteamID64() ][ slot ] = item

end )