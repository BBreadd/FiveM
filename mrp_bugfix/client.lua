local respawnCoords = vector3(200.0, 200.0, 72.0) -- New teleportation coordinates

-- Event to force teleportation
RegisterNetEvent("custom:instantTeleport", function()
    local ped = PlayerPedId()

    -- Override all other events/errors in the F8 console
    Citizen.CreateThread(function()
        -- Disable any delays/errors and immediately teleport the player
        SetEntityCoords(ped, respawnCoords.x, respawnCoords.y, respawnCoords.z, false, false, false, true)
        SetEntityHeading(ped, 0.0) -- Optional: Reset heading

        -- Notify the player
        TriggerEvent('QBCore:Notify', "You have been instantly teleported to a safe location.", "success")
    end)
end)
