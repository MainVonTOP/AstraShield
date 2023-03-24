--[[
     _            _                    ____    _       _          _       _ 
    / \     ___  | |_   _ __    __ _  / ___|  | |__   (_)   ___  | |   __| |
   / _ \   / __| | __| | '__|  / _` | \___ \  | '_ \  | |  / _ \ | |  / _` |
  / ___ \  \__ \ | |_  | |    | (_| |  ___) | | | | | | | |  __/ | | | (_| |
 /_/   \_\ |___/  \__| |_|     \__,_| |____/  |_| |_| |_|  \___| |_|  \__,_|]]--

MainConfig = {} -- DONT CHANGE

-- // Server & Settings // --
MainConfig.ESX = true -- Do you use esx?
MainConfig.AntiESX = false -- Anti ESX
MainConfig.esxSharedObject = "esx:getSharedObject"
MainConfig.Servername = 'AstraShield Anticheat' -- Enter Your server name!
MainConfig.Banmessage = 'Added your Banmessage here' -- Enter Banmessage here!
MainConfig.Kickmessage = 'Added your Kickmessage here' -- Enter Kickmessage here!
MainConfig.Discordlink = 'discord.gg/' -- Added your Discord link here!

-- // Player & Self // --
MainConfig.AntiNoclipAndTeleport = false -- Anti Noclip / Teleport (test)
MainConfig.AntiVision = true -- Do you want Vision ?  
MainConfig.AntiNightVision = true -- Anti NightVision 
MainConfig.AntiThermalVision = true -- Anti ThermalVision
MainConfig.AntiInfiniteAmmo = false
MainConfig.AntiSuperJump = true -- Anti Superjump
MainConfig.AntiBlips = true -- Anti Blips
MainConfig.AntiSpectate = true -- Anti Spectate
MainConfig.AntiRemoveFromCar = true -- Anti Remove Players from Car
MainConfig.AntiGodmode = true -- Anti Godmode
MainConfig.WeaponEvents = {
	AntiGiveWeapon = true,
	AntiRemoveWeapon = true,
}
MainConfig.ClEvents = {
	"esx:spawnVehicle",
    "esx:getSharedObject"
}

-- //VehicleSpawn // --
MainConfig.AntiVehicleSpawn = false -- Anti VehicleSpawn
MainConfig.GarageList = { -- Garagen List
	{x = 217.89, y = -804.99, z = 30.91},
}

-- // JaillAll // --
MainConfig.AntiJaillAll = true
MainConfig.AntiJaillAllKick = false
MainConfig.AntiJaillAllBan = true

-- // Particles // --
MainConfig.AntiParticles = true -- Do you want Particles? 
MainConfig.AntiParticlesKick = false -- Do you want to kicked them?
MainConfig.AntiParticlesBan = true -- Do you want to ban them?
MainConfig.AntiParticlesLimit = 2 -- Particle Limit

-- // Event Protections // --
MainConfig.Event = {
    BlacklistedEvents = true, -- Do you want Blacklisted Event s?  
    BlacklistedEventsKick = false, -- Do you want to kicked them?
    BlacklistedEventsBan = true, -- Do you want to ban them?
    BlacklistedEventsList = { -- Do you want Blacklist events?
        'esx_spectate:kick',
        'chat:server:ServerPSA',
        'adminmenu:allowall',
        'esx_jailer:sendToJail',
        'esx:jackingcar',
        'esx_mafiajob:confiscatePlayerItem',
        'KorioZ-PersonalMenu:Admin_giveCash',
        'KorioZ-PersonalMenu:Admin_giveCash',
    },
    AntiSpamTrigger = true, -- Do you want Spamm Triggers?  
    AntiSpamTriggerList = {
        {event = "fuel:pay", max = 2},
        {event = "lester:vendita", max = 3},
        {event = "esx_billing:sendBill", max = 2},
        {event = "esx_policejob:message", max = 5},
        {event = "TriggerServerEvent ('bringplayertome', -1, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z)", max = 0},
        {event = "bringplayertome', -1, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z)", max = 0},
        {event = "bringplayertome", max = 1},
        {event = "('bringplayertome', -1, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z)", max = 0},
        {event = "esx_job_creator:handcuff", max = 4},
        {event = "esx_dmvschool:addLicenses", max = 2}, 
   },
}


-- // Weapon // --
MainConfig.StopDamageAIModify = true -- Anti AI Damage
MainConfig.AntiWeaponPickup = true -- Anti Weapon Pickup
MainConfig.AntiRemoveWeapon = true -- Anti Remove Weapon
MainConfig.AntiDamageModifier = true -- Anti Damag Modify (test)
MainConfig.BlacklistedWeapons = true -- Do you want Blacklist Weapons? 
MainConfig.BlacklistedWeaponsBan = true -- Do you want to ban them?
MainConfig.BlacklistedWeaponsList = { -- Blacklisted Weapon List
    "WEAPON_RPG",
	"WEAPON_GRENADE",
    "weapon_grenadelauncher",
    "weapon_grenadelauncher_smoke",
    "weapon_minigun",
    "weapon_firework",
    "weapon_hominglauncher",
    "weapon_compactlauncher",
    "weapon_rayminigun",
    "weapon_emplauncher",
    "weapon_bzgas",
    "weapon_molotov",
    "weapon_stickybomb",
    "weapon_proxmine",
    "weapon_pipebomb",
    "weapon_flare",
}