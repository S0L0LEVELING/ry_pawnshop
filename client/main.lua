--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- SCRIPT BY REDYY#0449
-- www.fiverr.com/redyypt
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

ESX = nil
PlayerData = nil

Citizen.CreateThread(function()
    Wait(100)
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end
    while ESX.GetPlayerData().job == nil do Wait(0) end
    ESX.PlayerData = ESX.GetPlayerData()
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function ()
	Wait(1000)
	while PlayerData == nil do Wait(10) end
	while true do
		Citizen.Wait(1)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		if GetDistanceBetweenCoords(coords, vector3(Config.Location.x, Config.Location.y, Config.Location.z), true) < 1.5 then
			DrawText3D(Config.Location.x, Config.Location.y, Config.Location.z, '[ ~g~E ~w~] Open Pawn-Shop')
			if IsControlJustReleased(0, 38) then
					OpenShop()
			end
		end
	end
end)

