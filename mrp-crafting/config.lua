Config = {}

-- Crafting Zones
Config.CraftingZones = {
    guncrafting = {
        location = vector3(718.06, -972.92, 30.40),
        heading = 354,
        label = "Crafting Workbench",
        distance = 2.5,
        model = "prop_workbench_02a"
    },
    guncrafting2 = {
        location = vector3(183.89, -2176.40, 11.41),
        heading = 354,
        label = "Crafting Workbench",
        distance = 2.5,
        model = "prop_workbench_02a"
    }
}

-- Crafting Items
Config.CraftingItems = {
    Weapons = {
        {
            name = "weapon_pistol",
            label = "Pistol",
            materials = { metalscrap = 50, steel = 25, iron = 25 },
        },
        -- {
        --     name = "weapon_pumpshotgun",
        --     label = "Pump Shotgun",
        --     materials = { metalscrap = 50, steel = 50, iron = 50 },
        -- },
        {
            name = "weapon_smg",
            label = "SMG",
            materials = { metalscrap = 95, steel = 30, iron = 50 },
        },
        {
            name = "weapon_compactrifle",
            label = "Compact Rifle",
            materials = { metalscrap = 90, steel = 70, iron = 50 },
        },
                {
                    name = "weapon_ak47",
                    label = "AK-47",
                    materials = {metalscrap = 100, steel = 120, iron = 80},
                    image = "weapon_assaultrifle.png"
                },
                {
                    name = "weapon_de",
                    label = "Desert Eagle",
                    materials = {metalscrap = 80, steel = 70, iron = 50},
                    image = "deagle.png"
                },
                {
                    name = "weapon_fnx45",
                    label = "FN FNX-45",
                    materials = {metalscrap = 60, steel = 50, iron = 40},
                    image = "weapon_combat-pistol.png"
                },
                {
                    name = "weapon_glock17",
                    label = "Glock 17",
                    materials = {metalscrap = 50, steel = 50, iron = 40},
                    image = "glock-17.png"
                },
                {
                    name = "weapon_m4",
                    label = "M4",
                    materials = {metalscrap = 110, steel = 100, iron = 90},
                    image = "weapon_carbinerifle.png"
                },
                {
                    name = "weapon_m9",
                    label = "M9",
                    materials = {metalscrap = 60, steel = 50, iron = 40},
                    image = "m1911.png"
                },
                {
                    name = "weapon_m70",
                    label = "M70",
                    materials = {metalscrap = 90, steel = 100, iron = 70},
                    image = "m70.png"
                },
                {
                    name = "weapon_m1911",
                    label = "M1911",
                    materials = {metalscrap = 70, steel = 60, iron = 50},
                    image = "browning.png"
                },
                {
                    name = "weapon_uzi",
                    label = "Uzi",
                    materials = {metalscrap = 80, steel = 80, iron = 60},
                    image = "uzi.png"
                },
                {
                    name = "weapon_mac10",
                    label = "MAC-10",
                    materials = {metalscrap = 70, steel = 60, iron = 50},
                    image = "mac-10.png"
                },
                {
                    name = "weapon_mossberg",
                    label = "Mossberg 500",
                    materials = {metalscrap = 90, steel = 80, iron = 70},
                    image = "mossberg500.png"
                },
                {
                    name = "weapon_remington",
                    label = "Remington 870",
                    materials = {metalscrap = 100, steel = 90, iron = 80},
                    image = "remington.png"
                },
                {
                    name = "weapon_scarh",
                    label = "SCAR-H",
                    materials = {metalscrap = 120, steel = 110, iron = 100},
                    image = "scar.png"
                },
                {
                    name = "weapon_shiv",
                    label = "Shiv",
                    materials = {metalscrap = 10, steel = 5, iron = 5},
                    image = "shiv.png"
                },
                {
                    name = "weapon_ar15",
                    label = "AR-15",
                    materials = {metalscrap = 100, steel = 100, iron = 80},
                    image = "WEAPON_AR15.png"
                },
                {
                    name = "weapon_mk14",
                    label = "MK14",
                    materials = {metalscrap = 120, steel = 110, iron = 90},
                    image = "mk14.png"
                },
                {
                    name = "weapon_huntingrifle",
                    label = "Hunting Rifle",
                    materials = {metalscrap = 80, steel = 90, iron = 70},
                    image = "huntingrifle.png"
                },
                {
                    name = "weapon_katana",
                    label = "Katana",
                    materials = {metalscrap = 20, steel = 30, iron = 40},
                    image = "katana.png"
                },
                {
                    name = "weapon_sledgehammer",
                    label = "Sledgehammer",
                    materials = {metalscrap = 50, steel = 60, iron = 40},
                    image = "sledgehammer.png"
                },
                {
                    name = "weapon_mp9",
                    label = "MP9",
                    materials = {metalscrap = 80, steel = 70, iron = 60},
                    image = "weapon_mp9.png"
                },
                {
                    name = "weapon_m110",
                    label = "M110",
                    materials = {metalscrap = 110, steel = 100, iron = 90},
                    image = "WEAPON_M110.png"
                },
                {
                    name = "weapon_hk416",
                    label = "HK416",
                    materials = {metalscrap = 120, steel = 110, iron = 100},
                    image = "WEAPON_HK416.png"
                },
                {
                    name = "weapon_ak74",
                    label = "AK-74",
                    materials = {metalscrap = 100, steel = 100, iron = 80},
                    image = "weapon_ak74.png"
                },
                {
                    name = "weapon_aks74",
                    label = "AKS-74",
                    materials = {metalscrap = 100, steel = 100, iron = 80},
                    image = "weapon_aks74.png"
                },
                {
                    name = "weapon_glock18c",
                    label = "Glock 18C",
                    materials = {metalscrap = 60, steel = 50, iron = 40},
                    image = "glock-18c.png"
                },
                {
                    name = "weapon_glock22",
                    label = "Glock 22",
                    materials = {metalscrap = 60, steel = 50, iron = 40},
                    image = "glock-22.png"
                },
                {
                    name = "weapon_mp5",
                    label = "MP5",
                    materials = {metalscrap = 90, steel = 80, iron = 70},
                    image = "MP5.png"
                },
            
    },

    
    Ammo = {
        {
            name = "shotgun_ammo",
            label = "Shotgun Ammo",
            materials = { metalscrap = 5, steel = 5, iron = 5 },
        },
        {
            name = "smg_ammo",
            label = "SMG Ammo",
            materials = { metalscrap = 5, steel = 5, iron = 5 },
        },
        {
            name = "rifle_ammo",
            label = "Rifle Ammo",
            materials = { metalscrap = 5, steel = 5, iron = 5 },
        }
    }
}

Config.WeaponAttachments = {
    {
        name = "pistol_extendedclip",
        label = "Pistol Extended Clip",
        materials = {metalscrap = 140, steel = 50, iron = 60, aluminum = 60},
        image = "pistol_extendedclip.png",
    },
    {
        name = "pistol_suppressor",
        label = "Pistol Suppressor",
        materials = {metalscrap = 140, steel = 50, iron = 60, aluminum = 60},
        image = "pistol_suppressor.png",
    },
    {
        name = "smg_extendedclip",
        label = "SMG Extended Clip",
        materials = {metalscrap = 140, steel = 50, iron = 60, aluminum = 60},
        image = "smg_extendedclip.png",
    },
    {
        name = "smg_flashlight",
        label = "SMG Flashlight",
        materials = {metalscrap = 140, steel = 50, iron = 60, aluminum = 60},
        image = "smg_flashlight.png",
    },
    {
        name = "smg_suppressor",
        label = "SMG Suppressor",
        materials = {metalscrap = 140, steel = 50, iron = 60, aluminum = 60},
        image = "smg_suppressor.png",
    },
    {
        name = "smg_scope",
        label = "SMG Scope",
        materials = {metalscrap = 140, steel = 50, iron = 60, aluminum = 60},
        image = "smg_scope.png",
    },
    {
        name = "rifle_drummag",
        label = "Rifle Drummag",
        materials = {metalscrap = 140, steel = 50, iron = 60, aluminum = 60},
        image = "rifle_drummag.png",
    },
    {
        name = "rifle_extendedclip",
        label = "Rifle Extended Clip",
        materials = {metalscrap = 140, steel = 50, iron = 60, aluminum = 60},
        image = "rifle_extendedclip.png",
    },
}


Config.MenuIcons = {
    Main = "cart.png",
    Weapons = "WEAPON_AK47NEON.png",
    Ammo = "pistol_ammo.png"
}
