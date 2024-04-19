-- Player Ban
AddEventHandler('txAdmin:events:playerBanned', function(data)
	if data.targetNetId then
        exports[GetCurrentResourceName()]:CreateLog({
            category = "ban",
            title = "txAdmin Logs",
            action = "Player Banned",
            color = "red",
            info = {
                { name = "Action ID", value = data.actionId },
                { name = "Administrator Name", value = data.author },
                { name = "Target Name & ID", value = data.targetName .. " [" .. data.targetNetId .. "]" },
                { name = "Reason", value = data.reason },
                { name = "Duration", value = data.durationInput },
            },
        })
    else
        exports["petris-discordlogs"]:CreateLog({
            category = "ban",
            title = "txAdmin Logs",
            action = "Identifiers Banned",
            color = "red",
            info = {
                { name = "Action ID", value = data.actionId },
                { name = "Administrator Name", value = data.author },
                { name = "Reason", value = data.reason },
                { name = "Duration", value = data.durationInput },
                { name = "Identifiers", value = data.targetIds },
            },
        })
	end
end)

-- Player Kick
AddEventHandler('txAdmin:events:playerKicked', function(data)
    exports[GetCurrentResourceName()]:CreateLog({
        category = "kick",
        title = "txAdmin Logs",
        action = "Player Kicked",
        color = "orange",
        players = {
            { id = data.target, role = "Target" },
        },
        info = {
            { name = "Administrator Name", value = data.author },
            { name = "Reason", value = data.reason },
        },
    })
end)

-- Player Warn
AddEventHandler('txAdmin:events:playerWarned', function(data)
    exports[GetCurrentResourceName()]:CreateLog({
        category = "warn",
        title = "txAdmin Logs",
        action = "Player Warned",
        color = "yellow",
        players = {
            { id = data.target, role = "Target" },
        },
        info = {
            { name = "Action ID", value = data.actionId },
            { name = "Administrator Name", value = data.author },
            { name = "Reason", value = data.reason },
        },
        takeScreenshot = true,
    })
end)

-- Server Announcement
AddEventHandler('txAdmin:events:announcement', function(data)
    exports[GetCurrentResourceName()]:CreateLog({
        category = "txadmin",
        title = "txAdmin Logs",
        action = "Announcement",
        color = "blue",
        info = {
            { name = "Administrator Name", value = data.author },
            { name = "Message", value = data.message },
        },
    })
end)

-- Server Shutdown
AddEventHandler('txAdmin:events:serverShuttingDown', function(data)
    exports[GetCurrentResourceName()]:CreateLog({
        category = "txadmin",
        title = "txAdmin Logs",
        action = "Server Shut Down",
        color = "red",
        info = {
            { name = "Reason", value = data.author == "txAdmin" and "Automatically" or "Manually" },
            { name = "Message", value = data.message },
            { name = "Delay", value = data.delay .. "ms" },
        },
    })
end)