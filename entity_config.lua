--[[
     _            _                    ____    _       _          _       _ 
    / \     ___  | |_   _ __    __ _  / ___|  | |__   (_)   ___  | |   __| |
   / _ \   / __| | __| | '__|  / _` | \___ \  | '_ \  | |  / _ \ | |  / _` |
  / ___ \  \__ \ | |_  | |    | (_| |  ___) | | | | | | | |  __/ | | | (_| |
 /_/   \_\ |___/  \__| |_|     \__,_| |____/  |_| |_| |_|  \___| |_|  \__,_|]]--

EntityConfig = {} -- DONT CHANGE

-- // Entitys // --
EntityConfig.Entity = true -- Entity Objects
EntityConfig.EntityKick = false -- Do you want to kicked them?
EntityConfig.EntityBan = true -- Do you want to ban them?

-- // Vehicle & Ped // --
EntityConfig.EntityVehicle = false -- Anti Vehicle
EntityConfig.EntityVehicleLimit = 2 -- Vehicle Limit 
EntityConfig.EntityPed = true -- Anti Ped´s
EntityConfig.EntityPedLimit = 2 -- Ped Limit

-- // Objects // --
EntityConfig.Objects = {
	[GetHashKey("hei_prop_carrier_radar_1_l1")] = true,
	[GetHashKey("v_res_mexball")] = true,
	[GetHashKey("prop_rock_1_a")] = true,
	[GetHashKey("prop_rock_1_b")] = true,
	[GetHashKey("prop_rock_1_c")] = true,
	[GetHashKey("prop_rock_1_d")] = true,
	[GetHashKey("prop_player_gasmask")] = true,
	[GetHashKey("prop_rock_1_e")] = true,
}

-- // Vehicle // --
EntityConfig.Vehicle = {
    [GetHashKey("adder")] = true,
    [GetHashKey("jet")] = true,
    [GetHashKey("dinghy")] = true,
}