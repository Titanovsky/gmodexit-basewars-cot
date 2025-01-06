AMB.Clans.table = AMB.Clans.table or {}

local CFG = AMB.Clans.Config
local C = AMB.G.C

-- ################################
local db = AMB.SQL.CreateTable( CFG.db_clans, 'ID NUMBER, Name TEXT, LeaderID TEXT, Description TEXT, Avatar TEXT, Color TEXT, Ranks TEXT, Level NUMBER, XP NUMBER, Balance NUMBER, Tax NUMBER, Upgrade NUMBER, Date NUMBER' )
-- ################################

local net_send_clan_to_client = AMB.Network.AddString( 'amb_clans_send_table_client' )
function AMB.Clans.SendTableClanToClient( nID, ePly )

    net.Start( net_send_clan_to_client )
        net.WriteUInt( nID, 12 )
        net.WriteTable( AMB.Clans.table[ nID ] )
    if ePly then net.Send( ePly ) else net.Broadcast() end

    local str = ePly and tostring( ePly ) or 'all'
    AMB.Debug( function() print( '[DEBUG] [Clans] Send Clan '..nID..' to '..str ) end )

end
local SendTableClanToClient = AMB.Clans.SendTableClanToClient

local keys_db = 'ID, Name, LeaderID, Description, Avatar, Color, Ranks, Level, XP, Balance, Tax, Upgrade, Date'
local type_keys_db = '%i, %s, %s, %s, %s, %s, %s, %i, %i, %i, %f, %i, %i'

local function GetID()
end

function AMB.Clans.RegisterClan( eLeader, sName, cColorClan, sDescription, nTax )

    if not eLeader:IsPlayer() then return false end 

    -- ##############################
    local ID = #AMB.Clans.table + 1
    sName = sName or 'New Clan'
    local LeaderID = eLeader:SteamID()
    sDescription = sDescription or 'We are future!'
    cColorClan = cColorClan or C.AMB_PURPLE
    local Ranks = '1 = Ранг I, 0; 2 = Ранг II, 0; 3 = Ранг III, 0; 4 = Офицер, 1; 5 = Заместитель, 2; 6 = Лидер, 6'
    local Level = 1
    local XP = 0
    local Balance = 20000
    if not nTax or ( nTax > CFG.tax_xp_max ) or ( nTax < CFG.tax_xp_min ) then nTax = CFG.tax_xp_min end
    local Upgrade = 0
    local Date = os.time()

    
    AMB.Clans.table[ ID ] = {

        id = ID,
        name = sName,
        desc = sDescription,
        color = cColorClan,
        tax =  nTax,
        leader = LeaderID,
        upgrade = Upgrade,
        level = Level,
        xp = XP,
        nxp = 5000,
        balance = Balance,
        date = Date,
        territory = 0,
        members = {},
        ranks = { 
            
            [ 1 ] = { name = 'Ранг I', access = 0 },
            [ 2 ] = { name = 'Ранг II', access = 0 },
            [ 3 ] = { name = 'Ранг III', access = 0 },
            [ 4 ] = { name = 'Офицер', access = 1 },
            [ 5 ] = { name = 'Заместитель', access = 2 },
            [ 6 ] = { name = 'Лидер', access = 6 },
            
        }

    }

    AMB.NW.SetInt( eLeader, 'ClanRank', 6 )
    AMB.Clans.AddPlayer( eLeader, ID )

    AMB.Clans.SetMembers( ID )
    SendTableClanToClient( ID )

    AMB.SQL.Insert( db, keys_db, type_keys_db, ID, sName, LeaderID, sDescription, '', tostring( cColorClan ), Ranks, Level, XP, Balance, nTax, Upgrade, Date )
    -- ##############################
    
    AMB.UI.Chat.SendMessage( eLeader, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Вы создали клан ID '..ID..' под названием '..sName )

    AMB.ConsoleLog( 'Clans', 'Clan | '..ID..' | has Created! '..AMB.Utility.GetRussianDate( Date ) )

    hook.Call( 'AmbitionClansCreateClan', nil, eLeader, nID, AMB.Clans.table[ ID ] )

    return true

end

function AMB.Clans.RemoveClan( nID )

    if not AMB.Clans.table[ nID ] then return end

    for name, chunk in pairs( AMB.Territory.Config.chunks ) do

        if ( chunk.type == 'capture' ) and chunk.owner and ( chunk.owner == nID ) then

            AMB.Territory.Config.chunks[ name ].owner = 0
            AMB.Territory.Config.chunks[ name ].color = C.ABS_WHITE

        end

    end

    if AMB.Clans.Capture.GetDelay( nID ) then AMB.Clans.Capture.RemoveDelay( nID ) end
    if AMB.Clans.Capture.GetBlock( nID ) then AMB.Clans.Capture.RemoveBlock( nID ) end

    AMB.Clans.RemovePlayers( nID )

    AMB.Clans.Capture.SendClientsTable()

    AMB.Clans.table[ nID ] = {}
    SendTableClanToClient( nID )
    AMB.Clans.table[ nID ] = nil
    AMB.SQL.Delete( db, 'ID', nID )

    AMB.ConsoleLog( 'Clans', 'Clan | '..nID..' | has Removed! '..AMB.Utility.GetRussianDate( os.time() ) )

end

function AMB.Clans.SetMembers( nID )

    if not AMB.Clans.GetClan( nID ) then return end

    local db_players = CFG.db_players

    local tab = AMB.SQL.SelectAll( db_players ) or {}
    local new_tab = {}
    AMB.Clans.table[ nID ].members = {}

    local i = 0
    for k, v in pairs( tab ) do

        if ( tonumber( v.Clan ) ~= nID ) then continue end

        i = i + 1

        new_tab[ i ] = {

            name = v.Gamename,
            rank = tonumber( v.Rank ),
            steamid = v.SteamID,
            date = tonumber( v.Date )

        }

    end

    table.Merge( AMB.Clans.table[ nID ].members, new_tab )

    SendTableClanToClient( nID )

end

function AMB.Clans.HandOver( nID, sSteamID, eLeader )

    if not AMB.Clans.table[ nID ] then return end
    if ( AMB.Clans.GetPlayerOfflineClanID( sSteamID ) == 0 ) then return end

    AMB.Clans.SetRankOffline( sSteamID, 6, eLeader )
    AMB.Clans.SetRank( eLeader, 5, eLeader )

    AMB.Clans.table[ nID ].leader = sSteamID

    SendTableClanToClient( nID )

end

hook.Add( 'PostGamemodeLoaded', 'AMB.Clans.SetupTableClans', function()

    local database = AMB.SQL.SelectAll( db )
    if not database or ( #database == 0 ) then return end

    for i, v in ipairs( database ) do

        local ID = tonumber( v.ID )

        AMB.Clans.table[ ID ] = {

            name = v.Name,
            leader = v.LeaderID,
            desc = v.Description,
            avatar = v.Avatar,
            color = string.ToColor( v.Color ),
            level = tonumber( v.Level ),
            xp = tonumber( v.XP ),
            nxp = AMB.Clans.CalcNXP( tonumber( v.Level ) ),
            balance = tonumber( v.Balance ),
            tax = ( v.Tax ),
            upgrade = tonumber( v.Upgrade ),
            date = tonumber( v.Date ),
            territory = 0,
            members = {},
            ranks = AMB.Clans.CalcRanks( v.Ranks )

        }

        AMB.Clans.SetMembers( ID )

    end

end )

hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Clans.SendToClientTable', function( ePly )

    AMB.Debug( function() print( '[DEBUG] [Clans] Send Table Of Clans to '..tostring( ePly ) ) end )

    for id, _ in pairs( AMB.Clans.GetClans() ) do 
    
        timer.Simple( 0.15 + id / 100, function() SendTableClanToClient( id, ePly ) end )
        
    end

end )