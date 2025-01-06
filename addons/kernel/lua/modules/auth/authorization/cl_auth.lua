local CFG, C, SND, GUI = AMB.Auth.Config, AMB.G.C, AMB.G.SND, AMB.UI.GUI
local DrawBox, DrawText, DrawTextOutlined = draw.RoundedBox, draw.SimpleText, draw.SimpleTextOutlined
local w, h = ScrW(), ScrH()

local COLOR_BACK_WHITE = Color( 230, 230, 230 )

local delay = 0
local function Loading()

    local blackscreen = GUI.DrawPanel( nil, w, h, 0, 0, function( self, w, h )

        DrawBox( 0, 0, 0, w, h, C.ABS_BLACK )
        DrawTextOutlined( self.text, '32 Arial', w / 2, h / 2 + 100, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.AMB_BLACK )

        if not self.think or ( delay > CurTime() ) then return end

        delay = CurTime() + 0.75

        if ( self.textformat == 0 ) then self.text = 'Подождите.' self.textformat = 1
        elseif ( self.textformat == 1 ) then self.text = 'Подождите..' self.textformat = 2
        elseif ( self.textformat == 2 ) then self.text = 'Подождите...' self.textformat = 0
        end

    end )

    blackscreen.textformat = 0
    blackscreen.text = 'Подождите'
    blackscreen.think = true

    timer.Simple( 4, function()

        blackscreen.think = false
        blackscreen.text = 'Приятной игры :)'
        blackscreen:AlphaTo( 0, 3.75, 0, function() blackscreen:Remove() end )

        hook.Remove( 'PostDrawTranslucentRenderables', 'AMB.Auth.DisableRenderOnRegistration' )

    end )

end

local function Start()

    local back = AMB.UI.GUI.DrawFrame( nil, w, h, 0, 0, '', false, false, false, function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, C.AMB_BLACK )

    end )

    local main = GUI.DrawPanel( back, w / 3, h / 1.4, w / 2 - ( w / 3 ) / 2, 24, function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, C.AMB_PANEL )
        DrawText( 'Capture of Terra', '40 Arial', w / 2, 24, C.AMB_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

    end )

    local play = GUI.DrawButton( main, main:GetWide() / 2, main:GetTall() / 8, 0, 0, nil, nil, nil, function()

        back:Remove()
        net.Start( 'amb_auth_reg_finish' )
        net.SendToServer()

        hook.Call( 'AmbitionAuthPlayer', nil )

        Loading()

    end, function( self, w, h )

        draw.RoundedBox( 6, 0, 0, w, h, C.AMB_PANEL )
        DrawText( 'Играть', '32 Arial', w / 2, h / 2, C.AMB_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end )
    play:Center()

    local x, _ = main:GetPos()
    local news = GUI.DrawPanel( back, w / 4, h / 2, x - ( w / 4 ) - 12, 24, function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, C.AMB_PANEL )
        DrawText( 'Новости:', '26 Arial', 12, 12, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

    end )

    local html = vgui.Create( 'DHTML', news )
    html:SetSize( news:GetWide() - 8, news:GetTall() - 48 - 4 )
    html:SetPos( 4, 48 )
    html:OpenURL( 'https://steamcommunity.com/groups/ambitiongmod' )

    local x, _ = main:GetPos()
    local top = GUI.DrawPanel( back, w / 4, h / 2, x + main:GetWide() + 12, 24, function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, C.AMB_PANEL )
        DrawText( 'Топ ровных пацанов:', '26 Arial', 12, 12, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

        DrawText( '1. банбовик', '20 Arial', 4, 44, C.FLAT_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '2. glitCH', '20 Arial', 4, 44 + 20 + 2, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '3. Жожда', '20 Arial', 4, 44 + 20 * 2 + 2, C.FLAT_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '4. Combine', '20 Arial', 4, 44 + 20 * 3 + 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '5. L8n', '20 Arial', 4, 44 + 20 * 4 + 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '6. ☭[RUs][Novux]Горох Крыса!☭', '20 Arial', 4, 44 + 20 * 5 + 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '7. ＤＯＳＨＩＫ', '20 Arial', 4, 44 + 20 * 6 + 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '8. tatarskayalozhka', '20 Arial', 4, 44 + 20 * 7 + 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '9. Rutik', '20 Arial', 4, 44 + 20 * 8 + 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        DrawText( '10. Titanovsky', '20 Arial', 4, 44 + 20 * 9 + 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

    end )

end
hook.Add( 'InitPostEntity', 'AMB.Auth.ShowStartMenu', function() Start() end )

hook.Add( 'PostDrawTranslucentRenderables', 'AMB.Auth.DisableRenderOnRegistration', function()

    render.DepthRange(0,0.1)
	render.Clear(0,0,0,255, false,true)
	render.SuppressEngineLighting(true)
    render.ResetModelLighting(0,0,0,0)
	render.SuppressEngineLighting(false)
	render.DepthRange(0,1)
    render.OverrideDepthEnable( false, false )

end )
hook.Remove( 'PostDrawTranslucentRenderables', 'AMB.Auth.DisableRenderOnRegistration' )

function AMB.Auth.ShowStartGuide()

    hook.Add( 'CalcView', 'AMB.Gamemode.Registration.GuideView', function( ply, pos, angles, fov )

        local view = {

            origin = Vector( 755.716614, -711.205078, 575.509644 ),
            angles = Angle( 0, -160, 0 ),
            fov = fov,
            drawviewer = true

        }

        return view

    end )

    local person = Material( 'ambition/basewars/quest/billy2.png' )

    local frame = AMB.UI.GUI.DrawFrame( nil, 380, 180, w / 2 - 380 / 2, h - 180 - 4, '', true, false, false, function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, C.AMB_BLACK )

        surface.SetMaterial( person )
        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.DrawTexturedRect( 0, h - 128, 128, 128 )

        draw.SimpleTextOutlined( 'Наебала', '24 Ambition', 40, 32, C.AMBITION, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        draw.SimpleTextOutlined( 'Тут будет текст простенький', '20 Ambition', 128, 4, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleTextOutlined( 'Для печеней, которые не шарят', '20 Ambition', 128, 24, C.AMB_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

    end )

    local btn = AMB.UI.GUI.DrawButton( frame, 80, 32, frame:GetWide() / 2 - 80 / 2, frame:GetTall() - 32 - 4, '22 Ambition', C.ABS_BLACK, 'Дальше', function() 
    
        frame:Remove()
        hook.Remove( 'CalcView', 'AMB.Gamemode.Registration.GuideView' )
        RunConsoleCommand( 'amb_hud_bw', '1' )
        
    end )

end
concommand.Add( 'amb_guide', function() AMB.Gamemode.Registration.ShowStartGuide() end )