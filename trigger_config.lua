--[[
     _            _                    ____    _       _          _       _ 
    / \     ___  | |_   _ __    __ _  / ___|  | |__   (_)   ___  | |   __| |
   / _ \   / __| | __| | '__|  / _` | \___ \  | '_ \  | |  / _ \ | |  / _` |
  / ___ \  \__ \ | |_  | |    | (_| |  ___) | | | | | | | |  __/ | | | (_| |
 /_/   \_\ |___/  \__| |_|     \__,_| |____/  |_| |_| |_|  \___| |_|  \__,_|
                                                                            ]]--

TriggerConfig = {} -- DONT CHANGE

-- // Blacklisted Events // --
TriggerConfig.BlacklistedEvents = true -- Do you want Blacklisted Event´s?  
TriggerConfig.BlacklistedEventsKick = false -- Do you want to kicked them?
TriggerConfig.BlacklistedEventsBan = true -- Do you want to ban them?
TriggerConfig.BlacklistedEventsList = { -- Do you want Blacklist events?
        'esx_spectate:kick',
        'chat:server:ServerPSA',
        'adminmenu:allowall',
        'esx_jailer:sendToJail',
        'esx:jackingcar',
        'esx_mafiajob:confiscatePlayerItem',
        'KorioZ-PersonalMenu:Admin_giveCash',
        'KorioZ-PersonalMenu:Admin_giveCash',
}