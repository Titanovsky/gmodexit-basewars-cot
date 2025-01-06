local PLAYER = FindMetaTable( 'Player' )

AMB.Inventory.players_inv = AMB.Inventory.players_inv or {}

PLAYER.GetItemsInv = function( self ) return AMB.Inventory.players_inv[ self:SteamID64() ] end

PLAYER.GetItemInv = function( self, nSlot ) return AMB.Inventory.players_inv[ self:SteamID64() ][ nSlot ] end

PLAYER.GetItemIDInv = function( self, nSlot, nID )

    local item = AMB.Inventory.players_inv[ self:SteamID64() ][ nSlot ]
    if not item then return false end

    return item.id == nID

end

PLAYER.GetLastFreeSlotInv = function( self )

    for slot, item in ipairs( AMB.Inventory.players_inv[ self:SteamID64() ] ) do

        if item.empty then return slot end

    end

end

PLAYER.GetCountItem = function( self, sClass )

    local ply_inv = self:GetItemsInv()
    local item_class = AMB.Inventory.Config.objects[ sClass ]
    if not item_class then return end

    local count = 0
    for slot, item in ipairs( ply_inv ) do

        if ( item.class ) then count = count + item.count end

    end

    return count

end

PLAYER.GetItemOnClassInv = function( self, sClass )

    local ply_inv = self:GetItemsInv()
    local item_class = AMB.Inventory.Config.objects[ sClass ]

    for slot, obj in ipairs( ply_inv ) do
        
        if ( obj.id == item_class.id ) then return obj end 

    end

end

local block_weps_drop = {

    [ 'weapon_bugbait' ] = true,
    [ 'weapon_physcannon' ] = true,
    [ 'weapon_fists' ] = true,
    [ 'gmod_tool' ] = true,
    [ 'weapon_physgun' ] = true,
    [ 'gmod_camera' ] = true

}

local Add = AMB.ChatCommands.AddCommand
Add( 'dropweapon', 'Inventory', 'Выкинуть оружие, которое в руке.', 1, function( ePly, tArgs ) 

    local wep = ePly:GetActiveWeapon()
    if not IsValid( wep ) then return end
    if block_weps_drop[ wep:GetClass() ] then return end

    local pos, ang = AMB.Utility.GetFrontPos( ePly, 60 ), ePly:EyeAngles()

    local ent = ents.Create( 'inv_weapon' )
    ent:SetPos( pos )
    ent:SetAngles( ang )
    ent:SetWeapon( wep:GetClass() )
    ent:Spawn()
    ent:SetModel( wep:GetModel() )

    ePly:PropCoreAdd( ent )

    ePly:StripWeapon( wep:GetClass() )

end )