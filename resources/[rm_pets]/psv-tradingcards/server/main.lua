local QBCore = exports['qb-core']:GetCoreObject()
local delay = {}

function setContains(set, key)
    return set[key] ~= nil
end

for k, v in pairs(Config.Cards) do
    QBCore.Functions.CreateUseableItem(v.item, function(source, item)
        local src = source
        if v.sound then
            TriggerClientEvent("InteractSound_CL:PlayOnOne",src, v.sound, 0.3)
        end
        TriggerClientEvent('psv-tradingcards:displayCard', src, v.img, item)
    end)
end

RegisterNetEvent('psv-tradingcards:showPlayer', function(targetId, card, item)
    local tid = targetId
	TriggerClientEvent('psv-tradingcards:drawNui', tid, card, item)
end)

RegisterNetEvent('psv-tradingcards:gradecard', function(source, slot)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    Player.PlayerData.items[tonumber(slot)].info.graded = "True"
    TriggerClientEvent('QBCore:Notify', src, 'Card in slot '..slot..' has been graded a '..Player.PlayerData.items[tonumber(slot)].info.grade..' !')
    Player.Functions.SetInventory(Player.PlayerData.items)
end)


QBCore.Commands.Add("gradecard", "Grade a trading card (slot in your hotbar)", {{name="slot", help="Slot ID"}}, true, function(source, args)
    
    local slot = table.concat(args, " ")
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if (Player.PlayerData.job.name == Config.StoreJob) or (Config.UseBusiness == false) then
        if Player.Functions.RemoveItem(Config.Material, Config.MaterialAmmount) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Material], "remove", Config.MaterialAmmount)
            TriggerClientEvent("psv-tradingcards:client:gradecard",source, source, slot)
        else
            TriggerClientEvent('QBCore:Notify', source, 'You dont have enough glass!')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'For Trading Card Co. workers only!', 'error')
    end

end)

QBCore.Functions.CreateUseableItem(Config.BinderItemName, function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('cards:client:binder', src)
end)

QBCore.Functions.CreateUseableItem(Config.ToyBoxItemName, function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('cards:client:toychest', src)
end)

QBCore.Functions.CreateUseableItem(Config.ToyPackItemName, function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1, #Config.toys)
    if Player.Functions.RemoveItem(Config.ToyPackItemName, 1) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ToyPackItemName], "remove", 1)
        Player.Functions.AddItem(Config.toys[random], 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.toys[random]], "add", 1)
    end
end)

QBCore.Functions.CreateUseableItem(Config.BoosterBoxItemName, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        Player.Functions.AddItem(Config.BoosterPackItemName, Config.PacksPerBox)
        Wait(100)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.BoosterPackItemName], "add", Config.PacksPerBox)
    end
end) 

QBCore.Functions.CreateUseableItem(Config.BoosterPackItemName, function(source, item)
    local src = source
    TriggerClientEvent('psv-tradingcards:client:openpackanim', src)
    Wait(3000)
    if not setContains(delay, src) then
        delay[tostring(src)] = "False"
    end
	local Player = QBCore.Functions.GetPlayer(src)
	local amount = Config.CardsPerPack
    local keyset = {}
    for k in pairs(Config.Cards) do
        table.insert(keyset, k)
    end
    if delay[src] ~= "True" then
        Player.Functions.RemoveItem(Config.BoosterPackItemName, 1)
        
        delay[src] = "True"
        while amount > 0 do
            local val1 = math.random(1,10)
            local val2 = math.random(1,10)
            local val3 = math.random(1,10)
            local val4 = 0
            local result = exports.oxmysql:executeSync('SELECT * FROM fd_cards WHERE id = ?', {1})
            local Contacts = {}
            if result[1] ~= nil then
                val4 = result[1].num_cards + 1
                exports.oxmysql:execute('UPDATE fd_cards SET num_cards = ? WHERE id = 1', {json.encode(val4)})
            end

            local info = {
                graded      =       "False",
                centering   =     val1,
                color       =       val2,
                damage      =       val3,
                grade       =       math.floor(((val1+val2+val3)/3)+0.5),
                number      =        val4
            }
            amount = amount - 1
            local card = Config.Cards[keyset[math.random(#keyset)]]
            Player.Functions.AddItem(card.item, 1, false, info)
            TriggerClientEvent('psv-tradingcards:openBoosterPack', src, card.img, info.grade, info.number)
            if card.sound then
                TriggerEvent("InteractSound_CL:PlayOnOne", card.sound, 0.3)
            end
            Wait(6000)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[card.item], "add", 1)
            Wait(2000)
            delay[src] = "False"
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Already opening a pack!')
    end
end)