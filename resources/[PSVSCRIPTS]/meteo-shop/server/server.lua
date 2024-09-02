if Config.Framework == "ESX" then 

    ESX = nil

    Citizen.CreateThread(function()
        while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(200)
        end
    end)

    RegisterNetEvent('meteo-shop:pay')
    AddEventHandler('meteo-shop:pay', function(data)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)

        if data.payType == "cash" then
            if xPlayer.getMoney() >= data.price then
                    xPlayer.removeMoney(data.price)
                    Config.Success()
                    for k,v in pairs(data.cartArr) do
                        xPlayer.addInventoryItem(v.itemname, tonumber(v.count))
                    end
                else
                    Config.Error()
                end

        elseif data.payType == "bank" then        
            if xPlayer.getConfigcount('bank').money >= data.price then
                xPlayer.removeConfigcountMoney(data.payType, data.price)
                Config.Success()
                for k,v in pairs(data.cartArr) do
                    xPlayer.addInventoryItem(v.itemname, tonumber(v.count))
                end
            else
                Config.Error()
            end
        end
    end)
elseif Config.Framework == "NewESX" then

    ESX = exports['es_extended']:getSharedObject()

    RegisterNetEvent('meteo-shop:pay')
    AddEventHandler('meteo-shop:pay', function(data)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)

        if data.payType == "cash" then
            if xPlayer.getMoney() >= data.price then
                    xPlayer.removeMoney(data.price)
                    Config.Success()
                    for k,v in pairs(data.cartArr) do
                        xPlayer.addInventoryItem(v.itemname, tonumber(v.count))
                    end
                else
                    Config.Error()
                end

        elseif data.payType == "bank" then        
            if xPlayer.getConfigcount('bank').money >= data.price then
                xPlayer.removeConfigcountMoney(data.payType, data.price)
                Config.Success()
                for k,v in pairs(data.cartArr) do
                    xPlayer.addInventoryItem(v.itemname, tonumber(v.count))
                end
            else
                Config.Error()
            end
        end
    end)
elseif Config.Framework == "QBCore" then

    local QBCore = exports['qb-core']:GetCoreObject()

    RegisterNetEvent('meteo-shop:pay')
    AddEventHandler('meteo-shop:pay', function(data)
        print(json.encode(data))
        local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)

        if data.payType == "cash" then
            
            local Money = xPlayer.Functions.GetMoney('cash')

            if Money >= data.price then
                xPlayer.Functions.RemoveMoney('cash', data.price, "Shops")
                Config.Success()
                for k,v in pairs(data.cartArr) do
                    xPlayer.Functions.AddItem(v.itemname, tonumber(v.count))
                end
            else
                Config.Error()
            end

        
        elseif data.payType == "bank" then

            local Bank = xPlayer.Functions.GetMoney('bank')

            if Bank >= data.price then
                xPlayer.Functions.RemoveMoney('bank', data.price, "Shops")
                Config.Success()
                for k,v in pairs(data.cartArr) do
                    xPlayer.Functions.AddItem(v.itemname, tonumber(v.count))
                end
            else
                Config.Error()
            end
        end

    end)
elseif Config.Framework == "OLDQBCore" then

    QBcore = nil

    Citizen.CreateThread(function()
        while QBcore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
        end
    end)
    RegisterNetEvent('meteo-shop:pay')
    AddEventHandler('meteo-shop:pay', function(data)
        local src = source
        local xPlayer = QBcore.Functions.GetPlayer(src)

        if data.payType == "cash" then
            
            local Money = xPlayer.Functions.GetMoney('cash')

            if Money >= data.price then
                xPlayer.Functions.RemoveMoney('cash', data.price, "Shops")
                Config.Success()
                for k,v in pairs(data.cartArr) do
                    xPlayer.addInventoryItem(v.itemname, tonumber(v.count))
                end
            else
                Config.Error()
            end

        elseif data.payType == "bank" then

            local Bank = xPlayer.Functions.GetMoney('bank')
 
            if Bank >= data.price then
                xPlayer.Functions.RemoveMoney('bank', data.price, "Shops")
                Config.Success()
                for k,v in pairs(data.cartArr) do
                    xPlayer.addInventoryItem(v.itemname, tonumber(v.count))
                end
            else
                Config.Error()
            end
        end
    end)
else 
    print("104")
    print(Config.Framework)
    print("Error: Unrecognized framework selected.")
end