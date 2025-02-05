local QBCore = exports['qb-core']:GetCoreObject()


Citizen.CreateThread(function()
    for zoneName, zoneData in pairs(Config.CraftingZones) do
        exports['qb-target']:AddBoxZone(zoneName, zoneData.location, 1.4, 1.4, {
            name = zoneName,
            heading = zoneData.heading,
            debugPoly = false,
        }, {
            options = {
                {
                    event = "fp-crafting:openMenu",
                    icon = "fa fa-wrench",
                    label = zoneData.label,
                },
            },
            distance = zoneData.distance,
        })
    end
end)



Citizen.CreateThread(function()
    -- Example of spawning the workbench when the resource starts
    spawnWorkbench(Config.CraftingZones.guncrafting)
end)


RegisterNetEvent('fp-crafting:client:startCrafting', function(itemName)
    local playerPed = PlayerPedId()
    local hammerProp = `prop_tool_hammer` -- Change to the correct prop name if needed

    -- Function to determine the progress time based on item type
    local function getCraftingTime(itemName)
        for _, item in pairs(Config.CraftingItems.Weapons) do
            if item.name == itemName then
                return 60000 -- Time for weapons
            end
        end
        for _, item in pairs(Config.CraftingItems.Ammo) do
            if item.name == itemName then
                return 15000 -- Time for ammo
            end
        end
        for _, item in pairs(Config.WeaponAttachments) do
            if item.name == itemName then
                return 17000 -- Time for attachments
            end
        end
        return 5000 -- Default time
    end

    -- Load the animation dictionary
    RequestAnimDict('amb@world_human_hammering@male@base')
    while not HasAnimDictLoaded('amb@world_human_hammering@male@base') do
        Citizen.Wait(100)
    end

    -- Load the prop
    RequestModel(hammerProp)
    while not HasModelLoaded(hammerProp) do
        Citizen.Wait(100)
    end

    -- Create and attach the prop
    local prop = CreateObject(hammerProp, 0, 0, 0, true, true, true)
    -- Adjust these values to properly position the hammer
    AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.0, 0.0, 90.0, 90.0, 0.0, true, true, false, true, 1, true)

    -- Determine the progress bar time based on item type
    local craftingTime = getCraftingTime(itemName)

    -- Play the hammering animation
    TaskPlayAnim(playerPed, 'amb@world_human_hammering@male@base', 'base', 8.0, -8.0, craftingTime, 49, 0, false, false, false)
    
    QBCore.Functions.Progressbar('crafting', 'Crafting Item...', craftingTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- On success
        -- Clear the animation and remove the prop
        ClearPedTasks(playerPed)
        DeleteObject(prop)
        TriggerServerEvent('fp-crafting:server:completeCrafting', itemName)
    end, function() -- On cancel
        -- Clear the animation and remove the prop
        ClearPedTasks(playerPed)
        DeleteObject(prop)
        QBCore.Functions.Notify('Crafting canceled', 'error')
    end)
end)


-- RegisterNetEvent('fp-crafting:client:startCrafting', function(itemName)
--     local playerPed = PlayerPedId()
--     local hammerProp = `prop_tool_hammer` -- Change to the correct prop name if needed

--     -- Load the animation dictionary
--     RequestAnimDict('amb@world_human_hammering@male@base')
--     while not HasAnimDictLoaded('amb@world_human_hammering@male@base') do
--         Citizen.Wait(100)
--     end

--     -- Load the prop
--     RequestModel(hammerProp)
--     while not HasModelLoaded(hammerProp) do
--         Citizen.Wait(100)
--     end

--     -- Attach the prop to the player's hand
--     local prop = CreateObject(hammerProp, 0, 0, 0, true, true, true)
--     AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.0, 0.0, 90.0, 90.0, 0.0, true, true, false, true, 1, true)

--     -- Play the hammering animation
--     TaskPlayAnim(playerPed, 'amb@world_human_hammering@male@base', 'base', 8.0, -8.0, 5000, 49, 0, false, false, false)
    
--     QBCore.Functions.Progressbar('crafting', 'Crafting Item...', 5000, false, true, {
--         disableMovement = true,
--         disableCarMovement = true,
--         disableMouse = false,
--         disableCombat = true,
--     }, {}, {}, {}, function() -- On success
--         -- Clear the animation and remove the prop
--         ClearPedTasks(playerPed)
--         DeleteObject(prop)
--         TriggerServerEvent('fp-crafting:server:completeCrafting', itemName)
--     end, function() -- On cancel
--         -- Clear the animation and remove the prop
--         ClearPedTasks(playerPed)
--         DeleteObject(prop)
--         QBCore.Functions.Notify('Crafting canceled', 'error')
--     end)
-- end)


