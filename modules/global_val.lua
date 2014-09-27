local awful = require "awful"
local lain      = require "lain"
local custom_func = require "modules/custom_func"
-- common
modkey     = "Mod4"
altkey     = "Mod1"
terminal   = "urxvtc" or "xterm"
editor     = os.getenv("EDITOR") or "nano" or "vi"
editor_cmd = terminal .. " -e " .. editor

-- user defined
browser    = "firefox"
browser2   = "chromium"
gui_editor = "emc"
graphics   = "gimp"


layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.max,
    lain.layout.cascade,
    lain.layout.uselessfair.horizontal,
    lain.layout.uselesstile,
    lain.layout.uselessfair,
    lain.layout.termfair,
    lain.layout.uselesspiral.dwindle
}

-- themeKeys = {
--    b = custom_func.switchToTheme("blackburn"),
--    c = custom_func.switchToTheme("copland"),
--    d = custom_func.switchToTheme("dremora"),
--    h = custom_func.switchToTheme("holo"),
--    m = custom_func.switchToTheme("multicolor"),
--    p = custom_func.switchToTheme("powerarrow-darker"),
--    r = custom_func.switchToTheme("rainbow"),
--    s = custom_func.switchToTheme("stearmburn")
-- }


appKeys = {
   x = custom_func.runApp('xterm'),
   e = custom_func.runApp("emc"),
   g = custom_func.runApp(graphics),
   d = custom_func.runApp("okular"),
--   s = runApp(""),
   t = custom_func.runApp("sublime3"),
--   m = runApp("run_alpine"),
--   s = runApp("monitor_off"),
--   d = runApp("stardict"),
--   r = runApp("gksudo emacs"),
--   t = runApp("thunar"),
--   i = runApp("tim_im"),
   v = custom_func.runApp('gvim'),
   b = custom_func.runApp(chris_filebrowser),
   n = custom_func.runApp("nautilus"),
   f = custom_func.runApp("nighty --no-remote --ProfileManager"),
   F = custom_func.runApp("firefox --no-remote --ProfileManager"),
   c = custom_func.runApp("chromium"),
   o = custom_func.runApp("libreoffice"),
   a = custom_func.runApp("gnome-alsamixer"),
   u = custom_func.runApp(terminal)
}


