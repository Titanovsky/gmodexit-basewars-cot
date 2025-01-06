AMB.Clans = AMB.Clans or {}
AMB.Clans.Config = AMB.Clans.Config or {}

local SND = AMB.G.SND

-- ## Databases #########################################
AMB.Clans.Config.db_clans = 'amb_clans'
AMB.Clans.Config.db_outer_tax = 'amb_clans_outer_tax'
AMB.Clans.Config.db_players = 'amb_clans_players'

-- ## Creation/Update #########################################
AMB.Clans.Config.tax_xp_min = 0.15
AMB.Clans.Config.tax_xp_max = 0.75
AMB.Clans.Config.tax_money_min = 30000 + 1500 -- * количество_участников (онлайн и оффлайн)
AMB.Clans.Config.register_pay = 25000 -- 25000
AMB.Clans.Config.register_remove_clan_pay = 100000 -- 250000
AMB.Clans.Config.register_min_lvl = 1 -- 4 с какого уровня

AMB.Clans.Config.max_level = 5

-- ## Invite/Demote #########################################
AMB.Clans.Config.invite_min_lvl = 4
AMB.Clans.Config.invite_delay = 8 -- в секундах

AMB.Clans.Config.remove_player_sound = 'buttons/button4.wav'

-- ## Capture #########################################
AMB.Clans.Config.capture_sound_capture = 'ambition/bf5/award_warbong1.ogg'
AMB.Clans.Config.capture_sound_win_capture = 'ambition/bf5/show5.ogg'
AMB.Clans.Config.capture_sound_hold_capture = 'ambition/misc/ding/ding1.wav'
AMB.Clans.Config.capture_sound_lose_capture = SND.ERROR

-- All time in minutes
AMB.Clans.Config.capture_time_noname_zones = 1
AMB.Clans.Config.capture_time_owned_zones = 2 

-- Delay - это Вы не можете объявить капт
-- Block - это Вас не могут каптить
AMB.Clans.Config.capture_delay_win_noname_zones = 4
AMB.Clans.Config.capture_delay_lose_noname_zones = 2 

AMB.Clans.Config.capture_delay_hold_owned_zones = 1

AMB.Clans.Config.capture_delay_win_owned_zones = 4
AMB.Clans.Config.capture_block_win_owned_zones = 2 

AMB.Clans.Config.capture_delay_lose_owned_zones = 2 
AMB.Clans.Config.capture_block_lose_owned_zones = 0

AMB.Clans.Config.capture_random_phrases_connected_on_capture = {

    'Быстрее, капт уже идёт!', 
    'Где же ты пропадал? Капт уже идёт!', 
    'Мля.. А мы только тебя и ждали, бегом на капт!', 
    'Капт уже в самом разгаре!', 'Скорее иди на капт!', 
    'Помоги братанам на капте, будь мужиком!'

}