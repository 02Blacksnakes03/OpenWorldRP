RegisterNetEvent('psv-chopshop:StartMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Chop Parts',
            -- icon = 'fas fa-code',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'Door',
            icon = 'fas fa-code-merge',
            txt = 'Print a message!',
            params = {
                event = "psv-chopshop:chopdoor",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },  
        {
            header = 'Wheel',
            icon = 'fas fa-code-merge',
            txt = 'Print a message!',
            params = {
                event = "psv-chopshop:chopwheel",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 
        {
            header = 'Hood',
            icon = 'fas fa-code-merge',
            params = {
                event = "psv-chopshop:chophood",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 
        {
            header = 'Trunk',
            icon = 'fas fa-code-merge',
            params = {
                event = "psv-chopshop:choptrunk",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 

    })
end)

RegisterNetEvent('psv-chopshop:chopdoor')
AddEventHandler('psv-chopshop:chopdoor', function()
    TriggerServerEvent("psv-chopshop:server:chopdoor")
end)

RegisterNetEvent('psv-chopshop:chopwheel')
AddEventHandler('psv-chopshop:chopwheel', function()
    TriggerServerEvent("psv-chopshop:server:chopwheel")
end)

RegisterNetEvent('psv-chopshop:chophood')
AddEventHandler('psv-chopshop:chophood', function()
    TriggerServerEvent("psv-chopshop:server:chophood")
end)

RegisterNetEvent('psv-chopshop:choptrunk')
AddEventHandler('psv-chopshop:choptrunk', function()
    TriggerServerEvent("psv-chopshop:server:choptrunk")
end)