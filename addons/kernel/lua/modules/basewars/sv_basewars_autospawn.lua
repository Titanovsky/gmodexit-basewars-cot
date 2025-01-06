local Add = AMB.AutoSpawn.Add

local C = AMB.G.C

local CT = 'bw_teleport' -- Class Teleport

-- ## Первый Спавн #####################################################################

local kill_zombies_places = {

    { pos = Vector( 312, -14786, -915 ), ang = Angle( 0, -135, 0 ) },
    { pos = Vector( -117, -15215, -915 ), ang = Angle( 0, 45, 0 ) },
    { pos = Vector( 348, -15169, -915 ), ang = Angle( 0, 135, 0 ) },
    { pos = Vector( -96, -14767, -915 ), ang = Angle( 0, -45, 0 ) },
    { pos = Vector( 136, -14779, -915 ), ang = Angle( 0, -90, 0 ) },
    { pos = Vector( 136, -15252, -915 ), ang = Angle( 0, 90, 0 ) },

}

Add( 'Quest 1.4', CT, Vector( -627, -14731, -840 ), Angle( 0, 180, -90 ), function( eObj ) 

    eObj:SetHeader( 'Телепорт' )
    eObj:SetDelay( 4 )
    eObj:SetOutputPoses( kill_zombies_places )

    AMB.Quest.AddEntity( eObj, 1, 4 )

end )

-- ## Первый Спавн #####################################################################

local road_start_location = {

    { pos = Vector( -6970, -13265, 132 ), ang = Angle( 0, 90, 0 ) },
    { pos = Vector( -7814, -13264, 132 ), ang = Angle( 0, -180, 0 ) },
    { pos = Vector( -9071, -13263, 132 ), ang = Angle( 0, -180, 0 ) },
    { pos = Vector( -10112, -13260, 132 ), ang = Angle( 0, -180, 0 ) },
    { pos = Vector( -11463, -13223, 132 ), ang = Angle( 0, -180, 0 ) }

}

local bunker = {

    { pos = Vector( -9012, -2755, -614 ), ang = Angle( 0, -90, 0 ) },
    { pos = Vector( -8602, -2805, -606 ), ang = Angle( 0, -90, 0 ) },
    { pos = Vector( -8335, -3034, -616 ), ang = Angle( 0, -90, 0 ) },
    { pos = Vector( -8058, -2783, -597 ), ang = Angle( 0, -90, 0 ) },
    { pos = Vector( -7692, -2806, -598 ), ang = Angle( 0, -90, 0 ) }

}

local header = '[1] Первый Спавн >> Начальная Локация (Дорога)'
Add( header, CT, Vector( -2048, -13718, -878 ), Angle( 0, 180, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 4 )
    eObj:EnableCollisionCaller( true )
    eObj:SetOutputPoses( road_start_location )

end )

local header = '[2] Первый Спавн >> Начальная Локация'
Add( header, CT, Vector( -2161, -13728, -878 ), Angle( 0, 180, -90 ), function( eObj ) 

    eObj:SetColor( C.AMB_BLUE )
    AMB.Quest.AddEntity( eObj, 2, 6 )

    eObj:SetHeader( header )
    eObj:SetDelay( 4 )
    eObj:EnableCollisionCaller( true )
    eObj:SetOutputPos( 'Стартовая Зона #1', Vector( -5806, -14692, 314 ), Angle( 0, 180, 0 ) )

end )

local header = '[3] Первый Спавн >> Начальная Локация'
Add( header, CT, Vector( -1919, -13728, -878 ), Angle( 0, 180, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 4 )
    eObj:EnableCollisionCaller( true )
    eObj:SetOutputPos( 'Стартовая Зона #2', Vector( -5749, -14689, 131 ), Angle( 0, 90, 0 ) )

end )

-- ## Начальная Зона #####################################################################

local header = 'Начальная Локация #1 >> Первый Спавн'
Add( header, CT, Vector( -5392, -15049, 120 ), Angle( 0, 90, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:EnableCollisionCaller( false )
    eObj:SetOutputPos( 'Первый Спавн', Vector( -1946, -13936, -837 ), Angle( 0, -90, 0 ) )

end )

local header = 'Начальная Локация #2 >> Первый Спавн'
Add( header, CT, Vector( -6154, -14426, 120 ), Angle( 0, -90, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:EnableCollisionCaller( false )
    eObj:SetOutputPos( 'Первый Спавн', Vector( -1946, -13936, -837 ), Angle( 0, -90, 0 ) )

end )

local header = 'Начальная Локация #3 >> Первый Спавн'
Add( header, CT, Vector( -5418, -7078, 120 ), Angle( 0, 90, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:EnableCollisionCaller( false )
    eObj:SetOutputPos( 'Первый Спавн', Vector( -1946, -13936, -837 ), Angle( 0, -90, 0 ) )

end )

local header = 'Начальная Локация #4 >> Первый Спавн'
Add( header, CT, Vector( -6140, -7072, 120 ), Angle( 0, -90, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:EnableCollisionCaller( false )
    eObj:SetOutputPos( 'Первый Спавн', Vector( -1946, -13936, -837 ), Angle( 0, -90, 0 ) )

end )

local header = 'Начальная Локация >> Шахта'
Add( header, CT, Vector( -5185, -9925, 116 ), Angle( 0, 90, -90 ), function( eObj ) 

    AMB.Quest.AddEntity( eObj, 2, 12 )

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:EnableCollisionCaller( false )
    eObj:SetOutputPos( 'Шахта', Vector( -4001, -9953, 185 ), Angle( 0, 0, 0 ) )

end )

local header = 'Начальная Локация >> Средняя Локация'
Add( header, CT, Vector( -6959, -5279, 116 ), Angle( 0, 180, -90 ), function( eObj ) 

    AMB.Quest.AddEntity( eObj, 2, 17 )

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:SetOutputPos( 'Тоннель в Средней Локаций', Vector( 1210, -2726, 570 ), Angle( 0, 90, 0 ) )

end )

local header = 'Начальная Локация >> Бункер'
Add( header, CT, Vector( -14941, -8408, 120 ), Angle( 0, -90, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:SetOutputPoses( bunker )

end )

-- ## Шахта #####################################################################

local header = 'Шахта #1 >> Начальная Локация'
Add( header, CT, Vector( -4478, -9936, 124 ), Angle( 0, -90, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 5 )
    eObj:EnableCollisionCaller( true )
    eObj:SetOutputPos( 'Начальная Зона', Vector( -5580, -9921, 183 ), Angle( 0, 180, 0 ) )

end )

local header = 'Шахта #2 >> Начальная Локация (Дорога)'
Add( header, CT, Vector( -4478, -9819, 124 ), Angle( 0, -90, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 6 )
    eObj:EnableCollisionCaller( true )
    eObj:SetOutputPoses( road_start_location )

end )

-- ## Средняя Локация #####################################################################

local header = 'Средняя Локация >> Начальная Локация'
Add( header, CT, Vector( 1214, -4777, 524 ), Angle( 0, 0, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:SetOutputPos( 'Начальная Зона', Vector( -6964, -5514, 169 ), Angle( 0, -90, 0 ) )

end )

-- ## Бункер #####################################################################

local header = 'Бункер >> Начальная Локация'
Add( header, CT, Vector( -8355, -2634, -648 ), Angle( 0, 180, -90 ), function( eObj ) 

    eObj:SetHeader( header )
    eObj:SetDelay( 15 )
    eObj:SetOutputPos( 'Бункер', Vector( -14787, -8402, 181 ), Angle( 0, 0, 0 ) )

end )