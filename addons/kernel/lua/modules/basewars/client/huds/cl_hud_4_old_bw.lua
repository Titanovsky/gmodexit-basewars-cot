local C = AMB.G.C
local w = ScrW()
local h = ScrH()

local COLOR_PANEL = Color( 53, 53, 53 )
local COLOR_SIDE_PANEL = Color( 66, 66, 66 )

local block_weps = {

    [ 'weapon_crowbar' ] = true,
    [ 'weapon_stunstick' ] = true,
    [ 'weapon_physcannon' ] = true,
    [ 'weapon_fists' ] = true,
    [ 'gmod_tool' ] = true,
    [ 'weapon_physgun' ] = true,
    [ 'weapon_bugbait' ] = true,
    [ 'arccw_melee_fists' ] = true,
    [ 'arccw_melee_knife' ] = true,
    [ 'arccw_melee_machete' ] = true,
    [ 'weapon_gold' ] = true,
    [ 'weapon_legend' ] = true,
    [ 'weapon_octane' ] = true,
    [ 'weapon_royalaxe' ] = true,

}

local triangle_low_hp = { 

    { x = 338, y = h - 75 },
    { x = 352, y = h - 60 },
    { x = 324, y = h - 60 },

}

local place_free = { 

    { x = 272, y = h - 54 },
    { x = 300, y = h - 90 },
    { x = 376, y = h - 90 },
    { x = 404, y = h - 54 },

}

local place_free_2 = { 

    { x = 312, y = h - 4 },
    { x = 273, y = h - 54 },
    { x = 404, y = h - 54 },
    { x = 444, y = h - 4 },

}

AMB.UI.HUD.RegisterHUD( 4, 'Old Basewars 4 HUD Non-Custom', 'AMBITION', function()

    if not LocalPlayer():IsAuth() then return end
    if IsValid( LocalPlayer():GetActiveWeapon() ) and ( LocalPlayer():GetActiveWeapon():GetClass() == 'gmod_camera' ) then return end

    local hp = ( LocalPlayer():Health() >= 100 ) and 100 or LocalPlayer():Health()
    local armor = ( LocalPlayer():Armor() >= 100 ) and 100 or LocalPlayer():Armor()
    local gamename = AMB.Gamemode.GetStats( LocalPlayer(), 'Gamename' )
    gamename = ( utf8.len( gamename ) >= 20 ) and utf8.sub( gamename, 1, 20 ) or gamename
    local hp_color_place = ( LocalPlayer():Health() >= 40 ) and C.AMB_WHITE or ColorAlpha( C.AMB_RED, math.cos( 360 + CurTime() * 8 ) * 230 )

    AMB.UI.Draw.ObliqueRect( 30, h - 95, 346, 43, C.AMB_BLUE, true )
    AMB.UI.Draw.ObliqueRect( 2, h - 52, 346, 55, C.AMB_BLUE )

    AMB.UI.Draw.ObliqueRect( 35, h - 90, 260, 34, C.AMB_WHITE, true )
    AMB.UI.Draw.ObliqueRect( 9, h - 52, 260, 48, C.AMB_WHITE )

    AMB.UI.Draw.ObliqueRect( 290, h - 95, 90, 100, C.AMB_BLUE )
    surface.SetDrawColor( C.AMB_WHITE:Unpack() ) -- workaround
    surface.DrawPoly( place_free ) -- workaround
    surface.DrawPoly( place_free_2 ) -- workaround
    surface.SetDrawColor( hp_color_place:Unpack() )
    surface.DrawPoly( place_free )
    surface.DrawPoly( place_free_2 )

    AMB.UI.Draw.ObliqueRect( 36, h - 88, 254, 18, C.AMB_BLACK, true )
    draw.SimpleTextOutlined( gamename, '18 Ambition', 38, h - 89, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )
    draw.SimpleTextOutlined( team.GetName( LocalPlayer():Team() ), '12 Ambition', 150, h - 69, team.GetColor( LocalPlayer():Team() ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )

    if ( LocalPlayer():Health() > 0 ) then 

        AMB.UI.Draw.CustomCircle( 332, h - 49, 5, 16, ColorAlpha( C.AMB_BLOOD, 10 ), 360, 34, 0 )    
        AMB.UI.Draw.CustomCircle( 332, h - 49, 5, 16,  ColorAlpha( C.AMB_RED, 80 ), hp * 3.39, 34, 0 ) 
        draw.SimpleTextOutlined( LocalPlayer():Health(), '26 Ambition', 331, h - 64, C.AMB_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )

    end

    if ( LocalPlayer():Armor() > 0 ) and LocalPlayer():Alive() then 
    
        AMB.UI.Draw.CustomCircle( 332, h - 49, 4, 16, ColorAlpha( C.AMB_HARD_BLUE, 30 ), armor * 3.6, 30, 0 )
        draw.SimpleTextOutlined( LocalPlayer():Armor(), '14 Ambition', 331, h - 38, C.AMB_BLUE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )
        
    end

    draw.SimpleTextOutlined( 'LVL', '12 Ambition', 392, h-43, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_PURPLE )
    draw.SimpleTextOutlined( AMB.NW.GetInt( LocalPlayer(), 'Level' ), '22 Ambition', 391, h - 30, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_PURPLE )
    AMB.UI.Draw.CustomCircle( 392, h - 28, 4, 16, ColorAlpha( C.AMB_PURPLE, 4 ), 360, 21, 0 )
    AMB.UI.Draw.CustomCircle( 392, h - 28, 4, 16, ColorAlpha( C.AMB_SOFT_PURPLE, 30 ), 360 / ( AMB.NW.GetFloat( LocalPlayer(), 'NXP' ) / AMB.NW.GetFloat( LocalPlayer(), 'XP' ) ), 21, 0 )

    surface.SetFont( '22 Ambition' )
    local x_text, _ = surface.GetTextSize( string.Comma( AMB.NW.GetInt( LocalPlayer(), 'Money' ) )..'$' )

    draw.RoundedBox( 8, 150 - x_text / 2 - 2, h - 50, x_text + 3, 22, C.AMB_BLACK )
    draw.SimpleTextOutlined( string.Comma( AMB.NW.GetInt( LocalPlayer(), 'Money' ) )..'$', '22 Ambition', 150, h - 50, C.AMB_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )

    surface.SetFont( '18 Ambition' )
    local x_text, _ = surface.GetTextSize( math.Round( AMB.NW.GetFloat( LocalPlayer(), 'XP' ), 2 )..'/'..AMB.NW.GetFloat( LocalPlayer(), 'NXP' )..' XP' )

    draw.RoundedBox( 8, 150 - x_text / 2, h - 25, x_text + 4, 18, C.AMB_BLACK )
    draw.SimpleTextOutlined( math.Round( AMB.NW.GetFloat( LocalPlayer(), 'XP' ), 2 )..'/'..AMB.NW.GetFloat( LocalPlayer(), 'NXP' )..' XP', '18 Ambition', 152, h-24, C.AMBITION, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )

    local clip1 = IsValid( LocalPlayer():GetActiveWeapon() ) and LocalPlayer():GetActiveWeapon():Clip1() or 0
    local count_ammo = IsValid( LocalPlayer():GetActiveWeapon() ) and LocalPlayer():GetAmmoCount( LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType() ) or 0

    if not block_weps[ LocalPlayer():GetActiveWeapon():GetClass() ] then

        AMB.UI.Draw.ObliqueRect( w - 150, h - 50, w, 50, C.AMB_BLUE, true )
        AMB.UI.Draw.ObliqueRect( w - 154, h - 45, w, 40, C.AMB_WHITE, true )
        draw.SimpleTextOutlined( '/', '16 Ambition', w - 88, h - 36, C.AMB_GRAY, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )
        draw.SimpleTextOutlined( clip1, '26 Ambition', w - 100, h - 42, C.AMB_GRAY, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )
        draw.SimpleTextOutlined( count_ammo, '26 Ambition', w - 78, h - 42, C.AMB_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )
        if ( LocalPlayer():GetAmmoCount( LocalPlayer():GetActiveWeapon():GetSecondaryAmmoType() ) > 0 ) then draw.SimpleTextOutlined( '('..LocalPlayer():GetAmmoCount( LocalPlayer():GetActiveWeapon():GetSecondaryAmmoType() )..')', '16 Ambition', w - 168, h - 23, C.AMB_GRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.AMB_BLACK ) end
        draw.SimpleTextOutlined( string.sub( LocalPlayer():GetActiveWeapon():GetPrintName(), 1, 23 ), '12 Ambition', w - 88, h - 18, C.AMB_BLUE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.AMB_BLACK )

    end

end )