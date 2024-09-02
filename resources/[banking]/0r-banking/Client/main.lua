TwoNa = exports["2na_core"]:getSharedObject()
MenuAccessible = false

RegisterNetEvent("0r-banking:Client:BankMenu:Show")
AddEventHandler("0r-banking:Client:BankMenu:Show", function() 
    if IsPlayerNearAccessLocation() then 
        TwoNa.TriggerServerCallback("0r-banking:Server:GetUserAccounts", {}, function(bankData) 
            if bankData then 
                SetNuiFocus(true, true)
                
                SendNUIMessage({
                    action = "showMenu",
                    playerName = bankData.playerName,
                    accounts = bankData.accounts
                })
            end
        end)
    end
end)

RegisterNetEvent("0r-banking:Client:BankMenu:Hide")
AddEventHandler("0r-banking:Client:BankMenu:Hide", function() 
    SetNuiFocus(false, false)
                
    SendNUIMessage({
        action = "hideMenu"
    })
end)