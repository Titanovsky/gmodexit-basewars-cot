-- ## Intregration with module Territory
local C, SND, Clans = AMB.G.C, AMB.G.SND, AMB.Clans

local SendMsg = AMB.UI.Chat.SendMessage
local ShowError = function( ePly, sText ) AMB.Re.Notify( ePly, { sound = SND.ERROR, time = 8, color = C.AMB_ERROR, type = 1, text = sText } ) end

AMB.Clans.Capture = AMB.Clans.Capture or {}
AMB.Clans.Capture.frags = AMB.Clans.Capture.frags or {}
AMB.Clans.Capture.clans = AMB.Clans.Capture.clans or {}

local function SetFrags( nClanID, nFrags )

    AMB.Clans.Capture.frags[ nClanID ] = nFrags 

end

local function GetFrags( nClanID )

    local frags = AMB.Clans.Capture.frags[ nClanID ]

    return frags

end

local function SetClanCapture( nClanID, bInCapture )

    AMB.Clans.Capture.clans[ nClanID ] = bInCapture

end

local function GetClanCapture( nClanID )

    return AMB.Clans.Capture.clans[ nClanID ]

end

local net_send_table_chunks = AMB.Network.AddString( 'amb_clans_capture_send_table_chunks' )
function AMB.Clans.Capture.SendClientsTable( ePly )

    net.Start( net_send_table_chunks )
        net.WriteTable( AMB.Territory.Config.chunks )
    if ePly then net.Send( ePly ) else net.Broadcast() end

end

function AMB.Clans.Capture.SetDelay( nClanID, nDelay )

    timer.Create( 'CaptureDelay:'..nClanID, nDelay, 1, function() end )

end

function AMB.Clans.Capture.RemoveDelay( nClanID )

    timer.Remove( 'CaptureDelay:'..nClanID )

end

function AMB.Clans.Capture.GetDelay( nClanID )

    return timer.TimeLeft( 'CaptureDelay:'..nClanID )

end

function AMB.Clans.Capture.SetBlock( nClanID, nBlock )

    timer.Create( 'CaptureBlock:'..nClanID, nBlock, 1, function() end )

end

function AMB.Clans.Capture.RemoveBlock( nClanID )

    timer.Remove( 'CaptureBlock:'..nClanID )

end

function AMB.Clans.Capture.GetBlock( nClanID )

    return timer.TimeLeft( 'CaptureBlock:'..nClanID )

end

function AMB.Clans.Capture.Set( sChunk, nClanID, bGiveReward )

    local Terra = AMB.Territory

    nClanID = nClanID or 0

    local chunk = Terra.GetChunk( sChunk )
    if not chunk then return end

    local clan = Clans.GetClan( nClanID )
    if not clan then clan = 0 end

    if ( clan ~= 0 ) then

        Clans.AddTerritory( nClanID, 1 )
        if chunk.owner and ( chunk.owner ~= 0 ) then Clans.AddTerritory( chunk.owner, -1 ) end

    end

    chunk.color = ( clan ~= 0 ) and clan.color or C.AMB_GRAY
    chunk.owner = nClanID
    chunk.capter = nil

    AMB.Clans.Capture.SendClientsTable()

    if ( clan == 0 ) then return end

    local CFG = AMB.Clans.Config

    AMB.Clans.Capture.SetDelay( nClanID, CFG.capture_delay_win_noname_zones * 60 )
    SetClanCapture( nClanID, false )
    chunk.capter = false

    for _, ply in pairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) == nClanID ) then 
        
            if ply.capter_without_chunk then ply.capter_without_chunk = nil end
            if bGiveReward then 
            
                local xp = math.random( 75, 199 ) -- с учётом внутреннего налога клана от 15% до 75%
                ply:AddXPEco( xp ) 
                
            end

            AMB.UI.Chat.SendMessage( ply, CFG.capture_sound_win_capture, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Теперь территория ', C.AMB_PURPLE, sChunk, C.ABS_WHITE, ' принадлежит Вашему клану!' ) 
            
        end

    end

end

function AMB.Clans.Capture.Start( sChunk, ePly )

    if not Clans.PlayerIsClan( ePly ) then return end

    local clan_id = Clans.PlayerGetClanID( ePly )

    local delay = AMB.Clans.Capture.GetDelay( clan_id )
    if delay then ShowError( ePly, 'У Вашего клана Delay на капт: '..math.floor( delay )..' seconds' ) return end

    local Terra = AMB.Territory

    local chunk_name = Terra.GetChunkName( ePly )
    if not chunk_name then return end

    local chunk = Terra.GetChunk( chunk_name )
    local clan_owner = Clans.GetClan( chunk.owner )
    if ( chunk.owner ~= 0 ) and not clan_owner then chunk.owner = 0 end
    
    if chunk.capter then return end
    if ( chunk.type ~= 'capture' ) then return end
    if chunk.owner and ( chunk.owner == clan_id ) and ( clan_owner.date == Clans.PlayerGetClanDate( ePly ) ) then return end

    local CFG = AMB.Clans.Config

    if not chunk.owner or ( chunk.owner == 0 ) then

        SetClanCapture( clan_id, true )

        chunk.capter = clan_id

        local capture_time = CFG.capture_time_noname_zones * 60
        timer.Create( 'CaptureWithoutOwnerChunk:'..sChunk, capture_time, 1, function() AMB.Clans.Capture.Set( sChunk, clan_id, true ) end )

        ePly.capter_without_chunk = sChunk
        SendMsg( ePly, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Ваша задача не умереть и не выходить с сервера до окончания капта!' )

        for _, ply in pairs( player.GetHumans() ) do

            if ( AMB.Clans.PlayerGetClanID( ply ) == clan_id ) then 
            
                SendMsg( ply, CFG.capture_sound_capture, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Ваш клан начал захват потерянной', C.ABS_WHITE, ' территории: ', C.AMB_PURPLE, chunk_name )
                AMB.Re.Notify( ply, { time = 5.25, color = C.AMB_BLOOD, type = 4, text = 'Продержитесь: '..CFG.capture_time_noname_zones..' минут(ы)' } )

            end

        end

        hook.Call( 'AmbitionClansCapture', nil, ePly, sChunk, false )
    
    else

        local block = AMB.Clans.Capture.GetBlock( chunk.owner )
        if block then ShowError( ePly, 'У клана '..chunk.owner..' Block на территории: '..math.floor( block )..' seconds' ) return end

        SetClanCapture( clan_id, true )
        SetClanCapture( chunk.owner, true )

        SetFrags( clan_id, 0 )
        SetFrags( chunk.owner, 0 )

        ePly.the_main_capter = sChunk
        SendMsg( ePly, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Во время капта Вам нельзя выходить с сервера!' ) 
        
        chunk.capter = clan_id

        local capture_time = CFG.capture_time_owned_zones * 60
        timer.Create( 'CaptureOwnedChunk:'..clan_id, capture_time, 1, function()

            local frags1, frags2 = GetFrags( clan_id ) or 1, GetFrags( chunk.owner ) or 0
            local capture_win = ( frags1 > frags2 ) and true or false
            if ( frags2 == 0 ) then capture_win = true end

            AMB.Clans.Capture.End( chunk_name, capture_win ) 
            
        end ) 

        for _, ply in pairs( player.GetHumans() ) do

            if ( Clans.PlayerGetClanID( ply ) == clan_id ) then 
            
                SendMsg( ply, CFG.capture_sound_capture, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Ваш клан начал захват территории ', C.AMB_PURPLE, chunk_name )
                AMB.Re.Notify( ply, { time = 5.25, color = C.AMB_BLOOD, type = 4, text = 'Захватите за '..CFG.capture_time_owned_zones..' минут(ы)' } )
                ply.the_capter = true

            end

            if ( Clans.PlayerGetClanID( ply ) == chunk.owner ) then 
            
                SendMsg( ply, CFG.capture_sound_capture, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'На территорию ', C.AMB_PURPLE, chunk_name, C.ABS_WHITE, ' напал клан ', C.FLAT_RED, Clans.GetClanName( clan_id ) ) 
                AMB.Re.Notify( ply, { time = 5.25, color = C.AMB_BLOOD, type = 4, text = 'Защищайте: '..CFG.capture_time_owned_zones..' минут(ы)' } )
                ply.the_capter = true

            end

        end

        hook.Call( 'AmbitionClansCapture', nil, ePly, sChunk, true )

    end

end

function AMB.Clans.Capture.End( sChunk, bCaptureWin )

    local chunk = AMB.Territory.GetChunk( sChunk )
    if not chunk then return end

    local capter = chunk.capter
    if not capter then return end
    chunk.capter = nil

    local clan = AMB.Clans.GetClan( capter )

    AMB.Clans.Capture.frags[ capter ] = nil
    AMB.Clans.Capture.frags[ chunk.owner ] = nil

    local CFG = AMB.Clans.Config

    SetClanCapture( capter, false )
    SetClanCapture( chunk.owner, false )

    if bCaptureWin then

        local old_owner = chunk.owner

        chunk.color = clan.color
        chunk.owner = capter

        Clans.AddTerritory( chunk.owner, 1 )
        Clans.AddTerritory( old_owner, -1 )

        -- loser
        AMB.Clans.Capture.SetDelay( old_owner, CFG.capture_delay_lose_owned_zones * 60 )
        AMB.Clans.Capture.SetBlock( old_owner, CFG.capture_block_lose_owned_zones * 60 )

        -- winner
        AMB.Clans.Capture.SetDelay( chunk.owner, CFG.capture_delay_win_owned_zones * 60 )
        AMB.Clans.Capture.SetBlock( chunk.owner, CFG.capture_block_win_owned_zones * 60 )

        for _, ply in pairs( player.GetHumans() ) do

            if ply.the_main_capter then ply.the_main_capter = nil end

            if ( Clans.PlayerGetClanID( ply ) == capter ) then 
            
                SendMsg( ply, CFG.capture_sound_win_capture, C.AMB_GREEN, '[•] ', C.ABS_WHITE, 'Отныне территория ', C.AMB_PURPLE, chunk.name or sChunk, C.ABS_WHITE, ' принадлежит Вашему клану!' ) 
                ply.the_capter = false

                local xp = math.random( 54, 324 )
                ply:AddXPEco( xp )
                
            end

            if ( Clans.PlayerGetClanID( ply ) == old_owner ) then 
            
                SendMsg( ply, CFG.capture_sound_lose_capture, C.AMB_RED, '[•] ', C.ABS_WHITE, 'Вы не смогли защитить территорию ', C.AMB_PURPLE, sChunk ) 
                ply.the_capter = false

            end

        end

        AMB.Clans.Capture.SendClientsTable()

    else

        -- loser
        AMB.Clans.Capture.SetDelay( capter, CFG.capture_delay_lose_owned_zones * 60 )
        AMB.Clans.Capture.SetBlock( capter, CFG.capture_block_lose_owned_zones * 60 )

        -- winner
        AMB.Clans.Capture.SetBlock( chunk.owner, CFG.capture_delay_hold_owned_zones * 60 )

        for _, ply in pairs( player.GetHumans() ) do

            if ply.the_main_capter then ply.the_main_capter = nil end
            if ply.capter_without_chunk then ply.capter_without_chunk = nil end

            if ( Clans.PlayerGetClanID( ply ) == capter ) then 
            
                SendMsg( ply, CFG.capture_sound_lose_capture, C.AMB_RED, '[•] ', C.ABS_WHITE, 'Ваш клан не смог захватить территорию: ', C.AMB_RED, sChunk ) 
                ply.the_capter = false

            end

            if ( Clans.PlayerGetClanID( ply ) == chunk.owner ) then 
            
                SendMsg( ply, CFG.capture_sound_hold_capture, C.AMB_GREEN, '[•] ', C.ABS_WHITE, 'Вы успешно удержали территорию: ', C.AMB_GREEN, sChunk ) 
                ply.the_capter = false

            end

        end

    end

end

hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Clans.Capture.SendChunksPlayers', AMB.Clans.Capture.SendClientsTable )

hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Clans.Capture.StartMemberToCapture', function( ePly ) 

    timer.Simple( 1.22, function()

        if not Clans.PlayerIsClan( ePly ) then return end
        if not AMB.Clans.Capture.frags[ Clans.PlayerGetClanID( ePly ) ] then return end

        local CFG = AMB.Clans.Config

        ePly.the_capter = true
        SendMsg( ePly, CFG.capture_sound_capture, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, table.Random( CFG.capture_random_phrases_connected_on_capture ) ) 

    end )

end )

hook.Add( 'PlayerDeath', 'AMB.Clans.Capture.AddFrag', function( eVictim, eAssasin ) 

    if not IsValid( eAssasin ) or not eAssasin:IsPlayer() then return end
    if not Clans.PlayerIsClan( eVictim ) or not Clans.PlayerIsClan( eAssasin ) then return end

    if eVictim.the_capter and eAssasin.the_capter and ( eVictim ~= eAssasin ) then

        local clan_id = Clans.PlayerGetClanID( eAssasin )
        SetFrags( clan_id, GetFrags( clan_id ) + 1 )
        AMB.Re.Notify( eAssasin, { sound = 'ambition/misc/ding/ding1.wav', time = 3, type = 8, color = C.AMB_RED, text = '+1 Frag' } )
        SendMsg( eAssasin, nil, C.AMB_GREEN, '[•] ', C.ABS_WHITE, 'Всего фрагов: ', C.FLAT_GREEN, tostring( GetFrags( clan_id ) ) ) 

        eAssasin:AddXPEco( math.random( 8, 32 ) )

    end

end )

hook.Add( 'PlayerDeath', 'AMB.Clans.Capture.CanceledCaptureTerritoryWithoutOwner', function( eVictim ) 

    if not Clans.PlayerIsClan( eVictim ) then return end 
    if not eVictim.capter_without_chunk then return end

    local CFG = AMB.Clans.Config
    local Terra = AMB.Territory

    local clan_id = Clans.PlayerGetClanID( eVictim )
    timer.Remove( 'CaptureWithoutOwnerChunk:'..eVictim.capter_without_chunk )
    AMB.Clans.Capture.SetDelay( clan_id, CFG.capture_delay_lose_noname_zones * 60 )

    local chunk = Terra.GetChunk( eVictim.capter_without_chunk )
    chunk.capter = false

    SetClanCapture( clan_id, false )
    eVictim.capter_without_chunk = nil

    for _, ply in pairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) == Clans.PlayerGetClanID( eVictim ) ) then AMB.UI.Chat.SendMessage( ply, CFG.capture_sound_lose_capture, C.AMB_RED, '[•] ', C.AMB_PURPLE, AMB.Gamemode.GetStats( eVictim, 'Gamename' ), C.ABS_WHITE, ', который начал захват, погиб. Капт остановлен' ) end

    end

end )

hook.Add( 'PlayerDisconnected', 'AMB.Clans.Capture.CanceledCaptureTerritoryWithoutOwner', function( ePly ) 

    if not Clans.PlayerIsClan( ePly ) then return end
    if not ePly.capter_without_chunk then return end

    local CFG = AMB.Clans.Config

    local clan_id = Clans.PlayerGetClanID( eVictim )
    timer.Remove( 'CaptureWithoutOwnerChunk:'..ePly.capter_without_chunk )
    AMB.Clans.Capture.SetDelay( clan_id, CFG.capture_delay_lose_noname_zones * 60 )

    local chunk = Terra.GetChunk( ePly.capter_without_chunk )
    chunk.capter = false

    SetClanCapture( clan_id, false )

    for _, ply in pairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) == Clans.PlayerGetClanID( ePly ) ) then AMB.UI.Chat.SendMessage( ply, CFG.capture_sound_lose_capture, C.AMB_RED, '[•] ', C.AMB_PURPLE, AMB.Gamemode.GetStats( ePly, 'Gamename' ), C.ABS_WHITE, ', который начал захват, вышел с сервера. Капт остановлен' ) end

    end

end )

hook.Add( 'PlayerDisconnected', 'AMB.Clans.Capture.TheEndCapture', function( ePly ) 

    if not Clans.PlayerIsClan( ePly ) then return end
    if not ePly.the_main_capter then return end

    AMB.Clans.Capture.End( ePly.the_main_capter )

    local CFG = AMB.Clans.Config

    for _, ply in pairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) == Clans.PlayerGetClanID( ePly ) ) then AMB.UI.Chat.SendMessage( ply, CFG.capture_sound_lose_capture, C.AMB_RED, '[•] ', C.AMB_PURPLE, AMB.Gamemode.GetStats( ePly, 'Gamename' ), C.ABS_WHITE, ', который начал захват, вышел с сервера. Капт остановлен' ) end

    end

end )

local net_send_cmd = AMB.Network.AddString( 'amb_clans_capture_cmd' )
net.Receive( net_send_cmd, function( nLen, ePly )

    if not ePly:IsAuth() then AMB.Adminus.KickCheater( ePly, '3cl000C', 'Неавторизованный ~p~ попытался начать капт территорий' ) return end
    if not AMB.Clans.PlayerIsClan( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl010C', '~p~ попытался начать капт территорий, будучи не в клане' ) return end
    if ( AMB.Clans.PlayerGetAccess( ePly ) < 4 ) then AMB.Adminus.KickCheater( ePly, '2cl020C', '~p~ попытался начать капт территорий, не имея 4 доступа в клане' ) return end

    local chunk_name = AMB.Territory.GetChunkName( ePly )
    if not chunk_name then return end
    if AMB.Territory.GetChunkCapter( ePly ) then ShowError( ePly, 'На этой территорий уже происходит капт' ) return end
    if ( AMB.Territory.GetChunkType( ePly ) ~= 'capture' ) then ShowError( ePly, 'Эта территория не для захвата' ) return end
    if GetClanCapture( Clans.PlayerGetClanID( ePly ) ) then ShowError( ePly, 'Ваш Клан уже с кем-то каптится' ) return end
    if AMB.Territory.GetChunkOwner( ePly ) then 
    
        if GetClanCapture( AMB.Territory.GetChunkOwner( ePly ) ) then ShowError( ePly, 'Клан, на который вы хотите напасть, уже каптится' ) return end

        local clan_owner_id, clan_capter_id = AMB.Territory.GetChunkOwner( ePly ), Clans.PlayerGetClanID( ePly )
        if ( clan_owner_id == clan_capter_id ) then ShowError( ePly, 'Эта территория уже принадлежит Вашему клану' ) return end

    end
    if AMB.Territory.GetChunkOwner( ePly ) and ( AMB.Territory.GetChunkOwner( ePly ) == AMB.Clans.PlayerGetClanID( ePly ) ) then ShowError( ePly, 'Эта территория уже принадлежит Вашему клану' ) return end

    AMB.Clans.Capture.Start( chunk_name, ePly )

end )