ESX = nil

Citizen.CreateThread(function()
    while not ESX do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(25)
  end
end)

RegisterCommand('kity', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open'
    })
end)

RegisterNUICallback('closeMenu', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('kitStarter', function()
    SetNuiFocus(false, false)
    TriggerServerEvent('fancy_kits:addItems', 'starter')
end)

RegisterNUICallback('kitBooster', function()
    SetNuiFocus(false, false)
    TriggerServerEvent('fancy_kits:addItems', 'booster')
end)

RegisterNUICallback('kitVip', function()
    SetNuiFocus(false, false)
    TriggerServerEvent('fancy_kits:addItems', 'vip')
end)
