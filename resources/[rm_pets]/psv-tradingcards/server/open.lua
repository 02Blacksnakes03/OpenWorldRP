local QBCore = exports['qb-core']:GetCoreObject()

for _, k in pairs(Config.Cards) do
	if not QBCore.Shared.Items[k.item] then
		QBCore.Functions.AddItems({
			[k.item] = {
				name = k.item,
				label = 'Trading Card', -- DO NOT CHANGE UNLESS YOU KNOW WHAT YOU ARE DOING
				weight = 1000,
				type = 'item',
				image = k.img,
				unique = true,
				useable = true,
				shouldClose = true,
				combinable = nil,
				description = Config.BusinessName .. ' Trading Card Co.'
			},
		})
	end
end