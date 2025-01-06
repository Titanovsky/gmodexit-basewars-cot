local C = AMB.G.C
local SND = AMB.G.SND
local IMGUI = AMB.UI.Render.Imgui

local help_menu = { 
    
    pos = Vector( -2080, -15335, -745 ), 
    ang = Angle( 0, 180, 90 ), 
    dist = 600,
    color_back = C.AMBITION,
    color_main = C.AMB_BLACK,
    header = 'Capture Of Terra',
    w = 640,
    h = 500,
    header_w = AMB.Utility.GetTextSizeX( 'Capture Of Terra', '40 Oswald Light' )
 
}

local urls = {
    
    'https://discord.gg/2p7rAURaKa',
    'https://steamcommunity.com/groups/ambitiongmod',
    'https://vk.com/ambgmod'

}

local function RenderHelpMenu()

    if IMGUI.Start3D2D( help_menu.pos, help_menu.ang, 0.1, 1600, 150) then

        draw.RoundedBoxEx( 8, 0, 0, help_menu.w, 34, help_menu.color_back, true, true )
        draw.RoundedBoxEx( 8, 0, 32, help_menu.w, help_menu.h - 32, help_menu.color_main, false, false, true, true )
        draw.SimpleTextOutlined( 'Capture of Terra', '40 Oswald Light', help_menu.w / 2 - help_menu.header_w / 2, -6, C.ABS_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        
        draw.SimpleText( 'Сервер находится на стадий Бета-Тестирования', '30 Ambition', help_menu.w / 2, 40, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleText( 'могут быть: рестарты, краши, баги, потеря данных.', '30 Ambition', help_menu.w / 2, 40 + 30 * 1, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleText( 'Убедительная просьба сообщать в Дискорд..', '30 Ambition', help_menu.w / 2, 40 + 30 * 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleText( 'о всех проблемах, которые возникли во время игры', '30 Ambition', help_menu.w / 2, 40 + 30 * 3, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        draw.SimpleText( 'Мы хотим сделать самый топовый Basewars в мире!', '30 Ambition', help_menu.w / 2, 40 + 30 * 5, C.FLAT_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
        draw.SimpleText( 'И очень надеемся на вашу поддержку.', '30 Ambition', help_menu.w / 2, 40 + 30 * 6, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )

        if IMGUI.DrawTextButton( 'Discord', '26 Ambition', help_menu.w / 2 - 120 / 2, 40 + 32 * 7, 120, 36, 1, C.FLAT_PURPLE, C.AMB_WHITE, C.FLAT_PURPLE ) then

            chat.AddText( C.AMB_PURPLE, '>> '..urls[1] )
            SetClipboardText( urls[1] )
            gui.OpenURL( urls[1] )

        end

        if IMGUI.DrawTextButton( 'Steam', '26 Ambition', ( help_menu.w / 2 - 120 / 2 ) - 120 - 8, 40 + 32 * 7, 120, 36, 1, C.AMB_GRAY, C.AMB_WHITE, C.AMB_GRAY ) then

            chat.AddText( C.AMB_GRAY, '>> '..urls[2] )
            SetClipboardText( urls[2] )
            gui.OpenURL( urls[2] )

        end

        if IMGUI.DrawTextButton( 'VK', '26 Ambition', ( help_menu.w / 2 - 120 / 2 ) + 120 + 8, 40 + 32 * 7, 120, 36, 1, C.AMB_BLUE, C.AMB_WHITE, C.AMB_BLUE ) then

            chat.AddText( C.AMB_BLUE, '>> '..urls[3] )
            SetClipboardText( urls[3] )
            gui.OpenURL( urls[3] )

        end

        if IMGUI.DrawTextButton( 'Help', '26 Ambition', help_menu.w / 2 - 120 / 2, 40 + 32 * 8 + 12, 120, 36, 1, C.AMB_GREEN, C.AMB_WHITE, C.AMB_GREEN ) then

            LocalPlayer():ConCommand( 'amb_mm 6' )

        end

        draw.SimpleText( 'Спасибо и приятной игры ;)', '30 Arial', help_menu.w / 2, help_menu.h - 32, C.AMBITION, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )

        IMGUI.End3D2D()

    end

end

hook.Add( 'PostDrawTranslucentRenderables', 'AMB.Basewars.Render3D2DTablesOnMap', function( _, bDrawingDepth )

    if bDrawingDepth then return end

    RenderHelpMenu()

end )