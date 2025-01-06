local CFG = AMB.Restrict.Config
local C = AMB.G.C
local SND = AMB.G.SND

local function Error( ePly, sText )

    if not sText then return end

    ePly:NotifySend( { type = 1, time = 10, sound = SND.ERROR, color = C.AMB_ERROR, text = sText } )

end

local function CheckAchievedLimitGamemode( ePly, sType )

    if ( sType == 'tools' ) or ( sType == 'properties' ) then return false end

    local level, count = ePly:GetLevel(), ePly:GetCount( sType )
    local number = ( sType == 'props' ) and 15 or 25

    return count >= level * number

end

local function CheckLevelGamemode( ePly, sName, sType )
    
    if not AMB.Restrict.Config[ sType ][ sName ] then return true end

    local level, gamemode_level = ePly:GetLevel(), AMB.Restrict.Config[ sType ][ sName ].level or 1

    return ( level >= gamemode_level )

end

local function CheckRanks( ePly, sName, sType )

    if not AMB.Restrict.Config[ sType ][ sName ] then return true end

    local rank, gamemode_ranks = ePly:GetUserGroup(), AMB.Restrict.Config[ sType ][ sName ].ranks or {}

    return gamemode_ranks[ rank ]

end

function AMB.Restrict.Check( ePly, sName, sType, bNotify )

    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return false end
    if not ePly:IsAuth() then return false end
    if not sType or not isstring( sType ) then return false end

    local tab = AMB.Restrict.Config.types[ sType ]
    if not tab then return false end

    if AMB.Adminus.Modes.IsPlayer( ePly, 'dev' ) then return true end

    if not tab.available then if bNotify then Error( ePly, sType..' запрещёны!' ) end return false end
    if AMB.Restrict.GetAchievedLimit( ePly, sType ) then if bNotify then Error( ePly, 'Общий лимит '..sType..' достигнут!' ) end return false end

    if CheckAchievedLimitGamemode( ePly, sType ) then if bNotify then Error( ePly, 'Личный лимит '..sType..' достигнут!' ) end return false end
    if not CheckLevelGamemode( ePly, sName, sType ) then if bNotify then Error( ePly, 'Не хватает уровня!' ) end return false end
    if not CheckRanks( ePly, sName, sType ) then if bNotify then Error( ePly, 'Вашему рангу запрещено!' ) end return false end

    return true

end

function AMB.Restrict.GetAchievedLimit( ePly, sType )

    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return true end
    if not sType or not isstring( sType ) then return true end

    if ( sType == 'tools' ) or ( sType == 'properties' ) then return false end

    local tab = AMB.Restrict.Config.types[ sType ]
    if not tab then return true end

    return ( ePly:GetCount( sType ) >= tab.limit )

end