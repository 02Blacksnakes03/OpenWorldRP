Core = nil
CoreName = nil
CoreReady = false
Citizen.CreateThread(function()
    for k, v in pairs(Cores) do
        if GetResourceState(v.ResourceName) == "starting" or GetResourceState(v.ResourceName) == "started" then
            CoreName = v.ResourceName
            Core = v.GetFramework()
            CoreReady = true
        end
    end
end)

function TriggerCallback(name, cb, ...)
    AC.ServerCallbacks[name] = cb
    TriggerServerEvent('ac-hacking:server:triggerCallback', name, ...)
end

RegisterNetEvent('ac-hacking:client:triggerCallback', function(name, ...)
    if AC.ServerCallbacks[name] then
        AC.ServerCallbacks[name](...)
        AC.ServerCallbacks[name] = nil
    end
end)

function Notify(text, length, type)
    if CoreName == "qb-core" then
        Core.Functions.Notify(text, type, length)
    elseif CoreName == "es_extended" then
        Core.ShowNotification(text)
    end
end

function GetPlayerData()
    if CoreName == "qb-core" then
        local player = Core.Functions.GetPlayerData()
        return player
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerData()
        return player
    end
end
