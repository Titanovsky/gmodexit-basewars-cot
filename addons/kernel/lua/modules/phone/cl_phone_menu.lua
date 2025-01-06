AmbPhone = AmbPhone or {}
setmetatable( AmbPhone, { __index = AmbPhone } )

AmbPhone.key_call_menu = KEY_G
AmbPhone.wallpaper = Material( 'ambition/phone/wallpapers/phone_wellpaper2.jpg' )

local w = ScrW()
local h = ScrH()
local phone = Material( 'ambition/phone/phone2.png' )
local C = AMB.G.C

function AmbPhone:ShowPhoneMenu()

    if ValidPanel( amb_phone ) then amb_phone:Remove() end

    amb_phone = vgui.Create( 'DFrame' )
    amb_phone:SetSize( 400, 640 )
    amb_phone:SetPos( w - amb_phone:GetWide()+20, h )
    amb_phone:SetTitle( '' )
    amb_phone:ShowCloseButton( false )
    amb_phone:SetDraggable( false )
    amb_phone:MakePopup()
    amb_phone:MoveTo( w - amb_phone:GetWide()+20, h - amb_phone:GetTall()+20, 0.32, 0, -1, function() end )
    amb_phone.OnKeyCodePressed = function( self, nKey ) 
		
        if ( nKey == KEY_G ) then 
        
            AmbPhone:RemovePhoneMenu()
            
        end

	end
    amb_phone.Paint = function( self, w, h )

        surface.SetMaterial( phone )
        surface.SetDrawColor( 255, 255, 255, 255 )
	    surface.DrawTexturedRect( 0, 0, w, h )

    end

    local main = vgui.Create( 'DPanel', amb_phone )
    main:SetSize( 260, 410 )
    main:SetPos( 68, 110 )
    main.Paint = function( self, w, h ) 
    
        surface.SetMaterial( AmbPhone.wallpaper )
	    surface.SetDrawColor( 255, 255, 255, 255 )
	    surface.DrawTexturedRect( 0, 0, 260, 410 )

    end

    local grid = vgui.Create( 'DGrid', main )
    grid:SetPos( 12, 32 )
    grid:SetCols( 3 )
    grid:SetColWide( 85 )
    grid:SetRowHeight( 85 )

    local random = tostring( math.random( 1, 2 ) )
    
    for i = 1, 9 do

        local icon = Material( 'ambition/phone/apps'..random..'/app'..tostring( i )..'.png' )

        local but = vgui.Create( 'DButton' )
        but:SetText( '' )
        but:SetSize( grid:GetColWide() - 6, grid:GetRowHeight() - 6 )
        grid:AddItem( but )
        but.Paint = function( self, w, h ) 
    
            surface.SetMaterial( icon )
	        surface.SetDrawColor( 255, 255, 255, 255 )
	        surface.DrawTexturedRect( 0, 0, 64, 64 )

        end
        but.DoClick = function()

            AmbPhone:RemovePhoneMenu()

        end

    end

    local close = vgui.Create( 'DButton', amb_phone )
    close:SetSize( 50, 50 )
    close:SetPos( amb_phone:GetWide()/2-close:GetWide()/2-3, amb_phone:GetTall()-110 )
    close:SetText( '' )
    close.Paint = function() end
    close.DoClick = function()

        AmbPhone:RemovePhoneMenu()

    end

end
concommand.Add( 'amb_phone_open', AmbPhone.ShowPhoneMenu )

function AmbPhone:RemovePhoneMenu()

    timer.Create( 'DelayOpenPhone', 1, 1, function() end ) 
            
    amb_phone:MoveTo( w - amb_phone:GetWide()+20, h, 0.32, 0, -1, function() 
            
        amb_phone:Remove()

    end )

end

hook.Add( 'PlayerButtonDown', 'CallOnPhoneMenu', function( ePly, nButton )

	if input.IsKeyDown( KEY_G ) and not timer.Exists( 'DelayOpenPhone' ) then 
        
        RunConsoleCommand( 'amb_phone_open' )

    end

end )
