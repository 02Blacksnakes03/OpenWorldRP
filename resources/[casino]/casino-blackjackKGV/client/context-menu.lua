RegisterNetEvent('casino:context:hit&stand', function() 
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "Karte ziehen", 
            txt = "Ziehe eine weitere Karte",
            params = {
                event = "nchub::client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "Passen", 
            txt = "Sei ein Feigling",
            params = {
                event = "nchub::client:blackjackMenu",
                args = 2
            }
        },
    })
end)

RegisterNetEvent('casino:context:hit&doubledown', function() 
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "Karte ziehen", 
            txt = "Ziehe eine weitere Karte",
            params = {
                event = "nchub::client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "Passen", 
            txt = "Sei ein Feigling",
            params = {
                event = "nchub::client:blackjackMenu",
                args = 2
            }
        },
        {
            header = "Verdoppeln", 
            txt = "Verdopple deinen Einsatz",
            params = {
                event = "nchub::client:blackjackMenu",
                args = 3
            }
        },
    })
end)

RegisterNetEvent('casino:context:hit&split', function()
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "Karte ziehen", 
            txt = "Ziehe eine weitere Karte",
            params = {
                event = "nchub::client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "Passen", 
            txt = "Sei ein Feigling",
            params = {
                event = "nchub::client:blackjackMenu",
                args = 2
            }
        },
        {
            header = "Teilen", 
            txt = "Teile deine Karten",
            params = {
                event = "nchub::client:blackjackMenu",
                args = 4
            }
        },
    })
end)
