local C, SND = AMB.G.C, AMB.G.SND

local function AddPostTime( nTime, ePly, fCallback )

    if not ePly then return end
    if not fCallback then return end
    
    timer.Simple( nTime, function()

        if ePly and IsValid( ePly ) then fCallback() end

    end )

end

local function SoldierTalk( ePly, nTime, sText )

    AddPostTime( nTime, ePly, function() 
    
        ePly:ChatSend( C.AMB_GREEN, 'Солдат: ', C.ABS_WHITE, sText ) 
        ePly:SoundSend( 'ambition/capture_of_terra/sfx/click1.wav' )

    end )

end

local function SimpleNotify( ePly, nType, nTime, cColor, sText )

    ePly:NotifySend( { type = nType, time = nTime, color = cColor, text = sText } )

end

local function Hint( ePly, sText )

    SimpleNotify( ePly, 4, 15, C.AMB_BLUE, sText )

end

-- ## Quest ########################################################

local name = 'В путь'
local desc = 'Третий квест и последний в арке Обучения.'
local reward = {
        
    desc = '',
    give = function( ePly, tQuest )

        ePly:AddMoney( 25000 )
        ePly:AddXP( 6200 )
        ePly:ChatSend( C.FLAT_BLUE, '[•] ', C.ABS_WHITE, 'Сервер заморожен, все подробности в /discord. Спасибо, что потратил время на сервер, ты лучший :)' )

        Hint( ePly, 'Спасибо за игру!' )

        if ePly:Alive() then ePly:Give( 'arccw_m107' ) end

    end

}

AMB.Quest.Config.quests[ 3 ] = {

    name = name,
    desc = desc,
    reward = reward,
    steps = {}

}

-- ## Steps ############################################################

-- ----------------------------------------------------------
--[[ 
    1: Создать клан или быть в нём
    2: Положить в клан 5.000$
    3: Поучаствовать в капте терры
    4: Поговорить с NPC Солдатом
]]--
-- ----------------------------------------------------------

AMB.Quest.Config.quests[ 3 ].steps[ 1 ] = {

    desc = 'Создайте/Вступите в клан',
    type = 'clan',
    retry = function( ePly, tQuest ) tQuest.steps[ 1 ].start( ePly, tQuest ) end,
    check = function( ePly ) return ePly:IsClan() end,
    start = function( ePly, tQuest ) 

        SoldierTalk( ePly, 1, 'Пришло время скооперироваться, пора в клан!' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Создать клан на F4 -> Клан' )
        if not ePly:IsClan() then ePly:AddMoney( 5000 ) end

    end

}

AMB.Quest.Config.quests[ 3 ].steps[ 2 ] = {

    desc = 'Пополните баланс',
    count = 5000,
    type = 'clan',
    retry = function( ePly, tQuest ) tQuest.steps[ 2 ].start( ePly, tQuest ) end,
    check = function( ePly ) return false end,
    start = function( ePly, tQuest ) 

        SoldierTalk( ePly, 1, 'Пора раскошелиться, пополни баланс клана' )
        SoldierTalk( ePly, 4, 'Не забывай, клан - это семья, о которой надо заботится' )

    end

}

AMB.Quest.Config.quests[ 3 ].steps[ 3 ] = {

    desc = 'Поучаствуйте в капте',
    type = 'clan',
    retry = function( ePly, tQuest ) tQuest.steps[ 3 ].start( ePly, tQuest ) end,
    check = function( ePly ) return false end,
    start = function( ePly, tQuest ) 

        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Команда ', C.FLAT_GREEN, '/renderzones 1', C.ABS_WHITE, ' покажет территории' )

    end

}

AMB.Quest.Config.quests[ 3 ].steps[ 4 ] = {

    desc = 'Поговорите с NPC Солдатом',
    type = 'use',
    retry = function( ePly, tQuest ) tQuest.steps[ 4 ].start( ePly, tQuest ) end,
    check = function( ePly ) return false end,
    start = function( ePly, tQuest ) 

        SoldierTalk( ePly, 1, 'Загляни ко мне, друг!' )

    end

}