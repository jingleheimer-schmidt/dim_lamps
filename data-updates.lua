
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
    local light = lamp.light
    if light then
        if light[1] then
            for _, light_instance in pairs(light) do
                adjust_light_intensity(light_instance)
            end
        else
            adjust_light_intensity(light)
        end
    end
    end
    if lamp.glow_color_intensity then
        lamp.glow_color_intensity = lamp.glow_color_intensity * intensity_multiplier
    end
end
