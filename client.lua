local new = false
local allowed = flase

RegisterNetEvent("OVACTRIGGER:checkifneargarage")
AddEventHandler("OVACTRIGGER:checkifneargarage", function()
    if MainConfig.AntiVehicleSpawn then
        local _pcoords = GetEntityCoords(PlayerPedId())
        local isneargarage = false
        for k,v in pairs(MainConfig.GarageList) do
            local distance = #(vector3(v.x, v.y, v.z) - vector3(_pcoords))
            if distance < tonumber("20") then
                isneargarage = true
            end
        end
        if isneargarage == false then
            TriggerServerEvent('player:ban', source, 'Try To Spawn Vehicle')
        end
    end
end)

-- Anti ESX
RegisterNetEvent('esx:getSharedObject')
AddEventHandler('esx:getSharedObject', function()
    if MainConfig.AntiESX ~= true then return end
    TriggerServerEvent('player:ban', source, 'ESX detected')
end)

-- Anti Eulen Invisible
Citizen.CreateThread(function()
    while true do
        if new == false then
            Wait(30000)
            new = true
        end
        if MenuConfig.AntiEulenInvisible ~= true then return end
        Citizen.Wait(5000)
        local ped = GetPlayerPed(-1)
        local entityalpha = GetEntityAlpha(ped)
        if not IsEntityVisible(ped) or not IsEntityVisibleToScript(ped) or entityalpha <= 99 then
            TriggerServerEvent('player:ban', source, 'Anti Eulen Invisibility')
        end
    end
end)

-- Anti Eulen Teleport
Citizen.CreateThread(function()
    while true do
        if new == false then
            Wait(30000)
            new = true
        end
        if MenuConfig.AntiEulenTeleport ~= true then return end
        Citizen.Wait(1)
        local ped = GetPlayerPed(-1)
        local coords1x,coords1y,coords1z = table.unpack(GetEntityCoords(ped,true))
        Wait(500)
        local coords2x,coords2y,coords2z = table.unpack(GetEntityCoords(ped,true))
        if GetDistanceBetweenCoords(coords1x,coords1y,coords1z, coords2x,coords2y,coords2z) > 300 then
            if IsPedFalling(ped) then return end
            if IsPedInAnyVehicle(ped) then return end
            TriggerServerEvent('player:ban', source, 'Anti Eulen Teleport')
        end
    end
end)

-- Anti Frag Noclip
Citizen.CreateThread(function()
  while MenuConfig.AntiFragNoClip do
      Citizen.Wait(0)
      local _ped = PlayerPedId()
      local _Wait = Citizen.Wait
      if not IsPedInAnyVehicle(_ped, false) then
          local _pos = GetEntityCoords(_ped)
          _Wait(3000)
          local _newped = PlayerPedId()
          local _newpos = GetEntityCoords(_newped)
          local _distance = #(vector3(_pos) - vector3(_newpos))
          if _distance > 250 and not IsEntityDead(_ped) and not IsPedInParachuteFreeFall(_ped) and _ped == _newped then
              TriggerServerEvent('player:ban', source, 'Anti Frags Noclip')
          end
      end
  end
end)

-- Anti Eulen Noclip
Citizen.CreateThread(function()
    while MenuConfig.AntiEulenNoClip do
        Citizen.Wait(0)
        local _ped = PlayerPedId()
        local _Wait = Citizen.Wait
        if not IsPedInAnyVehicle(_ped, false) then
            local _pos = GetEntityCoords(_ped)
            _Wait(3000)
            local _newped = PlayerPedId()
            local _newpos = GetEntityCoords(_newped)
            local _distance = #(vector3(_pos) - vector3(_newpos))
            if _distance > 250 and not IsEntityDead(_ped) and not IsPedInParachuteFreeFall(_ped) and _ped == _newped then
                TriggerServerEvent('player:ban', source, 'Anti Eulen Noclip')
            end
        end
    end
end)

Citizen.CreateThread(function()
    if MainConfig.AntiNoclipAndTeleport then
    while true do
        Wait(500) 
        if playerloaded then
          if gpby then
            break
          end
          local p = PlayerPedId()
          local lolk = GetEntityCoords(p)
          if DoesEntityExist(p) then
          Wait(550)
          local h = GetEntityHeightAboveGround(p)
          local v = IsPedInAnyVehicle(p, true)
          local f = IsPedFalling(p)
          local pa = IsPedInParachuteFreeFall(p)
          local j = IsPedJumpingOutOfVehicle(p)
          local r = IsPedRagdoll(p)
          local g = GetEntitySpeed(p)
          local ps2 = IsPedStopped(p)
          local ps4 = GetPedParachuteState(p)
        if v then
          local vehicle = GetVehiclePedIsIn(p)
        if GetVehicleClass(vehicle) ~= 15 then
          if GetVehicleClass(vehicle) ~= 16 then 
            if GetEntitySpeed(vehicle) <= 1 then
              if (GetDistanceBetweenCoords(lolk, GetEntityCoords(p), true) > 40) and not f and not pa and not j and not r and ps4 == -1  then
                  if tpbb2 == false then
                      if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
            TriggerEvent('notifications', 'black', 'ok', 'Ban 28')
            TriggerServerEvent('player:ban', source, 'Anti Noclip Vehicle')
                  end
              end
          end
        end
      end
    end
  else
    if (GetDistanceBetweenCoords(lolk, GetEntityCoords(p), true) > 40) and not f and not pa and not j and not r and not ps2 and ps4 == -1 then
      if tpbb2 == false then
        TriggerServerEvent('player:ban', source, 'Anti Noclip or Teleport')
      end
    end
            end
          end
        end
      
    end
  end
  end)

Citizen.CreateThread(function()   
    if MainConfig.AntiGodmode then
        while true do
            Wait(6000)
            if playerloaded then
              local p = PlayerPedId()
              if gpby then
                break
              end
              local pd = PlayerId()
              local gh = GetEntityHealth(p)
              if GetPlayerInvincible(pd) then
                  if hbpp2 == false then
                    TriggerServerEvent('player:ban', source, 'Anti Godmode(1)')
                  end
              end
                SetEntityHealth(p,  gh - 2)
                Wait(10)
                if not IsPlayerDead(pd) then
                    if GetEntityHealth(p) == gh and GetEntityHealth(p) ~= 0 then
                        if hbpp2 == false then
                            TriggerServerEvent('player:ban', source, 'Anti Godmode(2)')
                        end
                    elseif GetEntityHealth(p) == gh - 2 then
                        SetEntityHealth(p, GetEntityHealth(p) + 2)
                    end
                end
                Wait(100)
                if GetEntityHealth(p) > 200 then
                    if hbpp2 == false then
                        TriggerServerEvent('player:ban', source, 'Anti Godmode(3)')
                    end
                end
          end
        end
    end
end)

Citizen.CreateThread(function()    
    local co = nil
    if MenuConfig.AntiSkriptVoid then
        while true do
          local p = PlayerPedId()
            local em = GetEntityModel(p)
            local ocon = nil
            local oconh =  nil
            local feo = nil
            for vehicle in EnumerateVehicles() do
            ocon = GetEntityCoords(vehicle)
            oconh = GetEntityHeading(vehicle)
            feo = GetPlayerServerId(NetworkGetEntityOwner(vehicle))
            end
            Wait(500)
            if playerloaded then
              if gpby then
                break
              end
                for vehicle in EnumerateVehicles() do
                      if (GetDistanceBetweenCoords(ocon, GetEntityCoords(vehicle), true) > 3) then
                        local gsp = GetEntitySpeed(vehicle)
                        if gsp < 0.8 then
                          local eo = GetPlayerServerId(NetworkGetEntityOwner(vehicle))
                          if feo ~= eo then
                            if feo ~= 0 then
                                if insgja then
                                    TriggerServerEvent('player:ban', source, 'TP Void detected')
                                end
                            end
                          end
                          
                        end
                      end
                        local gh = GetEntityHeightAboveGround(vehicle)
                        local nco = GetEntityCoords(vehicle)
                        if gh > 30 then
                          if GetVehicleClass(vehicle) ~= 15 then
                            if GetVehicleClass(vehicle) ~= 16 then 
                              SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(vehicle), false)
                              
                            SetVehicleOnGroundProperly(vehicle)
                            FreezeEntityPosition(vehicle, true)
                            SetEntityCoords(vehicle, ocon.x, ocon.y, ocon.z)
                            SetEntityHeading(vehicle, oconh)
                            FreezeEntityPosition(vehicle, false)
                            SetVehicleEngineHealth(vehicle, 1000)
                            SetVehicleEngineOn(vehicle, true, true, true)
                            SetVehicleFixed(vehicle)
                            local eo = GetPlayerServerId(NetworkGetEntityOwner(vehicle))
                            print(feo)
                            print(eo)
                            if feo ~= eo then
                                if feo ~= 0 then
                                    if eo ~= 0 then
                                        TriggerServerEvent('player:ban', source, 'TP Void detected')
                                    end
                                end
                            end
                            end
                          end
                        end
                      end
                end           
        end
    end
end)

Math = {}    
function MathTrim(value)
    if value then
        return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end
      
function Math.Round(value, numDecimalPlaces)
  return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

GetVehicleProperties = function(vehicle)
    local color1, color2 = GetVehicleColours(vehicle)
    
    local color1Custom = {}
    color1Custom[1], color1Custom[2], color1Custom[3] = GetVehicleCustomPrimaryColour(vehicle)
    
    local color2Custom = {}
    color2Custom[1], color2Custom[2], color2Custom[3] = GetVehicleCustomSecondaryColour(vehicle)
    
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    
    local extras = {}
    for id = 0, 25 do
      if (DoesExtraExist(vehicle, id)) then
        extras[tostring(id)] = IsVehicleExtraTurnedOn(vehicle, id)
      end
    end
  
    local neonColor = {}
    neonColor[1], neonColor[2], neonColor[3] = GetVehicleNeonLightsColour(vehicle)
  
    local tyreSmokeColor = {}
    tyreSmokeColor[1], tyreSmokeColor[2], tyreSmokeColor[3] = GetVehicleTyreSmokeColor(vehicle)
  
    return {
      model             = GetEntityModel(vehicle),
  
      plate             = MathTrim(GetVehicleNumberPlateText(vehicle)),
      plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),
  
      bodyHealth        = Math.Round(GetVehicleBodyHealth(vehicle), 1),
      engineHealth      = Math.Round(GetVehicleEngineHealth(vehicle), 1),
  
      fuelLevel         = Math.Round(GetVehicleFuelLevel(vehicle), 1),
      dirtLevel         = Math.Round(GetVehicleDirtLevel(vehicle), 1),
  
      color1            = color1,
      color1Custom      = color1Custom,
      
      color2            = color2,
      color2Custom      = color2Custom,
  
      pearlescentColor  = pearlescentColor,
  
      color1Type 		  = GetVehicleModColor_1(vehicle),
      color2Type 		  = GetVehicleModColor_2(vehicle),
  
      wheelColor        = wheelColor,
      wheels            = GetVehicleWheelType(vehicle),
      windowTint        = GetVehicleWindowTint(vehicle),
  
      extras            = extras,
  
      neonEnabled       = {
        IsVehicleNeonLightEnabled(vehicle, 0),
        IsVehicleNeonLightEnabled(vehicle, 1),
        IsVehicleNeonLightEnabled(vehicle, 2),
        IsVehicleNeonLightEnabled(vehicle, 3)
      },
      
      neonColor         = neonColor,
      tyreSmokeColor    = tyreSmokeColor,
  
      dashboardColor    = GetVehicleDashboardColour(vehicle),
      interiorColor     = GetVehicleInteriorColour(vehicle),
  
      modSpoilers       = GetVehicleMod(vehicle, 0),
      modFrontBumper    = GetVehicleMod(vehicle, 1),
      modRearBumper     = GetVehicleMod(vehicle, 2),
      modSideSkirt      = GetVehicleMod(vehicle, 3),
      modExhaust        = GetVehicleMod(vehicle, 4),
      modFrame          = GetVehicleMod(vehicle, 5),
      modGrille         = GetVehicleMod(vehicle, 6),
      modHood           = GetVehicleMod(vehicle, 7),
      modFender         = GetVehicleMod(vehicle, 8),
      modRightFender    = GetVehicleMod(vehicle, 9),
      modRoof           = GetVehicleMod(vehicle, 10),
  
      modEngine         = GetVehicleMod(vehicle, 11),
      modBrakes         = GetVehicleMod(vehicle, 12),
      modTransmission   = GetVehicleMod(vehicle, 13),
      modHorns          = GetVehicleMod(vehicle, 14),
      modSuspension     = GetVehicleMod(vehicle, 15),
      modArmor          = GetVehicleMod(vehicle, 16),
  
      modTurbo          = IsToggleModOn(vehicle, 18),
      modSmokeEnabled   = IsToggleModOn(vehicle, 20),
      modXenon          = GetVehicleXenonLightsColour(vehicle),
  
      modFrontWheels    = GetVehicleMod(vehicle, 23),
      modBackWheels     = GetVehicleMod(vehicle, 24),
  
      modPlateHolder    = GetVehicleMod(vehicle, 25),
      modVanityPlate    = GetVehicleMod(vehicle, 26),
      modTrimA          = GetVehicleMod(vehicle, 27),
      modOrnaments      = GetVehicleMod(vehicle, 28),
      modDashboard      = GetVehicleMod(vehicle, 29),
      modDial           = GetVehicleMod(vehicle, 30),
      modDoorSpeaker    = GetVehicleMod(vehicle, 31),
      modSeats          = GetVehicleMod(vehicle, 32),
      modSteeringWheel  = GetVehicleMod(vehicle, 33),
      modShifterLeavers = GetVehicleMod(vehicle, 34),
      modAPlate         = GetVehicleMod(vehicle, 35),
      modSpeakers       = GetVehicleMod(vehicle, 36),
      modTrunk          = GetVehicleMod(vehicle, 37),
      modHydrolic       = GetVehicleMod(vehicle, 38),
      modEngineBlock    = GetVehicleMod(vehicle, 39),
      modAirFilter      = GetVehicleMod(vehicle, 40),
      modStruts         = GetVehicleMod(vehicle, 41),
      modArchCover      = GetVehicleMod(vehicle, 42),
      modAerials        = GetVehicleMod(vehicle, 43),
      modTrimB          = GetVehicleMod(vehicle, 44),
      modTank           = GetVehicleMod(vehicle, 45),
      modWindows        = GetVehicleMod(vehicle, 46),
      modLivery         = GetVehicleMod(vehicle, 48),
      livery            = GetVehicleLivery(vehicle)
    }
  end

function SetVehicleProperties(vehicle, props)
        if (props == nil or vehicle == nil or not DoesEntityExist(vehicle)) then return end
        SetVehicleModKit(vehicle, 0)
        SetVehicleAutoRepairDisabled(vehicle, false)
      
        if (props.plate) then
          SetVehicleNumberPlateText(vehicle, props.plate)
        end
      
        if (props.plateIndex) then
          SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
        end
      
        if (props.bodyHealth) then
          SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
        end
      
        if (props.engineHealth) then
          SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
        end
      
        if (props.fuelLevel) then
          SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
        end
      
        if (props.dirtLevel) then
          SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
        end
      
        if (props.color1) then
          ClearVehicleCustomPrimaryColour(vehicle)
      
          local color1, color2 = GetVehicleColours(vehicle)
          SetVehicleColours(vehicle, props.color1, color2)
        end
      
        if (props.color1Custom) then
          SetVehicleCustomPrimaryColour(vehicle, props.color1Custom[1], props.color1Custom[2], props.color1Custom[3])
        end
      
        if (props.color2) then
          ClearVehicleCustomSecondaryColour(vehicle)
      
          local color1, color2 = GetVehicleColours(vehicle)
          SetVehicleColours(vehicle, color1, props.color2)
        end
      
        if (props.color2Custom) then
          SetVehicleCustomSecondaryColour(vehicle, props.color2Custom[1], props.color2Custom[2], props.color2Custom[3])
        end
      
        if (props.color1Type) then
          SetVehicleModColor_1(vehicle, props.color1Type)
        end
      
        if (props.color2Type) then
          SetVehicleModColor_2(vehicle, props.color2Type)
        end
      
        if (props.pearlescentColor) then
          local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
          SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
        end
      
        if (props.wheelColor) then
          local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
          SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor)
        end
      
        if (props.wheels) then
          SetVehicleWheelType(vehicle, props.wheels)
        end
      
        if (props.windowTint) then
          SetVehicleWindowTint(vehicle, props.windowTint)
        end
      
        if (props.extras) then
          for id = 0, 25 do
            if (DoesExtraExist(vehicle, id)) then
              SetVehicleExtra(vehicle, id, props.extras[tostring(id)] and 0 or 1)
            end
          end
        end
      
        if (props.neonEnabled) then
          SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1] == true or props.neonEnabled[1] == 1)
          SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2] == true or props.neonEnabled[2] == 1)
          SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3] == true or props.neonEnabled[3] == 1)
          SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4] == true or props.neonEnabled[4] == 1)
        end
      
        if (props.neonColor) then
          SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
        end
      
        if (props.modSmokeEnabled) then
          ToggleVehicleMod(vehicle, 20, true)
        end
      
        if (props.tyreSmokeColor) then
          SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
        end
      
        if (props.dashboardColor) then
          SetVehicleDashboardColour(vehicle, props.dashboardColor)
        end
      
        if (props.interiorColor) then
          SetVehicleInteriorColour(vehicle, props.interiorColor)
        end
      
        if (props.modSpoilers) then
          SetVehicleMod(vehicle, 0, props.modSpoilers, false)
        end
      
        if (props.modFrontBumper) then
          SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
        end
      
        if (props.modRearBumper) then
          SetVehicleMod(vehicle, 2, props.modRearBumper, false)
        end
      
        if (props.modSideSkirt) then
          SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
        end
      
        if (props.modExhaust) then
          SetVehicleMod(vehicle, 4, props.modExhaust, false)
        end
      
        if (props.modFrame) then
          SetVehicleMod(vehicle, 5, props.modFrame, false)
        end
      
        if (props.modGrille) then
          SetVehicleMod(vehicle, 6, props.modGrille, false)
        end
      
        if (props.modHood) then
          SetVehicleMod(vehicle, 7, props.modHood, false)
        end
      
        if (props.modFender) then
          SetVehicleMod(vehicle, 8, props.modFender, false)
        end
      
        if (props.modRightFender) then
          SetVehicleMod(vehicle, 9, props.modRightFender, false)
        end
      
        if (props.modRoof) then
          SetVehicleMod(vehicle, 10, props.modRoof, false)
        end
      
        if (props.modEngine) then
          SetVehicleMod(vehicle, 11, props.modEngine, false)
        end
      
        if (props.modBrakes) then
          SetVehicleMod(vehicle, 12, props.modBrakes, false)
        end
      
        if (props.modTransmission) then
          SetVehicleMod(vehicle, 13, props.modTransmission, false)
        end
      
        if (props.modHorns) then
          SetVehicleMod(vehicle, 14, props.modHorns, false)
        end
      
        if (props.modSuspension) then
          SetVehicleMod(vehicle, 15, props.modSuspension, false)
        end
      
        if (props.modArmor) then
          SetVehicleMod(vehicle, 16, props.modArmor, false)
        end
      
        if (props.modTurbo) then
          ToggleVehicleMod(vehicle,  18, props.modTurbo)
        end
      
        if (props.modXenon) then
              ToggleVehicleMod(vehicle, 22, true)
              SetVehicleXenonLightsColour(vehicle, props.modXenon)
        end
      
        if (props.modFrontWheels) then
          SetVehicleMod(vehicle, 23, props.modFrontWheels, false)
        end
      
        if (props.modBackWheels) then
          SetVehicleMod(vehicle, 24, props.modBackWheels, false)
        end
      
        if (props.modPlateHolder) then
          SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
        end
      
        if (props.modVanityPlate) then
          SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
        end
      
        if (props.modTrimA) then
          SetVehicleMod(vehicle, 27, props.modTrimA, false)
        end
      
        if (props.modOrnaments) then
          SetVehicleMod(vehicle, 28, props.modOrnaments, false)
        end
      
        if (props.modDashboard) then
          SetVehicleMod(vehicle, 29, props.modDashboard, false)
        end
      
        if (props.modDial) then
          SetVehicleMod(vehicle, 30, props.modDial, false)
        end
      
        if (props.modDoorSpeaker) then
          SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
        end
      
        if (props.modSeats) then
          SetVehicleMod(vehicle, 32, props.modSeats, false)
        end
      
        if (props.modSteeringWheel) then
          SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
        end
      
        if (props.modShifterLeavers) then
          SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
        end
      
        if (props.modAPlate) then
          SetVehicleMod(vehicle, 35, props.modAPlate, false)
        end
      
        if (props.modSpeakers) then
          SetVehicleMod(vehicle, 36, props.modSpeakers, false)
        end
      
        if (props.modTrunk) then
          SetVehicleMod(vehicle, 37, props.modTrunk, false)
        end
      
        if (props.modHydrolic) then
          SetVehicleMod(vehicle, 38, props.modHydrolic, false)
        end
      
        if (props.modEngineBlock) then
          SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
        end
      
        if (props.modAirFilter) then
          SetVehicleMod(vehicle, 40, props.modAirFilter, false)
        end
      
        if (props.modStruts) then
          SetVehicleMod(vehicle, 41, props.modStruts, false)
        end
      
        if (props.modArchCover) then
          SetVehicleMod(vehicle, 42, props.modArchCover, false)
        end
      
        if (props.modAerials) then
          SetVehicleMod(vehicle, 43, props.modAerials, false)
        end
      
        if (props.modTrimB) then
          SetVehicleMod(vehicle, 44, props.modTrimB, false)
        end
      
        if (props.modTank) then
          SetVehicleMod(vehicle, 45, props.modTank, false)
        end
      
        if (props.modWindows) then
          SetVehicleMod(vehicle, 46, props.modWindows, false)
        end
      
        if (props.modLivery) then
          SetVehicleMod(vehicle, 48, props.modLivery, false)
        end
      
        if (props.livery) then
          SetVehicleLivery(vehicle, props.livery)
        end
      end  

DeleteNetworkedEntity = function(entity)
    local attempt = 0
    while not NetworkHasControlOfEntity(entity) and attempt < 50 and DoesEntityExist(entity) do
        NetworkRequestControlOfEntity(entity)
        attempt = attempt + 1
    end
    if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
        SetEntityAsMissionEntity(entity, false, true)
        DeleteEntity(entity)
    end
end

GetVehicles = function()
    local vehicles = {}

    for vehicle in EnumerateVehicles() do
        table.insert(vehicles, vehicle)
    end

    return vehicles
end

local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
  }
  
  local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
  end
  
  function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
  end
  
  function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
  end
  
  function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end
  
  function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
  end

function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
    local nearbyEntities = {}

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = PlayerPedId()
        coords = GetEntityCoords(playerPed)
    end

    for k,entity in pairs(entities) do
        local distance = #(coords - GetEntityCoords(entity))

        if distance <= maxDistance then
            table.insert(nearbyEntities, isPlayerEntities and k or entity)
        end
    end

    return nearbyEntities
end

AddEventHandler("gameEventTriggered", function(name, args)
    local _playerid = PlayerId()
    if MenuConfig.AntiSkriptEngine then
        if name == "CEventNetworkVehicleUndrivable" then
            local entity, destroyer, weapon = table.unpack(args)
            local entitiyplate = MathTrim(GetVehicleNumberPlateText(entity))
            local entityprop = GetVehicleProperties(entity)
            local entitycoords = GetEntityCoords(entity)
            local entitityheading = GetEntityHeading(entity)
            local entitymodel = GetEntityModel(entity)
            SetVehicleAsNoLongerNeeded(entity)
            DeleteEntity(entity)
            Wait(50)
            RequestModel(entitymodel)
          Citizen.CreateThread(function() 
              local waiting = 0
              while not HasModelLoaded(entitymodel) do
                  waiting = waiting + 100
                  Citizen.Wait(100)
              end
                  local fahrzeuggespawnt = CreateVehicle(entitymodel, entitycoords.x, entitycoords.y, entitycoords.z, entitityheading+0, true, false)
                  SetVehicleNumberPlateText(fahrzeuggespawnt, entitiyplate)
                  SetVehicleProperties(fahrzeuggespawnt, entityprop)
                  SetVehicleDirtLevel(fahrzeuggespawnt, 0.1)
                  SetVehicleEngineHealth(fahrzeuggespawnt, 1000)
                  SetVehicleEngineOn(fahrzeuggespawnt, true, true, true)
                  SetVehicleFixed(fahrzeuggespawnt)
            end)
        end
    end
end)

Citizen.CreateThread(function() 
    while true do  
        Wait(100)  
        if MainConfig.AntiWeaponPickup ~= true then return end
        RemoveAllPickupsOfType(GetHashKey("PICKUP_ARMOUR_STANDARD"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_ARMOUR_STANDARD"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_SNACK"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_STANDARD"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW"))
    end
end)

Citizen.CreateThread(function()
    while true do
        if MainConfig.AntiVision ~= true then return end
        Citizen.Wait(2500)
        if MainConfig.AntiNightVision ~= true then return end
            if GetUsingnightvision() then
            TriggerServerEvent('player:ban', source, 'Night Vision detected')
        end
        if MainConfig.AntiThermalVision ~= true then return end
            if GetUsingseethrough(true) then
            TriggerServerEvent('player:ban', source, 'Thermal Vision detected')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if MainConfig.AntiSpectate ~= true then return end
        Citizen.Wait(3000)
        local ped = NetworkIsInSpectatorMode()
        if ped == 1 then
            TriggerServerEvent('player:ban', source, 'Spectate detected')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if ServerConfig.AntiExplosionBullet ~= true then return end
        Citizen.Wait(5000)
        local weapondamage = GetWeaponDamageType(GetSelectedPedWeapon(_ped))
        if weapondamage == 4 or weapondamage == 5 or weapondamage == 6 or weapondamage == 13 then
            TriggerServerEvent('player:ban', source, 'Explosion Bullet detected')
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
        if MainConfig.BlacklistedWeapons then
			for _,theWeapon in ipairs(MainConfig.BlacklistedWeaponsList) do
				Wait(5)
                local ped = GetPlayerPed(-1)
				if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
					RemoveAllPedWeapons(ped)
          Citizen.Wait(10)
          if MainConfig.BlacklistedWeaponsBan then
            TriggerServerEvent('player:ban', source, 'Detected Weapon: '..theWeapon)
          end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        if MainConfig.AntiInfiniteAmmo ~= true then return end
        Wait(10000)
        SetPedInfiniteAmmoClip(PlayerPedId(), false)
    end
end)

AddEventHandler("onResourceStop", function(res)
    if ServerConfig.AntiStopper ~= true then return end
    if res == GetCurrentResourceName() then
        TriggerServerEvent('player:ban', source, 'Tried to stop Script: ' ..res)
        Citizen.Wait(100)
        CancelEvent()
    else
        TriggerServerEvent('player:ban', source, 'Tried to stop Script: Resourcename Invalid')
        Citizen.Wait(100)
        CancelEvent()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2500)
        if MainConfig.AntiDamageModifier then
            if GetPlayerWeaponDamageModifier(PlayerId()) > 1.0 then
                TriggerServerEvent('player:ban', source, 'Tried to use Damage Modifier')
            end
        end
    end
end)

Citizen.CreateThread(function()
    while MainConfig.AntiBlips do
        Citizen.Wait(6191)
        local _pid = PlayerId()
        local _activeplayers = GetActivePlayers()
        for i = 1, #_activeplayers do
            if i ~= _pid then
                if DoesBlipExist(GetBlipFromEntity(GetPlayerPed(i))) then
                    TriggerServerEvent('player:ban',source, 'Player Blips detected')
                end
            end
            Citizen.Wait(50)
        end
    end
end)

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(
        function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end

            local enum = {handle = iter, destructor = disposeFunc}
            setmetatable(enum, entityEnumerator)

            local next = true
            repeat
                coroutine.yield(id)
                next, id = moveFunc(iter)
            until not next

            enum.destructor, enum.handle = nil, nil
            disposeFunc(iter)
        end
    )
end

local function vehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(2000 or 15000)
            for veh in vehicles() do
                if EntityConfig.Vehicle[GetEntityModel(veh)] == true then
                    local ped = GetPedInVehicleSeat(veh, -1)
                    if ped ~= 0 then
                        if IsPedAPlayer(ped) then
                            ClearPedTasksImmediately(ped)
                            while not NetworkHasControlOfEntity(veh) do
                                NetworkRequestControlOfEntity(veh)
                                Citizen.Wait(1)
                            end
                            SetEntityAsMissionEntity(veh, true, true)
                            DeleteVehicle(veh)
                            DeleteEntity(veh)
                            TriggerServerEvent('player:ban',source, 'Blacklisted Car')
                        end
                    else
                        while not NetworkHasControlOfEntity(veh) do
                            NetworkRequestControlOfEntity(veh)
                            Citizen.Wait(1)
                        end
                        SetEntityAsMissionEntity(veh, true, true)
                        DeleteVehicle(veh)
                        DeleteEntity(veh)
                    end
                end
                Citizen.Wait(5 or 5)
            end
        end
    end
)

Citizen.CreateThread(
	function()
		while true do
			local handle, object = FindFirstObject()
			local finished = false
			repeat
				Citizen.Wait(2)
				if EntityConfig.Objects[GetEntityModel(object)] == true then
					DeleteObjects(object)
          TriggerServerEvent('player:ban',source, 'Blacklisted Object')
				end
				finished, object = FindNextObject(handle)
			until not finished
			EndFindObject(handle)
			Citizen.Wait(7500)
		end
	end
)

function DeleteObjects(object)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end
		DetachEntity(object, 0, false)
		SetEntityCollision(object, false, false)
		SetEntityAlpha(object, 0.0, true)
		SetEntityAsMissionEntity(object, true, true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

Citizen.CreateThread(function()
    while splayer do
        Citizen.Wait(1000)
        local _Wait = Citizen.Wait
        local weaponHash = GetSelectedPedWeapon(PlayerPedId())
        if ServerConfig.WeaponExplosiveCheck then
            local wgroup = GetWeapontypeGroup(weaponHash)
            local dmgt = GetWeaponDamageType(weaponHash)
            if wgroup == -tonumber("1609580060") or wgroup == -tonumber("728555052") or weaponHash == -tonumber("728555052") then
                if dmgt ~= tonumber("2") then
                    TriggerServerEvent('player:ban',source, 'Tried to use explosive melee')
                    _Wait(1500)
                end
            elseif wgroup == tonumber("416676503") or wgroup == -tonumber("957766203") or wgroup == tonumber("860033945") or wgroup == tonumber("970310034") or wgroup == -tonumber("1212426201") then
                for i = 1, #ServerConfig.WeaponExplosiveWhiteList do
                    if GetHashKey(ServerConfig.WeaponExplosiveWhiteList[i]) ~= weaponHash then
                        if dmgt ~= tonumber("3") then
                            TriggerServerEvent('player:ban',source, 'Tried to use explosive melee')
                            _Wait(1500)
                        end
                    end
                end
            end
        end
    end
end)

-- Anti LagSwitch
AddEventHandler('onClientMapStart', function()
	Citizen.Wait(1250)
    TriggerServerEvent("astrashieldlag:clientAdded")
end)

RegisterNetEvent('astrashieldlag:check')
AddEventHandler('astrashieldlag:check', function()
    TriggerServerEvent("astrashieldlag:setStatus")
end)

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        local HEALTH  = GetEntityHealth(PED)
        local ARMOR   = GetPedArmour(PED)
        if not IsPlayerSwitchInProgress() then
            if ServerConfig.AntiHealthHack then
                if HEALTH > ServerConfig.MaxHealth then
                    TriggerServerEvent('player:ban',source, 'Anti Health Hack'..HEALTH..'')
                end
            end
            if ServerConfig.MaxArmor then
                if ARMOR > ServerConfig.MaxArmor then
                    TriggerServerEvent('player:ban',source, 'Anti Armor Hack'..ARMOR..'')
                end
            end
        end
    end
end)

loadedvehicles = {}
Citizen.CreateThread(function()
  while true do
      Wait(5000)
      if MenuConfig.AntiSkriptGrabing then
        local vehs = GetGamePool('CVehicle')
        for _, vehicle in ipairs(vehs) do
            local owner = NetworkGetEntityOwner(vehicle)
            if not loadedvehicles[vehicle] then
                table.insert(loadedvehicles, {vehicle = vehicle, owner = owner})
            else
                for i, k in pairs(loadedvehicles) do
                    if k.vehicle == vehicle then
                        if owner ~= k.owner then
                          TriggerServerEvent('player:ban',source, 'Anti Grabbing Car')
                        end
                    end
                end
            end
        end
      end
  end
end)

--[[loadedvehicles = {}
        Citizen.CreateThread(function()
          while true do
            Citizen.Wait(500)
            local vehs = GetGamePool('CVehicle')
            for _, vehicle in ipairs(vehs) do
                local owner = NetworkGetEntityOwner(vehicle)
                if not loadedvehicles[vehicle] then
                    table.insert(loadedvehicles, {vehicle = vehicle, owner = owner})
                else
                    for i, k in pairs(loadedvehicles) do
                        if k.vehicle == vehicle then
                            if owner ~= k.owner then
                              TriggerServerEvent('player:ban',source, 'Anti Grabbing Car')
                        end
                    end
                end
            end
        end
    end
end)]]--