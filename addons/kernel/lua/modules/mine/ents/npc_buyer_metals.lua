local C, SND, Chat, CFG = AMB.G.C, AMB.G.SND, AMB.UI.Chat, AMB.Mine.Config

local ENT = {}

ENT.Class       = 'mine_buyer_metals'
ENT.Base	    = 'base_ai'
ENT.Type	    = 'ai'

ENT.PrintName	= 'NPC Buyer Metals'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Mine' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'NPC',
    model = 'models/breen.mdl',
    module = 'mine',
    date = '16.04.2021 12:33:11'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:DrawTranslucent()

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) > 1400 ) then return end

        AMB.Entities.Draw( self, false )

        local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90
        local center = self:LocalToWorld( self:OBBCenter() )

        cam.Start3D2D( center + Vector( 0, 0, 40 ), Angle( 0, rot, 90 ), 0.1 )

            draw.SimpleTextOutlined( 'Покупатель Металлов', '32 Arial', 4, 0, C.AMBITION, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        cam.End3D2D()

    end

    AMB.Entities.Register( ENT.Class, 'ents', ENT )

    return

end

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model )
    AMB.Entities.Hull( self )
    AMB.Entities.Physics( self, MOVETYPE_NONE, SOLID_BBOX, COLLISION_GROUP_PLAYER, false, false, true )
    AMB.Entities.Capability( self, CAP_ANIMATEDFACE )
    AMB.Entities.Capability( self, CAP_TURN_HEAD )
    AMB.NW.SetBool( self, 'Active', true )

    self.id = math.random( 0, 99999 ) -- for timer

end

local function ConvertClassMetalToName( sClass )

    if ( sClass == 'iron' ) then return 'Железо'
    elseif ( sClass == 'copper' ) then return 'Медь'
    elseif ( sClass == 'stone' ) then return 'Камень'
    end

end

local spec_delay_for_players = {}

function ENT:Use( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if ePly.delay_for_npc_buyer_metals then return end

    local CFG = AMB.Mine.Config

    ePly.delay_for_npc_buyer_metals = true
    timer.Simple( 2.25, function()  

        if not IsValid( ePly ) then return end

        ePly.delay_for_npc_buyer_metals = false

    end )

    if spec_delay_for_players[ ePly:SteamID() ] and ( spec_delay_for_players[ ePly:SteamID() ] >= CFG.npc_buyer_delay_for_player_count ) then 
    
        if not timer.Exists( 'DelayForUseNPCBuyerMetal:'..ePly:SteamID() ) then timer.Create( 'DelayForUseNPCBuyerMetal:'..ePly:SteamID(), CFG.npc_buyer_delay_for_player_timer, 1, function() spec_delay_for_players[ ePly:SteamID() ] = nil end ) end
        local time = math.floor( timer.TimeLeft( 'DelayForUseNPCBuyerMetal:'..ePly:SteamID() ) )
        local msg = ( time > 60 ) and math.floor( ( time / 60 ) )..' минут!'  or time..' секунд!'
        AMB.Re.Notify( ePly, { type = 1, time = 4, color = C.AMB_ERROR, sound = SND.ERROR, text = 'Вы много взаимодействовали со скупщиком, подождите '..msg } ) 

        return 
        
    end

    spec_delay_for_players[ ePly:SteamID() ] = ( spec_delay_for_players[ ePly:SteamID() ] or 0 ) + 1

    if not AMB.NW.GetBool( self, 'Active' ) then 
    
        local time = math.floor( timer.TimeLeft( 'DelayForBuyerMetalNPC:'..self.id ) )
        AMB.Re.Notify( ePly, { type = 1, time = 3.25, color = C.AMB_ERROR, sound = SND.ERROR, text = 'Скупщик будет доступен через '..time..' секунд!' } ) 
        
        return 
        
    end

    local ply_inv = ePly:GetItemsInv()
    local sell_items = {}

    for slot, item in pairs( ply_inv ) do

        if item.empty then continue end

        local price = CFG.sell_list_rocks[ item.class ]
        if not price then continue end

        local old_count = sell_items[ item.class ] or 0
        sell_items[ item.class ] = old_count + item.count
        ePly:RemoveItemInv( slot )

    end

    if table.IsEmpty( sell_items ) then 
    
        self:EmitSound( 'vo/canals/boxcar_go_nag03.wav' )

        return 
        
    end

    AMB.NW.SetBool( self, 'Active', false )

    for metal, count in pairs( sell_items ) do

        local price, name = CFG.sell_list_rocks[ metal ] * count, ConvertClassMetalToName( metal )
        ePly:AddMoneyEco( price )
        Chat.SendMessage( ePly, nil, C.FLAT_BLUE, 'Вы продали: ', C.AMBITION, name..' x'..count..' ( '..price..'$ )' ) 

    end

    self:EmitSound( 'vo/canals/boxcar_go_nag04.wav' )
    timer.Create( 'DelayForBuyerMetalNPC:'..self.id, 8, 1, function() AMB.NW.SetBool( self, 'Active', true ) end )

end
