AMB.Gamemode.Client = AMB.Gamemode.Client or {}

local CFG = AMB.Gamemode.Config
local C = AMB.G.C
local prefix = AMB.Config.prefix

local cvar_enable = CreateClientConVar( 'amb_'..prefix..'_3d2d_npc_enable', CFG.cl3d2d_npc_hud_enable, true )
local cvar_debug = CreateClientConVar( 'amb_'..prefix..'_3d2d_npc_debug', CFG.cl3d2d_npc_hud_debug, true )
local cvar_count = CreateClientConVar( 'amb_'..prefix..'_3d2d_npc_max_count', CFG.cl3d2d_npc_hud_max_count, true, false, 'Максимальное кол-во NPC', 0, 64 )
local cvar_dist = CreateClientConVar( 'amb_'..prefix..'_3d2d_npc_max_dist', CFG.cl3d2d_npc_hud_max_dist, true, false, 'Максимальная дистанция', 0, 3200 )

local function GetColorEntity( eObj )

    return CFG.cl3d2d_npcs_list[ eObj:GetClass() ].color or C.AMB_ORANGE

end

local function CalcNPCInFrame( tSphere )

    local num = 0

    for _, v in pairs( tSphere ) do 
    
        if v:IsNPC() and CFG.cl3d2d_npcs_list[ v:GetClass() ] then num = num + 1 end 
        
    end

    return num

end

hook.Add( 'PostDrawTranslucentRenderables', 'AMB.Gamemode.Client.RenderInfoNpc3D2D', function()

    if not cvar_enable:GetBool() then return end
    if ( CalcNPCInFrame( ents.FindInSphere( LocalPlayer():GetPos(), cvar_dist:GetInt() ) ) > cvar_count:GetInt() ) then return end

    for _, obj in pairs( ents.FindInSphere( LocalPlayer():GetPos(), cvar_dist:GetInt() ) ) do

        if not CFG.cl3d2d_npcs_list[ obj:GetClass() ] then continue end
        if ( obj:Health() <= 0 ) then continue end

        surface.SetFont( '20 Ambition' )
        local x_size_level, _ = surface.GetTextSize( AMB.NW.GetInt( obj, 'Level' ) )

        surface.SetFont( '36 Oswald Light' )
        local x_size_name, _ = surface.GetTextSize( obj:GetClass() )

        local _,max = obj:GetRotatedAABB( obj:OBBMins(), obj:OBBMaxs() )
        local rot = ( obj:GetPos() - EyePos() ):Angle().yaw - 90
        local head_bone = ( CFG.cl3d2d_npcs_list[ obj:GetClass() ].bone == 'head' ) and obj:LookupBone( 'ValveBiped.Bip01_Head1' ) or CFG.cl3d2d_npcs_list[ obj:GetClass() ]
        local head = obj:GetBonePosition( head_bone ) or obj:LocalToWorld( obj:OBBCenter() )
        local hp = ( obj:Health() >= 100 ) and 100 or obj:Health()
        local wep = IsValid( obj:GetActiveWeapon() ) and obj:GetActiveWeapon():GetClass() or 'none'

        cam.Start3D2D( head + Vector( 0, 0, 12 ), Angle( 0, rot, 90 ), 0.1 )

            draw.RoundedBox( 4, -x_size_name/2, -20, x_size_name + 10, 36, ColorAlpha( C.AMB_BLACK, 240 ) )
            draw.SimpleTextOutlined( obj:GetClass(), '36 Oswald Light', 4, -4, GetColorEntity( obj ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

            draw.RoundedBox( 0, x_size_name / 2 + 8, -20, x_size_level * 2, 36, GetColorEntity( obj ) )
            draw.SimpleTextOutlined( AMB.NW.GetInt( obj, 'Level' ), '20 Ambition', -x_size_name/2 + x_size_name + 16, 0, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

            if cvar_debug:GetBool() then draw.SimpleTextOutlined( 'ID  '..obj:EntIndex()..'  |  CLASS  '..obj:GetClass()..'  |  HP  '..obj:Health()..'  |  WEP  '..wep, '16 Ambition', 0, -40, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.AMB_BLACK ) end

        cam.End3D2D()

    end

end )