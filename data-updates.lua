
require("util")

local intensity_multiplier = tonumber(settings.startup["brightness_multiplier"].value)

---@param light data.LightDefinition.struct
local function adjust_light_intensity(light)
    light.intensity = light.intensity * intensity_multiplier
end

---@param light data.LightDefinition.struct
local function adjust_light_flicker(light)
    light.flicker_interval = 75
    light.flicker_min_modifier = .9
    light.flicker_max_modifier = 1
    light.offset_flicker = true
end

---@param light data.LightDefinition
local function process_lights(light)
    if light then
        if light[1] then
            for _, light_instance in pairs(light) do
                adjust_light_intensity(light_instance)
                adjust_light_flicker(light_instance)
            end
        else
            adjust_light_intensity(light)
            adjust_light_flicker(light)
        end
    end
end

for _, lamp in pairs(data.raw.lamp) do
    process_lights(lamp.light)
    process_lights(lamp.light_when_colored)
    if lamp.glow_color_intensity then
        lamp.glow_color_intensity = lamp.glow_color_intensity * intensity_multiplier
    end
end
