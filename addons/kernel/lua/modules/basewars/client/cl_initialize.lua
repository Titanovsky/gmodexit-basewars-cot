AMB.Gamemode.Client = AMB.Gamemode.Client or {}

local CFG = AMB.Gamemode.Config

hook.Add( 'InitPostEntity', 'AMB.Gamemode.Client.ConfigLoaded', function() 

    AMB.UI.HUD.EnableLibrary( CFG.use_hud_library )
    AMB.UI.MainMenu.EnableLibrary( CFG.use_main_menu )

    -- for fade of corpses on Client
    RunConsoleCommand( 'g_ragdoll_lvfadespeed', '2' )
    RunConsoleCommand( 'g_ragdoll_fadespeed', '2' )
    
end )