ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ry_pawnshop:sellitems')
AddEventHandler('ry_pawnshop:sellitems', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  local item_name = xPlayer.getInventoryItem(item)

  if item_name then
  local item_count = item_name.count
  if item_count >= 1 then
    if xPlayer ~= nil then
      local moneyamount = Config.Menu['items'][item].price * item_count 
      xPlayer.removeInventoryItem(item, item_count)
      xPlayer.addAccountMoney('black_money', moneyamount)
      TriggerClientEvent('esx:showNotification', source, 'You have sell x' .. item_count .. ' of ' .. item .. ' for ' ..  moneyamount .. '$')
    end
  else
    TriggerClientEvent('esx:showNotification', source, Config.Messages.donthave)
  end
  else
    TriggerClientEvent('esx:showNotification', source, Config.Messages.donthave)
  end
  
end)