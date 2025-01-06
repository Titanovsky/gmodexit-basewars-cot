local Lang = AMB.Language.AddBetweenRusAndEng

local category = Lang( '#arccw_category_submachine_rifle', '[ArcCW] Пистолет-Пулемёты', '[ArcCW] Submachine Rifles' )

local SWEP = {}

    SWEP.Primary = {}
    
    SWEP.Base = "arccw_aug"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'AUG Para'
    SWEP.Trivia_Class = "Submachine Gun"
    SWEP.Trivia_Desc = "Bullpup SMG based on the Para-556. Bullpup design enables superior accuracy and range out of a compact SMG package."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = "9x19mm Parabellum"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1978

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_para_9.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_para9.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "00000"

    SWEP.Damage = 26
    SWEP.DamageMin = 18 -- damage done at maximum range
    SWEP.Range = 85 -- in METRES
    SWEP.Penetration = 4
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 400 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 25 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 45
    SWEP.ReducedClipSize = 15

    SWEP.Mult_ReloadTime = 0.8

    SWEP.Recoil = 0.15
    SWEP.RecoilSide = 0.16
    SWEP.RecoilRise = 1

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

    SWEP.NPCWeaponType = "weapon_smg1"
    SWEP.NPCWeight = 100

    SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "para9" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/bizon/bizon_02.wav"
    SWEP.ShootSound = "weapons/arccw/bizon/bizon_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/mp5/mp5_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/bizon/bizon-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_mp5"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.96
    SWEP.SightedSpeedMult = 0.55
    SWEP.SightTime = 0.24

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

    SWEP.BarrelLength = 22

    SWEP.ExtraSightDist = 3

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
        ["optic_aug_scope"] = false
    }

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
                vpos = Vector(0, -3.794, -11.587),
                vang = Angle(-93.5, -1, -90),
                wpos = Vector(18, 1, -6.35),
                wang = Angle(-9.79, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod", "style_pistol"},
            Bone = "v_weapon.aug_Parent",
            Offset = {
                vpos = Vector(0, -2.5, -5.5),
                vang = Angle(180 + 86.087, 0, -180 + 100.628),
                wpos = Vector(17, 0.782, -6.342),
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
AMB.ArcCW.AddWeapon( 'arccw_augpara', SWEP )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "PP-19-02 Bizon"
    SWEP.Trivia_Class = "Submachine Gun"
    SWEP.Trivia_Desc = "Submachine gun with huge helical magazine. Fires relatively weak rounds, slowly, but at a reliable pace. Developed for FSB-Spetsnaz units in the Russian Federation, and employed in combat against militants in the Caucasus region, its straight-blowback design reduces manufacturing costs while sharing components with other common weapons."
    SWEP.Trivia_Manufacturer = "Kremen Oruzhiye"
    SWEP.Trivia_Calibre = "9x18mm Soviet"
    SWEP.Trivia_Mechanism = "Straight Blowback"
    SWEP.Trivia_Country = "Russia"
    SWEP.Trivia_Year = 1996

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_bizon.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_bizon.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 24
    SWEP.DamageMin = 16 -- damage done at maximum range
    SWEP.Range = 45 -- in METRES
    SWEP.Penetration = 3
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 350 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 82 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 82
    SWEP.ReducedClipSize = 44

    SWEP.Recoil = 0.1
    SWEP.RecoilSide = 0.1
    SWEP.VisualRecoilMult = 1

    SWEP.Delay = 60 / 650 -- 60 / RPM.
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
    SWEP.NPCWeight = 125

    SWEP.AccuracyMOA = 21 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 325 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 225

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "bizon" -- the magazine pool this gun draws from

    SWEP.ShootVol = 100 -- volume of shoot sound
    SWEP.ShootPitch = 90 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/bizon/bizon_01.wav"
    SWEP.ShootSound = "weapons/arccw/bizon/bizon_02.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/mp5/mp5_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/bizon/bizon-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_smg"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.4
    SWEP.ShellRotateAngle = Angle(0, 180, 0)

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.34

    SWEP.SpeedMult = 0.96
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
        Pos = Vector(-3.15, 0, 0.25),
        Ang = Angle(0.55, -0.1, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
        CrosshairInSights = false
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

    SWEP.ActivePos = Vector(0, 4, -2)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(3.5, 2, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentElements = {
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {{ind = 1, bg = 1}},
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Bone = "a_bizon",
                    Scale = Vector(1.25, 1.25, 1.25),
                    Offset = {
                        pos = Vector(0.05, 2.5, 0.5),
                        ang = Angle(-90, 0, 90)
                    }
                }
            },
            WMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Scale = Vector(1.25, 1.25, 1.25),
                    Offset = {
                        pos = Vector(7.762, 0.832, -6.302),
                        ang = Angle(-10, 0, 180)
                    }
                }
            },
        }
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "a_bizon", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.05, 2.75, 0.5),
                vang = Angle(-90, 0, 90),
                wpos = Vector(7.762, 0.832, -6.302),
                wang = Angle(-10, 0, 180)
            },
            InstalledEles = {"mount", "nors"},
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "a_bizon",
            Offset = {
                vpos = Vector(0, 0.75, -12.5),
                vang = Angle(-90, 0, 90),
                wpos = Vector(20, 0.7, -6.2),
                wang = Angle(-10, 0, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "a_bizon",
            Offset = {
                vpos = Vector(0.5, 1, -9), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 180),
                wpos = Vector(15, 1.1, -6),
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
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1,
        },
        ["draw"] = {
            Source = "draw",
            SoundTable = {{s = "weapons/arccw/ak47/ak47_draw.wav", t = 0}},
            FrameRate = 40,
        },
        ["ready"] = {
            Source = "ready",
            SoundTable = {{s = "weapons/arccw/ak47/ak47_draw.wav", t = 0}},
            FrameRate = 40,
        },
        ["fire"] = {
            Source = {"fire"},
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "fire_iron",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
            FrameRate = 40,
            Checkpoints = {10, 84}
        },
        ["reload"] = {
            Source = "reload",
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
            FrameRate = 40,
            Checkpoints = {10, 84}
        },
    }
AMB.ArcCW.AddWeapon( 'arccw_bizon', SWEP )

local SWEP = {}

    SWEP.Primary = {}
    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Glock-18'
    SWEP.Trivia_Class = "Machine Pistol"
    SWEP.Trivia_Desc = "9mm fully automatic police machine pistol. Low damage, but a sophisticated recoil control system allows for excellent automatic performance."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = "9x19mm Para"
    SWEP.Trivia_Mechanism = "Short Recoil"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1989

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_ppa.mdl"
    SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 27
    SWEP.DamageMin = 19 -- damage done at maximum range
    SWEP.Range = 35 -- in METRES
    SWEP.Penetration = 3
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 350 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 17 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 32
    SWEP.ReducedClipSize = 12

    SWEP.Recoil = 1
    SWEP.RecoilSide = 0.275
    SWEP.RecoilRise = 1.25

    SWEP.Delay = 60 / 800 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = 1,
        },
    }

    SWEP.NPCWeaponType = "weapon_pistol"
    SWEP.NPCWeight = 110

    SWEP.AccuracyMOA = 20 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 200 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "ppa" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/glock18/glock_02.wav"
    SWEP.ShootSound = "weapons/arccw/glock18/glock_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/glock18/glock18-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_pistol"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.2

    SWEP.SpeedMult = 1
    SWEP.SightedSpeedMult = 0.75

    SWEP.BarrelLength = 18

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-5.801, -8.829, 2.726),
        Ang = Angle(0.88, -0.079, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

    SWEP.ActivePos = Vector(-2, 0, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(-2, -7.145, -11.561)
    SWEP.HolsterAng = Angle(36.533, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.ExtraSightDist = 10

    SWEP.AttachmentElements = {
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "v_weapon.Glock_Parent",
                    Offset = {
                        pos = Vector(1, 2, -0.35),
                        ang = Angle(180 - 3, 15, -100)
                    }
                }
            },
            WMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Offset = {
                        pos = Vector(0, 1, 0),
                        ang = Angle(0, -4.211, 0)
                    }
                }
            }
        }
    }

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = "optic_lp", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.Glock_Slide", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.24, -0.375, -0.163), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 0, -102),
                wpos = Vector(4.129, 1.476, -4.116),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.Glock_Parent",
            Offset = {
                vpos = Vector(-4.441, -4.436, 0.759),
                vang = Angle(180 - 3, 16, -100),
                wpos = Vector(10.229, 2.075, -3.928),
                wang = Angle(0, -4.211, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "v_weapon.Glock_Parent",
            Offset = {
                vpos = Vector(-1.801, -2.306, 0.531),
                vang = Angle(180 - 3, 16, -100),
                wpos = Vector(7.238, 1.641, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "v_weapon.Glock_Parent",
            Offset = {
                vang = Angle(180 - 3, 16, -100),
                wang = Angle(0, -4.211, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(-3.727, -3.128, 0.521),
                vmax = Vector(-3.187, -2.967, 0.508),
                wmin = Vector(9.311, 1.987, -2.764),
                wmax = Vector(9.311, 1.987, -2.764),
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
            DefaultAttName = "No Stock",
            InstalledEles = {"stock"},
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
            Bone = "v_weapon.Glock_Slide", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(6, 0.5, -0.5), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 0, -102),
                wpos = Vector(8, 2.3, -3.5),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
    }


    SWEP.Animations = {
        ["idle"] = false,
        ["ready"] = {
            Source = "ready",
            Time = 1.5
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            }
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            }
        },
        ["fire"] = {
            Source = "fire",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "fire_last",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "fire_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "fire_iron_last",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {28, 41, 53},
            FrameRate = 35,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 2.25,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {28, 41, 53},
            FrameRate = 35,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_g18', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'M14'
    SWEP.Trivia_Class = "DMR"
    SWEP.Trivia_Desc = "Semi-automatic DMR. Well-rounded performance supplemented by railed polymer furniture, which offers superior handling characteristics. 7.62 NATO round overpenetrates at close range."
    SWEP.Trivia_Manufacturer = "Groy Industries"
    SWEP.Trivia_Calibre = "7.62x51mm NATO"
    SWEP.Trivia_Mechanism = "Gas-operated rotating bolt"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1959

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_m14.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_m14.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultBodygroups = "00000"

    SWEP.Damage = 35
    SWEP.DamageMin = 70 -- damage done at maximum range
    SWEP.Range = 50 -- in METRES
    SWEP.Penetration = 22
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 1800 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 15 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 30
    SWEP.ReducedClipSize = 10

    SWEP.Recoil = 0.9
    SWEP.RecoilSide = 0.65
    SWEP.RecoilRise = 1
    SWEP.VisualRecoilMult = 0.5

    SWEP.Delay = 60 / 750 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.AccuracyMOA = 1 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 1250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
    SWEP.MagID = "m14" -- the magazine pool this gun draws from

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 110 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/m14/m14_fire.wav"
    SWEP.DistantShootSound = "weapons/arccw/scar20/scar20_distant_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"

    SWEP.MuzzleEffect = "muzzleflash_m14"
    SWEP.ShellModel = "models/shells/shell_762nato.mdl"
    SWEP.ShellPitch = 90
    SWEP.ShellRotate = 180
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.89
    SWEP.SightedSpeedMult = 0.65

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        [1] = "bullet.bmp",
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-4.054, -1.637, 2.48),
        Ang = Angle(0.064, 0.002, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.NPCWeaponType = "weapon_ar2"
    SWEP.NPCWeight = 100

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(1, 12, -2)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(3.5, 2, 0)
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
        ["nobrake"] = {
            VMBodygroups = {{ind = 2, bg = 1}}
        }
    }

    SWEP.ShellRotateAngle = Angle(180, 180, 0)

    SWEP.ExtraSightDist = 6

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_sniper", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "gun lol01", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vang = Angle(0, -90, 0),
                wpos = Vector(-4.762, 0.832, -6.402),
                wang = Angle(-10.393, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset
                vmin = Vector(0.4, -3, 4.15),
                vmax = Vector(0.4, 3, 4.15),
                wmin = Vector(13, 0.832, -8.4),
                wmax = Vector(26, 0.832, -10.5),
            },
            CorrectiveAng = Angle(0, 180, 0),
            VMScale = Vector(1.4, 1.4, 1.4),
            WMScale = Vector(1, 1, 1)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "gun lol01",
            Offset = {
                vpos = Vector(0.35, 16, 2.6),
                vang = Angle(0, -90, 0),
                wpos = Vector(33, 1.4, -10.161),
                wang = Angle(-10.393, 0, 180)
            },
            InstalledEles = {"nobrake"}
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "gun lol01",
            Offset = {
                vang = Angle(0, -90, 0),
                wang = Angle(-10.216, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0.35, -1, 0.75),
                vmax = Vector(0.35, 12, 0.75),
                wmin = Vector(20, 1.5, -6),
                wmax = Vector(20, 1.5, -6),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "gun lol01",
            Offset = {
                vpos = Vector(1.25, 9, 3), -- offset that the attachment will be relative to the bone
                vang = Angle(0, -90, 90),
                wpos = Vector(21.625, 2, -8.298),
                wang = Angle(-10, -0.556, -90)
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
            Bone = "gun lol01", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(1.25, 6, 2),
                vang = Angle(0, -90, 0),
                wpos = Vector(-4.762, 0.832, -6.402),
                wang = Angle(-10.393, 0, 180)
            },
            VMScale = Vector(1.4, 1.4, 1.4),
        },
    }

    SWEP.Animations = {
        ["draw"] = {
            Source = "draw",
            Time = 1,
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
            Source = "fire",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "fire_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 60},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
            LastClip1OutTime = 1,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 3.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 60, 102},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
            LastClip1OutTime = 1,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_m14', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'MAC-11'
    SWEP.Trivia_Class = "Machine Pistol"
    SWEP.Trivia_Desc = "An often handcrafted submachine gun. Known for its incredibly low price at the cost of almost all else. It shoots, and that's about the best thing going for it."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = ".380 ACP"
    SWEP.Trivia_Mechanism = "Straight Blowback"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1972

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_mk201.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_mk201.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 24
    SWEP.DamageMin = 16 -- damage done at maximum range
    SWEP.Range = 30 -- in METRES
    SWEP.Penetration = 3
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 275 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 0 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 32 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 50
    SWEP.ReducedClipSize = 16

    SWEP.Recoil = 0.5
    SWEP.RecoilSide = 0.15
    SWEP.RecoilRise = 1

    SWEP.Delay = 60 / 875 -- 60 / RPM.
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
    SWEP.NPCWeight = 120

    SWEP.AccuracyMOA = 30 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "mk201" -- the magazine pool this gun draws from

    SWEP.ShootVol = 115 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/mac10/mac10_01.wav"
    SWEP.ShootSound = "weapons/arccw/mac10/mac10_02.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/mac10/mac10-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_smg"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.2

    SWEP.SpeedMult = 1
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
        Pos = Vector(-8.69, -12.046, 2.829),
        Ang = Angle(0.3, -5.4, -7.301),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(-3, -2, -1)
    SWEP.ActiveAng = Angle(0, -5, -7.301)

    SWEP.HolsterPos = Vector(-1.928, -3, -6.228)
    SWEP.HolsterAng = Angle(25, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

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
        ["extendstock"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
            WMBodygroups = {{ind = 2, bg = 1}},
        },
        ["nogrip"] = {
            VMBodygroups = {{ind = 4, bg = 1}},
            WMBodygroups = {{ind = 3, bg = 1}},
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Bone = "v_weapon.mac10_Parent",
                    Scale = Vector(-1, -1, 1),
                    Offset = {
                        pos = Vector(-0.1, -6.3, 3.7),
                        ang = Angle(-90, 0, -90)
                    }
                }
            },
            WMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Scale = Vector(-1, -1, 1),
                    Offset = {
                        pos = Vector(2, 1.476, -4.8),
                        ang = Angle(171, 0, -1)
                    }
                }
            },
        }
    }

    SWEP.ExtraSightDist = 6

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.mac10_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.1, -6.3, 3.7), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(2, 1.476, -4.8),
                wang = Angle(-2.829, -4.902, 180)
            },
            InstalledEles = {"mount"},
            CorrectiveAng = Angle(1, 0, 0)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.mac10_Parent",
            Offset = {
                vpos = Vector(-0.159, -3.972, -4.514),
                vang = Angle(-90, 0, -90),
                wpos = Vector(10, 1.6, -4.2),
                wang = Angle(-5, -4, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "style_pistol"},
            Bone = "v_weapon.mac10_Parent",
            Offset = {
                vpos = Vector(0, -2.6, -4),
                vang = Angle(-90, 0, -90),
                wpos = Vector(9.5, 1.5, -3),
                wang = Angle(-7, 0, 180)
            },
            InstalledEles = {"nogrip"},
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.mac10_Parent",
            Offset = {
                vpos = Vector(0.03, -2.774, -3.579), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 0),
                wang = Angle(-7, -4, -90)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(-1.185, -4.47, -1.982),
                vmax = Vector(-1.185, -4.47, 1.866),
                wmin = Vector(8.152, 1.986, -4.666),
                wmax = Vector(8.152, 1.986, -4.666),
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
            DefaultAttName = "Folded Stock",
            InstalledEles = {"extendstock"},
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
            Bone = "v_weapon.mac10_Parent",
            Offset = {
                vpos = Vector(-1, -4.286, 4.5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(1, 1.5, -3),
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
        ["ready"] = {
            Source = "draw",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 1,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            },
        },
        ["draw"] = {
            Source = "draw",
            Time = 1,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            },
        },
        ["fire"] = {
            Source = {"fire1", "fire2", "fire3"},
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "fire_last",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "fire_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "fire_iron_last",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {36, 57, 77},
            FrameRate = 40,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {36, 57, 77, 88},
            FrameRate = 40,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.25,
        },
    }


AMB.ArcCW.AddWeapon( 'arccw_mac11', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'MP5'
    SWEP.Trivia_Class = "Submachine Gun"
    SWEP.Trivia_Desc = "Light SMG predating the MP-K1. Less precise, with slightly more recoil, but is lighter in weight."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = "9x19mm Para"
    SWEP.Trivia_Mechanism = "Roller-Delayed Blowback"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1956

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_mp5.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_mp5.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 30
    SWEP.DamageMin = 19 -- damage done at maximum range
    SWEP.Range = 65 -- in METRES
    SWEP.Penetration = 4
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 400 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 30 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 60
    SWEP.ReducedClipSize = 15

    SWEP.RevolverReload = false -- cases all eject on reload

    SWEP.Recoil = 0.35
    SWEP.RecoilSide = 0.25
    SWEP.VisualRecoilMult = 1

    SWEP.Delay = 60 / 850 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
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

    SWEP.NPCWeaponType = "weapon_smg1"
    SWEP.NPCWeight = 150

    SWEP.AccuracyMOA = 16 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "mpk1" -- the magazine pool this gun draws from

    SWEP.ShootVol = 100 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/mp9/mp9_04.wav"
    SWEP.ShootSound = "weapons/arccw/mp9/mp9_02.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/mp5/mp5_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/mp9/mp9-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_smg"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.21

    SWEP.SpeedMult = 0.99
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
        Pos = Vector(-5.31, -10.252, 2.6),
        Ang = Angle(-0.55, -0.06, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "smg"
    SWEP.HoldtypeSights = "ar2"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

    SWEP.ActivePos = Vector(0, 1, 1)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

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
        ["mp5sd"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
            WMBodygroups = {},
            TrueNameChange = "MP5SD",
            NameChange = "Pirate 9mm"
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_rail.mdl",
                    Bone = "v_weapon.mp5_Parent",
                    Scale = Vector(1, 1, 1),
                    Offset = {
                        pos = Vector(0.15, -5.41, -4.6),
                        ang = Angle(-90, 0, -90)
                    }
                }
            },
        }
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.mp5_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vang = Angle(-90, 0, -90),
                wang = Angle(-10, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset
                vmin = Vector(0.12, -5.593, -3.520),
                vmax = Vector(0.12, -5.593, -6.437),
                wmin = Vector(4.762, 0.832, -7.302),
                wmax = Vector(9.09, 0.832, -7.879),
            },
            InstalledEles = {"mount", "nors"},
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = {"muzzle", "mp5sd"},
            Bone = "v_weapon.mp5_Parent",
            Offset = {
                vpos = Vector(0.156, -3.908, -15.504),
                vang = Angle(-90, 0, -90),
                wpos = Vector(21, 1.2, -8.5),
                wang = Angle(-10, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod", "style_pistol"},
            Bone = "v_weapon.mp5_Parent",
            Offset = {
                vpos = Vector(0, -3.549, -13.561),
                vang = Angle(-90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0, -3.03, -9.848),
                vmax = Vector(0, -3.63, -12.561),
                wmin = Vector(14.329, 1, -7),
                wmax = Vector(14.329, 1, -7),
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.mp5_Parent",
            Offset = {
                vpos = Vector(-0.461, -3.827, -12.068), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 0),
                wpos = Vector(13.152, 1.386, -5.566),
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
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.mp5_Parent",
            Offset = {
                vpos = Vector(-0.2, -2.5, -4.5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(9, 1.5, -4.5),
                wang = Angle(0, -4.211, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1,
        },
        ["draw"] = {
            Source = "draw",
            Time = 1,
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
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "idle",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.8,
            LHIKOut = 0.6,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.8,
            LHIKOut = 0.6,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_mp5', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Scout'
    SWEP.Trivia_Class = "Sniper Rifle"
    SWEP.Trivia_Desc = "The Precision Sharpshooter Rifle System is a high-spec bolt-action rifle, tailored to the needs of Police snipers. It is also marketed to civilian competition shooters."
    SWEP.Trivia_Manufacturer = "First Strike Tactical"
    SWEP.Trivia_Calibre = ".308 Winchester"
    SWEP.Trivia_Mechanism = "Bolt-Action"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1991

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_psrs.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_psrs.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 70
    SWEP.DamageMin = 100 -- damage done at maximum range
    SWEP.Range = 50 -- in METRES
    SWEP.Penetration = 15
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 2500 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 10 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 15
    SWEP.ReducedClipSize = 5

    SWEP.Recoil = 1.25
    SWEP.RecoilSide = 0.85

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
    SWEP.NPCWeight = 50

    SWEP.ManualAction = true

    SWEP.AccuracyMOA = 0.25 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 50

    SWEP.Primary.Ammo = "SniperPenetratedRound" -- what ammo type the gun uses
    SWEP.MagID = "psrs" -- the magazine pool this gun draws from

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/ssg08/ssg08_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/ssg08/ssg08-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_1"
    SWEP.ShellModel = "models/shells/shell_762nato.mdl"
    SWEP.ShellPitch = 90
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.90
    SWEP.SightedSpeedMult = 0.25

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = true

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-6.664, -10.915, 3.907),
        Ang = Angle(0.342, 0, 0),
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

    SWEP.BarrelLength = 35
    SWEP.AttachmentElements = {
        ["nors"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {},
        },
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_sniper", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.scout_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vang = Angle(-90, 0, -90),
                wang = Angle(-9.738, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(-0.03, -4.086, -8.928),
                vmax = Vector(-0.03, -4.086, -14.885),
                wmin = Vector(10, 0.699, -5.801),
                wmax = Vector(18, 0.699, -7.301),
            },
            InstalledEles = {"nors"},
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(0, 0, 0)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.scout_Parent",
            Offset = {
                vpos = Vector(0, -3.4, -27),
                vang = Angle(-90, 0, -90),
                wpos = Vector(32, 0.699, -8.832),
                wang = Angle(-10.393, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod"},
            Bone = "v_weapon.scout_Parent",
            Offset = {
                vang = Angle(-90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
            },
            SlideAmount = {
                vmin = Vector(0, -1.75, -10),
                vmax = Vector(0, -1.75, -15),
                wmin = Vector(20.26, 0.699, -5.401),
                wmax = Vector(20.26, 0.699, -5.401),
            }
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.scout_Parent",
            Offset = {
                vpos = Vector(0.5, -3.25, -15), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 180),
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
            Bone = "v_weapon.scout_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.5, -2.5, -6), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(6.099, 1.1, -3.301),
                wang = Angle(171.817, 180-1.17, 0),
            },
        },
    }

    SWEP.Animations = {
        ["draw"] = {
            Source = "draw",
            Time = 0.75,
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
            Source = "shoot",
            Time = 1,
        },
        ["cycle"] = {
            Source = "cycle",
            Time = 1,
            ShellEjectAt = 0.35,
            LHIK = true,
            LHIKIn = 0.25,
            LHIKOut = 0.25,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.25,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 33, 51, 58, 62, 74, 80},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {24, 33, 51},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_scout', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'MP9'
    SWEP.Trivia_Class = "Machine Pistol"
    SWEP.Trivia_Desc = "A machine pistol with extremely high fire rate. In order to control this, it has been limited to three-round burst mode."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = "9x19mm Para"
    SWEP.Trivia_Mechanism = "Roller-Delayed Blowback"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1992

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_tmp.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_tmp.mdl"
    SWEP.ViewModelFOV = 55

    SWEP.Damage = 25
    SWEP.DamageMin = 9 -- damage done at maximum range
    SWEP.Range = 35 -- in METRES
    SWEP.Penetration = 3
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 350 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 24 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 50
    SWEP.ReducedClipSize = 12

    SWEP.Recoil = 0.33
    SWEP.RecoilSide = 0.35
    SWEP.RecoilRise = 0.9

    SWEP.Delay = 60 / 1200 -- 60 / RPM.
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

    SWEP.NPCWeaponType = "weapon_smg1"
    SWEP.NPCWeight = 125

    SWEP.AccuracyMOA = 25 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "tmp" -- the magazine pool this gun draws from

    SWEP.ShootVol = 90 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/tec9/tec9_02.wav"
    SWEP.ShootSound = "weapons/arccw/tec9/tec9-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/mp5/mp5_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/mp9/mp9-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_smg"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.2

    SWEP.SpeedMult = 1
    SWEP.SightedSpeedMult = 0.9

    SWEP.BarrelLength = 24

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-6.975, -6, 2.9),
        Ang = Angle(0.6, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

    SWEP.ActivePos = Vector(-0.5, 0, 2)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {},
        },
        ["nofg"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {},
        },
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "v_weapon.TMP_Parent",
                    Offset = {
                        pos = Vector(0, 1.5, 4),
                        ang = Angle(-90, 0, -90),
                    }
                }
            },
            WMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Offset = {
                        pos = Vector(3, 1, 3),
                        ang = Angle(0, -4.211, 0)
                    }
                }
            }
        }
    }

    SWEP.ExtraSightDist = 12

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.TMP_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vang = Angle(-90, 0, -90),
                wpos = Vector(5.36, 0.739, -6.801),
                wang = Angle(-9.738, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(0, -4.6, -1.5),
                vmax = Vector(0, -4.6, 3),
                wmin = Vector(5.36, 0.889, -5.301),
                wmax = Vector(5.36, 0.889, -5.301),
            }
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.TMP_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -4.6, -3),
                vang = Angle(-90, 0, -90),
                wpos = Vector(5.36, 0.739, -6.801),
                wang = Angle(-9.738, 0, 180)
            },
            KeepBaseIrons = true,
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.TMP_Parent",
            Offset = {
                vpos = Vector(0, -3.35, -6),
                vang = Angle(-90, 0, -90),
                wpos = Vector(12, 0.847, -4.761),
                wang = Angle(-10.393, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "style_pistol"},
            Bone = "v_weapon.TMP_Parent",
            Offset = {
                vpos = Vector(0, -2, -3),
                vang = Angle(-90, 0, -90),
                wpos = Vector(10, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
            InstalledEles = {"nofg"},
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.TMP_Parent",
            Offset = {
                vpos = Vector(-0.4, -3, -4), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, -0.4, 0),
                wpos = Vector(8.152, 1.386, -4.666),
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
            DefaultAttName = "No Stock",
            InstalledEles = {"stock"},
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
            Bone = "v_weapon.TMP_Parent",
            Offset = {
                vpos = Vector(-0.5, -3.75, 4.5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(1, 1.5, -3),
                wang = Angle(0, -4.211, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle1",
            Time = 3,
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.7,
        },
        ["fire"] = {
            Source = "fire3",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "idle1",
            Time = 0.25,
            ShellEjectAt = 0,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 2.8,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.25,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_tmp', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'UMP-9'
    SWEP.Trivia_Class = "Submachine Gun"
    SWEP.Trivia_Desc = "Ubiquitous 9mm SMG. Created as a response to the need for a faster-firing and more reliable submachine gun than existing options at the time."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = "9x19mm Para"
    SWEP.Trivia_Mechanism = "Roller-Delayed Blowback"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1968

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_mpk1.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_mpk1.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 26
    SWEP.DamageMin = 19 -- damage done at maximum range
    SWEP.Range = 65 -- in METRES
    SWEP.Penetration = 4
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 400 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 30 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 60
    SWEP.ReducedClipSize = 15

    SWEP.RevolverReload = false -- cases all eject on reload

    SWEP.OpenBolt = false -- gun fires at the end of 

    SWEP.Recoil = 0.35
    SWEP.RecoilSide = 0.2
    SWEP.VisualRecoilMult = 1

    SWEP.Delay = 60 / 850 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 2,
        },
        {
            Mode = -2,
            RunawayBurst = true,
            Override_ShotRecoilTable = {
                [1] = 0.75
            }
        },
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_smg1"
    SWEP.NPCWeight = 150

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 300 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "mpk1" -- the magazine pool this gun draws from

    SWEP.ShootVol = 100 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/mp7/mp7_02.wav"
    SWEP.ShootSound = "weapons/arccw/mp7/mp7_04.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/mp5/mp5_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/mp7/mp7-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_mp5"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.25

    SWEP.SpeedMult = 0.97
    SWEP.SightedSpeedMult = 0.75

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-8.728, -13.702, 4.014),
        Ang = Angle(-1.397, -0.341, -2.602),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
        AnchorBone = "v_weapon.ump45_Parent"
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
            WMBodygroups = {},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {},
        },
        ["nors"] = {
            VMBodygroups = {{ind = 3, bg = 1}},
            WMBodygroups = {},
        },
        ["nofg"] = {
            VMBodygroups = {{ind = 4, bg = 1}},
            WMBodygroups = {},
        }
    }

    SWEP.ExtraSightDist = 2

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.ump45_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.373, -8.193, -1.633), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -88.032),
                wpos = Vector(4.762, 0.832, -6.402),
                wang = Angle(-10.393, 0, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(0.373, -8.393, -0.520),
                vmax = Vector(0.373, -8.393, -3.937),
                wmin = Vector(4.762, 0.832, -6.402),
                wmax = Vector(9.09, 0.832, -7.179),
            },
            InstalledEles = {"nors"},
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.ump45_Parent",
            Offset = {
                vpos = Vector(0.156, -5.908, -16.004),
                vang = Angle(-90, 0, -90),
                wpos = Vector(16.791, 0.847, -6.461),
                wang = Angle(-10.393, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "ubgl", "bipod", "style_pistol"},
            Bone = "v_weapon.ump45_Parent",
            Offset = {
                vpos = Vector(0, -5, -10),
                vang = Angle(-90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
            InstalledEles = {"nofg"},
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.ump45_Parent",
            Offset = {
                vpos = Vector(-0.461, -5.827, -12.068), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, 0),
                wpos = Vector(13.152, 1.386, -5.566),
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
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.ump45_Parent",
            Offset = {
                vpos = Vector(-0.3, -6.25, 1), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(4, 1.5, -4.5),
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
        ["idle"] = false,
        ["draw"] = {
            Source = "draw",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/ump45/ump45_draw.wav",
                t = 0
                }
            }
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/ump45/ump45_draw.wav",
                t = 0
                }
            }
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2", "shoot3"},
            Time = 0.25,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "shoot_empty",
            Time = 0.25,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.25,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_empty",
            Time = 0.25,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {37},
            FrameRate = 33,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Checkpoints = {37, 85},
            FrameRate = 33,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_ump9', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_ump9"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'UMP 45'
    SWEP.Trivia_Class = "Submachine Gun"
    SWEP.Trivia_Desc = ".45 calibre version of the MP-K1. Packs a greater punch at short range, but has a worse fire rate."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = ".45 ACP"
    SWEP.Trivia_Mechanism = "Roller-Delayed Blowback"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1977

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_mps2.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_mps2.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 33
    SWEP.DamageMin = 20 -- damage done at maximum range
    SWEP.Range = 75 -- in METRES
    SWEP.Penetration = 3
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 300 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 25 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 40
    SWEP.ReducedClipSize = 12

    SWEP.RevolverReload = false -- cases all eject on reload

    SWEP.OpenBolt = false -- gun fires at the end of 

    SWEP.Recoil = 0.4
    SWEP.RecoilSide = 0.2
    SWEP.VisualRecoilMult = 1

    SWEP.Delay = 60 / 600 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "mpk1" -- the magazine pool this gun draws from

    SWEP.ShootVol = 100 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/ump45/ump45_04.wav"
    SWEP.ShootSound = "weapons/arccw/ump45/ump45_02.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/ump45/ump45-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_smg"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.75

    SWEP.NPCWeaponType = "weapon_smg1"
    SWEP.NPCWeight = 200

AMB.ArcCW.AddWeapon( 'arccw_ump45', SWEP )