function UseItem(source) 
    if getitem(source, Config.Items["Seed"]) >= 1 then 
        removeitem(source, Config.Items["Seed"], 1)
        TriggerClientEvent("BakiTelli_weed:Seed", source)
        sendToDiscord(Config.Webhook, source, "Seed Planted! ", "\n" .. GetPlayerName(source) .. "(" .. source .. ") \n\n**Seed Type : **" .. Config.Items["Seed"], 15158332)
    end
end

RegisterNetEvent("BakiTelli_weed:giveSV")
AddEventHandler("BakiTelli_weed:giveSV", function (menu, id)
    local src = source
    if id == "Water" then
        if getitem(src, Config.Items["Water"]) >= 1 then 
            removeitem(source, Config.Items["Water"], 1)
            TriggerClientEvent("BakiTelli_weed:giveCl", src, menu, id)
        end
    elseif id == "Fertilizer" then 
        if getitem(src, Config.Items["Fertilizer"]) >= 1 then 
            removeitem(src, Config.Items["Fertilizer"], 1)
            TriggerClientEvent("BakiTelli_weed:giveCl", src, menu, id)
        end
    elseif id == "Dust" then 
        if getitem(src, Config.Items["Dust"]) >= 1 then 
            removeitem(src, Config.Items["Dust"], 1)
            TriggerClientEvent("BakiTelli_weed:giveCl", src, menu, id)
        end
    else
        notify(source, "No item")
    end
end)

RegisterNetEvent("BakiTelli_weed:Harvest")
AddEventHandler("BakiTelli_weed:Harvest", function (weed)
    local src = source
    additem(src, Config.Items["Weed"], weed)
    sendToDiscord(Config.Webhook, src, "Harvest is done! ", "\n" .. GetPlayerName(src) .. "(" .. src .. ") \n\n**Harvest quantity : **" .. weed, 15158332)
end)

function sendToDiscord(DiscordLog, source, title, des, color)
    local debuxIMG = "https://cdn.discordapp.com/attachments/994272883918512158/994272896862134362/unknown.png"
    local log = {
        {
            ["title"] = "DEBUX WEED",
            ["color"] = color,
            author = {
                name = "DEBUX WEED",
                icon_url = "https://cdn.discordapp.com/attachments/994272883918512158/994272896862134362/unknown.png",
                url = "https://discord.gg/debux"
            },
            ["fields"] = {
                {
                    ["name"] = "> Info:",
                    ["value"] = title,
                    ["inline"] = false
                },
                {
                    ["name"] = "> Version:",
                    ["value"] = "1.0",
                    ["inline"] = false
                },
                {
                    ["name"] = "> Detail:",
                    ["value"] = des,
                    ["inline"] = false
                },
                {
                    ["name"] = "> Website:",
                    ["value"] = 'https://debux.tebex.io',
                    ["inline"] = true
                },
                {
                    ["name"] = "> Support:",
                    ["value"] = 'https://discord.gg/debux',
                    ["inline"] = true
                },
            },
            ["thumbnail"] = {
                ["url"] = "https://cdn.discordapp.com/attachments/994272883918512158/994273062126092450/unknown.png"
            },
        },
    }
    Wait(tonumber(1000))
    PerformHttpRequest(DiscordLog, function(err, text, headers) end, 'POST', json.encode({ username = "DebuX WorkShop", embeds = log, avatar_url = debuxIMG }), { ['Content-Type'] = 'application/json' })
end

