local ENT = {}

ENT.Class       = 'bw_case'
ENT.Type	    = 'anim'

ENT.PrintName	= 'Кейс'
ENT.Author		= AMB.G.AUTHOR
ENT.Category	= AMB.G.Category( 'Basewars' )
ENT.Spawnable   = true

ENT.Stats = {

    type = 'Entity',
    model = 'models/sci_fi/briefcase_scifi_aug.mdl',
    module = 'basewars',
    date = '19.03.2021 14:49:59'

}

AMB.Entities.Register( ENT.Class, 'ents', ENT )

if CLIENT then

    ENT.RenderGroup = AMB.G.RENDER

    function ENT:DrawTranslucent()

        AMB.Entities.Draw( self, false )

    end

    return

end 

function ENT:Initialize()

    AMB.Entities.Initialize( self, self.Stats.model )
    AMB.Entities.Physics( self )

end

local C = AMB.G.C
local gifts = {

    { wep = 'weapon_crossbow', color = C.FLAT_PURPLE },
    { wep = 'weapon_ar2', color = C.FLAT_RED },
    { wep = 'weapon_smg1', color = C.FLAT_BLUE },
    { wep = 'weapon_rpg', color = C.FLAT_PURPLE },
    { wep = 'weapon_357', color = C.FLAT_RED },
    { wep = 'weapon_gold', color = C.FLAT_RED },
    { wep = 'weapon_ak47_beast', color = C.FLAT_RED }

}

function ENT:Use( eCaller )

    local tab = {}
    local max = 3

    for i = 1, max do tab[ i ] = table.Random( gifts ) end

    for k, v in pairs( tab ) do AMB.UI.Chat.SendMessage( eCaller, nil, C.AMB_WHITE, '['..k..']  ', v.color, v.wep ) end

    local gift = math.random( 1, max )
    AMB.UI.Chat.SendMessage( eCaller, nil, C.AMB_WHITE, 'Вам досталась ', C.FLAT_GRAY, '['..gift..'] ', tab[ gift ].color, tab[ gift ].wep )
    eCaller:Give( tab[ gift ].wep )

    self:Remove()    

end