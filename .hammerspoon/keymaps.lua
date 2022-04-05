local function open_app(appName, appPath)
    return function()
        local app = hs.application.get(appName)
        if app ~= nil and app:isFrontmost() then
            app:hide()
        else
            hs.application.launchOrFocus(appPath)
        end
    end
end

hs.hotkey.bind({ "command" }, ";", open_app("Alacritty", "/Applications/Alacritty.app"))
hs.hotkey.bind({ "command" }, ".", open_app("kitty", "/Applications/Kitty.app"))
-- Ctrl + 1,2,3 is used to switch to different desktops
hs.hotkey.bind({ "control" }, "4", open_app("Safari", "/Applications/Safari.app"))
hs.hotkey.bind({ "control" }, "5", open_app("Dash", "/Applications/Dash.app"))
hs.hotkey.bind({ "control" }, "6", open_app("Slack", "/Applications/Slack.app"))
hs.hotkey.bind({ "control" }, "7", open_app("WhatsApp", "/Applications/WhatsApp.app"))
