AMB.Restrict = AMB.Restrict or {}
AMB.Restrict.Config = AMB.Restrict.Config or {}

AMB.Restrict.Config.voice_max_distance = 9999999

AMB.Restrict.Config.can_suicide = true
AMB.Restrict.Config.can_reload_physgun = false

AMB.Restrict.Config.types = {

    props       = { available = true, limit = 4096 },
    sents       = { available = false, limit = 4096 },
    npcs        = { available = false, limit = 4096 },
    weapons     = { available = false },
    properties  = { available = false }, -- Временно
    tools       = { available = true },
    vehicles    = { available = false },
    effects     = { available = false },
    ragdolls    = { available = false }

}

AMB.Restrict.Config.props = AMB.Restrict.Config.props or { }
AMB.Restrict.Config.ragdolls = AMB.Restrict.Config.ragdolls or {}
AMB.Restrict.Config.sents = AMB.Restrict.Config.sents or {}
AMB.Restrict.Config.npcs = AMB.Restrict.Config.npcs or {}
AMB.Restrict.Config.vehicles = AMB.Restrict.Config.vehicles or {}
AMB.Restrict.Config.effects = AMB.Restrict.Config.effects or {}
AMB.Restrict.Config.weapons = AMB.Restrict.Config.weapons or {}
AMB.Restrict.Config.properties = AMB.Restrict.Config.properties or {}
AMB.Restrict.Config.tools = AMB.Restrict.Config.tools or {}