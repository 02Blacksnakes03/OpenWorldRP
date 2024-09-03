cacheData = {}
publicBinunce = {}
objId = {}
obj = nil
lastCreateId = 0

-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        EVENT                                                        
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛

RegisterNetEvent('ac-hack:getData')
AddEventHandler('ac-hack:getData', function()

    exports['pa-lib-2']:acHackingGetHackData(function(data)
        cacheData = data  
    end)

    
    exports['pa-lib-2']:acHackingGetBinunceData(function(data)
        publicBinunce = data
    end)

end)

RegisterNetEvent('ac-hack:dataPostClient')
AddEventHandler('ac-hack:dataPostClient',function()
    TriggerClientEvent('ac-hack:setClient',-1,cacheData,publicBinunce)
    TriggerClientEvent('ac-hack:createObject',-1,cacheData)
end)

RegisterNetEvent('ac-hack:createUser')
AddEventHandler('ac-hack:createUser', function(xPlayer,build,identifier)
    if not cacheData then
        cacheData = {}
    end

    local userName = AC.UserNameStartLetter .. generateRandomString(12)
    local cryptoAddress = generateRandomHexString(12)
    local macAddress = generateRandomMACAddress()

    for _, v in ipairs(cacheData) do
        if v.identifier == identifier then
            return  
        end
    end

    MySQL.Async.execute('INSERT INTO ac_hack (`identifier`, `notes` , `apps` , `build` , `props` , `miner` , `username` , `cryptoaddress` , `macaddress` , `butcoin` , `temporaryCoin` , `connectWifiTime` ) VALUES (@identifier,@notes,@apps,@build,@props,@miner,@username,@cryptoaddress,@macaddress,@butcoin,@temporaryCoin,@connectWifiTime)',
    {
        ['@identifier'] = identifier, 
        ['@notes'] = json.encode({}), 
        ['@apps'] = json.encode({}), 
        ['@build'] = json.encode(build), 
        ['@props'] = json.encode({}), 
        ['@miner'] = json.encode({}), 
        ['@username'] = userName, 
        ['@cryptoaddress'] = cryptoAddress, 
        ['@macaddress'] = macAddress, 
        ['@butcoin'] = 0,
        ['@temporaryCoin'] = 0,
        ['@connectWifiTime'] = nil,
    })

    Wait(2000)

    MySQL.Async.fetchAll('SELECT * FROM ac_hack WHERE identifier = @identifier', {['@identifier'] = identifier}, function(result)
        for k, v in pairs(result) do
            data = {
                id = v.id,
                identifier = v.identifier,
                notes = v.notes and json.decode(v.notes) or {},
                apps = v.apps and json.decode(v.apps) or {},
                build = v.build and json.decode(v.build) or {},
                props = v.props and json.decode(v.props) or {},
                miner = v.miner and json.decode(v.miner) or {},
                username = v.username,
                cryptoaddress = v.cryptoaddress,
                macaddress = v.macaddress,
                butcoin = v.butcoin,
                temporaryCoin = v.temporaryCoin,
                connectWifiTime = v.connectWifiTime,
                openControl = v.openControl
            }
            lastCreateId = v.id
            table.insert(cacheData, data)
        end
    end)

    TriggerClientEvent('ac-hack:setClient', -1, cacheData)
    
end)

RegisterNetEvent('ac-hack:createProp')
AddEventHandler('ac-hack:createProp',function(prop,id)
    local src = source
    local xPlayer = GetPlayer(src)
    local identifier = GetPlayerCid(src)
    local propData = {} 
    local flag = false

    --eğer hiç data yoksa data oluştur ve itemin bilgisayar olup olmadığını kontrol et
    if cacheData == nil or #cacheData < 1 then
        if prop.itemType ~= "desk" then
            Notify(src,AC.Notify["firstItemControl"]["text"],AC.Notify["firstItemControl"]["msgType"],AC.Notify["firstItemControl"]["length"])
            TriggerClientEvent('ac-hack:deleteLastProp',src)
            return
        end
            buildData = {gpu = 0 , cpu = 0 , hdd = 0 , vpn = 0}
            
            TriggerEvent('ac-hack:createUser', xPlayer,buildData,identifier)
    
            Wait(5000)
    
            table.insert(propData, prop)
            updateCacheDataForIdentifier(identifier, "props", propData)
            updateCacheDataForIdentifier(identifier, "build", buildData)
            MySQL.Async.execute('UPDATE ac_hack SET `props` = @props WHERE identifier = @identifier', 
            {
                ['@props'] = json.encode(propData), 
                ['@identifier'] = identifier
            })
            TriggerClientEvent('ac-hack:setClient', -1, cacheData)
            return
    end


    for k,v in pairs(cacheData) do 
        if v.identifier == identifier then 
            flag = true
            propData = type(v.props) == 'string' and json.decode(v.props) or v.props or {}
        end
    end

    --eğer data varsa identifieri kontrol et , aynı identity varsa ve miner gelirse ekle desk gelirse uyar ve ekleme
    --2.blok eğer data varsa fakat identifier eşleşmiyorsa yeni bir data oluştur ve ilk itemin desk olmasını kontrol et
    for k , v in pairs(cacheData) do 
        if flag then 
            if prop.itemType == "desk" then
                Notify(src,AC.Notify["alreadyPc"]["text"],AC.Notify["alreadyPc"]["msgType"],AC.Notify["alreadyPc"]["length"])
                TriggerClientEvent('ac-hack:deleteLastProp',src)
                return
            end

            for x , y in pairs(v.props) do
                if y.itemType == "desk" then
                    local coords1 = y.position
                    local coords2 = prop.position
                    local distance = CalculateDistance(coords1, coords2)
                    if distance < AC.MinerDistance then
                        Notify(src,AC.Notify["minerSuccess"]["text"],AC.Notify["minerSuccess"]["msgType"],AC.Notify["minerSuccess"]["length"])
                        table.insert(propData, prop)
                        updateCacheDataForIdentifier(identifier, "props", propData)
                        MySQL.Async.execute('UPDATE ac_hack SET `props` = @props WHERE identifier = @identifier', 
                        {
                            ['@props'] = json.encode(propData), 
                            ['@identifier'] = identifier
                        })
                        TriggerClientEvent('ac-hack:setClient', -1, cacheData)
                        return
                    else 
                        Notify(src,AC.Notify["minerControl"]["text"],AC.Notify["minerControl"]["msgType"],AC.Notify["minerControl"]["length"])
                        TriggerClientEvent('ac-hack:deleteLastProp',src)
                        return
                    end 
                end
            end
        else
                
            if prop.itemType ~= "desk" then
                Notify(src,AC.Notify["firstItemControl"]["text"],AC.Notify["firstItemControl"]["msgType"],AC.Notify["firstItemControl"]["length"])
                TriggerClientEvent('ac-hack:deleteLastProp',src)
                return
            end

            buildData = {gpu = 0 , cpu = 0 , hdd = 0 , vpn = 0}
        
            TriggerEvent('ac-hack:createUser', xPlayer,buildData,identifier)
    
            Wait(5000)
    
            table.insert(propData, prop)
            updateCacheDataForIdentifier(identifier, "props", propData)
            updateCacheDataForIdentifier(identifier, "build", buildData)
            MySQL.Async.execute('UPDATE ac_hack SET `props` = @props WHERE identifier = @identifier', 
            {
                ['@props'] = json.encode(propData), 
                ['@identifier'] = identifier
            })
            TriggerClientEvent('ac-hack:setClient', -1, cacheData)
            return
        end
    end
end)



function NotifyClient(src, message, data)
    TriggerClientEvent(message, src, data)
end


RegisterNetEvent('ac-hack:sellItemServer')
AddEventHandler('ac-hack:sellItemServer', function(item,coin,id)
    local xPlayer =  GetPlayer(source)
    AddItem(source, item, 1, {})
    coinUpdate(tonumber(coin),tonumber(id))
end)

RegisterNetEvent('ac-hack:addLastProp')
AddEventHandler('ac-hack:addLastProp', function(item)
    local xPlayer =  GetPlayer(source)
    if item == nil then return end
    AddItem(source, item, 1, {})
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then 
        return
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then 
        TriggerEvent('ac-hack:getData')
        return
    end
end)

AddEventHandler('playerDropped',function(source)
    TriggerClientEvent('ac-hack:deleteProp',source)
end)




-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        FUNCTION                                                    
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛



function generateRandomString(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    math.randomseed(os.time())

    local randomString = ""
    for i = 1, length do
        local randomIndex = math.random(1, #charset)
        randomString = randomString .. charset:sub(randomIndex, randomIndex)
    end

    return randomString
end

function generateRandomHexString(length)
    local charset = "0123456789ABCDEF"
    math.randomseed(os.time())

    local randomHexString = "0x"
    for i = 1, length do
        local randomIndex = math.random(1, #charset)
        randomHexString = randomHexString .. charset:sub(randomIndex, randomIndex)
    end

    return randomHexString
end

function generateRandomMACAddress()
    local charset = "0123456789ABCDEF"
    local macAddress = ""

    for i = 1, 12 do
        local randomIndex = math.random(1, #charset)
        macAddress = macAddress .. charset:sub(randomIndex, randomIndex)

        if i % 2 == 0 and i < 12 then
            macAddress = macAddress .. ":"
        end
    end

    return macAddress
end


function CalculateDistance(coords1, coords2)
    local x1, y1, z1 = coords1.x, coords1.y, coords1.z
    local x2, y2, z2 = coords2.x, coords2.y, coords2.z

    local dx = x1 - x2
    local dy = y1 - y2
    local dz = z1 - z2

    return math.sqrt(dx * dx + dy * dy + dz * dz)
end


function updateCacheData(id, property, value)
    for k, v in pairs(cacheData) do
        if v.id == id then
            v[property] = value
        end
    end
end

function updateCacheDataForIdentifier(identifier, property, value)
    for k, v in pairs(cacheData) do
        if v.identifier == identifier then
            v[property] = value
        end
    end
end

function addCoin(coin,id) 
    for k, v in pairs(cacheData) do 
        if v.id == id then
            v.butcoin = tonumber(v.butcoin)
            v.butcoin = v.butcoin + coin
            updateCacheData(id, "butcoin", v.butcoin)
            MySQL.Async.execute('UPDATE ac_hack SET `butcoin` = @butcoin WHERE id = @id', 
            {
                ['@butcoin'] = v.butcoin, 
                ['@id'] = id
            })
            TriggerClientEvent('ac-hack:setClient', -1, cacheData)
        end
    end
end

function coinUpdate(coin,id) 
    for k, v in pairs(cacheData) do 
        if v.id == id then
            v.butcoin = tonumber(v.butcoin)
            v.butcoin = v.butcoin - coin
            updateCacheData(id, "butcoin", v.butcoin)
            MySQL.Async.execute('UPDATE ac_hack SET `butcoin` = @butcoin WHERE id = @id', 
            {
                ['@butcoin'] = v.butcoin, 
                ['@id'] = id
            })
            TriggerClientEvent('ac-hack:setClient', -1, cacheData)
        end
        return v.butcoin
    end
end

function tempCoinUpdate(coin,id) 
    for k, v in pairs(cacheData) do 
        if v.id == id then
            v.temporaryCoin = tonumber(v.temporaryCoin)
            v.temporaryCoin = v.temporaryCoin + coin
            updateCacheData(v.id, "temporaryCoin", v.temporaryCoin)
            MySQL.Async.execute('UPDATE ac_hack SET `temporaryCoin` = @temporaryCoin WHERE id = @id', 
            {
                ['@temporaryCoin'] = v.temporaryCoin, 
                ['@id'] = id
            })
            TriggerClientEvent('ac-hack:setClient', -1, cacheData)
        end
    end
end

function getCoin(id)
    for k, v in pairs(cacheData) do 
        if v.id == id then
            return v.butcoin
        end
    end
end




-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        CALLBACK                                                    
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛

CreateCallback('ac-hack:installApp', function(source,cb,data,id)
    local xPlayer =  GetPlayer(source)
    local identifier = GetPlayerCid(source)
    local installApp = false
    for k, v in pairs(cacheData) do 
        if v.id == id then
                if tonumber(data.appCoin) <= tonumber(getCoin(id)) then
                    coinUpdate(tonumber(data.appCoin),id)
                else
                    cb(false)
                    return
                end

            if v.apps then
                for x, y in pairs(v.apps) do
                    if y.appaNme == data.appName then
                        cb(false)
                        return
                    end
                end
                v.apps = type(v.apps) == 'string' and json.decode(v.apps) or v.apps or {}
                    table.insert(v.apps, data)
                    updateCacheData(v.id, "apps", v.apps)
                    installApp = true
            else
                v.apps = {}
                table.insert(v.apps, data)
                updateCacheData(v.id, "apps", v.apps)
                installApp = true
            end
        end
        if installApp then
            MySQL.Async.execute('UPDATE ac_hack SET `apps` = @apps WHERE id = @id', 
            {
                ['@apps'] = json.encode(v.apps), 
                ['@id'] = id
            })
            TriggerClientEvent('ac-hack:setClient', -1, cacheData)
            cb(true)
        end
    end
end)


CreateCallback('ac-hack:sendCrypto', function(source, cb, data,id)
    local xPlayer =  GetPlayer(source)
    local sendCoin = false

    for k, v in pairs(cacheData) do 
        if v.id == id then
            if v.connectWifiTime == nil then
                cb(false)
                return
            end

            v.butcoin = tonumber(v.butcoin)
            data.amount = tonumber(data.amount)

            if v.butcoin >= data.amount then
                local newCoinCount = v.butcoin - data.amount
                coinUpdate(data.amount, id)

                MySQL.Async.execute('INSERT INTO ac_hack_public_binunce (`senderUserName`, `senderAddress`,`receiverAddress`,`macAddress`,`amount`) VALUES (@senderUserName,@senderAddress,@receiverAddress,@macAddress,@amount)', 
                {
                    ['@senderUserName'] = v.username, 
                    ['@senderAddress'] = v.cryptoaddress, 
                    ['@receiverAddress'] = data.address, 
                    ['@macAddress'] = v.macaddress, 
                    ['@amount'] = data.amount 
                })

                sendCoin = true
            else 
                sendCoin = false
                cb(false)
            end
        end
    end

    if sendCoin then
        local found = false
        for k, v in pairs(cacheData) do 
            if v.cryptoaddress == data.address then
                addCoin(data.amount, v.id)
                cb(true)
                break
            end
        end
    
        if not found then
            cb(false)
        end
    end
end)


CreateCallback('ac-hack:scan',function(source,cb,data,id)
    local xPlayer =  GetPlayer(source)
    local scanCoin = AC.ScanCoin
    if scanCoin < tonumber(getCoin(id)) then
        newCoin = coinUpdate(scanCoin,id)
        cb({bool=true,coin=newCoin})
    else
        cb(false)
    end
end)

CreateCallback('ac-hack:createNote', function(source,cb,data,id)
    local xPlayer =  GetPlayer(source)
    local note = {}
    local acTable = {}

    for k, v in pairs(cacheData) do
        if v.id == id then
            acTable = type(v.notes) == 'string' and json.decode(v.notes) or v.notes or {}
            local uniqueId = #acTable + 1
            data.id = uniqueId
            table.insert(acTable, data)  
            updateCacheData(v.id, "notes", acTable)  
            note = acTable
            break 
        end
    end

    MySQL.Async.execute('UPDATE ac_hack SET `notes` = @notes WHERE id = @id', 
    {
        ['@notes'] = json.encode(note), 
        ['@id'] = id
    })
    cb(note)
    TriggerClientEvent('ac-hack:setClient',source,cacheData)
end)

CreateCallback('ac-hack:editNote', function(source,cb,data,id)
    local xPlayer =  GetPlayer(source)
    local note = {}
    local acTable = {}

    for k, v in pairs(cacheData) do
        if v.id == id then
            acTable = type(v.notes) == 'string' and json.decode(v.notes) or v.notes or {}
            for i, j in pairs(acTable) do
                if j.id == data.id then
                    acTable[i] = data
                    break
                end
            end
            updateCacheData(v.id, "notes", acTable)  
            note = acTable
            break 
        end
    end

    MySQL.Async.execute('UPDATE ac_hack SET `notes` = @notes WHERE id = @id', 
    {
        ['@notes'] = json.encode(note), 
        ['@id'] = id
    })
    cb(note)
    TriggerClientEvent('ac-hack:setClient',source,cacheData)
end)

CreateCallback('ac-hack:deleteNote', function(source,cb,data,id)
    local xPlayer =  GetPlayer(source)
    local note = {}
    local acTable = {}

    for k, v in pairs(cacheData) do
        if v.id == id then
            acTable = type(v.notes) == 'string' and json.decode(v.notes) or v.notes or {}
            for i, j in pairs(acTable) do
                if tonumber(j.id) == tonumber(data.id) then
                    table.remove(acTable, i)
                    break
                end
            end
            updateCacheData(v.id, "notes", acTable)  
            note = acTable
            break 
        end
    end

    MySQL.Async.execute('UPDATE ac_hack SET `notes` = @notes WHERE id = @id', 
    {
        ['@notes'] = json.encode(note), 
        ['@id'] = id
    })
    cb(note)
    TriggerClientEvent('ac-hack:setClient',source,cacheData)
end)


CreateCallback('ac-hack:buildItemControl', function(source,cb,itemName,itemX,id)
    local xPlayer =  GetPlayer(source)
    local item = GetItem(source, itemName)
    local buildData = {}

    if item ~= nil then 
        if ItemCountControl(source, itemName,1) then
            local res = MySQL.Sync.fetchAll("SELECT * FROM `ac_hack` WHERE id = '" .. id .. "'  ")
            if #res > 0 then 
                buildData = json.decode(res[1].build) or {}
                buildData[itemX] = 100;
                
                MySQL.Async.execute('UPDATE ac_hack SET `build` = @build WHERE id = @id', 
                {
                    ['@build'] = json.encode(buildData), 
                    ['@id'] = id
                })
                updateCacheData(id, "build", buildData)
            end

            if buildData.cpu and buildData.hdd and buildData.vpn and buildData.gpu then 
                if tonumber(buildData.cpu) > 0 and tonumber(buildData.hdd)  > 0 and tonumber(buildData.vpn) > 0 and tonumber(buildData.gpu) then
                    MySQL.Async.execute('UPDATE ac_hack SET `openControl` = @openControl WHERE id = @id', 
                    {
                        ['@openControl'] = 1, 
                        ['@id'] = id
                    })
                    updateCacheData(id, "openControl", 1)
                end
            end

            -- if tonumber(buildData.cpu) > 0 and tonumber(buildData.hdd)  > 0 and tonumber(buildData.vpn) > 0 then
            --     MySQL.Async.execute('UPDATE ac_hack SET `openControl` = @openControl WHERE id = @id', 
            --     {
            --         ['@openControl'] = 1, 
            --         ['@id'] = id
            --     })
            --     updateCacheData(id, "openControl", 1)
            -- end
            RemoveItem(source, itemName, 1, {})
            cb(true)
        else
            cb(false)
        end
    end
    TriggerClientEvent('ac-hack:setClient', -1, cacheData)
end)

CreateCallback('ac-hack:buyDroneItem', function(source,cb,data)
    local xPlayer =  GetPlayer(source)
    local item = GetItem(source, data.itemName)
    if item ~= nil then 
        if ItemCountControl(source,data.itemName,1) then
            RemoveItem(source, data.itemName, 1, {})
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end

end)


-- CreateCallback('ac-hack:connectWifi', function(source,cb,data,id)
--     local xPlayer =  GetPlayer(source)
    
--     local currentTimestamp = os.time()

--     local millisecondsToAdd = AC.WifiConnectionTime[data.level].time

--     local newTimestamp = currentTimestamp + math.floor(millisecondsToAdd / 1000)

--     local newTime = os.date("%H:%M", newTimestamp)

--     updateCacheData(id, "connectWifiTime", newTime)

--     MySQL.Async.execute('UPDATE ac_hack SET `connectWifiTime` = @connectWifiTime WHERE id = @id', 
--     {
--         ['@connectWifiTime'] = newTime, 
--         ['@id'] = id
--     })
--     cb(newTime)
-- end)


CreateCallback('ac-hack:connectWifi', function(source, cb, data, id)
    local xPlayer = GetPlayer(source)

    local currentTimestamp = os.time()

    local millisecondsToAdd = AC.WifiConnectionTime[data.level].time

    local newTimestamp = currentTimestamp + math.floor(millisecondsToAdd / 1000)

    local newTime = os.date("%Y-%m-%d %H:%M:%S", newTimestamp)

    updateCacheData(id, "connectWifiTime", newTime)

    MySQL.Async.execute('UPDATE ac_hack SET `connectWifiTime` = @connectWifiTime WHERE id = @id', 
    {
        ['@connectWifiTime'] = newTime, 
        ['@id'] = id
    })

    cb(newTime)
end)


CreateCallback('ac-hack:getInventory', function(source,cb,searchItem)
    local xPlayer =  GetPlayer(source)
    local items = GetInventory(source)
    local itemArr = {}
    for k, v in pairs(items) do
        for x , y in pairs(searchItem) do 
        if v.name == y.itemName  then
                table.insert(itemArr, v)
            end 
        end
    end
    cb(itemArr)
end)


CreateCallback('ac-hack:putItem', function(source, cb, data, id)
    local src = source
    local xPlayer = GetPlayer(source)
    local propId = data.propId
    local path = data.item["img"]
    local itemName = path:match("/([^/]+)$")
    local itemCurrentName = itemName:gsub("%.png$", "")

    for k, v in pairs(cacheData) do
        if v.id == id then
            local minerData = type(v.miner) == 'string' and json.decode(v.miner) or v.miner or {}
            if minerData == nil then
                minerData = {}
            end

            local newItem = {
                propId = propId,
                item = itemName,
                durability = 0
            }

            table.insert(minerData, newItem)
            updateCacheData(v.id, "miner", minerData)
            RemoveItem(source, itemCurrentName, 1, {})
            MySQL.Async.execute('UPDATE ac_hack SET `miner` = @miner WHERE id = @id', 
            {
                ['@miner'] = json.encode(minerData), 
                ['@id'] = v.id
            })
            TriggerClientEvent('ac-hack:setClient', -1, cacheData)
            cb(true)
            break
        end
    end
end)


CreateCallback('ac-hack:propItemControl', function(source,cb,data)
    local xPlayer =  GetPlayer(source)
    local item = GetItem(source, data.itemName)
    if item ~= nil then 
        if ItemCountControl(source, data.itemName,1) then
            RemoveItem(source, data.itemName, 1, {})
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end

end)

CreateCallback('ac-hack:objUpdate', function(source, cb, obj,id)
    local src = source
    local xPlayer =  GetPlayer(src)
    local obj = obj

    for k, v in pairs(cacheData) do
        if v.id == id then
            v.props = type(v.props) == 'string' and json.decode(v.props) or v.props or {}
            
            for i, j in pairs(v.props) do
                if j.itemType == "miner" and tonumber(j.objId) == tonumber(obj.id) then
                    v.props[i].linked = true
                    updateCacheData(v.id, "props", v.props)
                    MySQL.Async.execute('UPDATE ac_hack SET `props` = @props WHERE id = @id', 
                    {
                        ['@props'] = json.encode(v.props), 
                        ['@id'] = id
                    })
                    
                    TriggerClientEvent('ac-hack:setClient', -1, cacheData)
                    return cb(cacheData)
                end
            end
        end
    end

    cb(false)
end)


CreateCallback('ac-hack:setWallet', function(source,cb,id)
    local xPlayer =  GetPlayer(source)
    for k, v in pairs(cacheData) do
        if v.id == id then
            if tonumber(v.temporaryCoin) > 0 then

            v.butcoin = v.butcoin + v.temporaryCoin
            updateCacheData(v.id, "butcoin", v.butcoin)
            MySQL.Async.execute('UPDATE ac_hack SET `butcoin` = @butcoin WHERE id = @id', 
            {
                ['@butcoin'] = v.butcoin, 
                ['@id'] = id
            })
            MySQL.Async.execute('UPDATE ac_hack SET `temporaryCoin` = @temporaryCoin WHERE id = @id', 
            {
                ['@temporaryCoin'] = 0, 
                ['@id'] = id
            })
            updateCacheData(v.id, "temporaryCoin", 0)
            updateCacheData(v.id, "butcoin", v.butcoin)

            TriggerClientEvent('ac-hack:setClient', -1, cacheData)
            cb(v.butcoin)
        else
            cb(false)    
            end
        end
    end
end)


-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        THREAD                                                    
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛

--wifi time control
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000) 

        MySQL.Async.fetchAll('SELECT id, connectWifiTime FROM ac_hack', {}, function(result)
            local currentTime = os.time()

            if result then
                for _, data in pairs(result) do
                    if data.connectWifiTime ~= nil then

                        local connectTime = data.connectWifiTime / 1000  -- Unix zaman damgasını saniyeye dönüştür
                        local formattedDate = os.date("%Y-%m-%d %H:%M:%S", connectTime)
                        local timestampFromDatabase = data.connectWifiTime

                        local seconds = timestampFromDatabase / 1000
                        
                        local dateTable = os.date("*t", seconds)
                        
                        local formattedDate = string.format("%04d-%02d-%02d %02d:%02d:%02d",
                            dateTable.year, dateTable.month, dateTable.day,
                            dateTable.hour, dateTable.min, dateTable.sec)
                        
                        local currentTimestamp = os.time()
                        if seconds < currentTimestamp then
                            MySQL.Async.execute('UPDATE ac_hack SET connectWifiTime = NULL WHERE id = @id', {
                                ['@id'] = data.id
                            })
                        end                    
                    end
                end
            end
        end)

        for k, v in pairs(cacheData) do
            if next(v.build) ~= nil then
                if v.build["gpu"] > 0 then
                    local currentValue = v.temporaryCoin
                    currentValue = currentValue + (1 / (6 * 24))
                    local ondalikString = string.format("%.5f", currentValue)

                    updateCacheData(v.id, "temporaryCoin", tonumber(ondalikString))
                    MySQL.Async.execute('UPDATE ac_hack SET `temporaryCoin` = @temporaryCoin WHERE id = @id', 
                    {
                        ['@temporaryCoin'] = tonumber(ondalikString), 
                        ['@id'] = v.id
                    })
                    TriggerClientEvent('ac-hack:setClient', -1, cacheData)
                end
            end
        end
    end
end)


-- durabilty control
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3600000) --3600000

        local result = MySQL.Sync.fetchAll("SELECT * FROM ac_hack")

        if result and #result > 0 then
            for _, row in ipairs(result) do
                local buildData = json.decode(row.build) or {}

                for k, v in pairs(buildData) do
                    if v >= 10 then
                        buildData[k] = v - 10
                    else
                        buildData[k] = 0
                    end
                end
                MySQL.Async.execute('UPDATE ac_hack SET `build` = @build WHERE id = @id', {
                    ['@build'] = json.encode(buildData),
                    ['@id'] = row.id
                })
                
                if buildData.gpu == 0 or buildData.hdd == 0 or buildData.cpu == 0 or buildData.vpn == 0 then
                    MySQL.Async.execute('UPDATE ac_hack SET `openControl` = @openControl WHERE id = @id', {
                        ['@openControl'] = 0,
                        ['@id'] = row.id
                    })

                    MySQL.Async.execute('UPDATE ac_hack SET `build` = @build WHERE id = @id', {
                        ['@build'] = json.encode({}),
                        ['@id'] = row.id
                    })

                end
            end
        end


        if result and #result > 0 then
            for _, row in ipairs(result) do
                local minerData = json.decode(row.miner) or {}
                local propsData = json.decode(row.props)

                if #minerData > 0 then 
                for key, value in pairs(minerData) do
                    for k, v in pairs(AC.MinerRackItem) do
                        for x , y in pairs(propsData) do
                        local path = value.item
                        local id =  value.propId
                        newName = path:match("(.+)%..+")
                        if newName == v.itemName then
                            if tonumber(id) == tonumber(y.objId) then
                                if y.linked == true then 
                                    row.temporaryCoin = row.temporaryCoin +  v.multiplier
                                end
                            end
                        end
                    end
                end

                    minerData[key].durability = math.max(0, value.durability + 10)
                    if minerData[key].durability >= 100 then
                        table.remove(minerData, key)
                    end
                end


                MySQL.Async.execute('UPDATE ac_hack SET `miner` = @miner WHERE id = @id', {
                    ['@miner'] = json.encode(minerData),
                    ['@id'] = row.id
                })

                MySQL.Async.execute('UPDATE ac_hack SET `temporaryCoin` = @temporaryCoin WHERE id = @id', {
                    ['@temporaryCoin'] = row.temporaryCoin,
                    ['@id'] = row.id
                })
                updateCacheData(row.id, "miner", minerData)
                updateCacheData(row.id, "temporaryCoin", row.temporaryCoin)
                TriggerClientEvent('ac-hack:setClient', -1, cacheData)

                end
            end
        end
    end
end)
