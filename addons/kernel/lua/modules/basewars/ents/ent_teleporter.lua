local C = AMB.G.C

local ENT = {}

ENT.Class       = 'bw_teleport'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Телепорт'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Basewars' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/hunter/plates/plate1x2.mdl',
    material = 'models/debug/debugwhite',
    module = 'basewars',
    date = '19.03.2021 14:49:27'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:DrawTranslucent()

        AMB.Entities.Draw( self, false )

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 2200 ) then return end

        local pos = self:GetPos()
	    local ang = self:GetAngles()
	    ang:RotateAroundAxis( ang:Up(), 180 )

        cam.Start3D2D( pos + ang:Up() * 1.75 + ang:Right() * -20 + ang:Forward() * -1, ang, 0.1 )

		    draw.SimpleTextOutlined( AMB.NW.GetString( self, 'Header' ), '26 Ambition', 4, 0, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
            
	    cam.End3D2D()


    end

    return

end 

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model, self.Stats.material )
    AMB.Entities.Physics( self, MOVETYPE_VPHYSICS, SOLID_VPHYSICS, COLLISION_GROUP_PLAYER, false, false, false )
    
    self:SetHeader()
    self:SetDelay()
    self:SetOutputPos()

end

function ENT:SetHeader( sHeader )

    AMB.NW.SetString( self, 'Header', sHeader or 'Empty' )

end

function ENT:SetDelay( nSeconds )

    self.delay = nSeconds or 0

end

function ENT:SetTax( nCost, nLevel )

    AMB.NW.SetInt( self, 'Cost', nCount or 0 )
    self.lvl = nLevel

end

function ENT:EnableCollisionCaller( bEnable )

    self.post_collision_caller = bEnable

end

function ENT:SetOutputPos( sName, vPos, aEyePos )

    self.name = sName or 'Hole'
    self.pos = vPos or self:GetPos()
    self.ang = aEyePos or self:GetAngles()

end

function ENT:SetOutputPoses( tPoses )

    self.name = sName
    self.points = tPoses

end

local function CalcModify( ePly, nCost )

    local lvl = AMB.Gamemode.GetStats( ePly, 'Level' )
    if ( lvl > 20 ) then return nCost end

    return ( lvl >= 10 ) and math.floor( nCost / 1.4 ) or math.floor( nCost / 1.8 )

end

function ENT:Use( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if ePly.block_teleport then return end

    if self.lvl and ( self.lvl > 0 ) then 

        if ( AMB.Gamemode.GetStats( ePly, 'Level' ) < self.lvl ) then return end

    end

    local cost = AMB.NW.GetInt( self, 'Cost' ) or 0
    cost = CalcModify( ePly, cost )

    if ( cost > 0 ) then 

        if ( AMB.Gamemode.GetStats( ePly, '$' ) < cost ) then return end

        ePly:AddMoneyEco( -cost )

    end

    AMB.Gamemode.PlayerFreeze( ePly, true )
    ePly:ChatPrint( 'Через '..self.delay..' секунд(ы) Вы переместитесь' )

    ePly.block_teleport = true

    timer.Simple( self.delay, function() 

        if not IsValid( ePly ) then return end

        ePly.block_teleport = false
        AMB.Gamemode.PlayerFreeze( ePly, false )

        if not ePly:Alive() then return end

        local collision = self.post_collision_caller
        if ( collision ~= nil ) then

            local group = collision and COLLISION_GROUP_PLAYER or COLLISION_GROUP_WEAPON
            ePly:SetCollisionGroup( group )

        end

        if self.points then

            local rand = math.random( 1, #self.points )
            local point = self.points[ rand ]
            if not point then return end

            local pos, ang, name = point.pos, point.ang, point.name

            ePly:SetPos( pos )
            ePly:SetEyeAngles( ang )
            --todo: оповещать о прибытий

        else

            local pos, ang, name = self.pos, self.ang, self.name

            ePly:SetPos( pos )
            ePly:SetEyeAngles( ang )

        end

    end )

end
