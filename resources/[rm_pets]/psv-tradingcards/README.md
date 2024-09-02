# INSTALL 

Dependencies:
Status hud: https://github.com/iLLeniumStudios/is-statushud
OPTIONAL | MLO that is set up with this script: https://cheesykyle.tebex.io/package/5112321





### Add the folowing job to qb-core/shared/jobs.lua.
```lua
["comic"] = {
	label = "Trading Card Co.",
	defaultDuty = true,
	grades = {
		['0'] = {
			name = "TC Grader",
			payment = 75
		},
		['1'] = {
			name = "TC Worker",
			payment = 100
		},
		['2'] = {
			name = "TC Manager",
			payment = 125,
		},
		['3'] = {
			name = "TC Owner",
			payment = 150,
			isboss = true,
		},
	},
},
```

### Navigate to your inventory/html/js/app.js and find the 'FormatItemInfo' function call.
Add the following entry
```js
    //cards
    else if (itemData.label == "Trading Card") {
      $(".item-info-title").html("<p>" + itemData.label + "</p>");
      if (itemData.info.graded == "False") {
        $(".item-info-description").html(
          "<p><strong>Graded: </strong><span>False</span></p>"
        );
      } else {
        $(".item-info-description").html(
          "<p><strong>Graded: </strong><span>" +
            "True" +
            "</span></p><p>Centering: <span>" +
            itemData.info.centering +
            "/10" +
            "</span></p><p>Color: <span>" +
            itemData.info.color +
            "/10" +
            "</span></p><p>Damage: <span>" +
            itemData.info.damage +
            "/10" +
            "</span></p><p><strong>Grade: </strong><span>" +
            itemData.info.grade +
            "</span></p>"
        );
      }
    }
```


### Navigate to your inventory/server/main.lua resource and find 'inventory:server:SetInventoryData'.

Replace
```lua
elseif QBCore.Shared.SplitStr(toInventory, "-")[1] == "stash" then
```
with
```lua
elseif QBCore.Shared.SplitStr(toInventory, "-")[1] == "stash" and (QBCore.Shared.SplitStr(QBCore.Shared.SplitStr(toInventory, "-")[2], "_")[1] ~= "binder" and QBCore.Shared.SplitStr(QBCore.Shared.SplitStr(toInventory, "-")[2], "_")[1] ~= "toychest" ) then

```

### In the same 'inventory:server:SetInventoryData' event

find (it should be right after the traphouse code):
```lua
			else
				-- drop
				toInventory = tonumber(toInventory)
```
and add the following code before the 'else' so it looks like this:
```lua
elseif QBCore.Shared.SplitStr(toInventory, "-")[2] then
    if QBCore.Shared.SplitStr(QBCore.Shared.SplitStr(toInventory, "-")[2], "_")[1] == "binder" then
        -- binder
        local stashId = QBCore.Shared.SplitStr(toInventory, "-")[2]
        local toItemData = Stashes[stashId].items[toSlot]
        if fromItemData.label == "Trading Card" then 
            Player.Functions.RemoveItem(fromItemData.name, fromAmount, fromSlot)
            TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
            if toItemData ~= nil then
                local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
                local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
                if toItemData.name ~= fromItemData.name then
                    RemoveFromStash(stashId, toSlot, itemInfo["name"], toAmount)
                    Player.Functions.AddItem(toItemData.name, toAmount, fromSlot, toItemData.info, toItemData.created)
                    --TriggerEvent("qb-log:server:CreateLog", "stash", "Swapped Item", "orange", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) swapped item; name: **"..itemInfo["name"].."**, amount: **" .. toAmount .. "** with name: **" .. fromItemData.name .. "**, amount: **" .. fromAmount .. "** - stash: *" .. stashId .. "*")
                end
            else
                local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
                --TriggerEvent("qb-log:server:CreateLog", "stash", "Dropped Item", "red", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) dropped new item; name: **"..itemInfo["name"].."**, amount: **" .. fromAmount .. "** - stash: *" .. stashId .. "*")
            end
            local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
            AddToStash(stashId, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info, fromItemData.created)
        else
            TriggerClientEvent('QBCore:Notify', src, "The item can not go in the binder.", 'error')
        end
    elseif
        QBCore.Shared.SplitStr(QBCore.Shared.SplitStr(toInventory, "-")[2], "_")[1] == "toychest" then
        -- toychest
        local stashId = QBCore.Shared.SplitStr(toInventory, "-")[2]
        local toItemData = Stashes[stashId].items[toSlot]
        if QBCore.Shared.SplitStr(fromItemData.label, " ")[2] == "Toy" then 
            Player.Functions.RemoveItem(fromItemData.name, fromAmount, fromSlot)
            TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
            if toItemData ~= nil then
                local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
                local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
                if toItemData.name ~= fromItemData.name then
                    RemoveFromStash(stashId, toSlot, itemInfo["name"], toAmount)
                    Player.Functions.AddItem(toItemData.name, toAmount, fromSlot, toItemData.info, toItemData.created)
                    --TriggerEvent("qb-log:server:CreateLog", "stash", "Swapped Item", "orange", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) swapped item; name: **"..itemInfo["name"].."**, amount: **" .. toAmount .. "** with name: **" .. fromItemData.name .. "**, amount: **" .. fromAmount .. "** - stash: *" .. stashId .. "*")
                end
            else
                local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
                --TriggerEvent("qb-log:server:CreateLog", "stash", "Dropped Item", "red", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) dropped new item; name: **"..itemInfo["name"].."**, amount: **" .. fromAmount .. "** - stash: *" .. stashId .. "*")
            end
            local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
            AddToStash(stashId, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info, fromItemData.created)
        else
            TriggerClientEvent('QBCore:Notify', src, "The item can not go in the toy chest.", 'error')
        end
    end
else
    -- drop
    toInventory = tonumber(toInventory)
```



### Add the imgs from psv-tradingcards\imgs into your qb-inventory

### Add the following items to qb-core/shared/items.lua
```lua
    -- Cards
    ['boosterbox'] 				 = {['name'] = 'boosterbox', 			  	  		['label'] = 'Booster Box', 			['weight'] = 10000, 		['type'] = 'item', 		['image'] = 'boosterbox.png', 				['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Trading Card Co."},
	["boosterpack"] 			= {["name"] = "boosterpack", 			  	["label"] = "Booster Pack", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "boosterpack.png", 		 ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Trading Card Co."},
	["binder"] 					= {["name"] = "binder", 					["label"] = "Card Binder", 				["weight"] = 10000, 	["type"] = "item", 		["image"] = "binder.png", 			 ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Trading Card Co."},
	
    -- Toys
    ["goldenegg"] 					= {["name"] = "goldenegg", 					  	["label"] = "Toy Pack", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "goldenegg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Trading Card Co."},
	["toychest"] 					= {["name"] = "toychest", 					  	["label"] = "Toy Chest", 			["weight"] = 10000, 		["type"] = "item", 		["image"] = "toychest.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Trading Card Co."},

```




### Add the following items to qb-core/shared/items.lua
```lua
	['bstoy1'] 				 = {['name'] = 'bstoy1', 			  	  	['label'] = 'Burgershot Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bstoy(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Burgershot Inc. 1/5'},
	['bstoy2'] 				 = {['name'] = 'bstoy2', 			  	  	['label'] = 'Burgershot Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bstoy(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Burgershot Inc. 2/5'},
	['bstoy3'] 				 = {['name'] = 'bstoy3', 			  	  	['label'] = 'Burgershot Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bstoy(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Burgershot Inc. 3/5'},
	['bstoy4'] 				 = {['name'] = 'bstoy4', 			  	  	['label'] = 'Burgershot Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bstoy(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Burgershot Inc. 4/5'},
	['bstoy5'] 				 = {['name'] = 'bstoy5', 			  	  	['label'] = 'Burgershot Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bstoy(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Burgershot Inc. 5/5'},
	['avatar1'] 				 = {['name'] = 'avatar1', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 1/10'},
	['avatar2'] 				 = {['name'] = 'avatar2', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 2/10'},
	['avatar3'] 				 = {['name'] = 'avatar3', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 3/10'},
	['avatar4'] 				 = {['name'] = 'avatar4', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 4/10'},
	['avatar5'] 				 = {['name'] = 'avatar5', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 5/10'},
	['avatar6'] 				 = {['name'] = 'avatar6', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 6/10'},
	['avatar7'] 				 = {['name'] = 'avatar7', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(7).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 7/10'},
	['avatar8'] 				 = {['name'] = 'avatar8', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(8).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 8/10'},
	['avatar9'] 				 = {['name'] = 'avatar9', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(9).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 9/10'},
	['avatar10'] 				 = {['name'] = 'avatar10', 			  	  	['label'] = 'Avatar Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'avatar(10).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 10/10'},
	['wwe1'] 				 = {['name'] = 'wwe1', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 1/30'},
	['wwe2'] 				 = {['name'] = 'wwe2', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 2/30'},
	['wwe3'] 				 = {['name'] = 'wwe3', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 3/30'},
	['wwe4'] 				 = {['name'] = 'wwe4', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 4/30'},
	['wwe5'] 				 = {['name'] = 'wwe5', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 5/30'},
	['wwe6'] 				 = {['name'] = 'wwe6', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 6/30'},
	['wwe7'] 				 = {['name'] = 'wwe7', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(7).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 7/30'},
	['wwe8'] 				 = {['name'] = 'wwe8', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(8).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 8/30'},
	['wwe9'] 				 = {['name'] = 'wwe9', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(9).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 9/30'},
	['wwe10'] 				 = {['name'] = 'wwe10', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(10).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 10/30'},
	['wwe11'] 				 = {['name'] = 'wwe11', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(11).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 11/30'},
	['wwe12'] 				 = {['name'] = 'wwe12', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(12).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 12/30'},
	['wwe13'] 				 = {['name'] = 'wwe13', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(13).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 13/30'},
	['wwe14'] 				 = {['name'] = 'wwe14', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(14).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 14/30'},
	['wwe15'] 				 = {['name'] = 'wwe15', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(15).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 15/30'},
	['wwe16'] 				 = {['name'] = 'wwe16', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(16).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 16/30'},
	['wwe17'] 				 = {['name'] = 'wwe17', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(17).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 17/30'},
	['wwe18'] 				 = {['name'] = 'wwe18', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(18).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 18/30'},
	['wwe19'] 				 = {['name'] = 'wwe19', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(19).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 19/30'},
	['wwe20'] 				 = {['name'] = 'wwe20', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(20).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 20/30'},
	['wwe21'] 				 = {['name'] = 'wwe21', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(21).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 21/30'},
	['wwe22'] 				 = {['name'] = 'wwe22', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(22).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 22/30'},
	['wwe23'] 				 = {['name'] = 'wwe23', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(23).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 23/30'},
	['wwe24'] 				 = {['name'] = 'wwe24', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(24).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 24/30'},
	['wwe25'] 				 = {['name'] = 'wwe25', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(25).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 25/30'},
	['wwe26'] 				 = {['name'] = 'wwe26', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(26).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 26/30'},
	['wwe27'] 				 = {['name'] = 'wwe27', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(27).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 27/30'},
	['wwe28'] 				 = {['name'] = 'wwe28', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(28).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 28/30'},
	['wwe29'] 				 = {['name'] = 'wwe29', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(29).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 29/30'},
	['wwe30'] 				 = {['name'] = 'wwe30', 			  	  	['label'] = 'WWE Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wwe(30).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 30/30'},
	['hp1'] 				 = {['name'] = 'hp1', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 1/10'},
	['hp2'] 				 = {['name'] = 'hp2', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 2/10'},
	['hp3'] 				 = {['name'] = 'hp3', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 3/10'},
	['hp4'] 				 = {['name'] = 'hp4', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 4/10'},
	['hp5'] 				 = {['name'] = 'hp5', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 5/10'},
	['hp6'] 				 = {['name'] = 'hp6', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 6/10'},
	['hp7'] 				 = {['name'] = 'hp7', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(7).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 7/10'},
	['hp8'] 				 = {['name'] = 'hp8', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(8).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 8/10'},
	['hp9'] 				 = {['name'] = 'hp9', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(9).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 9/10'},
	['hp10'] 				 = {['name'] = 'hp10', 			  	  	['label'] = 'HarryPotter Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hp(10).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 10/10'},
	['halloween1'] 				 = {['name'] = 'halloween1', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 1/13'},
	['halloween2'] 				 = {['name'] = 'halloween2', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 2/13'},
	['halloween3'] 				 = {['name'] = 'halloween3', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 3/13'},
	['halloween4'] 				 = {['name'] = 'halloween4', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 4/13'},
	['halloween5'] 				 = {['name'] = 'halloween5', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 5/13'},
	['halloween6'] 				 = {['name'] = 'halloween6', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 6/13'},
	['halloween7'] 				 = {['name'] = 'halloween7', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(7).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 7/13'},
	['halloween8'] 				 = {['name'] = 'halloween8', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(8).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 8/13'},
	['halloween9'] 				 = {['name'] = 'halloween9', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(9).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 9/13'},
	['halloween10'] 				 = {['name'] = 'halloween10', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(10).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 10/13'},
	['halloween11'] 				 = {['name'] = 'halloween11', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(11).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 11/13'},
	['halloween12'] 				 = {['name'] = 'halloween12', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(12).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 12/13'},
	['halloween13'] 				 = {['name'] = 'halloween13', 			  	  	['label'] = 'Halloween Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'halloween(13).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 13/13'},
	['music1'] 				 = {['name'] = 'music1', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 1/45'},
	['music2'] 				 = {['name'] = 'music2', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 2/45'},
	['music3'] 				 = {['name'] = 'music3', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 3/45'},
	['music4'] 				 = {['name'] = 'music4', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 4/45'},
	['music5'] 				 = {['name'] = 'music5', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 5/45'},
	['music6'] 				 = {['name'] = 'music6', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 6/45'},
	['music7'] 				 = {['name'] = 'music7', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(7).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 7/45'},
	['music8'] 				 = {['name'] = 'music8', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(8).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 8/45'},
	['music9'] 				 = {['name'] = 'music9', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(9).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 9/45'},
	['music10'] 				 = {['name'] = 'music10', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(10).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 10/45'},
	['music11'] 				 = {['name'] = 'music11', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(11).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 11/45'},
	['music12'] 				 = {['name'] = 'music12', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(12).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 12/45'},
	['music13'] 				 = {['name'] = 'music13', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(13).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 13/45'},
	['music14'] 				 = {['name'] = 'music14', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(14).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 14/45'},
	['music15'] 				 = {['name'] = 'music15', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(15).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 15/45'},
	['music16'] 				 = {['name'] = 'music16', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(16).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 16/45'},
	['music17'] 				 = {['name'] = 'music17', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(17).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 17/45'},
	['music18'] 				 = {['name'] = 'music18', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(18).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 18/45'},
	['music19'] 				 = {['name'] = 'music19', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(19).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 19/45'},
	['music20'] 				 = {['name'] = 'music20', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(20).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 20/45'},
	['music21'] 				 = {['name'] = 'music21', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(21).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 21/45'},
	['music22'] 				 = {['name'] = 'music22', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(22).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 22/45'},
	['music23'] 				 = {['name'] = 'music23', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(23).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 23/45'},
	['music24'] 				 = {['name'] = 'music24', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(24).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 24/45'},
	['music25'] 				 = {['name'] = 'music25', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(25).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 25/45'},
	['music26'] 				 = {['name'] = 'music26', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(26).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 26/45'},
	['music27'] 				 = {['name'] = 'music27', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(27).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 27/45'},
	['music28'] 				 = {['name'] = 'music28', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(28).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 28/45'},
	['music29'] 				 = {['name'] = 'music29', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(29).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 29/45'},
	['music30'] 				 = {['name'] = 'music30', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(30).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 30/45'},
	['music31'] 				 = {['name'] = 'music31', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(31).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 31/45'},
	['music32'] 				 = {['name'] = 'music32', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(32).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 32/45'},
	['music33'] 				 = {['name'] = 'music33', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(33).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 33/45'},
	['music34'] 				 = {['name'] = 'music34', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(34).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 34/45'},
	['music35'] 				 = {['name'] = 'music35', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(35).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 35/45'},
	['music36'] 				 = {['name'] = 'music36', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(36).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 36/45'},
	['music37'] 				 = {['name'] = 'music37', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(37).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 37/45'},
	['music38'] 				 = {['name'] = 'music38', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(38).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 38/45'},
	['music39'] 				 = {['name'] = 'music39', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(39).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 39/45'},
	['music40'] 				 = {['name'] = 'music40', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(40).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 40/45'},
	['music41'] 				 = {['name'] = 'music41', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(41).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 41/45'},
	['music42'] 				 = {['name'] = 'music42', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(42).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 42/45'},
	['music43'] 				 = {['name'] = 'music43', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(43).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 43/45'},
	['music44'] 				 = {['name'] = 'music44', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(44).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 44/45'},
	['music45'] 				 = {['name'] = 'music45', 			  	  	['label'] = 'Musician Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'music(45).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 45/45'},
	['basketball1'] 				 = {['name'] = 'basketball1', 			  	  	['label'] = 'Basketball Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'basketball(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 1/8'},
	['basketball2'] 				 = {['name'] = 'basketball2', 			  	  	['label'] = 'Basketball Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'basketball(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 2/8'},
	['basketball3'] 				 = {['name'] = 'basketball3', 			  	  	['label'] = 'Basketball Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'basketball(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 3/8'},
	['basketball4'] 				 = {['name'] = 'basketball4', 			  	  	['label'] = 'Basketball Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'basketball(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 4/8'},
	['basketball5'] 				 = {['name'] = 'basketball5', 			  	  	['label'] = 'Basketball Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'basketball(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 5/8'},
	['basketball6'] 				 = {['name'] = 'basketball6', 			  	  	['label'] = 'Basketball Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'basketball(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 6/8'},
	['basketball7'] 				 = {['name'] = 'basketball7', 			  	  	['label'] = 'Basketball Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'basketball(7).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 7/8'},
	['basketball8'] 				 = {['name'] = 'basketball8', 			  	  	['label'] = 'Basketball Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'basketball(8).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 8/8'},
	['theoffice1'] 				 = {['name'] = 'theoffice1', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 1/32'},
	['theoffice2'] 				 = {['name'] = 'theoffice2', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 2/32'},
	['theoffice3'] 				 = {['name'] = 'theoffice3', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 3/32'},
	['theoffice4'] 				 = {['name'] = 'theoffice4', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 4/32'},
	['theoffice5'] 				 = {['name'] = 'theoffice5', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 5/32'},
	['theoffice6'] 				 = {['name'] = 'theoffice6', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 6/32'},
	['theoffice7'] 				 = {['name'] = 'theoffice7', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(7).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 7/32'},
	['theoffice8'] 				 = {['name'] = 'theoffice8', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(8).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 8/32'},
	['theoffice9'] 				 = {['name'] = 'theoffice9', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(9).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 9/32'},
	['theoffice10'] 				 = {['name'] = 'theoffice10', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(10).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 10/32'},
	['theoffice11'] 				 = {['name'] = 'theoffice11', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(11).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 11/32'},
	['theoffice12'] 				 = {['name'] = 'theoffice12', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(12).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 12/32'},
	['theoffice13'] 				 = {['name'] = 'theoffice13', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(13).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 13/32'},
	['theoffice14'] 				 = {['name'] = 'theoffice14', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(14).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 14/32'},
	['theoffice15'] 				 = {['name'] = 'theoffice15', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(15).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 15/32'},
	['theoffice16'] 				 = {['name'] = 'theoffice16', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(16).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 16/32'},
	['theoffice17'] 				 = {['name'] = 'theoffice17', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(17).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 17/32'},
	['theoffice18'] 				 = {['name'] = 'theoffice18', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(18).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 18/32'},
	['theoffice19'] 				 = {['name'] = 'theoffice19', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(19).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 19/32'},
	['theoffice20'] 				 = {['name'] = 'theoffice20', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(20).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 20/32'},
	['theoffice21'] 				 = {['name'] = 'theoffice21', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(21).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 21/32'},
	['theoffice22'] 				 = {['name'] = 'theoffice22', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(22).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 22/32'},
	['theoffice23'] 				 = {['name'] = 'theoffice23', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(23).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 23/32'},
	['theoffice24'] 				 = {['name'] = 'theoffice24', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(24).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 24/32'},
	['theoffice25'] 				 = {['name'] = 'theoffice25', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(25).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 25/32'},
	['theoffice26'] 				 = {['name'] = 'theoffice26', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(26).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 26/32'},
	['theoffice27'] 				 = {['name'] = 'theoffice27', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(27).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 27/32'},
	['theoffice28'] 				 = {['name'] = 'theoffice28', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(28).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 28/32'},
	['theoffice29'] 				 = {['name'] = 'theoffice29', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(29).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 29/32'},
	['theoffice30'] 				 = {['name'] = 'theoffice30', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(30).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 30/32'},
	['theoffice31'] 				 = {['name'] = 'theoffice31', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(31).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 31/32'},
	['theoffice32'] 				 = {['name'] = 'theoffice32', 			  	  	['label'] = 'TheOffice Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'theoffice(32).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 32/32'},
	['tmnt1'] 				 = {['name'] = 'tmnt1', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 1/14'},
	['tmnt2'] 				 = {['name'] = 'tmnt2', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 2/14'},
	['tmnt3'] 				 = {['name'] = 'tmnt3', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 3/14'},
	['tmnt4'] 				 = {['name'] = 'tmnt4', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 4/14'},
	['tmnt5'] 				 = {['name'] = 'tmnt5', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 5/14'},
	['tmnt6'] 				 = {['name'] = 'tmnt6', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 6/14'},
	['tmnt7'] 				 = {['name'] = 'tmnt7', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(7).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 7/14'},
	['tmnt8'] 				 = {['name'] = 'tmnt8', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(8).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 8/14'},
	['tmnt9'] 				 = {['name'] = 'tmnt9', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(9).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 9/14'},
	['tmnt10'] 				 = {['name'] = 'tmnt10', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(10).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 10/14'},
	['tmnt11'] 				 = {['name'] = 'tmnt11', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(11).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 11/14'},
	['tmnt12'] 				 = {['name'] = 'tmnt12', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(12).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 12/14'},
	['tmnt13'] 				 = {['name'] = 'tmnt13', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(13).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 13/14'},
	['tmnt14'] 				 = {['name'] = 'tmnt14', 			  	  	['label'] = 'TMNT Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tmnt(14).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Trading Card Co. 14/14'},
	['cat1'] 				 = {['name'] = 'cat1', 			  	  	['label'] = 'CatCafe Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'catcafe(1).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cat Cafe Inc. 1/6'},
	['cat2'] 				 = {['name'] = 'cat2', 			  	  	['label'] = 'CatCafe Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'catcafe(2).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cat Cafe Inc. 2/6'},
	['cat3'] 				 = {['name'] = 'cat3', 			  	  	['label'] = 'CatCafe Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'catcafe(3).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cat Cafe Inc. 3/6'},
	['cat4'] 				 = {['name'] = 'cat4', 			  	  	['label'] = 'CatCafe Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'catcafe(4).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cat Cafe Inc. 4/6'},
	['cat5'] 				 = {['name'] = 'cat5', 			  	  	['label'] = 'CatCafe Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'catcafe(5).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cat Cafe Inc. 5/6'},
	['cat6'] 				 = {['name'] = 'cat6', 			  	  	['label'] = 'CatCafe Toy', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'catcafe(6).png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cat Cafe Inc. 6/6'},

```