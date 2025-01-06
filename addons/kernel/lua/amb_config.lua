AMB.Config = AMB.Config or {}

AMB.Config.dev          = true
AMB.Config.logs         = true
AMB.Config.gamemode     = 'basewars'
AMB.Config.server_dir   = 'capture_of_terra'
AMB.Config.prefix       = 'cot'
AMB.Config.language     = 'ru'

AMB.Loader.ConnectMicroKernel()
AMB.Loader.ConnectResourceWorkshopFromAddons()

AMB.Loader.ConnectModule( 'autospawn',  'AutoSpawn Entities' ) -- must connected the first one!
AMB.Loader.ConnectModule( 'chatcommands',   'Chat Commands' )
AMB.Loader.ConnectModule( 'basewars',   'The Main Gamemode' )
AMB.Loader.ConnectModule( 'adminus',    'The Administration System' )
AMB.Loader.ConnectModule( 'auth',       'Authoriaztion of Player on Global System' )
AMB.Loader.ConnectModule( 'restrict',   'Restrict of Entities for Player v1.1' )
AMB.Loader.ConnectModule( 'propcore',   'PropCore v1.1' )
AMB.Loader.ConnectModule( 'arccw',      'Global Config for ArcCW' )
AMB.Loader.ConnectModule( 'economic',   'The Economic System v1.0' )
AMB.Loader.ConnectModule( 'clans',      'The Clans Advanced System' )
AMB.Loader.ConnectModule( 'inventory',  'Inventory of Players' )
AMB.Loader.ConnectModule( 'territory',  'The Claim Territory for Basewars' )
AMB.Loader.ConnectModule( 'quest',      'Quests System v1.0' )
AMB.Loader.ConnectModule( 'statistics', 'Statistics of Players' )
AMB.Loader.ConnectModule( 're',         'Wrap Methods for Fast Coding' )
AMB.Loader.ConnectModule( 'cases',      'The Open Case System v2.0' )
AMB.Loader.ConnectModule( 'mine',       'Mine System 2.0' )
AMB.Loader.ConnectModule( 'damagenotify',  'Hitmarker Indicators' )
AMB.Loader.ConnectModule( 'opti',       'Optimization Module for Server/Client Realms' )
AMB.Loader.ConnectModule( 'fine',   'Fine and Punishments System' )
AMB.Loader.ConnectModule( 'tts',   'Text-to-Speech (3 Voices)' )
AMB.Loader.ConnectModule( 'image',   'ShareX Images in Game' )
AMB.Loader.ConnectModule( 'qmenu',   'ReBuild QMenu' )
AMB.Loader.ConnectModule( 'kit',   'The Kits v3.0' )
AMB.Loader.ConnectModule( 'esp',   'Marks on Map' )