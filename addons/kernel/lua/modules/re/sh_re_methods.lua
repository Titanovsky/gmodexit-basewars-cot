AMB.Re = AMB.Re or {}

-- ##############################################

local PLAYER = FindMetaTable( 'Player' )

function PLAYER:IsAuth()

    if not IsValid( self ) then return false end
    
    return self:GetNWBool( 'Auth' )

end

function PLAYER:IsClan()

    if not IsValid( self ) then return false end
    
    return ( self:GetNWInt( 'Clan' ) > 0 ) and true or false

end

function PLAYER:IsLeaderClan()

    if not IsValid( self ) then return false end
    
    return ( self:GetNWInt( 'ClanRank' ) >= 6 ) and true or false

end

function PLAYER:GetGamename()

    return AMB.NW.GetString( self, 'Gamename' )

end

function PLAYER:GetMoney()

    return AMB.NW.GetInt( self, 'Money' ) or 0

end

function PLAYER:GetLevel()

    return AMB.NW.GetInt( self, 'Level' ) or 0

end

function PLAYER:GetXP()

    return AMB.NW.GetInt( self, 'XP' ) or 0

end

function PLAYER:GetGameSkin()

    return AMB.NW.GetString( self, 'Skin' )

end

-- ##############################################

function AMB.Re.PlayerIsAuth( ePly )

    if not ePly:IsPlayer() then return false end

    return ePly:GetNWBool( 'Auth' )

end