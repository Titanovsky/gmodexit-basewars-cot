AMB.Inventory = AMB.Inventory or {}
AMB.Inventory.Config = AMB.Inventory.Config or {}

local C = AMB.G.C

AMB.Inventory.Config.main_path = 'inventory'
AMB.Inventory.Config.max_slots = 20 -- max 255
AMB.Inventory.Config.delay_for_use = 0.52

-- Net messages --
AMB.Inventory.Config.net_send_inv_client = 'amb_inventory_send_inv_client'
AMB.Inventory.Config.net_drop_item = 'amb_inventory_drop_item'
AMB.Inventory.Config.net_use_item = 'amb_inventory_use_item'

-- UNSAFE TO UPDATE! --
-- max count 65535
-- icon xor model
-- type weapon is specific
AMB.Inventory.Config.objects = AMB.Inventory.Config.objects or {}
AMB.Inventory.Config.objects[ 'iron' ] = { id = 1, icon = 'iron', name = 'Железо', type = 'resource', ent = 'mine_iron', desc = 'Железный слиток', max = 256 }
AMB.Inventory.Config.objects[ 'copper' ] = { id = 2, icon = 'copper', name = 'Медь', type = 'resource', ent = 'mine_copper', desc = 'Медный слиток', max = 256 }
AMB.Inventory.Config.objects[ 'stone' ] = { id = 2, model = 'models/props_junk/rock001a.mdl', name = 'Камень', type = 'resource', ent = 'mine_stone', desc = 'Обычный камень', max = 64 }

AMB.Inventory.Config.objects[ 'hl2medkit' ] = { id = 98, model = 'models/items/healthkit.mdl', name = 'Наташа', type = 'entity', ent = 'item_healthkit', desc = 'МедКит', max = 4,
use = function( ePly ) ePly:SetHealth( ePly:Health() + 25 ) end }

AMB.Inventory.Config.objects[ 'weapon' ] = { id = 99, model = '', name = '', type = 'weapon', ent = '_', desc = 'Какое-то оружие', max = 1, options = 

    {

        [ 'class' ] = 'class',
        [ 'ammo1' ] = 0,
        [ 'ammo2' ] = 0
    }, 
    
    use = function() end

}