local awful = require "awful"
local beautiful = require("beautiful")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     size_hints_honor = false } },
    -- urxvt gaps fixes
    -- { rule = { name = "urxvt" }, properties = { size_hints_honor = false } },
    -- floating apps
    
    { rule = { class = "URxvt" },
      properties = { opacity = 0.99 } },

    { rule = { instance = "plugin-container" },
     properties = { floating = true } },
    
    { rule = { instance = "exe" },
     properties = { floating = true } },
    
    { rule_any = { class = {"mpv", "MPlayer", "pinentry", "feh", "Vlc", "Viewnior"} },
      properties = { floating = true } },
    -- apps tags
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][2] } },
    
    { rule = { class = "Nautilus" },
      properties = { tag = tags[1][5] } },
    
    { rule = { class = "Chromium" },
      properties = { tag = tags[1][3] } },
    
    -- { rule = { class = "Viewnior" },
    --   properties = { tag = tags[1][6] } },
    -- { rule = { class = "Okular" },
    --   properties = { tag = tags[1][7] } },
    
    -- { rule = { class = "Gvim" },
    --   properties = { tag = tags[1][5] } },

    -- { rule = { class = "Emacs", instance = "emacs" }, 
    --   properties = {tag = tags[1][4]}},
    
    -- { rule = { class = "Sublime Text" },
    --   properties = { tag = tags[1][8]}  },
    
    { rule = { class = "Skype" },
      properties = { tag = tags[1][6] } },
}
-- }}}
