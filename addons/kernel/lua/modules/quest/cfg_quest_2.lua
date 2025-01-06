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

local function SellerTalk( ePly, nTime, sText )

    AddPostTime( nTime, ePly, function() 
    
        ePly:ChatSend( C.FLAT_PURPLE, 'Торговец: ', C.ABS_WHITE, sText ) 
        ePly:SoundSend( 'ambition/capture_of_terra/sfx/click1.wav' )

    end )

end

local function SimpleNotify( ePly, nType, nTime, cColor, sText )

    ePly:NotifySend( { type = nType, time = nTime, color = cColor, text = sText } )

end

local function Hint( ePly, sText )

    SimpleNotify( ePly, 4, 15, C.AMB_BLUE, sText )

end

local function SetTimeAlive( ePly, nTime, nQuest, nStep )

    timer.Create( 'TimeQuest:'..nQuest..'.'..nStep..':'..ePly:SteamID64(), nTime, 1, function()

        if IsValid( ePly ) then AMB.Quest.AddCount( ePly, 1, nQuest, nStep ) end

    end )

end

-- ## Quest ########################################################

local name = 'Курс Молодого Бойца'
local desc = 'Второй квест, предпоследний из обучающей арки'
local reward = {
        
    desc = '',
    give = function( ePly, tQuest )

        local name = ePly:GetGamename()

        ePly:ChatSend( '\n' )

        SoldierTalk( ePly, 1, 'Бери, ты заслужил это' )
        SoldierTalk( ePly, 2 * 1, 'Как ты понял, ты не туда записался' )
        SoldierTalk( ePly, 2 * 3, 'Корпорация Zion ясно что-то скрывается' )
        SoldierTalk( ePly, 2 * 6, 'Она использует нас ради личной выгоды, я не могу это терпеть' )
        SoldierTalk( ePly, 2 * 9, 'Я буду надеяться на твою поддержку, '..name )

        ePly:AddXPEco( 4000 )
        ePly:AddMoneyEco( 2555 )

        AMB.Statistics.Survey.CallQuestion( ePly, 2 )

        if not ePly:Alive() then return end

        ePly:Give( 'weapon_crowbar' )
        ePly:Give( 'arccw_ragingbull' )
        ePly:Give( 'arccw_m4a1' )

        ePly:SetHealth( ePly:Health() + 50 )
        ePly:SetArmor( ePly:Armor() + 150 )

    end

}

AMB.Quest.Config.quests[ 2 ] = {

    name = name,
    desc = desc,
    reward = reward,
    steps = {}

}

-- ## Steps ############################################################

-- ----------------------------------------------------------
--[[ 
    1: Знакомство с Меню. Нажать F4 (ему при старте сетнется команда "amb_mm_cot_page_f4 5", чтобы сразу вышли настройки )
    2: Чатовые Команды. Пусть пропишет /stopsound, далее ему выйдут распространённые команды
    3: Система Наборов. Пусть пропишет /kit starter, познакомится с наборами, что это лёгкая система
    4: Ему дадут немного денег и дадут команду на открытие магазина /shop, он должен купить любое оружие
    5: Нажмёт на C и купит патронов
    6: Телепорты, пусть заюзает те три телепорта на спавне, любой из них даст результат
    7: Пусть найдёт место, где пропы не будут удаляться и поставит 15 пропов + Высветится информация про PickUp
    8: Пускай научится пользоваться Precision, в чат ему будут подсказки, использование тула даст результат
    9: Пушка есть, база есть, снова дадим немного денег + какой-нибудь дробовик и 255 HP. Надо купить маник T1
    10: Краткая информация про маник и то, как его улучшать, и как починить. Пусть купит ремонтный набор и починит маник
    11: Инфа о том, что таб тоже можно менять. Дадут команды /f4 и номер страницы, /tab и номер страницы. Пусть поиграет на сервере 8 минут и получит приз.
    12: На этот раз ему надо будет нажать телепорт на шахте
    13: Пусть купит Лазерный Резак (проверка на то, имеется ли он)
    14: Инфа о том, как добыть руду и продать её + Взять в инвентарь через Alt + E. Оповещение о том, что нужно купить какой-то обвес и отнести в Бункер, и как войти в бункер, там встретит NPC Торговец
    15: После NPC Торговца, он сообщит о том, где игрок и что делать (надо захватить корпорацию Zion и отключить проект Анубис от питания), расскажет, про три локаций их подземелья
    16: NPC Торговец напомнит, что ему можно приносить всякое барахло и он за него даст деньги. Теперь надо дождаться 5 уровня (проверка на 5 уровень и выше)
    17: Теперь воспользоваться телепортом, который находится в Начальной Локаций и попасть в Среднюю Локацию
    18: Теперь надо вернуться на спавн Начальной Зоны, поговорить с NPC Солдатом и забрать награду (В конце напишут команду /discord)
--]]
-- ----------------------------------------------------------

AMB.Quest.Config.quests[ 2 ].steps[ 1 ] = {

    desc = 'Нажмите F4 (Открыть Главное Меню)',
    type = 'bind',
    retry = function( ePly, tQuest ) tQuest.steps[ 1 ].start( ePly, tQuest ) end,
    check = function( ePly ) return false end,
    start = function( ePly, tQuest ) 

        local name = ePly:GetGamename()

        ePly:ChatSend( '\n' )

        SoldierTalk( ePly, 1, 'Оо, '..name..', ты пришёл, подожди немного.. Я кое что тебе приготовил' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Открыть главное меню можно как на ', C.AMBITION, 'F4', C.ABS_WHITE, ' так и на ', C.AMBITION, 'TAB', C.ABS_WHITE )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'В меню настройках можно оптимизировать игру под себя (Повысить FPS, кастомизировать)' )

        SimpleNotify( ePly, 14, 8, C.AMB_GREEN, 'Приятной игры на сервере :)')

        ePly:RunCommand( 'amb_mm_cot_page_f4 5' )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 2 ] = {

    desc = 'Напишите в чат команду /stopsound',
    type = 'chat',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:AddMoneyEco( 250 )
        ePly:AddXPEco( 250 )
        ePly:RunCommand( 'amb_mm_cot_page_f4' )

        ePly:ChatSend( C.AMB_BLUE, '\n\n[ChatCommands] ', C.ABS_WHITE, 'На сервере присутствуют чатовые команды' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Самые популярные команды: ', C.AMBITION, 'cmd, kit, help, settings, donate' )

        Hint( ePly, '/cmd - покажет все команды на сервере' )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 3 ] = {

    desc = 'Напишите в чат команду /kit starter',
    type = 'chat',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:AddMoneyEco( 250 )
        ePly:AddXPEco( 250 )

        ePly:ChatSend( C.AMB_RED, '\n\n[Kits] ', C.ABS_WHITE, 'Система ', C.AMB_RED, 'Наборов', C.ABS_WHITE, ' в разы облегчит вам игру' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Наш донат является уникальным, так как он сбалансированный' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Capture of Terra — единственный сервер с адекватным донатом ', C.AMB_BLUE, '/donate' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.AMB_RED, '/kit minigun', C.ABS_WHITE, ' на другом сервере будет бесконечным, у нас раз в 6 часов' )

        SimpleNotify( ePly, 14, 8, C.AMB_GREEN, 'Мы любим и ценим каждого игрока Capture of Terra' )
        SimpleNotify( ePly, 14, 8, C.AMB_GREEN, 'Спасибо, что играешь на сервере ;3' )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 4 ] = {

    desc = 'Купите любое оружие в магазине',
    type = 'buy',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:ChatSend( '\n' )
        SoldierTalk( ePly, 0, 'На, держи подгончик от меня, купи любое оружие' )
        SoldierTalk( ePly, 1, 'Не миллион конечно, но на валыну хватит' )
        SoldierTalk( ePly, 2, 'Без хорошего оружия тут нечего делать' )

        ePly:AddMoneyEco( 3200 )
        ePly:AddXPEco( 250 )

        AddPostTime( 3, ePly, function()

            ePly:ChatSend( C.AMB_BLUE, '>> ', C.AMB_GREEN, '/shop' )
            Hint( ePly, 'Магазин можно открыть на F4 -> Магазин -> Оружия' )

        end )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 5 ] = {

    desc = 'Купите патроны (C Меню)',
    type = 'buy',
    count = 3,
    retry = function( ePly ) Hint( ePly, 'Нажмите на C --> Купить Патроны' ) end,
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:AddMoneyEco( 100 )
        ePly:AddXPEco( 250 )

        ePly:ChatSend( '\n' )
        SoldierTalk( ePly, 0, 'Тебе лучше стоит закупить патронов, да побольше' )

        AddPostTime( 3, ePly, function()

            Hint( ePly, 'Нажмите на C --> Купить Патроны' )

        end )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 6 ] = {

    desc = 'Воспользуйтесь Синим Телепортом',
    type = 'use',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:ChatSend( '\n' )
        SoldierTalk( ePly, 0, 'Пора вылазить наружу..' )
        SoldierTalk( ePly, 2.75, 'Смотри, всего есть три локаций и их подземелья' )
        SoldierTalk( ePly, 4.75, 'Также Шахта и Развлекательный Центр, но об этом позже' )
        SoldierTalk( ePly, 6.75, 'Сейчас найди Синий Телепорт, он неподалёку, и попади в Начальную Локацию' )

        ePly:AddMoneyEco( 100 )
        ePly:AddXPEco( 250 )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 7 ] = {

    desc = 'Создайте 15 Пропов',
    count = 15,
    type = 'spawn',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:AddMoneyEco( 100 )
        ePly:AddXPEco( 250 )

        ePly:ChatSend( '\n' )
        SoldierTalk( ePly, 1, 'Будь аккуратным, там дофига людей, которые хотят убить тебя' )
        SoldierTalk( ePly, 3, 'Ты будешь бессмертным всего 6 секунд, поторопись потом найти укрытие' )
        SoldierTalk( ePly, 6, 'Как найдёшь укрытие, обустройся' )

        Hint( ePly, 'Найдите любое место, где можно строить и сделайте базу' )

        AddPostTime( 10, ePly, function()

            Hint( ePly, 'На дорогах есть Пикапы, это различные плюшки, которые можно подобрать' )

        end )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 8 ] = {

    desc = 'Используй инструмент Precision',
    type = 'spawn',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:AddMoneyEco( 100 )
        ePly:AddXPEco( 250 )

        ePly:ChatSend( C.AMBITION, '\n[Подсказка] ', C.ABS_WHITE, 'Инструмент ', C.AMB_GREEN, 'Precision', C.ABS_WHITE, ' идеально подходит для строительства' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Запомните, никогда не используйте крепления (верёвки, сварку) для неподвижных построек (баз, домов)' )
        Hint( ePly, 'Нажмите Q --> Инструменты --> Precision --> Move (Двигать)' )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 9 ] = {

    desc = 'Купите Принтер T1',
    type = 'buy',
    retry = function( ePly ) Hint( ePly, 'Что-то покупать можно ни только с помощью F4 или TAB, но и командой /shop' ) end,
    check = function( ePly ) return ( AMB.Economic.GetLimit( ePly, 'moneyprinter1' ) > 0 ) end,
    start = function( ePly, tQuest )

        ePly:AddMoneyEco( 4000 )
        ePly:AddXPEco( 250 )

        Hint( ePly, 'Запомните, никогда не используйте крепления для неподвижных построек' )

        AddPostTime( 5, ePly, function()

            ePly:ChatSend( C.AMB_BLUE, '\n[Сервер] ', C.ABS_WHITE, 'За то, что вы использовали Precision на неподвижную постройку, вы получаете награду' )
            ePly:ChatSend( C.AMB_BLUE, '[Сервер] ', C.ABS_WHITE, 'Сварки, верёвки, оси - не нужны для крутых баз :3' )
            ePly:AddXPEco( 1500 )

            Hint( ePly, 'Что-то покупать можно ни только с помощью F4 или TAB, но и командой /shop' )

            if not ePly:Alive() then return end

            ePly:Give( 'arccw_shorty' )
            ePly:Give( 'arccw_ammo_buckshot_large' )
            ePly:SetHealth( ePly:Health() + 100 )

        end )

        AddPostTime( 45, ePly, function() Hint( ePly, 'Если не успеваете читать, можно посмотреть историю F4 > Настройки > Notify' ) end )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 10 ] = {

    desc = 'Купите Ремонтный Комплект',
    type = 'buy',
    check = function( ePly ) return ( AMB.Economic.GetLimit( ePly, 'repair_kit' ) > 0 ) end,
    start = function( ePly, tQuest )

        ePly:AddMoneyEco( 400 )
        ePly:AddXPEco( 250 )

        AddPostTime( 5, ePly, function()

            ePly:ChatSend( C.AMBITION, '\n[Подсказка] ', C.ABS_WHITE, 'Денежные Принтеры сами улучшаются со временем, но и теряют прочность' )
            ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Как только прочность будет ниже нуля, Денежный Принтер сломается' )
            ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Починить можно только Рем. Комплектом' )

            Hint( ePly, 'Ремонтный Комплект - чинит некоторые предметы, например, Пропы и Денежные Принтеры' )

        end )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 11 ] = {

    desc = 'Убейте стражей',
    type = 'kill',
    count = 2,
    retry = function( ePly, tQuest ) tQuest.steps[ 11 ].start( ePly, tQuest ) end,
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        Hint( ePly, 'Вы можете сразу указать страницу при нажатий TAB или F4' )
        Hint( ePly, 'Команды: /f4 [Номер Страницы] и /tab [Номер Страницы]' )

        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Стражи - охраняют локацию и убивают игроков!' )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 12 ] = {

    desc = 'Воспользуйтесь Телепортом на Шахту',
    type = 'use',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:RunCommand( 'amb_esp_gps_mine' )

        util.ScreenShake( ePly:GetPos(), 400, 100, 10, 120 )

        SimpleNotify( ePly, 8, 8, C.AMB_BLOOD, 'Землетрясение' )
        ePly:SoundSend( 'ambient/creatures/town_child_scream1.wav' )

        ePly:AddMoneyEco( 400 )

        AddPostTime( 8, ePly, function()

            ePly:ChatSend( '\n' )

            SoldierTalk( ePly, 0, 'Приём.. Чёртова рация, плохо работает, слушай..' )
            SoldierTalk( ePly, 2, 'Тебе надо добраться до Шахты, телепорт найдёшь сам' )

            ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Телепорт находится на входе Восточного Тоннеля, рядом со спавнами' )

        end )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 13 ] = {

    desc = 'Купите Лазерный Резак',
    type = 'buy',
    check = function( ePly ) return ePly:HasWeapon( 'weapon_laserlink' ) end,
    start = function( ePly, tQuest )

        ePly:ChatSend( '\n' )
        SoldierTalk( ePly, 1, 'На держи немного денег, на резак тебе хватит' )

        ePly:AddMoneyEco( 4500 )

        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Любому игроку можно дать денег | ', C.FLAT_GREEN, 'C Меню --> Передать Деньги' )

        SoldierTalk( ePly, 4, 'На шахте ты сможешь хорошо подзаработать, деньги лишними не будут' )
        SoldierTalk( ePly, 8, 'Купи Лазерный Резак, он не дорогой и иди в саму шахту' )
        SoldierTalk( ePly, 12, 'Просто долби руду и всё, остатки можешь подбирать' )
        SoldierTalk( ePly, 16, 'Потом продай всю руду Скупщику, он ждёт тебя у входа в шахту' )

        AddPostTime( 20, ePly, function() 
        
            ePly:ChatSend( C.AMB_GRAY, '\n>> F4' )
            ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Открыть ', C.AMBITION, 'инвентарь', C.ABS_WHITE, ' можно в Главном Меню --> Персонаж' )
            Hint( ePly, 'Подбирать в Инвентарь можно при нажатий Alt + E' ) 

        end )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 14 ] = {

    desc = 'Отнесите обвес Aimpoint RDS Торговцу',
    type = 'touch',
    retry = function( ePly, tQuest ) tQuest.steps[ 14 ].start( ePly, tQuest ) end,
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:RunCommand( 'amb_esp_gps_bunker' )

        ePly:ChatSend( '\n' )

        SoldierTalk( ePly, 2, 'Пришло время познакомить тебя с Торговцем' )
        SoldierTalk( ePly, 6, 'Он покупает всякое барахло и продаёт запретные вещи' )
        SoldierTalk( ePly, 10, 'Торговца можно найти в Бункере, тебе надо туда отправиться' )
        SoldierTalk( ePly, 14, 'Купишь в магазине обвес Aimpoint RDS и отнесёшь прям к нему' )

        Hint( ePly, 'Телепорт в Бункер находится в Начальной Локаций у озера' ) 

        AddPostTime( 16, ePly, function() 
        
            ePly:ChatSend( C.AMB_GRAY, '\n>> /donate' )
            ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Обвес ', C.AMB_BLUE, 'Aimpoint RDS', C.ABS_WHITE, ' находится в Магазине во вкладке Обвесы и стоит ', C.AMB_GREEN, '350$' )
            ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Будь аккуратным, в бункере небезопасно' )
            
        end )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 15 ] = {

    desc = 'Выслушайте Торговца',
    type = 'time',
    retry = function( ePly, tQuest ) tQuest.steps[ 15 ].start( ePly, tQuest ) end,
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        local name = ePly:GetGamename()

        SellerTalk( ePly, 2, 'Так это про тебя говорил Солдат?' )
        SellerTalk( ePly, 2 + 3 * 2, 'Он сказал мне, что ты хороший человек, всегда можешь выручить' )
        SellerTalk( ePly, 2 + 3 * 4, 'Кстати, будь аккуратен, пока я с тобой базарю, тебя могут убить' )
        SellerTalk( ePly, 2 + 3 * 6, 'Смотри, ты записался в тестирование у корпораций Zion' )
        SellerTalk( ePly, 2 + 3 * 8, 'Само тестирование проходит в виртуальной реальности - Anubis\n' )

        AddPostTime( 2 + 3 * 12, function() ePly:SoundSend( 'buttons/blip1.wav' ) end )

        SellerTalk( ePly, 2 + 3 * 12, 'Всемирная корпорация Zion очень долго разрабатывала Anubis и тщательно его сделала' )
        SellerTalk( ePly, 2 + 3 * 14, 'Хоть Anubis и сделан, чтобы создавать солдат, путём созданий условий для убийств и рейдов' )
        SellerTalk( ePly, 2 + 3 * 16, 'Но у них жёсткие правила и непонятные намерения, мне кажется тут не чисто' )
        SellerTalk( ePly, 2 + 3 * 18, 'Так как ты внутри Анубиса, ты не можешь умереть, каждый раз ты будешь возрождаться\n' )

        AddPostTime( 2 + 3 * 22, ePly, function() ePly:SoundSend( 'buttons/blip1.wav' ) end )

        SellerTalk( ePly, 2 + 3 * 22, 'Сам Анубис разделён на локаций: Начальная, Средняя и Подземная' )
        SellerTalk( ePly, 2 + 3 * 24, 'И, конечно, на их подземелья: Бункер, Заброшенный Завод и Лаборатория' )
        SellerTalk( ePly, 2 + 3 * 26, 'Также есть спец.зоны, где убивать нельзя: Спавны, Шахта, Развлекательный Центр' )
        SellerTalk( ePly, 2 + 3 * 28, 'В каждой локаций есть Стражи и Главные Стражи (Боссы) в подземельях\n' )

        AddPostTime( 2 + 3 * 32, ePly, function() ePly:SoundSend( 'buttons/blip1.wav' ) end )

        SellerTalk( ePly, 2 + 3 * 32, 'Анубис подпитывается с помощью энергостанций в Запретной Зоне' )
        SellerTalk( ePly, 2 + 3 * 34, 'Однако, он охраняется Великим Технократом - самым сильным боссом в Анубисе' )
        SellerTalk( ePly, 2 + 3 * 36, 'Ходят слухи, что был клан смельчаков, которые добрались до Технократа и уничтожили его' )
        SellerTalk( ePly, 2 + 3 * 38, 'Но, через время его снова создали, а куда пропал тот клан, не ясно..\n' )

        AddPostTime( 2 + 3 * 42, ePly, function() ePly:SoundSend( 'buttons/button18.wav' ) end )

        SellerTalk( ePly, 2 + 3 * 42, 'Возможно, если уничтожить Великого Технократа можно управлять всем Анубисом' )
        SellerTalk( ePly, 2 + 3 * 44, 'Например, ты можешь спасти всех или заполучить над другими игроками контроль' )
        SellerTalk( ePly, 2 + 3 * 48, 'Правда.. Без клана ты это не сделаешь, нужно захватить все территорий, а это может только Клан' )
        SellerTalk( ePly, 2 + 3 * 50, 'Вот тебе краткий экскурс, куда ты попал и что почём\n' )

        AddPostTime( 2 + 3 * 52, ePly, function() ePly:SoundSend( 'buttons/button18.wav' ) end )

        SellerTalk( ePly, 2 + 3 * 52, 'Кстати, ты можешь приносить всякие ненужные вещи ко мне' )
        SellerTalk( ePly, 2 + 3 * 54, 'Либо ты можешь купить у меня всякие запретные вещи или оружия и их рецепты' )
        SellerTalk( ePly, 2 + 3 * 56, 'Вроде всё рассказал, передай благодарность от меня Солдату' )
        SellerTalk( ePly, 2 + 3 * 58, 'И это, '..name..', удачи тебе!\n' )

        SetTimeAlive( ePly, 2 + 3 * 59, 2, 15 )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 16 ] = {

    desc = 'Получите 5 Уровень',
    type = 'time',
    retry = function( ePly, tQuest ) tQuest.steps[ 16 ].start( ePly, tQuest ) end,
    check = function( ePly ) return ( ePly:GetLevel() >= 5 ) end,
    start = function( ePly, tQuest )

        SoldierTalk( ePly, 2, 'Оу, ты не умер от скуки, да ты крепкий орешек' )
        SoldierTalk( ePly, 6, 'Тебе нужно кое куда прийти, но для этого нужен 5 уровень' )

        Hint( ePly, 'Чтобы быстрее достичь уровня, просто активно играйте на сервере!' ) 

        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, '\nУбийство игроков, взятие денег с принтера, нарковарка - всё это приносит XP' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Как только XP достигнет твоего максимального XP, уровень поднимется +1' )
        ePly:ChatSend( C.AMBITION, '[Подсказка] ', C.ABS_WHITE, 'Также раз в 10 минут приходит зарплата для игроков, там +XP и +Деньги' )

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 17 ] = {

    desc = 'Попадите в Среднюю Локацию',
    type = 'use',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:RunCommand( 'amb_esp_gps_middleloc' )

        ePly:ChatSend( '\n' )

        SoldierTalk( ePly, 2, 'Средняя Локация - золотая середина Анубиса, там основной замес' )
        SoldierTalk( ePly, 6, 'Там ты сможешь подзаработать больше денег и получить опыта' )
        SoldierTalk( ePly, 10, 'Но будь аккуратен, почти все кланы там, они устраивают войну из-за территорий' )

        Hint( ePly, 'Нужно воспользовать телепортом, который в Начальной Локаций, он в Северном Тоннеле' ) 

    end

}

AMB.Quest.Config.quests[ 2 ].steps[ 18 ] = {

    desc = 'Поговорите с NPC Солдатом',
    type = 'use',
    check = function( ePly ) return false end,
    start = function( ePly, tQuest )

        ePly:ChatSend( '\n' )

        ePly:AddXPEco( 250 )
        ePly:AddMoneyEco( 1000 )

        SoldierTalk( ePly, 0, 'Теперь возращайся ко мне, телепорты найдёшь в Начальной Локаций' )
        SoldierTalk( ePly, 2, 'Просто нам нужно поговорить с глазу на глаз' )
        SoldierTalk( ePly, 4, 'Я тебе подкину немного деньжат' )

    end

}