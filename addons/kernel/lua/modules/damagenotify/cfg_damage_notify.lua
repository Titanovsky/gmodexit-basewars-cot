AMB.DamageNotify = AMB.DamageNotify or {}
AMB.DamageNotify.Config = AMB.DamageNotify.Config or {}

--[[
Types:
    0 - simple count hit ( 10, 43, 90, 20 )
    1 - count hit + new count hint ( 10 + 10, 20 + 10, 30 + 40)
    2 - count hit every time on different place on screen ( 10 on top, 43 on right, 90 on left, 20 on bottom )
]]--
AMB.DamageNotify.Config.type = 0
AMB.DamageNotify.Config.font = '25 Ambition'
AMB.DamageNotify.Config.net_send_client = 'amb_damage_notify_send_client'

AMB.DamageNotify.Config.exceptions = {

    [ 'bw_teleport' ] = true,
    [ 'bw_pickup' ] = true,
    [ 'arccw_thr_gas' ] = true,
    [ 'arccw_thr_claymore' ] = true,
    [ 'arccw_thr_frag' ] = true,
    [ 'arccw_thr_impact' ] = true,
    [ 'arccw_thr_flare' ] = true,
    [ 'arccw_thr_semtex' ] = true,

}