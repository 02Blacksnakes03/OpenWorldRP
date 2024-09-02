local lastNapping = 0
local queryRoom = false

QBCore.Functions.CreateCallback('kidnapping:server:checkQueryRoom', function(source, cb)
    cb(queryRoom)
end)

RegisterServerEvent('kidnapping:server:syncQueryRoom')
AddEventHandler('kidnapping:server:syncQueryRoom', function()
    queryRoom = not queryRoom
end)

QBCore.Functions.CreateCallback('kidnapping:server:checkTime', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    
    if (os.time() - lastNapping) < Config['Kidnapping']['nextNapping'] and lastNapping ~= 0 then
        local seconds = Config['Kidnapping']['nextNapping'] - (os.time() - lastNapping)
        TriggerClientEvent('QBCore:Notify', src, Strings['wait_nextnapping'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'], "primary")
        cb(false)
    else
        lastNapping = os.time()
        cb(true)
    end
end)

RegisterNetEvent('kidnapping:server:policeAlert')
AddEventHandler('kidnapping:server:policeAlert', function(coords)
    local players = QBCore.Functions.GetPlayers()
    
    for i = 1, #players do
        local player = QBCore.Functions.GetPlayer(players[i])
        if player.PlayerData.job.name == 'police' then
            TriggerClientEvent('kidnapping:client:policeAlert', players[i], coords)
        end
    end
end)

RegisterServerEvent('kidnapping:server:giveVideoRecord')
AddEventHandler('kidnapping:server:giveVideoRecord', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    if player then
        player.Functions.AddItem(Config['Kidnapping']['videoRecordItem'], 1)
    end
end)

RegisterServerEvent('kidnapping:server:finish')
AddEventHandler('kidnapping:server:finish', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    if player then
        local count = player.Functions.GetItemByName(Config['Kidnapping']['videoRecordItem'])
        if count ~= nil and count.amount > 0 then -- Crash, drop, etc. that may occur after taking a video recording in the previous job. I make him sell all the video recordings on it for situations like.
            player.Functions.RemoveItem(Config['Kidnapping']['videoRecordItem'], count.amount)
            player.Functions.AddMoney('cash', count.amount * Config['Kidnapping']['rewardCash'])
        end
        local random = math.random(1, #Config['Kidnapping']['randomRewardItems'])
        local item = Config['Kidnapping']['randomRewardItems'][random]
        player.Functions.AddItem(item, 1)
    end
end)