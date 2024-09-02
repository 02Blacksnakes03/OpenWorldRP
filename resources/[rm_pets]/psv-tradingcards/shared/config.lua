Config = {}

--------------------------------------------------------
--						Target/Inv					  --
--------------------------------------------------------

Config.Target = 'qb-target'
Config.Inventory = 'qb-inventory'	
Config.UseISStatusHud = false -- set to false to remove the use of is-statushud

--------------------------------------------------------
--						Items						  --
--------------------------------------------------------

Config.ToyPackItemName 			= 'goldenegg' -- This item, when used, gives players a random funko pop. 
Config.BoosterBoxItemName 		= 'boosterbox'
Config.BoosterPackItemName 		= 'boosterpack'

-- These items act as an Ender chest from Minecraft. This means that the binders and the boxes are locked to the player's CID.
-- This allows players to carry the binder/box with them and not have to worry about having their collectibles stolen. 
Config.BinderItemName 			= 'binder'    -- This item, when used, opens a card binder that stores funko pops. It ONLY takes funko pops. 
Config.ToyBoxItemName  			= 'toychest'  -- This item, when used, opens a toy box that stores funko pops. It ONLY takes funko pops. 

--------------------------------------------------------
--						Storage						  --
--------------------------------------------------------

Config.BinderSlots = 200 		-- slots for the binder (make sure it's big enough to store AT LEAST one of each card)
Config.BinderWeight = 200000	-- weight for the binder (make sure it's big enough to store one card per slot)

Config.ToyBoxSlots = 300		-- slots for toy box (make sure it's big enough to store AT LEAST one of each toy)
Config.ToyBoxWeight = 200000 	-- weight for the toy box (make sure it's big enough to store one toy per slot)

--------------------------------------------------------
--						Packs						  --
--------------------------------------------------------

Config.PacksPerBox = 5 -- How many booster packs exist in a booster box?
Config.CardsPerPack = 1 -- How many cards exist in a booster pack?

--------------------------------------------------------
--						Business					  --
--------------------------------------------------------
Config.UseBusiness = false -- change to false to allow anyone to buy items from the shop, and allow anyone to grade. 
Config.BusinessName = 'Blazing Comics'
Config.StoreJob = "comic" -- If you decide to make this a player owned job, name of the job in 'qb-core/shared/jobs.lua'
-- Business Shop
Config.CommicShopPos = vector3(-141.4926, 223.9281, 94.9870) -- Ped's location
Config.CommicShopHeading =  266.8098 -- Ped heading
-- Business Stash
Config.CommicStashPos = vector3(-142.0677, 218.7249, 94.9870) -- Ped's location
Config.CommicStashHeading =  90.44 -- Ped heading

Config.Items = {  -- The store that can oly be accessed by players with the 'Config.StoreJob' job
    label = "Card Store", -- Label of the inventory shop when it's opened. 
    slots = 5, -- How many slots the store has when you open it. To make it look clean, set it to the # of items you have below.
    items = {
         [1] = { name = Config.ToyPackItemName, price = 150, amount = 25, info = {}, type = "item", slot = 1, },
         [2] = { name = Config.ToyBoxItemName, price = 2000, amount = 5, info = {}, type = "item", slot = 2, },
        [3] = { name = Config.BoosterPackItemName, price = 400, amount = 25, info = {}, type = "item", slot = 3, },
        [4] = { name = Config.BoosterBoxItemName, price = 4000, amount = 5, info = {}, type = "item", slot = 4, },
		 [5] = { name = Config.BinderItemName, price = 2000, amount = 5, info = {}, type = "item", slot = 5, },
		-- add more items here. If you add items you MUST update 'slots' on line 13
		--[6] = { name = "example", price = 1, amount = 1, info = {}, type = "item", slot = 6, },
    }
}

--------------------------------------------------------
--						Card Grading				  --
--------------------------------------------------------
Config.Material = 'glass'       -- Item needed to grade cards
Config.MaterialAmmount = 50     -- Amount of Material needed to grade cards
