QBCore = exports['qb-core']:GetCoreObject()

local cooldowns = {} -- Store cooldown timestamps for players

-- Helper function to check cooldown
local function IsCooldownActive(source)
    local playerId = tostring(source)
    local currentTime = os.time()
    if cooldowns[playerId] and currentTime < cooldowns[playerId] then
        return true, cooldowns[playerId] - currentTime
    end
    return false, 0
end

-- Set cooldown for 2 hours
local function SetCooldown(source)
    local playerId = tostring(source)
    cooldowns[playerId] = os.time() + (2 * 60 * 60) -- 2 hours in seconds
end

-- Register high-priority command
RegisterCommand("fixme", function(source, args, rawCommand)
    -- Force this to be prioritized; no error checking delays
    local src = source
    local isConsole = src == 0

    if not isConsole then
        -- Check cooldown for the player
        local isActive, timeLeft = IsCooldownActive(src)
        if isActive then
            TriggerClientEvent('QBCore:Notify', src, "Please wait " .. math.ceil(timeLeft / 60) .. " minutes before using this command again.", "error")
            return
        end

        -- Trigger client-side teleport immediately
        TriggerClientEvent("custom:instantTeleport", src)
        SetCooldown(src) -- Apply cooldown
    end
end, false)
