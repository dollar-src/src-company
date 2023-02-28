 QBCore = exports["qb-core"]:GetCoreObject()




 RegisterNetEvent('dutyserver', function(data)
  dutyjob = nil
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)
   if Player.PlayerData.job.name == data.job then
       dutyjob = data.job

   end
   if not  Player.PlayerData.job.onduty then
    TriggerClientEvent('QBCore:Notify', src, 'You are Now On Duty', dutyjob)

       Player.Functions.SetJobDuty(true)
       TriggerClientEvent('QBCore:Client:SetDuty', src, Player.PlayerData.job.onduty)

end

end)


RegisterNetEvent('dutyoffserver', function(data)
   dutyjob = nil
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)
   if Player.PlayerData.job.name == data.job then
    dutyjob = data.job


   if Player.PlayerData.job.onduty then
    TriggerClientEvent('QBCore:Notify', src, 'You are Now Off Duty', dutyjob)
  Player.Functions.SetJobDuty(false)
  TriggerClientEvent('QBCore:Client:SetDuty', src, Player.PlayerData.job.onduty)

  end
end
end) 

 QBCore.Functions.CreateCallback('src-company:getinfo', function(source ,cb)
  itemcount = 0
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  
  local playerItem = Player.Functions.GetItemByName(Config.Item)
  
  if  playerItem ~=  nil and Player ~= nil then
      itemcount = playerItem.amount
  else
   
  end
  identifiers = GetPlayerIdentifiers(source)[1]
  local steamid = tonumber(identifiers:gsub("steam:",""), 16)
table_data = {
  api = Config.SteamApi, -- if u want to secure ur steam api  make sure make this right here "api" https://steamcommunity.com/dev
  sid = steamid,
  amount = itemcount,
}
cb(table_data)
itemcount = 0
end)
 

RegisterServerEvent('src-company:server:payment', function (data)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local money = data.money
  local total = data.money + data.fmoney
  local jobstatus = data.jobst
  local job  = data.jobn
  if jobstatus then
      Player.Functions.RemoveItem(Config.Item, tonumber(total))
      TriggerClientEvent('QBCore:Notify', src, 'Money Washed (Management Society)'.." $"..money, 'success')
      exports['qb-management']:AddMoney(job, money)
  else
      Player.Functions.AddMoney('cash', money)
      Player.Functions.RemoveItem(Config.Item, tonumber(total))
      TriggerClientEvent('QBCore:Notify', src, 'Money Washed'.." $"..money, 'success')

  end


 end)