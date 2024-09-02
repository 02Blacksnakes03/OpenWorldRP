--  ▄▀▄ █▄ █ █   ▀▄▀   █▀ ▄▀▄ █▀▄   ██▀ ▄▀▀ ▀▄▀
--  ▀▄▀ █ ▀█ █▄▄  █    █▀ ▀▄▀ █▀▄   █▄▄ ▄██ █ █
if Config.Core == "ESX" then
    RegisterNetEvent('psv_flightschool:sv:loadLicensesWithRestartScript', function()
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            TriggerEvent('esx_license:getLicenses', src, function(licenses)
                TriggerClientEvent('psv_flightschool:cl:getLicenses', src, licenses)
            end)
        end
    end)

    AddEventHandler(Config.PlayerLoaded, function(source)
        local src = source
        Citizen.Wait(8000)
        TriggerEvent('esx_license:getLicenses', src, function(licenses)
            TriggerClientEvent('psv_flightschool:cl:getLicenses', src, licenses)
        end)
    end)
end


--  ▄▀▄ █▀▄ █▀▄   █   █ ▄▀▀ ██▀ █▄ █ ▄▀▀ ██▀
--  █▀█ █▄▀ █▄▀   █▄▄ █ ▀▄▄ █▄▄ █ ▀█ ▄██ █▄▄
RegisterNetEvent('psv_flightschool:sv:addLicense', function(passed, type)
    local src = source
    if passed then
        if Config.Core == "ESX" then
            TriggerEvent('esx_license:addLicense', src, type, function()
                TriggerEvent('esx_license:getLicenses', src, function(licenses)
                    TriggerClientEvent('psv_flightschool:cl:getLicenses', src, licenses)
                    TriggerClientEvent('psv_flightschool:notification', src, Config.Translate['success_practical'], 'success')
                end)
            end)
        elseif Config.Core == "QB-Core" then
            local Player = QBCore.Functions.GetPlayer(src)
            local licenses = Player.PlayerData.metadata['licences']
            licenses[type] = true
            Player.Functions.SetMetaData('licences', licenses)
            TriggerClientEvent('psv_flightschool:cl:getLicenses', src)
            TriggerClientEvent('psv_flightschool:notification', src, Config.Translate['success_practical'], 'success')
        end
    else
        TriggerClientEvent('psv_flightschool:notification', src, Config.Translate['failed_practical'], 'error')
    end
end)