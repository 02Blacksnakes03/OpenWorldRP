local QBCore = exports["qb-core"]:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local pedSpawned = false
local listen = false
local shoprun = true
local ShopPed = {}
local NewZones = {}

-- Functions
local function createBlips()
    if pedSpawned then return end

    for store in pairs(Config.Locations) do
        if Config.Locations[store]["showblip"] then
            local StoreBlip = AddBlipForCoord(Config.Locations[store]["coords"]["x"], Config.Locations[store]["coords"]["y"], Config.Locations[store]["coords"]["z"])
            SetBlipSprite(StoreBlip, Config.Locations[store]["blipsprite"])
            SetBlipScale(StoreBlip, Config.Locations[store]["blipscale"])
            SetBlipDisplay(StoreBlip, 4)
            SetBlipColour(StoreBlip, Config.Locations[store]["blipcolor"])
            SetBlipAsShortRange(StoreBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Locations[store]["name"])
            EndTextCommandSetBlipName(StoreBlip)
        end
    end
end

local function createPeds()
    if pedSpawned then return end

    for k, v in pairs(Config.Locations) do
        local current = type(v["ped"]) == "number" and v["ped"] or joaat(v["ped"])

        RequestModel(current)
        while not HasModelLoaded(current) do
            Wait(0)
        end

        ShopPed[k] = CreatePed(0, current, v["coords"].x, v["coords"].y, v["coords"].z-1, v["coords"].w, false, false)
        TaskStartScenarioInPlace(ShopPed[k], v["scenario"], 0, true)
        FreezeEntityPosition(ShopPed[k], true)
        SetEntityInvincible(ShopPed[k], true)
        SetBlockingOfNonTemporaryEvents(ShopPed[k], true)

    end
    pedSpawned = true
end

local function deletePeds()
    if not pedSpawned then return end

    for _, v in pairs(ShopPed) do
        DeletePed(v)
    end
    pedSpawned = false
end

-- Threads
if shoprun then
    CreateThread(function()
        while true do
            local sleep = 1000
            local nearShop = false

            for i, location in ipairs(Config.Locations) do
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local distance = GetDistanceBetweenCoords(playerCoords, location["coords"]["x"], location["coords"]["y"], location["coords"]["z"], true)
                
                if distance < 3.0 then
                    nearShop = true
                    exports["qb-core"]:DrawText("[E] Open")
                    sleep = 1

                    if location.job == "" or location.job == " " then                     
                        if IsControlJustReleased(0, 38) then
                            SendNUIMessage({
                                action = "OPEN",
                                data = {
                                    marketName = location.name,
                                    marketCategory = location.category,
                                    marketItemList = location.itemList,
                                    marketCategoryList = location.categoryList,
                                    marketJob = location.job,
                                }
                            })
                            SetNuiFocus(true, true)
                            sleep = 1000
                        end
                    else
                        if location.job ~= nil then
                            local PlayerData = QBcore.Functions.GetPlayerData()
                            local playerJob = PlayerData.job.name
                            if playerJob == location.job then
                                if IsControlJustReleased(0, 38) then
                                    SendNUIMessage({
                                        action = "OPEN",
                                        data = {
                                            marketName = location.name,
                                            marketCategory = location.category,
                                            marketItemList = location.itemList,
                                            marketCategoryList = location.categoryList,
                                            marketJob = location.job,
                                        }
                                    })
                                    SetNuiFocus(true, true)
                                    sleep = 1000
                                end
                            end
                        end
                    end
                end      
            end

            if not nearShop then
                exports["qb-core"]:HideText()
            end

            Citizen.Wait(sleep)
        end
    end)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    createBlips()
    createPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    deletePeds()
    PlayerData = nil
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    createBlips()
    createPeds()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    deletePeds()
end)

RegisterNUICallback("close",function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("pay",function(data)
    TriggerServerEvent("meteo-shop:pay", data)
end)