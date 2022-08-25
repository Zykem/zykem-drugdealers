-- local variable for displaying the UI
local displayui = false

-- ESX Initialization

ESX = nil
local PlayerData		= {}

CreateThread(function()
	while ESX == nil do
		TriggerEvent(cfg.esxObject, function(obj) 
			ESX = obj 
		end)
		
		Citizen.Wait(250)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent(cfg.pLoaded)
AddEventHandler(cfg.pLoaded, function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent(cfg.pJobUpdate)
AddEventHandler(cfg.pJobUpdate, function(job)
	PlayerData.job = job
end)

-- syncing data
CreateThread(function()

    while true do
        
        TriggerServerEvent('drugdealers:syncdata')
        Citizen.Wait(60 * 1000 * 10)

    end

end)

-- Comand for the Dealer Menu
RegisterCommand(cfg.commandName, function()

    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanik' or PlayerData.job.name == 'mecano' then

        notify("Tej komendy nie mozesz uzyc jako Policjant!")

    else 

        SetDisplay(not displayui)

    end

end)

RegisterNetEvent('darkdealers:profile')
AddEventHandler('darkdealers:profile', function(type, value, lvl)

    if type == 'weed' then 

        SendNUIMessage({

            typeevent = "SELF_UPDATE";
            display = true;
            drug = "weed";
            amount = value;
            level = lvl;
            

        })

    end
    if type == 'coke' then

        SendNUIMessage({

            typeevent = "SELF_UPDATE";
            display = true;
            drug = "coke";
            amount = value;
            level = lvl;
    
        })

    end
    if type == 'meth' then

        SendNUIMessage({

            typeevent = "SELF_UPDATE";
            display = true;
            drug = "meth";
            amount = value;
            level = lvl;
    
        })

    end

end)

-- Exit callback to call it 
RegisterNUICallback("exit", function(data)

    print('Exitted UI')
    SetDisplay(not displayui)

end)

-- Callback for Client LvlUP Handler
RegisterNUICallback("lvlup", function(data)

    local type = data.type
    if type == 'meth' then

        ESX.TriggerServerCallback('drugdealers:getstatistic', function(stats)
            local sold = tonumber(stats[1])
            local methlvl = tonumber(stats[2])
            
            if sold < cfg.methLvl1 then

                notify(cfg.notEnough)

            elseif sold >= cfg.methLvl1 and methlvl == 0 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'meth',
                    lvl = 1
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            if sold < cfg.methLvl2 then

                notify(cfg.notEnough)
            elseif sold >= cfg.methLvl2 and methlvl == 1 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'meth',
                    lvl = 2
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            if sold < cfg.methLvl3 then

                notify(cfg.notEnough)
            elseif sold >= cfg.methLvl3 and methlvl == 2 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'meth',
                    lvl = 3
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            if sold < cfg.methLvl4 then

                notify(cfg.notEnough)
            elseif sold >= cfg.methLvl4 and methlvl == 3 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'meth',
                    lvl = 4
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            if sold < cfg.methLvl5 then

                notify(cfg.notEnough)
            elseif sold >= cfg.methLvl5 and methlvl == 4 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'meth',
                    lvl = 5
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            
        end, 'meth')


    elseif type == 'coke' then

        ESX.TriggerServerCallback('drugdealers:getstatistic', function(stats)
            local sold = tonumber(stats[1])
            local cokelvl = tonumber(stats[2])
            
            if sold < cfg.cokeLvl1 then

                notify(cfg.notEnough)

            elseif sold >= cfg.cokeLvl1 and cokelvl == 0 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'coke',
                    lvl = 1
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            if sold < cfg.cokeLvl2 then

                notify(cfg.notEnough)
            elseif sold >= cfg.cokeLvl2 and cokelvl == 1 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'coke',
                    lvl = 2
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            if sold < cfg.cokeLvl3 then

                notify(cfg.notEnough)
            elseif sold >= cfg.cokeLvl3 and cokelvl == 2 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'coke',
                    lvl = 3
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            if sold < cfg.cokeLvl4 then

                notify(cfg.notEnough)
            elseif sold >= cfg.cokeLvl4 and cokelvl == 3 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'coke',
                    lvl = 4
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            if sold < cfg.cokeLvl5 then

                notify(cfg.notEnough)
            elseif sold >= cfg.cokeLvl5 and cokelvl == 4 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'coke',
                    lvl = 5
            
                })
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            
        end, 'coke')

    
    elseif type == 'weed' then

        ESX.TriggerServerCallback('drugdealers:getstatistic', function(stats)
            local sold = tonumber(stats[1])
            local weedlvl = tonumber(stats[2])
            
            if sold < cfg.weedLvl1 then

                notify(cfg.notEnough)

            elseif sold >= cfg.weedLvl1 and weedlvl == 0 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'weed',
                    lvl = 1
            
                })
                TriggerServerEvent('drugdealers:updatestats', 'weed_pooch', nil, weedlvl + 1)
                print('client 341')
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            elseif sold < cfg.weedLvl2 then

                notify(cfg.notEnough)
            elseif sold >= cfg.weedLvl2 and weedlvl == 1 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'weed',
                    lvl = 2
            
                })
                TriggerServerEvent('drugdealers:updatestats', 'weed_pooch', nil, weedlvl + 1)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            elseif sold < cfg.weedLvl3 then

                notify(cfg.notEnough)
            elseif sold >= cfg.weedLvl3 and weedlvl == 2 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'weed',
                    lvl = 3
            
                })
                TriggerServerEvent('drugdealers:updatestats', 'weed_pooch', nil, weedlvl + 1)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            
        elseif sold < cfg.weedLvl4 then

                notify(cfg.notEnough)
            elseif sold >= cfg.weedLvl4 and weedlvl == 3 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'weed',
                    lvl = 4
            
                })
                TriggerServerEvent('drugdealers:updatestats', 'weed_pooch', nil, weedlvl + 1)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            elseif sold < cfg.weedLvl5 then

                notify(cfg.notEnough)
            elseif sold >= cfg.weedLvl5 and weedlvl == 4 then

                notify(cfg.LevelUp)
                SendNUIMessage({

                    type="LVLUP",
                    status = bool,
                    drug = 'weed',
                    lvl = 5
            
                })
                TriggerServerEvent('drugdealers:updatestats', 'weed_pooch', nil, weedlvl + 1)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", (1 * cfg.ShakeMultiplier))

            end
            
        end, 'weed')

    end

end)

-- Notification function for the whole Script
function notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end

-- Function that sends a nui message to enable the UI
function SetDisplay(bool)

    displayui = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({

        type="ui",
        status = bool

    })

end
