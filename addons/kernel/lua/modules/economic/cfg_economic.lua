AMB.Economic = AMB.Economic or {}
AMB.Economic.Config = AMB.Economic.Config or {}

local C = AMB.G.C

-- Clients ------------------
AMB.Economic.Config.tooltip = 'Магазин – тут должно быть описание.. Но его украл Билли!'

-- Nets ---------------------
AMB.Economic.Config.net_buy = 'amb_economic_buy'

-- PayDay -------------------
AMB.Economic.Config.payday_delay = 540
AMB.Economic.Config.payday_action = function( ePly )

    local time = ePly:TimeConnected()
    if ( time <= 250 ) then return end

    local lvl = AMB.Gamemode.GetStats( ePly, 'Level' )
    local modify = ( lvl >= 20 ) and 0 or ( 20 - lvl ) * 8
    local modify_time = ( time > 2700 ) and math.random( 41, 96 ) or 0
    ePly:AddXPEco( 30 + modify + modify_time )

    local money = AMB.Gamemode.GetStats( ePly, '$' )
    local modify = ( lvl >= 20 ) and 0 or ( 20 - lvl ) * 35
    local modify_time = ( time > 2700 ) and 60 or 0
    ePly:AddMoneyEco( 150 + modify + modify_time )

    if ( time > 2700 ) then AMB.UI.Notify.DrawNotify( ePly, 3, { type = 4, text = 'Вы получили бонус за +45 минут на сервере!', color = C.AMBITION, time = 2.75, sound = 'ambition/capture_of_terra/sfx/button5.wav' } ) end

end

-- List of Objects ----------
local cat_other, cat_moneyprinters, cat_att = 'Остальное', 'Денежные Принтеры', 'Обвесы'
AMB.Economic.Config.shop_entities = {

    armor = {

        name = 'Броня',
        desc = '+25 Брони',
        class = 'item_battery',
        category = cat_other,
        model = 'models/items/battery.mdl',
        max = 4,
        cost = 299

    },

    moneyprinter1 = {

        name = 'Принтер T1',
        desc = '(Слабый) Денежный Принтер Тир-1',
        class = 'bw_moneyprinter',
        category = cat_moneyprinters,
        model = 'models/props_lab/reciever01b.mdl',
        lvl = 2,
        max = 3,
        cost = 3999

    },

    moneyprinter2 = {

        name = 'Принтер T2',
        desc = '(Средний) Денежный Принтер Тир-2',
        class = 'bw_moneyprinter',
        category = cat_moneyprinters,
        model = 'models/props_lab/reciever01a.mdl',
        lvl = 6,
        max = 2,
        cost = 29999,
        post = function( ePly, eEnt ) eEnt:SetTier( 2 ) end

    },

    moneyprinter3 = {

        name = 'Принтер T3',
        desc = '(Топовый) Денежный Принтер Тир-3',
        model = 'models/props_c17/consolebox01a.mdl',
        class = 'bw_moneyprinter',
        category = cat_moneyprinters,
        lvl = 8,
        max = 1,
        cost = 74999,
        post = function( ePly, eEnt ) eEnt:SetTier( 3 ) end

    },

    repair_kit = {

        name = 'Рем. Комплект',
        desc = 'Ремонтный Комплект для Денежных Принтеров и Пропов',
        model = 'models/items/arccw/smg_ammo.mdl',
        class = 'bw_repairkit',
        category = cat_other,
        lvl = 3,
        max = 6,
        cost = 800

    },

    optic_acog = {

        name = 'ACOG x3',
        desc = 'Оптический Прицел',
        model = 'models/weapons/arccw/atts/acog.mdl',
        class = 'acwatt_optic_acog',
        category = cat_att,
        lvl = 1,
        max = 1,
        cost = 10

    },

    optic_aimpoint = {

        name = 'Aimpoint RDS',
        desc = 'Оптический Прицел',
        model = 'models/weapons/arccw/atts/aimpoint.mdl',
        class = 'acwatt_optic_aimpoint',
        category = cat_att,
        lvl = 2,
        max = 1,
        cost = 350

    },

    laser_compact = {

        name = 'Laser Compact',
        desc = 'Лазерный Прицел',
        model = 'models/weapons/arccw/atts/laser_compact.mdl',
        class = 'acwatt_laser_compact',
        category = cat_att,
        lvl = 3,
        max = 1,
        cost = 14

    },

    supp_heavy = {

        name = 'Colossal Suppressor',
        desc = 'Большой Глушитель',
        model = 'models/weapons/arccw/atts/supp_heavy.mdl',
        class = 'acwatt_supp_heavy',
        category = cat_att,
        lvl = 4,
        max = 2,
        cost = 14

    },

}

AMB.Economic.Config.shop_weapons = AMB.Economic.Config.shop_weapons or {}