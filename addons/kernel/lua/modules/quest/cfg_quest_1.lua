local C, SND = AMB.G.C, AMB.G.SND

-- ## Helper ############################################

local function SetTimer( ePly, nStep )

    timer.Create( 'TimeTheFirstQuest:'..ePly:SteamID(), 120, 1, function() 

        if not IsValid( ePly ) then return end

        if ( AMB.Quest.GetPlayerQuestID( ePly ) == 1 ) then AMB.Quest.NextStep( ePly, 1, nStep ) end

    end )

end

local start_pos, start_ang = Vector( -628, -15275, -905 ), Angle( 0, 90, 0 )
local function StartPlayer( ePly )

    ePly:SetPos( start_pos )
    ePly:SetEyeAngles( start_ang )
    ePly:GodEnable()
    ePly:SetCollisionGroup( COLLISION_GROUP_WEAPON )

end

local function AddPostTime( nTime, ePly, fCallback )

    timer.Simple( nTime, function()

        if IsValid( ePly ) then fCallback() end

    end )

end

local function SoldierTalk( ePly, nTime, sText )

    AddPostTime( nTime, ePly, function() 
    
        ePly:ChatSend( C.AMB_GREEN, 'Солдат: ', C.ABS_WHITE, sText ) 
        ePly:SoundSend( 'ambition/capture_of_terra/sfx/click1.wav' )

    end )

end

-- ## Quest 1 ############################################

local name = 'Подключение'
local desc = 'Первый квест, служающий для оповещения игроку базовых элементов геймплея Capture Of Terra'
local reward = {
        
    desc = '800 XP, 1500$',
    give = function( ePly, tQuest )

        SoldierTalk( ePly, 0, 'Поздравляю, ты выполнил тестирование. Загляни ко мне, когда будешь свободен' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Чтобы заработать ', C.AMBITION, 'уровень', C.ABS_WHITE,' надо активно играть на сервере' ) 
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'За выполнение квестов дают очень много ', C.AMBITION, 'XP', C.ABS_WHITE, ', которое нужно для уровня' ) 
        
        ePly:AddXPEco( 800 )
        ePly:AddMoneyEco( 1500 )

        ePly:RunCommand( 'amb_hud_cot 3' )
        ePly:RunCommand( 'amb_propcore_hud_info 1' )

        ePly:GodDisable()

    end

}

-- 1: Краткая информация про сервер. Надо взять рюкзак с припасами, инфа что игрок на бейзварс сервере, надо строить базу, защищать свою и уничтожать другие
-- 2: Взять Пакет Ресурсов. Тут можно выполнять квесты и объединяться в кланы, кланы могут захватывать территории и рейдить боссов
-- 3: Взять Оружие, которое поможет уничтожить Зомби. На карте несколько локаций и подземелий, и на них могут встретиться NPC
-- 4: Нажать на телепорт и через 4 секунды отправиться уничтожать зомби
-- 5: Убить троих зомбей
-- 6: Перенестись на спавн и поговорить с NPC Солдатом (поставить маркер)

AMB.Quest.Config.quests[ 1 ] = {

    name = name,
    desc = desc,
    reward = reward,
    steps = {}

}

-- ## Steps #############################################

AMB.Quest.Config.quests[ 1 ].steps[ 1 ] = {

    desc = 'Возьмите Рюкзак с Припасами',
    type = 'touch',
    check = function( ePly ) return false end,
    retry = function( ePly, tQuest ) tQuest.steps[ 1 ].start( ePly ) end,
    start = function( ePly ) 
    
        StartPlayer( ePly )
        SetTimer( ePly, 1 )

        SoldierTalk( ePly, 0.75, 'Псс.. Приём, я говорю с тобой по раций' )
        SoldierTalk( ePly, 0.75 + 0.55, 'Сейчас тебе нужно взять рюкзак' )
        
    end

}

AMB.Quest.Config.quests[ 1 ].steps[ 2 ] = {

    desc = 'Возьмите Ресурсы',
    type = 'touch',
    count = 1,
    check = function( ePly ) return false end,
    retry = function( ePly, tQuest ) 

        StartPlayer( ePly )
        SetTimer( ePly, 2 )

    end,
    start = function( ePly ) 
    
        SetTimer( ePly, 2 )

        SoldierTalk( ePly, 0.75 + 0.5, 'Я вижу ты новенький? Давай расскажу тебе в кратце' )
        SoldierTalk( ePly, 0.75 + 0.5 * 4, 'Ты попал в игровую реальность под названием Capture of Terra' )
        SoldierTalk( ePly, 0.75 + 0.5 * 8, 'Режим у этой реальности: Basewars. Надо выживать, убивать других игроков' )

    end

}

AMB.Quest.Config.quests[ 1 ].steps[ 3 ] = {

    desc = 'Возьмите Оружие',
    type = 'touch',
    check = function( ePly ) return false end,
    retry = function( ePly )

        StartPlayer( ePly )
        SetTimer( ePly, 3 )

    end,
    start = function( ePly ) 
    
        SoldierTalk( ePly, 0.75 + 0.5, 'Строить базы, рейдить базы других.' )
        SoldierTalk( ePly, 0.75 + 0.5 * 3, 'Основное, ты можешь вместе с кланом захватывать территорий и рейдить боссов' )

    end

}

AMB.Quest.Config.quests[ 1 ].steps[ 4 ] = {

    desc = 'Нажать на телепорт',
    type = 'use',
    check = function( ePly ) return false end,
    retry = function( ePly )

        StartPlayer( ePly )
        SetTimer( ePly, 4 )

    end,
    start = function( ePly ) 
    
        SoldierTalk( ePly, 0.25, 'Нажми на телепорт, он наверху' )

        ePly:Give( 'arccw_db' )
        
    end

}

AMB.Quest.Config.quests[ 1 ].steps[ 5 ] = {

    desc = 'Убейте Зомби',
    type = 'kill',
    count = 4,
    check = function( ePly ) return false end,
    retry = function( ePly, tQuest )

        StartPlayer( ePly )
        SetTimer( ePly, 5 )
        ePly:SetPos( Vector( 155, -15118, -853 ) )

        ePly:Give( 'arccw_db' )
        ePly:Give( 'arccw_ammo_buckshot_large' )

    end,
    start = function( ePly ) 

        SoldierTalk( ePly, 0.25, 'Приготовься убить Зомби' )

        ePly:Give( 'arccw_ammo_buckshot_large' )
        
    end

}

local pos, ang = Vector( -2044, -14529, -898 ), Angle( 0, -90, 0 )
AMB.Quest.Config.quests[ 1 ].steps[ 6 ] = {

    desc = 'Поговорите с NPC Солдатом',
    type = 'use',
    count = 1,
    check = function( ePly ) return false end,
    start = function( ePly ) 

        ePly:SetPos( pos )
        ePly:SetPos( pos )
        ePly:SetEyeAngles( ang )

        ePly:StripWeapon( 'arccw_db' )
        ePly:RemoveAllAmmo()

        ePly:GodDisable()
        AMB.Statistics.Survey.CallQuestion( ePly, 1 )

        timer.Remove( 'TimeTheFirstQuest:'..ePly:SteamID() )

        SoldierTalk( ePly, 0.25, 'Ты молодец! Круто их убил, теперь подойди ко мне' )
        
    end

}
