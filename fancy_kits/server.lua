ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local BotToken = 'token_discord'
local DiscordServerID = 1090983459947819030

local VipRole = 1099075168212623431
local BoosterRole = 1099075178182488146

local FormattedToken = "Bot " .. BotToken

RegisterServerEvent('fancy_kits:addItems', function(kit)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM fancy_kits WHERE identifier = @identifier', { ['@identifier'] = xPlayer.getIdentifier() }, function(result)
        if json.encode(result) == "[]" then
            MySQL.Async.insert('INSERT fancy_kits (identifier, starter, vip, booster) VALUES (@identifier, @starter, @vip, @booster)',
                { ['identifier'] = xPlayer.getIdentifier(), ['starter'] = nil, ['vip'] = nil, ['booster'] = nil},
                function(insertId)
                end
            )
        else

        end
    end)

    if kit == 'booster' then
        if HasRole(source, BoosterRole) == true then
            SaveCooldownTime(xPlayer, 'booster')
        else
            xPlayer.showNotification('Nie posiadasz odpowiedniej roli')
        end
    end

    if kit == 'vip' then
    if HasRole(source, VipRole) == true then
        SaveCooldownTime(xPlayer, 'vip')
    else
        xPlayer.showNotification('Nie posiadasz odpowiedniej roli')
    end
    end

    if kit == 'starter' then
        SaveCooldownTime(xPlayer, 'starter')
    end
end)


DiscordRequest = function(requestMethod, requestEndPoint, JSON)
    local data = nil

    PerformHttpRequest("https://discordapp.com/api/" .. requestEndPoint, function(errorCode, resData, resHeaders)
        data = {
            ["data"] = resData,
            ["code"] = errorCode,
            ["headers"] = resHeaders
        }
    end, requestMethod, #JSON > 0 and json.encode(JSON) or "", {["Content-Type"] = "application/json", ["Authorization"] = FormattedToken})
    
    while (data == nil) do
        Wait(0)
    end

    return data
end

GetUserRoles = function(source)
    local discordId = nil

    for _, _data in pairs(GetPlayerIdentifiers(source)) do 
        if (string.find(_data, "discord")) then 
            discordId = string.gsub(_data, "discord:", "")
            break
        end    
    end
    if (discordId) then 
        local endpoint = ("guilds/%s/members/%s"):format(DiscordServerID, discordId)
        local requestRes = DiscordRequest("GET", endpoint, {})
        if (requestRes["code"] == 200) then 
            local reqData = json.decode(requestRes["data"])
            local discordRoles = reqData["roles"]
            return discordRoles
        else
            return false
        end
    else
        return false
    end
end

HasRole = function(source, roleName)
    for _, _data in pairs(GetUserRoles(source)) do
        if tonumber(_data) == roleName then
            return true
        end
    end
end


function SaveCooldownTime(player, type)
    local currentTime = os.time()
    local xPlayer = player

    if type == 'starter' then

        MySQL.Async.fetchAll('SELECT * FROM fancy_kits WHERE identifier = @identifier', { ['@identifier'] = xPlayer.getIdentifier() }, function(result)
            if result[1].starter ~= nil then
                

            if currentTime <= tonumber(result[1].starter) then
                    MySQL.Async.execute('UPDATE fancy_kits SET starter = @starter WHERE identifier = @identifier ', {
                        ['@identifier'] = xPlayer.getIdentifier(),
                        ['@starter'] = currentTime,
                    })
                    for _, item in pairs(Config.StartItems) do
                        xPlayer.addInventoryItem(item.item, item.count)
                    end
                else
                    xPlayer.showNotification('Już odebrałeś swój kit, resetuje się to co 24h')
                end
            else
                for _, item in pairs(Config.StartItems) do
                    xPlayer.addInventoryItem(item.item, item.count)
                end
                MySQL.Async.execute('UPDATE fancy_kits SET starter = @starter WHERE identifier = @identifier ', {
                    ['@identifier'] = xPlayer.getIdentifier(),
                    ['@starter'] = currentTime,
                })
            end

        end)
    end


    if type == 'booster' then

        MySQL.Async.fetchAll('SELECT * FROM fancy_kits WHERE identifier = @identifier', { ['@identifier'] = xPlayer.getIdentifier() }, function(result)
            if result[1].booster ~= nil then
                

            if currentTime <= tonumber(result[1].booster) then
                    MySQL.Async.execute('UPDATE fancy_kits SET booster = @booster WHERE identifier = @identifier ', {
                        ['@identifier'] = xPlayer.getIdentifier(),
                        ['@booster'] = currentTime,
                    })
                    for _, item in pairs(Config.BoosterItems) do
                        xPlayer.addInventoryItem(item.item, item.count)
                    end
                else
                    xPlayer.showNotification('Już odebrałeś swój kit, resetuje się to co 24h')
                end
            else
                for _, item in pairs(Config.BoosterItems) do
                    xPlayer.addInventoryItem(item.item, item.count)
                end
                MySQL.Async.execute('UPDATE fancy_kits SET booster = @booster WHERE identifier = @identifier ', {
                    ['@identifier'] = xPlayer.getIdentifier(),
                    ['@booster'] = currentTime,
                })
            end

        end)
    end

    if type == 'vip' then
        
        MySQL.Async.fetchAll('SELECT * FROM fancy_kits WHERE identifier = @identifier', { ['@identifier'] = xPlayer.getIdentifier() }, function(result)
            if result[1].vip ~= nil then
                

            if currentTime <= tonumber(result[1].vip) then
                    MySQL.Async.execute('UPDATE fancy_kits SET vip = @vip WHERE identifier = @identifier ', {
                        ['@identifier'] = xPlayer.getIdentifier(),
                        ['@vip'] = currentTime,
                    })
                    for _, item in pairs(Config.VipItems) do
                        xPlayer.addInventoryItem(item.item, item.count)
                    end
                else
                    xPlayer.showNotification('Już odebrałeś swój kit, resetuje się to co 24h')
                end
            else
                for _, item in pairs(Config.VipItems) do
                    xPlayer.addInventoryItem(item.item, item.count)
                end
                MySQL.Async.execute('UPDATE fancy_kits SET vip = @vip WHERE identifier = @identifier ', {
                    ['@identifier'] = xPlayer.getIdentifier(),
                    ['@vip'] = currentTime,
                })
            end

        end)
    end
end
