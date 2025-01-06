local C, GUI = AMB.G.C, AMB.UI.GUI

local w, h = ScrW(), ScrH()
local tooltip = 'Основная страница с помощью\nFAQ - здесь можно найти информацию про геймплей и самые известные вопросы'

local DrawBox, DrawText, DrawTextOutline = draw.RoundedBox, draw.SimpleText, draw.SimpleTextOutlined

local delay = 0

local page = AMB.UI.MainMenu.Pages.AddPage( 6, 'Помощь', C.ABS_WHITE )
AMB.UI.MainMenu.Pages.SetPage( page, function( vguiFrame )

    local frame, main = GUI.Ambition.DrawFrame( vguiFrame, w / 2, h / 1.4, 0, 0, 'Помощь', tooltip, function() 

        AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )

    end )
    frame:Center()

    local fps = math.floor( 1 / FrameTime() )
    local panel = GUI.DrawPanel( main, main:GetWide(), main:GetTall(), 0, 0, function( self, ww, hh )

        DrawTextOutline( 'FPS '..fps, '26 Arial', 12, 12, C.ABS_YELLOW, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( w..'x'..h, '26 Arial', 12, 12 + 24 * 1, C.AMB_ORANGE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( ww..'x'..hh, '26 Arial', 12, 12 + 24 * 2, C.AMB_ORANGE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( 'Scale On', '18 Arial Bold', 12, 12 + ( 24 + 2 ) * 3, C.AMB_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( 'Scale Font On', '18 Arial Bold', 12, 12 + ( 24 + 8 ) * 3, C.FLAT_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        if ( CurTime() < delay ) then return end

        delay = CurTime() + 1
        fps = math.floor( 1 / FrameTime() )

    end )

    local main_text_bot = GUI.DrawPanel( panel, 400, panel:GetTall() - 12*2, panel:GetWide() - 400 - 12, 12, function( self, w, h )

        DrawBox( 0, 0, 0, w, h, C.AMB_PANEL )
        DrawTextOutline( 'Что такое Capture of Terra?', '32 Arial', w / 2, 24, C.AMB_BLUE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Это сервер по Basewars с первичной целью стать..', '18 Arial', 4, 64, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( 'самым лучшим сервером в режиме, и чтобы достичь её,', '18 Arial', 4, 64 + 18, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( 'мы разработали интересный геймплей, который отлича..', '18 Arial', 4, 64 + 18 * 2, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( 'ется от всех остальных серверов.', '18 Arial', 4, 64 + 18 * 3, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        DrawTextOutline( '• Основная миссия: Захватить все территорий', '18 Arial', 4, 64 + 18 * 5, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Можно собираться в клан, так и играть в соло', '18 Arial', 4, 64 + 18 * 6, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Пройти все 8 сюжетных квестов и узнать тайну', '18 Arial', 4, 64 + 18 * 7, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Зарейдить всех боссов во всех зонах', '18 Arial', 4, 64 + 18 * 8, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Воевать с игроками и рейдить их базы', '18 Arial', 4, 64 + 18 * 9, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Зарабатывать на шахте или на маниках', '18 Arial', 4, 64 + 18 * 10, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Играть в казино и вызывать на дуэль', '18 Arial', 4, 64 + 18 * 11, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Больше геймплея, меньше заучиваний правил', '18 Arial', 4, 64 + 18 * 12, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Мы единственный качественный Basewars!', '18 Arial', 4, 64 + 18 * 13, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

    end )

    local main_text_bot = GUI.DrawPanel( panel, 210, panel:GetTall() - 130 - 12, 12, 130, function( self, w, h )

        DrawBox( 0, 0, 0, w, h, C.AMB_PANEL )
        DrawTextOutline( 'FAQ', '24 Arial', w / 2, 4, C.FLAT_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        DrawTextOutline( '1. Как повысить уровень?', '18 Arial', 2, 32, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( '• Активно играть на сервере..', '16 Arial', 2, 32 + 16, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        DrawTextOutline( 'убивать, рейдить, зарабатывать', '16 Arial', 2, 32 + 16 * 2, C.FLAT_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

    end )

end )