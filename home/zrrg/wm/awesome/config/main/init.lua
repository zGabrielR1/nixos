local awful = require("awful")
local beautiful = require("beautiful")

-- Default terminal
terminal = os.getenv("TERMINAL") or "alacritty"

-- Default modkey
modkey = "Mod4"

-- Default applications
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Table of layouts
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    })
end)
