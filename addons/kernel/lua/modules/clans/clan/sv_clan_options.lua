local CFG = AMB.Clans.Config
local C = AMB.G.C

local net_send_clan_to_client = AMB.Network.AddString( 'amb_clans_send_table_client' )
local function SendTableClanToClient( nID )

    net.Start( net_send_clan_to_client )
        net.WriteUInt( nID, 12 )
        net.WriteTable( AMB.Clans.table[ nID ] )
    net.Broadcast()

end

function AMB.Clans.SetBalance( nID, nAmount )

    if not AMB.Clans.table[ nID ] then return end

    nAmount = math.floor( nAmount )

    AMB.Clans.table[ nID ].balance = nAmount

    AMB.SQL.Update( CFG.db_clans, 'Balance', nAmount, 'ID', nID )
    SendTableClanToClient( nID )

end

function AMB.Clans.AddBalance( nID, nAmount )

    if not AMB.Clans.table[ nID ] then return end

    nAmount = math.floor( nAmount )

    local balance = AMB.Clans.table[ nID ].balance

    AMB.Clans.SetBalance( nID, balance + nAmount )

end

function AMB.Clans.AddTerritory( nID, nAmount )

    if not AMB.Clans.table[ nID ] then return end

    AMB.Clans.table[ nID ].territory = AMB.Clans.table[ nID ].territory + 1

    SendTableClanToClient( nID )

end

function AMB.Clans.ChangeLeader( nID, ePly )

    if not AMB.Clans.table[ nID ] then return end
    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return end

    local steamid = ePly:SteamID()

    AMB.Clans.table[ nID ].leader = steamid

    AMB.SQL.Update( CFG.db_clans, 'LeaderID', steamid, 'ID', nID )
    SendTableClanToClient( nID )

    AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Вы стали новым лидером клана ', AMB.Clans.GetClanColor( nID ), AMB.Clans.GetClanName( nID ) )

end

function AMB.Clans.ChangeRanks( nID, tRanks )

    if not AMB.Clans.table[ nID ] then return end
    if not tRanks or not istable( tRanks ) then return end
    if not ( #tRanks == 6 ) then return end

    AMB.Clans.table[ nID ].ranks = tRanks
    SendTableClanToClient( nID )

    local str = ''

    for id, rank in ipairs( tRanks ) do

        local toend = ';'

        if ( id == 6 ) then toend = '' end

        str = str..id..' = '..rank.name..', '..rank.access..toend..' '

    end

    AMB.SQL.Update( CFG.db_clans, 'Ranks', str, 'ID', nID )

end

function AMB.Clans.SetLevel( nID, nLevel )

    if not AMB.Clans.table[ nID ] then return end

    nLevel = math.floor( nLevel )
    if ( nLevel < 0 ) or ( nLevel > CFG.max_level ) then return end

    AMB.Clans.table[ nID ].level = nLevel
    AMB.Clans.table[ nID ].xp = 0
    AMB.Clans.table[ nID ].nxp = AMB.Clans.CalcNXP( nLevel )

    AMB.SQL.Update( CFG.db_clans, 'Level', nLevel, 'ID', nID )
    AMB.SQL.Update( CFG.db_clans, 'XP', 0, 'ID', nID )
    SendTableClanToClient( nID )

end

function AMB.Clans.SetXP( nID, nXP )

    if not AMB.Clans.table[ nID ] then return end

    nXP = math.floor( nXP )

    local level = AMB.Clans.GetClanLevel( nID )
    local max_xp = AMB.Clans.table[ nID ].nxp

    if ( nXP >= max_xp ) and ( level >= CFG.max_level ) then

        local xp = AMB.Clans.CalcNXP( CFG.max_level )
        AMB.Clans.table[ nID ].xp = xp
        AMB.SQL.Update( CFG.db_clans, 'XP', xp, 'ID', nID )
        SendTableClanToClient( nID )

    elseif ( nXP > max_xp ) then

        AMB.Clans.SetLevel( nID, level + 1 )

        local remains = nXP - max_xp
        AMB.Clans.AddXP( nID, remains )

    elseif ( nXP == max_xp ) then

        AMB.Clans.SetLevel( nID, level + 1 )

    elseif ( nXP < max_xp ) then

        AMB.Clans.table[ nID ].xp = nXP
        AMB.SQL.Update( CFG.db_clans, 'XP', nXP, 'ID', nID )
        SendTableClanToClient( nID )

    end

end

function AMB.Clans.AddXP( nID, nXP )

    if not AMB.Clans.table[ nID ] then return end

    nXP = math.floor( nXP )
    local xp = AMB.Clans.GetClanXP( nID )

    return AMB.Clans.SetXP( nID, nXP + xp )

end

-- ## Outer Tax 

local db = AMB.SQL.CreateTable( CFG.db_outer_tax, 'Clan NUMBER, Date NUMBER' )
function AMB.Clans.GetReadyTakeOuterTax( nID )

    if not AMB.Clans.table[ nID ] then return end

    local prev_time = AMB.SQL.Select( db, 'Date', 'Clan', nID )
    if not prev_time then prev_time = 0 else prev_time = tonumber( prev_time ) end

    return ( os.time() >= prev_time + 60 * 60 * 24 )

end

function AMB.Clans.TakeOuterTax( nID )

    if not AMB.Clans.table[ nID ] then return end

    local tax = AMB.Clans.CalcOuterTax( nID )
    local day = os.time() + 60 * 60 * 24

    local old_balance = AMB.Clans.GetClanBalance( nID )
    AMB.Clans.AddBalance( nID, -tax )

    AMB.SQL.Get( db, 'Clan', 'Clan', nID, function()
    
        AMB.SQL.Update( db, 'Date', day, 'Clan', nID ) 
        
    end, function()
        
        AMB.SQL.Insert( db, 'Clan, Date', '%i, %i', nID, day )

    end )

    local new_balance = AMB.Clans.GetClanBalance( nID )
    if ( new_balance <= -tax ) then 
    
        print( '[Clans] Clan ID '..nID..' was removed, because non-payment of Outer Tax' )
        AMB.Clans.RemoveClan( nID )
        AMB.SQL.Delete( db, 'Clan', nID )

    else

        print( '[Clans] Take Outer Tax: ID '..nID..' - '..tax..'$, next payment '..os.date( '%X %x', day ) )
        
    end

end

hook.Add( 'PostGamemodeLoaded', 'AMB.Clans.PaymentOuterTax', function()

    timer.Simple( 2, function()

        local clans = AMB.Clans.GetClans()

        for id, _ in pairs( clans ) do

            if AMB.Clans.GetReadyTakeOuterTax( id ) then AMB.Clans.TakeOuterTax( id ) end

        end

    end )

end )