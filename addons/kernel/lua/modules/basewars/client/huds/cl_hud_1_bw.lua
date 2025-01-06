local C = AMB.G.C
local w = ScrW()
local h = ScrH()

CreateClientConVar( 'amb_custom_hud_amb_pos', 'bottom-left', true )
CreateClientConVar( 'amb_custom_hud_amb_pos_x', 0, true, false, '', -100, 100 )
CreateClientConVar( 'amb_custom_hud_amb_pos_y', 0, true, false, '', -100, 100 )
CreateClientConVar( 'amb_custom_hud_amb_color', 1, true )
CreateClientConVar( 'amb_custom_hud_amb_size', 3, true, false, '', 1, 20 )

local COLOR_PANEL = Color( 20, 20, 20, 200 )
local COLOR_FIRST_PANEL = Color( 20, 20, 20, 150 )
local COLOR_BACK_ARMOR = Color( 66, 87, 150 )
local CVar = GetConVar

local custom_vars = { 

    [ 'main' ] = { 

        [ 'bottom-left' ] = { x = 4, y = h - 60 - 4, xx = 0, yy = -20 },
        [ 'bottom-right' ] = { x = w - 160 - 4, y = h - 60 - 4, xx = -20, yy = -20 },
        [ 'top-left' ] = { x = 4, y = 4, xx = 0, yy = 0 },
        [ 'top-right' ] = { x = w - 160 - 4, y = 4, xx = -20, yy = 0 },
        [ 'color1' ] = COLOR_FIRST_PANEL,

    },

    [ 'upper_line' ] = {

        [ 'color1' ] = C.AMBITION,
        [ 'color2' ] = C.AMB_BLUE,

    },

    [ 'nick' ] = {

        [ 'color1' ] = COLOR_PANEL,
        [ 'bottom-left' ] = { x = 2 },
        [ 'top-left' ] = { x = 2 }, 
        [ 'bottom-right' ] = { x = 2 },
        [ 'top-right' ] = { x = 2 }, 

    },

    [ 'hp_bar' ] = {

        [ 'color1' ] = C.FLAT_RED,

    },

    [ 'armor_bar' ] = {

        [ 'color1' ] = C.FLAT_BLUE,

    },

}

local function GetPos( sElement )

    if not sElement then sElement = '' end
    if not custom_vars[ sElement ] then return { x = 0, y = 0 } end
    if not custom_vars[ sElement ][ GetConVar( 'amb_custom_hud_amb_pos' ):GetString() ] then return custom_vars[ sElement ][ 'bottom-left' ] end

    return custom_vars[ sElement ][ GetConVar( 'amb_custom_hud_amb_pos' ):GetString() ]

end

local function GetColor( sElement, bRainbow )

    if not sElement then sElement = '' end
    if ( GetConVar( 'amb_custom_hud_amb_color' ):GetInt() == 0 ) and bRainbow then return HSVToColor( ( CurTime() * 80 ), 1, 1 ) end
    if not custom_vars[ sElement ] then return Color( 0, 0, 0 ) end
    if not custom_vars[ sElement ][ 'color'..GetConVar( 'amb_custom_hud_amb_color' ):GetInt() ] then return custom_vars[ sElement ][ 'color1' ] end

    return custom_vars[ sElement ][ 'color'..GetConVar( 'amb_custom_hud_amb_color' ):GetInt() ]

end

local function GetFont( nSize, nMultiply )

    nMultiply = nMultiply or 1
    local size = CVar( 'amb_custom_hud_amb_size' ):GetInt()
    local font = nSize + ( nMultiply * size )
    if ( font >= 128 ) then return '128 Ambition' end

    return tostring( font )..' Ambition'

end

local function GetAlign()

    local pos = CVar( 'amb_custom_hud_amb_pos' ):GetString()

    if ( pos == 'bottom-left' ) or ( pos == 'top-left' ) then return TEXT_ALIGN_LEFT end

    return TEXT_ALIGN_RIGHT

end

local hud = nil

AMB.UI.HUD.RegisterHUD( 1, 'Basewars HUD', 'AMBITION', function()

    if not LocalPlayer():Alive() then 
    
        if ValidPanel( hud ) then hud:Remove() end

        return 
        
    end

    local hp_color = ( LocalPlayer():Health() >= 40 ) and COLOR_PANEL or ColorAlpha( C.AMB_RED, 200 + math.sin( 360 + CurTime() * 8 ) * 120 )

    if ValidPanel( hud ) then hud:Remove() end

    local x, y = CVar( 'amb_custom_hud_amb_pos_x' ):GetInt() * 10 +  GetPos( 'main' ).x + ( GetPos( 'main' ).xx * GetConVar( 'amb_custom_hud_amb_size' ):GetInt() ), CVar( 'amb_custom_hud_amb_pos_y' ):GetInt() * 10 + GetPos( 'main' ).y + ( GetPos( 'main' ).yy * GetConVar( 'amb_custom_hud_amb_size' ):GetInt() )

    hud = AMB.UI.GUI.DrawPanel( nil, 160 + ( 20 * GetConVar( 'amb_custom_hud_amb_size' ):GetInt() ), 60 + ( 20 * GetConVar( 'amb_custom_hud_amb_size' ):GetInt() ), x, y, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, GetColor( 'main' ) ) end )

    local upper_line = AMB.UI.GUI.DrawPanel( hud, hud:GetWide(), 1 + ( 1 * GetConVar( 'amb_custom_hud_amb_size' ):GetInt() ), 0, 0, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, GetColor( 'upper_line', true ) ) end )

    local nick = AMB.UI.GUI.DrawPanel( hud, hud:GetWide(), 10 + ( 3 * GetConVar( 'amb_custom_hud_amb_size' ):GetInt() ), 0, upper_line:GetTall(), function( self, w, h ) 
    
        draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
        draw.SimpleTextOutlined( AMB.NW.GetString( LocalPlayer(), 'Gamename' ), GetFont( 8, 2 ), 4, h / 2, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
        
    end )

    local info = AMB.UI.GUI.DrawPanel( hud, hud:GetWide() / 1.6, hud:GetTall(), 0, upper_line:GetTall() + nick:GetTall() + 2, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL ) end ) 
    local bars = AMB.UI.GUI.DrawPanel( info, info:GetWide() - 4, info:GetTall() / 4, 2, 2, function( self, w, h ) end ) 

    local hp = ( LocalPlayer():Health() <= 100 ) and LocalPlayer():Health() or 100
    local bar_health = AMB.UI.GUI.DrawPanel( bars, bars:GetWide() / 3, bars:GetTall() - 2, 0, 0, function( self, w, h ) 
        
        local tall = self:GetTall() * ( hp/100 )
        draw.RoundedBox( 4, 0, 0, w, h, C.AMB_BLOOD )
        draw.RoundedBox( 4, 0, h - tall, w, tall, C.FLAT_RED )
        draw.SimpleTextOutlined( LocalPlayer():Health(), GetFont( 10 ), w / 2, h / 2, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

    end )

    local armor = ( LocalPlayer():Armor() <= 100 ) and LocalPlayer():Armor() or 100
    local bar_armor = AMB.UI.GUI.DrawPanel( bars, bars:GetWide() / 3, bars:GetTall() - 2, bar_health:GetWide() + 2, 0, function( self, w, h ) 
        
        local tall = self:GetTall() * ( armor/100 )
        draw.RoundedBox( 4, 0, 0, w, h, COLOR_BACK_ARMOR )
        draw.RoundedBox( 4, 0, h - tall, w, tall, C.FLAT_BLUE )
        draw.SimpleTextOutlined( ( LocalPlayer():Armor() > 0 ) and LocalPlayer():Armor() or '', GetFont( 10 ), w / 2, h / 2, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
                
    end )

    local level = ( AMB.NW.GetInt( LocalPlayer(), 'XP' ) <= AMB.NW.GetInt( LocalPlayer(), 'NXP' ) ) and AMB.NW.GetInt( LocalPlayer(), 'XP' ) or AMB.NW.GetInt( LocalPlayer(), 'NXP' )
    local bar_level = AMB.UI.GUI.DrawPanel( bars, bars:GetWide() / 3 - 3, bars:GetTall() - 2, bar_health:GetWide() + 2 + bar_armor:GetWide() + 2, 0, function( self, w, h ) 
        
        local tall = self:GetTall() * ( level/AMB.NW.GetInt( LocalPlayer(), 'NXP' ) )
        draw.RoundedBox( 4, 0, 0, w, h, Color( 156, 121, 70 ) )
        draw.RoundedBox( 4, 0, h - tall, w, tall, C.AMBITION )
        draw.SimpleTextOutlined( AMB.NW.GetInt( LocalPlayer(), 'Level' ), GetFont( 10 ), w / 2, h / 2, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
                
    end )

    local text_info = AMB.UI.GUI.DrawPanel( info, info:GetWide() - 4, info:GetTall(), 2, bars:GetTall() + 2, function( self, w, h ) 
    
        local font = GetFont( 8, 2 )
        surface.SetFont( font )
        local _, y_pos = surface.GetTextSize( 'A' )
        draw.SimpleTextOutlined( AMB.NW.GetInt( LocalPlayer(), 'XP' )..'/'..AMB.NW.GetInt( LocalPlayer(), 'NXP' )..' XP', font, 2, 2 + y_pos, C.AMBITION, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleTextOutlined( AMB.NW.GetInt( LocalPlayer(), 'Money' )..'$', font, 2, 2, C.AMB_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        
    end )

    local info_ammo = AMB.UI.GUI.DrawPanel( hud, hud:GetWide() - info:GetWide() - 2, hud:GetTall(), 2 + info:GetWide(), upper_line:GetTall() + nick:GetTall() + 2, function( self, w, h ) 
    
        draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL ) 

    end )

    local wep = IsValid( LocalPlayer():GetActiveWeapon() ) and LocalPlayer():GetActiveWeapon() or wep
    surface.SetFont( GetFont( 6 ) )
    local print_name = wep and wep:GetPrintName() or ''
    local x_pos, y_pos = surface.GetTextSize( print_name )

    local name_wep = AMB.UI.GUI.DrawPanel( info_ammo, info_ammo:GetWide() - 4, y_pos + 4, 2, 2, function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
        draw.SimpleTextOutlined( print_name, GetFont( 6 ), w / 2, 2, C.AMB_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

    end )

    local font = GetFont( 10, 2 )
    surface.SetFont( font )
    local count_ammo = IsValid( wep ) and wep:Clip1()..'/'..LocalPlayer():GetAmmoCount( wep:GetPrimaryAmmoType() ) or ''
    local clip2 = IsValid( wep) and LocalPlayer():GetAmmoCount( wep:GetSecondaryAmmoType() ) or 0
    local _, y_pos = surface.GetTextSize( count_ammo )
    --local _, y_pos_clip2 = surface.GetTextSize( '('..clip2..')' )

    local ammo = AMB.UI.GUI.DrawPanel( info_ammo, info_ammo:GetWide() - 4, info_ammo:GetTall(), 2, name_wep:GetTall() + 4, function( self, w, h )

        --draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
        draw.SimpleTextOutlined( count_ammo, font, w / 2, 8, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        if ( clip2 > 0 ) then draw.SimpleTextOutlined( '('..clip2..')', GetFont( 6, 2 ), w / 2, 8 + y_pos + 6, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK ) end

    end )

end )

cvars.AddChangeCallback( AMB.UI.HUD.convar, function()

    if ValidPanel( hud ) then hud:Remove() return end

end )

cvars.AddChangeCallback( 'amb_custom_hud_amb_pos', function()

    if ValidPanel( hud ) then hud:Remove() return end

end )

cvars.AddChangeCallback( 'amb_custom_hud_amb_pos_x', function()

    if ValidPanel( hud ) then hud:Remove() return end

end )

cvars.AddChangeCallback( 'amb_custom_hud_amb_pos_y', function()

    if ValidPanel( hud ) then hud:Remove() return end

end )

cvars.AddChangeCallback( 'amb_custom_hud_amb_color', function()

    if ValidPanel( hud ) then hud:Remove() return end

end )

cvars.AddChangeCallback( 'amb_custom_hud_amb_size', function()

    if ValidPanel( hud ) then hud:Remove() return end

end )