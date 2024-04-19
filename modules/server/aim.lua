RegisterServerEvent('DiscordLogs:Server:LogAimEvent')
AddEventHandler('DiscordLogs:Server:LogAimEvent', function(target, weapon)
    local src = source

    -- Check if the event was triggered by the resource itself
    if GetInvokingResource() then
        if GetInvokingResource() ~= GetCurrentResourceName() then
            return
        end
    end    

    -- Check if target and weapon are given
    if not target then return end
    if not weapon then return end

    -- Check if target player exists
    if not DoesPlayerExist(target) then return end

    -- Check if aim was unarmed
    if weapon == GetHashKey("WEAPON_UNARMED") then
        return
    end

    -- Log the aim event
    exports[GetCurrentResourceName()]:CreateLog({
        category = "aim",
        title = "Aim Logs",
        action = "Player Aimed at Player",
        color = "orange",
        players = {
            { id = src, role = "Player"},
            { id = target, role = "Target"},
        },
        info = {
            { name = "Distance", value = string.format("%.2fm", #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(target)))) },
            { name = "Weapon", value = GetWeaponLabel(weapon) },
        },
        takeScreenshot = true,
    })
end)