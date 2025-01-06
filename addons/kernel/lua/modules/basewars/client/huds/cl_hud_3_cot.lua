local C = AMB.G.C
local UT = AMB.Utility
local w = ScrW()
local h = ScrH()

local draw = draw
local surface = surface

local ScaleSize = function( nSize, sType ) return ( sType == 'w' ) and w * nSize / w or h * nSize / h end

local health = {

    font = '40 Ambition',
    icon = Material( 'ambition/capture_of_terra/icon64/health1.png' )

}
local armor = {

    icon = Material( 'ambition/capture_of_terra/icon64/armor1.png' )

}
local money = {

    font = '32 Ambition',
    icon = Material( 'ambition/capture_of_terra/icon64/money1.png' )

}
local level = {

    icon = Material( 'ambition/capture_of_terra/icon64/star1.png' )

}
local ammo = {

    font2 = '28 Ambition',
    icon = Material( 'ambition/capture_of_terra/icon64/bullets1.png' )

}

local weapons_block_ammo = { [ 'weapon_physgun' ] = true, [ 'gmod_tool' ] = true, [ 'weapon_fists' ] = true, [ 'weapon_physcannon' ] = true, [ 'weapon_bugbait' ] = true, 
[ 'weapon_stunstick' ] = true, [ 'weapon_gold' ] = true, [ 'weapon_legend' ] = true, [ 'weapon_octane' ] = true, [ 'weapon_royalaxe' ] = true, [ 'arccw_melee_knife' ] = true, 
[ 'arccw_melee_fists' ] = true }

AMB.UI.HUD.RegisterHUD( 3, 'Offical HUD Capture Of Terra', 'AMBITION', function()

    if IsValid( LocalPlayer():GetActiveWeapon() ) and ( LocalPlayer():GetActiveWeapon():GetClass() == 'gmod_camera' ) then return end

    -- Health
    local textw = UT.GetTextSizeX( LocalPlayer():Health(), health.font )
    local hw, hh = ScaleSize( 42 + textw + 8, 'w' ), ScaleSize( 40, 'h' )
    draw.RoundedBox( 4, 4, h - hh - 4, hw, hh, C.AMB_RED )
    draw.RoundedBox( 4, 4 + 2, h - hh - 2, 38, hh - 4, C.AMB_BLACK )
    draw.RoundedBox( 4, 4 + 2 + 40, h - hh - 2, hw - 40 - 4, hh - 4, C.AMB_BLACK )
    draw.SimpleTextOutlined( LocalPlayer():Health(), health.font, 48, h - 4, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )
    surface.SetDrawColor( 255, 255, 255, 255 )
    surface.SetMaterial( health.icon )
    surface.DrawTexturedRect( 9, h - 32 - 8, 32, 32 )

    -- Armor
    if ( LocalPlayer():Armor() > 0 ) then

        local textw = UT.GetTextSizeX( LocalPlayer():Armor(), health.font )
        local aw, ah = ScaleSize( 42 + textw + 8, 'w' ), ScaleSize( 40, 'h' )
        local offsetx = hw + 4
        draw.RoundedBox( 4, 4 + offsetx, h - ah - 4, aw, ah, C.AMB_BLUE )
        draw.RoundedBox( 4, 4 + 2 + offsetx, h - ah - 2, 38, ah - 4, C.AMB_BLACK )
        draw.RoundedBox( 4, 4 + 2 + 40 + offsetx, h - ah - 2, aw - 40 - 4, ah - 4, C.AMB_BLACK )
        draw.SimpleTextOutlined( LocalPlayer():Armor(), health.font, 48 + offsetx, h - 4, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )
        surface.SetDrawColor( C.AMB_BLUE:Unpack() )
        surface.SetMaterial( armor.icon )
        surface.DrawTexturedRect( 9 + offsetx, h - 32 - 8, 32, 32 )

    end

    -- Money
    local text = string.Comma( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) )
    local textw = UT.GetTextSizeX( text, money.font )
    local mw, mh = ScaleSize( 42 + textw + 8, 'w' ), ScaleSize( 40, 'h' )
    local offsetx = 44
    draw.RoundedBox( 4, 4, h - mh - 4 - offsetx, mw, mh, C.AMB_GREEN )
    draw.RoundedBox( 4, 4 + 2, h - mh - 2 - offsetx, 38, mh - 4, C.AMB_BLACK )
    draw.RoundedBox( 4, 4 + 2 + 40, h - mh - 2 - offsetx, mw - offsetx, mh - 4, C.AMB_BLACK )
    draw.SimpleTextOutlined( text, money.font, 50, h - 4 - offsetx - 2, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )
    surface.SetDrawColor( 0, 255, 100, 255 )
    surface.SetMaterial( money.icon )
    surface.DrawTexturedRect( 9, h - 32 - 8 - offsetx, 32, 32 )

    -- Level
    local text = AMB.Gamemode.GetStats( LocalPlayer(), 'Level' )
    local textw = UT.GetTextSizeX( text, money.font )
    local lw, lh = ScaleSize( 42 + textw + 8, 'w' ), ScaleSize( 40, 'h' )
    local offsetx = offsetx + 44
    draw.RoundedBox( 4, 4, h - lh - 4 - offsetx, lw, lh, C.AMB_ORANGE )
    draw.RoundedBox( 4, 4 + 2, h - lh - 2 - offsetx, 38, lh - 4, C.AMB_BLACK )
    draw.RoundedBox( 4, 4 + 2 + 40, h - lh - 2 - offsetx, lw - 40 - 4, lh - 4, C.AMB_BLACK )
    draw.SimpleTextOutlined( text, money.font, 48, h - 4 - offsetx - 2, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )
    surface.SetDrawColor( C.AMB_ORANGE:Unpack() )
    surface.SetMaterial( level.icon )
    surface.DrawTexturedRect( 9, h - 32 - 8 - offsetx, 32, 32 )

    -- Ammo 1 & 2
    local wep = LocalPlayer():GetActiveWeapon()
    if not IsValid( wep ) then return end
    if weapons_block_ammo[ wep:GetClass() ] then return end

    local ammo1 = wep:Clip1()..' x '..LocalPlayer():GetAmmoCount( wep:GetPrimaryAmmoType() )
    local textw = UT.GetTextSizeX( ammo1 or 0, health.font )
    local hw, hh = ScaleSize( 42 + textw, 'w' ), ScaleSize( 40, 'h' )
    draw.RoundedBox( 4, w - hw - 4, h - hh - 4, hw, hh, C.AMB_GRAY )
    draw.RoundedBox( 4, w - hw + textw + 4, h - hh - 4 + 2, 32, hh - 4, C.AMB_BLACK )
    draw.RoundedBox( 4, w - hw - 2, h - lh - 2, hw - 34 - 4, lh - 4, C.AMB_BLACK )
    draw.SimpleTextOutlined( ammo1, health.font, w - hw, h - 4, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )
    surface.SetDrawColor( 255, 255, 255, 255 )
    surface.SetMaterial( ammo.icon )
    surface.DrawTexturedRect( w - 32 - 6, h - 32 - 8, 32, 32 )

    local ammo2 = LocalPlayer():GetAmmoCount( wep:GetSecondaryAmmoType() )
    if ammo2 and ( ammo2 > 0 ) then

        local textw = UT.GetTextSizeX( ammo2 or 0, ammo.font2 )
        local ammo2w =  ScaleSize( 16 + textw, 'w' )
        draw.RoundedBox( 4, w - hw - ammo2w - 8, h - hh + 6, ammo2w, hh - 10, C.AMB_GRAY )
        draw.RoundedBox( 4, w - hw - ammo2w - 6, h - hh + 8, ammo2w - 4, hh - 14, C.AMB_BLACK )
        draw.SimpleTextOutlined( ammo2, ammo.font2, w - hw - ammo2w, h - 4, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )

    end

end )