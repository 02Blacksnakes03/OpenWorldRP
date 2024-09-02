ESX, QBCore = nil
Citizen.CreateThread(function()
    if Config['PetsSettings']['framework']['name'] == 'ESX' then
        TriggerEvent(Config['PetsSettings']['framework']['eventName'], function(library) 
            ESX = library 
        end)

        for itemName, itemData in pairs(Config['Pets']) do
            ESX.RegisterUsableItem(itemName, function(source)
                local src = source
                local player = ESX.GetPlayerFromId(src)
            
                if player then
                    TriggerClientEvent('pets:client:attachPet', src, itemName, itemData)
                end
            end)
        end

        AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
            local src = source
            local player = ESX.GetPlayerFromId(src)

            if player then
                for itemName, itemData in pairs(Config['Pets']) do
                    if item == itemName and count < 1 then
                        TriggerClientEvent('pets:client:attachPet', src, itemName, itemData)
                    end
                end
            end
        end)
    elseif Config['PetsSettings']['framework']['name'] == 'QB' then
        while not QBCore do
            pcall(function() QBCore =  exports[Config['PetsSettings']['framework']['scriptName']]:GetCoreObject() end)
            if not QBCore then
                pcall(function() QBCore =  exports[Config['PetsSettings']['framework']['scriptName']]:GetSharedObject() end)
            end
            if not QBCore then
                TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            end
            Citizen.Wait(1)
        end
        
        for itemName, itemData in pairs(Config['Pets']) do
            QBCore.Functions.CreateUseableItem(itemName, function(source, item)
                local src = source
                local player = QBCore.Functions.GetPlayer(src)

                if player then
                    TriggerClientEvent('pets:client:attachPet', src, itemName, itemData)
                end
            end)
        end

        AddEventHandler('QBCore:OnRemoveInventoryItem', function(source, item, count)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)
            
            if player then
                for itemName, itemData in pairs(Config['Pets']) do
                    if item == itemName and count < 1 then
                        TriggerClientEvent('pets:client:attachPet', src, itemName, itemData)
                    end
                end
            end
        end)
    end
end)

RegisterServerEvent('pets:server:petEffect')
AddEventHandler('pets:server:petEffect', function(petObject, petConfig, petCoords)
    TriggerClientEvent('pets:client:petEffect', -1, petObject, petConfig, petCoords)
end)