-- Player Join
AddEventHandler('playerJoining', function(oldId)
    local src = source
    exports[GetCurrentResourceName()]:CreateLog({
        category = "join/leave",
        title = "Join/Leave Logs",
        action = "Player Joining",
        color = "green",
        players = {
            { id = src, role = "Player" },
        },
    })
end)

-- Player Left
AddEventHandler('playerDropped', function(reason)
	local src = source
	exports[GetCurrentResourceName()]:CreateLog({
        category = "join/leave",
        title = "Join/Leave Logs",
        action = "Player Left",
        color = "red",
        players = {
            { id = src, role = "Player" },
        },
        info = {
            { name = "Reason", value = reason },
        },
    })
end)

-- Resource Started
AddEventHandler('onResourceStart', function(resourceName)
    exports[GetCurrentResourceName()]:CreateLog({
        category = "resources",
        title = "Resource Logs",
        action = "Resource Started",
        color = "green",
        info = {
            { name = "Resource Name", value = resourceName },
        },
    })
end)

-- Resource Stopped
AddEventHandler('onResourceStop', function(resourceName)
    exports[GetCurrentResourceName()]:CreateLog({
        category = "resources",
        title = "Resource Logs",
        action = "Resource Stopped",
        color = "red",
        info = {
            { name = "Resource Name", value = resourceName },
        },
    })
end)
  
