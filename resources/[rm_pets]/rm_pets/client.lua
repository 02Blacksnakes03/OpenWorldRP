localPet = {
    ['object'] = nil,
    ['position'] = Config['PetsSettings']['startPosition'],
    ['petName'] = nil
}
ESX, QBCore = nil, nil
Citizen.CreateThread(function()
    if Config['PetsSettings']['framework']['name'] == 'ESX' then
        while ESX == nil do
            TriggerEvent(Config['PetsSettings']['framework']['eventName'], function(library) 
                ESX = library 
            end)
            Citizen.Wait(1)
        end
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
    else
        RegisterCommand(Config['PetsSettings']['framework']['standaloneCommand'], function(a, args, b)
            TriggerEvent('pets:client:attachPet', args[1], Config['Pets'][args[1]])
        end)
    end
    while not NetworkIsSessionStarted() do
        Citizen.Wait(100)
    end
    Citizen.Wait(1000)
    SendNUIMessage({
        action = 'config',
        locale = Config['PetsSettings']['locale'],
        locales = Config['PetsSettings']['locales'],
        menuAlign = Config['PetsSettings']['menuAlign']
    })
    Strings = Config['PetsSettings']['locales'][Config['PetsSettings']['locale']]
end)

function TriggerCallback(cbName, cb, data)
    if Config['PetsSettings']['framework']['name'] == 'ESX' then
        ESX.TriggerServerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    elseif Config['PetsSettings']['framework']['name'] == 'QB' then
        QBCore.Functions.TriggerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    end
end

RegisterNetEvent('pets:client:attachPet')
AddEventHandler('pets:client:attachPet', function(petName, petData)
    if not localPet['object'] then
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        loadModel(GetHashKey(petData['objectName']))
        localPet['object'] = CreateObject(GetHashKey(petData['objectName']), pedCo, 1, 1, 0)
        localPet['petName'] = petName

        if Config['PetsSettings']['startPosition'] == 'left' then 
            AttachEntityToEntity(localPet['object'], ped, GetPedBoneIndex(ped, 24818), petData['settings']['left']['attachPos'], petData['settings']['left']['attachRot'], true, true, false, false, 1, true)
        else
            AttachEntityToEntity(localPet['object'], ped, GetPedBoneIndex(ped, 24818), petData['settings']['right']['attachPos'], petData['settings']['right']['attachRot'], true, true, false, false, 1, true)
        end
    else
        if petName ~= localPet['petName'] then ShowNotification(Strings['already_have']) return end
        DeletePet(false)
    end
end)

function DeletePet(refresh)
    local ped = PlayerPedId()
    DetachEntity(localPet['object'], true, false)
    DeleteObject(localPet['object'])
    if not refresh then
        localPet = {
            ['object'] = nil,
            ['position'] = Config['PetsSettings']['startPosition'],
            ['petName'] = nil
        }
    end
end

RegisterCommand(Config['PetsSettings']['menuCommand'], function()
    if localPet['object'] then
        SendNUIMessage({
            action = 'show',
            position = localPet['position'],
        })
        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)
        isNuiFocus = true
        Citizen.CreateThread(function()
            while isNuiFocus do
                DisableAllControlActions(0)
                EnableControlAction(0, 22, true)
                EnableControlAction(0, 30, true)
                EnableControlAction(0, 31, true)
                EnableControlAction(0, 63, true)
                EnableControlAction(0, 64, true)
                EnableControlAction(0, 71, true)
                EnableControlAction(0, 72, true)
                EnableControlAction(0, 59, true)
                EnableControlAction(0, 249, true)
                Wait(0)
            end
        end)
    else
        ShowNotification(Strings['no_pet'])
    end
end)

RegisterNetEvent('pets:client:petEffect')
AddEventHandler('pets:client:petEffect', function(petObject, petConfig, petCoords)
    local ped = PlayerPedId()
    local pedCo = GetEntityCoords(ped)
    local dist = #(pedCo - petCoords)
    if dist <= 100.0 then
        loadPtfxAsset(petConfig['particle']['particleDict'])
        UseParticleFxAssetNextCall(petConfig['particle']['particleDict'])
        ptfx = StartParticleFxLoopedOnEntity(petConfig['particle']['particleName'], NetToObj(petObject), petConfig['particle']['particlePos'], petConfig['particle']['particleRot'], petConfig['particle']['particleScale'], 0.0, 0.0, 0.0)
        Wait(1000)
        StopParticleFxLooped(ptfx, 1)
    end
end)

effectDelay = false
RegisterNUICallback('petEffect', function()
    if localPet['object'] then
        if not effectDelay then
            local ped = PlayerPedId()
            local pedCo = GetEntityCoords(ped)
            local petConfig = Config['Pets'][localPet['petName']]['settings']
            TriggerServerEvent('pets:server:petEffect', ObjToNet(localPet['object']), petConfig, pedCo)
            effectDelay = true

            Citizen.CreateThread(function()
                Citizen.Wait(Config['PetsSettings']['effectDelay'])
                effectDelay = false
            end)
        else
            ShowNotification(Strings['cooldown'])
        end
    end
end)

refreshDelay = false
RegisterNUICallback('refreshPet', function()
    if localPet['object'] then
        if not refreshDelay then
            DeletePet(true)
            stopUpdate = true
            Wait(1000)
            local ped = PlayerPedId()
            local pedCo = GetEntityCoords(ped)
            local petData = Config['Pets'][localPet['petName']]
            loadModel(GetHashKey(petData['objectName']))
            localPet['object'] = CreateObject(GetHashKey(petData['objectName']), pedCo, 1, 1, 0)
            
            if localPet['position'] == 'left' then 
                AttachEntityToEntity(localPet['object'], ped, GetPedBoneIndex(ped, 24818), petData['settings']['left']['attachPos'], petData['settings']['left']['attachRot'], true, true, false, false, 1, true)
            else
                AttachEntityToEntity(localPet['object'], ped, GetPedBoneIndex(ped, 24818), petData['settings']['right']['attachPos'], petData['settings']['right']['attachRot'], true, true, false, false, 1, true)
            end
            
            stopUpdate = false
            refreshDelay = true

            Citizen.CreateThread(function()
                Citizen.Wait(Config['PetsSettings']['refreshDelay'])
                refreshDelay = false
            end)
        else
            ShowNotification(Strings['cooldown'])
        end
    end
end)

RegisterNUICallback('updatePosition', function(data)
    if stopUpdate then return end
    if localPet['object'] then
        local ped = PlayerPedId()
        local petData = Config['Pets'][localPet['petName']]
        
        if data['position'] == 'left' then 
            AttachEntityToEntity(localPet['object'], ped, GetPedBoneIndex(ped, 24818), petData['settings']['left']['attachPos'], petData['settings']['left']['attachRot'], true, true, false, false, 1, true)
        else
            AttachEntityToEntity(localPet['object'], ped, GetPedBoneIndex(ped, 24818), petData['settings']['right']['attachPos'], petData['settings']['right']['attachRot'], true, true, false, false, 1, true)
        end

        localPet['position'] = data['position']
    end
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    Wait(500)
    isNuiFocus = false
end)

AddEventHandler('onResourceStop', function(p1)
    DeleteObject(localPet['object'])
end)

function loadPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        RequestNamedPtfxAsset(dict)
        Citizen.Wait(50)
	end
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end