local QBCore = exports['qb-core']:GetCoreObject()
local display = false

RegisterNetEvent('psv-tradingcards:openBoosterPack', function(img, grade, number)
    local img = img
    local grade = grade
    SetDisplay(not display, img, grade, graded, number)
end)

-- annimation
RegisterNetEvent('psv-tradingcards:Client:CardAnimation')
AddEventHandler('psv-tradingcards:Client:CardAnimation', function()
	prop_name = 'prop_cs_r_business_card'
	CreateThread(function()
		local playerPed = PlayerPedId()
		if not IsPedInAnyVehicle(playerPed, false) then
			while not HasModelLoaded(GetHashKey(prop_name)) do
				Wait(100)
				RequestModel(GetHashKey(prop_name))
			end
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			Wait(50)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.065, 0.029, -0.035, 80.0, -1.90, 35.0, true, true, false, true, 1, true)
			Wait(50)
			RequestAnimDict('paper_1_rcm_alt1-9')
			Wait(50)
			TaskPlayAnim(playerPed, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, -8, 10.0, 49, 0, 0, 0, 0)
			Wait(3000)
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end
	end)
end)


RegisterNetEvent('psv-tradingcards:displayCard',function(card, item)
    local item = item
    local card = card
    SetDisplayCard(not display, card, item)
        --[[
            graded  =       "False",
            centering =     val1,
            color   =       val2,
            damage  =       val3,
            grade   =       math.floor(((val1+val2+val3)/3)+0.5)
        ]]
    if item.info.graded == "True" then
        if Config.UseISStatusHud then 
            exports['is-statushud']:Show("Trading Card", {
                "Grade: "..item.info.grade,
                "Centering: "..item.info.centering.." | Color: "..item.info.color.." | Damage: "..item.info.damage,
            })
        end
    else
        if Config.UseISStatusHud then 
            exports['is-statushud']:Show("Trading Card", {
                "Grade: Not Graded",
            })
        end
    end
    local player, distance = QBCore.Functions.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        TriggerEvent('psv-tradingcards:Client:CardAnimation')
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent('psv-tradingcards:showPlayer', playerId, card, item)
    end
end)

RegisterNetEvent('psv-tradingcards:drawNui', function(card, item)
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped) then 
        SetDisplayCard(not display,card, item, graded)
        if item.info.graded == "True" then
            if Config.UseISStatusHud then 
                exports['is-statushud']:Show("Trading Card", {
                    "Grade: "..item.info.grade,
                    "Centering: "..item.info.centering.." | Color: "..item.info.color.." | Damage: "..item.info.damage,
                })
            end
        else
            if Config.UseISStatusHud then 
                exports['is-statushud']:Show("Trading Card", {
                    "Grade: Not Graded",
                })
            end
        end
        Wait(8000)
        SetDisplay(false)
        if Config.UseISStatusHud then 
            exports['is-statushud']:Hide()
        end
    end
end)

RegisterNUICallback("close", function(data)
    SetDisplay(false)
    if Config.UseISStatusHud then     
        exports['is-statushud']:Hide()
    end
end)

RegisterNUICallback("callback", function(data)
    SetDisplay(false)
    return
end)

RegisterNUICallback("error", function(data)
    SetDisplay(false)
    if Config.UseISStatusHud then 
        exports['is-statushud']:Hide()
    end
end)

function SetDisplay(bool,card,item, graded, number)
    display = bool
    SetNuiFocus(bool, bool)
    if item then
        if type(item) == "number" then
            SendNUIMessage({
                type = "fdtrading",
                status = bool,
                card = card,
                grade = item,
                graded = graded,
                number = number
            })
        else
            SendNUIMessage({
                type = "fdtrading",
                status = bool,
                card = card,
                grade = item.info.grade,
                graded = item.info.graded,
                number = item.info.number
            })
        end
    else
        SendNUIMessage({
            type = "fdtrading",
            status = bool,
            card = card,
        })
    end
end

exports[Config.Target]:AddBoxZone("comicstash", Config.CommicStashPos, 1.0, 2.5, { name="comicstash", heading = Config.CommicStashHeading, debugPoly=false, minZ=Config.CommicStashPos.z-1, maxZ=Config.CommicStashPos.z+1}, 
{ options = { {  event = "psv-comics:Stash", icon = "fas fa-box-open", label = "Counter Top", stash = "counter" }, },
  distance = 2.0
})

RegisterNetEvent('psv-comics:Stash')
AddEventHandler('psv-comics:Stash',function(data)
	id = data.stash
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Comic_"..id)
    TriggerEvent("inventory:client:SetCurrentStash", "Comic_"..id)
end)


function SetDisplayCard(bool,card, item)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "display",
        status = bool,
        card = card,
        grade = item.info.grade,
        graded = item.info.graded,
        number = item.info.number,
    })
end

CreateThread(function()
    while display do
        Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)


RegisterNetEvent('cards:client:binder', function()
    TriggerEvent(Config.Inventory..':client:set:busy', true)
    local ped = PlayerPedId()
    RequestModel("prop_cs_magazine")
    while not HasModelLoaded(GetHashKey("prop_cs_magazine")) do
        Wait(0)
    end
    local pCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)
    local modelSpawn = CreateObject(GetHashKey("prop_cs_magazine"), 0, 0, 0, true, true, true)
    local netid = ObjToNet(modelSpawn)
    SetNetworkIdExistsOnAllMachines(netid, true)
    NetworkSetNetworkIdDynamic(netid, true)
    SetNetworkIdCanMigrate(netid, false)
    AttachEntityToEntity(modelSpawn, ped, GetPedBoneIndex(ped, 28422), 0.0, -0.02, 0.0, -90.0,180.0, 180.0, 1, 1, 0, 1, 0, 1)
    prop_net = netid
    QBCore.Functions.Progressbar("open-binder", "Opening Binder...", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@cellphone@in_car@ds",
        anim = "cellphone_text_read_base",
        flags = 49,
    }, {}, {}, function() -- Done
        TriggerServerEvent("inventory:server:OpenInventory", "stash", 'binder_'..QBCore.Functions.GetPlayerData().citizenid, {maxweight = 200000, slots = 200})
        TriggerEvent("inventory:client:SetCurrentStash", 'binder_'..QBCore.Functions.GetPlayerData().citizenid)
    end, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_movie_studio_light@base", "base", 1.0)
        TriggerEvent(Config.Inventory..':client:set:busy', false)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('cards:client:toychest', function()
    TriggerEvent(Config.Inventory..'client:set:busy', true)
    TriggerEvent('animations:client:EmoteCommandStart', {"box"})
    QBCore.Functions.Progressbar("open-toychest", "Opening Toy Chest...", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"box"})
        TriggerServerEvent("inventory:server:OpenInventory", "stash", 'toychest_'..QBCore.Functions.GetPlayerData().citizenid, {maxweight = 300000, slots = 300})
        TriggerEvent("inventory:client:SetCurrentStash", 'toychest_'..QBCore.Functions.GetPlayerData().citizenid)
    end, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent(Config.Inventory..':client:set:busy', false)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)


RegisterNetEvent("psv-tradingcards:client:gradecard", function(source, slot)
    local src = source 
    local slot = slot

    QBCore.Functions.Progressbar("appraise", "Appraising Card", math.random(5000, 10000), false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_movie_studio_light@base",
        anim = "base",
        flags = 1,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "amb@prop_human_movie_studio_light@base", "base", 1.0)
        TriggerServerEvent('psv-tradingcards:gradecard', src, slot)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "amb@prop_human_movie_studio_light@base", "base", 1.0)
        QBCore.Functions.Notify("Canceled.", "error")
    end)
end)

RegisterNetEvent("psv-tradingcards:client:openpackanim", function(source)
    local src = source 

    QBCore.Functions.Progressbar("appraise", "Opening Card", 3000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_movie_studio_light@base",
        anim = "base",
        flags = 1,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "amb@prop_human_movie_studio_light@base", "base", 1.0)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "amb@prop_human_movie_studio_light@base", "base", 1.0)
    end)
end)


RegisterNetEvent('psv-tradingcards:Shop')
AddEventHandler('psv-tradingcards:Shop',function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Prolific Trading Card Co.", Config.Items)
end)

if Config.UseBusiness then
    exports[Config.Target]:AddBoxZone("PSAStore", Config.CommicShopPos, 1.0, 4.0, { name="PSAStore", heading = Config.CommicShopHeading, debugPoly=false, minZ=Config.CommicShopPos.z-1, maxZ=Config.CommicShopPos.z+1 }, 
    { options = { {  event = "psv-tradingcards:Shop", icon = "fas fa-box-open", label = "Open Store", 
        job = Config.StoreJob
        }, },
      distance = 2.0
    })
else
    exports[Config.Target]:AddBoxZone("PSAStore", Config.CommicShopPos, 1.0, 4.0, { name="PSAStore", heading = Config.CommicShopHeading, debugPoly=false, minZ=Config.CommicShopPos.z-1, maxZ=Config.CommicShopPos.z+1 }, 
    { options = { {  event = "psv-tradingcards:Shop", icon = "fas fa-box-open", label = "Open Store", 
        }, },
      distance = 2.0
    })
end 

