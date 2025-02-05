-- Server-Side Script

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('fp-crafting:server:checkMaterials', function(source, cb, itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemConfig = nil

    for _, item in ipairs(Config.CraftingItems.Weapons) do
        if item.name == itemName then
            itemConfig = item
            break
        end
    end

    if not itemConfig then
        for _, item in ipairs(Config.CraftingItems.Ammo) do
            if item.name == itemName then
                itemConfig = item
                break
            end
        end
    end

    if itemConfig then
        local hasMaterials = true
        for material, amount in pairs(itemConfig.materials) do
            local playerItem = Player.Functions.GetItemByName(material)
            if not playerItem or playerItem.amount < amount then
                hasMaterials = false
                break
            end
        end
        cb(hasMaterials)
    else
        cb(false)
    end
end)

RegisterServerEvent('fp-crafting:server:startCrafting', function(itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Check if the player has the required materials
    QBCore.Functions.TriggerCallback('fp-crafting:server:checkMaterials', src, function(hasMaterials)
        if hasMaterials then
            -- Trigger the client-side event to start crafting
            TriggerClientEvent('fp-crafting:client:startCrafting', src, itemName)
        else
            -- Notify the player if they don't have the required materials
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the required materials.', 'error')
        end
    end, itemName)
end)

-- Event to complete crafting, triggered after progress bar finishes
RegisterServerEvent('fp-crafting:server:completeCrafting', function(itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- No need to check materials here since it was already checked
    -- Handle the crafting process directly
    for _, item in ipairs(Config.CraftingItems.Weapons) do
        if item.name == itemName then
            for material, amount in pairs(item.materials) do
                Player.Functions.RemoveItem(material, amount)
            end
            Player.Functions.AddItem(itemName, 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "add")
            TriggerClientEvent('QBCore:Notify', src, 'You have crafted a ' .. QBCore.Shared.Items[itemName].label, 'success')
            return
        end
    end

    for _, item in ipairs(Config.CraftingItems.Ammo) do
        if item.name == itemName then
            for material, amount in pairs(item.materials) do
                Player.Functions.RemoveItem(material, amount)
            end
            Player.Functions.AddItem(itemName, 3)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "add")
            TriggerClientEvent('QBCore:Notify', src, 'You have crafted ' .. QBCore.Shared.Items[itemName].label, 'success')
            return
        end
    end

    for _, item in ipairs(Config.WeaponAttachments) do
        if item.name == itemName and itemType == 'attachment' then
            for material, amount in pairs(item.materials) do
                Player.Functions.RemoveItem(material, amount)
            end
            Player.Functions.AddItem(itemName, 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "add")
            TriggerClientEvent('QBCore:Notify', src, 'You have crafted a ' .. QBCore.Shared.Items[itemName].label, 'success')
            return
        end
    end
end)