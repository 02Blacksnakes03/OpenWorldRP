RegisterKeyMapping("+bank", "Shows bank menu", "KEYBOARD", Config.ShowMenuKey)
RegisterCommand("+bank", function() 
    TriggerEvent("0r-banking:Client:BankMenu:Show")
end)