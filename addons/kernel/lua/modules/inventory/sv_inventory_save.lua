local C = AMB.G.C
local path = AMB.Inventory.Config.main_path..'/'

AMB.Files.Folders.Create( AMB.Inventory.Config.main_path )

function AMB.Inventory.SaveItems( ePly )

    local ply_inv = ePly:GetItemsInv()
    local json_ply_inv = AMB.Files.JSON.In( ply_inv )
    local name_file = path..ePly:SteamID64()..'.json'

    AMB.Files.Create( name_file, json_ply_inv ) -- if file is valid, then it will be rewritten

    AMB.Debug( function() 

        if not AMB.Files.Find( name_file, 'DATA' ) then MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.SaveItems for '..tostring( ePly )..' has ', C.AMB_RED, 'failed!'..'\n' ) return end

        MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory.SaveItems for '..tostring( ePly )..' has ', C.AMB_GREEN, 'successful!'..'\n' )

    end )

end

function AMB.Inventory.VerificationItem( tItem ) -- todo

    return true

end

hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Inventory.InitializeInventory', function( ePly )

    AMB.Inventory.players_inv[ ePly:SteamID64() ] = {}

    local json_inv = AMB.Files.Read( path..ePly:SteamID64()..'.json', 'DATA' )
    
    if not json_inv then 

        for i = 1, AMB.Inventory.Config.max_slots do 
        
            AMB.Inventory.players_inv[ ePly:SteamID64() ][ i ] = { empty = true } 
            AMB.Inventory.SendInventory( ePly, i )

        end

        AMB.Inventory.SaveItems( ePly )

        return 

    end

    local tbl_ply_inv = AMB.Files.JSON.Out( json_inv )
    local sid64 = ePly:SteamID64()

    for slot, item in pairs( tbl_ply_inv ) do -- там slot это стринги, поэтому не работает ipairs

        slot = tonumber( slot )
        if not item.count then item.count = 1 end

        if item.empty or ( AMB.Inventory.VerificationItem( item ) == false ) then 
        
            AMB.Inventory.players_inv[ sid64 ][ slot ] = { empty = true } 
            AMB.Inventory.SendInventory( ePly, slot )
            
            continue 
            
        end

        AMB.Inventory.players_inv[ sid64 ][ slot ] = {
            
            id = item.id,
            class = item.class,
            count = item.count

        }

        if item.options then AMB.Inventory.players_inv[ sid64 ][ slot ].options = item.options end

        local item_class = AMB.Inventory.Config.objects[ item.class ]
        if ( item.count > item_class.max ) then

            local loss_count = item.count - item_class.max
            ePly:ChatPrint( '[Inventory] You loss count '..loss_count..' on Slot '..slot..' / Item '..item_class.name..', because maximum count was reduced!' )
            AMB.Inventory.players_inv[ sid64 ][ slot ].count = item_class.max

        end

        AMB.Inventory.SendInventory( ePly, slot )

    end

    AMB.Debug( function() 

        MsgC( C.AMB_GREEN, '[DEBUG] ', C.ABS_WHITE, 'Inventory has full initialized for '..tostring( ePly )..'\n' )

    end )

end )