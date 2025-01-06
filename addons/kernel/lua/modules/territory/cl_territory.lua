local C = AMB.G.C
local w = ScrW()
local h = ScrH()

local cvar_render = CreateClientConVar( 'amb_territory_render', 0 )
local cvar_hud = CreateClientConVar( 'amb_territory_hud', 1 )

local ang = Angle( 0, 0, 0 )
local origin = Vector( 0, 0, 0 )
hook.Add( 'PostDrawTranslucentRenderables', 'AMB.Territory.ShowChunks', function()

    if ( cvar_render:GetBool() == false ) then return end
    local CFG = AMB.Territory.Config
    
    for name, chunk in pairs( CFG.chunks ) do
        
        if ( chunk.map ~= game.GetMap() ) then continue end

        render.DrawWireframeBox( origin, ang, chunk.mins, chunk.maxs, chunk.color, true )

    end

end )

local margin_bottom = Vector( 0, 0, 2 )
local margin_top = Vector( 0, 0, 2 )
hook.Add( 'HUDPaint', 'AMB.Territory.ShowNames', function()

    if ( cvar_hud:GetBool() == false ) then return end

    local CFG = AMB.Territory.Config
    if not CFG.chunks then return end

    for name, chunk in SortedPairs( CFG.chunks ) do
        
        if ( chunk.map ~= game.GetMap() ) then continue end
        if not LocalPlayer():GetPos():WithinAABox( chunk.mins - margin_bottom, chunk.maxs + margin_top ) then continue end

        surface.SetFont( '26 Ambition' )
        local x_text, _ = surface.GetTextSize( name )
        draw.RoundedBox( 4, w - x_text * 2 - 26, 16, ( x_text * 2 ), 48, ColorAlpha( C.ABS_BLACK, 230 ) )
        draw.SimpleTextOutlined( name, '26 Ambition', w - x_text - 26, 18, chunk.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        return

    end

end )