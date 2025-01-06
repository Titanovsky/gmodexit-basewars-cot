local C, SND = AMB.G.C, AMB.G.SND

local ENT = {}

ENT.Class       = 'bw_backpack'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Рюкзак'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Basewars' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/fallout 3/backpack_2.mdl',
    module = 'basewars',
    date = '30.04.2021 14:44:37'

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

    function ENT:DrawTranslucent()

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 2000 ) then return end

        self:Draw()
        self:DrawShadow( false )

        self.Rotate = ( RealTime() - self.RotateTime ) * 180 % 360
	    self:SetAngles( Angle( self.ang_pitch or 0, self.Rotate, 0 ) )

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 400 ) then return end

        local pos = self:GetPos()
        local _, bounds = self:GetModelBounds()
	    local ang = Angle( 0, 0, 90 )
        local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90

        cam.Start3D2D( pos + Vector( 0, 0, bounds.z ) + ang:Up() * 1 + ang:Right() * -8 + ang:Forward() * -1, Angle( 0, rot, 90 ), 0.1 )

		    draw.SimpleTextOutlined( AMB.NW.GetString( self, 'Header' ), '36 Ambition', 4, 0, C.AMBITION, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
            
	    cam.End3D2D()

    end

    AMB.Entities.Register( ENT.Class, 'ents', ENT ) -- чтобы клиентская сразу обновлялась, без надобности снова заспавнить ентити

    return

end 

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model )
    AMB.Entities.Physics( self, nil, nil, COLLISION_GROUP_WEAPON )
    self:SetTrigger( true )
    self:SetRemove()

end

function ENT:StartTouch( ePly )

    if not IsValid( self ) then return end
    if not IsValid( ePly ) or not ePly:IsPlayer() then return end

    if self.weapons and ( #self.weapons > 0 ) then

        for i, class in ipairs( self.weapons ) do ePly:Give( class ) end

    end

    if self.money and ( self.money > 0 ) then ePly:AddMoney( self.money ) end

    self:Remove()

end

local block = { 
    
    [ 'weapon_physgun' ] = true,
    [ 'weapon_physcannon' ] = true,
    [ 'weapon_fists' ] = true,
    [ 'gmod_tool' ] = true, 
    [ 'gmod_camera' ] = true
    
}

function ENT:SetPlayer( ePly )

    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return end

    AMB.NW.SetString( self, 'Header', '['..ePly:EntIndex()..'] '..ePly:GetGamename() )

    local weapons = ePly:GetWeapons()
    local tab = {}

    for i, wep in ipairs( weapons ) do

        if block[ wep:GetClass() ] then continue end
        if ( i == #weapons ) then continue end

        tab[ #tab + 1 ] = wep:GetClass()

    end

    self.weapons = tab

    if ( ePly:GetMoney() >= 1000 ) then 

        local rand = math.random( 250, 1000 )

        ePly:AddMoney( -rand )
        self.money = rand

    end

end

function ENT:SetRemove()

    timer.Create( 'BackPackRemove:'..self:EntIndex(), AMB.Gamemode.Config.backpack_time_remove, 1, function()

        if IsValid( self ) then self:Remove() end

    end )

end

function ENT:OnRemove()

    timer.Remove( 'BackPackRemove:'..self:EntIndex() )

end
