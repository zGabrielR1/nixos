-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Initialize theme
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua",
                               os.getenv("HOME"),
                               os.getenv("AWESOME_THEME") or "default")
beautiful.init(theme_path)

-- Load modules
require("main")
require("signal")
require("ui")

-- Error handling
require("main.error_handling")

-- Initialize layouts
require("main.layout")

-- Set up tags/workspaces
require("main.tags")

-- Load key bindings
require("main.bindings")

-- Set window rules
require("main.rules")

-- Set up autostart applications
awful.spawn.with_shell("~/.config/awesome/main/autorun.sh")
