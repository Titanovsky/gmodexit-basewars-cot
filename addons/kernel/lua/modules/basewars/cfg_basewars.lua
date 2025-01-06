AMB.Gamemode = AMB.Gamemode or {}
AMB.Gamemode.Config = AMB.Gamemode.Config or {}

local C, SND = AMB.G.C, AMB.G.SND

-- ## Server ############################
AMB.Gamemode.Config.max_level_entities = 6
AMB.Gamemode.Config.max_level_players = 60
AMB.Gamemode.Config.balance_next_xp = 1000
AMB.Gamemode.Config.basewars_categories_entities = {

    [ 1 ] = { ent = 'Ничтожное',    wep = 'Ничтожное' },
    [ 2 ] = { ent = 'Дешёвое',      wep = 'Слабое' },
    [ 3 ] = { ent = 'Нормальное',   wep = 'Среднее' },
    [ 4 ] = { ent = 'Лучшее',       wep = 'Яростное' },
    [ 5 ] = { ent = 'Редкое',       wep = 'Антикварное' },
    [ 6 ] = { ent = 'Легендарное',  wep = 'Мифическое' }

}

-- ## Auto Ammo #########################
AMB.Gamemode.Config.buy_auto_ammo_ammo = 32
AMB.Gamemode.Config.buy_auto_ammo_cost = 64
AMB.Gamemode.Config.buy_auto_ammo_delay = 0.75
AMB.Gamemode.Config.buy_autu_ammo_modify_cost = 3 -- Отрицательная сумма ( 21 - lvl ) * modify, те, кто выше 20, эта сумма положительная, то есть больше. Кто 20 уровень, модификатор == 0
AMB.Gamemode.Config.buy_auto_ammo_exception = {

    [ 'weapon_physgun' ] = { cost = false },
    [ 'weapon_physcannon' ] = { cost = false },
    [ 'gmod_tool' ] = { cost = false },
    [ 'gmod_camera' ] = { cost = false },
    [ 'weapon_laserlink' ] = { ammo = 50, cost = 200 },
    [ 'arccw_rpg7' ] = { ammo = 4, cost = 2000 }

}

-- ## Client ############################
AMB.Gamemode.Config.use_hud_library = true
AMB.Gamemode.Config.use_main_menu = true

AMB.Gamemode.Config.notify_post_kill = true
AMB.Gamemode.Config.notify_type = 3

AMB.Gamemode.Config.cl3d2d_npc_hud_enable = '1'
AMB.Gamemode.Config.cl3d2d_npc_hud_debug = '0'
AMB.Gamemode.Config.cl3d2d_npc_hud_max_count = '28'
AMB.Gamemode.Config.cl3d2d_npc_hud_max_dist = '1000'
AMB.Gamemode.Config.cl3d2d_npcs_list = { 

    [ 'npc_monk' ] = { color = AMB.G.C.AMB_GREEN, bone = 'head' },
    [ 'bw_helper' ] = { color = AMB.G.C.AMB_GREEN, bone = 'head' },
    [ 'npc_combine_s' ] = { color = AMB.G.C.AMB_BLOOD, bone = 'head' }

}

AMB.Gamemode.Config.cl3d2d_ents_hud_enable = '1'
AMB.Gamemode.Config.cl3d2d_ents_hud_debug = '0'
AMB.Gamemode.Config.cl3d2d_ents_hud_max_dist = '1200'

AMB.Gamemode.Config.cl3d2d_players                  = { cvar = 'amb_'..AMB.Config.prefix..'_3d2d_players', default = 1, help = 'Показать уровни 3D2D Информаций о Игроке' }
AMB.Gamemode.Config.cl3d2d_players_show_on_trace    = { cvar = 'amb_'..AMB.Config.prefix..'_3d2d_players_show_on_trace ', default = 0, help = 'Рендерить 3D2D данные о Игроке, только когда смотришь на него' }
AMB.Gamemode.Config.cl3d2d_players_show_self        = { cvar = 'amb_'..AMB.Config.prefix..'_3d2d_players_show_self ', default = 0, help = 'Рендерить 3D2D данные о себе' }
AMB.Gamemode.Config.cl3d2d_players_show_dead        = { cvar = 'amb_'..AMB.Config.prefix..'_3d2d_players_show_dead ', default = 0, help = 'Рендерить 3D2D мёртвых игроков' }
AMB.Gamemode.Config.cl3d2d_players_max_dist         = { cvar = 'amb_'..AMB.Config.prefix..'_3d2d_players_max_dist', default = 1600, min = 2, max = 3200, help = 'Включить = 1, Выключить = 0 3D2D Информацию о Игроке' }

-- ## Players ###########################
AMB.Gamemode.Config.initialize_players_in_table = false

AMB.Gamemode.Config.start_money = 200
AMB.Gamemode.Config.start_level = 1
AMB.Gamemode.Config.start_xp = 0
AMB.Gamemode.Config.start_health = 75
AMB.Gamemode.Config.start_armor = 25
AMB.Gamemode.Config.start_team = 100
AMB.Gamemode.Config.start_skin = ''

AMB.Gamemode.Config.save_weapons_db = 'amb_save_weapons'
AMB.Gamemode.Config.save_weapons_after_disconnected = true
AMB.Gamemode.Config.save_weapons_after_shutdown = true
AMB.Gamemode.Config.save_weapons_min_level = 3

AMB.Gamemode.Config.calc_nxp_instance = 1000
AMB.Gamemode.Config.set_slow_walk_speed = 140
AMB.Gamemode.Config.set_walk_speed = 250
AMB.Gamemode.Config.set_run_speed = 510
AMB.Gamemode.Config.set_crouched_speed = 0.5
AMB.Gamemode.Config.basewars_ranks_players = {

    [ 1 ] = 'Нуб',
    [ 5 ] = 'Начинающий',
    [ 10 ] = 'Освоивщийся',
    [ 15 ] = 'Знаток',
    [ 20 ] = 'Мастер',
    [ 25 ] = 'Гуру',
    [ 30 ] = 'Непобедимый',
    [ 35 ] = 'Бессмертный',
    [ 40 ] = 'Ветеран',
    [ 45 ] = 'Задрот',
    [ 50 ] = 'Искуственный Интеллект',
    [ 55 ] = 'Всемогущий',
    [ 60 ] = 'Божество'

}
AMB.Gamemode.Config.weapons_spawn = {

    'weapon_physgun',
    'weapon_physcannon',
    'gmod_tool'

}
AMB.Gamemode.Config.player_pos = {

    [ 'rp_bangclaw' ] = { 
    
        { name = 'pos1', pos = Vector( 9770, -3922, 212 ), ang = Angle( 0, 90, 0 ) },
        { name = 'pos2', pos = Vector( 9282, -3921, 212 ), ang = Angle( 0, 90, 0 ) },

    }

}
-- ## Backpack after Death ############################
AMB.Gamemode.Config.backpack_time_remove = 60 * 15

-- ## PickUp ############################
AMB.Gamemode.Config.pickup_delay_player = 15
AMB.Gamemode.Config.pickup_types = {}

--[[

    -- [0, 1, 2] - Health
    -- [3, 4, 5] - Armor
    -- [6, 7, 8] - Weapons
    -- [9, 10, 11] - Ammo
    -- [12, 13, 14] - Money
    -- [15, 16, 17] - Resources #1
    -- [18, 19, 20] - Resources #2
    -- [21, 22, 23] - Resources #3
    -- [24, 25, 26] - Energy Drink
    -- [27, 28] - Fake
    -- [29, 30] - Donate
    -- [31] - Explosives
    -- [100, 101, 102] - Quest 1.1, 1.2, 1.3

-- ]]

AMB.Gamemode.Config.pickup_types[ 0 ] = { header = '+10 HP', model = 'models/items/healthkit.mdl', level = 2, respawn = 4, action = function( ePly, ePickUp ) 

    local hp, max_hp, add_hp = ePly:Health(), ePly:GetMaxHealth(), 10
    local Notify = AMB.Re.Notify
    
    if ( hp + add_hp <= max_hp ) then 
    
        ePly:SetHealth( hp + add_hp )
        Notify( ePly, { type = 12, time = 2.5, color = C.AMB_BLOOD, text = '+10 HP' } )
        
    end

end }

local rand_weps1 = { 'weapon_crowbar', 'weapon_pistol', 'weapon_fists', 'gmod_camera', 'weapon_stunstick', 'weapon_bugbait' }
AMB.Gamemode.Config.pickup_types[ 6 ] = { header = 'Оружие #1', model = 'models/weapons/w_pist_p228.mdl', level = 2, respawn = 35, action = function( ePly, ePickUp ) 

    local gun = table.Random( rand_weps1 )

    ePly:Give( gun )
    ePly:ChatPrint( 'Вам выдали: '..gun )

end }

local rand_res, rand_max_count = { 'copper', 'iron', 'iron', 'stone', 'stone', 'stone' }, { 2, 4, 6, 8, 12, 16 }
AMB.Gamemode.Config.pickup_types[ 15 ] = { header = 'Ресурсы #1', modelscale = 0.8, color = C.AMB_GRAY, model = 'models/items/item_item_crate.mdl', level = 2, respawn = 35, action = function( ePly, ePickUp ) 

    local rand_number = math.random( 1, #rand_res )
    local res, count = rand_res[ rand_number ], math.random( 1, rand_max_count[ rand_number ] )

    ePly:AddItemInv( res, count )
    ePly:ChatPrint( 'Вы взяли: x'..count..' '..res )

end }

local model_backpack = 'models/fallout 3/backpack_2.mdl'
AMB.Gamemode.Config.pickup_types[ 100 ] = { header = 'Рюкзак', model = model_backpack, level = 1, respawn = 2, action = function( ePly, ePickUp ) 

    ePickUp:SetDelay( 0.25 )

    if AMB.Quest.CheckPlayer( ePly, 1, 1 ) then AMB.Quest.AddCount( ePly, 1, 1, 1 ) end

end }

AMB.Gamemode.Config.pickup_types[ 101 ] = { header = 'Ресурсы', model = 'models/maxofs2d/hover_rings.mdl', level = 1, respawn = 2, action = function( ePly, ePickUp ) 

    ePickUp:SetDelay( 0.25 )

    if AMB.Quest.CheckPlayer( ePly, 1, 2 ) then AMB.Quest.AddCount( ePly, 1, 1, 2 ) end

end }

AMB.Gamemode.Config.pickup_types[ 102 ] = { header = 'Оружие', model = 'models/cf/w_ak47_beast.mdl', level = 1, respawn = 2, action = function( ePly, ePickUp ) 

    ePickUp:SetDelay( 0.25 )

    if AMB.Quest.CheckPlayer( ePly, 1, 3 ) then AMB.Quest.AddCount( ePly, 1, 1, 3 ) end

end }