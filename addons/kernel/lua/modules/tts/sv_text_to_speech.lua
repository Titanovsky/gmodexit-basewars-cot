local C, SND = AMB.G.C, AMB.G.SND
local AddString = AMB.Network.AddString

local net_send_client_yandex_talk = AddString( AMB.TextToSpeech.Config.net_send_client_yandex_talk )
function AMB.TextToSpeech.TalkYandex( ePly, vPos, sVoice, sEmotion, nSpeed, sText )

	if not sText then return end

	net.Start( net_send_client_yandex_talk )
		net.WriteVector( vPos or Vector( 0, 0, 0 ) )
		net.WriteString( sVoice or 'oksana' )
		net.WriteString( sEmotion or 'neutral' )
		net.WriteFloat( nSpeed or 1.0 )
		net.WriteString( sText )
	net.Send( ePly )

end

local net_send_client_google_talk = AddString( AMB.TextToSpeech.Config.net_send_client_google_talk )
function AMB.TextToSpeech.TalkGoogle( ePly, vPos, sLanguage, sText )

	if not sText then return end

	net.Start( net_send_client_google_talk )
		net.WriteVector( vPos or Vector( 0, 0, 0 ) )
		net.WriteString( sLanguage or 'ru' )
		net.WriteString( sText )
	net.Send( ePly )

end

-- ## Players ########################################################################################

local PLAYER = FindMetaTable( 'Player' )

local net_send_client_yandex_player_talk = AddString( AMB.TextToSpeech.Config.net_send_client_yandex_player_talk )
function PLAYER:TalkYandex( sVoice, sEmotion, nSpeed, sText )

	if not sText then return end

	net.Start( net_send_client_yandex_player_talk )
		net.WriteEntity( self )
		net.WriteString( sVoice or 'oksana' )
		net.WriteString( sEmotion or 'neutral' )
		net.WriteFloat( nSpeed or 1.0 )
		net.WriteString( sText )
	net.Broadcast()

end

local net_send_client_google_player_talk = AddString( AMB.TextToSpeech.Config.net_send_client_google_player_talk )
function PLAYER:TalkGoogle( sLanguage, sText )

	if not sText then return end

	net.Start( net_send_client_google_player_talk )
		net.WriteEntity( self )
		net.WriteString( sLanguage or 'ru' )
		net.WriteString( sText )
	net.Broadcast()

end

local types = table.GetKeys( AMB.TextToSpeech.Config.urls )
hook.Add( 'PlayerInitialSpawn', 'AMB.TextToSpeech.SetSettings', function( ePly )

	ePly.tts_type = table.Random( types )
	ePly.tts_yandex_voice = '' 
	ePly.tts_yandex_speed = 1.0
	ePly.tts_yandex_emotion = 'neutral'
	ePly.tts_google_lang = 'ru'

end )