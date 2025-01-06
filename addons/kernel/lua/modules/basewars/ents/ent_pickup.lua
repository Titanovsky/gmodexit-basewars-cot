local C = AMB.G.C

local ENT = {}

ENT.Class       = 'bw_pickup'
ENT.Type	    = 'anim'

ENT.PrintName	= 'PickUp'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Basewars' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/props_borealis/mooring_cleat01.mdl',
    module = 'basewars',
    date = '16.04.2021 13:02:16'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:Initialize()

        self.OriginPos = self:GetPos()
	    self.Rotate = 0
	    self.RotateTime = RealTime()
        self.ang_pitch = math.random( -15, 15 )

    end

    local delay = 0
    function ENT:DrawTranslucent()

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 2000 ) then return end

        --self:SetRenderOrigin(self.OriginPos + Vector( 0, 0, math.sin( RealTime() * 4 ) * 1.2 ) )
	    self:SetupBones()

        AMB.Entities.Draw( self, false )

        self.Rotate = (RealTime() - self.RotateTime)*180 %360
	    self:SetAngles(Angle(self.ang_pitch or 0,self.Rotate,0))

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 400 ) then return end

        local pos = self:GetPos()
        local _, bounds = self:GetModelBounds()
	    local ang = Angle( 0, 0, 90 )
        local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90

        cam.Start3D2D( pos + Vector( 0, 0, bounds.z ) + ang:Up() * 1 + ang:Right() * -8 + ang:Forward() * -1, Angle( 0, rot, 90 ), 0.1 )

		    draw.SimpleTextOutlined( AMB.NW.GetString( self, 'Header' ), '32 Ambition', 4, 0, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
            
	    cam.End3D2D()

    end

    AMB.Entities.Register( ENT.Class, 'ents', ENT ) -- чтобы клиентская сразу обновлялась, без надобности снова заспавнить ентити

    return

end 

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model )
    AMB.Entities.Physics( self, MOVETYPE_VPHYSICS, SOLID_VPHYSICS, COLLISION_GROUP_WEAPON, false, true, false )

    self:SetTrigger( true )
    self:GiveDelay( true )

end

function ENT:SetType( nType )

    self.type = nType

end

function ENT:SetHeader( sHeader )

    AMB.NW.SetString( self, 'Header', sHeader or '' )

end

function ENT:SetScale( nScale, nTime )

    self:SetModelScale( nScale, nTime )

end


function ENT:SetLevel( nLevel )

    self.level = nLevel or 1

end

function ENT:SetTouchAction( fPostAction )

    self.post_action = fPostAction or function() end

end

function ENT:GiveDelay( bGiveDelay )

    self.give_delay = bGiveDelay

end

function ENT:SetDelay( nDelay )

    self.delay = nDelay

end

function ENT:StartTouch( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if ePly.delay_touch_pickup then return end
    if self.level and ( AMB.Gamemode.GetStats( ePly, 'Level' ) < self.level ) then return end

    self:EmitSound( 'garrysmod/save_load1.wav', 50 )
    if self.post_action then self.post_action( ePly, self ) end

    hook.Call( 'AmbitionGamemodeGivePickUp', nil, ePly, self )

    self:Remove()

    if self.give_delay then

        local delay = self.delay or AMB.Gamemode.Config.pickup_delay_player
        AMB.Re.Notify( ePly, { time = 3, type = 5, color = C.AMB_GRAY, text = 'Вы подняли PickUp, задержка: '..delay..' сек' } )
        ePly.delay_touch_pickup = true
        timer.Simple( delay, function() 

            if IsValid( ePly ) then ePly.delay_touch_pickup = false end

        end )

    end

end
