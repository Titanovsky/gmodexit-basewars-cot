local Lang = AMB.Language.AddBetweenRusAndEng

local category = Lang( '#arccw_category_other', '[ArcCW] Специальное', '[ArcCW] Special' )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = true

    SWEP.PrintName = "M72 LAW"
    SWEP.Trivia_Class = "Rocket Launcher"
    SWEP.Trivia_Desc = "A single-shot lightweight disposable rocket launcher. Only one shot can be carried.\n\n\"I fought the LAW and the LAW won.\""
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "66mm"
    SWEP.Trivia_Mechanism = "Point-Initiated Base-Detonated"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1963

    SWEP.Slot = 4

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_m72law.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_rpg7.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.ShootEntity = "arccw_m72law_heat" -- entity to fire, if any
    SWEP.MuzzleVelocity = 100000 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.Singleton = true

    SWEP.ChamberSize = 0 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 1 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 1
    SWEP.ReducedClipSize = 1

    SWEP.Recoil = 2
    SWEP.RecoilSide = 0.175
    SWEP.RecoilRise = 2

    SWEP.Delay = 60 / 600 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_rpg"
    SWEP.NPCWeight = 250

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 500

    SWEP.Primary.Ammo = "RPG_Round" -- what ammo type the gun uses
    SWEP.MagID = "rpg7" -- the magazine pool this gun draws from

    SWEP.ShootVol = 130 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/rpg7/rpg7_fp.wav"
    SWEP.DistantShootSound = "weapons/arccw/rpg7/rpg7_dist.wav"

    SWEP.MuzzleEffect = "muzzleflash_m79"

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

    SWEP.SightTime = 0.35

    SWEP.SpeedMult = 0.875
    SWEP.SightedSpeedMult = 0.75

    SWEP.BarrelLength = 24

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-4, 2, -2.25),
        Ang = Angle(0, 0, -35),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
        CrosshairInSights = true
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

    SWEP.ActivePos = Vector(0, 2, -3)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(-1, 0, -2)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AutoReload = true
    SWEP.Disposable = true

    SWEP.Attachments = {
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "ValveBiped.weapon_bone",
            Offset = {
                vpos = Vector(1.35, -1, 0), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 90),
                wpos = Vector(11, 1.25, -4.5),
                wang = Angle(0, -4.211, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1,
        },
        ["idle_empty"] = {
            Source = "idle",
            Time = 1,
        },
        ["draw_empty"] = {
            Source = "draw",
            Time = 1.5,
        },
        ["draw"] = {
            Source = "draw",
            Time = 1.5,
        },
        ["fire"] = {
            Source = "fire",
            Time = 0.75,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {20, 26, 40},
            FrameRate = 30,
            LHIK = false,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_m72law', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_melee"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Fists'
    SWEP.Trivia_Class = "Melee Weapon"
    SWEP.Trivia_Desc = "Listen up son, 'cause I'm only gonna tell you this one time. A boy thinks his guns are all he needs to get out of a scrap. And maybe that's true. But you won't always have your gun. Guns get lost. Guns get stolen. Guns run out of ammo, they fail, they break. But if you can hold your own with just your two bare fists, boy, there ain't nothing the world can do to stop you."
    SWEP.Trivia_Manufacturer = "Your Mother"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Applied Pugilism"
    SWEP.Trivia_Country = "Earth"
    SWEP.Trivia_Year = "6 Million BC"

    SWEP.Slot = 0

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/c_arms.mdl"
    SWEP.WorldModel = ""
    SWEP.ViewModelFOV = 60

    SWEP.PrimaryBash = true
    SWEP.CanBash = true

    SWEP.MeleeDamage = 15
    SWEP.MeleeRange = 26
    SWEP.MeleeDamageType = DMG_CLUB

    SWEP.Melee2 = true
    SWEP.Melee2Damage = 15
    SWEP.Melee2Range = 26

    SWEP.MeleeSwingSound = "weapons/arccw/knife/knife_slash2.wav"
    SWEP.MeleeHitSound = "physics/body/body_medium_impact_hard1.wav"
    SWEP.MeleeHitNPCSound = "physics/body/body_medium_impact_hard5.wav"

    SWEP.NotForNPCs = true

    SWEP.Firemodes = {
        {
            Mode = 1,
            PrintName = "MELEE"
        },
    }

    SWEP.MeleeTime = 0.5
    SWEP.Melee2Time = 0.5

    SWEP.MeleeGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST

    SWEP.HoldtypeActive = "fist"
    SWEP.HoldtypeHolstered = "normal"

    SWEP.Primary.ClipSize = -1

    -- 0	=	reference
    -- 1	=	seq_admire
    -- 2	=	fists_draw
    -- 3	=	fists_right
    -- 4	=	fists_left
    -- 5	=	fists_uppercut
    -- 6	=	fists_holster
    -- 7	=	fists_idle_01
    -- 8	=	fists_idle_02


    SWEP.Animations = {
        ["idle"] = {
            Source = {"fists_idle_02", "fists_idle_01"},
            Time = 5
        },
        ["draw"] = {
            Source = "fists_draw",
            Time = 0.5,
        },
        ["ready"] = {
            Source = "fists_draw",
            Time = 1,
        },
        ["holster"] = {
            Source = "fists_holster",
            Time = 0.5,
        },
        ["bash"] = {
            Source = {"fists_left"},
            Time = 0.75,
        },
        ["bash2"] = {
            Source = {"fists_right", "fists_uppercut"},
            Time = 0.75,
        }
    }

    SWEP.IronSightStruct = false

    SWEP.CustomizePos = Vector(0, -5, -10)
    SWEP.CustomizeAng = Angle(30, 0, 0)

    SWEP.ActivePos = Vector(0, -5, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.BashPreparePos = Vector(0, 0, 0)
    SWEP.BashPrepareAng = Angle(0, 5, 0)

    SWEP.BashPos = Vector(0, 0, 0)
    SWEP.BashAng = Angle(10, -10, 0)

    SWEP.HolsterPos = Vector(0, -1, 2)
    SWEP.HolsterAng = Angle(-15, 0, 0)

AMB.ArcCW.AddWeapon( 'arccw_melee_fists', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_melee"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Knife'
    SWEP.Trivia_Class = "Melee Weapon"
    SWEP.Trivia_Desc = "Sharp metal blade for stabbing and slashing."
    SWEP.Trivia_Manufacturer = "Cold Steel"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Sharp Edge"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 2006

    SWEP.Slot = 0

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
    SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.PrimaryBash = true
    SWEP.CanBash = true
    SWEP.MeleeDamage = 50
    SWEP.MeleeRange = 32
    SWEP.MeleeDamageType = DMG_SLASH

    SWEP.MeleeSwingSound = "weapons/arccw/knife/knife_slash1.wav"
    SWEP.MeleeHitSound = "weapons/arccw/knife/knife_hitwall3.wav"
    SWEP.MeleeHitNPCSound = "weapons/arccw/knife/knife_hit2.wav"

    SWEP.MeleeGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE

    SWEP.NotForNPCs = true

    SWEP.Firemodes = {
        {
            Mode = 1,
            PrintName = "MELEE"
        },
    }

    SWEP.MeleeTime = 0.5

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "knife"

    SWEP.Primary.ClipSize = -1

    SWEP.Animations = {
        ["draw"] = {
            Source = "draw",
            Time = 0.5,
            SoundTable = {{s = "weapons/arccw/knife/knife_deploy.wav", t = 0}}
        },
        ["ready"] = {
            Source = "draw",
            Time = 0.5,
        },
        ["bash"] = {
            Source = {"stab", "midslash1", "midslash2", "stab_miss"},
            Time = 0.75,
        },
    }

    SWEP.IronSightStruct = false

    SWEP.BashPreparePos = Vector(0, 0, 0)
    SWEP.BashPrepareAng = Angle(0, 5, 0)

    SWEP.BashPos = Vector(0, 0, 0)
    SWEP.BashAng = Angle(10, -10, 0)

    SWEP.HolsterPos = Vector(0, -1, 2)
    SWEP.HolsterAng = Angle(-15, 0, 0)

AMB.ArcCW.AddWeapon( 'arccw_melee_knife', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Claymore"
    SWEP.Trivia_Class = "Land Mine"
    SWEP.Trivia_Desc = "Directional explosive mine with automatic proximity motion sensor fuse. Upon detonation, explosive fragments decimate any target on the receiving end. That includes you, so be careful! Blast is phenomenally devasting, but be warned - a mine will kill regardless of if you planted it or not. Mines are most effective on level ground with a clear blast field. Mines detonate automatically after 120 seconds."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Electronic Fuse"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1981

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_nade_claymore.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_nade_claymore.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Primary.Ammo = "slam"

    SWEP.FuseTime = false

    SWEP.Throwing = true

    SWEP.Primary.ClipSize = 1

    SWEP.MuzzleVelocity = 25
    SWEP.ShootEntity = "arccw_thr_claymore"

    SWEP.HoldtypeActive = "slam"

    SWEP.PullPinTime = 0.5

    SWEP.CustomizePos = Vector(9.824, 0, -4.897)
    SWEP.CustomizeAng = Angle(36, 35, 0)

    SWEP.Animations = {
        ["draw"] = {
            Source = "deploy",
            Time = 0.5,
            SoundTable = {{s = "weapons/arccw/hegrenade/he_draw.wav", t = 0}}
        },
        ["ready"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["pre_throw"] = {
            Source = "pullpin",
            Time = 0.75,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_claymore', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Insertion Flare"
    SWEP.Trivia_Class = "Marker Flare"
    SWEP.Trivia_Desc = "Flare that marks a spot to tactically insert the user upon returning. Will be destroyed upon use. Multiple flares can be deployed at once. Flare trail is very conspicuous, so beware of enemies who may destroy it."
    SWEP.Trivia_Manufacturer = "Advanced Research Center"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Pyrotechnic delay fuze"
    SWEP.Trivia_Country = "Australia/USA/UK"
    SWEP.Trivia_Year = 1970

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_flare.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_flare.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Primary.Ammo = "none"

    SWEP.FuseTime = 3

    SWEP.Throwing = true
    SWEP.Singleton = true

    SWEP.Primary.ClipSize = 1

    SWEP.MuzzleVelocity = 200
    SWEP.ShootEntity = "arccw_thr_flare"

    SWEP.NPCWeaponType = "weapon_grenade"
    SWEP.NPCWeight = 0

    SWEP.ActivePos = Vector(0, 5, 1)

    SWEP.CustomizePos = Vector(6, 0, 3)
    SWEP.CustomizeAng = Angle(0, 45, 0)

    SWEP.Animations = {
        ["draw"] = {
            Source = "draw",
            Time = 1,
        },
        ["ready"] = {
            Source = "draw",
            Time = 1,
        },
        ["pre_throw"] = {
            Source = "cook",
            Time = 0.7,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_flare', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Flashbang"
    SWEP.Trivia_Class = "Hand Grenade"
    SWEP.Trivia_Desc = "Grenade designed to produce a loud bang accompanied with bright flash, disorienting targets."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Pyrotechnic delay fuze"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1979

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/cstrike/c_eq_flashbang.mdl"
    SWEP.WorldModel = "models/weapons/w_eq_flashbang.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.FuseTime = 2.5

    SWEP.Throwing = true

    SWEP.Primary.ClipSize = 1

    SWEP.TTTWeaponType = "weapon_ttt_confgrenade"
    SWEP.NPCWeaponType = "weapon_grenade"
    SWEP.NPCWeight = 100

    SWEP.MuzzleVelocity = 1100
    SWEP.ShootEntity = "arccw_thr_flash"

    SWEP.Animations = {
        ["draw"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["ready"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["pre_throw"] = {
            Source = {"pullpin", "pullpin2", "pullpin3", "pullpin4"},
            Time = 0.5,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_flash', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Frag Grenade"
    SWEP.Trivia_Class = "Hand Grenade"
    SWEP.Trivia_Desc = "High explosive fragmentation hand grenade. Can be cooked."
    SWEP.Trivia_Manufacturer = "Day & Zimmermann"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Pyrotechnic delay fuze"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1968

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_nade_frag.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_nade_frag.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.FuseTime = 3.5

    SWEP.Throwing = true

    SWEP.Primary.ClipSize = 1

    SWEP.MuzzleVelocity = 1000
    SWEP.ShootEntity = "arccw_thr_frag"

    SWEP.TTTWeaponType = "weapon_ttt_confgrenade"
    SWEP.NPCWeaponType = "weapon_grenade"
    SWEP.NPCWeight = 50

    SWEP.Animations = {
        ["draw"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["ready"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["pre_throw"] = {
            Source = {"pullpin", "pullpin2", "pullpin3", "pullpin4"},
            Time = 0.5,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_frag', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Gas Grenade"
    SWEP.Trivia_Class = "Hand Grenade"
    SWEP.Trivia_Desc = "Stick-based grenade which produces a large cloud of irritant gas. Used for riot control, though it can be fatal in large doses."
    SWEP.Trivia_Manufacturer = "Reichsbewaffnung"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "CS Gas"
    SWEP.Trivia_Country = "Germany"
    SWEP.Trivia_Year = 1940

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_nade_gas.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_nade_gas.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.FuseTime = 5

    SWEP.Throwing = true

    SWEP.Primary.ClipSize = 1

    SWEP.MuzzleVelocity = 1000
    SWEP.ShootEntity = "arccw_thr_gas"

    SWEP.TTTWeaponType = "weapon_ttt_smokegrenade"
    SWEP.NPCWeaponType = "weapon_grenade"
    SWEP.NPCWeight = 50

    SWEP.Animations = {
        ["draw"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["ready"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["pre_throw"] = {
            Source = "pullpin",
            Time = 0.5,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_gas', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Impact Grenade"
    SWEP.Trivia_Class = "Hand Grenade"
    SWEP.Trivia_Desc = "Fragmentation grenade that explodes on impact."
    SWEP.Trivia_Manufacturer = "Day & Zimmermann"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Impact fuze"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1941

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_nade_impact.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_nade_impact.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.FuseTime = false

    SWEP.Throwing = true

    SWEP.Primary.ClipSize = 1

    SWEP.MuzzleVelocity = 1250
    SWEP.ShootEntity = "arccw_thr_impact"

    SWEP.Animations = {
        ["draw"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["ready"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["pre_throw"] = {
            Source = {"pullpin", "pullpin2", "pullpin3", "pullpin4"},
            Time = 0.5,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_impact', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Thermite Grenade"
    SWEP.Trivia_Class = "Hand Grenade"
    SWEP.Trivia_Desc = "Grenade with thermite core. Thermite damages everything in a short radius and sets them on fire. Its long fuse and ease of avoidance make it a poor choice as an anti-personnel weapon, but it can be effective for area denial or anti-materiel use."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Thermite"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1944

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_nade_incendiary.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_nade_incendiary.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.FuseTime = 5

    SWEP.Throwing = true

    SWEP.Primary.ClipSize = 1

    SWEP.MuzzleVelocity = 1000
    SWEP.ShootEntity = "arccw_thr_thermite"

    SWEP.TTTWeaponType = "weapon_zm_molotov"
    SWEP.NPCWeaponType = "weapon_grenade"
    SWEP.NPCWeight = 100

    SWEP.KillIconAlias = "arccw_nade_flash"

    SWEP.Animations = {
        ["draw"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["ready"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["pre_throw"] = {
            Source = {"pullpin", "pullpin2", "pullpin3", "pullpin4"},
            Time = 0.5,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_incendiary', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Semtex"
    SWEP.Trivia_Class = "Hand Grenade"
    SWEP.Trivia_Desc = "Plastic explosive grenade coated in glue. Adheres to the first thing it touches. Fuse and glue are activated upon throwing."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Electronic Fuse"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1997

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_nade_semtex.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_nade_semtex.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.FuseTime = false

    SWEP.Throwing = true

    SWEP.Primary.ClipSize = 1

    SWEP.MuzzleVelocity = 1000
    SWEP.ShootEntity = "arccw_thr_semtex"

    SWEP.TTTWeaponType = "weapon_zm_molotov"
    SWEP.NPCWeaponType = "weapon_grenade"
    SWEP.NPCWeight = 50

    SWEP.Animations = {
        ["draw"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["ready"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["pre_throw"] = {
            Source = {"pullpin", "pullpin2", "pullpin3", "pullpin4"},
            Time = 0.5,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_semtex', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base_nade"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Smoke Grenade"
    SWEP.Trivia_Class = "Hand Grenade"
    SWEP.Trivia_Desc = "Grenade which produces a wide smokescreen for obscuring movement on the battlefield. Smoke comes out in a ring, allowing for a small area of visibility in the center."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "N/A"
    SWEP.Trivia_Mechanism = "Pyrotechnic delay fuze"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1942

    SWEP.Slot = 4

    SWEP.NotForNPCs = true

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/cstrike/c_eq_smokegrenade.mdl"
    SWEP.WorldModel = "models/weapons/w_eq_smokegrenade.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.FuseTime = 3.5

    SWEP.Throwing = true

    SWEP.Primary.ClipSize = 1

    SWEP.MuzzleVelocity = 1000
    SWEP.ShootEntity = "arccw_thr_smoke"

    SWEP.TTTWeaponType = "weapon_ttt_smokegrenade"
    SWEP.NPCWeaponType = "weapon_grenade"
    SWEP.NPCWeight = 50

    SWEP.KillIconAlias = "arccw_nade_flash"

    SWEP.Animations = {
        ["draw"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["ready"] = {
            Source = "deploy",
            Time = 0.5,
        },
        ["pre_throw"] = {
            Source = {"pullpin", "pullpin2", "pullpin3", "pullpin4"},
            Time = 0.5,
        },
        ["throw"] = {
            Source = "throw",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_nade_smoke', SWEP )
