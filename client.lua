

loaded = false 
local benches_entites = {}
QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
  PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = JobInfo
end)


AddEventHandler("onResourceStart", function(JobInfo)
  Load_tables()
  PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)



RegisterNUICallback('CloseMenu:NuiCallback', function(data)
    SetNuiFocus(false, false)
end)



    blipui = function ()
      
      QBCore.Functions.TriggerCallback("src-company:getinfo", function(result)
        local firstname = PlayerData.charinfo.firstname
        local lastname = PlayerData.charinfo.lastname
        local fl = 'Welcome,' ..' '..firstname..' '..lastname
        steamID = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. result.api .. "&steamids=" .. result.sid
        
       

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'showui',
            steam = steamID,
            name = fl,
        })
  
      end)
    end








function DrawText3D(x,y,z, text)
  for i, v in ipairs(Config.Locations) do
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  SetTextScale(0.32, 0.32)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x,_y)
  local factor = (string.len(text)) / 500
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, v.MarkerColor.R, v.MarkerColor.G, v.MarkerColor.B, v.MarkerColor.A)
  end
end


Citizen.CreateThread(function()
-- Tray Part
  local sleep
  while true do
      sleep = 1000
      pcord = GetEntityCoords(PlayerPedId())
    
      local trayLocations = Config.Locations[1].TrayLocations
      for k, v in ipairs(Config.Locations) do
       
      for i = 1, #trayLocations do
        dst = GetDistanceBetweenCoords(pcord, trayLocations[i])
          if dst < 1.5 then
              if  PlayerJob.name == v.job then 
              sleep = 5
              DrawText3D(trayLocations[i].x, trayLocations[i].y, trayLocations[i].z + 0.3, "[E] - Tray"..' - '..i)
              if dst < 1.5 and IsControlJustReleased(1, 51)  then
                
                traypart(v,i)
              end
          end
      end
    end
  end
      Citizen.Wait(sleep)
  end
  
  end)

  Citizen.CreateThread(function()
    -- Tray Part
      local sleep
      while true do
          sleep = 1000
          pcord = GetEntityCoords(PlayerPedId())
        
          local BossLocations = Config.Locations[1].BossLocations
          for k, v in ipairs(Config.Locations) do
           
          for i = 1, #BossLocations do
            dst = GetDistanceBetweenCoords(pcord, BossLocations[i])
              if dst < 1.5 then
                  if  PlayerJob.name == v.job and PlayerJob.isboss then 
                  sleep = 5
                  DrawText3D(BossLocations[i].x, BossLocations[i].y, BossLocations[i].z + 0.3, "[E] - Boss Menu"..' - '..i)
                  if dst < 1.5 and IsControlJustReleased(1, 51)  then
                    TriggerEvent('qb-bossmenu:client:OpenMenu')
                  end
              end
          end
        end
      end
          Citizen.Wait(sleep)
      end
      
      end)
  
  Citizen.CreateThread(function()
    -- Duty Part
      local sleep
      while true do
          sleep = 100
          pcord = GetEntityCoords(PlayerPedId())
        
          local DutyLocations = Config.Locations[1].DutyLocations
          for k, v in ipairs(Config.Locations) do
           
          for i = 1, #DutyLocations do
            dst = GetDistanceBetweenCoords(pcord, DutyLocations[i])
              if dst < 1.5 then
                  if  PlayerJob.name == v.job then 
                  sleep = 5
                  DrawText3D(DutyLocations[i].x, DutyLocations[i].y, DutyLocations[i].z + 0.3, "[E] - Duty"..' - '..i)
                  if dst < 1.5 and IsControlJustReleased(1, 51)  then
                    dutypart()
                  end
              end
          end
        end
      end
          Citizen.Wait(sleep)
      end
      
  end)

  
Citizen.CreateThread(function()
-- prop part
  local sleep
  while true do
      sleep = 1000
      pcord = GetEntityCoords(PlayerPedId())
      for i, v in ipairs(Config.Locations) do
          dst = GetDistanceBetweenCoords(pcord, v.Prop.coords)
          if dst < 1.5 then

              if v.job == 'all' or PlayerJob.name == v.job then 
              sleep = 5
              DrawText3D(v.Prop.coords.x,v.Prop.coords.y,v.Prop.coords.z + 1.5, v.Prop.Text)
              DrawMarker(v.type,v.Prop.coords.x,v.Prop.coords.y, v.Prop.coords.z + 0.1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, v.MarkerSize.X, v.MarkerSize.Y, v.MarkerSize.Z, v.MarkerColor.R, v.MarkerColor.G, v.MarkerColor.B, v.MarkerColor.A, false, true, 2, nil, nil, false)
              if dst < 1 and IsControlJustReleased(1, 51)  then
                getlocation(v)
              end
          end
      end
  
  end
      Citizen.Wait(sleep)
  end
  
  end)
  


  traypart = function (data, i)
    local s = data
    TriggerEvent('inventory:openInventoryAnim')
    TriggerEvent("inventory:client:SetCurrentStash",'Tray'..' '..s.name.. i)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'Tray'..' '..s.name.. i)
    
  end

 dutypart  = function()

 

    local Menu = {
      {
          header = "Duty On",
          txt = '',
          params = {
              event = "dutyonclient",
          }
      },
      {
        header = "Duty Off",
        txt = '',
        params = {
            event = "dutyoffclient",
        }
    },

  }
  
  
  exports['qb-menu']:openMenu(Menu)
  
  end


  local spawn_bench = function(model, coord, rotation)
    model = model or Config.workbench_default_model
    local modelHash = GetHashKey(model)

    if not HasModelLoaded(modelHash) then
         RequestModel(modelHash)
         while not HasModelLoaded(modelHash) do
              Wait(10)
         end
    end
    local entity = CreateObject(modelHash, coord, false)
    SetEntityAsMissionEntity(entity, true, true)
    while not DoesEntityExist(entity) do Wait(10) end
    SetEntityRotation(entity, rotation, 0.0, true)
    FreezeEntityPosition(entity, true)
    SetEntityProofs(entity, 1, 1, 1, 1, 1, 1, 1, 1)
    return entity
end

function Load_tables()
  if loaded then return end
  CreateThread(function()
    
    for k, v in ipairs(Config.Locations) do
            benches_entites[#benches_entites + 1] = spawn_bench(v.Prop.table_model, v.Prop.coords, v.Prop.rotation)
       end
       loaded = true
  end)
end


AddEventHandler('onResourceStop', function(resourceName)
  if resourceName == GetCurrentResourceName() then
       for key, value in pairs(benches_entites) do
            DeleteObject(value)
       end
  end
end)


getlocation  = function (data)
  QBCore.Functions.TriggerCallback("src-company:getinfo", function(result)
    local firstname = PlayerData.charinfo.firstname
    local lastname = PlayerData.charinfo.lastname
    local fl = 'Welcome,' ..' '..firstname..' '..lastname
    local sid = result.sid
    if sid == nil then
      sid = '' 
    end
    steamID = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. result.api .. "&steamids=" .. sid
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'showui',
        steam = steamID,
        name = fl,
        menuname = data.name,
        fee = data.fee,
        jobname = data.job,
        jobstatus = data.jobstatus,
        money = result.amount,

    })

  end)


end


RegisterNUICallback('src:wash:client:cashout', function (data)
local blackmoney = data.money
if blackmoney  ~= nil then
TriggerServerEvent('src-company:server:payment',data)

end

end)

RegisterNetEvent('dutyoffclient', function()
  for k, v in ipairs(Config.Locations) do

  TriggerServerEvent('dutyoffserver', v) 

  
      end
   end)
  

  
  
    RegisterNetEvent('dutyonclient', function()
      for k, v in ipairs(Config.Locations) do

  TriggerServerEvent('dutyserver', v)
      end
  end)
  