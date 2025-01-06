local CFG, C = AMB.QMenu.Config, AMB.G.C


-- ## Tools ############################################

local block_tools = {

    [ 'weld' ] = true, 
    [ 'axis' ] = true,
    [ 'ballsocket' ] = true,
    [ 'winch' ] = true,
    [ 'pulley' ] = true,
    [ 'rope' ] = true,
    [ 'motor' ] = true,
    [ 'elastic' ] = true,
    [ 'hydraulic' ] = true, 
    [ 'muscle' ] = true,
    [ 'slider' ] = true,

    [ 'balloon' ] = true,
    [ 'duplicator' ] = true,
    [ 'dynamite' ] = true,
    [ 'emitter' ] = true,
    [ 'hoverball' ] = true,
    [ 'nocollide' ] = true,
    [ 'wheel' ] = true,
    [ 'thruster' ] = true,
    [ 'lamp' ] = true,
    [ 'physprop' ] = true,
    
    [ 'trails' ] = true,
    [ 'paint' ] = true,
    
}

hook.Add( 'AmbitionAuthPlayer', 'AMB.QMenu.RemoveTools', function()

    local toolPanelList = g_SpawnMenu.ToolMenu.ToolPanels[1].List
    local categories = toolPanelList.pnlCanvas:GetChildren()
    local construction = categories[ 2 ]:GetChildren()
    local render = categories[ 4 ]:GetChildren()
    local building = categories[ 5 ]:GetChildren()

    for k, col in ipairs( categories ) do

        if ( k == 1 ) or ( k == 3 ) then col:Remove() end

    end

    for _, panel in ipairs( construction ) do

        if block_tools[ panel.Name ] then panel:Remove() end

    end

    for _, panel in ipairs( render ) do

        if block_tools[ panel.Name ] then panel:Remove() end

    end

end )

-- ## Spawnmenu ########################################

local block_tabs = {

    [ '#spawnmenu.category.dupes' ] = true,
    [ '#spawnmenu.category.saves' ] = true,
    [ '#spawnmenu.category.postprocess' ] = true,
    [ '#spawnmenu.category.entities' ] = true,
    [ '#spawnmenu.category.vehicles' ] = true,
    [ '#spawnmenu.category.weapons' ] = true,
    [ '#spawnmenu.category.npcs' ] = true,
    [ '#spawnmenu.content_tab' ] = false

}

local exception_ranks = {

    [ 'creator' ] = true,
    [ 'admin' ] = true,
    [ 'moder' ] = true

}

local function DeleteTabs()

    for i, panel in ipairs( g_SpawnMenu.CreateMenu.Items ) do

        if block_tabs[ panel.Name ] then 

            local tab = panel.Tab
            g_SpawnMenu.CreateMenu:CloseTab( tab, true )
            
        end

    end

end

hook.Add( 'AmbitionAuthPlayer', 'AMB.QMenu.RemoveSpawnMenuTabs', function()
    
    timer.Simple( 0.25, function()
    
        if exception_ranks[ LocalPlayer():GetUserGroup() ] then return end

        for i = 1, 4 do DeleteTabs() end -- с первого раза не удаляет

    end )

end )