local CFG = AMB.UI.MainMenu.Config
local C = AMB.G.C
local SND = AMB.G.SND
local CMD = 'amb_mm_'..AMB.Config.prefix
local GUI = AMB.UI.GUI

local w = ScrW()
local h = ScrH()

-- ## Console Variables #########################################################
local Cvar = GetConVar
local CvarInt = function( sCvar ) return Cvar( CMD..'_'..sCvar ):GetInt() end
local CvarBool = function( sCvar ) return Cvar( CMD..'_'..sCvar ):GetBool() end
local CvarString = function( sCvar ) return Cvar( CMD..'_'..sCvar ):GetString() end
-- ##############################################################################

local cursor_x, cursor_y = nil

local function GetColor( sConVar )

    local str_color = CvarString( sConVar )

    local tbl = string.Explode( ' ', str_color )

    return Color( tbl[ 1 ] or 255, tbl[ 2 ] or 255, tbl[ 3 ] or 255, tbl[ 4 ] or 255 )

end

local function GetPos( sType )

    local x = ( AMB.UI.MainMenu.Config[ 'pos_'..sType ].x == 'w' ) and ScrW() or AMB.UI.MainMenu.Config[ 'pos_'..sType ].x
    local y = ( AMB.UI.MainMenu.Config[ 'pos_'..sType ].y == 'h' ) and ScrH() or AMB.UI.MainMenu.Config[ 'pos_'..sType ].y

    return x, y

end

local function GetSize( sType )

    local sizew = ( AMB.UI.MainMenu.Config[ 'pos_'..sType ].w == 'w' ) and ScrW() or AMB.UI.MainMenu.Config[ 'pos_'..sType ].w
    local sizeh = ( AMB.UI.MainMenu.Config[ 'pos_'..sType ].h == 'h' ) and ScrH() or AMB.UI.MainMenu.Config[ 'pos_'..sType ].h

    return sizew, sizeh

end

local function CreateCvars()

    if not CFG.enable then return end

    for name, tbl in pairs( AMB.UI.MainMenu.Config.convars ) do CreateClientConVar( name, tbl.default, true ) end

end
CreateCvars() -- it need, when refreshing this file

function AMB.UI.MainMenu.EnableLibrary( bEnable )

    AMB.UI.MainMenu.Config.enable = bEnable
    CreateCvars()

    if bEnable then
        
        hook.Add( 'ScoreboardShow', 'AMB.UI.MainMenu.ShowMenu',  function() AMB.UI.MainMenu.ShowMenu( CvarInt( 'page_tab' ) ) return false end )
        hook.Add( 'ScoreboardHide', 'AMB.UI.MainMenu.CloseMenu', function() AMB.UI.MainMenu.CloseMenu() return false end )

    else

        hook.Remove( 'ScoreboardShow', 'AMB.UI.MainMenu.ShowMenu' )
        hook.Remove( 'ScoreboardHide', 'AMB.UI.MainMenu.CloseMenu' )

    end

    return bEnable

end

local c1, c2, c3 = Color( 90, 90, 90 ), Color( 255, 255, 255, 100 ), Color( 50, 50, 50)
function AMB.UI.MainMenu.ShowMenu( nPage )

    if ValidPanel( AMB.UI.MainMenu.menu ) then AMB.UI.MainMenu.CloseMenu() return end

    local EnableSaveCursor  = CvarBool( 'cursor_save' )
    if EnableSaveCursor and cursor_x then input.SetCursorPos( cursor_x, cursor_y ) end
    local GetDefaultPageTAB = CvarInt( 'page_tab' )
    local GetDefaultPageF4  = CvarInt( 'page_f4' )
    local EnableSavePage    = CvarBool( 'page_save' )
    local GetNavbarPos      = CvarString( 'navbar_pos' )

    local blur = CvarBool( 'blur' )
    local background = GUI.DrawPanel( nil, w, h, 0, 0, function( self, w, h )
    
        --if blur then AMB.UI.DrawBlur( self, 1 ) end
        
    end )

    local nabvar_color0 = GetColor( 'navbar_color0' )
    local menu = GUI.DrawFrame( nil, background:GetWide(), background:GetTall(), 0, 0, nil, true, false, false, function( self, w, h ) 
    
        --draw.RoundedBox( 0, 0, 0, w, h, nabvar_color0 ) 
        
    end )
    menu.OnKeyCodePressed = function( self, nKey )
    
        if ( nKey == KEY_F4 ) then AMB.UI.MainMenu.CloseMenu() end
        if ( nKey == KEY_ESCAPE ) then 

            gui.HideGameUI()
            AMB.UI.MainMenu.CloseMenu()

        end

    end
    menu:SetAlpha( 0 )
    menu:AlphaTo( 255, 0.25, 0, function() end )
    
    local navbar_x, navbar_y = GetPos( 'navbar' )
    local navbar_w, navbar_h = GetSize( 'navbar' )
    local navbar_color1 = GetColor( 'navbar_color1' )
    local navbar = GUI.DrawPanel( menu, navbar_w, 0, navbar_x, navbar_y, function( self, w, h ) 

        draw.RoundedBox( 0, 0, 0, w, h, navbar_color1 )

    end )


    navbar:SizeTo( navbar_w, navbar_h, 0.25, 0, -1, function() end )

    local button_w = 128
    local margin_x = 4

    local canvas = GUI.DrawPanel( menu, w, h - navbar_h, 0, navbar_h, function( self, w, h ) end )

    if nPage and ( nPage > 0 ) and AMB.UI.MainMenu.Config.pages[ nPage ] then
    
        timer.Simple( 0, function() AMB.UI.MainMenu.Pages.OpenPage( nPage, canvas ) end ) -- workaround for receiver and dropper
        
    end

    local navbar_color3 = GetColor( 'navbar_color3' )
    for id, page in ipairs( AMB.UI.MainMenu.Config.pages ) do

        local name, color = page.name, page.color        
        local page_button = GUI.DrawButton( navbar, button_w, navbar_h - 8, margin_x + ( button_w + margin_x ) * ( id - 1 ), 4, nil, nil, nil, function()

            AMB.UI.MainMenu.Pages.OpenPage( id, canvas )

        end, function( self, w, h ) 

            draw.RoundedBox( 4, 0, 0, w, h, navbar_color3 )
            draw.SimpleTextOutlined( name, self.size_font..' Ambition Bold', w / 2, h / 2, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )
        page_button.size_font = 18

        GUI.OnCursorButton( page_button, function() 

            surface.PlaySound( SND.RELEASE_BUTTON )

            page_button.size_font = 22

        end, function()

            page_button.size_font = 18

        end )

    end

    if EnableSavePage then AMB.UI.MainMenu.Pages.BackSavePages( canvas ) end

    AMB.UI.MainMenu.background = background
    AMB.UI.MainMenu.menu = menu

end
concommand.Add( 'amb_mm', function( _, _, tArgs ) AMB.UI.MainMenu.ShowMenu( tonumber( tArgs[ 1 ] ) ) end )

function AMB.UI.MainMenu.CloseMenu()

    if not ValidPanel( AMB.UI.MainMenu.menu ) then return end

    local EnableSavePage = CvarBool( 'page_save' )

    if not EnableSavePage then AMB.UI.MainMenu.Pages.ClearPages() end
    AMB.UI.MainMenu.Pages.ClearCurrentPages()
    
    cursor_x, cursor_y = input.GetCursorPos()

    -- menu не привязано к background лишь технически, чтобы Blur не срабатывал на меню, поэтому их двоих надо удалять
    AMB.UI.MainMenu.menu:AlphaTo( 0, 0.15, 0, function() 

        AMB.UI.MainMenu.background:Remove()
        AMB.UI.MainMenu.menu:Remove()

    end )

end

net.Receive( CFG.net_f4, function()

    AMB.UI.MainMenu.ShowMenu( CvarInt( 'page_f4' ) )

end )

cvars.AddChangeCallback( 'page_tab', function() 

    if AMB.UI.MainMenu.Config.enable then AMB.UI.MainMenu.EnableLibrary( true ) end

end )