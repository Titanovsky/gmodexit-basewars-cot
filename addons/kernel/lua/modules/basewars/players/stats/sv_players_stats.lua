local AMB, CFG, NW, SQL, GM, C, Chat = AMB, AMB.Gamemode.Config, AMB.NW, AMB.SQL, AMB.Gamemode, AMB.G.C, AMB.UI.Chat
local notify_type = CFG.notify_type

local db = SQL.GetTable( 'amb_'..AMB.Config.prefix..'_stats' )

function AMB.Gamemode.SetStats( eObj, sType, anyValue, bNotify )

    if not eObj or not IsValid( eObj ) then AMB.ErrorLog( 'Gamemode', 'eObj is not valid' ) return false end
    if not sType then AMB.ErrorLog( 'Gamemode', 'sType is not specified' ) return false end
    if ( anyValue == nil ) then AMB.ErrorLog( 'Gamemode', 'anyValue is not specified' ) return false end

    local ID = eObj:IsPlayer() and eObj:SteamID() or false

    if eObj:IsPlayer() and not AMB.Auth.IsPlayer( eObj ) then return end

    if ( sType == 'Gamename' ) or ( sType == 'Name' ) then

        anyValue = AMB.Auth.VerificateName( tostring( anyValue ) )

        NW.SetString( eObj, 'Gamename', anyValue )
        if ID then 
        
            SQL.Update( db, 'Gamename', anyValue, 'SteamID', ID )
            if bNotify then AMB.UI.Notify.DrawNotify( eObj, notify_type, { text = 'Ваше Gamename изменено на '..anyValue, time = 4, color = C.AMB_PURPLE } ) end
            
        end

        return GM.GetStats( eObj, sType )

    elseif ( sType == 'Level' ) then

        anyValue = math.floor( anyValue )
        if ( anyValue < 0 ) or ( anyValue > 60 ) then return end -- todo: set 60 on Config ( max_level )

        local xp = 0
        local nxp = anyValue * CFG.balance_next_xp

        NW.SetInt( eObj, 'Level', anyValue )
        NW.SetInt( eObj, 'XP', xp )
        NW.SetInt( eObj, 'NXP', nxp )
        if ID then 
        
            SQL.Update( db, 'Level', anyValue, 'SteamID', ID )
            SQL.Update( db, 'XP', xp, 'SteamID', ID )
            if bNotify then AMB.UI.Notify.DrawNotify( eObj, notify_type, { text = 'Ваш Level изменен на '..anyValue, time = 4, color = C.AMBITION } ) end
            
        end

        return GM.GetStats( eObj, sType )

    elseif ( sType == 'XP' ) then

        anyValue = math.floor( anyValue )

        local nxp = GM.GetStats( eObj, 'NXP' )
        local lvl = GM.GetStats( eObj, 'Level' )

        if not nxp or not lvl then AMB.ErrorLog( 'Gamemode', 'XP is not set, because not founded NXP or Level for '..tostring( eObj ) ) return false end

        if ( anyValue >= nxp ) and ( lvl >= 60 ) then -- todo: set 60 on Config ( max_level )

            local xp = 60 * CFG.balance_next_xp

            NW.SetInt( eObj, 'XP', xp )
            SQL.Update( db, 'XP', xp, 'SteamID', ID ) 

        elseif ( anyValue > nxp ) then
            
            local remains = anyValue - nxp

            GM.AddStats( eObj, 'Level', 1, true )
            GM.AddStats( eObj, 'XP', remains )

        elseif ( anyValue == nxp ) then

            GM.AddStats( eObj, 'Level', 1, true )

        else

            NW.SetInt( eObj, 'XP', anyValue )

            if ID then 
            
                SQL.Update( db, 'XP', anyValue, 'SteamID', ID ) 
                if bNotify then AMB.UI.Notify.DrawNotify( eObj, notify_type, { text = 'Ваше XP изменено на '..anyValue, time = 4, color = C.AMBITION } ) end

            end

        end

        return GM.GetStats( eObj, sType )

    elseif ( sType == 'Money' ) then

        anyValue = math.floor( anyValue )

        if ( anyValue < 0 ) then 
        
            anyValue = 0
            AMB.WarningLog( 'Gamemode', 'Attempt to set negative anyValue for Money, anyValue changed on 0' ) 
            
        end
    
        NW.SetInt( eObj, 'Money', anyValue )
        if ID then 
        
            SQL.Update( db, 'Money', anyValue, 'SteamID', ID )
            if bNotify then AMB.UI.Notify.DrawNotify( eObj, notify_type, { type = 16, text = 'Ваши Money изменены на '..anyValue, time = 4, color = C.AMB_GREEN } ) end
            
        end

        return GM.GetStats( eObj, sType )

    end

    return false

end

function AMB.Gamemode.AddStats( eObj, sType, anyValue, bNotify )

    if ( anyValue == 0 ) then AMB.WarningLog( 'Gamemode', 'Attempt to add value 0' ) end
    if eObj:IsPlayer() and not AMB.Auth.IsPlayer( eObj ) then return end

    if ( sType == 'Level' ) then

        local lvl = NW.GetInt( eObj, 'Level' )
        local value = lvl + anyValue
        if bNotify and eObj:IsPlayer() then   

            -- todo: show different notify pages with information
            Chat.SendMessage( eObj, 'ambition/bf5/interact1.ogg', C.AMBITION, '[•] ', C.ABS_WHITE, 'Поздравляем, Вы достигли ', C.FLAT_GREEN, tostring( value ), C.ABS_WHITE, ' уровня!' )

        end

        hook.Call( 'AmbitionGamemodeUpLevel', nil, eObj, lvl, value )

        return GM.SetStats( eObj, sType, lvl + anyValue )

    elseif ( sType == 'XP' ) then

        local xp = NW.GetInt( eObj, 'XP' )
        local value = xp + anyValue
        if bNotify and eObj:IsPlayer() then AMB.UI.Notify.DrawNotify( eObj, notify_type, { type = 14, text = '+'..anyValue..' XP', time = 4.5, color = C.FLAT_PURPLE } ) end

        return GM.SetStats( eObj, sType, value )

    elseif ( sType == 'Money' ) then

        local money = NW.GetInt( eObj, 'Money' )
        local value = money + anyValue
        local char = ( anyValue >= 0 ) and '+' or ''
        local col = ( anyValue >= 0 ) and C.AMB_GREEN or C.AMB_RED
        local snd = ( anyValue >= 0 ) and AMB.Sound( 'misc/coin/coin1.wav' ) or AMB.Sound( 'misc/money/money_send1.wav' )
        if bNotify and eObj:IsPlayer() then AMB.UI.Notify.DrawNotify( eObj, notify_type, { type = 16, text = char..anyValue, time = 4.5, color = col, sound = snd } ) end

        return GM.SetStats( eObj, sType, value )

    end

    return false

end