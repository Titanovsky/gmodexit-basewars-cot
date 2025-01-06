AMB.PropCore = AMB.PropCore or {}

local CFG = AMB.PropCore.Config

local C = AMB.G.C

local w = ScrW()
local h = ScrH()

local FONT = '18 Ambition'
local FONT_NUM = '20 Ambition'
local INDENT = 4
local MARGIN = 28 -- 2px отступ между колонками
local POS_Y = 90

local cvar = CreateClientConVar( 'amb_propcore_hud_info', CFG.hud_info_ents, true )
local cvar_copy_enable = CreateClientConVar( 'amb_propcore_hud_info_copy_enable', CFG.hud_info_ents_copy_enable, true )
local cvar_copy_color_enable = CreateClientConVar( 'amb_propcore_hud_info_copy_color_enable', CFG.hud_info_ents_copy_color_enable, true )

local function GetNamePlayer( ePly )

    if ( #AMB.NW.GetString( ePly, 'Gamename' ) > 0 ) then return AMB.NW.GetString( ePly, 'Gamename' ) end

    return ePly:Nick()

end

local function GetOwnerString( eObj )

    if not IsValid( AMB.NW.GetEntity( eObj, 'PropCoreOwner' ) ) and not AMB.NW.GetEntity( eObj, 'PropCoreOwner' ):IsPlayer() then return 'Server' end 

    local owner = AMB.NW.GetEntity( eObj, 'PropCoreOwner' )

    if ( owner == Entity( 0 ) ) then return 'World' end

    if not IsValid( owner ) then return 'Disconnect' end

    return AMB.NW.GetString( owner, 'Gamename' )..' ['..owner:EntIndex()..']'

end

hook.Add( 'HUDPaint', 'AMB.PropCore.Client.HUD', function()

    if ( cvar:GetInt() == 0 ) then return end

    local trace = LocalPlayer():GetEyeTrace()
    if not IsValid( trace.Entity ) then return end

    local ent = trace.Entity
    if ( LocalPlayer():GetPos():Distance( ent:GetPos() ) > 800 ) then return end

    surface.SetFont( FONT )
    local text = GetOwnerString( ent )
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = 0

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 4 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '0', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    surface.SetFont( FONT )
    local name = ent:IsPlayer() and GetNamePlayer( ent ) or ent:GetClass()
    local text = name..' ['..ent:EntIndex()..']'
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 4 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '1', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    if ( cvar:GetInt() < 2 ) then return end

    surface.SetFont( FONT )
    local vec_x, vec_y, vec_z = math.Round( ent:GetPos().x ), math.Round( ent:GetPos().y ), math.Round( ent:GetPos().z )
    local text = 'Vector '..vec_x..'  '..vec_y..'  '..vec_z
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = multiply_y + 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 5 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '2', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    if ( cvar:GetInt() < 3 ) then return end

    surface.SetFont( FONT )
    local ang_x, ang_y, ang_z = math.Round( ent:GetAngles().x ), math.Round( ent:GetAngles().y ), math.Round( ent:GetAngles().z )
    local text = 'Angle '..ang_x..'  '..ang_y..'  '..ang_z
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = multiply_y + 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 5 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '3', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    if ( cvar:GetInt() < 4 ) then return end

    surface.SetFont( FONT )
    local col_r, col_g, col_b, col_a = ent:GetColor().r, ent:GetColor().g, ent:GetColor().b, ent:GetColor().a
    local text = 'Color '..col_r..' '..col_g..' '..col_b..' '..col_a
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = multiply_y + 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 5 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '4', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    if ( cvar:GetInt() < 5 ) then return end

    surface.SetFont( FONT )
    local text = ent:GetModel() or 'Model X'
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = multiply_y + 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 5 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '5', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    if ( cvar:GetInt() < 6 ) then return end

    surface.SetFont( FONT )
    local text = ( #ent:GetMaterial() > 0 ) and ent:GetMaterial() or 'Material X'
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = multiply_y + 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 5 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '6', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    if ( cvar:GetInt() < 7 ) then return end

    surface.SetFont( FONT )
    local text = 'Health '..ent:Health()
    local xw, _ = surface.GetTextSize( text )
    if ent:IsPlayer() then 
    
        text = 'Health '..ent:Health()..'  Armor '..ent:Armor() 
        xw, _ = surface.GetTextSize( text )
        
    end

    local multiply_y = multiply_y + 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 5 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '7', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    if ( cvar:GetInt() < 8 ) then return end

    surface.SetFont( FONT )
    local text = ent:IsPlayer() and ent:SteamID() or 'SteamID X'
    if ent:IsPlayer() and ent:IsBot() then text = 'SteamID X' end
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = multiply_y + 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 5 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '8', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

    if ( cvar:GetInt() < 9 ) then return end

    surface.SetFont( FONT )
    local lvec = ent:WorldToLocal( trace.HitPos )
    local lvec_x, lvec_y, lvec_z = math.Round( lvec.x ), math.Round( lvec.y ), math.Round( lvec.z )
    local text = 'WorldToLocal '..lvec_x..'  '..lvec_y..'  '..lvec_z
    local xw, _ = surface.GetTextSize( text )

    local multiply_y = multiply_y + 1

    draw.RoundedBox( 4, w - xw - 8 - INDENT, h / 2 - POS_Y + ( MARGIN * multiply_y ), xw + 8, 26, ColorAlpha( C.ABS_BLACK, 200 ) )
    draw.SimpleText( text, FONT, w - 8, h / 2 - POS_Y + 5 + ( MARGIN * multiply_y ), C.AMB_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
    draw.RoundedBox( 4, w - xw - 8 - INDENT - 20 - INDENT / 2, h / 2 - POS_Y + ( MARGIN * multiply_y ), 20, 26, ColorAlpha( C.ABS_BLACK, 240 ) )
    draw.SimpleText( '9', FONT_NUM, w - INDENT - xw - 16, h / 2 - POS_Y + 3 + ( MARGIN * multiply_y ), C.AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

end )

local can_notify = true
local delay_for_notify = 0.65

local function SendNotify( sText )

    if not can_notify then return end

    can_notify = false
    AMB.UI.Notify.DrawNotify( 2, { text = sText, time = 4, color = C.AMB_GREEN } )

    timer.Simple( delay_for_notify, function() can_notify = true end )

end

hook.Add( 'PlayerButtonDown', 'AMB.Gamemode.Client.CopyInfoEntity', function( )
    
    if ( cvar_copy_enable:GetInt() == 0 ) then return end
    if ( cvar:GetInt() == 0 ) then return end

    local trace = LocalPlayer():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid( ent ) then return end

    if input.IsKeyDown( KEY_PAD_1 ) and ( cvar:GetInt() >= 1 ) then 
    
        SetClipboardText( ent:IsPlayer() and GetNamePlayer( ent ) or ent:GetClass() )
        SendNotify( ent:IsPlayer() and 'Игровое Имя скопировано!' or 'Класс скопирован!' )

    elseif input.IsKeyDown( KEY_PAD_2 ) and ( cvar:GetInt() >= 2 ) then 
    
        SetClipboardText( math.Round( ent:GetPos().x )..', '..math.Round( ent:GetPos().y )..', '..math.Round( ent:GetPos().z ) )
        SendNotify( 'Вектор скопирован!' )

    elseif input.IsKeyDown( KEY_PAD_3 ) and ( cvar:GetInt() >= 3 ) then 
    
        SetClipboardText( math.Round( ent:GetAngles().x )..', '..math.Round( ent:GetAngles().y )..', '..math.Round( ent:GetAngles().z ) )
        SendNotify( 'Углы скопированы!' )

    elseif input.IsKeyDown( KEY_PAD_4 ) and ( cvar:GetInt() >= 4 ) then 
    
        SetClipboardText( ent:GetColor()[ 'r' ]..', '..ent:GetColor()[ 'g' ]..', '..ent:GetColor()[ 'b' ]..', '..ent:GetColor()[ 'a' ] )
        SendNotify( 'Цвет скопирован!' )

    elseif input.IsKeyDown( KEY_PAD_5 ) and ( cvar:GetInt() >= 5 ) then 
    
        SetClipboardText( ent:GetModel() )
        SendNotify( 'Модель скопирован!' )

    elseif input.IsKeyDown( KEY_PAD_6 ) and ( cvar:GetInt() >= 6 ) then 
    
        SetClipboardText( ent:GetMaterial() )
        SendNotify( 'Материал скопирован!' )

    elseif input.IsKeyDown( KEY_PAD_7 ) and ( cvar:GetInt() >= 7 ) then 
    
        SetClipboardText( ent:Health() )
        SendNotify( 'Кол-во Здоровья скопировано!' )

    elseif input.IsKeyDown( KEY_PAD_8 ) and ( cvar:GetInt() >= 8 ) and ent:IsPlayer() and not ent:IsBot() then 
    
        SetClipboardText( ent:SteamID() )
        SendNotify( 'SteamID скопирован!' )

    elseif input.IsKeyDown( KEY_PAD_9 ) and ( cvar:GetInt() >= 9 ) then 
    
        local lvec = ent:WorldToLocal( trace.HitPos )
        SetClipboardText( math.Round( lvec.x )..', '..math.Round( lvec.y )..', '..math.Round( lvec.z ) )
        SendNotify( 'Вектор скопирован!' )

    end
    
end )