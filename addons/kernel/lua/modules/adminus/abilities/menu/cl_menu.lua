AMB.Adminus = AMB.Adminus or {}
AMB.Adminus.Abilities = AMB.Adminus.Abilities or {}

local C = AMB.G.C
local GUI = AMB.UI.GUI

--CreateClientConVar( 'amb_adminus_color_frame', '255 255 255 255', false )

local w = ScrW()
local h = ScrH()

local adm_menu = nil

function AMB.Adminus.Abilities.ShowMenu()

    if ValidPanel( adm_menu ) then adm_menu:Remove() return end

    local frame = GUI.DrawFrame( nil, w/2.4, h/1.8, 0, 0, '', true, true, true, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, C.AMB_BLACK ) end )
    frame:Center()
    adm_menu = frame
    

    local sidebar = AMB.UI.GUI.DrawScrollPanel( frame, frame:GetWide()/4-2, frame:GetTall()-14*2, 4, 24, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, C.AMB_BLACK ) end )
    sidebar:GetVBar():SetSize( 0 )

    local panel = AMB.UI.GUI.DrawScrollPanel( frame, frame:GetWide()-frame:GetWide()/4-8, frame:GetTall()-14*2, frame:GetWide()/4+4, 24, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, C.AMB_BLACK ) end )

    local i = 0
    for name, tbl in SortedPairs( AMB.Adminus.Abilities.table ) do

        local page = GUI.DrawButton( sidebar, sidebar:GetWide(), sidebar:GetTall() / 10, 0, i * sidebar:GetTall() / 10.1, nil, nil, nil, function()  

            AMB.Adminus.Abilities.SetPanel( panel, tbl )

        end, function( self, w, h ) 
        
            draw.RoundedBox( 0, 0, 0, w, h, self.color ) 
            draw.SimpleTextOutlined( name, '20 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
            
        end )
        page.color = C.AMB_PANEL
        AMB.UI.GUI.OnCursorButton( page, function() page.color = ColorAlpha( C.AMB_PANEL, 5 ) end, function() page.color = C.AMB_PANEL end )

        i = i + 1

    end

end

local types = {

    [ 'id' ] = { 
        
        set = function( vguiPanel ) 

            local frame = AMB.UI.GUI.DrawComboBox( vguiPanel, vguiPanel:GetWide()-16, vguiPanel:GetTall()-28, 8, 20, '22 Ambition', 'Выберите Игрока' ) 
            for k, v in ipairs( player.GetAll() ) do

                frame:AddChoice( k..' '..AMB.NW.GetString( v, 'Gamename' ) )

            end

            return frame

        end,

        get = function( vguiPanel )

            local result = string.Explode( ' ', tostring( vguiPanel:GetValue() ) )

            return 'gamename_'..result[2]

        end

    },

    [ 'string' ] = {
    
        set = function( vguiPanel )

            local frame = AMB.UI.GUI.DrawTextEntry( vguiPanel, vguiPanel:GetWide()-16, vguiPanel:GetTall()-28, 8, 20, '22 Ambition', C.ABS_BLACK )

            return frame

        end,

        get = function( vguiPanel )

            return tostring( vguiPanel:GetValue() )

        end,

    },

    [ 'bool' ] = {
    
        set = function( vguiPanel )

            local frame = AMB.UI.GUI.DrawComboBox( vguiPanel, vguiPanel:GetWide()-16, vguiPanel:GetTall()-28, 8, 20, '22 Ambition', 'Да или Нет?' ) 
            frame:AddChoice( 'Да' )
            frame:AddChoice( 'Нет' )

            return frame

        end,

        get = function( vguiPanel )

            local result = ( vguiPanel:GetValue() == 'Да' ) and '1' or '0'

            return result

        end,

    },

    [ 'int' ] = {
    
        set = function( vguiPanel )

            local frame = AMB.UI.GUI.DrawTextEntry( vguiPanel, vguiPanel:GetWide()-16, vguiPanel:GetTall()-28, 8, 20, '22 Ambition', C.ABS_BLACK )
            frame:SetNumeric( true )

            return frame

        end,

        get = function( vguiPanel )

            return tostring( vguiPanel:GetValue() )

        end,

    },

}

function AMB.Adminus.Abilities.SetPanel( vguiPanel, tData )

    local console_args = {}

    vguiPanel:Clear()

    function vguiPanel:Paint( w, h )

        draw.RoundedBox( 0, 0, 0, w, h, C.AMB_BLACK )
        draw.SimpleTextOutlined( tData.name, '32 Ambition Bold', w/2, 4, C.AMBITION, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

    end

    local send = AMB.UI.GUI.DrawButton( vguiPanel, vguiPanel:GetWide()/6, vguiPanel:GetTall()/12, 0, 32, nil, nil, nil, function() 

        if not AMB.Adminus.ValidationAccess( LocalPlayer(), tData.access ) then return end

        local args = {}

        for k, v in pairs( console_args ) do

            args[ #args + 1 ] = types[ v.type ].get( v.panel ) -- тут мы чекаем по типу и запрашиваем get у панелек, которые пришли в console_args

        end

        net.Start( 'amb_adminus_call_from_menu' )
            net.WriteString( tData.name )
            net.WriteTable( args )
        net.SendToServer()

        vguiPanel:GetParent():Remove()
    
    end, function( self, w, h )
    
        draw.RoundedBox( 4, 0, 0, w, h, C.AMB_PANEL ) 
        draw.SimpleTextOutlined( 'Send', '20 Ambition', w/2, h/2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
    
    end )

    for k, v in ipairs( tData.args ) do

        local arg_tab = string.Explode( ':', v )

        vguiPanel.arg = AMB.UI.GUI.DrawPanel( vguiPanel, vguiPanel:GetWide(), vguiPanel:GetTall()/6, 0, (32+send:GetTall()+4)*k, function( self, w, h ) 
        
            draw.RoundedBox( 4, 0, 0, w, h, C.AMB_PANEL )
            draw.SimpleTextOutlined( k..' – '..arg_tab[ 2 ], '16 Ambition', 2, 0, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
            
        end )

        vguiPanel.arg.vgui = types[ arg_tab[ 1 ] ].set( vguiPanel.arg )
        console_args[ k ] = { panel = vguiPanel.arg.vgui, type = arg_tab[ 1 ] }

    end

end