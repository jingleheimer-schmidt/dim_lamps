
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
    local light_when_colored = lamp.light_when_colored
    if light_when_colored then
        if light_when_colored[1] then
            for _, light_instance in pairs(light_when_colored) do
                adjust_light_intensity(light_instance)
            end
        else
            adjust_light_intensity(light_when_colored)
        end
    end
    if lamp.glow_color_intensity then
        lamp.glow_color_intensity = lamp.glow_color_intensity * intensity_multiplier
    end
end
