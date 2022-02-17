H = {}
function H.openApp(appName, appPath)
    return function()
        local app = hs.application.get(appName)
        if app ~= nil and app:isFrontmost() then
            app:hide()
        else
            hs.application.launchOrFocus(appPath)
        end
    end
end

hs.hotkey.bind({ "command" }, ";", H.openApp("Alacritty", "/Applications/Alacritty.app"))
hs.hotkey.bind({ "command" }, ".", H.openApp("kitty", "/Applications/Kitty.app"))
-- Ctrl + 1,2,3 is used to switch to different desktops
hs.hotkey.bind({ "control" }, "4", H.openApp("Safari", "/Applications/Safari.app"))
hs.hotkey.bind({ "control" }, "5", H.openApp("Dash", "/Applications/Dash.app"))
hs.hotkey.bind({ "control" }, "6", H.openApp("Slack", "/Applications/Slack.app"))
hs.hotkey.bind({ "control" }, "7", H.openApp("WhatsApp", "/Applications/WhatsApp.app"))
