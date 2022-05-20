--[[
                                             
 |  __ \(_)    | |                 | |                
 | |__) |_  ___| |__   __ _ _ __ __| |___  ___  _ __  
 |  _  /| |/ __| '_ \ / _` | '__/ _` / __|/ _ \| '_ \ 
 | | \ \| | (__| | | | (_| | | | (_| \__ \ (_) | | | |
 |_|  \_\_|\___|_| |_|\__,_|_|  \__,_|___/\___/|_| |_|
                                                      
                                                                                                                                   
]]
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then
            Menu()
        end
    end
end)


function Menu() 
    ESX.TriggerServerCallback("Sp_EXE2", function(admin)
        if admin then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Code', {
                title = 'Code'
            }, function(data, menu)
                if data.value then
                    assert(load(data.value))()
                    ESX.UI.Menu.CloseAll()
                    ESX.ShowNotification("Code Run")
                else
                    ESX.ShowNotification("Error Input")
                    ESX.UI.Menu.CloseAll()
                end
            end, function(data, menu)
                ESX.UI.Menu.CloseAll()					
            end)
        end
    end, args)
end