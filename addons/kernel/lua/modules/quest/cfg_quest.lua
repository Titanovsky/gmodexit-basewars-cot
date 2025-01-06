AMB.Quest = AMB.Quest or {}
AMB.Quest.Config = AMB.Quest.Config or {}

local C = AMB.G.C

-- DataBase --
AMB.Quest.Config.db = 'amb_quests'
AMB.Quest.Config.db_finish = 'amb_quests_finish' -- складируются выполненные квесты у игроков

-- Net Strings
AMB.Quest.Config.net_take_quest = 'amb_quest_take_quest'
AMB.Quest.Config.net_send_ready_quests_to_client = 'amb_quest_send_ready_quests_to_client'

-- Quests --
AMB.Quest.Config.quests = AMB.Quest.Config.quests or {}

--[[
AMB.Quest.Config.quests[ 4 ] = {

    name = 'Мясной',
    desc = 'Ходят легенды, что в подземках Средней Зоны когда-то была секретная лаборатория, которая до сих пор хранить чудовищные секреты',
    steps = {

        [ 1 ] = {

            desc = 'Возьмите рюкзак',
            type = 'touch',
            check = function( ePly ) return false end,
            retry = true,
            start = function( ePly, tQuest ) 

                --
                
            end

        },

    },
    reward = {
        
        desc = 'ANY',
        give = function( ePly, tQuest )

            ePly:ChatPrint( '[Quest] Вы прошли квест: '..tQuest.name )

        end

    }

}

AMB.Quest.Config.quests[ 5 ] = {

    name = 'Казино',
    desc = 'Постоянно убивать, рейдить и каптить территорий - это весело, но пора и отдохнуть. Почему бы не заглянуть в Развлекатльный Центр?',
    steps = {

        [ 1 ] = {

            desc = 'Возьмите рюкзак',
            type = 'touch',
            check = function( ePly ) return false end,
            retry = true,
            start = function( ePly, tQuest ) 

                --
                
            end

        },

    },
    reward = {
        
        desc = 'ANY',
        give = function( ePly, tQuest )

            ePly:ChatPrint( '[Quest] Вы прошли квест: '..tQuest.name )

        end

    }

}

AMB.Quest.Config.quests[ 6 ] = {

    name = '-',
    desc = 'Постоянно убивать, рейдить и каптить территорий - это весело, но пора и отдохнуть. Почему бы не заглянуть в Развлекатльный Центр?',
    steps = {

        [ 1 ] = {

            desc = 'Возьмите рюкзак',
            type = 'touch',
            check = function( ePly ) return false end,
            retry = true,
            start = function( ePly, tQuest ) 

                --
                
            end

        },

    },
    reward = {
        
        desc = 'ANY',
        give = function( ePly, tQuest )

            ePly:ChatPrint( '[Quest] Вы прошли квест: '..tQuest.name )

        end

    }

}

AMB.Quest.Config.quests[ 7 ] = {

    name = '-',
    desc = 'Постоянно убивать, рейдить и каптить территорий - это весело, но пора и отдохнуть. Почему бы не заглянуть в Развлекатльный Центр?',
    steps = {

        [ 1 ] = {

            desc = 'Возьмите рюкзак',
            type = 'touch',
            check = function( ePly ) return false end,
            retry = true,
            start = function( ePly, tQuest ) 

                --
                
            end

        },

    },
    reward = {
        
        desc = 'ANY',
        give = function( ePly, tQuest )

            ePly:ChatPrint( '[Quest] Вы прошли квест: '..tQuest.name )

        end

    }

}

AMB.Quest.Config.quests[ 8 ] = {

    name = 'Игра окончена',
    desc = 'Постоянно убивать, рейдить и каптить территорий - это весело, но пора и отдохнуть. Почему бы не заглянуть в Развлекатльный Центр?',
    steps = {

        [ 1 ] = {

            desc = 'Возьмите рюкзак',
            type = 'touch',
            check = function( ePly ) return false end,
            retry = true,
            start = function( ePly, tQuest ) 

                --
                
            end

        },

    },
    reward = {
        
        desc = 'ANY',
        give = function( ePly, tQuest )

            ePly:ChatPrint( '[Quest] Вы прошли квест: '..tQuest.name )

        end

    }

}
]]--