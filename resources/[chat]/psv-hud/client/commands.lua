RegisterCommand("manualmode", function()
    Wait(1000)
    Koci.Client.HUD:ChangeGearMode()
end)

if Config.Settings.Seatbelt.active then
    -- @ --
    RegisterCommand("psv-hud:ToggleSeatbelt", function()
        Koci.Client.HUD:ToggleSeatBelt()
    end, false)
    RegisterKeyMapping("psv-hud:ToggleSeatbelt", _t("hud.commands.toggleSeatBelt"), 'keyboard',
        Config.Settings.Seatbelt.key
    )
    -- @ --
    RegisterCommand("psv-hud:ToggleCruise", function()
        if Koci.Client.HUD.data.vehicle.inVehicle and not Koci.Client.HUD.data.vehicle.isPassenger then
            Koci.Client.HUD:VehicleCruiseControlThick()
        end
    end, false)
    RegisterKeyMapping("psv-hud:ToggleCruise", _t("hud.commands.toggleCruise"), 'keyboard',
        Config.Settings.CruiseControl.key
    )
    -- @ --
end
