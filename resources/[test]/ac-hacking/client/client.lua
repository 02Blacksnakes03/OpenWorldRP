playerData = {}
cacheData = {}
buildCacheData = {}
binunceCacheData = {}
allObject = {}
sell = false
randomCoords = nil
torbaci = nil
currentObject = nil
objectHash = nil
lastPropItem = nil
itemSell = nil
coinSell = 0
local modelsToLoad = {"w_am_case","ch_prop_casino_drone_02a"}
menuId = 0

RegisterCommand("props", function()
    SetNuiFocus(1, 1)
    SendNUIMessage({
        action = "openProps",
        data = AC.PropsAll,
    })
end)


function openMenu(id)
    menuId = id

    exports["pa-lib-2"]:openMenuFunc(function(data)
        if not data then 
            Notify("You don't have the necessary parts to use the computer." , "error")
            return
        end
        SetNuiFocus(1, 1)

        SendNUIMessage({
            action = "open",
            data = data,
            config = AC
        })
    end,cacheData,binunceCacheData,menuId)
    
end


function openBuildPage(id)
    menuId = id
    SetNuiFocus(1, 1)

    local sendData = nil
    for _, v in pairs(cacheData) do
        if tonumber(id) == tonumber(v.id) then
            sendData = v["build"]
            break
        end
    end    
    TriggerCallback('ac-hack:getInventory', function(inventory)
        SendNUIMessage({
            action = "openBuild",
            data = {
                sendData = sendData,
                inventory = inventory,
                
            }
        })
    end,AC.BuildItemName)
end

function openMiner(id)
    TriggerCallback('ac-hack:getInventory', function(inventory)
        for k, v in pairs(cacheData) do
                if menuId == v.id then
                    SetNuiFocus(1, 1)
                    if #v.miner == 0 then
                        SendNUIMessage({
                            action = "openMiner",
                            data = {
                                inventory = inventory,
                                propId = id,
                                empty = true,
                                miner = false
                            }
                        })
                    else
                        local matchingMiners = {}
                        for x, y in pairs(v.miner) do
                            if y.propId == id then
                                table.insert(matchingMiners, y)
                            end
                        end

                        if #matchingMiners > 0 then
                            SendNUIMessage({
                                action = "openMiner",
                                data = {
                                    inventory = inventory,
                                    propId = id,
                                    miner = matchingMiners,
                                    props = v.props,
                                    empty = false
                                }
                            })
                        else
                            SendNUIMessage({
                                action = "openMiner",
                                data = {
                                    inventory = inventory,
                                    propId = id,
                                    props = v.props,
                                    empty = true
                                }
                            })
                        end
                    end
                end
        end
    end, AC.MinerRackItem)
end

function loadModels(models)
    for _, model in ipairs(models) do
        RequestModel(model)
    end
    while not AreModelsLoaded(models) do
        Wait(500)
    end
end

function AreModelsLoaded(models)
    for _, model in ipairs(models) do
        if not HasModelLoaded(model) then
            return false
        end
    end
    return true
end

RegisterNUICallback("buildControl",function(data,cb)
    TriggerCallback('ac-hack:buildItemControl', function(bool) 
        data = {
            bool = bool,
            itemImg = AC.BuildItemName[data.item].itemImg,
        }
        cb(data)
    end, AC.BuildItemName[data.item].itemName,data.item,menuId)
end)

RegisterNUICallback("close", function()
    SetNuiFocus(0, 0)
end)

RegisterNUICallback("scanWifi", function(data,cb)
    TriggerCallback('ac-hack:scan', function(serverCb) 
        cb(serverCb)
    end, data,menuId)
end)

RegisterNUICallback("sendCrypto", function(data,cb)
    newCoin = 0

    TriggerCallback('ac-hack:sendCrypto', function(bool)
        for k, v in pairs(cacheData) do
            
            if tonumber(menuId) == tonumber(v.id) then
                if v.connectWifiTime == nil then
                    cb("wifinil")
                    return
                end
                newCoin = v.butcoin
            end
        end

        returnData = {
            bool = bool,
            newCoin = newCoin
        }
        cb(returnData)
    end,data,menuId)
end)

RegisterNUICallback("createNote", function(data,cb)
    TriggerCallback('ac-hack:createNote', function(serverCb) 
        cb(serverCb)
    end, data,menuId)
end)

RegisterNUICallback("editNote", function(data,cb)
    TriggerCallback('ac-hack:editNote', function(serverCb) 
        cb(serverCb)
    end, data,menuId)
end)

RegisterNUICallback("deleteNote", function(data,cb)
    TriggerCallback('ac-hack:deleteNote', function(serverCb) 
        cb(serverCb)
    end, data,menuId)
end)

RegisterNUICallback("installApp",function(data,cb)
    TriggerCallback('ac-hack:installApp', function(serverCb) 
        cb(serverCb)
    end, data,menuId)
end)

RegisterNUICallback("connectWifi",function(data,cb)
    TriggerCallback('ac-hack:connectWifi', function(serverCb) 
        cb(serverCb)
    end, data,menuId)
end)

RegisterNUICallback("setWallet",function(data,cb)
    TriggerCallback('ac-hack:setWallet', function(serverCb) 
        cb(serverCb)
    end, menuId)
end)

RegisterNUICallback('deleteProp',function()
    DeleteEntity(currentObject)
    DeleteObject(currentObject)
    currentObject = nil
    TriggerServerEvent('ac-hack:addLastProp', lastPropItem)
    lastPropItem = nil
end)

RegisterNUICallback('saveBuild', function(data,cb)

    for k , v in pairs(AC.PropsAll) do
        if v.hash == tostring(objectHash) then
            data = {
                rotation = GetEntityRotation(currentObject),
                position = GetEntityCoords(currentObject),
                heading = GetEntityHeading(currentObject),
                name = v.name,
                hash = v.hash,
                propname = v.propname,
                itemType = v.itemType,
                objId = math.random(1, 1000000),
                linked = false
            }
            TriggerServerEvent('ac-hack:createProp', data, menuId)

            if v.itemType == "miner" then
                SendNUIMessage({
                    action = "newMiner",
                    data = {
                        data = data,
                    }
                })
            end

        end
    end

end)


RegisterNUICallback('linked', function(data,cb)
    TriggerCallback('ac-hack:objUpdate', function(bool)
        cb(bool)
     end, data,menuId)
end)


RegisterNUICallback('openNui', function(data,cb)
    SetNuiFocus(1, 1)
end)

-- ac-hack client.lua

RegisterNUICallback("openProps", function(data, cb)
    flag = false
    
    exports['pa-lib-2']:propItemControlFunc(function(serverCb) 
        if serverCb then
            lastPropItem = data.itemName
            objectName = data.propName
            objectHash = data.hash
            local playerPed = PlayerPedId()
            local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0, 1.0, 0)
            local model = joaat(objectName)

            currentObject = CreateObject(model, offset.x, offset.y, offset.z, true, false, false)

            Citizen.CreateThread(function()
                while flag do 
                    Wait(100)
                    SendNUIMessage({
                        action = "setPropsData",
                        data = {
                            rotation = GetEntityRotation(currentObject),
                            position = GetEntityCoords(currentObject),
                        }
                    })
                end
            end)

            local objectPositionData = exports.object_gizmo:useGizmo(currentObject) 

            FreezeEntityPosition(currentObject, true)

        else
            cb(false)
        end
    end, data)
end)


RegisterNUICallback("buyDroneItem",function(data,cb)
    for k, v in pairs(cacheData) do
    if CoreName == "es_extended" then
        if playerData.identifier == v.identifier then
            if v.connectWifiTime == nil then
                cb("wifinil")
            end
        end
    else
        if tonumber(playerData.citizenid) == tonumber(v.identifier) then
            if v.connectWifiTime == nil then
                cb("wifinil")
            else
                cb("success")
            end
        end
        end
    end

    randomCoords = AC.BluePrintNpcCoords[math.random(1, #AC.BluePrintNpcCoords)]
    SetNewWaypoint(randomCoords.coords.x, randomCoords.coords.y)
    if data.myItem == "drone" then 
        sell(data.item,data.coin,data.myItem)
    else    
        local randomPed = AC.RandomCreatePed[math.random(1, #AC.RandomCreatePed)]
        
        local hash = GetHashKey(randomPed.hash)
        if not HasModelLoaded(hash) then
            RequestModel(hash)
            Citizen.Wait(3500)
        end
        while not HasModelLoaded(hash) do
            Citizen.Wait(3500)
        end
        torbaci = CreatePed(4, hash, randomCoords.coords.x, randomCoords.coords.y, randomCoords.coords.z, 0.0, false, true)
        sell(data.item,data.coin,data.myItem)
    end
    cb("success")
end)

RegisterNUICallback("putItem", function(data,cb)
    TriggerCallback('ac-hack:putItem', function(serverCb) 
        cb(serverCb)
    end, data,menuId)
end)

function sell(item,coin,sellType) 
    sleep = 1000
    itemSell = item
    coinSell = coin
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    if sellType == "drone" then 
        createDrone(randomCoords)

        while true do 
            local playerCoords = GetEntityCoords(playerPed)
            local px, py, pz = table.unpack(randomCoords.coords)
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, px, py, pz)
            if distance ~= -1 and distance <= 1.5 then
                item = {["item"] = {[1] = {name = "Open",event = "ac-hack:sellItem"}}}
                exports["ac-text"]:openTextUi(item,randomCoords.coords,3)
                sleep = 1
            end
            Citizen.Wait(sleep)
        end

    else
    loadAnimDict("mp_common")
        while true do 
            local playerCoords = GetEntityCoords(playerPed)
            local px, py, pz = table.unpack(randomCoords.coords)
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, px, py, pz)
            if distance ~= -1 and distance <= 1.5 then
                sleep = 1
                TaskPlayAnim(playerPed, 'mp_common', 'givetake1_b', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
                TaskPlayAnim(torbaci, 'mp_common', 'givetake1_b', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
                Citizen.Wait(3500)
                ClearPedTasks(torbaci)
                ClearPedTasks(playerPed)
                TriggerServerEvent('ac-hack:sellItemServer', item,coin,menuId)
                TaskGoStraightToCoord(torbaci, px+25.0, py+25.0, pz, 1.0, -1, 0.0, 0.0)
                Wait(10000)
                DeletePed(torbaci)
                break
            end 
            Citizen.Wait(sleep)
        end
    end
end


RegisterNetEvent('ac-hack:sellItem')
AddEventHandler('ac-hack:sellItem', function()
    TriggerServerEvent('ac-hack:sellItemServer', itemSell,coinSell,menuId)
    -- local px, py, pz = table.unpack(randomCoords.coords)
    -- head = 0
    -- Wait(1000)
    -- while head < 50 do 
    --     Wait(30)
    --     head = head + 0.1
    --     SetEntityCoords(drone, px, py, pz+head)
    --     SetEntityCoords(moneyBag, px, py, pz+head)
    -- end
    DeleteEntity(drone)
    DeleteObject(drone)
    DeleteEntity(moneyBag)
    DeleteObject(moneyBag)
end)


RegisterNetEvent('ac-hack:setClient')
AddEventHandler('ac-hack:setClient',function(data,binuncedata)
    cacheData = data
    binunceCacheData = binuncedata

    if binunceCacheData then
        for k, v in pairs(binunceCacheData) do
            id = v.id
            senderusername = v.senderUserName 
            senderaddress = v.senderAddress
            receiveraddress = v.receiverAddress
            macaddress = v.macAddress
            amount = v.amount
        end
    end

    if cacheData then
        for k, v in pairs(cacheData) do
                id = v.id
                identifier = v.identifier
                notes = v.notes
                build = v.build
                props = v.props
                miner = v.miner
                username = v.username
                cryptoaddress = v.cryptoaddress
                macaddress = v.macaddress
                butcoin = v.butcoin
                temporaryCoin = v.temporaryCoin
                apps = v.apps
                connectWifiTime = v.connectWifiTime
        end
    end

end)

RegisterNetEvent('ac-hack:notify')
AddEventHandler('ac-hack:notify',function(data)
    Notify(data)
end)

RegisterNetEvent('ac-hack:spawnProp')
AddEventHandler('ac-hack:spawnProp',function(data,obj)

    SetEntityAsMissionEntity(NetworkGetNetworkIdFromEntity(obj), true, true)
    SetEntityHeading(NetworkGetNetworkIdFromEntity(obj), data.heading)
    FreezeEntityPosition(NetworkGetNetworkIdFromEntity(obj), true)
    SetModelAsNoLongerNeeded(data.hash)
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    playerData = GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded', function()
    playerData = GetPlayerData()
end)


Citizen.CreateThread(function()
    while true do
         Citizen.Wait(500)
         if NetworkIsPlayerActive(PlayerId()) then 
            playerData = GetPlayerData()
            TriggerServerEvent('ac-hack:dataPostClient')
            -- Wait(5000)
            -- TriggerEvent('ac-hack:createObject')
            break
        end 
    end
end)



-- AddEventHandler('onResourceStart', function(res)
--     if res ~= GetCurrentResourceName() then return end
--     while CoreReady == false do Citizen.Wait(0) end
--     loadData()
-- end)

-- function loadData()
--     while CoreReady == false do Citizen.Wait(0) end
--     playerData = GetPlayerData()
--     TriggerServerEvent('ac-hack:dataPostClient')
--     Wait(5000)
--     TriggerEvent('ac-hack:createObject')
-- end



RegisterNetEvent('ac-hack:createObject')
AddEventHandler('ac-hack:createObject', function(cacheData)

    for _, v1 in pairs(cacheData) do
        if CoreName == "es_extended" then
            if playerData.identifier == v1.identifier then
                for _, v2 in pairs(v1.props) do
                    obj = CreateObject(tonumber(v2.hash), v2.position.x, v2.position.y, v2.position.z, true, true, true)
                    SetEntityAsMissionEntity(obj, true, true)
                    SetEntityHeading(obj, v2.heading)
                    FreezeEntityPosition(obj, true)
                    SetModelAsNoLongerNeeded(model)
                    table.insert(allObject, obj)
                end
            end
        else
            if tonumber(playerData.citizenid) == tonumber(v1.identifier) then
                for _, v2 in pairs(v1.props) do
                    obj = CreateObject(tonumber(v2.hash), v2.position.x, v2.position.y, v2.position.z, true, true, true)
                    SetEntityAsMissionEntity(obj, true, true)
                    SetEntityHeading(obj, v2.heading)
                    FreezeEntityPosition(obj, true)
                    SetModelAsNoLongerNeeded(model)
                    table.insert(allObject, obj)
                end
            end
        end
    end
end)


RegisterNetEvent('ac-hack:deleteProp')
AddEventHandler('ac-hack:deleteProp',function()
    DeleteEntity(currentObject)
    DeleteObject(currentObject)
    for k, v in pairs(allObject) do
        DeleteEntity(v)
        DeleteObject(v)
    end
    allObject = {}
    currentObject = nil
end)

function GetClosestProp(coords)
    local pump = nil
    local pumpCoords
    for i = 1, #AC.Props, 1 do
        local currentPumpModel = AC.Props[i]
        pump = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, currentPumpModel, true, true, true)
        pumpCoords = GetEntityCoords(pump)
        if pump ~= 0 then break end
    end
    return pumpCoords, pump
end



function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 500
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end


function loadAnimDict(dict)  
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(500)
    end
end 


drone = nil
moneyBag = nil
function createDrone(objCoords)
    sleep = 1000
    local px, py, pz = table.unpack(objCoords.coords)
    droneObject = GetHashKey(AC.DroneObject)
    caseHash = GetHashKey("w_am_case")  
    loadModels(modelsToLoad)
    local playerPed = PlayerPedId()
    local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0, 1.0, 0)

    drone = CreateObject(droneObject, px, py, pz, true, false, false)
    moneyBag = CreateObject(caseHash, px, py, pz, true, false, false)  
    SetEntityHasGravity(moneyBag, true)
    SetEntityCollision(moneyBag, true, true)

    SetEntityAsMissionEntity(drone, true, true)
    SetEntityHeading(drone, GetEntityHeading(playerPed))
    FreezeEntityPosition(drone, true)
    SetModelAsNoLongerNeeded(droneObject)

    return drone
end

function createMoneyBag()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local px, py, pz = table.unpack(coords)
end


Citizen.CreateThread(function()
    local sleep = 1000  
    while true do 
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        for k, v in pairs(cacheData) do
            for x, y in pairs(v.props) do
                if y.itemType == "desk" then 
                    local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, y.position.x, y.position.y, y.position.z)
                    if distance ~= -1 and distance <= 1.6 then
                        menuId = v.id
                        item = {["item"] = {
                            [1] = {name = AC.HackText,event = "ac-hack:openMenu"     , icon = "fa fa-user" , eventData = v.id},
                            [2] = {name = AC.BuildText, event = "ac-hack:openDesk"   , icon = "fa fa-laptop" , eventData = v.id},
                        },}

                        exports["ac-text"]:openTextUi(item,y.position,1.6,"blue")
                        
                        sleep = 1
                    end 
                elseif y.itemType == "miner" then
                    local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, y.position.x, y.position.y, y.position.z)
                    if distance ~= -1 and distance <= 1.6 then
                        menuId = v.id
                        items = {["item"] = {[1] = {name = AC.MinerText,event = "ac-hack:openMiner",eventData=y.objId}},}
                        exports["ac-text"]:openTextUi(items,y.position,1.6,"blue")

                        sleep = 1
                    end 
                end
            end
        end
        Citizen.Wait(sleep)
    end 
end)

RegisterNetEvent('ac-hack:openMiner')
AddEventHandler('ac-hack:openMiner',function(id)
    openMiner(id)
end)

RegisterNetEvent('ac-hack:openMenu')
AddEventHandler('ac-hack:openMenu', function(id)
    openMenu(id)
end)

RegisterNetEvent('ac-hack:openDesk')
AddEventHandler('ac-hack:openDesk', function(id)
    openBuildPage(id)
end)

RegisterNetEvent('ac-hack:deleteLastProp')
AddEventHandler('ac-hack:deleteLastProp', function()
    DeleteEntity(currentObject)
    DeleteObject(currentObject)
    currentObject = nil
end)


minerObj = nil
function createMiner() 
    minerObj = CreateObject("v_corp_officedesk03", 1273.794, -1711.59, 54.171, true, true, true) 
    Wait(5000)
 
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then 
        createMiner()
        return
    end
end)


AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        DeleteEntity(minerObj)
        return
    end
end)

