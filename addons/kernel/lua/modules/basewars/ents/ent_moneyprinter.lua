local C = AMB.G.C
local SND = AMB.G.SND

local ENT = {}

ENT.Class       = 'bw_moneyprinter'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Денежный Принтер'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Basewars' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/hunter/blocks/cube05x075x025.mdl',
    material = 'models/debug/debugwhite',
    module = 'basewars',
    date = '27.03.2021 18:57:24'

}

local tiers = {

    [ 1 ] = { color = Color( 103, 217, 85 ), delay = 45, modif = 35, damage = 20, maxhp = 800 },
    [ 2 ] = { color = Color( 70, 155, 204 ), delay = 65, modif = 800, damage = 45, maxhp = 1200 },
    [ 3 ] = { color = Color( 221, 64, 64 ), delay = 85, modif = 2400, damage = 75, maxhp = 1800 }

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    local BACKGROUND_COLOR = ColorAlpha( C.AMB_BLACK, 250 )

    function ENT:DrawTranslucent()

        AMB.Entities.Draw( self, false )

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 1200 ) then return end

        local pos = self:GetPos()
	    local ang = self:GetAngles()
	    ang:RotateAroundAxis( ang:Up(), 90 )

        local money = AMB.NW.GetInt( self, 'Money' )
        local level = AMB.NW.GetInt( self, 'Level' )
        local tier = AMB.NW.GetInt( self, 'Tier' )
        local money_size_x = AMB.Utility.GetTextSizeX( money, '40 Arial' ) + 32

        if ( level == 1 ) then level = '★'
        elseif ( level == 2 ) then level = '★★'
        elseif ( level == 3 ) then level = '★★★'
        elseif ( level == 4 ) then level = '★★★★'
        elseif ( level == 5 ) then level = '★★★★★'
        else level = ''
        end

        local hint = ''
        local tr_ent = LocalPlayer():GetEyeTrace().Entity
        if IsValid( tr_ent ) and ( tr_ent == self ) then hint = 'Нажмите [E] чтобы забрать деньги' else hint = '' end

        cam.Start3D2D( pos + ang:Up() * 6.06 + ang:Right() * -11 + ang:Forward() * -17, ang, 0.1 )

            draw.RoundedBox( 0, 0, 0, 340, 220, BACKGROUND_COLOR )

            draw.RoundedBox( 0, 0, 16, 340, 34, C.AMB_PANEL )
            draw.SimpleTextOutlined( 'Тир — '..tier, '28 Arial', 164, 18, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

		    draw.RoundedBox( 4, 164 - money_size_x / 2, 96, money_size_x, 44, C.AMB_PANEL )
            draw.SimpleTextOutlined( money..'$', '40 Arial', 164, 100, C.ABS_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

            draw.SimpleTextOutlined( level, '18 Arial', 164, 144, C.ABS_YELLOW, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
            draw.SimpleTextOutlined( self:Health()..'%', '24 Arial', 164, 166, C.ABS_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
            draw.SimpleTextOutlined( hint, '18 Arial', 172, 220 - 6, C.AMB_WHITE , TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )

	    cam.End3D2D()

        cam.Start3D2D( pos + ang:Up() * 5 + ang:Right() * 12 + ang:Forward() * -17, ang + Angle( 0, 0, 90 ), 0.1 )

		    draw.RoundedBox( 0, 0, 0, 340, 100, BACKGROUND_COLOR )

            draw.SimpleTextOutlined( AMB.NW.GetString( self, 'PropCoreOwnerName' ), '32 Arial', 164, 35, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
            
	    cam.End3D2D()

    end

    AMB.Entities.Register( ENT.Class, 'ents', ENT ) -- the second time for auto refresh on client

    return

end 

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model, self.Stats.material )
    AMB.Entities.Physics( self, MOVETYPE_VPHYSICS, SOLID_VPHYSICS, nil, true, true )

    self:SetHealth( 450 )
    self:SetTier( 1 )
    self:AddMoney( 2 )

    self.turn = 0

end

function ENT:SetTimer( nSeconds, fAction )

    timer.Create( 'AmbTimerMoneyPrint'..tostring( self ), nSeconds, 1, fAction )

end

function ENT:RemoveTimer()

    timer.Remove( 'AmbTimerMoneyPrint'..tostring( self ) )

end

function ENT:DoTurn()

    if not IsValid( self ) then return end

    local tier = tiers[ self.tier or 1 ]

    local rand_money = math.random( 25, 400 )
    local rand_money_multiply = AMB.NW.GetInt( self, 'Level' ) * 30 + math.random( 15, 35 )
    local tier_modif = math.random( math.floor( tier.modif / 2 ), tier.modif )

    self:AddMoney( rand_money + rand_money_multiply + tier_modif )
    self:SetTimer( tier.delay, function() self:DoTurn() end )
    self.turn = self.turn + 1

    if ( self.turn % 10 == 0 ) then self:Update() end

    self:SetHealth( self:Health() - tier.damage )
    if ( self:Health() <= 0 ) then self:Remove() end

end

function ENT:SetTier( nTier )

    local tab = tiers[ nTier ]
    if not tab then return end

    self:RemoveTimer()
    self:SetTimer( tab.delay, function() self:DoTurn() end )
    self:SetColor( tab.color )
    self.modif = tab.modif
    self.tier = nTier
    self:SetMaxHealth( tab.maxhp )
    self:SetNWInt( 'Tier', nTier )

end

function ENT:AddMoney( nCount )

    AMB.NW.SetInt( self, 'Money', AMB.NW.GetInt( self, 'Money' ) + nCount )

end

function ENT:Update()

    local level = AMB.NW.GetInt( self, 'Level' )
    if ( level >= 5 ) then return end

    AMB.NW.SetInt( self, 'Level', level + 1 )

end

function ENT:Use( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end

    local money = AMB.NW.GetInt( self, 'Money' )
    if ( money <= 0 ) then return end

    local tier = self.tier
    
    if ( money > 22000 ) then ePly:AddXPEco( 12 )
    elseif ( money > 16000 ) then ePly:AddXPEco( 8 )
    elseif ( money > 9500 ) then ePly:AddXPEco( 6 )
    elseif ( money > 2500 ) then ePly:AddXPEco( 4 )
    elseif ( money > 900 ) then ePly:AddXPEco( 2 )
    elseif ( money > 450 ) then ePly:AddXPEco( 1 )
    end

    self:AddMoney( -money )
    ePly:AddMoney( money )

end

function ENT:OnRemove()

    self:RemoveTimer()

end

function ENT:OnTakeDamage( dmgInfo )

    local dmg = dmgInfo:GetDamage()

    self:SetHealth( self:Health() - dmg )

    if ( self:Health() <= 0 ) then self:Remove() end

end