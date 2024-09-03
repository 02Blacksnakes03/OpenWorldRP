QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

local function createProperty(property)
    PropertiesTable[property.property_id] = Property:new(property)
end
RegisterNetEvent('ps-housing:client:addProperty', createProperty)

RegisterNetEvent('ps-housing:client:removeProperty', function(property_id)
    local property = Property.Get(property_id)

    if property then
        property:RemoveProperty()
    end

    PropertiesTable[property_id] = nil
end)

function InitialiseProperties(properties)
    Debug("Eigenschaften initialisieren")
    PlayerData = QBCore.Functions.GetPlayerData()

    for k, v in pairs(Config.Apartments) do
        ApartmentsTable[k] = Apartment:new(v)
    end

    if not properties then
        properties = lib.callback.await('ps-housing:server:requestProperties')
    end

    for k, v in pairs(properties) do
        createProperty(v.propertyData)
    end

    TriggerEvent("ps-housing:client:initialisedProperties")

    Debug("Eigenschaften initialisiert")
end
AddEventHandler("QBCore:Client:OnPlayerLoaded", InitialiseProperties)
RegisterNetEvent('ps-housing:client:initialiseProperties', InitialiseProperties)

AddEventHandler("onResourceStart", function(resourceName) -- Wird verwendet, wenn die Ressource neu gestartet wird, während man im Spiel ist
    if (GetCurrentResourceName() == resourceName) then
        InitialiseProperties()
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('ps-housing:client:setupSpawnUI', function(cData)
    DoScreenFadeOut(1000)
    local result = lib.callback.await('ps-housing:cb:GetOwnedApartment', source, cData.citizenid)
    if result then
        TriggerEvent('qb-spawn:client:setupSpawns', cData, false, nil)
        TriggerEvent('qb-spawn:client:openUI', true)
        -- TriggerEvent("apartments:client:SetHomeBlip", result.type)
    else
        if Config.StartingApartment then
            TriggerEvent('qb-spawn:client:setupSpawns', cData, true, Config.Apartments)
            TriggerEvent('qb-spawn:client:openUI', true)
        else
            TriggerEvent('qb-spawn:client:setupSpawns', cData, false, nil)
            TriggerEvent('qb-spawn:client:openUI', true)
        end
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if Modeler.IsMenuActive then
            Modeler:CloseMenu()
        end

        for k, v in pairs(PropertiesTable) do
            v:RemoveProperty()
        end

        for k, v in pairs(ApartmentsTable) do
            v:RemoveApartment()
        end
    end
end)

exports('GetProperties', function()
    return PropertiesTable
end)

exports('GetProperty', function(property_id)
    return Property.Get(property_id)
end)

exports('GetApartments', function()
    return ApartmentsTable
end)

exports('GetApartment', function(apartment)
    return Apartment.Get(apartment)
end)

exports('GetShells', function()
    return Config.Shells
end)


lib.callback.register('ps-housing:cb:confirmPurchase', function(amount, street, id)
    return lib.alertDialog({
        header = 'Kaufbestätigung',
        content = 'Sind Sie sicher, dass Sie ' .. street .. ' ' .. id .. ' für $' .. amount .. ' kaufen möchten?',
        centered = true,
        cancel = true,
        labels = {
            confirm = "Kaufen",
            cancel = "Abbrechen"
        }
    })
end)

lib.callback.register('ps-housing:cb:confirmRaid', function(street, id)
    return lib.alertDialog({
        header = 'Überfall',
        content = 'Möchten Sie ' .. street .. ' ' .. id .. ' überfallen?',
        centered = true,
        cancel = true,
        labels = {
            confirm = "Überfallen",
            cancel = "Abbrechen"
        }
    })
end)

lib.callback.register('ps-housing:cb:ringDoorbell', function()
    return lib.alertDialog({
        header = 'Türklingel',
        content = 'Sie haben keinen Schlüssel für diese Immobilie. Möchten Sie die Türklingel betätigen?',
        centered = true,
        cancel = true,
        labels = {
            confirm = "Klingeln",
            cancel = "Abbrechen"
        }
    })
end)

lib.callback.register('ps-housing:cb:showcase', function()
    return lib.alertDialog({
        header = 'Immobilie präsentieren',
        content = 'Möchten Sie diese Immobilie präsentieren?',
        centered = true,
        cancel = true,
        labels = {
            confirm = "Ja",
            cancel = "Abbrechen"
        }
    })
end)

function HouseTrack(propertyId)
    local coords

    if PropertiesTable[propertyId].propertyData.apartment ~= nil then
        local getConfigName = PropertiesTable[propertyId].propertyData.apartment
        coords = Config.Apartments[getConfigName].door
    else
        coords = PropertiesTable[propertyId].propertyData.door_data
    end

    SetNewWaypoint(coords.x, coords.y)
end

exports("HouseTrack", HouseTrack)
