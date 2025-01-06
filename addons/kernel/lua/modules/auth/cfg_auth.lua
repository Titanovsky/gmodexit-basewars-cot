AMB.Auth = AMB.Auth or {}
AMB.Auth.Config = AMB.Auth.Config or {}

local prefix = AMB.Config.prefix

AMB.Auth.Config.enable_authorization = true
AMB.Auth.Config.hidden_registration = true

AMB.Auth.Config.db_global = 'amb_'..prefix
AMB.Auth.Config.db_stats = 'amb_'..prefix..'_stats' -- integration with AMB.Gamemode

AMB.Auth.Config.log_connecting_players = true
AMB.Auth.Config.log_initial_spawned_players = true
AMB.Auth.Config.log_authorizated_players = true
AMB.Auth.Config.log_registrated_players = true

AMB.Auth.Config.afk_on_time = 1500 -- 25 min
AMB.Auth.Config.afk_on_auth_punishment = true -- ban on 2 min