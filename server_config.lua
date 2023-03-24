--[[
     _            _                    ____    _       _          _       _ 
    / \     ___  | |_   _ __    __ _  / ___|  | |__   (_)   ___  | |   __| |
   / _ \   / __| | __| | '__|  / _` | \___ \  | '_ \  | |  / _ \ | |  / _` |
  / ___ \  \__ \ | |_  | |    | (_| |  ___) | | | | | | | |  __/ | | | (_| |
 /_/   \_\ |___/  \__| |_|     \__,_| |____/  |_| |_| |_|  \___| |_|  \__,_|
                                                                            |
]]--

ServerConfig = {} -- DONT CHANGE

-- // Server // --
ServerConfig.AntiBringAll = true -- Anti Bring All Players
ServerConfig.AntiPlaySound = true -- Anti Play Sound´s
ServerConfig.PoliceVehicleWeapon = true -- Remove Police Weapons
ServerConfig.AntiSpamTrigger = true -- Do you want Spamm Triggers?

-- // Health // --
ServerConfig.AntiHealthHack = true
ServerConfig.MaxHealth = 200

-- // Armor // --
ServerConfig.AntiArmorHack = false
ServerConfig.MaxArmor = 100

-- // ClearPedTasks // --
ServerConfig.AntiClearPedTasks = true -- Anti ClearPedTask
ServerConfig.MaxClearPedTasks = 3 -- ClearPedTask Limit

-- // Resource // --
ServerConfig.AntiStopper = true -- Anti Stop Resourcen. If other players are on the server without a bypass, incorrect bans can occur!
ServerConfig.ResInjection = true -- Anti Resource Injection

-- // Tazer // --
ServerConfig.Antitaze = true -- Anti Taze
ServerConfig.AntitazeTimer = 3 -- Taze Timer
ServerConfig.MaxTazeSpammer = 2 -- Max Taze

-- // Chat // --
ServerConfig.AntiFakeChatMessages = true -- Anti FakeChatMessages

-- // Explosion Protections // --
ServerConfig.Explosion = {
    AntiExplosionBullet = true, -- Anti ExplosionBullet
    AntiExplosion = true, -- Do you want Blacklisted Explosion?  
    AntiExplosionKick = false, -- Do you want to kicked them?
    AntiExplosionBan = true, -- Do you want to ban them?
    BlacklistedExplosions = { 1, 2, 4, 5, 25, 31, 32, 33, 35, 36, 37, 38 },
    WhitelistedExplosions = { 9, 10, 13 },
}
ServerConfig.WeaponExplosiveCheck = true -- Do you want Weapon ExplosiveCheck?  
ServerConfig.WeaponExplosiveWhiteList = {
    "weapon_sniperrifle",
    "weapon_heavysniper",
    "weapon_heavysniper_mk2",
    "weapon_marksmanrifle",
    "weapon_marksmanrifle_mk2",
}