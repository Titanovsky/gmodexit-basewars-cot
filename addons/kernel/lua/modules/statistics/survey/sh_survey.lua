function AMB.Statistics.Survey.Add( nID, sName, sQuestion, tAnswers )

    if not nID or not isnumber( nID ) then AMB.ErrorLog( 'Statistics.Survey', 'nID is not selected or it type is not number' ) return false end
    if not tAnswers or not istable( tAnswers ) then AMB.ErrorLog( 'Statistics.Survey', 'tAnswers is not selected or it type is not table' ) return false end

    local CFG = AMB.Statistics.Config

    if not sName or ( sName == '' ) then 
    
        AMB.WarningLog( 'Statistics.Survey', 'sName is not selected! Selected default name' ) 
        sName = CFG.survey_default_name
        
    end
    if not sQuestion or ( sQuestion == '' ) then 
    
        AMB.WarningLog( 'Statistics.Survey', 'sQuestion is not selected! Selected default question' ) 
        sQuestion = CFG.survey_default_question
        
    end
    if AMB.Statistics.Survey.table[ nID ] then AMB.WarningLog( 'Statistics.Survey', 'Survey with ID '..nID..' rewrite' ) end

    AMB.Statistics.Survey.table[ nID ] = {

        name = sName,
        question = sQuestion,
        answers = tAnswers

    }

    return true

end

function AMB.Statistics.Survey.Get( nID )

    if not nID or not isnumber( nID ) then AMB.ErrorLog( 'Statistics.Survey', 'nID is not selected or it type is not number' ) return false end

    return AMB.Statistics.Survey.table[ nID ]

end


-- ## Standart List ##

AMB.Statistics.Survey.Add( 1, 'Standart1', 'Как Вы узнали про сервер?', {

    [ 1 ] = { answer = 'Нашел во вкладке Basewars', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 2 ] = { answer = 'Посоветовал друг', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 3 ] = { answer = 'Увидел сервер на видео', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 4 ] = { answer = 'Узнал из стороней рекламы ( VK, Steam, Discord )', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 5 ] = { answer = 'Нашел по другому', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },

} )

AMB.Statistics.Survey.Add( 2, 'Standart2', 'Почему именно наш Basewars?', {

    [ 1 ] = { answer = 'Случайно нашел, решил попробовать', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 2 ] = { answer = 'Знакомый играл, стало интересно', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 3 ] = { answer = 'Друг сказал, что сервер очень хороший', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 4 ] = { answer = 'Друг сказал, что сервер средний, но попробовать стоит', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 5 ] = { answer = 'Решил зайти к своему любимому ютуберу', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 6 ] = { answer = 'Попробовал все Basewars сервера, не понравились', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 7 ] = { answer = 'Стало скучно на других режимах', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 8 ] = { answer = 'Увидел у вас большой онлайн', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 9 ] = { answer = 'Увидел ваше название, заинтересовало', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 10 ] = { answer = 'Увидел, что у вас максимальный рейтинг', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 11 ] = { answer = 'Увидел кастомную карту', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end },
    [ 12 ] = { answer = 'Быстрая загрузка и сервер мало весит', action = function( ePly, nID, nAnswerID ) ePly:ChatPrint( 'Вы молодец!' ) end }, -- max

} )