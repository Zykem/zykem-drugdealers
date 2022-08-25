ESX = nil
TriggerEvent('exilerp:getSharedObject', function(obj) 
    ESX = obj 
end)


ESX.RegisterServerCallback('drugdealers:getstatistic', function(source,cb, drugtype)
    local xPlayer = ESX.GetPlayerFromId(source)
    local hex = getid('steam', xPlayer.source)
    local weedsold = 0
    local cokesold = 0
    local methsold = 0
    local weedlevel = 0
    local cokelevel = 0
    local methlevel = 0
    local combined = {}

    MySQL.Async.fetchAll('SELECT weedsold,methsold,cokesold,weedLevel,cokeLevel,methLevel FROM zykem_drugdealer WHERE hex = @hex', {

        ['@hex'] = hex

    }, function(result)
        
        weedsold = result[1].weedsold
        cokesold = result[1].cokesold
        methsold = result[1].methsold 
        weedlevel = result[1].weedLevel
        cokelevel = result[1].cokeLevel
        methlevel = result[1].methLevel

        if drugtype == 'weed' then

            table.insert(combined, weedsold)
            table.insert(combined, weedlevel)

        elseif drugtype == 'coke' then

            table.insert(combined, weedsold)
            table.insert(combined, weedlevel)

        elseif drugtype == 'meth' then

            table.insert(combined, methsold)
            table.insert(combined, methlevel)

        end
        cb(combined)
    end)
    

end)


RegisterServerEvent('drugdealers:syncdata')
AddEventHandler('drugdealers:syncdata', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    local hex = getid('steam', xPlayer.source)

    MySQL.Async.fetchAll('SELECT weedsold,methsold,cokesold,weedLevel,cokeLevel,methLevel FROM zykem_drugdealer WHERE hex = @hex', {

        ['@hex'] = hex

    }, function(result)
        
        TriggerClientEvent('darkdealers:profile', xPlayer.source, 'weed', result[1].weedsold, result[1].weedLevel)
        TriggerClientEvent('darkdealers:profile', xPlayer.source, 'coke', result[1].cokesold, result[1].cokeLevel)
        TriggerClientEvent('darkdealers:profile', xPlayer.source, 'meth', result[1].methsold, result[1].methLevel)
        print('Synced all DrugDealers data!')
    end)

    MySQL.Async.fetchAll('SELECT hex FROM zykem_drugdealer WHERE hex = @hex', {

        ['@hex'] = hex

    }, function(result)
        
        if result[1] == nil then

            MySQL.Async.execute("INSERT INTO `zykem_drugdealer` (`hex`) VALUES (@hex)",  {
                ['@hex'] = hex
            })

        end
    
    end)

end)

AddEventHandler('esx:playerLoaded', function(source)
    Citizen.Wait(5000)
    local xPlayer = ESX.GetPlayerFromId(source)
    print("Loading " .. GetPlayerName(xPlayer.source) .. ' dealer Data')
    local hex = getid('steam', xPlayer.source)
    local weedsold = 0
    local cokesold = 0
    local methsold = 0
    MySQL.Async.fetchAll('SELECT weedsold,methsold,cokesold,weedLevel,cokeLevel,methLevel FROM zykem_drugdealer WHERE hex = @hex', {

        ['@hex'] = hex

    }, function(result)
        
        TriggerClientEvent('darkdealers:profile', xPlayer.source, 'weed', result[1].weedsold, result[1].weedLevel)
        TriggerClientEvent('darkdealers:profile', xPlayer.source, 'coke', result[1].cokesold, result[1].cokeLevel)
        TriggerClientEvent('darkdealers:profile', xPlayer.source, 'meth', result[1].methsold, result[1].methLevel)
    
    end)
    print('Player ' .. xPlayer.getName() .. ' spawned with identifier ' .. xPlayer.source)

    MySQL.Async.fetchAll('SELECT hex FROM zykem_drugdealer WHERE hex = @hex', {

        ['@hex'] = hex

    }, function(result)
        
        if result[1] == nil then

            MySQL.Async.execute("INSERT INTO `zykem_drugdealer` (`hex`) VALUES (@hex)",  {
                ['@hex'] = hex
            })

        end
    
    end)

end)

function getid(type, id)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
    return false
end

RegisterNetEvent('drugdealers:updatestats')
AddEventHandler('drugdealers:updatestats', function( type, count, newlvl)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local phex = getid('steam', xPlayer.source)
    local weedsold = 0
    local cokesold = 0
    local methsold = 0
    local weedlevel = 0
    local cokelevel = 0
    local methlevel = 0
    MySQL.Async.fetchAll('SELECT weedsold,methsold,cokesold FROM zykem_drugdealer WHERE hex = @hex', {

        ['@hex'] = phex

    }, function(result) 

            weedsold = result[1].weedsold
            cokesold = result[1].cokesold
            methsold = result[1].methsold 

        if type == 'weed_pooch' then

            
    
           if count ~= nil then
            local updatedStat = weedsold + count
                TriggerClientEvent('darkdealers:profile', xPlayer.source, 'weed', updatedStat)
                MySQL.Async.execute("UPDATE `zykem_drugdealer` set weedsold=@weedsold WHERE hex=@hex",  {
                    ['@hex'] = phex,
                    ['@weedsold'] = updatedStat
                })

            end

            if newlvl ~= nil then

                TriggerClientEvent('darkdealers:profile', xPlayer.source, 'weed', weedsold, newlvl)
                MySQL.Async.execute("UPDATE `zykem_drugdealer` set weedLevel=@weedlvl WHERE hex=@hex",  {
                    ['@hex'] = phex,
                    ['@weedlvl'] = newlvl
                })
                print(newlvl)

            end

        elseif type == 'coke_pooch' then


            if count ~= nil then
                local updatedStat = cokesold + count
                TriggerClientEvent('darkdealers:profile', xPlayer.source, 'coke', updatedStat)

                MySQL.Async.execute("UPDATE `zykem_drugdealer` set cokesold=@cokesold WHERE hex=@hex",  {
                    ['@hex'] = phex,
                    ['@cokesold'] = updatedStat
                })

            end
            if newlvl ~= nil then

                TriggerClientEvent('darkdealers:profile', xPlayer.source, 'coke', cokesold, newlvl)

                MySQL.Async.execute("UPDATE `zykem_drugdealer` set cokeLevle=@cokelvl WHERE hex=@hex",  {
                    ['@hex'] = phex,
                    ['@cokelvl'] = newlvl
                })

            end

        elseif type == 'meth_pooch' then


            if count ~= nil then
                local updatedStat = methsold + count
                TriggerClientEvent('darkdealers:profile', xPlayer.source, 'meth', updatedStat)
            
                MySQL.Async.execute("UPDATE `zykem_drugdealer` set methsold=@mehtsold WHERE hex=@hex",  {
                    ['@hex'] = phex,
                    ['@methsold'] = updatedStat
                })

            end
            if newlvl ~= nil then

                TriggerClientEvent('darkdealers:profile', xPlayer.source, 'meth', methsold, newlvl)
                MySQL.Async.execute("UPDATE `zykem_drugdealer` set methLevel=@methlvl WHERE hex=@hex",  {
                    ['@hex'] = phex,
                    ['@methlvl'] = newlvl
                })

            end

        end
    end)

end)