AMB.TextToSpeech = AMB.TextToSpeech or {}
AMB.TextToSpeech.Config = AMB.TextToSpeech.Config or {}

AMB.TextToSpeech.Config.urls = {

    [ 'google' ] = 'https://translate.google.com/translate_tts?',
    [ 'yandex' ] = 'http://tts.voicetech.yandex.net/tts?'

}
AMB.TextToSpeech.Config.exception_ranks = {

    [ 'creator' ] = true,
    [ 'moder' ] = true,
    [ 'admin' ] = true,
    [ 'helper' ] = true

}

-- ## Nets ####################################################
AMB.TextToSpeech.Config.net_send_client_google_talk = 'amb_tts_send_client_google_talk'
AMB.TextToSpeech.Config.net_send_client_google_player_talk = 'amb_tts_send_client_google_player_talk'

AMB.TextToSpeech.Config.net_send_client_yandex_talk = 'amb_tts_send_client_yandex_talk'
AMB.TextToSpeech.Config.net_send_client_yandex_player_talk = 'amb_tts_send_client_yandex_player_talk'

-- ## Yandex ##################################################
AMB.TextToSpeech.Config.yandex_voices = {

    [ 'alyss' ] = true, 
    [ 'jane' ] = true, 
    [ 'oksana' ] = true, 
    [ 'omazh' ] = true, 
    [ 'zahar' ] = true, 
    [ 'ermil' ] = true, 
    [ 'alena' ] = true, 
    [ 'filipp' ] = true

}
AMB.TextToSpeech.Config.yandex_emotiones = {

    [ 'good' ] = true, 
    [ 'evil' ] = true, 
    [ 'neutral' ] = true

}

-- ## Google ##################################################
AMB.TextToSpeech.Config.google_languages = {

    [ 'en' ] = true,
    [ 'ru' ] = true,
    [ 'de' ] = true,
    [ 'fr' ] = true

}

--[[ Examples:

    https://translate.google.com/translate_tts?ie=UTF-8&tl=ru&client=tw-ob&q=Почему%20бы%20и%20нет?
    http://tts.voicetech.yandex.net/tts?speaker=oksana&text=Почему%20бы%20и%20нет?

]]--