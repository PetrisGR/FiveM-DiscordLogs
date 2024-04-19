local lastPedAimed -- Last entity aimed by the player

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local sleep = true
        local ped = PlayerPedId()
		local _, weapon = GetCurrentPedWeapon(ped)
        
        -- Check if the player is aiming with a weapon
        if DoesEntityExist(ped) then
            if IsPedArmed(ped, 4) then
                sleep = false

                -- Get the entity the player is aiming at
                local isAiming, pedAimed = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if isAiming and pedAimed ~= lastPedAimed then
                    lastPedAimed = pedAimed

                    -- Check if the entity aimed is a player
                    if DoesEntityExist(pedAimed) and IsEntityAPed(pedAimed) and IsPedAPlayer(pedAimed) then
                        local targetId = NetworkGetPlayerIndexFromPed(pedAimed)

                        if targetId then
                            local targetNetId = GetPlayerServerId(targetId)
                            
                            -- Log the aim event
                            if targetNetId and (targetNetId > 0) then
                                TriggerServerEvent('DiscordLogs:Server:LogAimEvent', targetNetId, weapon)
                                Citizen.Wait(500)
                            end
                        end
                    end
                end
            end
        end

        if sleep then Citizen.Wait(1000) end -- Sleep for a second
    end 
end)

-- Reset the last entity aimed every 30 seconds
CreateThread(function()
    while true do
        Citizen.Wait(30000)
        lastPedAimed = nil
    end
end)