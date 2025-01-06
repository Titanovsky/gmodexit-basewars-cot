AMB.Gamemode.Context = AMB.Gamemode.Context or {}
AMB.Gamemode.Context.buttons = AMB.Gamemode.Context.buttons or {}
AMB.Gamemode.Context.menu = AMB.Gamemode.Context.menu or nil

local GUI = AMB.UI.GUI
local C = AMB.G.C
local SND = AMB.G.SND
local PREFIX = AMB.Config.prefix

local COLOR_CONTEXT = Color( 255, 255, 255, 200 )

local w = ScrW()
local h = ScrH()

function AMB.Gamemode.Context.CreateButton( sName, sFont, sImage, bSpacer, fAction, fOtherAction, fCheck )

    AMB.Gamemode.Context.buttons[ sName ] = {

        check = fCheck or function() return true end,
        show = function( vguiContext )

            local button = vguiContext:AddOption( sName, fAction )
            button:SetImage( sImage or 'icon16/bullet_black.png' )
            button:SetFont( sFont or '20 Ambition' )
            if fOtherAction then fOtherAction( vguiContext, button ) end

            if bSpacer then vguiContext:AddSpacer() end

        end

    }

end

function AMB.Gamemode.Context.Open()

    if ( LocalPlayer():Alive() == false ) then return end

    local context = vgui.Create( 'DMenu' )
    context.Paint = function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, COLOR_CONTEXT ) end

    for name, btn in pairs( AMB.Gamemode.Context.buttons ) do 
    
        if not btn.check( LocalPlayer() ) then continue end
        btn.show( context ) 
        
    end

    context:Open()
    context:SetPos( w / 2 - context:GetWide() / 2, h - context:GetTall() - 8 )
    AMB.Gamemode.Context.menu = context

end

function AMB.Gamemode.Context.Close()

    local context = AMB.Gamemode.Context.menu
    if context and ValidPanel( context ) then context:Remove() end

end

hook.Add( 'OnContextMenuOpen', 'AMB.Gamemode.Context.Open', function()

    timer.Simple( 0, AMB.Gamemode.Context.Open )

end )
hook.Add( 'OnContextMenuClose', 'AMB.Gamemode.Context.Close', AMB.Gamemode.Context.Close )

-- Only Basewars [Capture Of Terra] -------------
AMB.Gamemode.Context.CreateButton( 'Купить Патроны', nil, nil, false, function() 

    RunConsoleCommand( 'amb_buy_ammo' )
    timer.Simple( 0.01, function() AMB.Gamemode.Context.Open() end )

end )

local block_weps_drop = {

    [ 'weapon_bugbait' ] = true,
    [ 'weapon_physcannon' ] = true,
    [ 'weapon_fists' ] = true,
    [ 'gmod_tool' ] = true,
    [ 'weapon_physgun' ] = true,
    [ 'gmod_camera' ] = true

}

AMB.Gamemode.Context.CreateButton( 'Выкинуть оружие', nil, 'icon16/world.png', false, function() 

    RunConsoleCommand( 'say', '/dropweapon' )

end, nil, function() return IsValid( LocalPlayer():GetActiveWeapon() ) and not block_weps_drop[ LocalPlayer():GetActiveWeapon():GetClass() ] end )

-- Clans --
AMB.Gamemode.Context.CreateButton( 'Захватить Территорию', nil, 'icon16/world.png', false, function() 

    RunConsoleCommand( 'amb_clan_capture' )

end, nil, function() return LocalPlayer():IsClan() end )

AMB.Gamemode.Context.CreateButton( 'Пригласить Игрока', nil, 'icon16/user_add.png', true, function() 

    if not LocalPlayer():IsLeaderClan() then return end

    local target = LocalPlayer():GetEyeTrace().Entity
    if not IsValid( target ) or not target:IsPlayer() then return end
    if not target:IsAuth() then return end
    if target:IsClan() then return end
    if ( LocalPlayer():GetPos():Distance( target:GetPos() ) > 120 ) then return end
    if timer.Exists( 'DelayForInvite' ) then return end

    timer.Create( 'DelayForInvite', 5, 1, function() end )

    net.Start( 'amb_clans_players_receive_leader_invite' )
        net.WriteEntity( target )
    net.SendToServer()

    AMB.Re.Notify( { text = 'Вы пригласили игрока '..AMB.Gamemode.GetStats( target, 'Gamename' ), sound = 'ambition/bf5/collapse1.ogg', time = 6, color = C.AMB_BLUE, type = 5, color_text = C.AMBITION } )

end, nil, function() return LocalPlayer():IsLeaderClan() end )


-- Transfer
local color_calltextframe = Color( 0, 0, 0, 150 )
local function CallTextFrame( nText, bNumeric, fAction )

    local frame = GUI.DrawFrame( nil, 300, 140, 0, 0, nil, true, true, true, function( self, w, h ) 

        draw.RoundedBox( 4, 0, 0, w, h, color_calltextframe )
        draw.SimpleText( nText, '22 Ambition', 4, 22, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

    end )
    frame:Center()

    local text = GUI.DrawTextEntry( frame, frame:GetWide() - 8, 40, 4, 52, '18 Ambition', C.ABS_BLACK, nil, C.AMB_GRAY, 'Вводить здесь', false, bNumeric )

    local send = GUI.DrawButton( frame, 120, 32, frame:GetWide() / 2 - 120 / 2, frame:GetTall() - 32 - 4, '20 Ambition Bold', C.AMB_BLACK, 'Выполнить', function() 
    
        fAction( text:GetValue() ) 
        frame:Remove()

    end )

end

local rand_for_transfer_money_icons = { 'user', 'user_gray', 'user_green', 'user_orange', 'user_suit', 'user_female', 'user_red' }
AMB.Gamemode.Context.CreateButton( 'Передать Деньги', nil, 'icon16/user_add.png', true, nil, function( vguiMenu, vguiButton ) 

    vguiButton:Remove()

    local menu, menu_options = vguiMenu:AddSubMenu( 'Передать Деньги' )
    menu_options:SetFont( '20 Ambition' )
    menu_options:SetIcon("icon16/money.png")

    for id, ply in pairs( player.GetHumans() ) do

        if not ply:IsAuth() then continue end
        if ( ply == LocalPlayer() ) then continue end

        local name = AMB.Gamemode.GetStats( ply, 'Gamename' )

        local ply_menu = menu:AddOption( name, function()

            CallTextFrame( 'Передать деньги игроку '..name, true, function( sValue ) 

                if ( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) <= 0 ) then return end
                if not IsValid( ply ) or not ply:IsPlayer() then return end
                if not sValue then return end

                local money = math.floor( tonumber( sValue ) )
                if ( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) < money ) then return end
                if ( money <= 0 ) then return end
                if ( money > 16777215 ) then return end

                if not IsValid( Entity( id ) ) then return end
                
                net.Start( 'amb_economic_transfer_money' )
                    net.WriteUInt( id, 8 )
                    net.WriteUInt( money, 24 )
                net.SendToServer()

            end )

        end)
        ply_menu:SetIcon( 'icon16/'..table.Random( rand_for_transfer_money_icons )..'.png' )

    end

end, function() return ( AMB.Gamemode.GetStats( LocalPlayer(), 'Money' ) > 0 ) end )