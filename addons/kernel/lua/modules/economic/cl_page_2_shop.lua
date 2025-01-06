local GUI = AMB.UI.GUI
local C = AMB.G.C
local SND = AMB.G.SND

local COLOR_PANEL = Color( 0, 0, 0, 100 )
local COLOR_PANEL2 = Color( 10, 10, 10, 200 )
local COLOR_PANEL_BUY = ColorAlpha( C.AMB_GREEN, 200 )

local DrawBox = function( nRounded, w, h, cColor ) return draw.RoundedBox( nRounded, 0, 0, w, h, cColor ) end

local function ShowPanels( vguiFrame, sType, sSortKey, bAttachments )

    local CFG = AMB.Economic.Config
    local pairs_tbl = {}
    if ( sType == 'entity' ) then pairs_tbl = CFG.shop_entities
    elseif ( sType == 'weapon') then pairs_tbl = CFG.shop_weapons
    end

    local size_tall = 72
    if ( sType == 'weapon' ) then size_tall = 82 end

    local egrid = GUI.DrawGrid( vguiFrame, ( vguiFrame:GetWide() + 4 ) / 2, size_tall, 0, 0, 2 )

    local i = 0
    for tag, obj in SortedPairsByMemberValue( pairs_tbl, sSortKey or 'cost' ) do

        if bAttachments then 

            if ( obj.category ~= 'Обвесы' ) then continue end

        else

            if ( obj.category == 'Обвесы' ) then continue end

        end

        i = i + 1
        obj.lvl = obj.lvl or 1

        local panel = GUI.DrawPanel( nil, egrid:GetColWide() - 4, egrid:GetRowHeight() - 4, 0, 0, function( self, w, h ) 

            DrawBox( 0, w, h, COLOR_PANEL2 )

            draw.SimpleText( obj.name or '', '22 Ambition', 68, 4, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

            draw.SimpleText( obj.cost..'$' or '0$', '18 Ambition', 68, h - 18, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( obj.lvl and 'LVL '..obj.lvl or '', '18 Ambition', 68, h - 18 - 8 * 2, C.FLAT_PURPLE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

            if ( sType ~= 'weapon' ) then return end

            draw.SimpleText( obj.category, '18 Ambition', 68, h - 18 - 11 * 3, C.AMB_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

        end )
        egrid:AddItem( panel )

        local icon_size, icon_size_w, icon_size_t = ( sType == 'weapon' ) and 100 or 64, ( sType == 'weapon') and -16 or 0, ( sType == 'weapon') and -4 or 2
        local icon = vgui.Create( 'ModelImage', panel )
        icon:SetSize( icon_size, icon_size )
        icon:SetPos( icon_size_w, icon_size_t )
        icon:SetModel( obj.model or 'models/props_phx/facepunch_logo.mdl' )

        local color = C.FLAT_RED
        local buy = GUI.DrawButton( panel, 54, 20, panel:GetWide() - 54 - 16, panel:GetTall() - 20 - 6, nil, nil, nil, function()

            if not AMB.Economic.Check( LocalPlayer(), tag, sType ) then surface.PlaySound( SND.ERROR ) return end
            
            net.Start( CFG.net_buy )
                net.WriteString( tag )
                net.WriteString( sType )
            net.SendToServer()

        end, function( self, w, h )

            local color = C.FLAT_RED

            if ( AMB.Gamemode.GetStats( LocalPlayer(), 'Level' ) >= obj.lvl ) and ( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) >= obj.cost ) then

                color = COLOR_PANEL_BUY

            else

                color = C.FLAT_RED

            end

            DrawBox( 8, w, h, color )
            draw.SimpleTextOutlined( 'Купить', '16 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )

        AMB.UI.GUI.OnCursorButton( buy, function() surface.PlaySound( 'ambition/bf5/capture4.ogg' ) end )

    end

end

local function ShowEntities( vguiFrame, sSortKey, bAttachments )

    vguiFrame:Clear()

    ShowPanels( vguiFrame, 'entity', sSortKey, bAttachments )

end

local function ShowWeapons( vguiFrame, sSortKey )

    vguiFrame:Clear()

    ShowPanels( vguiFrame, 'weapon', sSortKey )

end

local page = AMB.UI.MainMenu.Pages.AddPage( 2, 'Магазин', C.AMB_WHITE )
AMB.UI.MainMenu.Pages.SetPage( page, function( vguiFrame )

    local CFG = AMB.Economic.Config
    local tooltip = CFG.tooltip
    local type = 'entity'

    local frame, main = GUI.Ambition.DrawFrame( vguiFrame, 512, 512, 0, 0, 'Магазин', tooltip, function() 

        AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )

    end )
    frame:Center()

    local mw, mh = main:GetWide(), main:GetTall()

    local grid = GUI.DrawScrollPanel( main, mw - 16, mh - 60 - 10, 8, 60, function( self, w, h ) DrawBox( 0, w, h, COLOR_PANEL ) end )
    ShowEntities( grid, 'cost' )

    --local weapons = GUI.DrawScrollPanel( main, mw - 16, mh - entities:GetTall() - 16 - 28, 8, 8 + entities:GetTall() + 28, function( self, w, h ) DrawBox( 0, w, h, COLOR_PANEL ) end )
    --ShowWeapons( weapons, 'cost' )

    local sort_cost = GUI.DrawButton( main, 64, 20, 8, 4, nil, nil, nil, function() 

        if ( type == 'entity' ) then ShowEntities( grid, 'cost' )
        elseif ( type == 'weapon' ) then ShowWeapons( grid, 'cost' )
        else ShowEntities( grid, 'cost' )
        end

    end, function( self, w, h )

        DrawBox( 4, w, h, C.AMB_WHITE )
        draw.SimpleText( 'По Цене', '18 Ambition', w / 2, h / 2, C.AMB_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

    end ) 

    local offset = 8 + sort_cost:GetWide() + 2
    local sort_lvl = GUI.DrawButton( main, 78, 20, offset, 4, nil, nil, nil, function()

        if ( type == 'entity' ) then ShowEntities( grid, 'lvl' )
        elseif ( type == 'weapon' ) then ShowWeapons( grid, 'lvl' )
        else ShowEntities( grid, 'lvl' )
        end

    end, function( self, w, h )

        DrawBox( 4, w, h, C.AMB_WHITE )
        draw.SimpleText( 'По Уровню', '18 Ambition', w / 2, h / 2, C.FLAT_PURPLE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

    end ) 

    offset = 8 + sort_cost:GetWide() + sort_lvl:GetWide() + 2 * 2
    local sort_category = GUI.DrawButton( main, 96, 20, offset, 4, nil, nil, nil, function()

        if ( type == 'entity' ) then ShowEntities( grid, 'category' )
        elseif ( type == 'weapon' ) then ShowWeapons( grid, 'category' )
        else ShowEntities( grid, 'category' )
        end

    end, function( self, w, h )

        DrawBox( 4, w, h, C.AMB_WHITE )
        draw.SimpleText( 'По Категории', '18 Ambition', w / 2, h / 2, C.AMB_GRAY, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

    end )

    offset = 0
    local pairs_entities = GUI.DrawButton( main, 106, 22, 8, 32, nil, nil, nil, function()

        type = 'entity'
        ShowEntities( grid, 'cost' )
        surface.PlaySound( 'ambition/bf5/collapse1.ogg' )

    end, function( self, w, h )

        DrawBox( 4, w, h, C.AMBITION )
        draw.SimpleText( 'Предметы', self.size..' Ambition Bold', w / 2, h / 2, self.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end )
    pairs_entities.color, pairs_entities.size = C.AMB_BLACK, 20
    AMB.UI.GUI.OnCursorButton( pairs_entities, function() 

        pairs_entities.color, pairs_entities.size = C.ABS_YELLOW, 22
        surface.PlaySound( 'ambition/bf5/capture4.ogg' )

    end, function() 

        pairs_entities.color, pairs_entities.size = C.AMB_BLACK, 20

    end )
    
    offset = 8 + pairs_entities:GetWide() + 4
    local pairs_weapons = GUI.DrawButton( main, 84, 22, offset, 32, nil, nil, nil, function()

        type = 'weapon'
        ShowWeapons( grid, 'cost' )
        surface.PlaySound( 'ambition/bf5/collapse1.ogg' )

    end, function( self, w, h )

        DrawBox( 4, w, h, C.AMBITION )
        draw.SimpleText( 'Оружия', self.size..' Ambition Bold', w / 2, h / 2, self.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end )
    pairs_weapons.color, pairs_weapons.size = C.AMB_BLACK, 20
    AMB.UI.GUI.OnCursorButton( pairs_weapons, function() 

        pairs_weapons.color, pairs_weapons.size = C.ABS_YELLOW, 22
        surface.PlaySound( 'ambition/bf5/capture4.ogg' )

    end, function() 

        pairs_weapons.color, pairs_weapons.size = C.AMB_BLACK, 20

    end )

    offset = 8 + pairs_entities:GetWide() + pairs_weapons:GetWide() + 4 * 2
    local pairs_attachments = GUI.DrawButton( main, 84, 22, offset, 32, nil, nil, nil, function()

        type = 'entity'
        ShowEntities( grid, 'cost', true )
        surface.PlaySound( 'ambition/bf5/collapse1.ogg' )

    end, function( self, w, h )

        DrawBox( 4, w, h, C.AMBITION )
        draw.SimpleText( 'Обвесы', self.size..' Ambition Bold', w / 2, h / 2, self.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end )
    pairs_attachments.color, pairs_attachments.size = C.AMB_BLACK, 20
    AMB.UI.GUI.OnCursorButton( pairs_attachments, function() 

        pairs_attachments.color, pairs_attachments.size = C.ABS_YELLOW, 22
        surface.PlaySound( 'ambition/bf5/capture4.ogg' )

    end, function() 

        pairs_attachments.color, pairs_attachments.size = C.AMB_BLACK, 20

    end )

end )