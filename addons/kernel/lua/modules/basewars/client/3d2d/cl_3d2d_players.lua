AMB.Gamemode.Client = AMB.Gamemode.Client or {}

local CFG = AMB.Gamemode.Config
local C = AMB.G.C

CreateClientConVar( CFG.cl3d2d_players.cvar, CFG.cl3d2d_players.default, true, false, CFG.cl3d2d_players.help )
CreateClientConVar( CFG.cl3d2d_players_show_on_trace.cvar, CFG.cl3d2d_players_show_on_trace.default, true, false, CFG.cl3d2d_players_show_on_trace.help )
CreateClientConVar( CFG.cl3d2d_players_show_self.cvar, CFG.cl3d2d_players_show_self.default, true, false, CFG.cl3d2d_players_show_self.help )
CreateClientConVar( CFG.cl3d2d_players_show_dead.cvar, CFG.cl3d2d_players_show_dead.default, true, false, CFG.cl3d2d_players_show_dead.help )
CreateClientConVar( CFG.cl3d2d_players_max_dist.cvar, CFG.cl3d2d_players_max_dist.default, true, false, CFG.cl3d2d_players_max_dist.help, CFG.cl3d2d_players_max_dist.min, CFG.cl3d2d_players_max_dist.max )

hook.Add( 'PostPlayerDraw', 'AMB.Gamemode.Client.Render3D2DPlayers', function( ePly )

    if ( GetConVar( CFG.cl3d2d_players.cvar ):GetInt() == 0 ) then return end
    if not IsValid( ePly ) then return end
    if ( LocalPlayer():GetPos():Distance( ePly:GetPos() ) > GetConVar( CFG.cl3d2d_players_max_dist.cvar ):GetInt() ) then return end
    if not GetConVar( CFG.cl3d2d_players_show_self.cvar ):GetBool() and ( ePly == LocalPlayer() ) then return end
    if not GetConVar( CFG.cl3d2d_players_show_dead.cvar ):GetBool() and not ePly:Alive() then return end

    --surface.SetFont( '20 Ambition' )
    --local x_size_level, _ = surface.GetTextSize( AMB.NW.GetInt( obj, 'Level' ) )

    --surface.SetFont( '36 Oswald Light' )
    --local x_size_name, _ = surface.GetTextSize( obj:GetClass() )

    local _,max = ePly:GetRotatedAABB( ePly:OBBMins(), ePly:OBBMaxs() )
    local rot = ( ePly:GetPos() - EyePos() ):Angle().yaw - 90
    local head_bone = ePly:LookupBone( 'ValveBiped.Bip01_Head1' ) or 1
    local head = ePly:GetBonePosition( head_bone ) + Vector( 0, 0, 14 ) or ePly:LocalToWorld( ePly:OBBCenter() ) + Vector( 0, 0, 12 )

    local hp = ( ePly:Health() >= 100 ) and 100 or ePly:Health()
    local wep = IsValid( ePly:GetActiveWeapon() ) and ePly:GetActiveWeapon():GetClass() or 'none'

    cam.Start3D2D( head, Angle( 0, rot, 90 ), 0.1 )

        --draw.RoundedBox( 4, 0, 0, 200, 200, ColorAlpha( C.AMB_BLACK, 240 ) )
        --draw.RoundedBox( 4, -x_size_name/2, -20, x_size_name + 10, 36, ColorAlpha( C.AMB_BLACK, 240 ) )
        draw.SimpleTextOutlined( AMB.Auth.IsPlayer( ePly ) and AMB.Gamemode.GetStats( ePly, 'Gamename' ) or 'NoAuth '..ePly:EntIndex(), '32 Noto Sans', 4, 24, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.AMB_BLACK )

        --draw.RoundedBox( 0, x_size_name / 2 + 8, -20, x_size_level * 2, 36, GetColorEntity( obj ) )
        --draw.SimpleTextOutlined( AMB.NW.GetInt( obj, 'Level' ), '20 Ambition', -x_size_name/2 + x_size_name + 16, 0, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        if ( GetConVar( CFG.cl3d2d_players.cvar ):GetInt() > 1 ) then 
        
            draw.SimpleTextOutlined( 'ID  '..ePly:EntIndex()..'  |  HP  '..ePly:Health()..'  |  WEP  '..wep, '16 Ambition', 0, -40, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.AMB_BLACK ) 
            
        end

    cam.End3D2D()

end )