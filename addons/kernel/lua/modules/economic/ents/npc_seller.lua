local C = AMB.G.C

local ENT = {}

ENT.Class       = 'economic_seller'
ENT.Base	    = 'base_ai'
ENT.Type	    = 'ai'

ENT.PrintName	= 'NPC Seller'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Economic' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'NPC',
    model = 'models/monk.mdl',
    module = 'economic',
    date = '28.04.2021 04:19:16'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:DrawTranslucent()

        AMB.Entities.Draw( self, false )

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 800 ) then return end

        local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90
        local head_bone = self:LookupBone( 'ValveBiped.Bip01_Head1' )
        local head = self:GetBonePosition( head_bone )

        cam.Start3D2D( head + Vector( 0, 0, 12 ), Angle( 0, rot, 90 ), 0.1 )

            draw.SimpleTextOutlined( 'NPC Торговец', '26 Ambition', 4, 0, C.ABS_GRAY, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        cam.End3D2D()

    end

    return

end

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model )
    AMB.Entities.Hull( self )
    AMB.Entities.Physics( self, MOVETYPE_NONE, SOLID_BBOX, COLLISION_GROUP_NONE, false, false, true )
    AMB.Entities.Capability( self, CAP_ANIMATEDFACE )
    AMB.Entities.Capability( self, CAP_TURN_HEAD )

    self:SetTrigger( true )

end

function ENT:Use( ePly )

    ePly:ChatPrint( 'Временно не продаю!' )

end

function ENT:Touch( eObj )

    if not IsValid( eObj ) then return end

    if ( eObj:GetClass() == 'acwatt_optic_aimpoint' ) or ( eObj:GetClass() == 'arccw_att_base' and eObj.GiveAttachments and eObj.GiveAttachments[ 'optic_aimpoint' ] ) then
    
        local ply = eObj:GetOwner()
        if not ply or not IsValid( ply ) then return end

        hook.Call( 'AmbitionEconomicSendSeller', nil, ply, eObj )

        ply:AddMoneyEco( 170 )
        eObj:Remove()

    end

end