
local brightness_multiplier = {
    type = "string-setting",
    name = "brightness_multiplier",
    setting_type = "startup",
    default_value = "0.33",
    allowed_values = {
        "1",
        "0.75",
        "0.66",
        "0.5",
        "0.33",
        "0.25",
        "0.11"
    },
    order = "a-1"
}

data:extend({
    brightness_multiplier
})