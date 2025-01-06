local CFG, C, GUI = AMB.QMenu.Config, AMB.G.C, AMB.UI.GUI
local DrawBox, DrawText, DrawTextOutline = draw.RoundedBox, draw.SimpleText, draw.SimpleTextOutlined
-- ## Tools ############################################

hook.Add( 'AmbitionAuthPlayer', 'AMB.QMenu.AddTools', function()

    local toolPanelList = g_SpawnMenu.ToolMenu.ToolPanels[1].List
    local categories = toolPanelList.pnlCanvas:GetChildren()
    local construction = categories[ 2 ]:GetChildren()
    local render = categories[ 4 ]:GetChildren()
    local building = categories[ 5 ]:GetChildren()

    building[ 1 ]:SetText( '' )
    building[ 1 ].Paint = function( self, w, h ) 

        draw.RoundedBox( 4, 0, 0, w, h, C.AMB_BLUE )
        draw.SimpleTextOutlined( 'Строительство', '16 Arial Bold', w / 2, h / 2, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

    end

    for i, panel in ipairs( building ) do

        panel:SetTextColor( C.AMB_BLACK )
        panel:SetFont( '14 Arial' )

    end

end )

-- ## Spawnmenu ########################################

local props_tab = {

    { model = 'models/props_c17/concrete_barrier001a.mdl', type = '', cost = 9, max = 4 },
    { model = 'models/props_c17/display_cooler01a.mdl', type = '', cost = 12, max = 2 },

}

local function CreateFrame( vguiParent )

    local frame = GUI.DrawPanel( vguiParent, vguiParent and vguiParent:GetWide() or 800, vguiParent and vguiParent:GetTall() or 800, 0, 0, function( self, w, h ) 

        DrawBox( 4, 0, 0, w, h, C.AMB_BLACK )

        DrawBox( 4, 0, 0, w, 12, C.AMB_PANEL ) 
        DrawTextOutline( 'Props', '44 Arial', w / 2, 12, C.AMBITION, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawBox( 4, 0, 58, w, 12, C.AMB_PANEL ) 

    end )

    local props = GUI.DrawScrollPanel( frame, frame:GetWide() - 20, frame:GetTall() - 80 - 10, 10, 80, function( self, w, h ) end )
    local grid = GUI.DrawGrid( props, 84, 94, 0, 0, 12 )

    for i, prop in ipairs( props_tab ) do

        local panel = GUI.DrawPanel( grid, grid:GetColWide() - 4, grid:GetRowHeight() - 4, 0, 0, function( self, w, h ) 

            DrawBox( 6, 0, 0, w, h, C.AMB_PANEL ) 

        end )

        local model = vgui.Create( 'ModelImage', panel )
        model:SetSize( 64, 64 )
        model:SetPos( 8, 4 )
        model:SetModel( prop.model )

        grid:AddItem( panel )

        local cost, font = prop.cost and prop.cost..'$' or '', '18 Arial'
        local x = AMB.Utility.GetTextSizeX( cost, font ) + 8
        local info = GUI.DrawPanel( panel, x, 18, panel:GetWide() / 2 - x / 2, panel:GetTall() - 18 - 2, function( self, w, h )

            DrawBox( 4, 0, 0, w, h, C.AMB_PANEL ) 
            DrawTextOutline( self.text, font, w / 2, h / 2, C.AMB_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )
        info.text = cost

        local buy = GUI.DrawButton( panel, panel:GetWide(), panel:GetTall(), 0, 0, nil, nil, nil, function()

            LocalPlayer():ConCommand( 'gm_spawn '..prop.model )
            surface.PlaySound( 'buttons/button14.wav' )

        end, function( self, w, h ) end )-- workaround

        GUI.OnCursorButton( buy, function() 
        
            info.size, info.text = AMB.Utility.GetTextSizeX( 'Buy', font ) + 8, 'Buy'
            info:SetSize( info.size, info:GetTall() )
            
        end, function() 
        
            info.size, info.text = AMB.Utility.GetTextSizeX( cost, font ) + 8, cost
            info:SetSize( info.size, info:GetTall() )
            
        end )

    end

    return frame

end

local function SetMenuTab()

    g_SpawnMenu.CreateMenu.Items[ 1 ].Panel:GetChildren()[ 1 ] = CreateFrame( g_SpawnMenu.CreateMenu.Items[ 1 ].Panel:GetChildren()[ 1 ] )

end

spawnmenu.AddCreationTab( 'Props', function() return CreateFrame() end, 'icon16/control_repeat_blue.png', -500 )
hook.Add( 'AmbitionAuthPlayer', 'AMB.QMenu.SetSpawnMenuTab', SetMenuTab )

--[[
    --for Autorefresh
g_SpawnMenu.CreateMenu.Items[ 2 ].Panel:GetChildren()[ 1 ] = CreateFrame( g_SpawnMenu.CreateMenu.Items[ 2 ].Panel )
local parent = g_SpawnMenu.CreateMenu.Items[ 2 ].Panel
g_SpawnMenu.CreateMenu.Items[ 2 ].Panel:GetChildren()[ 1 ] = frame
]]--