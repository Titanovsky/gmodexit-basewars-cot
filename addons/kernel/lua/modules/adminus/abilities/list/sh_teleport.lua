local C = AMB.G.C
local Add = AMB.Adminus.Abilities.RegisterAbility

Add( 'Goto', 1, { [1] = 'id:Player' }, 'Телепортироваться к игроку', 'goto', function( eCaller, tOptions ) 

    local target = tOptions[ 1 ]

    if not eCaller or not IsValid( eCaller ) then return end

    if IsValid( target ) and target:IsPlayer() then

        if ( eCaller == target ) then AMB.UI.Chat.SendMessage( eCaller, nil, C.AMB_ERROR, '[•] ', C.ABS_WHITE, 'Нельзя телепортироваться к самому себе!' )  return end
        if ( eCaller:GetMoveType() ~= MOVETYPE_NOCLIP ) then eCaller:SetMoveType( MOVETYPE_NOCLIP ) end

        eCaller.return_coords = eCaller:GetPos()
        eCaller:SetPos( target:GetPos() )

        AMB.UI.Chat.SendMessage( target, nil, C.AMBITION, '[•] ', C.FLAT_GREEN, AMB.Gamemode.GetStats( eCaller, 'gamename' ), C.ABS_WHITE, ' телепортировался к Вам' )

    end

end )

Add( 'Bring', 1, { [1] = 'id:Player' }, 'Телепортировать игрока', 'bring', function( eCaller, tOptions ) 

    local target = tOptions[ 1 ]

    if IsValid( target ) and target:IsPlayer() then

        if ( eCaller == target ) then AMB.UI.Chat.SendMessage( eCaller, nil, C.AMB_ERROR, '[•] ', C.ABS_WHITE, 'Нельзя телепортировать себя!' )  return end

        target.return_coords = target:GetPos()
        target:SetPos( eCaller:GetPos() + ( eCaller:GetAimVector() * 100 ) + Vector( 0, 0, 42 ) )
        AMB.UI.Chat.SendMessage( target, nil, C.AMBITION, '[•] ', C.FLAT_GREEN, AMB.Gamemode.GetStats( eCaller, 'gamename' ), C.ABS_WHITE, ' телепортировал Вас к себе' )

    end

end )

Add( 'Return', 1, { [1] = 'id:Player' }, 'Вернуть игрока на место до телепортаций', 'return', function( eCaller, tOptions ) 

    local target = tOptions[ 1 ]

    if IsValid( target ) and target:IsPlayer() then

        if not target.return_coords then return end

        target:SetPos( target.return_coords )
        AMB.UI.Chat.SendMessage( target, nil, C.AMBITION, '[•] ', C.FLAT_GREEN, AMB.Gamemode.GetStats( eCaller, 'gamename' ), C.ABS_WHITE, ' вернул Вас обратно' )

    end

end )