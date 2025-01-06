local Lang = AMB.Language.AddBetweenRusAndEng

local category = Lang( '#arccw_category_assault_rifle', '[ArcCW] Штурмовые Винтовки', '[ArcCW] Assault Rifles' )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'SG 552'
    SWEP.Trivia_Class = category
    SWEP.Trivia_Desc = Lang( '#arccw_sg552_desc', 'Легкая штурмовая винтовка, по умолчанию с компактным магазином на 24 патрона. Управляемая скорострельность. Большая точность.', 'Lightweight assault rifle, with compact 24-round magazine as default. Controllable fire rate. Great accuracy.' )
    SWEP.Trivia_Manufacturer = Lang( '#arccw_sg552_manufacturer', 'ROLAND SIS' )
    SWEP.Trivia_Calibre = Lang( '#arccw_sg552_calibre', '5.56x45mm NATO' )
    SWEP.Trivia_Mechanism = Lang( '#arccw_sg552_manufacturer', 'Gas-Operated' )
    SWEP.Trivia_Country = Lang( '#arccw_sg552_country', 'Швейцария', 'Switzerland' )
    SWEP.Trivia_Year = 1991

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_roland.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_roland.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "00000"

    SWEP.Damage = 32 -- 28
    SWEP.DamageMin = 21 -- damage done at maximum range
    SWEP.Range = 135 -- in METRES
    SWEP.Penetration = 6
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1050 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 24 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 42
    SWEP.ReducedClipSize = 12

    SWEP.Recoil = 0.35
    SWEP.RecoilSide = 0.25
    SWEP.RecoilRise = 0.75

    SWEP.Delay = 60 / 800 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_ar2", "weapon_smg1"}
    SWEP.NPCWeight = 150

    SWEP.AccuracyMOA = 2 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 450 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "stanag" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/sg556/sg556_01.wav"
    SWEP.ShootSound = "weapons/arccw/sg556/sg556_02.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/sg556/sg556-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_1"
    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 95
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.92
    SWEP.SightedSpeedMult = 0.65
    SWEP.SightTime = 0.36

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-8.049, -12.337, 3.559),
        Ang = Angle(0.528, -0.294, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(-2, -2, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 24

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
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {},
        },
        ["nobrake"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
            WMBodygroups = {},
        },
    }

    SWEP.ExtraSightDist = 3

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = "optic", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.sg552_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vang = Angle(-90, 0, -90),
                wang = Angle(-10.52, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(-0.05, -7, -2),
                vmax = Vector(-0.05, -7, -5.5),
                wmin = Vector(5, 0.899, -6),
                wmax = Vector(7, 0.899, -6),
            },
            InstalledEles = {"nors"},
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.sg552_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.05, -7, -12),
                vang = Angle(-90, 0, -90),
                wpos = Vector(5, 0.899, -6),
                wang = Angle(-10.52, 0, 180)
            },
            KeepBaseIrons = true
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.sg552_Parent",
            Offset = {
                vpos = Vector(0, -5.15, -18.275),
                vang = Angle(-90, 0, -90),
                wpos = Vector(21.5, 0.8, -6.901),
                wang = Angle(-10, 0, 180)
            },
            InstalledEles = {"nobrake"},
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.sg552_Parent",
            Offset = {
                vang = Angle(-90, 0, -90),
                wang = Angle(-10.7, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0, -4.149, -8.848),
                vmax = Vector(0, -4.149, -13.561),
                wmin = Vector(15, 0.74, -4.301),
                wmax = Vector(15, 0.74, -4.301),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.sg552_Parent",
            Offset = {
                vpos = Vector(-0.69, -6.203, -12.273), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 0),
                wpos = Vector(15.625, -0.253, -6.298),
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
            Bone = "v_weapon.sg552_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.35, -4, -1), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(6.099, 1.6, -3.301),
                wang = Angle(171.817, 180-1.17, 0),
            },
        },
    }

    SWEP.Animations = {
        ["draw"] = {
            Source = "draw",
            Time = 0.6,
            SoundTable = {{s = "weapons/arccw/aug/aug_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "draw",
            Time = 1.5,
            SoundTable = {{s = "weapons/arccw/aug/aug_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2", "shoot3"},
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 53},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 53, 76},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }
AMB.ArcCW.AddWeapon( 'arccw_sg552', SWEP )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'AK-47'
    SWEP.Trivia_Class = category
    SWEP.Trivia_Desc = Lang( '#arccw_ak47_desc', 'Ранняя модель штурмовой винтовки, разработанная советским танковым механиком в ответ на потребность в более универсальном пехотном оружии. Плохая точность, но наносит серьезный удар.', 'An early assault rifle pattern, designed by a Soviet tank mechanic in response to the need for a more versatile infantry weapon. Poor accuracy, but packs a serious punch.' )
    SWEP.Trivia_Manufacturer = Lang( '#arccw_ak47_manufacture', 'Ижевский машиностроительный завод' )
    SWEP.Trivia_Calibre = Lang( '#arccw_ak47_calibre', '7.62x39mm Советский', '7.62x39mm Soviet' )
    SWEP.Trivia_Mechanism = Lang( '#arccw_ak47_mechanism', 'СССР', 'Gas-Operated' )
    SWEP.Trivia_Country = Lang( '#arccw_ak47_country', 'СССР', 'USSR' )
    SWEP.Trivia_Year = 1946

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_type2.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_type2.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 33
    SWEP.DamageMin = 24 -- damage done at maximum range
    SWEP.Range = 100 -- in METRES
    SWEP.Penetration = 10
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1100 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 30 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 45
    SWEP.ReducedClipSize = 10

    SWEP.Recoil = 0.65
    SWEP.RecoilSide = 0.75
    SWEP.RecoilRise = 1

    SWEP.Delay = 60 / 600 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_ar2"
    SWEP.NPCWeight = 200

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 700 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
    SWEP.MagID = "type2" -- the magazine pool this gun draws from

    SWEP.ShootVol = 115 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/ak47/ak47_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/ak47/ak47-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_1"
    SWEP.ShellModel = "models/shells/shell_762nato.mdl"
    SWEP.ShellScale = 1.5
    SWEP.ShellMaterial = "models/weapons/arcticcw/shell_556_steel"

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.94
    SWEP.SightedSpeedMult = 0.5
    SWEP.SightTime = 0.33
    SWEP.VisualRecoilMult = 1
    SWEP.RecoilRise = 1

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-6.591, -15.402, 2.769),
        Ang = Angle(2.391, 0.037, 0.134),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(-2, -6, 0)
    SWEP.ActiveAng = Angle(2, 0, 0)

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
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Bone = "v_weapon.AK47_Parent",
                    Scale = Vector(-1, -1, 1),
                    Offset = {
                        pos = Vector(0, -6.723, -2.04),
                        ang = Angle(-90, 0, -90)
                    }
                }
            },
            WMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Scale = Vector(-1, -1, 1),
                    Offset = {
                        pos = Vector(5.714, 0.73, -6),
                        ang = Angle(171, 0, -1)
                    }
                }
            },
        },
        ["fcg_semi"] = {
            TrueNameChange = "Vepr-KM",
            NameChange = "Wasp-2",
        }
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.AK47_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -6.823, -1.384), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(6.099, 0.699, -6.301),
                wang = Angle(171.817, 180-1.17, 0),
            },
            InstalledEles = {"mount"},
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(2, 0, 0)
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.AK47_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -6.1, -15), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(6.099, 0.699, -6.301),
                wang = Angle(171.817, 180-1.17, 0),
            },
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(1.5, 0, 0),
            KeepBaseIrons = true,
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.AK47_Parent",
            Offset = {
                vpos = Vector(0, -3.833, -25.275),
                vang = Angle(-91.96, 0, -90),
                wpos = Vector(31.687, 0.689, -8.101),
                wang = Angle(-9, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.AK47_Parent",
            Offset = {
                vpos = Vector(0, -3.549, -13.561),
                vang = Angle(-90, 0, -90),
                wpos = Vector(17, 0.6, -4.676),
                wang = Angle(-10, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0, -3.33, -9.848),
                vmax = Vector(0, -3.549, -13.561),
                wmin = Vector(15, 0.832, -4.2),
                wmax = Vector(20, 0.832, -4.7),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.AK47_Parent",
            Offset = {
                vpos = Vector(0.72, -4.746, -12.756), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, -3, 180),
                wpos = Vector(15.625, -0.1, -6.298),
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
            Bone = "v_weapon.AK47_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.5, -4.5, -4), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(6.099, 1.1, -3.301),
                wang = Angle(171.817, 180-1.17, 0),
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = false,
        ["draw"] = {
            Source = "ak47_draw",
            Time = 0.4,
            SoundTable = {{s = "weapons/arccw/ak47/ak47_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "ak47_ready",
            Time = 1,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = {"ak47_fire1", "ak47_fire2", "ak47_fire3"},
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "ak47_fire_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "ak47_reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Framerate = 37,
            Checkpoints = {28, 38, 69},
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "ak47_reload_full",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Framerate = 37,
            Checkpoints = {28, 38, 69},
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }
AMB.ArcCW.AddWeapon( 'arccw_ak47', SWEP )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'AUG A2'
    SWEP.Trivia_Class = category
    SWEP.Trivia_Desc = "Bullpup assault rifle, whose design puts the mechanism behind the grip, allowing for a longer barrel without extending the effective length of the weapon. Good magazine capacity, poor recoil characteristics."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = "5.56x45mm NATO"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1978

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_para.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_para.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "00000"

    SWEP.Damage = 28
    SWEP.DamageMin = 21 -- damage done at maximum range
    SWEP.Range = 120 -- in METRES
    SWEP.Penetration = 6
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1050 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 36 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 62
    SWEP.ReducedClipSize = 15

    SWEP.Recoil = 0.45
    SWEP.RecoilSide = 0.4
    SWEP.RecoilRise = 0.75

    SWEP.Delay = 60 / 700 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_ar2"
    SWEP.NPCWeight = 100

    SWEP.AccuracyMOA = 3 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "stanag" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/aug/aug_01.wav"
    SWEP.ShootSound = "weapons/arccw/aug/aug_03.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/aug/aug-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_4"
    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 95
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.92
    SWEP.SightedSpeedMult = 0.45
    SWEP.SightTime = 0.36

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-7.843, -11.933, 1.738),
        Ang = Angle(4.2, -3.875, -10.58),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(-2, 0, -2)
    SWEP.ActiveAng = Angle(1.5, -3.3, -10.58)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 24

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
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {},
        },
        ["nofg"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
            WMBodygroups = {},
        },
        ["norail"] = {
            VMBodygroups = {{ind = 4, bg = 1}},
            WMBodygroups = {},
        },
        ["optic_aug_scope"] = {
            TrueNameChange = "AUG A1"
        }
    }

    SWEP.ExtraSightDist = 3

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            MergeSlots = {10},
            Bone = "v_weapon.aug_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.8, -5.103, -2.08), -- offset that the attachment will be relative to the bone
                vang = Angle(180 + 86.087, 0, -180 + 100.628),
                wpos = Vector(8, 1, -6),
                wang = Angle(-10.393, 0, 180)
            },
            InstalledEles = {"nors"},
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.aug_Parent",
            Offset = {
                vpos = Vector(-0.123, -3.694, -15.587),
                vang = Angle(-93.5, -1, -90),
                wpos = Vector(22, 1, -7),
                wang = Angle(-9.79, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.aug_Parent",
            Offset = {
                vpos = Vector(0, -2.5, -5.5),
                vang = Angle(180 + 86.087, 0, -180 + 100.628),
                wpos = Vector(14, 0.602, -4.8),
                wang = Angle(-10.216, 0, 180)
            },
            InstalledEles = {"nofg"},
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.aug_Parent",
            Offset = {
                vpos = Vector(1.386, -2.286, -3.787), -- offset that the attachment will be relative to the bone
                vang = Angle(180 + 86.087, 0, 90 + 100.628),
                wpos = Vector(10.625, 0.853, -4.298),
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
            Slot = "optic_aug_scope",
            Bone = "v_weapon.aug_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(0, 0, 0),
                wang = Angle(0, 0, 0)
            },
            Hidden = true,
            NoWM = true,
            InstalledEles = {"norail", "nors"},
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.aug_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.15, -3.75, 2), -- offset that the attachment will be relative to the bone
                vang = Angle(180 + 86.087, 0, -180 + 100.628),
                wpos = Vector(3, 1.5, -3.5),
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
            Time = 0.6,
            SoundTable = {{s = "weapons/arccw/aug/aug_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0.7,
            LHIKOut = 0.5,
        },
        ["ready"] = {
            Source = "ready",
            Time = 1.5,
            SoundTable = {{s = "weapons/arccw/aug/aug_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0.7,
            LHIKOut = 0.5,
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2", "shoot3"},
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {16, 30},
            FrameRate = 27,
            LHIK = true,
            LHIKIn = 0.7,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 4,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {16, 30, 55},
            FrameRate = 27,
            LHIK = true,
            LHIKIn = 0.7,
            LHIKOut = 0.5,
        },
    }
AMB.ArcCW.AddWeapon( 'arccw_aug', SWEP )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'FAMAS'
    SWEP.Trivia_Class = "Assault Rifle"
    SWEP.Trivia_Desc = "Bullpup 3 round burst assault rifle. Reliable, well-rounded option for medium to long range battle."
    SWEP.Trivia_Manufacturer = "Arsenal Nationale"
    SWEP.Trivia_Calibre = "5.56x45mm NATO"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "France"
    SWEP.Trivia_Year = 1971

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_canin.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_canin.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "0"

    SWEP.Damage = 36
    SWEP.DamageMin = 25 -- damage done at maximum range
    SWEP.Range = 130 -- in METRES
    SWEP.Penetration = 8
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1050 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 25 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 60
    SWEP.ReducedClipSize = 10

    SWEP.Recoil = 0.4
    SWEP.RecoilSide = 0.2
    SWEP.RecoilRise = 0.75

    SWEP.Delay = 60 / 800 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = -3,
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_ar2"
    SWEP.NPCWeight = 125

    SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "stanag" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/famas/famas-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/famas/famas_distant_01.wav"

    SWEP.MuzzleEffect = "muzzleflash_6"
    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 95
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.94
    SWEP.SightedSpeedMult = 0.75
    SWEP.SightTime = 0.33

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-6.237, -8.547, 0.903),
        Ang = Angle(0.657, -0.143, 0),
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
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
    }

    SWEP.ExtraSightDist = 3

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.famas", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.1, -4.757, 15.404), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(4.762, 0.832, -8.402),
                wang = Angle(-10.393, 0, 180)
            },
            CorrectiveAng = Angle(-0.26, 0, 0)
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.famas", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.1, -4.2, 20), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(4.762, 0.832, -8.402),
                wang = Angle(-10.393, 0, 180)
            },
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.famas",
            Offset = {
                vpos = Vector(0.1, -0.75, 27.5),
                vang = Angle(90, 0, -90),
                wpos = Vector(16.791, 0.847, -6.461),
                wang = Angle(-10.393, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.famas",
            Offset = {
                vang = Angle(90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0, 0.75, 16),
                vmax = Vector(0, 0.75, 23),
                wmin = Vector(4.762, 0.832, -6.402),
                wmax = Vector(9.09, 0.832, -7.179),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.famas",
            Offset = {
                vpos = Vector(0.1, -4.757, 15.404), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, 0),
                wpos = Vector(15.625, -0.253, -6.298),
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
            Bone = "v_weapon.famas",
            Offset = {
                vpos = Vector(0.5, -4.286, 10), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(12, 2.5, -4),
                wang = Angle(0, -4.211, 180)
            },
        },
    }

    SWEP.Animations = {
        ["draw"] = {
            Source = "draw",
            Time = 0.6,
            SoundTable = {{s = "weapons/arccw/m4a1/m4a1_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "ready",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2", "shoot3"},
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {16, 30},
            FrameRate = 27,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload_full",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {16, 30, 55},
            FrameRate = 27,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_famas', SWEP )

local SWEP = {}

    SWEP.Primary = {}
    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'G3A3'
    SWEP.Trivia_Class = "Battle Rifle"
    SWEP.Trivia_Desc = "Heavy 7.62mm battle rifle. Fully automatic, with punishing recoil. Effective at long range. Slow fire rate."
    SWEP.Trivia_Manufacturer = "Nordland"
    SWEP.Trivia_Calibre = "7.62x51mm NATO"
    SWEP.Trivia_Mechanism = "Roller-Delayed Blowback"
    SWEP.Trivia_Country = "Norway"
    SWEP.Trivia_Year = 1963

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_ag63.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_ag63.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "0000000000"

    SWEP.Damage = 60
    SWEP.DamageMin = 29 -- damage done at maximum range
    SWEP.Range = 200 -- in METRES
    SWEP.Penetration = 20
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1800 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 20 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 30
    SWEP.ReducedClipSize = 10

    SWEP.Recoil = 0.75
    SWEP.RecoilSide = 0.65
    SWEP.RecoilRise = 1

    SWEP.Delay = 60 / 450 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_ar2"
    SWEP.NPCWeight = 125

    SWEP.AccuracyMOA = 3 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 750 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
    SWEP.MagID = "ag63" -- the magazine pool this gun draws from

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/g3sg1/g3sg1_02.wav"
    SWEP.ShootSound = "weapons/arccw/g3sg1/g3sg1_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/g3sg1/g3sg1_distant_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"

    SWEP.MuzzleEffect = "muzzleflash_1"
    SWEP.ShellModel = "models/shells/shell_762nato.mdl"
    SWEP.ShellPitch = 90
    SWEP.ShellRotate = 180
    SWEP.ShellScale = 2.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.85
    SWEP.SightedSpeedMult = 0.5

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = true

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-6.161, -7.804, 3.164),
        Ang = Angle(0.214, 0.07, 0),
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
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["nofs"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
        }
    }

    SWEP.ExtraSightDist = 6

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_sniper"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.g3sg1_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vang = Angle(-90, 0, -90),
                wpos = Vector(4.762, 0.832, -6.402),
                wang = Angle(-10.393, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset
                vmin = Vector(0.04, -6.493, -0.520),
                vmax = Vector(0.04, -6.493, -6.437),
                wmin = Vector(4.762, 0.832, -5.402),
                wmax = Vector(9.09, 0.832, -6.179),
            },
            InstalledEles = {"nofs"}
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.g3sg1_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.04, -6.393, -12.520),
                vang = Angle(-90, 0, -90),
                wpos = Vector(4.762, 0.832, -6.402),
                wang = Angle(-10.393, 0, 180)
            },
            KeepBaseIrons = true,
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.g3sg1_Parent",
            Offset = {
                vpos = Vector(0.04, -4.908, -22.104),
                vang = Angle(-90, 0, -90),
                wpos = Vector(27, 0.847, -8.75),
                wang = Angle(-10.393, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.g3sg1_Parent",
            Offset = {
                vang = Angle(-90, 0, -90),
                wang = Angle(-10.216, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0, -3.83, -9.848),
                vmax = Vector(0, -4.43, -14.561),
                wmin = Vector(14, 0.832, -4.402),
                wmax = Vector(14, 0.832, -4.179),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.g3sg1_Parent",
            Offset = {
                vpos = Vector(1, -4.286, -12.787), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 180),
                wpos = Vector(15.625, -0.253, -6.298),
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
            Bone = "v_weapon.g3sg1_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.6, -5, -3),
                vang = Angle(-90, 0, -90),
                wpos = Vector(6, 1.4, -4),
                wang = Angle(-10.393, 0, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = false,
        ["draw"] = {
            Source = "draw",
            Time = 1,
            SoundTable = {{s = "weapons/arccw/ak47/ak47_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "draw",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2"},
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {20, 39},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 4.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {37, 58, 75, 92, 119, 124},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_g3a3', SWEP )

local SWEP = {}

    SWEP.Primary = {}
    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Galil 556'
    SWEP.Trivia_Class = "Assault Rifle"
    SWEP.Trivia_Desc = "Very low recoil assault rifle. Highly controllable. Has a bottle opener in the front handguard."
    SWEP.Trivia_Manufacturer = "Israeli Military Industries"
    SWEP.Trivia_Calibre = "5.56x45mm NATO"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "Israel"
    SWEP.Trivia_Year = 1972

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_lior556.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_lior556.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "000000"

    SWEP.Damage = 26
    SWEP.DamageMin = 19 -- damage done at maximum range
    SWEP.Range = 150 -- in METRES
    SWEP.Penetration = 10
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1100 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 30 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 50
    SWEP.ReducedClipSize = 15

    SWEP.Recoil = 0.35
    SWEP.RecoilSide = 0.2
    SWEP.RecoilRise = 1

    SWEP.Delay = 60 / 725 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_ar2"
    SWEP.NPCWeight = 110

    SWEP.AccuracyMOA = 11 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "type2" -- the magazine pool this gun draws from

    SWEP.ShootVol = 115 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/galilar/galil_04.wav"
    SWEP.ShootSound = "weapons/arccw/galilar/galil_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/galilar/galil-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_3"
    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 95
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.95
    SWEP.SightedSpeedMult = 0.75
    SWEP.SightTime = 0.36

    SWEP.IronSightStruct = {
        Pos = Vector(-6.362, -9.209, 2.546),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
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
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["nors"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
        },
        ["nofs"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
        },
        ["norsa"] = {
            VMBodygroups = {{ind = 4, bg = 1}},
        },
        ["altirons"] = {
            Override_IronSightStruct = {
                Pos = Vector(-6.352, -9.209, 3),
                Ang = Angle(-0.9, 0.03, 0),
                Magnification = 1.5,
            }
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Bone = "v_weapon.galil",
                    Scale = Vector(-1, -1, 1),
                    Offset = {
                        pos = Vector(0, -2.2, 5),
                        ang = Angle(90, 0, -90),
                    }
                }
            },
            WMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Scale = Vector(-1, -1, 1),
                    Offset = {
                        pos = Vector(5.714, 0.73, -6),
                        ang = Angle(171, 0, -1)
                    }
                }
            },
        },
        ["mount2"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Bone = "v_weapon.galil",
                    Scale = Vector(-1, -1, 1),
                    Offset = {
                        pos = Vector(0, -2.2, 15),
                        ang = Angle(90, 0, -90),
                    }
                }
            },
        },
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.galil", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -2.2, 5), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(6.099, 0.699, -6.301),
                wang = Angle(171.817, 180-1.17, 0),
            },
            InstalledEles = {"mount", "nors", "nofs", "norsa"},
            MergeSlots = {11}
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.galil", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -2.2, 15), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(6.099, 0.699, -6.301),
                wang = Angle(171.817, 180-1.17, 0),
            },
            InstalledEles = {"mount2"},
            KeepBaseIrons = true,
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.galil",
            Offset = {
                vpos = Vector(0.15, -0.2, 28),
                vang = Angle(90, 0, -90),
                wpos = Vector(31.687, 0.689, -8.101),
                wang = Angle(-9, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.galil",
            Offset = {
                vang = Angle(90, 0, -90),
                wang = Angle(-10, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0, 1.5, 9.848),
                vmax = Vector(0, 1.5, 13.561),
                wmin = Vector(15, 0.832, -4.2),
                wmax = Vector(20, 0.832, -4.7),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.galil",
            Offset = {
                vpos = Vector(1, -0.75, 15), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, 0),
                wpos = Vector(15.625, -0.1, -6.298),
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
            Slot = "irons_alt",
            InstalledEles = {"nors", "altirons"}
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.galil",
            Offset = {
                vpos = Vector(0.75, 0.25, 6), -- offset that the attachment will be relative to the bone
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
            Time = 0.4,
            SoundTable = {{s = "weapons/arccw/galilar/galil_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "draw",
            Time = 1,
            SoundTable = {{s = "weapons/arccw/galilar/galil_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2", "shoot3"},
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Framerate = 47,
            Checkpoints = {19, 61},
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Framerate = 47,
            Checkpoints = {19, 61, 100},
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_galil556', SWEP )

local SWEP = {}

    SWEP.Primary = {}
    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'M4A1'
    SWEP.Trivia_Class = "Assault Carbine"
    SWEP.Trivia_Desc = "Shortened carbine-length version of the M16 rifle, designed for use in situations where a shorter or lighter weapon is required. After the turn of the millennium, many armies began adopting carbines as their main infantry weapons."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "5.56x45mm NATO"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1994

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_mk4.mdl"
    SWEP.WorldModel = "models/weapons/arccw/mk4.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "000000"

    SWEP.Damage = 29
    SWEP.DamageMin = 20 -- damage done at maximum range
    SWEP.Range = 110 -- in METRES
    SWEP.Penetration = 7
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 900 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 30 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 60
    SWEP.ReducedClipSize = 15

    SWEP.Recoil = 0.5
    SWEP.RecoilSide = 0.35
    SWEP.RecoilRise = 0.75

    SWEP.Delay = 60 / 750 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_ar2", "weapon_smg1"}
    SWEP.NPCWeight = 150

    SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "stanag" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 95 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/m4a1/m4a1_us_01.wav"
    SWEP.ShootSound = "weapons/arccw/m4a1/m4a1_us_03.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/m4a1/m4a1_us_distant_03.wav"

    SWEP.MuzzleEffect = "muzzleflash_4"
    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 95
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.96
    SWEP.SightedSpeedMult = 0.70
    SWEP.SightTime = 0.33

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-7.738, -7.52, 0.558),
        Ang = Angle(2.763, -1.587, -3.349),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(-1.979, 0, -1.645)
    SWEP.ActiveAng = Angle(2.397, -1, -2.612)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 27

    SWEP.AttachmentElements = {
        ["noch"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 2, bg = 1}},
        },
        ["extendedmag"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 2, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["fcg_semi"] = {
            TrueNameChange = "AR-15",
            NameChange = "Gryphon Patriot",
        }
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = "optic", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.m4_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.75, -5.715, -1.609), -- offset that the attachment will be relative to the bone
                vang = Angle(-90 - 1.46949, 0, -85 + 3.64274),
                wang = Angle(-9.738, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(0.8, -5.715, -4),
                vmax = Vector(0.8, -5.715, -0.5),
                wmin = Vector(5.36, 0.739, -5.401),
                wmax = Vector(5.36, 0.739, -5.401),
            },
            InstalledEles = {"noch"},
            -- CorrectivePos = Vector(-0.017, 0, -0.4),
            CorrectivePos = Vector(0.02, 0, 0),
            CorrectiveAng = Angle(-3, 0, 0)
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.m4_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.5, -6, -10), -- offset that the attachment will be relative to the bone
                wpos = Vector(5.36, 0.739, -5.401),
                vang = Angle(-90 - 1.46949, 0, -85 + 3.64274),
                wang = Angle(-9.738, 0, 180)
            },
            -- CorrectivePos = Vector(-0.017, 0, -0.4),
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(-3, 0, 0),
            KeepBaseIrons = true,
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.m4_Parent",
            Offset = {
                vpos = Vector(0.152, -4.604, -17.313),
                vang = Angle(-91.613, 0, -90),
                wpos = Vector(26.648, 0.782, -8.042),
                wang = Angle(-9.79, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.m4_Parent",
            Offset = {
                vpos = Vector(0.152, -3.626, -7.305),
                vang = Angle(-92.269, 0, -85 + 3.64274),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0.152, -3.626, -7.305),
                vmax = Vector(0.152, -3.626, -10.81),
                wmin = Vector(15, 0.74, -4.301),
                wmax = Vector(15, 0.74, -4.301),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.m4_Parent",
            Offset = {
                vpos = Vector(-0.69, -4.803, -9.273), -- offset that the attachment will be relative to the bone
                vang = Angle(-90 - 1.46949, -1.5, 5.64274),
                wpos = Vector(15.625, -0.253, -6.298),
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
            Bone = "v_weapon.m4_Parent",
            Offset = {
                vpos = Vector(-0.25, -3, -4),
                vang = Angle(-90 - 1.46949, 0, -85 + 3.64274),
                wpos = Vector(9, 1.25, -2.5),
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
            Time = 0.45,
            SoundTable = {{s = "weapons/arccw/m4a1/m4a1_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.35,
        },
        ["ready"] = {
            Source = "ready",
            Time = 1,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2", "shoot3"},
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 42, 59, 71},
            FrameRate = 37,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 42, 59, 71, 89},
            FrameRate = 37,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_m4a1', SWEP )

local SWEP = {}

    SWEP.Primary = {}
    
    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'P90'
    SWEP.Trivia_Class = "Personal Defense Weapon"
    SWEP.Trivia_Desc = "5.7mm PDW developed to arm rear-line soldiers in need of a more effective weapon to combat enemy paratroopers wearing body armor. Offers high fire rate with excellent damage characteristics retained at long range."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = "5.7mm PDW"
    SWEP.Trivia_Mechanism = "Straight Blowback"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1989

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_pdw57.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_pdw57.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 21
    SWEP.DamageMin = 18 -- damage done at maximum range
    SWEP.Range = 100 -- in METRES
    SWEP.Penetration = 6
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 400 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 50 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 75
    SWEP.ReducedClipSize = 25

    SWEP.RevolverReload = false -- cases all eject on reload

    SWEP.OpenBolt = false -- gun fires at the end of 

    SWEP.Recoil = 0.25
    SWEP.RecoilSide = 0.2
    SWEP.VisualRecoilMult = 1.75

    SWEP.Delay = 60 / 900 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_smg1"
    SWEP.NPCWeight = 50

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "pdw57" -- the magazine pool this gun draws from

    SWEP.ShootVol = 100 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/p90/p90_01.wav"
    SWEP.ShootSound = "weapons/arccw/p90/p90_02.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/mp5/mp5_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/p90/p90-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_smg"
    SWEP.ShellModel = "models/shells/shell_57.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.35

    SWEP.SpeedMult = 0.95
    SWEP.SightedSpeedMult = 0.65

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-5.942, -10.45, 0.967),
        Ang = Angle(2.961, -1.117, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "smg"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

    SWEP.ActivePos = Vector(-2, -4, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentBodygroups = {}
    -- ["name"] = {ind = 1, bg = 1}
    -- same as ACT3

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["nobrake"] = {
            VMBodygroups = {{ind = 2, bg = 2}},
            WMBodygroups = {},
        },
        ["nors"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
            WMBodygroups = {},
        },
        ["nofg"] = {
            VMBodygroups = {{ind = 4, bg = 1}},
            WMBodygroups = {},
        },
        ["norail"] = {
            VMBodygroups = {{ind = 5, bg = 1}},
            WMBodygroups = {},
        },
        ["fcg_semi"] = {
            TrueNameChange = "PS90",
            NameChange = "M57 Carbine",
            VMBodygroups = {
                {ind = 6, bg = 1},
                {ind = 2, bg = 1}
            },
            AttPosMods = {
                [2] = {
                    vpos = Vector(0.018, -3.997, -12.9),
                }
            }
        }
    }

    SWEP.ExtraSightDist = 4

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            MergeSlots = {10},
            Bone = "v_weapon.p90_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.076, -7.319, -4.369), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(12.762, 1.232, -10.402),
                wang = Angle(-8, -3, 180)
            },
            InstalledEles = {"nors"},
            CorrectivePos = Vector(0, 0, 0)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.p90_Parent",
            Offset = {
                vpos = Vector(0.018, -3.997, -8.075),
                vang = Angle(-90, 0, -90),
                wpos = Vector(16.791, 1.147, -6.461),
                wang = Angle(-8, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "style_pistol"},
            Bone = "v_weapon.p90_Parent",
            Offset = {
                vpos = Vector(0, -3, -5),
                vang = Angle(-90, 0, -90),
                wpos = Vector(14.329, 1.102, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
            InstalledEles = {"nofg"},
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.p90_Parent",
            Offset = {
                vpos = Vector(-0.311, -6.533, -4.743), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 0),
                wpos = Vector(13.152, 1.986, -9.566),
                wang = Angle(-10.393, 0, -90)
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
            Slot = "optic_p90_ring", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.p90_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(0, 0, 0),
                wang = Angle(0, 0, 0)
            },
            Hidden = true,
            NoWM = true,
            InstalledEles = {"norail", "nors"},
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.p90_Parent",
            Offset = {
                vpos = Vector(-1, -5, -1.25), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(9, 2, -4.5),
                wang = Angle(0, -4.211, 180)
            },
        },
    }

    -- draw
    -- holster
    -- reload
    -- fire
    -- cycle (for bolt actions)
    -- append _empty for empty variation

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1
        },
        ["ready"] = {
            Source = "ready",
            Time = 1.5,
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/p90/p90_draw.wav",
                t = 0
                }
            }
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/p90/p90_draw.wav",
                t = 0
                }
            }
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2", "shoot3"},
            Time = 0.25,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "idle",
            Time = 0.25,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 3.75,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {52, 89},
            FrameRate = 40,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 4,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {52, 89},
            FrameRate = 40,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

    SWEP.Primary = {}

AMB.ArcCW.AddWeapon( 'arccw_p90', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'SG 550'
    SWEP.Trivia_Class = "DMR"
    SWEP.Trivia_Desc = "Swiss police marksman rifle in 5.56. Designed for use at closer ranges than most sniper rifles."
    SWEP.Trivia_Manufacturer = "ROLAND SIS"
    SWEP.Trivia_Calibre = "5.56x45mm NATO"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "Switzerland"
    SWEP.Trivia_Year = 1992

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_sg550.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_sg550.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "00000"

    SWEP.Damage = 25
    SWEP.DamageMin = 35 -- damage done at maximum range
    SWEP.Range = 40 -- in METRES
    SWEP.Penetration = 8
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1050 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 20 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 30
    SWEP.ReducedClipSize = 10

    SWEP.Recoil = 0.3
    SWEP.RecoilSide = 0.25
    SWEP.RecoilRise = 0.75

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

    SWEP.NPCWeaponType = {"weapon_ar2", "weapon_crossbow"}
    SWEP.NPCWeight = 25

    SWEP.AccuracyMOA = 0.75 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 800 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 50

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "stanag" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/scar20/scar20_03.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/scar20/scar20_distant_02.wav"

    SWEP.MuzzleEffect = "muzzleflash_1"
    SWEP.ShellModel = "models/shells/shell_556.mdl"
    SWEP.ShellPitch = 95
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.88
    SWEP.SightedSpeedMult = 0.35
    SWEP.SightTime = 0.42

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-7.52, -18.889, 2.016),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(-2, -2, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 24

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {{ind = 1, bg = 2}},
        },
        ["nobrake"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {},
        },
    }

    SWEP.ExtraSightDist = 3

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic_sniper", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.sg550_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vang = Angle(-90, 0, -90),
                wpos = Vector(0, 0, 0),
                wang = Angle(-10.393, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(0.1, -6.3, -0.5),
                vmax = Vector(0.1, -6.3, -3),
                wmin = Vector(5, 0.899, -5),
                wmax = Vector(7, 0.899, -5),
            },
            Installed = "optic_magnus"
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.sg550_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.1, -6.3, -14),
                vang = Angle(-90, 0, -90),
                wpos = Vector(5, 0.899, -5),
                wang = Angle(-10.393, 0, 180)
            },
            ExcludeFlags = {"hugesight"}
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.sg550_Parent",
            Offset = {
                vpos = Vector(0.1, -4.7, -33),
                vang = Angle(-90, 0, -90),
                wpos = Vector(32.5, 0.8, -8.101),
                wang = Angle(-10, 0, 180)
            },
            InstalledEles = {"nobrake"},
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.sg550_Parent",
            Offset = {
                vpos = Vector(0, -4.149, -13.561),
                vang = Angle(-90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0, -4.149, -10),
                vmax = Vector(0, -4.149, -15),
                wmin = Vector(15, 0.74, -4.301),
                wmax = Vector(15, 0.74, -4.301),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.sg550_Parent",
            Offset = {
                vpos = Vector(-0.69, -5.203, -16), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 0),
                wpos = Vector(15.625, -0.253, -5.9),
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
            Bone = "v_weapon.sg550_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.35, -4, -1), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(6.099, 1.35, -3.301),
                wang = Angle(171.817, 180-1.17, 0),
            },
        },
    }

    SWEP.Animations = {
        ["draw"] = {
            Source = "draw",
            Time = 0.6,
            SoundTable = {{s = "weapons/arccw/aug/aug_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["ready"] = {
            Source = "draw",
            Time = 1.5,
            SoundTable = {{s = "weapons/arccw/aug/aug_draw.wav", t = 0}},
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = {"shoot", "shoot2"},
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.75,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {33, 55},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 3.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {33, 55, 88},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_sg550', SWEP )