local C, SND, UT = AMB.G.C, AMB.G.SND, AMB.Utility
local Add, ValidString = AMB.ChatCommands.AddCommand, UT.ValidString

local type = 'TextToSpeech'

local function UnpackArgs( tArgs, tExceptionNumber )

    local text = ''
    for i, word in ipairs( tArgs ) do

        if tExceptionNumber[ i ] then continue end
        
        text = text..' '..word

    end

    return text

end

Add( 'tts', type, 'Проиграть TextToSpeech.', 1.25, function( ePly, tArgs ) 

    if not ValidString( tArgs[ 2 ] ) then return end

    local text = UnpackArgs( tArgs, { [ 1 ] = true } )

    local type = ePly.tts_type or 'yandex'
	if ( type == 'google' ) then ePly:TalkGoogle( ePly.tts_google_lang or 'ru', text )
    elseif ( type == 'yandex' ) then ePly:TalkYandex( ePly.tts_yandex_voice or 'zahar', ePly.tts_yandex_emotion or 'neutral', ePly.tts_yandex_speed or 1.0, text )
    end

end )

Add( 'ttsy', type, 'Проиграть Продвинутый TextToSpeech Yandex [voice, emotion, speed, text]', 1.25, function( ePly, tArgs ) 

	if not ValidString( tArgs[ 2 ] ) or ValidString( tArgs[ 3 ] ) or ValidString( tArgs[ 4 ] ) or ValidString( tArgs[ 5 ] ) then return end

    local text = UnpackArgs( tArgs, { [ 1 ] = true, [ 2 ] = true, [ 3 ] = true, [ 4 ] = true } )

    local CFG = AMB.TextToSpeech.Config
    local voice, emotion, speed = CFG.yandex_voices[ tArgs[ 2 ] ] and tArgs[ 2 ] or 'zahar', CFG.yandex_emotiones[ tArgs[ 3 ] ] and tArgs[ 3 ] or 'neutral', math.Round( tonumber( tArgs[ 4 ] ), 1 )
    if ( speed < 0.1 ) or ( speed > 3.0 ) then speed = 0.1 end

    ePly:TalkYandex( voice, emotion, speed, text )

end )

Add( 'ttsg', type, 'Проиграть Продвинутый TextToSpeech Google [lang, text]', 1.25, function( ePly, tArgs ) 

	if not ValidString( tArgs[ 2 ] ) or ValidString( tArgs[ 3 ] ) or ValidString( tArgs[ 4 ] ) or ValidString( tArgs[ 5 ] ) then return end

    local text = UnpackArgs( tArgs, { [ 1 ] = true, [ 2 ] = true } )

    local CFG = AMB.TextToSpeech.Config
    local lang = CFG.google_languages[ tArgs[ 2 ] ] and tArgs[ 2 ] or 'ru'

    ePly:TalkGoogle( lang, text )

end )

Add( 'ttsignore', type, 'Вкл/Выкл игнор TextToSpeech', 0.75, function( ePly, tArgs ) 

	local value = tArgs[ 2 ]
    if not ValidString( value ) then return end

    local color, word = value and C.AMB_GREEN or C.AMB_RED, value and ' включили ' or ' выключили '
    ePly:ChatAdd( C.AMB_BLUE, '[•] ', C.ABS_WHITE, 'Вы', color, word, C.ABS_WHITE, 'прослушивание TextToSpeech' )
    ePly:RunCommand( 'amb_tts_ignore '..value )

end )

Add( 'ttsvoicelist', type, 'Показать голоса Yandex', 2, function( ePly, tArgs ) 

	local CFG = AMB.TextToSpeech.Config

    ePly:ChatSend( '\n' )
    for voice, _ in pairs( CFG.yandex_voices ) do ePly:ChatSend( C.FLAT_BLUE, voice ) end
    ePly:ChatSend( '\n' )

end )

Add( 'ttsemotionlist', type, 'Показать эмоций Yandex', 2, function( ePly, tArgs ) 

	local CFG = AMB.TextToSpeech.Config

    ePly:ChatSend( '\n' )
    for emotion, _ in pairs( CFG.yandex_emotiones ) do ePly:ChatSend( C.FLAT_RED, emotion ) end
    ePly:ChatSend( '\n' )

end )

Add( 'ttsvoice', type, 'Выбрать голос Yandex', 2, function( ePly, tArgs ) 

	local voice = tArgs[ 2 ]
    if not ValidString( voice ) then return end
    voice = string.lower( voice )

	local voices = AMB.TextToSpeech.Config.yandex_voices
    if not voices[ voice ] then return end

    ePly:ChatAdd( C.AMB_BLUE, '[•] ', C.ABS_WHITE, 'Голос ', C.AMB_RED, 'Яндекс', C.ABS_WHITE, ' изменена на ', C.AMB_BLUE, voice )

end )

Add( 'ttsemotion', type, 'Выбрать эмоции Yandex', 2, function( ePly, tArgs ) 

    local emotion = tArgs[ 2 ]
    if not ValidString( emotion ) then return end
    emotion = string.lower( emotion )

	local emotiones = AMB.TextToSpeech.Config.yandex_emotiones
    if not emotiones[ emotion ] then return end

    ePly:ChatAdd( C.AMB_BLUE, '[•] ', C.ABS_WHITE, 'Эмоция ', C.AMB_RED, 'Яндекс', C.ABS_WHITE, ' изменена на ', C.AMB_BLUE, speed )

end )

Add( 'ttsspeed', type, 'Выбрать скорость Yandex', 2, function( ePly, tArgs ) 

    local speed = tArgs[ 2 ]
    if not ValidString( speed ) then return end

    speed = math.Round( tonumber( speed ), 1 )
    if ( speed < 0.1 ) or ( speed > 3.0 ) then return end

    ePly.tts_yandex_speed = speed
    ePly:ChatAdd( C.AMB_BLUE, '[•] ', C.ABS_WHITE, 'Скорость ', C.AMB_RED, 'Яндекс', C.ABS_WHITE, ' изменена на ', C.AMB_BLUE, speed )

end )

Add( 'ttslang', type, 'Выбрать язык Google', 2, function( ePly, tArgs ) 

    local lang = tArgs[ 2 ]
    if not ValidString( lang ) then return end
    lang = string.lower( lang )

	local languages = AMB.TextToSpeech.Config.google_languages
    if not languages[ lang ] then return end

    ePly.tts_google_lang = lang
	ePly:ChatAdd( C.AMB_BLUE, '[•] ', C.ABS_WHITE, 'Язык ', C.AMB_BLUE, 'G', C.AMB_RED, 'o', C.AMB_YELLOW, 'o', C.AMB_BLUE, 'g', C.AMB_GREEN, 'l', C.AMB_RED, 'e', C.ABS_WHITE, ' изменена на ', C.AMB_BLUE, lang )

end )