local PLAYER = FindMetaTable( 'Player' )
local C = AMB.G.C

PLAYER.SetSlotInv = function( self, nSlot, sClass, nCount, tOptions )

    local CFG = AMB.Inventory.Config
    local item_class = CFG.objects[ sClass ]
    if not item_class then return end
    if not nSlot or ( nSlot > CFG.max_slots ) or ( nSlot < 1 ) then return end

    local sid64 = self:SteamID64()

    if ( nCount <= 0 ) then AMB.Inventory.players_inv[ sid64 ][ nSlot ] = { empty = true } return end
    if ( nCount > item_class.max ) then AMB.WarningLog( 'Inventory', 'SetSlotInv for '..tostring( self )..' with nCount ('..nCount..') > max ('..item_class.max..')' ) end

    for slot, item in ipairs( AMB.Inventory.players_inv[ sid64 ] ) do

        if ( slot ~= nSlot ) then continue end

        item.empty = nil
        item.id = item_class.id
        item.class = sClass
        item.count = nCount
        item.options = tOptions

    end

    AMB.Debug( function()

        --self:ChatPrint( '[Inventory] SetSlot S:'..nSlot..' | I:'..sClass..' | C:'..nCount )

        if self:GetItemIDInv( nSlot, item_class.id ) then 
        
            MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.SetSlot for '..tostring( self )..' [ S:'..nSlot..' I:'..sClass..' C:'..nCount..' ] has ', C.AMB_GREEN, 'successful!'..'\n' )

        else 
        
            MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.SetSlot for '..tostring( self )..' [ S:'..nSlot..' I:'..sClass..' C:'..nCount..' ] has ', C.AMB_RED, 'failed!'..'\n' )

        end

    end )

    AMB.Inventory.SaveItems( self )
    AMB.Inventory.SendInventory( self, nSlot )

end

PLAYER.AddItemInv = function( self, sClass, nCount, tOptions )

    local CFG = AMB.Inventory.Config
    local max_slots = CFG.max_slots
    local item_class = CFG.objects[ sClass ]
    if not item_class then AMB.WarningLog( 'Inventory', 'Not Item: '..tostring( sClass ) ) return end
    if ( nCount == 0 ) then AMB.WarningLog( 'Inventory', 'Try AddItemInv with nCount = 0, sClass = '..sClass..' on '..tostring( self ) ) end

    local new_item = false
    local new_slot = 0
    local sid64 = self:SteamID64()

    for slot, item in ipairs( AMB.Inventory.players_inv[ sid64 ] ) do

        if item.empty then
        
            local last_slot = self:GetLastFreeSlotInv()
            if not last_slot then return end

            local remains = 0
            if ( nCount > item_class.max ) then

                remains = nCount - item_class.max
                nCount = item_class.max

            end

            self:SetSlotInv( last_slot, sClass, nCount, tOptions )

            if ( remains > 0 ) then self:AddItemInv( sClass, remains, tOptions ) end

            return

        else
            
            if ( slot == max_slots ) and ( item.class ~= sClass ) then return end
            if ( slot == max_slots ) and ( item.count == item_class.max ) then return end
            if ( item.class ~= sClass ) then continue end
            if ( item.count == item_class.max ) then continue end

            item.count = item.count + nCount
            new_slot = slot

            if ( item.count > item_class.max ) then 
                
                local remains = item.count - item_class.max
                item.count = item_class.max
                self:AddItemInv( sClass, remains, tOptions )

            end

            AMB.Inventory.SendInventory( self, slot )

            break

        end
    
    end

    AMB.Debug( function()

        --self:ChatPrint( '[Inventory] AddItem S:'..new_slot..' I:'..sClass..' | AddC:'..nCount..' | NewI:'..tostring( new_item ) )

        MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.AddItem for '..tostring( self )..' [ I:'..sClass..' C:'..nCount..' NewI:'..tostring( new_item )..' ] has ', C.AMB_GREEN, 'successful!'..'\n' )

    end )

    AMB.Inventory.SaveItems( self )

end

PLAYER.RemoveItemInv = function( self, nSlot ) 

    local item = AMB.Inventory.players_inv[ self:SteamID64() ][ nSlot ]
    if not item then return end
    if item.empty then return end

    AMB.Inventory.players_inv[ self:SteamID64() ][ nSlot ] = { empty = true }

    AMB.Debug( function()

        --self:ChatPrint( '[Inventory] RemoveItem S:'..nSlot..' | OldI:'..item.class..' | OldC:'..item.count )

        MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.RemoveItemInv for '..tostring( self )..' [ S:'..nSlot..' ]'..'\n' )

    end )

    AMB.Inventory.SaveItems( self )
    AMB.Inventory.SendInventory( self, nSlot )

end

-- Other --

local function ConvertEntityToItem( sEntClass )

    if ( sEntClass == 'inv_weapon' ) then return 'weapon' end

    local objects = AMB.Inventory.Config.objects

    for class, item in pairs( objects ) do

        if ( item.ent == sEntClass ) then return class end

    end

end

PLAYER.TakeItemInv = function( self, eObj )

    if not IsValid( eObj ) then return end

    local class = ConvertEntityToItem( eObj:GetClass() )
    if not class then return end

    local options = nil
    if ( class == 'weapon' ) then

        options = {}
        options.model = eObj:GetModel()
        options.class = eObj:GetWeaponClass()

    end

    local count = AMB.NW.GetInt( eObj, 'Count' )
    if not count or ( count == 0 ) then 
    
        AMB.NW.SetInt( eObj, 'Count', 1 ) 
        count = 1 
        
    end

    local old_count_item_inv = self:GetCountItem( class )
    self:AddItemInv( class, count, options )
    local new_count_item_inv = self:GetCountItem( class )

    if ( new_count_item_inv >= old_count_item_inv + count ) then

        eObj:Remove()

    else

        local remains = old_count_item_inv + count - new_count_item_inv
        AMB.NW.SetInt( eObj, 'Count', remains )

        AMB.Re.Notify( self, { time = 2.5, type = 1, color = C.AMB_ERROR, sound = AMB.G.SND.ERROR, text = 'Не хватает места' } )

    end

    AMB.Debug( function()

        MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.TakeItemInv for '..tostring( self )..' on '..tostring( eObj )..'\n' )

    end )

end
hook.Add( 'PlayerUse', 'AMB.Inventory.TakeObject', function( ePly, eEntity ) 

    if not ePly:KeyDown( IN_WALK ) then return end

    local name_timer_delay_for_use = 'AmbInventoryDelayUseSteamID:'..ePly:SteamID()

    if ePly:IsAuth() and IsValid( eEntity ) and ( timer.Exists( name_timer_delay_for_use ) == false ) then 
    
        ePly:TakeItemInv( eEntity )
        timer.Create( name_timer_delay_for_use, AMB.Inventory.Config.delay_for_use, 1, function() end )

        return false

    end

end )

local function ConvertItemToUseFunc( tItem )

    if ( tItem.class == 'weapon' ) then 
    
        return function( ePly )

            ePly:Give( tItem.options.class, true )

        end

    end

    local item_class = AMB.Inventory.Config.objects[ tItem.class ]
    if not item_class then return end

    return item_class.use

end

PLAYER.UseItemInv = function( self, nSlot )

    local objects = AMB.Inventory.Config.objects
    local item = self:GetItemInv( nSlot )
    if item.empty then return end

    local func = ConvertItemToUseFunc( item )
    if not func then return end

    AMB.Debug( function()

        --self:ChatPrint( '[Inventory] Use I:'..item.class..' | C:'..item.count..'-1 | S:'..nSlot )

        MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.UseTimeInv for '..tostring( self )..' [ I:'..item.class..' | C:'..item.count..'-1 | S:'..nSlot..' ]' )

    end )

    item.count = item.count - 1

    AMB.Inventory.SaveItems( self )
    AMB.Inventory.SendInventory( self, nSlot )

    if ( item.count == 0 ) then self:RemoveItemInv( nSlot ) end

    return func( self )

end

PLAYER.DropItemInv = function( self, nSlot, nCount )

    local objects = AMB.Inventory.Config.objects
    local item = self:GetItemInv( nSlot )
    if not item or item.empty then return end
    if ( nCount > item.count ) then return end

    local ang = self:EyeAngles()
    local pos = AMB.Utility.GetFrontPos( self, 60 )
    local class = objects[ item.class ].ent

    if ( item.class == 'weapon' ) then class = 'inv_weapon' end

    local ent = ents.Create( class )
    ent:SetPos( pos )
    ent:SetAngles( ang )
    ent:Spawn()
    if ( item.class == 'weapon' ) then 
    
        local options = item.options

        if options.model then ent:SetModel( options.model ) end
        if options.class then 
        
            ent:SetWeapon( options.class ) 
            ent:SetHeader( options.class ) 
            
        end
        
    end
    AMB.NW.SetInt( ent, 'Count', nCount )

    self:PropCoreAdd( ent )

    AMB.Debug( function()

        MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.DropItemInv for '..tostring( self )..' on '..tostring( eObj )..'\n' )

    end )

    if ( item.count == nCount ) then 
    
        self:RemoveItemInv( nSlot ) 
        
    else

        item.count = item.count - nCount

        AMB.Inventory.SaveItems( self )
        AMB.Inventory.SendInventory( self, nSlot )

    end

end

PLAYER.ResetInv = function( self )

    local CFG = AMB.Inventory.Config

    for i = 1, CFG.max_slots do self:RemoveItemInv( i ) end

end