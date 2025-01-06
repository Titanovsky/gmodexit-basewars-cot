local Add = AMB.AutoSpawn.Add

-- ## Quests Givers #####################################################################
Add( 'NPC Солдат в начальной зоне', 'quest_guider', Vector( -2055, -15307, -832 ), Angle( 0, 90, 0 ), function( eObj ) 

    AMB.Quest.AddEntity( eObj, 1, 6 )

end )