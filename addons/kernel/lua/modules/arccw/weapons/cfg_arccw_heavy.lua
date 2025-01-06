local Lang = AMB.Language.AddBetweenRusAndEng

local category = Lang( '#arccw_category_sniper_rifle', '[ArcCW] Тяжёлые Винтовки', '[ArcCW] Heavy Rifles' )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'AWM'
    SWEP.Trivia_Class = "Sniper Rifle"
    SWEP.Trivia_Desc = "A high-caliber sniper rifle designed for cold-weather police and military units. Heavy rounds pack an extreme punch and are designed for maximum precision."
    SWEP.Trivia_Manufacturer = "Nordland"
    SWEP.Trivia_Calibre = ".338 Lapua"
    SWEP.Trivia_Mechanism = "Bolt-Action"
    SWEP.Trivia_Country = "Norway"
    SWEP.Trivia_Year = 1995

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_hs338.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_hs338.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 95
    SWEP.DamageMin = 150 -- damage done at maximum range
    SWEP.Range = 50 -- in METRES
    SWEP.Penetration = 35
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 4000 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 8 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 12
    SWEP.ReducedClipSize = 4

    SWEP.Recoil = 4
    SWEP.RecoilSide = 2

    SWEP.Delay = 60 / 600 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            PrintName = "BOLT",
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_ar2", "weapon_crossbow"}
    SWEP.NPCWeight = 25

    SWEP.ManualAction = true

    SWEP.AccuracyMOA = 0.05 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 800 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "SniperPenetratedRound" -- what ammo type the gun uses
    SWEP.MagID = "hs338" -- the magazine pool this gun draws from

    SWEP.ShootVol = 140 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/awp/awp_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/awp/awp1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_6"
    SWEP.ShellModel = "models/shells/shell_338mag.mdl"
    SWEP.ShellPitch = 80
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.35
    SWEP.SpeedMult = 0.85
    SWEP.SightedSpeedMult = 0.25

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = true

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-7.441, -9.837, 2.99),
        Ang = Angle(0.792, 0.017, 0),
        Magnification = 1.1,
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG

    SWEP.ActivePos = Vector(-2, 0, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 50
    SWEP.AttachmentElements = {
        ["nors"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {},
        },
        ["extendedmag"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 2, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["nobrake"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
            WMBodygroups = {},
        },
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_sniper", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.awm_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.035, -5.286, -5.5),
                vang = Angle(-90, 0, -90),
                wpos = Vector(8, 0.899, -6.401),
                wang = Angle(-10.52, 0, 180)
            },
            InstalledEles = {"nors"},
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(0, 0, 0)
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.awm_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.035, -4, -10),
                vang = Angle(-90, 0, -90),
                wpos = Vector(8, 0.899, -6.401),
                wang = Angle(-10.52, 0, 180)
            },
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(0, 0, 0),
            KeepBaseIrons = true,
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.awm_Parent",
            Offset = {
                vpos = Vector(-0.3, -4.5, -27), -- offset that the attachment will be relative to the bone
                vang = Angle(-91, 0, -90),
                wpos = Vector(38.799, 0.899, -10.9),
                wang = Angle(-10, 0, 180)
            },
            InstalledEles = {"nobrake"},
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "bipod"},
            Bone = "v_weapon.awm_Parent",
            Offset = {
                vang = Angle(-91, 0, -90),
                wang = Angle(-11, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(-0.3, -2.5, -10.5),
                vmax = Vector(-0.3, -2.5, -18.5),
                wmin = Vector(20, 0.899, -5.401),
                wmax = Vector(20, 0.899, -5.401),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.awm_Parent",
            Offset = {
                vpos = Vector(0.5, -3.25, -15), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, -0.45, 180),
                wpos = Vector(19.625, 0.053, -6.298),
                wang = Angle(-8.829, -0.556, 90)
            },
        },
        {
            PrintName = "Grip",
            Slot = "grip",
            DefaultAttName = "Standard Grip"
        },
        {
            PrintName = "Stock",
            Slot = "stock",
            DefaultAttName = "Standard Stock"
        },
        {
            PrintName = "Ammo Type",
            Slot = "ammo_bullet"
        },
        {
            PrintName = "Perk",
            Slot = "perk"
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.awm_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.75, -3, -5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(8, 1.75, -3.5),
                wang = Angle(-10.393, 0, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1
        },
        ["draw"] = {
            Source = "draw",
            Time = 1,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "ready",
            Time = 2,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = "shoot",
            Time = 1,
        },
        ["cycle"] = {
            Source = "cycle",
            Time = 1.25,
            ShellEjectAt = 0.75,
            LHIK = true,
            LHIKIn = 0.15,
            LHIKOut = 0.15,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 33, 51, 58, 62, 74, 80},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 3.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 33, 51},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_awm', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'M60'
    SWEP.Trivia_Class = "Machine Gun"
    SWEP.Trivia_Desc = "General purpose machine gun firing full length cartridges. Nicknamed \"The Pig\" for its bulky shape, it is nevertheless a capable beast, and a favorite among action heroes."
    SWEP.Trivia_Manufacturer = 'SACO Defense'
    SWEP.Trivia_Calibre = "7.62x51mm NATO"
    SWEP.Trivia_Mechanism = "Gas-Actuated Open Bolt"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1957

    SWEP.Slot = 2

    SWEP.UseHands = true
    SWEP.ViewModel = "models/weapons/arccw/c_m60.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_m60.mdl"
    SWEP.ViewModelFOV = 60
    SWEP.DefaultBodygroups = "0000000"

    SWEP.Damage = 50
    SWEP.DamageMin = 29 -- damage done at maximum range
    SWEP.Range = 250 -- in METRES
    SWEP.Penetration = 22
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1800 -- projectile or phys bullet muzzle velocity
    -- IN M/S


    SWEP.ChamberSize = 0 -- how many rounds can be chambered.

    SWEP.Primary.ClipSize = 80 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 110
    SWEP.ReducedClipSize = 35

    SWEP.Recoil = 0.75
    SWEP.RecoilSide = 0.3
    SWEP.RecoilRise = 0.8
    SWEP.Delay = 60 / 600 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.

    SWEP.Firemodes = {
        {
            Mode = 2
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_ar2", "weapon_shotgun"}
    SWEP.NPCWeight = 50

    SWEP.AccuracyMOA = 12 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
    SWEP.MagID = "m60" -- the magazine pool this gun draws from
    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 90 -- pitch of shoot sound
    SWEP.ShootSound = "weapons/arccw/negev/negev_03.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/negev/negev-1-distant.wav" --weapons/arccw/m249/m249-1-distant.wav

    SWEP.MuzzleEffect = "muzzleflash_minimi"

    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 90
    SWEP.ShellScale = 2.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
    SWEP.SpeedMult = 0.6
    SWEP.SightedSpeedMult = 0.5
    SWEP.SightTime = 0.55

    -- the bone that represents bullets in gun/mag
    SWEP.BulletBones = {
        [1] = "Magazine.Bullets.1",
        [2] = "Magazine.Bullets.2",
        [3] = "Magazine.Bullets.3",
        [4] = "Magazine.Bullets.4",
        [5] = "Magazine.Bullets.5",
        [6] = "Magazine.Bullets"
    }

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-8.771, -4, 4.75),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "" -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(0, 2, 1)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.CustomizePos = Vector(12, -3, -4)
    SWEP.CustomizeAng = Angle(15, 40, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 34

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["nors"] = {
            VMBodygroups = {
                {ind = 2, bg = 1},
                {ind = 3, bg = 1},
            },
        },
        ["nobrake"] = {
            VMBodygroups = {
                {ind = 6, bg = 1},
            },
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_rail.mdl",
                    Bone = "M60.Cover",
                    Scale = Vector(1, 1, 1),
                    Offset = {
                        pos = Vector(0, 4, 0.65),
                        ang = Angle(0, 90, 0)
                    }
                }
            },
        }
    }
    SWEP.Hook_SelectReloadAnimation = function(wep, anim)
        if wep:GetCapacity() == wep.ReducedClipSize then return anim .. "_small" end
    end

    SWEP.ShellRotateAngle = Angle(0, -90, 0)

    SWEP.ExtraSightDist = 8

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "M60.Cover", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, 4, 0.8), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 90, 0),
                wpos = Vector(3.5, 2, -7.101),
                wang = Angle(-9.738, 0, 180)
            },
            InstalledEles = {"nors", "mount"},
            CorrectiveAng = Angle(0, 180, 0)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "M60.Body",
            Offset = {
                vpos = Vector(0, -21, 1.9),
                vang = Angle(0, 90, 0),
                wpos = Vector(33.5, 1.5, -8.3),
                wang = Angle(-6, 0, 180)
            },
            InstalledEles = {"nobrake"},
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "M60.Body",
            Offset = {
                vpos = Vector(0, 0, -1),
                vang = Angle(0, 90, 0),
                wpos = Vector(14.329, 1.5, -3.453),
                wang = Angle(-6, 0, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "M60.Body",
            Offset = {
                vpos = Vector(-1, -5, 1), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 90, 90),
                wpos = Vector(12, 0.5, -5),
                wang = Angle(-6, 0, 90)
            },
        },
        {
            PrintName = "Grip",
            Slot = "grip",
            DefaultAttName = "Standard Grip"
        },
        {
            PrintName = "Stock",
            Slot = "stock",
            DefaultAttName = "Standard Stock"
        },
        {
            PrintName = "Fire Group",
            Slot = "fcg",
            DefaultAttName = "Standard FCG"
        },
        {
            PrintName = "Ammo Type",
            Slot = "ammo_bullet"
        },
        {
            PrintName = "Perk",
            Slot = "perk"
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "M60.Body", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-1.25, 2, 1),
                vang = Angle(0, 90, 0),
                wpos = Vector(11, 2.4, -3.75),
                wang = Angle(-6, 0, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1
        },
        ["draw"] = {
            Source = "draw",
            SoundTable = {
                {
                    s = "weapons/arccw/m249/m249_draw.wav",
                    t = 0
                }
            },
            Time = 1.5
        },
        ["ready"] = {
            Source = "deploy",
            Time = 2.5
        },
        ["fire"] = {
            Source = {"fire1"},
            Time = 1,
            ShellEjectAt = 0
        },
        ["fire_iron"] = {
            Source = "fire_iron",
            Time = 1,
            ShellEjectAt = 0
        },
        ["reload"] = {
            Source = "reload",
            Time = 7,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {20, 60, 80, 145, 170},
            FrameRate = 30,
            LastClip1OutTime = 3,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 6,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {23, 51, 79, 106, 134},
            FrameRate = 30,
            LastClip1OutTime = 2,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5
        },
        ["reload_small"] = {
            Source = "reload_small",
            Time = 7,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {20, 60, 80, 145, 170},
            FrameRate = 30,
            LastClip1OutTime = 3,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5
        },
        ["reload_empty_small"] = {
            Source = "reload_empty_small",
            Time = 6,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {23, 51, 79, 106, 134},
            FrameRate = 30,
            LastClip1OutTime = 2,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5
        }
    }

    sound.Add({
        name = "Weapon_M60.Single",
        channel = CHAN_USER_BASE + 10,
        volume = 1.0,
        sound = "weapons/arccw/m60/m60-1.wav"
    })

    sound.Add({
        name = "Weapon_M60.Coverup",
        channel = CHAN_ITEM,
        volume = 1.0,
        sound = "weapons/arccw/m60/m60_coverup.mp3"
    })

    sound.Add({
        name = "Weapon_M60.Boxout",
        channel = CHAN_ITEM,
        volume = 1.0,
        sound = "weapons/arccw/m60/m60_boxout.mp3"
    })

    sound.Add({
        name = "Weapon_M60.Boxin",
        channel = CHAN_ITEM,
        volume = 1.0,
        sound = "weapons/arccw/m60/m60_boxin.mp3"
    })

    sound.Add({
        name = "Weapon_M60.Chain",
        channel = CHAN_ITEM,
        volume = 1.0,
        sound = "weapons/arccw/m60/m60_chain.mp3"
    })

    sound.Add({
        name = "Weapon_M60.Coverdown",
        channel = CHAN_ITEM,
        volume = 1.0,
        sound = "weapons/arccw/m60/m60_coverdown.mp3"
    })

    sound.Add({
        name = "Weapon_M60.Bolt",
        channel = CHAN_ITEM,
        volumel = 1.0,
        pitch = 90,
        sound = "weapons/arccw/m249/m249_pump.wav"
    })

    SWEP.Primary = {}

AMB.ArcCW.AddWeapon( 'arccw_m60', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'M107'
    SWEP.Trivia_Class = "Antimateriel Rifle"
    SWEP.Trivia_Desc = "High caliber semi automatic rifle designed to take out light armored vehicles and military equipment. BFG stands for 'Big Fifty Gun'. Deals great damage at all ranges. Extremely heavy and cumbersome."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = ".50 BMG"
    SWEP.Trivia_Mechanism = "Recoil-Operated"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1989

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_bfg.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_bfg.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 200
    SWEP.DamageMin = 90 -- damage done at maximum range
    SWEP.Range = 500 -- in METRES
    SWEP.Penetration = 50
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 6000 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 5 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 10
    SWEP.ReducedClipSize = 3

    SWEP.Recoil = 5
    SWEP.RecoilSide = 2
    SWEP.MaxRecoilBlowback = 1

    SWEP.Delay = 60 / 120 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_ar2", "weapon_crossbow"}
    SWEP.NPCWeight = 10

    SWEP.AccuracyMOA = 2 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 1000 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "SniperPenetratedRound" -- what ammo type the gun uses
    SWEP.MagID = "bfg" -- the magazine pool this gun draws from

    SWEP.ShootVol = 145 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/bfg/bfg_fire.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/bfg/bfg_fire_distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_5"
    SWEP.ShellModel = "models/shells/shell_338mag.mdl"
    SWEP.ShellPitch = 60
    SWEP.ShellScale = 2

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.65
    SWEP.SpeedMult = 0.75
    SWEP.SightedSpeedMult = 0.25

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = true

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-2.449, 0, -0.57),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG

    SWEP.ActivePos = Vector(2, 3, -1)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(6, 3, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 70
    SWEP.AttachmentElements = {
        ["nors"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {},
        },
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        }
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_sniper", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "Weapon_Main", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.035, -6.5, 7.5), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(9.36, 0.539, -7.801),
                wang = Angle(-9.738, 0, 180)
            },
            InstalledEles = {"nors"},
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(0, 0, 0)
        },
        {
            PrintName = "Barrel",
            DefaultAttName = "Standard Barrel",
            Slot = "barrel",
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "bipod"},
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0, -3, 20),
                vang = Angle(90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(-0.25, -4, 18),
                vang = Angle(90, 0, 180),
                wpos = Vector(25.625, -0.253, -8.298),
                wang = Angle(-8.829, -0.556, 90)
            },
        },
        {
            PrintName = "Grip",
            Slot = "grip",
            DefaultAttName = "Standard Grip"
        },
        {
            PrintName = "Stock",
            Slot = "stock",
            DefaultAttName = "Standard Stock"
        },
        {
            PrintName = "Fire Group",
            Slot = "fcg",
            DefaultAttName = "Standard FCG"
        },
        {
            PrintName = "Ammo Type",
            Slot = "ammo_bullet"
        },
        {
            PrintName = "Perk",
            Slot = "perk"
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "Weapon_Main", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.75, -2, 9), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(11, 1.5, -3),
                wang = Angle(-10, 0, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1
        },
        ["draw"] = {
            Source = "draw",
            Time = 2,
            SoundTable = {{s = "weapons/arccw/g3sg1/g3sg1_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "ready",
            Time = 2.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = "fire",
            Time = 1,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "fire_iron",
            Time = 1,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {52, 90, 127},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 1,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 7,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {52, 90, 127, 152},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 1,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_m107', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = true
    SWEP.PrintName = "Minigun"
    SWEP.Trivia_Class = "Rotary Machine Gun"
    SWEP.Trivia_Desc = "A heavy machine gun capable of firing at an extremely fast fire rate due to its electric fire control system. The ultimate weapon. Carrying it will reduce your movement speed to a halt, and you can forget about sprinting with it. In return, up to 2400 RPM of 7.62 Real Fuckin' NATO is in your hands, if you can control them. Wield it with care."
    SWEP.Trivia_Manufacturer = 'General Electric'
    SWEP.Trivia_Calibre = "7.62x51mm NATO"
    SWEP.Trivia_Mechanism = "Electronic Trigger"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1957

    SWEP.Slot = 2

    SWEP.UseHands = true
    SWEP.ViewModel = "models/weapons/arccw/c_minigun.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_minigun.mdl"
    SWEP.ViewModelFOV = 60
    SWEP.DefaultBodygroups = "0000000"

    SWEP.Damage = 65
    SWEP.DamageMin = 29 -- damage done at maximum range
    SWEP.Range = 250 -- in METRES
    SWEP.Penetration = 22
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1800 -- projectile or phys bullet muzzle velocity
    -- IN M/S


    SWEP.ChamberSize = 0 -- how many rounds can be chambered.

    SWEP.Primary.ClipSize = 350 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 600
    SWEP.ReducedClipSize = 100

    SWEP.Recoil = 0.75
    SWEP.RecoilSide = 0.75
    SWEP.Delay = 60 / 2400 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.

    SWEP.BobMult = 2

    SWEP.Firemodes = {
        {
            Mode = 2,
            PrintName = "2400RPM"
        },
        {
            Mode = 2,
            Mult_RPM = 1200 / 2400,
            PrintName = "1200RPM"
        },
        {
            Mode = 2,
            Mult_RPM = 600 / 2400,
            PrintName = "600RPM"
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_ar2", "weapon_shotgun"}
    SWEP.NPCWeight = 1

    SWEP.AccuracyMOA = 50 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 300 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 100

    SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
    SWEP.MagID = "minigun" -- the magazine pool this gun draws from
    SWEP.ShootVol = 130 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound
    SWEP.ShootSound = "weapons/arccw/minigun/minigun.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/negev/negev-1-distant.wav" --weapons/arccw/m249/m249-1-distant.wav

    SWEP.MuzzleEffect = "muzzleflash_minimi"

    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 90
    SWEP.ShellScale = 2.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
    SWEP.SpeedMult = 0.5
    SWEP.SightedSpeedMult = 0.8
    SWEP.SightTime = 1

    SWEP.IronSightStruct = {
        Pos = Vector(0, -5, -2),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        CrosshairInSights = true
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "crossbow"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

    SWEP.ActivePos = Vector(0, 0, -4)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.CustomizePos = Vector(12, -3, -4)
    SWEP.CustomizeAng = Angle(15, 40, 0)

    SWEP.HolsterPos = Vector(3, -6, -16)
    SWEP.HolsterAng = Angle(40, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(5, 0, -10)
    SWEP.BarrelOffsetHip = Vector(4, 0, -6)

    SWEP.BarrelLength = 34

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["nors"] = {
            VMBodygroups = {
                {ind = 2, bg = 1},
                {ind = 3, bg = 1},
            },
        },
        ["nobrake"] = {
            VMBodygroups = {
                {ind = 6, bg = 1},
            },
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_rail.mdl",
                    Bone = "M60.Cover",
                    Scale = Vector(1, 1, 1),
                    Offset = {
                        pos = Vector(0, 4, 0.65),
                        ang = Angle(0, 90, 0)
                    }
                }
            },
        }
    }

    SWEP.ShellRotateAngle = Angle(0, -90, 0)

    SWEP.ExtraSightDist = 8

    SWEP.Attachments = {
        {
            PrintName = "Ammo Type",
            Slot = "ammo_bullet"
        },
        {
            PrintName = "Perk",
            Slot = "perk"
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1
        },
        ["draw"] = {
            Source = "draw",
            SoundTable = {
                {
                    s = "weapons/arccw/m249/m249_draw.wav",
                    t = 0
                }
            },
            Time = 1.5
        },
        ["fire"] = {
            Source = {"fire_1", "fire_2", "fire_3"},
            Time = 0.2,
            ShellEjectAt = 0
        },
        ["reload"] = {
            Source = "reload",
            Time = 4,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {20, 60, 80, 145, 170},
            FrameRate = 30,
            LastClip1OutTime = 3,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5
        },
    }

    sound.Add({
        name = "Weapon_M60.Boxout",
        channel = CHAN_ITEM,
        volume = 1.0,
        sound = "weapons/arccw/m60/m60_boxout.mp3"
    })

    sound.Add({
        name = "Weapon_M60.Boxin",
        channel = CHAN_ITEM,
        volume = 1.0,
        sound = "weapons/arccw/m60/m60_boxin.mp3"
    })

AMB.ArcCW.AddWeapon( 'arccw_minigun', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Minimi Para"
    SWEP.Trivia_Class = "Machine Gun"
    SWEP.Trivia_Desc = "Air-cooled, belt-fed fully automatic squad assault weapon. Capable of laying down sustained suppressive fire. Depleting a belt fully negates the need to remove it before inserting a new one, meaning that reloading when the weapon is totally empty is actually faster."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "5.56x45mm NATO"
    SWEP.Trivia_Mechanism = "Gas-Actuated Open Bolt"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1984

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_m2000g.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_m2000g.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "00000000"
    SWEP.DefaultWMBodygroups = "00000000"

    SWEP.Damage = 36
    SWEP.DamageMin = 23 -- damage done at maximum range
    SWEP.Range = 145 -- in METRES
    SWEP.Penetration = 7
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 900 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 0 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 100 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 150
    SWEP.ReducedClipSize = 40

    SWEP.Recoil = 0.3
    SWEP.RecoilSide = 0.15
    SWEP.RecoilRise = 0.75

    SWEP.Delay = 60 / 700 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_ar2", "weapon_shotgun"}
    SWEP.NPCWeight = 25

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "m200b" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 95 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/negev/negev-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/negev/negev-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_minimi"
    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 95
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.65
    SWEP.SightedSpeedMult = 0.5
    SWEP.SightTime = 0.5

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        [10] = "v_weapon.bullet1",
        [9] = "v_weapon.bullet2",
        [8] = "v_weapon.bullet3",
        [7] = "v_weapon.bullet4",
        [6] = "v_weapon.bullet5",
        [5] = "v_weapon.bullet6",
        [4] = "v_weapon.bullet7",
        [3] = "v_weapon.bullet8",
        [2] = "v_weapon.bullet9",
        [1] = "v_weapon.bullet10",
    }

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-5.942, -4.693, 2.341),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(-2, 0, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 27

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["reducedmag"] = {
            VMBodygroups = {
                {ind = 1, bg = 2},
                {ind = 3, bg = 1},
                {ind = 4, bg = 1}
            },
            WMBodygroups = {
                {ind = 1, bg = 2},
                {ind = 2, bg = 1},
            },
        },
        ["nors"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {{ind = 3, bg = 2},},
        }
    }

    SWEP.Hook_SelectReloadAnimation = function(wep, anim)
        if wep:GetCapacity() != wep.ReducedClipSize then return end

        if anim == "reload" then
            return "reload_para"
        elseif anim == "reload_empty" then
            return "reload_para_empty"
        end
    end

    SWEP.ExtraSightDist = 2

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.receiver", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-7.421, 0.07, -0.223), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 0, -177.76),
                wpos = Vector(5.36, 0.9, -7.4),
                wang = Angle(-9.738, -1, 180)
            },
            InstalledEles = {"nors"},
            CorrectiveAng = Angle(0, 0, 0)
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.m249", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.115, -2.5, 16),
                vang = Angle(90, 0, -90),
                wpos = Vector(29, 0.825, -10.6),
                wang = Angle(-9.738, -1, 180)
            },
            KeepBaseIrons = true,
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.m249",
            Offset = {
                vpos = Vector(0.115, -1.346, 29.485),
                vang = Angle(90, 0, -90),
                wpos = Vector(29, 0.825, -10.6),
                wang = Angle(-9.738, -1, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.m249",
            Offset = {
                vpos = Vector(0, 1.667, 14.738),
                vang = Angle(90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.m249",
            Offset = {
                vpos = Vector(0.75, 0, 15), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, 0),
                wpos = Vector(17, 2, -7),
                wang = Angle(-10.393, 0, -90)
            },
        },
        {
            PrintName = "Grip",
            Slot = "grip",
            DefaultAttName = "Standard Grip"
        },
        {
            PrintName = "Fire Group",
            Slot = "fcg",
            DefaultAttName = "Standard FCG"
        },
        {
            PrintName = "Ammo Type",
            Slot = "ammo_bullet"
        },
        {
            PrintName = "Perk",
            Slot = "perk"
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.m249",
            Offset = {
                vpos = Vector(0.75, -1, 3), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(9, 1.5, -4.5),
                wang = Angle(0, -4.211, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1
        },
        ["draw"] = {
            Source = "draw",
            Time = 1,
            SoundTable = {{s = "weapons/arccw/m249/m249_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "draw",
            Time = 2,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = "shoot",
            Time = 1,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 1,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 6,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {30, 56, 107, 142, 169},
            FrameRate = 30,
            LastClip1OutTime = 3,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {23, 51, 79, 106, 134},
            FrameRate = 30,
            LastClip1OutTime = 2,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_para"] = {
            Source = "reload_para",
            Time = 3.25,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {31, 73, 110},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_para_empty"] = {
            Source = "reload_para_empty",
            Time = 4,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {31, 73, 110},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_minimi', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'RPG-7'
    SWEP.Trivia_Class = "Rocket Launcher"
    SWEP.Trivia_Desc = "A rocket launcher with 4 different payload options; HE, HEAT, Tandem, and Smoke. HE rockets have high splash but low immediate damage. HEAT rounds have good damage and splash. Tandem rounds have very little splash, but massive damage. Smoke rounds do no damage, but create an obscuring smokescreen."
    SWEP.Trivia_Manufacturer = "Kremen Oruzhiye"
    SWEP.Trivia_Calibre = "64mm Rocket"
    SWEP.Trivia_Mechanism = "Single-Action"
    SWEP.Trivia_Country = "Russia"
    SWEP.Trivia_Year = 1961

    SWEP.Slot = 4

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_rpg7.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_rpg7.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.ShootEntity = "arccw_rpg7_heat" -- entity to fire, if any
    SWEP.MuzzleVelocity = 100000 -- projectile or phys bullet muzzle velocity
    -- IN M/S

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
    SWEP.NPCWeight = 150

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
        Pos = Vector(-4.29, 5, -1),
        Ang = Angle(1.5, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "smg"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

    SWEP.ActivePos = Vector(1, 12, -2)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(1, 4, -14)
    SWEP.HolsterAng = Angle(40, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.ExtraSightDist = 15

    SWEP.AttachmentElements = {
        ["nors"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {{ind = 2, bg = 1}},
        },
        ["nogrip"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
            WMBodygroups = {{ind = 3, bg = 1}},
        },
        ["ammo_rpg7_he"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["ammo_rpg7_smoke"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["ammo_rpg7_tandem"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
    }

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "Weapon_Main", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -3, 0), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(9.36, 0, -5.301),
                wang = Angle(-9.738, 0, 180)
            },
            InstalledEles = {"nors"},
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "bipod"},
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0, -1, 6),
                vang = Angle(90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
            InstalledEles = {"nogrip"},
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0.75, -2, 2),
                vang = Angle(90, 0, 0),
                wpos = Vector(25.625, -0.253, -8.298),
                wang = Angle(-8.829, -0.556, 90)
            },
        },
        {
            PrintName = "Grip",
            Slot = "grip",
            DefaultAttName = "Standard Grip"
        },
        {
            PrintName = "Ammo Type",
            DefaultAttName = "HEAT",
            Slot = "ammo_rpg7_rocket"
        },
        {
            PrintName = "Perk",
            Slot = "perk"
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0.9, -2, 4), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
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
            Source = "idle_empty",
            Time = 1,
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 1.5,
        },
        ["draw"] = {
            Source = "draw",
            Time = 1.5,
        },
        ["fire"] = {
            Source = "fire",
            Time = 0.5,
        },
        ["reload"] = {
            Source = "reload",
            Time = 3.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {20, 26, 40},
            FrameRate = 30,
            LHIK = false,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_rpg7', SWEP )