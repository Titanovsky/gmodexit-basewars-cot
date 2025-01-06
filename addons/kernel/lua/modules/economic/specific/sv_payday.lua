local CFG = AMB.Economic.Config
local C = AMB.G.C

local count = 0
local debug_count = 0

function AMB.Economic.Payday()

    local date = os.date( '%X', os.time() )
    count = count + 1

    for _, ply in pairs( player.GetHumans() ) do 
    
        if not ply:IsAuth() then continue end

        CFG.payday_action( ply ) 
        
    end

    print( '[PayDay] '..count..' | '..date )

end

if not timer.Exists( 'AmbEconomicPayDay' ) then 

    AMB.ConsoleLog( 'PayDay', 'Timer has created' )
    timer.Create( 'AmbEconomicPayDay', CFG.payday_delay, 0, function() AMB.Economic.Payday() end )

end

function AMB.Economic.DebugPayday( ePly )

    if not ePly:IsAuth() then return end
    
    debug_count = debug_count + 1 

    AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_BLACK, '[•] ', C.ABS_WHITE, 'Пришла '..debug_count..' зарплата  |  '..os.date( '%X', os.time() ) )
    CFG.payday_action( ePly )

    print( '[PayDay] '..count..' | '..tostring( ePly )..' | '..date )

end