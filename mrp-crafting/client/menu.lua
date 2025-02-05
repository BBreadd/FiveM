local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('fp-crafting:openMenu', function(data)
    local options = {
        { header = "Crafting Bench", isMenuHeader = true, icon = Config.MenuIcons.Main },
        { header = "Weapons", txt = "Pistol, SMG and Compact Rifle", icon = Config.MenuIcons.Weapons, params = { event = "fp-crafting:openWeaponMenu" }},
        { header = "Weapon Ammo", txt = "Craft various ammo", icon = Config.MenuIcons.Ammo, params = { event = "fp-crafting:openAmmoMenu" }},
        { header = "Weapon Attachment", txt = "Craft various attachments", icon = Config.MenuIcons.Ammo, params = { event = "fp-crafting:openAttachmentMenu" }},        
        { header = "Close", txt = "Close Menu", params = { event = "qb-menu:closeMenu" }},
    }
    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('fp-crafting:openWeaponMenu', function()
    local options = { { header = "Weapons", isMenuHeader = true, icon = Config.MenuIcons.Weapons } }

    for _, weapon in ipairs(Config.CraftingItems.Weapons) do
        table.insert(options, {
            header = weapon.label,
            txt = string.format("%d MetalScrap, %d Steel, %d Iron", weapon.materials.metalscrap, weapon.materials.steel, weapon.materials.iron),
            icon = weapon.icon or "default_weapon_icon.png", -- Use the weapon's icon or a default
            params = { event = "fp-crafting:craftWeapon", args = weapon.name },
        })
    end

    table.insert(options, { header = "Main Menu", txt = "", params = { event = "fp-crafting:openMenu" }})

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('fp-crafting:openAmmoMenu', function()
    local options = { { header = "Weapon Ammo", isMenuHeader = true, icon = Config.MenuIcons.Ammo } }

    for _, ammo in ipairs(Config.CraftingItems.Ammo) do
        table.insert(options, {
            header = ammo.label,
            txt = string.format("%d MetalScrap, %d Steel, %d Iron", ammo.materials.metalscrap, ammo.materials.steel, ammo.materials.iron),
            icon = ammo.icon or "default_ammo_icon.png", -- Use the ammo's icon or a default
            params = { event = "fp-crafting:craftAmmo", args = ammo.name },
        })
    end

    table.insert(options, { header = "Main Menu", txt = "", params = { event = "fp-crafting:openMenu" }})

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('fp-crafting:openAttachmentMenu', function()
    local options = { { header = "Attachments", isMenuHeader = true } }

    for _, attachment in ipairs(Config.WeaponAttachments) do
        table.insert(options, {
            header = attachment.label,
            txt = string.format("%d MetalScrap, %d Steel, %d Iron, %d Aluminum", 
                attachment.materials.metalscrap, attachment.materials.steel, 
                attachment.materials.iron, attachment.materials.aluminum),
            image = attachment.image,
            params = { event = "fp-crafting:craftAttachment", args = attachment.name },
        })
    end

    table.insert(options, { header = "Main Menu", txt = "", params = { event = "fp-crafting:openMenu" }})

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('fp-crafting:craftAttachment', function(attachmentName)
    TriggerServerEvent('fp-crafting:server:startCrafting', attachmentName)
end)

RegisterNetEvent('fp-crafting:craftWeapon', function(weaponName)
    TriggerServerEvent('fp-crafting:server:startCrafting', weaponName)
end)

RegisterNetEvent('fp-crafting:craftAmmo', function(ammoName)
    TriggerServerEvent('fp-crafting:server:startCrafting', ammoName)
end)
