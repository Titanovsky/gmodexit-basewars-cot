local Lang = AMB.Language.AddBetweenRusAndEng

local category = Lang( '#arccw_category_pistoles', '[ArcCW] Пистолеты', '[ArcCW] Pistolets' )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'G2 Contender'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = "Break action pistol in a full-sized rifle round. Offers incredible power, but at the cost of poor range due to an insufficiently sized barrel for the cartridge."
    SWEP.Trivia_Manufacturer = "Jonathan/Kruger"
    SWEP.Trivia_Calibre = ".308 Winchester"
    SWEP.Trivia_Mechanism = "Break-Action"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1967

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_contender.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_contender.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 105
    SWEP.DamageMin = 50 -- damage done at maximum range
    SWEP.Range = 35 -- in METRES
    SWEP.Penetration = 12
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 2000 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 0 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 1 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 1
    SWEP.ReducedClipSize = 1

    SWEP.Recoil = 3
    SWEP.RecoilSide = 0.85

    SWEP.Delay = 60 / 90 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            PrintName = "SNGL",
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_357"
    SWEP.NPCWeight = 50

    SWEP.ManualAction = false

    SWEP.AccuracyMOA = 0.3 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "SniperPenetratedRound" -- what ammo type the gun uses
    SWEP.MagID = "contender" -- the magazine pool this gun draws from

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 110 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/g2contender/scout-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m4a1/m4a1_silencer_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/ssg08/ssg08-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_1"
    SWEP.ShellModel = "models/shells/shell_762nato.mdl"
    SWEP.ShellPitch = 90
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 1
    SWEP.SightedSpeedMult = 0.7

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = true

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-3.01, 5, 0.38),
        Ang = Angle(-0.5, 0, 0),
        Magnification = 1.2,
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW

    SWEP.ActivePos = Vector(1, 12, -2)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(3.5, 6, -2)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 20
    SWEP.AttachmentElements = {
    }

    SWEP.ExtraSightDist = 5

    SWEP.Hook_SelectReloadAnimation = function(wep, anim)
        if wep:GetBuff_Mult("Mult_ReloadTime") > 0.9 then return end

        if anim == "reload_empty" then return "reload_empty_fast" end
    end

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_sniper", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "Front", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(1, -2, 0), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 0, -90),
                wpos = Vector(8, 0.739, -5.2),
                wang = Angle(-10, 0, 180)
            }
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "Front",
            Offset = {
                vpos = Vector(15, -1.3, 0),
                vang = Angle(0, 0, -90),
                wpos = Vector(23, 0.8, -7.25),
                wang = Angle(-10, 0, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "bipod", "style_pistol"},
            Bone = "Front",
            Offset = {
                vpos = Vector(2, 0.25, 0),
                vang = Angle(0, 0, -90),
                wpos = Vector(10, 1.84, -3.138),
                wang = Angle(-10, -3.3, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "Front",
            Offset = {
                vpos = Vector(3, -0.75, 0.75), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 0, 180),
                wpos = Vector(10.625, 0.053, -4.298),
                wang = Angle(-10, -0.556, 90)
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
            Bone = "Gun", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-1.5, -0.5, -0.5), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 0, -90),
                wpos = Vector(6, 1.2, -3),
                wang = Angle(-10, 0, 180)
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
            Source = "ready",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.7,
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.7,
        },
        ["fire"] = {
            Source = "shoot",
            Time = 0.6,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty_fast"] = {
            Source = "reload_fast",
            Time = 2.25,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        }
    }

AMB.ArcCW.AddWeapon( 'arccw_contender', SWEP )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Desert Eagle .50'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = ".50 Calibre heavy automatic pistol, designed for self-defense against large wild animals such as grizzly bears. A rotating-bolt gas-operated design makes it able to handle the huge round, resembling an assault rifle more than a handgun."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = ".50 Action Express"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "USA/Israel"
    SWEP.Trivia_Year = 1991

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_gce.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_gce.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.DefaultSkin = 1

    SWEP.Damage = 81
    SWEP.DamageMin = 40 -- damage done at maximum range
    SWEP.Range = 45 -- in METRES
    SWEP.Penetration = 12
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 500 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 7 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 12
    SWEP.ReducedClipSize = 5

    SWEP.Recoil = 4
    SWEP.RecoilSide = 1
    SWEP.RecoilRise = 1
    SWEP.MaxRecoilBlowback = 2

    SWEP.Delay = 60 / 500 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_357"
    SWEP.NPCWeight = 75

    SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "357" -- what ammo type the gun uses
    SWEP.MagID = "gce" -- the magazine pool this gun draws from

    SWEP.ShootVol = 130 -- volume of shoot sound
    SWEP.ShootPitch = 95 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/deagle/deagle_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/deagle/deagle-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_pistol_deagle"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 2
    SWEP.ShellPitch = 85

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.225

    SWEP.SpeedMult = 0.975
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
        Pos = Vector(-6.356, -9.935, 2.066),
        Ang = Angle(0.416, -0.015, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER

    SWEP.ActivePos = Vector(-2, 0, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(-2, -7.145, -11.561)
    SWEP.HolsterAng = Angle(36.533, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.ExtraSightDist = 15

    SWEP.AttachmentElements = {
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "v_weapon.Deagle_Parent",
                    Offset = {
                        pos = Vector(0.1, 2, -0.35),
                        ang = Angle(-90, 0, -90)
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
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.Deagle_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.032, -4.529, -3.604), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(8.873, 1.927, -4.648),
                wang = Angle(0, -4.211, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(0.032, -4.529, -3.604),
                vmax = Vector(0.032, -4.529, -6.109),
                wmin = Vector(8.873, 1.927, -4.648),
                wmax = Vector(10.869, 2.089, -4.648),
            },
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.Deagle_Parent",
            Offset = {
                vpos = Vector(0.029, -4.269, -7.755),
                vang = Angle(-90, 0, -90),
                wpos = Vector(12.829, 2.275, -4.428),
                wang = Angle(0, -4.211, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "v_weapon.Deagle_Parent",
            Offset = {
                vpos = Vector(-0.087, -2.287, -1.505),
                vang = Angle(-90, 0, -90),
                wpos = Vector(7.238, 1.641, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "v_weapon.Deagle_Parent",
            Offset = {
                vpos = Vector(0.03, -2.774, -3.579), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(11.711, 2.187, -3.064),
                wang = Angle(0, -4.211, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(0.03, -2.774, -3.579),
                vmax = Vector(0.03, -2.774, -6.196),
                wmin = Vector(8.873, 1.927, -3.029),
                wmax = Vector(9.406, 2.003, -3.029),
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
            Bone = "v_weapon.Deagle_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.5, -3.5, -6.75), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(12, 2.5, -4),
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
        ["ready"] = {
            Source = "ready",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            }
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            }
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2"},
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "shoot_last",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_last",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {24, 39, 47},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.9,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 2.75,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {24, 39, 47},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.9,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_deagle50', SWEP )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Desert Eagle .357'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = ".357 Magnum heavy automatic pistol, designed for self-defense against large wild animals such as grizzly bears. A rotating-bolt gas-operated design makes it able to handle the huge round, resembling an assault rifle more than a handgun. Lighter, higher-capacity version of the Century Eagle."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = ".357 Magnum"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "USA/Israel"
    SWEP.Trivia_Year = 1991

    SWEP.Slot = 1

    SWEP.ViewModel = "models/weapons/arccw/c_gce.mdl"
    SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"

    SWEP.DefaultSkin = 0

    SWEP.Damage = 55
    SWEP.DamageMin = 35 -- damage done at maximum range
    SWEP.Range = 35 -- in METRES
    SWEP.Penetration = 8
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 500 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 9 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 15
    SWEP.ReducedClipSize = 7

    SWEP.Recoil = 3
    SWEP.RecoilSide = 1
    SWEP.RecoilRise = 1
    SWEP.MaxRecoilBlowback = 2

    SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 150 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "357" -- what ammo type the gun uses
    SWEP.MagID = "gce" -- the magazine pool this gun draws from

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 105 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/deagle/deagle_02.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/deagle/deagle-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_pistol_deagle"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 2
    SWEP.ShellPitch = 90

    SWEP.Delay = 60 / 500 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_357"
    SWEP.NPCWeight = 75

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.225

    SWEP.SpeedMult = 0.975
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
        Pos = Vector(-6.356, -9.935, 2.066),
        Ang = Angle(0.416, -0.015, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER

    SWEP.ActivePos = Vector(-2, 0, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(-2, -7.145, -11.561)
    SWEP.HolsterAng = Angle(36.533, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.ExtraSightDist = 15

    SWEP.AttachmentElements = {
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "v_weapon.Deagle_Parent",
                    Offset = {
                        pos = Vector(0.1, 2, -0.35),
                        ang = Angle(-90, 0, -90)
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
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.Deagle_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.032, -4.529, -3.604), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(8.873, 1.927, -4.648),
                wang = Angle(0, -4.211, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(0.032, -4.529, -3.604),
                vmax = Vector(0.032, -4.529, -6.109),
                wmin = Vector(8.873, 1.927, -4.648),
                wmax = Vector(10.869, 2.089, -4.648),
            },
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.Deagle_Parent",
            Offset = {
                vpos = Vector(0.029, -4.269, -7.755),
                vang = Angle(-90, 0, -90),
                wpos = Vector(12.829, 2.275, -4.428),
                wang = Angle(0, -4.211, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "v_weapon.Deagle_Parent",
            Offset = {
                vpos = Vector(-0.087, -2.287, -1.505),
                vang = Angle(-90, 0, -90),
                wpos = Vector(7.238, 1.641, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "v_weapon.Deagle_Parent",
            Offset = {
                vpos = Vector(0.03, -2.774, -3.579), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(11.711, 2.187, -3.064),
                wang = Angle(0, -4.211, 180)
            },
            SlideAmount = { -- how far this attachment can slide in both directions.
                -- overrides Offset.
                vmin = Vector(0.03, -2.774, -3.579),
                vmax = Vector(0.03, -2.774, -6.196),
                wmin = Vector(8.873, 1.927, -3.029),
                wmax = Vector(9.406, 2.003, -3.029),
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
            Bone = "v_weapon.Deagle_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.5, -3.5, -6.75), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(12, 2.5, -4),
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
        ["ready"] = {
            Source = "ready",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            }
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            }
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2"},
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "shoot_last",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_last",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {24, 39, 47},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.9,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 2.75,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {24, 39, 47},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.9,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_deagle357', SWEP )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Five-Seven'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = "5.7mm self loading pistol, designed as a handgun counterpart to the PDW-57. 'NXS' stands for 'New eXperimental Sidearm'."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = "5.7mm PDW"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1989

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_nxs.mdl"
    SWEP.WorldModel = "models/weapons/w_pist_fiveseven.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 25
    SWEP.DamageMin = 15 -- damage done at maximum range
    SWEP.Range = 50 -- in METRES
    SWEP.Penetration = 5
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 400 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = true
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 20 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 35
    SWEP.ReducedClipSize = 10

    SWEP.Recoil = 0.75
    SWEP.RecoilSide = 0.2
    SWEP.VisualRecoilMult = 1
    SWEP.RecoilRise = 2

    SWEP.Delay = 60 / 900 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_pistol"
    SWEP.NPCWeight = 75

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses
    SWEP.MagID = "sp40" -- the magazine pool this gun draws from

    SWEP.ShootVol = 115 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/fiveseven/fiveseven-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/fiveseven/fiveseven-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_ak74"
    SWEP.ShellModel = "models/shells/shell_57.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.175

    SWEP.SpeedMult = 1
    SWEP.SightedSpeedMult = 0.9

    SWEP.BarrelLength = 18

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-6.02, -9.155, 2.973),
        Ang = Angle(-0.456, 0.03, 0),
        Magnification = 1.1,
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

    SWEP.AttachmentElements = {
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "v_weapon.FIVESEVEN_PARENT",
                    Offset = {
                        pos = Vector(0, 2, -0.35),
                        ang = Angle(-90, 0, -90)
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
    -- ["name"] = {ind = 1, bg = 1}
    -- same as ACT3

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = "optic_lp", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.FIVESEVEN_SLIDE", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, 0.639, -0.491), -- offset that the attachment will be relative to the bone
                vang = Angle(0, -90, 180),
                wpos = Vector(4.129, 1.476, -4.116),
                wang = Angle(-2.829, -4.902, 180)
            },
            CorrectiveAng = Angle(0, 180, 0)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.FIVESEVEN_PARENT",
            Offset = {
                vpos = Vector(0, -2.942, -9.121),
                vang = Angle(-90, 0, -90),
                wpos = Vector(10.329, 2.075, -3.928),
                wang = Angle(0, -4.211, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "v_weapon.FIVESEVEN_PARENT",
            Offset = {
                vpos = Vector(0, -1.9, -5),
                vang = Angle(-90, 0, -90),
                wpos = Vector(7.238, 1.641, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "v_weapon.FIVESEVEN_PARENT",
            Offset = {
                vpos = Vector(0, -2, -8), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(9.3, 1.9, -2.664),
                wang = Angle(0, -4.211, 180)
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
            Bone = "v_weapon.FIVESEVEN_PARENT", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.3, -2.75, -7.5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(9, 2.25, -3.75),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = false,
        ["ready"] = {
            Source = "ready",
            Time = 1,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/fiveseven/fiveseven_draw.wav",
                t = 0
                }
            },
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/fiveseven/fiveseven_draw.wav",
                t = 0
                }
            },
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = {"shoot_1", "shoot_2"},
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "shoot_empty",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_empty",
            Time = 0.4,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {20, 26, 40, 60},
            FrameRate = 37,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {20, 26, 40, 60, 80},
            FrameRate = 37,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_fiveseven', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'M92FS'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = "9mm self-loading pistol. Cheap firearm popular among gangsters. Reliable, but not overall very special."
    SWEP.Trivia_Manufacturer = "ArmItalia"
    SWEP.Trivia_Calibre = "9x19mm Para"
    SWEP.Trivia_Mechanism = "Locking Block"
    SWEP.Trivia_Country = "Italy"
    SWEP.Trivia_Year = 1975

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_knox.mdl"
    SWEP.WorldModel = "models/weapons/w_pist_elite_single.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 27
    SWEP.DamageMin = 19 -- damage done at maximum range
    SWEP.Range = 30 -- in METRES
    SWEP.Penetration = 4
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 350 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 15 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 30
    SWEP.ReducedClipSize = 10

    SWEP.Recoil = 0.6
    SWEP.RecoilSide = 0.175
    SWEP.RecoilRise = 2

    SWEP.Delay = 60 / 800 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_pistol"
    SWEP.NPCWeight = 200

    SWEP.AccuracyMOA = 15 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "knox" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/elite/elites_04.wav"
    SWEP.ShootSound = "weapons/arccw/elite/elites_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/elite/elite-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_pistol"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.175

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
        Pos = Vector(-6.59, -11.667, 2.927),
        Ang = Angle(-0.086, 0.014, 0),
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

    SWEP.ExtraSightDist = 15

    SWEP.AttachmentElements = {
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "v_weapon.elite_right",
                    Offset = {
                        pos = Vector(0, 2.5, -0.35),
                        ang = Angle(90, 0, -90),
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
        },
        ["fcg_burst"] = {
            TrueNameChange = "M93R",
            NameChange = "Ratto",
        }
    }

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = "optic_lp", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.slide_right", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -0.57, -4.095), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(4.129, 1.476, -4.516),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.elite_right",
            Offset = {
                vpos = Vector(0, -2.896, 7.66),
                vang = Angle(90, 0, -90),
                wpos = Vector(11.074, 2.104, -4.581),
                wang = Angle(-1.4, -3.3, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "v_weapon.elite_right",
            Offset = {
                vpos = Vector(-0.154, -1.849, 4.126),
                vang = Angle(90, 0, -90),
                wpos = Vector(6.973, 1.84, -2.138),
                wang = Angle(-1.4, -3.3, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "v_weapon.elite_right",
            Offset = {
                vpos = Vector(0, -1.471, 5.849), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(9.147, 1.965, -3.096),
                wang = Angle(-1.4, -3.3, 180)
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
            Bone = "v_weapon.slide_right", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.4, 0, -2), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(8, 2.3, -3.5),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = false,
        ["ready"] = {
            Source = "draw",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/glock18/glock_draw.wav",
                t = 0
                }
            },
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/glock18/glock_draw.wav",
                t = 0
                }
            },
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
        },
        ["fire"] = {
            Source = "shoot",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "shoot_empty",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_empty",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {20, 26, 40},
            FrameRate = 25,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 2.25,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {18, 37, 40, 50},
            FrameRate = 25,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.6,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_m9', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Makarov'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = "Soviet self-loading pistol. Incredibly widespread in Ex-Soviet areas. Distributed to military officers and police units. Low damage, but low recoil and fast to reload."
    SWEP.Trivia_Manufacturer = "Kremen Oruzhiye"
    SWEP.Trivia_Calibre = "9x18mm Soviet"
    SWEP.Trivia_Mechanism = "Recoil-Operated"
    SWEP.Trivia_Country = "USSR"
    SWEP.Trivia_Year = 1951

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_pmt.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_pmt.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 23
    SWEP.DamageMin = 18 -- damage done at maximum range
    SWEP.Range = 35 -- in METRES
    SWEP.Penetration = 2
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 350 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 8 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 16
    SWEP.ReducedClipSize = 4

    SWEP.Recoil = 0.4
    SWEP.RecoilSide = 0.2
    SWEP.RecoilRise = 2
    SWEP.VisualRecoilMult = 1

    SWEP.Delay = 60 / 900 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_pistol"
    SWEP.NPCWeight = 200

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 200 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 100

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "pmt" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/hkp2000/hkp2000-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/hkp2000/hkp2000-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_6"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.45

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
        Pos = Vector(-2.618, 0, 1.172),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

    SWEP.ActivePos = Vector(1, 4, -1)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(1, 2, -11.561)
    SWEP.HolsterAng = Angle(36.533, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.ExtraSightDist = 10

    SWEP.AttachmentElements = {
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "Weapon_Main",
                    Offset = {
                        pos = Vector(-0.05, 2, 0.25),
                        ang = Angle(90, 0, -90),
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
            Bone = "Weapon_Bolt", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -0.7, 1.1), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(3, 0.7, -3),
                wang = Angle(-10, 0, 180)
            },
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0, -2.6, 7.599),
                vang = Angle(90, 0, -90),
                wpos = Vector(8.25, 0.7, -3.528),
                wang = Angle(-10, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0.1, -1.358, 5.026),
                vang = Angle(90, 0, -90),
                wpos = Vector(7.238, 0.7, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0, -1.8, 6.6), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(8, 0.7, -2.764),
                wang = Angle(-10, 0, 180)
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
            Bone = "Weapon_Bolt", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.4, 0, 5), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(7.5, 1, -3.5),
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
            Source = "fire_empty",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "fire_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "fire_iron_empty",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 1.75,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {23, 50, 70},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.3,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 2.25,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {23, 50, 70},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.3,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_makarov', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'P228'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = "9mm self-loading pistol with reliable mechanism. "
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "9x19mm Parabellum"
    SWEP.Trivia_Mechanism = "Recoil-Operated"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1983

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_sigma.mdl"
    SWEP.WorldModel = "models/weapons/w_pist_p228.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 27
    SWEP.DamageMin = 19 -- damage done at maximum range
    SWEP.Range = 50 -- in METRES
    SWEP.Penetration = 4
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 350 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 13 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 26
    SWEP.ReducedClipSize = 8

    SWEP.Recoil = 0.85
    SWEP.RecoilSide = 0.275
    SWEP.RecoilRise = 2

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

    SWEP.NPCWeaponType = "weapon_pistol"
    SWEP.NPCWeight = 150

    SWEP.AccuracyMOA = 20 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 200 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "ppa" -- the magazine pool this gun draws from

    SWEP.ShootVol = 110 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/p250/p250_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/p250/p250-1-distant.wav"

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
        Pos = Vector(-6.342, -6.618, 2.9),
        Ang = Angle(-0.484, -0.094, 0),
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
                    Bone = "v_weapon.P228_Parent",
                    Offset = {
                        pos = Vector(0, 1.5, 3.25),
                        ang = Angle(-90, 0, -90)
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
            Bone = "v_weapon.P228_Slide", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.05, -0.4, -0.5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(4.129, 1.476, -4.516),
                wang = Angle(-2.829, -4.902, 180)
            },
            CorrectivePos = Vector(0, 0, 0)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.P228_Parent",
            Offset = {
                vpos = Vector(0.064, -3.942, -5.121),
                vang = Angle(-90, 0, -90),
                wpos = Vector(9.5, 2, -4),
                wang = Angle(-3, -5, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "v_weapon.P228_Parent",
            Offset = {
                vpos = Vector(0.3, -2.1, -2.5),
                vang = Angle(-90, 0, -90),
                wpos = Vector(7.238, 1.641, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "v_weapon.P228_Parent",
            Offset = {
                vpos = Vector(0.041, -2.75, -3.783), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(11.711, 2.187, -3.064),
                wang = Angle(0, -4.211, 180)
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
            Bone = "v_weapon.P228_Slide", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.4, 0.1, -5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(8, 2.3, -3.5),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = {
            Source = "idle",
            Time = 1
        },
        ["idle_empty"] = {
            Source = "idle_empty",
            Time = 1
        },
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
            Source = {"shoot_1", "shoot_2", "shoot_3"},
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "shoot_empty",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_empty",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {28, 41, 53},
            FrameRate = 35,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.3,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {28, 41, 53},
            FrameRate = 35,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.3,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_p228', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Raging Bull'
    SWEP.Trivia_Class = "Revolver"
    SWEP.Trivia_Desc = "Popular, reliable double-action revolver, able to switch to single-action for improved precision. While semi-automatics may hold more rounds and be no less reliable, a cylinder full of magnum rounds is still an intimidating sight. Did you fire six shots, or only five?"
    SWEP.Trivia_Manufacturer = "Taurus International"
    SWEP.Trivia_Calibre = ".44 Magnum"
    SWEP.Trivia_Mechanism = "Double/Single Action"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1997

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_ragingbull_new.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_ragingbull.mdl"
    SWEP.ViewModelFOV = 70

    SWEP.DefaultSkin = 1

    SWEP.Damage = 75
    SWEP.DamageMin = 45 -- damage done at maximum range
    SWEP.Range = 40 -- in METRES
    SWEP.Penetration = 10
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 500 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = false
    SWEP.ChamberSize = 0 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 6 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 6
    SWEP.ReducedClipSize = 4

    SWEP.Recoil = 2.5
    SWEP.RecoilSide = 1
    SWEP.RecoilRise = 1.8
    SWEP.VisualRecoilMult = 0.5

    SWEP.Delay = 60 / 180 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            PrintName = "DACT",
            Mode = 1,
        },
        {
            PrintName = "SACT",
            Mode = 1,
            Override_ManualAction = true,
            Mult_AccuracyMOA = 0.3,
            Mult_HipDispersion = 0.7,
            Mult_RPM = 1 / 3,
        }
    }

    SWEP.NPCWeaponType = {"weapon_pistol", "weapon_357"}
    SWEP.NPCWeight = 75

    SWEP.AccuracyMOA = 7 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 350 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "357" -- what ammo type the gun uses
    SWEP.MagID = "ragingbull" -- the magazine pool this gun draws from

    SWEP.ShootVol = 100 -- volume of shoot sound
    SWEP.ShootPitch = 95 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/revolver/revolver-1_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/revolver/revolver-1_distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_pistol_deagle"

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 0 -- which attachment to put the case effect on

    SWEP.RevolverReload = true

    SWEP.SightTime = 0.28

    SWEP.SpeedMult = 0.975
    SWEP.SightedSpeedMult = 0.75

    SWEP.BarrelLength = 18

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.BulletBones = {
        [1] = "1lead",
        [2] = "2lead",
        [3] = "3lead",
        [4] = "4lead",
        [5] = "5lead",
        [6] = "6lead",
    }

    SWEP.CaseBones = {
        [1] = "1",
        [2] = "2",
        [3] = "3",
        [4] = "4",
        [5] = "5",
        [6] = "6",
    }


    SWEP.IronSightStruct = {
        Pos = Vector(-2.141, 0, -0.601),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER

    SWEP.ActivePos = Vector(1, 4, -1)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.CustomizePos = Vector(10, 3, -5)

    SWEP.HolsterPos = Vector(2, 0, -10)
    SWEP.HolsterAng = Angle(45, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.ExtraSightDist = 10

    SWEP.AttachmentElements = {
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "Body",
                    Offset = {
                        pos = Vector(0, 3.5, 4),
                        ang = Angle(-90, 0, -90),
                    }
                }
            },
            WMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Offset = {
                        pos = Vector(2, 1, 0),
                        ang = Angle(0, -4.211, 0)
                    }
                }
            }
        }
    }

    SWEP.Attachments = {
        {
            PrintName = "Optic",
            DefaultAttName = "Iron Sights",
            Slot = {"optic_lp", "optic"},
            Bone = "Body",
            Offset = {
                vpos = Vector(0.032, -4.029, -3.604),
                vang = Angle(-90, 0, -90),
                wpos = Vector(8.873, 1.927, -4.648),
                wang = Angle(0, 0, 180)
            },
            SlideAmount = {
                vmin = Vector(0.032, -2, -2),
                vmax = Vector(0.032, -2, -6),
                wmin = Vector(9, 1, -4.648),
                wmax = Vector(12, 1, -4.648),
            },
            CorrectiveAng = nil --Angle(90, 0, -90)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "Body",
            Offset = {
                vpos = Vector(0, -1.4, -9.5),
                vang = Angle(-90, 0, -90),
                wpos = Vector(15.2, 1, -4.3),
                wang = Angle(0, 0, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "style_pistol"},
            Bone = "Body",
            Offset = {
                vpos = Vector(0, -0.5, -6),
                vang = Angle(-90, 0, -90),
                wpos = Vector(11, 1, -3.4),
                wang = Angle(180, 0, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "Body",
            Offset = {
                vpos = Vector(0, -0.5, -10.5),
                vang = Angle(-90, 0, -90),
                wpos = Vector(15, 1, -3.4),
                wang = Angle(0, 0, 180)
            }
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
            PrintName = "Ammo Type",
            Slot = "ammo_bullet",
        },
        {
            PrintName = "Perk",
            Slot = {"perk", "perk_revolver"}
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "Body",
            Offset = {
                vpos = Vector(-0.2, -1.25, -4.5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(10, 1.25, -4),
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

    SWEP.Hook_SelectReloadAnimation = function(wep, anim)
        if wep:GetCurrentFiremode().Override_ManualAction then
            return "reload_sact"
        end
    end

    --[[ Insert into sh_attach, line 100
    if buff != "Override_Firemodes" then -- GetCurrentFiremode() calls ourselves. Don't cause infinite recursion!
        local cfm = self:GetCurrentFiremode()

        if cfm[buff] and level == 0 or (cfm[buff .. "_Priority"] and cfm[buff .. "_Priority"] > level) then
            current = cfm[buff]
            level = cfm[buff .. "_Priority"] or 1
            winningslot = -1 -- ???
        end
    end
    ]]

    SWEP.Animations = {
        ["idle"] = false,
        ["draw"] = {
            Source = "draw",
            Time = 0.7,
            SoundTable = {
                {
                s = "weapons/arccw/usp/usp_draw.wav",
                t = 0
                }
            }
        },
        ["ready"] = {
            Source = "ready",
            Time = 1.4,
            SoundTable = {
                {
                s = "weapons/arccw/ragingbull/draw.mp3",
                t = 0
                }
            }
        },
        ["fire"] = {
            Source = "shoot",
            Time = 1
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.7
        },
        ["reload"] = {
            Source = "reload",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 1,
            LastClip1OutTime = 1,
        },
        ["reload_sact"] = {
            Source = "reload_sact",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 1,
            LastClip1OutTime = 1,
        },
        ["bash"] = {
            Source = "bash",
            Time = 0.8
        },
        ["cycle"] = {
            Source = "cycle",
            Time = 0.8,
            LHIK = true,
            LHIKIn = 0.15,
            LHIKOut = 0.15,
        },
        ["1_to_2"] = {
            Source = "cycle",
            Time = 0.7,
            LHIK = true,
            LHIKIn = 0.15,
            LHIKOut = 0.15,
        },
        ["2_to_1"] = {
            Source = "uncycle",
            Time = 0.7,
            LHIK = true,
            LHIKIn = 0.15,
            LHIKOut = 0.15,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_ragingbull', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'USP .40'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = ".40 Caliber semi automatic pistol. Commonly used among police and popular with civilians for its reliability."
    SWEP.Trivia_Manufacturer = "Auschen Waffenfabrik"
    SWEP.Trivia_Calibre = ".40 S&W"
    SWEP.Trivia_Mechanism = "Short Recoil"
    SWEP.Trivia_Country = "Austria"
    SWEP.Trivia_Year = 1993

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_sp40.mdl"
    SWEP.WorldModel = "models/weapons/w_pist_usp.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 35
    SWEP.DamageMin = 20 -- damage done at maximum range
    SWEP.Range = 35 -- in METRES
    SWEP.Penetration = 3
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 300 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = true
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 12 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 24
    SWEP.ReducedClipSize = 8

    SWEP.Recoil = 0.8
    SWEP.RecoilSide = 0.2
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

    SWEP.NPCWeaponType = "weapon_pistol"
    SWEP.NPCWeight = 100

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "sp40" -- the magazine pool this gun draws from

    SWEP.ShootVol = 115 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/usp/usp_unsilenced_03.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "weapons/arccw/hkp2000/hkp2000-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_pistol"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.175

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
        Pos = Vector(-5.974, -5.643, 2.72),
        Ang = Angle(-0.116, 0.014, 0),
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

    SWEP.AttachmentElements = {
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "v_weapon.USP_Parent",
                    Offset = {
                        pos = Vector(0, 1.5, 3.25),
                        ang = Angle(-90, 0, -90)
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

    SWEP.ExtraSightDist = 7

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = "optic_lp", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.USP_Slide", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.13, -0.7, 0.5), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(4.129, 1.476, -4.216),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "v_weapon.USP_Parent",
            Offset = {
                vpos = Vector(-0.140, -3.761, -5.370),
                vang = Angle(-90, 0, -90),
                wpos = Vector(9.829, 2.275, -3.828),
                wang = Angle(-2, -4.211, 0)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "v_weapon.USP_Parent",
            Offset = {
                vpos = Vector(-0.257, -1.994, -2.113),
                vang = Angle(-90, 0, -90),
                wpos = Vector(7.238, 1.641, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "v_weapon.USP_Parent",
            Offset = {
                vpos = Vector(-0.095, -2.546, -3.918), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(11.711, 2.187, -3.064),
                wang = Angle(0, -4.211, 180)
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
            Bone = "v_weapon.USP_Slide", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.5, 0.1, -4), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(8, 2.3, -3.5),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = false,
        ["ready"] = {
            Source = "ready",
            Time = 1
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/hkp2000/hkp2000_draw.wav",
                t = 0
                }
            }
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/hkp2000/hkp2000_draw.wav",
                t = 0
                }
            }
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2", "shoot3"},
            Time = 1,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "shoot_last",
            Time = 1,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 1,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_last",
            Time = 1,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {20, 26, 40, 60},
            FrameRate = 37,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.75,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {20, 26, 40, 60, 80},
            FrameRate = 37,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.75,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_usp', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = "Ruger"
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = "A small caliber plinking weapon. Its cartridge is hardly lethal, but sports high precision and minimal recoil."
    SWEP.Trivia_Manufacturer = "ArmStrike USA"
    SWEP.Trivia_Calibre = ".22 LR"
    SWEP.Trivia_Mechanism = "Blowback"
    SWEP.Trivia_Country = "United States"
    SWEP.Trivia_Year = 2004

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_ruger_new.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_ruger.mdl"
    SWEP.ViewModelFOV = 65

    SWEP.Damage = 15
    SWEP.DamageMin = 5 -- damage done at maximum range
    SWEP.Range = 25 -- in METRES
    SWEP.Penetration = 1
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 200 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = true
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 12 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 30
    SWEP.ReducedClipSize = 8

    SWEP.Recoil = 0.25
    SWEP.RecoilSide = 0.2
    SWEP.RecoilRise = 0.3

    SWEP.Delay = 60 / 700 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_pistol"
    SWEP.NPCWeight = 150

    SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "ruger" -- the magazine pool this gun draws from

    SWEP.ShootVol = 90 -- volume of shoot sound
    SWEP.ShootPitch = 105 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/ruger/ruger-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/usp/usp_01.wav"
    SWEP.DistantShootSound = "" --"weapons/arccw/hkp2000/hkp2000-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_pistol"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.12

    SWEP.SpeedMult = 1
    SWEP.SightedSpeedMult = 0.85

    SWEP.BarrelLength = 12

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-2.8, -1, 1.789),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

    SWEP.ActivePos = Vector(0, 4, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.CustomizePos = Vector(8, 3, -4)

    SWEP.HolsterPos = Vector(0, 2, -4)
    SWEP.HolsterAng = Angle(-5, 0, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentElements = {
        ["nors"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
        },
        ["stock"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/stock_fab.mdl",
                    Bone = "smdimport",
                    Offset = {
                        pos = Vector(0, -2, -2.5),
                        ang = Angle(0, -90, 0),
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

    SWEP.ExtraSightDist = 7

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = "optic_lp", -- what kind of attachments can fit here, can be string or table
            Bone = "smdimport", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -1.5, 1.1), -- offset that the attachment will be relative to the bone
                vang = Angle(0, -90, 0),
                wpos = Vector(4.129, 1.476, -3.516),
                wang = Angle(-2.829, -4.902, 180)
            },
            InstalledEles = {"nors"},
            CorrectiveAng = Angle(0, 180, 0)
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle",
            Bone = "smdimport",
            Offset = {
                vpos = Vector(0, 8.5, 0.8),
                vang = Angle(0, -90, 0),
                wpos = Vector(13.629, 2.375, -3.428),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip_pistol", "style_pistol"},
            Bone = "smdimport",
            Offset = {
                vpos = Vector(0, 5, 0),
                vang = Angle(0, -90, 0),
                wpos = Vector(7.238, 1.641, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "smdimport",
            Offset = {
                vpos = Vector(-0.2, 6, 0.85), -- offset that the attachment will be relative to the bone
                vang = Angle(0, -90, -90),
                wpos = Vector(11.711, 2.2, -3.064),
                wang = Angle(0, -4.211, 180)
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
            Bone = "smdimport",
            Offset = {
                vpos = Vector(0.4, 4, 0.75), -- offset that the attachment will be relative to the bone
                vang = Angle(0, -90, 0),
                wpos = Vector(11, 2.5, -3.25),
                wang = Angle(0, -4.211, 180)
            },
            VMScale = Vector(0.5, 0.5, 0.5),
            WMScale = Vector(0.5, 0.5, 0.5)
        },
    }

    SWEP.Animations = {
        ["bash"] = {
            Source = "bash",
            Time = 0.7
        },
        ["bash_empty"] = {
            Source = "bash_empty",
            Time = 0.7
        },
        ["idle"] = {
            Source = "idle",
            Time = 1
        },
        ["idle_empty"] = {
            Source = "idle_empty",
            Time = 1
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.5
        },
        ["ready"] = {
            Source = "ready",
            Time = 1
        },
        ["fire"] = {
            Source = "shoot1",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_empty"] = {
            Source = "shoot_empty",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_empty",
            Time = 0.5,
            ShellEjectAt = 0,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {13, 39, 59},
            FrameRate = 27,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.75,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {13, 39},
            FrameRate = 27,
            LHIK = true,
            LHIKIn = 1,
            LHIKOut = 0.75,
        },
    }


    sound.Add({
        name = "Weapon_Ruger.Clipout",
        channel = CHAN_ITEM,
        volumel = 1.0,
        sound = "weapons/arccw/ruger/ruger_clipout.wav"
    })

    sound.Add({
        name = "Weapon_Ruger.Clipin",
        channel = CHAN_ITEM,
        volumel = 1.0,
        sound = "weapons/arccw/ruger/ruger_clipin.wav"
    })

    sound.Add({
        name = "Weapon_Ruger.Slidepull",
        channel = CHAN_ITEM,
        volumel = 1.0,
        sound = "weapons/arccw/ruger/ruger_slidepull.wav"
    })

    sound.Add({
        name = "Weapon_Ruger.Sliderelease",
        channel = CHAN_ITEM,
        volumel = 1.0,
        sound = "weapons/arccw/ruger/ruger_sliderelease.wav"
    })

AMB.ArcCW.AddWeapon( 'arccw_ruger', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Welrod .45'
    SWEP.Trivia_Class = "Pistol"
    SWEP.Trivia_Desc = ".45 caliber pistol designed to be as silent as absolutely possible. A bolt action allows it to reduce its report by eliminating bolt carrier noise."
    SWEP.Trivia_Manufacturer = "Inter-Services Research Bureau"
    SWEP.Trivia_Calibre = ".45 ACP"
    SWEP.Trivia_Mechanism = "Bolt Action"
    SWEP.Trivia_Country = "Great Britain"
    SWEP.Trivia_Year = 1942

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_welrod.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_welrod.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 55
    SWEP.DamageMin = 20 -- damage done at maximum range
    SWEP.Range = 10 -- in METRES
    SWEP.Penetration = 2
    SWEP.DamageType = DMG_BULLET
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 120 -- projectile or phys bullet muzzle velocity
    -- IN M/S

    SWEP.CanFireUnderwater = true
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 8 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 12
    SWEP.ReducedClipSize = 5

    SWEP.Recoil = 0.8
    SWEP.RecoilSide = 0.2
    SWEP.RecoilRise = 2

    SWEP.ManualAction = true

    SWEP.Delay = 60 / 600 -- 60 / RPM.
    SWEP.Num = 1 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            Mode = 1,
            PrintName = "BOLT"
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_pistol"
    SWEP.NPCWeight = 10

    SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 250

    SWEP.Primary.Ammo = "pistol" -- what ammo type the gun uses
    SWEP.MagID = "welrod" -- the magazine pool this gun draws from

    SWEP.ShootVol = 75 -- volume of shoot sound
    SWEP.ShootPitch = 120 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/mp5/mp5_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/mp5/mp5_01.wav"

    SWEP.MuzzleEffect = "muzzleflash_suppressed"
    SWEP.ShellModel = "models/shells/shell_9mm.mdl"
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SightTime = 0.175

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
        Pos = Vector(-2.81, 5, 1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "normal"
    SWEP.HoldtypeActive = "pistol"
    SWEP.HoldtypeSights = "revolver"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

    SWEP.ActivePos = Vector(1, 8, -2)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(3.5, 6, -2)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentBodygroups = {}
    -- ["name"] = {ind = 1, bg = 1}
    -- same as ACT3

    SWEP.ExtraSightDist = 9

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = "optic_lp", -- what kind of attachments can fit here, can be string or table
            Bone = "Weapon_Main", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -2.25, 6), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(1.829, 0.676, -2.916),
                wang = Angle(-9, 0, 180)
            },
        },
        {
            PrintName = "Barrel",
            DefaultAttName = "Standard Barrel",
            Slot = "barrel",
        },
        {
            PrintName = "Underbarrel",
            Slot = "foregrip_pistol",
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0, -0.5, 5),
                vang = Angle(90, 0, -90),
                wpos = Vector(7.238, 1.641, -2.622),
                wang = Angle(90, -4.211, 0)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac_pistol",
            Bone = "Weapon_Main",
            Offset = {
                vpos = Vector(0, -0.5, 12), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(11.711, 0.67, -2.864),
                wang = Angle(-9, 0, 180)
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
            Bone = "Weapon_Bolt", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(-0.225, -0.125, 0), -- offset that the attachment will be relative to the bone
                vang = Angle(0, 0, -90),
                wpos = Vector(7.5, 1, -3.5),
                wang = Angle(-2.829, -4.902, 180)
            },
        },
    }

    SWEP.Animations = {
        ["idle"] = false,
        ["ready"] = {
            Source = "ready",
            Time = 1
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.75,
            SoundTable = {
                {
                s = "weapons/arccw/hkp2000/hkp2000_draw.wav",
                t = 0
                }
            }
        },
        ["cycle"] = {
            Source = "cycle",
            Time = 1,
            ShellEjectAt = 0.5,
            LHIK = true,
            LHIKIn = 0.2,
            LHIKOut = 0.2,
        },
        ["fire"] = {
            Source = "shoot",
            Time = 1,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 1,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.25,
            LHIKOut = 0.75,
        },
        ["reload_empty"] = {
            Source = "reload_empty",
            Time = 3.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
            Checkpoints = {},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.25,
            LHIKOut = 0.75,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_welrod', SWEP )