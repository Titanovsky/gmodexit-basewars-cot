AMB.ArcCW = AMB.ArcCW or {}
AMB.ArcCW.Config = AMB.ArcCW.Config or {}
AMB.ArcCW.Config.Weapons = AMB.ArcCW.Config.Weapons or {}

ArcCW = ArcCW or {}

include( 'arccw/shared/sh_acwcommon.lua' )
AddCSLuaFile( 'arccw/shared/sh_acwcommon.lua' )

function AMB.ArcCW.AddWeapon( sClass, tWeapon )

    weapons.Register( tWeapon, sClass )

    AMB.ArcCW.Config.Weapons[ sClass ] = tWeapon

    return true

end