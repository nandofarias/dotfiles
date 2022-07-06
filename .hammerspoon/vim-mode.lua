local VimMode = hs.loadSpoon('VimMode')
local vim = VimMode:new()

vim
    :disableForApp('Code')
    :disableForApp('iTerm2')
    :disableForApp('Terminal')
    :disableForApp('kitty')
    :disableForApp('Alacritty')
    :disableForApp('VimR')

vim:shouldDimScreenInNormalMode(false)

vim:shouldShowAlertInNormalMode(true)

vim:setAlertFont("MonoLisa")

vim:enterWithSequence('jk')
-- vim:bindHotKeys({ enter = {{'ctrl'}, ';'} })
