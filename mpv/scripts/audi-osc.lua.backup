mp.register_event("file-loaded", function()
    local hasvid = mp.get_property_osd("video") ~= "no"
    mp.commandv("script-message", "osc-visibility", (hasvid and "auto" or "always"), "no-osd")
    -- remove the next line if you don't want to affect the osd-bar config
    mp.commandv("set", "options/osd-bar", (hasvid and "yes" or "no"))
end)