local C = AMB.G.C
local UT = AMB.Utility

local w = ScrW()
local h = ScrH()

local icon = nil
local headshot = false
local now_damage = 0
local color = C.ABS_WHITE

local function ShowDamage( sFont )

    local indicator = '-'..now_damage
    local offset_y = UT.GetTextSizeY( indicator, sFont )

    draw.SimpleTextOutlined( indicator, sFont, w / 2, h / 2 + 12 + offset_y, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

    if not icon then return end

    surface.SetDrawColor( color:Unpack() )
    surface.SetMaterial( icon )
    surface.DrawTexturedRect( w / 2 - 16, h / 2 - 16, 32, 32 )

end

local function ShowDamageDifferent() -- TODO
end

hook.Add( 'HUDPaint', 'AMB.DamageNotify.ShowDamage', function()

    if ( now_damage <= 0 ) then return end

    local CFG = AMB.DamageNotify.Config

    if ( CFG.type == 0 ) or ( CFG.type == 1 ) then ShowDamage( CFG.font )
    else ShowDamageDifferent()
    end

end )

local net = net
local surface = surface
local AMB = AMB
local Sound = AMB.Sound

net.Receive( AMB.DamageNotify.Config.net_send_client, function() 

    local CFG = AMB.DamageNotify.Config

    local damage = net.ReadUInt( 16 )
    if not damage then damage = 0 end

    local is_enemy_dead = net.ReadBit()
    local is_headshot = net.ReadBit()
    headshot = tobool( is_headshot )

    if headshot then surface.PlaySound( AMB.Sound( 'damage_notify/headshot.wav' ) )
    else surface.PlaySound( AMB.Sound( 'damage_notify/hit.wav' ) )
    end

    if ( is_enemy_dead == 1 ) then 
    
        color = C.ABS_RED

    else

        color = C.ABS_WHITE
        if ( is_headshot == 1 ) then 

            color = C.ABS_RED
            
        end

    end

    icon = ( is_enemy_dead == 0 ) and AMB.Material( 'damage_notify/hit.png' ) or AMB.Material( 'damage_notify/dead.png' )

    if ( CFG.type == 0 ) or ( CFG.type == 2 ) then now_damage = damage
    elseif ( CFG.type == 1 ) then now_damage = now_damage + damage
    end

    timer.Create( 'TimeDamageNotify', 1.75, 1, function()

        icon = nil
        headshot = false
        now_damage = 0
        color = C.ABS_WHITE

    end )

end )