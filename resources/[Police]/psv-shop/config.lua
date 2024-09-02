Config = {}
Config.Core = "qb" -- qb, esx
Config.UseTextUI = false
Config.Shops = {
    {
        name = "Job Market",
        label = "LSPD Ammunation",
        type = "job",
        jobName = "police",
        blip = false,
        categories = {
            [1] = {
                name = "General",
                description = "24/7",
                items = {
                    {name = "pistol_ammo", label = "Pistol Ammo", perPrice = 150, description = "PD Items"},
                    {name = "smg_ammo", label = "SMG Ammo", perPrice = 150, description = "PD Items"},
                    {name = "rifle_ammo", label = "Rifle Ammo", perPrice = 150, description = "PD Items"},
                    {name = "taserammo", label = "Taser Ammo", perPrice = 150, description = "PD Items"},
                    {name = "handcuffs", label = "Handcuffs", perPrice = 150, description = "PD Items"},
                    {name = "police_stormram", label = "Storm Arm", perPrice = 150, description = "PD Items"},
                    {name = "armor", label = "Armor", perPrice = 150, description = "PD Items"},
                    {name = "radio", label = "Radio", perPrice = 150, description = "PD Items"},
                    {name = "ifaks", label = "Ifak", perPrice = 150, description = "PD Items"},
                    {name = "bandage", label = "Bandage", perPrice = 150, description = "PD Items"}
                }
            },
            [2] = {
                name = "Weapon",
                description = "24/7",
                items = {
                    {name = "weapon_stungun", label = "Stun Gun", perPrice = 150, description = "PD Items"},
                    {name = "weapon_smg", label = "SMG", perPrice = 150, description = "PD Items"},
                    {name = "weapon_combatpdw", label = "Combat PDW", perPrice = 150, description = "PD Items"},
                    {name = "weapon_specialcarbine_mk2", label = "ScarL", perPrice = 150, description = "PD Items"},
                    {name = "weapon_nightstick", label = "Nightstick", perPrice = 150, description = "PD Items"},
                    {name = "weapon_flashlight", label = "FlashLight", perPrice = 150, description = "PD Items"},

                }
            },
        },
        pedHash = 'ig_andreas',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(455.8143, -995.0488, 35.0624, 9.0557)}
        }
    },
}