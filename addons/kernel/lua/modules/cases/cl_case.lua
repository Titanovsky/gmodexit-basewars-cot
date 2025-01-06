AMB.Cases = AMB.Cases or {}

local C = AMB.G.C
local SND = AMB.G.SND
local GUI = AMB.UI.GUI

local w = ScrW()
local h = ScrH()

local COLOR_ROULETTE = Color( 0, 0, 0, 160 )

local rand_nicks = {

    'Titanovsky', 'ExtraDipus', 'банбовик', 'Жожда', 'glitCH'

}

function AMB.Cases.OpenMenu()

    local frame = GUI.DrawFrame( nil, 540, 250, 0, 0, nil, true, true, true, function( self, w, h ) 

        draw.RoundedBox( 0, 0, 0, w, h, C.AMB_BLACK )
        draw.RoundedBox( 0, w / 2 - 10, 0, 20, 40, C.AMBITION )
        draw.RoundedBox( 0, w / 2 - 10, 140, 20, 40, C.AMBITION )

    end )
    frame:Center()

    local roulette = GUI.DrawPanel( frame, frame:GetWide() + 6500, 100, 0, 40, function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, COLOR_ROULETTE )

    end )

    for i = 1, 64 do

        local name = table.Random( rand_nicks )
        local slot = GUI.DrawPanel( roulette, 100, 100 - 8, 4 + ( 100 + 8 ) * ( i - 1 ), 4, function( self, w, h )

            draw.RoundedBox( 4, 0, 0, w, h, COLOR_ROULETTE )
            --draw.SimpleText( i, '18 Ambition', w / 2, h - 4, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( name, '16 Ambition', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

        end )

    end

    local start = GUI.DrawButton( frame, 80, 32, frame:GetWide() / 2 - 80 / 2, frame:GetTall() - 32 - 4, '20 Ambition', C.ABS_BLACK, 'To Scroll', function( self )

        local size = math.random( -6080, -6010 )
        roulette:MoveTo( size, 40, 30, 0, 0.2, function() end )
        frame:SizeTo( 540, 180, 3, 0, -1, function() end )
        self:Remove()

    end )

end
concommand.Add( 'open_case', AMB.Cases.OpenMenu )