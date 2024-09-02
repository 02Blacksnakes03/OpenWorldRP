QBCore = exports['qb-core']:GetCoreObject()
-------------------------------- 

QBCore.Functions.CreateUseableItem(Config.Items["Seed"], function(source, item)
    UseItem(source)
end)

if Config.Inventory == "quasar" then 
    exports['qs-inventory']:CreateUsableItem(Config.Items["Seed"], function(source, item)
        UseItem(source)
    end)
end

-------------------------------- 

function nofity(source, text)
    QBCore.Functions.Notify(source, text)
end

-------------------------------- 

function removeitem(source, name, count)
    if Config.Inventory == "default" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveItem(name, count)
    elseif Config.Inventory == "quasar" then 
        exports['qs-inventory']:RemoveItem(source, name, count)
    else
        -- Other Export
    end
end

-------------------------------- 

function getitem(source, item)
    if Config.Inventory == "default" then
        local Player = QBCore.Functions.GetPlayer(source)
        local itemdata = Player.Functions.GetItemByName(item)
        if itemdata then item = itemdata.amount else item = 0 end
    elseif Config.Inventory == "quasar" then 
        item = exports['qs-inventory']:GetItemTotalAmount(source, item)
    else
        -- Other Export
    end
    if not item then return end
    return item
end

-------------------------------- 

function additem(source, item, count)
    if Config.Inventory == "default" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddItem(item, count)
    elseif Config.Inventory == "quasar" then 
        exports['qs-inventory']:AddItem(source, item, count)
    else
        -- Other Export
    end
end