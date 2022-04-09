local function reload_config(files)
  local doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == '.lua' then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

-- reload config every time it changes
local config_watcher = hs.pathwatcher.new('~/.hammerspoon/', reload_config)
config_watcher:start()

-- load SpoonInstall
hs.loadSpoon('SpoonInstall')

-- import modules
require('keymaps')
require('vim-mode')
