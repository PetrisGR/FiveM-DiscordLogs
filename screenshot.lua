lib.callback.register('DiscordLogs:Client:CB:GetScreenshot', function(webhook)
    if not webhook then return end -- No webhook provided from server

    local uploaded = false
    local image

    -- Request a screenshot upload
    exports['screenshot-basic']:requestScreenshotUpload(webhook, "files[]", function(data)
        image = json.decode(data).attachments[1].url
        uploaded = true
    end)

    -- Wait for the image to be uploaded
    while not uploaded do
        Wait(500)
    end

    -- Return the image URL
    return image
end)