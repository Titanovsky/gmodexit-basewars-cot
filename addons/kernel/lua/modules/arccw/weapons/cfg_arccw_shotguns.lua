local Lang = AMB.Language.AddBetweenRusAndEng

local category = Lang( '#arccw_category_shotguns', '[ArcCW] Дробовики', '[ArcCW] Shotguns' )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Double Barrel'
    SWEP.Trivia_Class = "Shotgun"
    SWEP.Trivia_Desc = "Basic double-barrel shotgun manufactured as an entry-level hunting weapon. Long barrel makes for great spread and extra range, at the cost of poor hip fire characteristics. Switch to BOTH firemode to fire both barrels in quick succession."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "12 Gauge"
    SWEP.Trivia_Mechanism = "Break-Action"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1972

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_db.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_db.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 15
    SWEP.DamageMin = 8 -- damage done at maximum range
    SWEP.Range = 35 -- in METRES
    SWEP.Penetration = 2
    SWEP.DamageType = DMG_BUCKSHOT
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 150 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 0 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 2 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 2
    SWEP.ReducedClipSize = 1

    SWEP.Recoil = 4
    SWEP.RecoilSide = 1
    SWEP.MaxRecoilBlowback = 2

    SWEP.Delay = 60 / 1000 -- 60 / RPM.
    SWEP.Num = 8 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            PrintName = "SNGL",
            Mode = 1,
        },
        {
            PrintName = "BOTH",
            Mode = -2,
            RunawayBurst = true,
            Override_ShotRecoilTable = {
                [1] = 0.25
            }
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_annabelle", "weapon_shotgun"}
    SWEP.NPCWeight = 100

    SWEP.AccuracyMOA = 50 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "buckshot" -- what ammo type the gun uses

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/nova/nova-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m590_suppressed_tp.wav"
    SWEP.DistantShootSound = "weapons/arccw/nova/nova-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_shotgun"
    SWEP.ShellModel = "models/shells/shell_12gauge.mdl"
    SWEP.ShellPitch = 100
    SWEP.ShellSounds = ArcCW and ArcCW.ShotgunShellSoundsTable or {
        "weapons/fx/tink/shotgun_shell1.wav",
        "weapons/fx/tink/shotgun_shell2.wav",
        "weapons/fx/tink/shotgun_shell3.wav"
    }
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.94
    SWEP.SightedSpeedMult = 0.5
    SWEP.SightTime = 0.30

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-2.422, 0, 1.452),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.RevolverReload = true

    SWEP.BulletBones = {
        [1] = "Weapon_Mag_Fresh_2",
        [2] = "Weapon_Mag_Fresh"
    }

    SWEP.CaseBones = {
        [1] = "Weapon_Mag_2",
        [2] = "Weapon_Mag"
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "shotgun"
    SWEP.HoldtypeSights = "ar2"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

    SWEP.ActivePos = Vector(1, 12, -2)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(3.5, 2, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentElements = {
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {},
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_rail.mdl",
                    Bone = "Weapon_Thing",
                    Scale = Vector(1, 1, 1),
                    Offset = {
                        pos = Vector(0, -2.5, -1),
                        ang = Angle(90, 0, -90)
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
            Bone = "Weapon_Thing", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -2.5, -1), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(13.762, 0.832, -6.102),
                wang = Angle(-10.393, 0, 180)
            },
            InstalledEles = {"mount"}
        },
        {
            PrintName = "Choke",
            DefaultAttName = "Standard Choke",
            Slot = "choke",
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip"},
            Bone = "Weapon_Thing",
            Offset = {
                vpos = Vector(0, -1.25, 2),
                vang = Angle(90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "Weapon_Thing",
            Offset = {
                vpos = Vector(-0.8, -2, 5), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, 180),
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
            Slot = "ammo_shotgun"
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
                vpos = Vector(0.75, -0.75, 4), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(6, 1.5, -3),
                wang = Angle(-10, 0, 180)
            },
        },
    }

    SWEP.BarrelLength = 37

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
        ["draw"] = {
            Source = "draw",
            Time = 0.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/nova/nova_draw.wav", t = 0}},
        },
        ["ready"] = {
            Source = "ready",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/nova/nova_draw.wav", t = 0}},
        },
        ["fire"] = {
            Source = "shoot",
            Time = 0.4,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.4,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            Checkpoints = {28, 64, 102},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
            LastClip1OutTime = 1,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            Checkpoints = {28, 64, 102},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
            LastClip1OutTime = 1,
        },
    }
AMB.ArcCW.AddWeapon( 'arccw_db', SWEP )

local SWEP = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Sawn-Off'
    SWEP.Trivia_Class = "Shotgun"
    SWEP.Trivia_Desc = "Sawn-off version of the Partner, improving agility at the cost of spread and range."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "12 Gauge"
    SWEP.Trivia_Mechanism = "Break-Action"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1972

    SWEP.Slot = 1

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_db_sawnoff.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_sawnoff.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 15
    SWEP.DamageMin = 8 -- damage done at maximum range
    SWEP.Range = 20 -- in METRES
    SWEP.Penetration = 1
    SWEP.DamageType = DMG_BUCKSHOT

    SWEP.ChamberSize = 0 -- how many rounds can be chambered.
    SWEP.Primary = {}
    SWEP.Primary.ClipSize = 2 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 2
    SWEP.ReducedClipSize = 1

    SWEP.Recoil = 8
    SWEP.RecoilSide = 1
    SWEP.MaxRecoilBlowback = 2

    SWEP.AccuracyMOA = 150 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 100 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Delay = 60 / 1000 -- 60 / RPM.
    SWEP.Num = 8 -- number of shots per trigger pull.
    SWEP.Firemodes = {
        {
            PrintName = "SNGL",
            Mode = 1,
        },
        {
            PrintName = "BOTH",
            Mode = -2,
            RunawayBurst = true,
            Override_ShotRecoilTable = {
                [1] = 0.25
            }
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = {"weapon_annabelle", "weapon_shotgun"}
    SWEP.NPCWeight = 100

    SWEP.Primary.Ammo = "buckshot" -- what ammo type the gun uses

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/nova/nova-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m590_suppressed_tp.wav"
    SWEP.DistantShootSound = "weapons/arccw/nova/nova-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_shotgun"
    SWEP.ShellModel = "models/shells/shell_12gauge.mdl"
    SWEP.ShellPitch = 100
    SWEP.ShellSounds = ArcCW and ArcCW.ShotgunShellSoundsTable or {
        "weapons/fx/tink/shotgun_shell1.wav",
        "weapons/fx/tink/shotgun_shell2.wav",
        "weapons/fx/tink/shotgun_shell3.wav"
    }
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.94
    SWEP.SightedSpeedMult = 0.5
    SWEP.SightTime = 0.30

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-2.422, 0, 1.452),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.RevolverReload = true

    SWEP.BulletBones = {
        [1] = "Weapon_Mag_Fresh_2",
        [2] = "Weapon_Mag_Fresh"
    }

    SWEP.CaseBones = {
        [1] = "Weapon_Mag_2",
        [2] = "Weapon_Mag"
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "shotgun"
    SWEP.HoldtypeSights = "ar2"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

    SWEP.ActivePos = Vector(1, 12, -2)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(3.5, 2, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentElements = {
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {},
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_rail.mdl",
                    Bone = "Weapon_Thing",
                    Scale = Vector(1, 1, 1),
                    Offset = {
                        pos = Vector(0, -2.5, -1),
                        ang = Angle(90, 0, -90)
                    }
                }
            },
        }
    }

    SWEP.ShootVol = 130 -- volume of shoot sound

    SWEP.SpeedMult = 0.98
    SWEP.SightedSpeedMult = 0.80
    SWEP.SightTime = 0.225

    SWEP.BarrelLength = 20

    SWEP.IronSightStruct = {
        Pos = Vector(-2.422, 0, 1.452),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "shotgun"
    SWEP.HoldtypeSights = "ar2"

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic_lp", "optic"}, -- what kind of attachments can fit here, can be string or table
            Bone = "Weapon_Thing", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -2.5, -1), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(13.762, 0.832, -6.102),
                wang = Angle(-10.393, 0, 180)
            },
        },
        {
            PrintName = "Choke",
            DefaultAttName = "Standard Choke",
            Slot = "choke",
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip", "style_pistol"},
            Bone = "Weapon_Thing",
            Offset = {
                vpos = Vector(0, -1.25, 2),
                vang = Angle(90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "Weapon_Thing",
            Offset = {
                vpos = Vector(-0.8, -2, 5), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, 180),
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
            PrintName = "Ammo Type",
            Slot = "ammo_shotgun"
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
                vpos = Vector(0.75, -0.75, 4), -- offset that the attachment will be relative to the bone
                vang = Angle(90, 0, -90),
                wpos = Vector(6, 1.5, -3),
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
            Time = 0.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/nova/nova_draw.wav", t = 0}},
        },
        ["ready"] = {
            Source = "ready",
            Time = 1.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/nova/nova_draw.wav", t = 0}},
        },
        ["fire"] = {
            Source = "shoot",
            Time = 0.4,
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.4,
        },
        ["reload"] = {
            Source = "reload_part",
            Time = 2.15,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            Checkpoints = {28, 64, 102},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
            LastClip1OutTime = 0.4,
        },
        ["reload_empty"] = {
            Source = "reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            Checkpoints = {28, 64, 102},
            FrameRate = 30,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
            LastClip1OutTime = 0.4,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_db_sawnoff', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'M1014'
    SWEP.Trivia_Class = "Shotgun"
    SWEP.Trivia_Desc = "12 gauge automatic tube-fed shotgun. Excellent fire rate, but takes a long time to reload."
    SWEP.Trivia_Manufacturer = "Gryphon Arms"
    SWEP.Trivia_Calibre = "12 Gauge"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1994

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_as1217.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_as1217.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 12
    SWEP.DamageMin = 6 -- damage done at maximum range
    SWEP.Range = 25 -- in METRES
    SWEP.Penetration = 1
    SWEP.DamageType = DMG_BUCKSHOT
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 150 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 7 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 10
    SWEP.ReducedClipSize = 4

    SWEP.Recoil = 5
    SWEP.RecoilSide = 1
    SWEP.MaxRecoilBlowback = 2

    SWEP.ShotgunReload = true

    SWEP.Delay = 60 / 400 -- 60 / RPM.
    SWEP.Num = 8 -- number of shots per trigger pull.
    SWEP.RunawayBurst = false
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_shotgun"
    SWEP.NPCWeight = 125

    SWEP.AccuracyMOA = 35 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 300 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "buckshot" -- what ammo type the gun uses

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/xm1014/xm1014-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m590_suppressed_tp.wav"
    SWEP.DistantShootSound = "weapons/arccw/xm1014/xm1014-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_m3"
    SWEP.ShellModel = "models/shells/shell_12gauge.mdl"
    SWEP.ShellPitch = 100
    SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.95
    SWEP.SightedSpeedMult = 0.75
    SWEP.SightTime = 0.3

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-6.886, -9.011, 2.683),
        Ang = Angle(-0.174, -0.802, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }


    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

    SWEP.ActivePos = Vector(-2, 0, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {},
        }
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.xm1014_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.03, -5.655, -4.597), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(8.36, 0.939, -5.201),
                wang = Angle(-9.738, 0, 180)
            },
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(0, 0, 0)
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.xm1014_Parent", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0.03, -5, -15), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(8.36, 0.939, -5.201),
                wang = Angle(-9.738, 0, 180)
            },
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(0, 0, 0),
            KeepBaseIrons = true
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle_shotgun",
            Bone = "v_weapon.xm1014_Parent",
            Offset = {
                vpos = Vector(0.071, -4.511, -26.901),
                vang = Angle(-90, 0, -90),
                wpos = Vector(30.648, 0.782, -8.342),
                wang = Angle(-9.79, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = {"foregrip"},
            Bone = "v_weapon.xm1014_Parent",
            Offset = {
                vpos = Vector(0, -2.75, -14),
                vang = Angle(-90, 0, -90),
                wpos = Vector(14.329, 0.602, -4.453),
                wang = Angle(-10.216, 0, 180)
            },
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.xm1014_Parent",
            Offset = {
                vpos = Vector(0.5, -4.286, -7.787), -- offset that the attachment will be relative to the bone
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
            Slot = "ammo_shotgun"
        },
        {
            PrintName = "Perk",
            Slot = "perk"
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.xm1014_Parent",
            Offset = {
                vpos = Vector(-0.3, -4.286, -1), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(4, 1.5, -3),
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
            Source = "idle"
        },
        ["idle_empty"] = {
            Source = "idle_empty"
        },
        ["draw_empty"] = {
            Source = "draw_empty",
            Time = 0.6,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/xm1014/xm1014_draw.wav", t = 0}},
        },
        ["draw"] = {
            Source = "draw",
            Time = 0.6,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/xm1014/xm1014_draw.wav", t = 0}},
        },
        ["ready"] = {
            Source = "draw",
            Time = 1,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/xm1014/xm1014_draw.wav", t = 0}},
        },
        ["fire_iron"] = {
            Source = "shoot_iron",
            Time = 0.5,
        },
        ["fire_iron_empty"] = {
            Source = "shoot_iron_empty",
            Time = 0.5,
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2"},
            Time = 0.5,
        },
        ["fire_empty"] = {
            Source = "shoot_empty",
            Time = 0.5,
        },
        ["sgreload_start"] = {
            Source = "start_reload",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0,
        },
        ["sgreload_start_empty"] = {
            Source = "start_reload_empty",
            Time = 1.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0,
        },
        ["sgreload_insert"] = {
            Source = "insert",
            Time = 0.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            TPAnimStartTime = 0.3,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0,
        },
        ["sgreload_finish"] = {
            Source = "after_reload",
            Time = 0.5,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.4,
        },
    }

    -- Apex Legends EVA-8 style spread
    -- SWEP.ShotgunSpreadDispersion = true
    -- SWEP.ShotgunSpreadPattern = {Angle(0, 0, 0), Angle(-1, 0, 0), Angle(1, 0, 0), Angle(-0.7, 1, 0), Angle(-0.7, -1, 0), Angle(0.8, 1, 0), Angle(0.8, -1, 0), Angle(0, 0.6, 0), Angle(0, -0.6, 0)}
    -- SWEP.ShotgunSpreadPatternOverrun = {Angle(0, 0, 0)}
    -- SWEP.AccuracyMOA = 1
    -- SWEP.SightsDispersion = 25
    -- SWEP.Num = 9

    -- Apex Peacekeeper style spread
    -- SWEP.ShotgunSpreadPattern = {
    -- Angle(0, 0, 0),
    -- Angle(0.5, 0.0, 0),
    -- Angle(0.27, 0.421, 0),
    -- Angle(-0.208, 0.455, 0),
    -- Angle(-0.495, 0.071, 0),
    -- Angle(-0.327, -0.378, 0),
    -- Angle(0.142, -0.479, 0),
    -- Angle(1.0, 0.0, 0),
    -- Angle(0.54, 0.841, 0),
    -- Angle(-0.416, 0.909, 0),
    -- Angle(-0.99, 0.141, 0),
    -- Angle(-0.654, -0.757, 0),
    -- Angle(0.284, -0.959, 0),
    -- }
    -- SWEP.ShotgunSpreadDispersion = true
    -- SWEP.ShotgunSpreadPatternOverrun = {Angle(0, 0, 0)}
    -- SWEP.AccuracyMOA = 1
    -- SWEP.HipDispersion = 500
    -- SWEP.SightsDispersion = 25
    -- SWEP.Num = 13

AMB.ArcCW.AddWeapon( 'arccw_m1014', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'Saiga-12'
    SWEP.Trivia_Class = "Shotgun"
    SWEP.Trivia_Desc = "A magazine fed 12 gauge shotgun. Designed for hunting use as well as for police forces."
    SWEP.Trivia_Manufacturer = "Kremen Oruzhiye"
    SWEP.Trivia_Calibre = "12 Gauge"
    SWEP.Trivia_Mechanism = "Gas-Operated"
    SWEP.Trivia_Country = "USSR"
    SWEP.Trivia_Year = 1997

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_type8k.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_saiga.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 12
    SWEP.DamageMin = 5 -- damage done at maximum range
    SWEP.Range = 35 -- in METRES
    SWEP.Penetration = 1
    SWEP.DamageType = DMG_BUCKSHOT
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 150 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 8 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 12
    SWEP.ReducedClipSize = 4

    SWEP.Recoil = 5
    SWEP.RecoilSide = 1
    SWEP.MaxRecoilBlowback = 2

    SWEP.Delay = 60 / 450 -- 60 / RPM.
    SWEP.Num = 8 -- number of shots per trigger pull.
    SWEP.RunawayBurst = false
    SWEP.Firemodes = {
        {
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_shotgun"
    SWEP.NPCWeight = 125

    SWEP.AccuracyMOA = 80 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 1200 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "buckshot" -- what ammo type the gun uses
    SWEP.MagID = "type8k" -- the magazine pool this gun draws from

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.FirstShootSound = "weapons/arccw/mag7/mag7_02.wav"
    SWEP.ShootSound = "weapons/arccw/mag7/mag7_01.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m590_suppressed_tp.wav"
    SWEP.DistantShootSound = "weapons/arccw/mag7/mag7-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_m3"
    SWEP.ShellModel = "models/shells/shell_12gauge.mdl"
    SWEP.ShellPitch = 100
    SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.94
    SWEP.SightedSpeedMult = 0.45
    SWEP.SightTime = 0.33

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-6.5, -14.3, 3.7),
        Ang = Angle(0.7, 0.3, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }

    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "ar2"
    SWEP.HoldtypeSights = "rpg"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

    SWEP.ActivePos = Vector(-2, -6, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.BarrelLength = 27

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {},
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_ak.mdl",
                    Bone = "v_weapon.AK47_Parent",
                    Scale = Vector(-1, -1, 1),
                    Offset = {
                        pos = Vector(0, -6.723, -1.384),
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
                wpos = Vector(5.36, 0.739, -6),
                wang = Angle(-9.738, 0, 180)
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
            Slot = "muzzle_shotgun",
            Bone = "v_weapon.AK47_Parent",
            Offset = {
                vpos = Vector(0, -4.2, -22.275),
                vang = Angle(-90, 0, -90),
                wpos = Vector(27.648, 0.782, -7.342),
                wang = Angle(-9.79, 0, 180)
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
            Slot = "ammo_shotgun"
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
            Time = 0.75,
            ShellEjectAt = 0,
        },
        ["fire_iron"] = {
            Source = "ak47_fire_iron",
            Time = 0.75,
            ShellEjectAt = 0,
        },
        ["reload"] = {
            Source = "ak47_reload",
            Time = 2.5,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Framerate = 37,
            Checkpoints = {38, 68, 80},
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
        ["reload_empty"] = {
            Source = "ak47_reload_full",
            Time = 3,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
            Framerate = 37,
            Checkpoints = {38, 65},
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0.5,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_saiga', SWEP )

local SWEP = {}

    SWEP.Primary = {}

    SWEP.Base = "arccw_base"
    SWEP.Spawnable = true -- this obviously has to be set to true
    SWEP.Category = category
    SWEP.AdminOnly = false

    SWEP.PrintName = 'M3 Super 90'
    SWEP.Trivia_Class = "Shotgun"
    SWEP.Trivia_Desc = "12 gauge pistol grip pump shotgun. Designed for maneuverability in confined spaces."
    SWEP.Trivia_Manufacturer = "ArmStrike USA"
    SWEP.Trivia_Calibre = "12 Gauge"
    SWEP.Trivia_Mechanism = "Pump-Action"
    SWEP.Trivia_Country = "USA"
    SWEP.Trivia_Year = 1989

    SWEP.Slot = 2

    SWEP.UseHands = true

    SWEP.ViewModel = "models/weapons/arccw/c_defender_new.mdl"
    SWEP.WorldModel = "models/weapons/arccw/w_defender.mdl"
    SWEP.ViewModelFOV = 60

    SWEP.Damage = 14
    SWEP.DamageMin = 6 -- damage done at maximum range
    SWEP.Range = 25 -- in METRES
    SWEP.Penetration = 1
    SWEP.DamageType = DMG_BUCKSHOT
    SWEP.ShootEntity = nil -- entity to fire, if any
    SWEP.MuzzleVelocity = 150 -- projectile or phys bullet muzzle velocity
    -- IN M/S
    SWEP.ChamberSize = 1 -- how many rounds can be chambered.
    SWEP.Primary.ClipSize = 6 -- DefaultClip is automatically set.
    SWEP.ExtendedClipSize = 8
    SWEP.ReducedClipSize = 4

    SWEP.Recoil = 6
    SWEP.RecoilSide = 1
    SWEP.MaxRecoilBlowback = 2

    SWEP.ShotgunReload = true
    SWEP.ManualAction = true

    SWEP.Delay = 60 / 60 -- 60 / RPM.
    SWEP.Num = 8 -- number of shots per trigger pull.
    SWEP.RunawayBurst = false
    SWEP.Firemodes = {
        {
            PrintName = "PUMP",
            Mode = 1,
        },
        {
            Mode = 0
        }
    }

    SWEP.NPCWeaponType = "weapon_shotgun"
    SWEP.NPCWeight = 200

    SWEP.AccuracyMOA = 80 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
    SWEP.HipDispersion = 200 -- inaccuracy added by hip firing.
    SWEP.MoveDispersion = 150

    SWEP.Primary.Ammo = "buckshot" -- what ammo type the gun uses

    SWEP.ShootVol = 120 -- volume of shoot sound
    SWEP.ShootPitch = 100 -- pitch of shoot sound

    SWEP.ShootSound = "weapons/arccw/sawedoff/sawedoff-1.wav"
    SWEP.ShootSoundSilenced = "weapons/arccw/m590_suppressed_tp.wav"
    SWEP.DistantShootSound = "weapons/arccw/sawedoff/sawedoff-1-distant.wav"

    SWEP.MuzzleEffect = "muzzleflash_shotgun"
    SWEP.ShellModel = "models/shells/shell_12gauge.mdl"
    SWEP.ShellPitch = 100
    SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
    SWEP.ShellScale = 1.5

    SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
    SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

    SWEP.SpeedMult = 0.95
    SWEP.SightedSpeedMult = 0.75
    SWEP.SightTime = 0.27

    SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
        -- [0] = "bulletchamber",
        -- [1] = "bullet1"
    }

    SWEP.ProceduralRegularFire = false
    SWEP.ProceduralIronFire = false

    SWEP.CaseBones = {}

    SWEP.IronSightStruct = {
        Pos = Vector(-7.64, -10.56, 3.447),
        Ang = Angle(0.202, 0.017, 0),
        Magnification = 1.1,
        SwitchToSound = "", -- sound that plays when switching to this sight
    }


    SWEP.HoldtypeHolstered = "passive"
    SWEP.HoldtypeActive = "shotgun"
    SWEP.HoldtypeSights = "ar2"

    SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

    SWEP.ActivePos = Vector(-2, 0, 0)
    SWEP.ActiveAng = Angle(0, 0, 0)

    SWEP.HolsterPos = Vector(0.532, -6, 0)
    SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

    SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
    SWEP.BarrelOffsetHip = Vector(2, 0, -2)

    SWEP.AttachmentElements = {
        ["extendedmag"] = {
            VMBodygroups = {{ind = 1, bg = 1}},
            WMBodygroups = {},
        },
        ["reducedmag"] = {
            VMBodygroups = {{ind = 1, bg = 2}},
            WMBodygroups = {},
        },
        ["stock"] = {
            VMBodygroups = {{ind = 2, bg = 1}},
            WMBodygroups = {{ind = 2, bg = 1}},
        },
        ["mount"] = {
            VMElements = {
                {
                    Model = "models/weapons/arccw/atts/mount_rail.mdl",
                    Bone = "v_weapon.M3_PARENT",
                    Scale = Vector(1, 1, 1),
                    Offset = {
                        pos = Vector(0, -5.255, -4.597),
                        ang = Angle(-90, 0, -90)
                    }
                }
            },
            WMBodygroups = {{ind = 3, bg = 1}},
        }
    }

    SWEP.ExtraSightDist = 5

    SWEP.Attachments = {
        {
            PrintName = "Optic", -- print name
            DefaultAttName = "Iron Sights",
            Slot = {"optic", "optic_lp"}, -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.M3_PARENT", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -5.355, -4.597), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(7.36, 0.739, -5.201),
                wang = Angle(-9.738, 0, 180)
            },
            CorrectivePos = Vector(0, 0, 0),
            CorrectiveAng = Angle(0, 0, 0),
            InstalledEles = {"mount"}
        },
        {
            PrintName = "Backup Optic", -- print name
            Slot = "backup", -- what kind of attachments can fit here, can be string or table
            Bone = "v_weapon.M3_PARENT", -- relevant bone any attachments will be mostly referring to
            Offset = {
                vpos = Vector(0, -5, -15), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(7.36, 0.739, -5.201),
                wang = Angle(-9.738, 0, 180)
            },
            KeepBaseIrons = true
        },
        {
            PrintName = "Muzzle",
            DefaultAttName = "Standard Muzzle",
            Slot = "muzzle_shotgun",
            Bone = "v_weapon.M3_PARENT",
            Offset = {
                vpos = Vector(0.071, -4.511, -20.901),
                vang = Angle(-90, 0, -90),
                wpos = Vector(27.5, 0.782, -8.042),
                wang = Angle(-9.79, 0, 180)
            },
        },
        {
            PrintName = "Underbarrel",
            Slot = "foregrip",
            Bone = "v_weapon.M3_PUMP",
            Offset = {
                vpos = Vector(0, 0.899, -4.875),
                vang = Angle(-90, 0, -90),
                wpos = Vector(18.329, 0.602, -4.153),
                wang = Angle(-10.216, 0, 180)
            },
            SlideAmount = false
        },
        {
            PrintName = "Tactical",
            Slot = "tac",
            Bone = "v_weapon.M3_PARENT",
            Offset = {
                vpos = Vector(0.954, -4.086, -5.138), -- offset that the attachment will be relative to the bone
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
            DefaultAttName = "No Stock",
            InstalledEles = {"stock"},
        },
        {
            PrintName = "Ammo Type",
            Slot = "ammo_shotgun"
        },
        {
            PrintName = "Perk",
            Slot = "perk"
        },
        {
            PrintName = "Charm",
            Slot = "charm",
            FreeSlot = true,
            Bone = "v_weapon.M3_PARENT",
            Offset = {
                vpos = Vector(-0.5, -4.286, -2), -- offset that the attachment will be relative to the bone
                vang = Angle(-90, 0, -90),
                wpos = Vector(4, 1.5, -3),
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
        ["draw"] = {
            Source = "draw",
            Time = 0.4,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/sawedoff/sawedoff_draw.wav", t = 0}},
        },
        ["ready"] = {
            Source = "ready",
            Time = 0.75,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.25,
            SoundTable = {{s = "weapons/arccw/sawedoff/sawedoff_draw.wav", t = 0}},
        },
        ["fire"] = {
            Source = {"shoot1", "shoot2"},
            Time = 0.4,
        },
        ["slam"] = {
            Source = "slam",
            Time = 0.75,
            ShellEjectAt = 0.3,
        },
        ["cycle"] = {
            Source = "cycle2",
            Time = 0.75,
            ShellEjectAt = 0.3,
            MinProgress = 0.65,
        },
        ["cycle_iron"] = {
            Source = "cycle1",
            Time = 0.75,
            ShellEjectAt = 0.3,
            MinProgress = 0.65,
        },
        ["sgreload_start"] = {
            Source = "start_reload",
            Time = 0.25,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            LHIK = true,
            LHIKIn = 0.5,
            LHIKOut = 0,
        },
        ["sgreload_insert"] = {
            Source = "insert",
            Time = 0.4,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
            TPAnimStartTime = 0.3,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0,
        },
        ["sgreload_finish"] = {
            Source = "after_reload",
            Time = 0.4,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 0.4,
        },
        ["sgreload_finish_empty"] = {
            Source = "after_reload_empty",
            Time = 0.75,
            LHIK = true,
            LHIKIn = 0,
            LHIKOut = 1,
        },
    }

AMB.ArcCW.AddWeapon( 'arccw_shorty', SWEP )