local awful = require("awful")
local naughty   = require("naughty")
-- {{{ Autostart applications

local custom_func = {}

function custom_func.run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

function custom_func.showNotification(title, msg)
   naughty.notify({
         text = msg,
         title = title,
         fg = "#0099cc",
         bg = "#000000",
         opacity = 0.7,
         ontop = false,
         timeout = 1
   })
end

function custom_func.runApp(cmd)
   return function () awful.util.spawn(cmd) end
end

-- function custom_func.switchToTheme(strKey)
--    return function () awful.util.spawn("/home/chris/.bin/switchTheme") end
-- end



return custom_func
