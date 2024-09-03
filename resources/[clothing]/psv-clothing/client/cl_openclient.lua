local QBCore = exports['qb-core']:GetCoreObject()

-- // COMMANDS //

RegisterCommand("outfits" , function ()
    TriggerEvent('qb-clothing:client:openOutfitMenu', true)
end)

RegisterCommand("clothing" , function ()
    TriggerEvent('qb-clothing:client:openMenu', false , false)
end)

RegisterCommand("register", function ()
    TriggerEvent('psv-clothing:firstCharacterMenu', false) -- false = not free , true = free
end)

RegisterCommand("barber" , function ()
    TriggerEvent('psv-clothing:openBarber', false)
end)

-- // EVENTS //

RegisterNetEvent('qb-clothing:client:openMenu', function()
    TriggerEvent('psv-clothing:openClothing', true)
end)


RegisterNetEvent('qb-clothing:client:openOutfitMenu', function()
    TriggerEvent('psv-clothing:outfits', true)
end)

RegisterNetEvent('qb-clothing:client:openBarberMenu', function()
    TriggerEvent('psv-clothing:openBarber', false) -- false = not free , true = free
end)
