-- --require("rodentbane")

-- -- Require for expose-like: revelation
-- require("revelation")

-- -- Wibox
-- require("chris_wibox")

-- appKeys = {
--    e = runApp(editor),
--    g = runApp("gimp"),
-- --   m = runApp("run_alpine"),
-- --   s = runApp("monitor_off"),
-- --   d = runApp("stardict"),
-- --   r = runApp("gksudo emacs"),
--    t = runApp("thunar"),
-- --   i = runApp("tim_im"),
-- --   b = runApp("tim_guifilebrowser"),
-- --   n = runApp("nautilus"),
--    f = runApp("firefox -no-remote"),
--    c = runApp("chromium"),
--    o = runApp("libreoffice"),
-- --   a = runApp("gnome-alsamixer"),
--    u = runApp(terminal)
-- }

-- sexec = awful.util.spawn_with_shell

-- -- My wibox
-- wiboxes = wiboxes

-- --
-- -- Wibox stuff
-- --
-- function wibox_toggle_visible(chriswibox)
--    local status = chriswibox[mouse.screen].visible
--    chriswibox[mouse.screen].visible = not status
-- end

-- --
-- -- {{{ Key bindings
-- --
-- -- Check of globalkeys is defined

-- globalkeys = globalkeys or {}

-- globalkeys = awful.util.table.join(
--    globalkeys,
--    --
--    -- Tags navigation
--    --
--    -- Previous tag
--    -- awful.key({ modkey,           }, "Left",
--    -- awful.tag.viewprev       ),
   
--    awful.key({ modkey, "Mod1"   }, "Left",
--              awful.tag.viewprev       ),
--    -- Next tag
--    -- awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
--    awful.key({ modkey, "Mod1"   }, "Right",
--              awful.tag.viewnext       ),
--    -- Quick jump
--    awful.key({ modkey,           }, "Escape",
--              awful.tag.history.restore),

--    -- Next window
--    awful.key({ modkey,           }, "k",
--               function ()
--                  awful.client.focus.byidx( 1)
--                  if client.focus then
--                     client.focus:raise()
--                  end
--               end),
--    -- Previous window
--    awful.key({ modkey,           }, "j",
--              function ()
--                 awful.client.focus.byidx(-1)
--                 if client.focus then client.focus:raise() end
--              end),

--    awful.key({ modkey,           }, "t",
--              function()
--                 awful.prompt.run( { prompt = "Run in terminal: "},
--                 mypromptbox[mouse.screen].widget,
--                 function(...) awful.util.spawn(terminal .. " -e ".. ...) end,
--                 awful.completion.shell,
--                 awful.util.getdir("cache") .. "/history")
--              end),

--    --
--    -- Layout manipulation
--    --
--    awful.key({ modkey, "Control" }, "l",
--              function () awful.screen.focus_relative( 1) end),
--    awful.key({ modkey, "Control" }, "h",
--              function () awful.screen.focus_relative(-1) end),
--    -- Swap previous
--    awful.key({ modkey, "Shift"   }, "k",
--              function () awful.client.swap.byidx(  1)    end),
--    -- Swap next
--    awful.key({ modkey, "Shift"   }, "j",
--              function () awful.client.swap.byidx( -1)    end),
--    -- Jump the 'main'
--    awful.key({ modkey, }, "$",
--              function () awful.tag.viewonly(tags[mouse.screen][1]) end),
--    -- Jump to urgent
--    awful.key({ modkey,           }, "u",
--              awful.client.urgent.jumpto),
--    -- Quick jump
--    awful.key({ "Mod1",           }, "Tab",
--              function ()
--                 awful.client.focus.history.previous()
--                 if client.focus then
--                    client.focus:raise()
--                 end
--              end),
--    -- All clients menu
--    awful.key({ modkey,           }, "Tab",
--              function ()
--                 -- If you want to always position the menu
--                 -- on the same place set coordinates
--                 awful.menu.menu_keys.down = { "Down", "Alt_L" }
--                 local cmenu = awful.menu.clients({ width=350 },
--                                                  { keygrabber=true })
--              end),
--    -- Toggle unminimize all
--    awful.key({ modkey            }, "n",
--              function ()
--                 local all_clients = client.get(mouse.screen)
--                 for _, c in ipairs(all_clients) do
--                    if c.minimized and c:tags()[mouse.screen] == awful.tag.selected(mouse.screen) then
--                       c.minimize = false
--                       client.focus = c
--                       c:raise()
--                       return
--                    end
--                 end
--              end),
--    -- Toggle wibox visible
--    awful.key({ modkey            }, "v",
--              function ()
--                 wibox_toggle_visible(wiboxes['bottom'])
--                 wibox_toggle_visible(wiboxes['top'])
--              end
--           ),

--    --
--    -- Standard commands
--    --
--    -- Restart awesome
--    awful.key({ "Mod1", "Control" }, "r", awesome.restart),
--    -- Quit awesome
--    awful.key({ modkey, "Shift", "Control" }, "q", awesome.quit),
--    -- Master increase
--    awful.key({ modkey,           }, "l", 
--              function () awful.tag.incmwfact( 0.05)    end),
--    -- Master decrease
--    awful.key({ modkey,           }, "h",
--              function () awful.tag.incmwfact(-0.05)    end),
--    -- Master add
--    awful.key({ modkey, "Shift"   }, "h",
--              function () awful.tag.incnmaster( 1)      end),
--    -- Master remove
--    awful.key({ modkey, "Shift"   }, "l",
--              function () awful.tag.incnmaster(-1)      end),
--    -- Slave add
--    awful.key({ modkey, "Control" }, "h",
--              function () awful.tag.incncol( 1)         end),
--    -- Slave remove
--    awful.key({ modkey, "Control" }, "l",
--              function () awful.tag.incncol(-1)         end),
--    -- Next layout
--    awful.key({ modkey,           }, "space",
--              function () awful.layout.inc(layouts,  1) end),
--    -- Previous layout
--    awful.key({ modkey, "Shift"   }, "space",
--              function () awful.layout.inc(layouts, -1) end),
--    -- Do revelation
--    awful.key({ modkey, "Control" }, "e", revelation.revelation),
--    -- Mouse click
--    awful.key({ modkey, "Shift" }, "s",
--              function () awful.util.spawn("xte 'mouseclick 3'") end),

--    --
--    -- System commands
--    --
--    -- Sleep
--    awful.key({ }, "XF86Sleep",
--              function () awful.util.spawn("xlock") end),
--    -- Hibernate
--    awful.key({ modkey, "Mod1", "Control" }, "h",
--              function () awful.util.spawn("xterm -e 'sudo hibernate'") end),
--    -- Suspend
--    awful.key({ modkey, "Mod1", "Control" }, "s",
--              function () awful.util.spawn("xterm -e 'sudo hibernate-ram'") end),
--    -- Lock screen
--    awful.key({ modkey, "Mod1", "Control" }, "l",
--              function () awful.util.spawn("xlock") end),
--    -- Toggle Touchpad
--    awful.key({ }, "#199", -- Xf86touchpadtoggle
--       function () awful.util.spawn("/home/chris/.bin/switchTouchpad") end),
--          --sexec("synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')") end, "Toggle Touchpad"),

--    -- Increase volume
--    awful.key({  }, "XF86AudioRaiseVolume",
--              function ()
--                 chris_amixer_change_vol("Master playback", volume_percent .. "+")
--                 chris_amixer_show_vol()
--              end),
--    -- Decrease volume
--    awful.key({  }, "XF86AudioLowerVolume",
--              function ()
--                 chris_amixer_change_vol("Master playback", volume_percent .. "-")
--                 chris_amixer_show_vol()
--              end),



   

--    -- GNOME system monitor
--    awful.key({ "Mod1", "Control" }, "Pause",
--              function() runApp("gnome-system-monitor")() end),
--    -- Quick terminal
--    awful.key({ modkey }, "\\",
--              function() runApp(terminal)() end),
--    -- -- File manager
--    -- awful.key({ "Mod1", "Control", "Shift" }, "b",
--    --           function () awful.util.spawn("tim_guifilebrowser") end),
--    -- -- Mozilla Firefox
--    -- awful.key({ "Mod1", "Control", "Shift" }, "f",
--    --           function () awful.util.spawn("firefox -no-remote") end),
--    -- -- Chromium-bin
--    -- awful.key({ "Mod1", "Control", "Shift" }, "c",
--    --           function () awful.util.spawn("chromium") end),
--    -- -- OpenOffice.org
--    -- awful.key({ "Mod1", "Control", "Shift" }, "o",
--    --           function () awful.util.spawn("libreoffice") end),
--    -- -- Editor
--    -- awful.key({ "Mod1", "Control", "Shift" }, "e",
--    --           function () awful.util.spawn("tim_edit") end),
--    -- -- GNOME Alsamixer
--    -- awful.key({ "Mod1", "Control", "Shift" }, "a",
--    --           function () awful.util.spawn("gnome-alsamixer") end),
--    -- -- Downloader
--    -- awful.key({ "Mod1", "Control", "Shift" }, "j",
--    --           function () awful.util.spawn("jd.sh") end),

--    --
--    -- Prompt commands
--    --
--    -- Run program
-- --   awful.key({ modkey },            "r",
-- --             function () mypromptbox[mouse.screen]:run() end),
--    awful.key({ modkey}, "r",
--              function() awful.prompt.run({bg_cursor="green",prompt="<span color='green'>Run: </span>"},
--                                         mypromptbox[mouse.screen].widget,
--                                         check_for_terminal,
--                                         clean_for_completion,
--                                         awful.util.getdir("cache") .. "/history") end),
--    -- Eval Run code
--    awful.key({ modkey, "Control" }, "x",
--              function ()
--                 awful.prompt.run({ prompt = "Eval Lua: " },
--                                  mypromptbox[mouse.screen].widget,
--                                  awful.util.eval, nil,
--                                  awful.util.getdir("cache") .. "/history_eval")
--              end)
-- )


-- --
-- -- Client keybindings for each window
-- --
-- -- Centralize a window
-- function chris_centralize(c)
--    local current_geometry = screen[mouse.screen].geometry
--    local new_width = current_geometry.width * width_factor
--    local new_height = current_geometry.height * height_factor
--    local new_x = (current_geometry.width - new_width) / 2
--    local new_y = ((current_geometry.height - taskbar_height / 2) - new_height) / 2
--    return { new_width = new_width,
--             new_height = new_height,
--             new_x = new_x, new_y = new_y }
-- end
-- --
-- -- Half max width
-- function chris_halfmaxwidth(c)
--    local current_geometry = screen[mouse.screen].geometry
--    local new_width = current_geometry.width / 2
--    local new_height = c.height
--    local new_x = c:geometry({}).x
--    local new_y = c:geometry({}).y
--    c.screen = mouse.screen
--    return { new_width = new_width,
--             new_height = new_height,
--             new_x = new_x, new_y = new_y }
-- end
-- --
-- -- Half max height
-- function chris_halfmaxheight(c)
--    local current_geometry = screen[c.screen].geometry
--    local new_width = c.width
--    local new_height = current_geometry.height / 2
--    local new_x = c:geometry({}).x
--    local new_y = c:geometry({}).y
--    return { new_width = new_width,
--             new_height = new_height,
--             new_x = new_x, new_y = new_y }
-- end
-- --
-- -- Left full
-- function chris_leftfull(c)
--    local current_geometry = screen[c.screen].geometry
--    local new_width = current_geometry.width / 2
--    local new_height = current_geometry.height - 2 * taskbar_height
--    local new_x = 0
--    local new_y = taskbar_height + 3
--    return { new_width = new_width,
--             new_height = new_height,
--             new_x = new_x, new_y = new_y }
-- end
-- --
-- -- Right full
-- function chris_rightfull(c)
--    local current_geometry = screen[c.screen].geometry
--    local new_width = current_geometry.width / 2
--    local new_height = current_geometry.height - 2 * taskbar_height
--    local new_x = current_geometry.width / 2
--    local new_y = taskbar_height + 3
--    return { new_width = new_width,
--             new_height = new_height,
--             new_x = new_x, new_y = new_y }
-- end
-- --



-- --
-- -- Compute the maximum number of digit we need, limited to 9
-- --
-- keynumber = 0
-- for s = 1, screen.count() do
--    keynumber = math.min(9, math.max(#tags[s], keynumber));
-- end


local awful     = require("awful")
local lain      = require("lain")
local drop      = require("scratchdrop")
local custom_func = require "modules/custom_func"
local alttab    = require("alttab")

-- {{{ Key bindings
globalkeys = awful.util.table.join(
   -- Take a screenshot
   -- https://github.com/copycat-killer/dots/blob/master/bin/screenshot
   awful.key({ altkey }, "p", function() os.execute("screenshot") end),

   -- Tag browsing
   awful.key({ modkey }, "Left",   awful.tag.viewprev       ),
   awful.key({ modkey }, "Right",  awful.tag.viewnext       ),
   awful.key({ modkey }, "Escape", awful.tag.history.restore),

   -- Non-empty tag browsing
   awful.key({ altkey }, "Left", function () lain.util.tag_view_nonempty(-1) end),
   awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1) end),

   -- Default client focus
   awful.key({ altkey }, "k",
             function ()
                awful.client.focus.byidx( 1)
                if client.focus then client.focus:raise() end
             end),
   awful.key({ altkey }, "j",
             function ()
                awful.client.focus.byidx(-1)
                if client.focus then client.focus:raise() end
             end),

   -- By direction client focus
   awful.key({ modkey }, "j",
             function()
                awful.client.focus.bydirection("down")
                if client.focus then client.focus:raise() end
             end),
   awful.key({ modkey }, "k",
             function()
                awful.client.focus.bydirection("up")
                if client.focus then client.focus:raise() end
             end),
   awful.key({ modkey }, "h",
             function()
                awful.client.focus.bydirection("left")
                if client.focus then client.focus:raise() end
             end),
   awful.key({ modkey }, "l",
             function()
                awful.client.focus.bydirection("right")
                if client.focus then client.focus:raise() end
             end),

   -- Show Menu
   awful.key({ modkey }, "w",
             function ()
                mymainmenu:show({ keygrabber = true })
             end),

   -- Show/Hide Wibox
   awful.key({ modkey }, "b", function ()
                mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
                mybottomwibox[mouse.screen].visible = not mybottomwibox[mouse.screen].visible
                              end),

   -- Layout manipulation
   awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
   awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
   awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
   awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
   awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
   awful.key({ modkey,           }, "Tab",
             function ()
                awful.client.focus.history.previous()
                if client.focus then
                   client.focus:raise()
                end
             end),
   awful.key({ altkey, "Shift"   }, "l",      function () awful.tag.incmwfact( 0.05)     end),
   awful.key({ altkey, "Shift"   }, "h",      function () awful.tag.incmwfact(-0.05)     end),
   awful.key({ modkey, "Shift"   }, "l",      function () awful.tag.incnmaster(-1)       end),
   awful.key({ modkey, "Shift"   }, "h",      function () awful.tag.incnmaster( 1)       end),
   awful.key({ modkey, "Control" }, "l",      function () awful.tag.incncol(-1)          end),
   awful.key({ modkey, "Control" }, "h",      function () awful.tag.incncol( 1)          end),
   awful.key({ modkey,           }, "space",  function () awful.layout.inc(layouts,  1)  end),
   awful.key({ modkey, "Shift"   }, "space",  function () awful.layout.inc(layouts, -1)  end),
   awful.key({ modkey, "Control" }, "n",      awful.client.restore),
   
   -- Using revelation
   awful.key({ modkey            }, "u", function()
                revelation({rule={class="URxvt"}})
                            end),
   awful.key({modkey}, "e", revelation),

   
      -- Run program with gmrun
      awful.key({ "Control" }, "Escape",
                 function () awful.util.spawn("gmrun") end),

   -- Standard program
   awful.key({ modkey,           }, "\\", function () awful.util.spawn(terminal) end),
   awful.key({ modkey }, "Return",
             function (c)
                keygrabber.run(
                   function (mod, key, event)
                      if string.find(key, "Super") then
                         custom_func.showNotification(
                            "Application mode",
                            "Press a key to start an application...")
                      end

                      if event == "release" then
                         return true
                      end

                      if not string.find(key, "Shift") then
                         keygrabber.stop()
                      end

                      if appKeys[key] then
                         appKeys[key]()
                      end
                      return true
                   end
                )
             end),
   awful.key({ altkey, "Control"}, "Return", function () awful.util.spawn("/home/chris/.bin/switchTheme") end),
   
   -- awful.key({ altkey, "Control" }, "Return",
   --           function (c)
   --              keygrabber.run(
   --                 function (mod, key, event)
   --                    if string.find(key, "Alt") then
   --                       custom_func.showNotification(
   --                          "Select themes mode",
   --                          "Press a number to select theme...")
   --                    end

   --                    if event == "release" then
   --                       return true
   --                    end

   --                    if not string.find(key, "Shift") then
   --                       keygrabber.stop()
   --                    end

   --                    if themeKeys[key] then
   --                       themeKeys[key]()
   --                    end
   --                    return true
   --                 end
   --              )
   --           end),

   
   awful.key({ modkey, "Control" }, "r",      awesome.restart),
   awful.key({ modkey, "Shift"   }, "q",      awesome.quit),

   -- Dropdown terminal
   awful.key({ altkey,	          }, "z",      function () drop(terminal) end),

   -- Widgets popups
   awful.key({ altkey,           }, "c",      function () lain.widgets.calendar:show(7) end),
   awful.key({ altkey,           }, "h",      function () fswidget.show(7) end),
   awful.key({ altkey, "Control" }, "w",      function () yawn.show(7) end),

   
   -- Toggle Touchpad
    awful.key({ }, "#199", -- Xf86touchpadtoggle
       function () awful.util.spawn("/home/chris/.bin/switchTouchpad") end),
    
    -- Volume keyboard control
    awful.key({ }, "XF86AudioRaiseVolume",
    function ()
        awful.util.spawn("amixer -D pulse sset Master '2%+'")
        volumewidget.update()
    end),
    
    awful.key({ }, "XF86AudioLowerVolume",
    function ()
        awful.util.spawn("amixer -D pulse sset Master '2%-'")
        volumewidget.update()
    end),
    awful.key({ }, "XF86AudioMute",
    function ()
        awful.util.spawn("amixer set Master playback toggle")
        volumewidget.update()
    end),
    
    awful.key({ altkey }, "m",
             function ()
                awful.util.spawn("amixer -q set Master playback toggle")
                volumewidget.update()
             end),
   
    
    awful.key({ altkey, "Control" }, "m",
             function ()
                awful.util.spawn("amixer -q set Master playback 100%")
                volumewidget.update()
             end),
   
   

   -- MPD control
   awful.key({ altkey, "Control" }, "Up",
             function ()
                awful.util.spawn_with_shell("mpc toggle || ncmpcpp toggle || ncmpc toggle || pms toggle")
                mpdwidget.update()
             end),
   awful.key({ altkey, "Control" }, "Down",
             function ()
                awful.util.spawn_with_shell("mpc stop || ncmpcpp stop || ncmpc stop || pms stop")
                mpdwidget.update()
             end),
   awful.key({ altkey, "Control" }, "Left",
             function ()
                awful.util.spawn_with_shell("mpc prev || ncmpcpp prev || ncmpc prev || pms prev")
                mpdwidget.update()
             end),
   awful.key({ altkey, "Control" }, "Right",
             function ()
                awful.util.spawn_with_shell("mpc next || ncmpcpp next || ncmpc next || pms next")
                mpdwidget.update()
             end),
   awful.key({ altkey,           }, "Tab",
             function ()
                alttab(1, "Alt_L", "Tab", "ISO_Left_Tab")
             end	     
   ),
   
   awful.key({ altkey, "Shift"   }, "Tab",
             function ()
                alttab(-1, "Alt_L", "Tab", "ISO_Left_Tab")
             end
   ),

   -- Copy to clipboard
   awful.key({ modkey }, "c", function () os.execute("xsel -p -o | xsel -i -b") end),

   -- User programs
   awful.key({ modkey }, "q", function () awful.util.spawn(browser) end),
   awful.key({ modkey }, "i", function () awful.util.spawn(browser2) end),
   awful.key({ modkey }, "s", function () awful.util.spawn(gui_editor) end),
   awful.key({ modkey }, "g", function () awful.util.spawn(graphics) end),

   -- Prompt
   awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),
   
       -- Printscreens
    awful.key({ }, "#107",
    function ()
        awful.util.spawn("scrot -d 1 -e 'mv $f /home/chris/Pictures/Screenshots 2>/dev/null'")
    end),
    
    -- Shutdown
    awful.key({ modkey }, "F12" ,
              function () awful.util.spawn("/home/chris/.bin/shutdown") end),
   
   awful.key({ modkey }, "x",
             function ()
                awful.prompt.run({ prompt = "Run Lua code: " },
                                 mypromptbox[mouse.screen].widget,
                                 awful.util.eval, nil,
                                 awful.util.getdir("cache") .. "/history_eval")
             end)
)

clientkeys = awful.util.table.join(
   awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
   awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
   awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
   awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
   awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
   awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
   awful.key({ modkey,           }, "n",
             function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
             end),
   awful.key({ modkey,           }, "m",
             function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c.maximized_vertical   = not c.maximized_vertical
             end)
)

