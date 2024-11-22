
require("util")

local intensity_multiplier = tonumber(settings.startup["brightness_multiplier"].value)

---@param light data.LightDefinition.struct
local function adjust_light_intensity(light)
    light.intensity = light.intensity * intensity_multiplier
    -- light.flicker_interval = 15
    -- light.flicker_min_modifier = .9
    -- light.flicker_max_modifier = 1
    light.offset_flicker = true
end

for _, lamp in pairs(data.raw.lamp) do
    if lamp.light then
        lamp.light.intensity = lamp.light.intensity * intensity_multiplier
    end
    if lamp.glow_color_intensity then
        lamp.glow_color_intensity = lamp.glow_color_intensity * intensity_multiplier
    end
end
