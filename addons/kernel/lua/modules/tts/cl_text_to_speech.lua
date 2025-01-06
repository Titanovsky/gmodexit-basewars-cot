local ignore = CreateClientConVar( 'amb_tts_ignore', '0', true )

local Lower, Encode = string.lower, AMB.Utility.Coding.EncodeURL

function AMB.TextToSpeech.Talk3D( ePly, nVolume, nMinDistance, nMaxDistance, sUrl )

	if ignore:GetBool() then return end

	local g_station

	sound.PlayURL( sUrl, '3d', function( audioSound, nError, sError )

		if not IsValid( audioSound ) then print( 'ERROR: '..tostring( sError ) ) return end
		if not IsValid( ePly ) then return end

		audioSound:Set3DEnabled( true )
		audioSound:SetVolume( nVolume )
		audioSound:Set3DFadeDistance( nMinDistance, nMaxDistance )
		audioSound:SetPos( ePly:GetPos(), ePly:GetPos() )
		audioSound:Play()

		g_station = audioSound

	end )

	local mark = tostring( ePly )

	hook.Add( 'Think', 'AMB.TextToSpeech.Text'..mark, function()

		if IsValid( ePly ) and IsValid( g_station ) then g_station:SetPos( ePly:GetPos(), ePly:GetPos() ) end

	end )

	timer.Simple( 1, function()

		if not g_station then return end

		timer.Simple( g_station:GetLength(), function() 

			hook.Remove( 'Think', 'AMB.TextToSpeech.Text'..mark )

		end )

	end )

end

function AMB.TextToSpeech.TalkMono( nVolume, vPos, sUrl )

	if ignore:GetBool() then return end

	local g_station

	sound.PlayURL( sUrl, 'mono', function( audioSound, nError, sError )

		if not IsValid( audioSound ) then return end

		audioSound:SetVolume( nVolume )
		audioSound:SetPos( vPos or LocalPlayer():GetPos() )
		audioSound:Play()

		g_station = audioSound

	end )

end

local talk_yandex = AMB.TextToSpeech.Config.net_send_client_yandex_talk
local talk_google = AMB.TextToSpeech.Config.net_send_client_google_talk

local talk_yandex_player = AMB.TextToSpeech.Config.net_send_client_yandex_player_talk
net.Receive( talk_yandex_player, function()

	local ply, voice, emotion, speed, text = net.ReadEntity(), Lower( net.ReadString() ), Lower( net.ReadString() ), tostring( net.ReadFloat() ), Encode( net.ReadString() )
	local full = AMB.TextToSpeech.Config.urls.yandex..'speaker='..voice..'&emotion='..emotion..'&text='..text

	AMB.TextToSpeech.Talk3D( ply, 0.6, 250, 0, full )

end )

local talk_google_player = AMB.TextToSpeech.Config.net_send_client_google_player_talk
net.Receive( talk_google_player, function()

	local ply, lang, text = net.ReadEntity(), Lower( net.ReadString() ), Encode( net.ReadString() )
	local full = AMB.TextToSpeech.Config.urls.google..'ie=UTF-8&client=tw-ob&tl='..lang..'&q='..text

	AMB.TextToSpeech.Talk3D( ply, 0.6, 250, 0, full )

end )