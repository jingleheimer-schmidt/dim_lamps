
require ("util")

local intensity_multiplier = tonumber(settings.startup["brightness_multiplier"].value)

for _, lamp in pairs(data.raw.lamp) do
    if lamp.light then
        lamp.light.intensity = lamp.light.intensity * intensity_multiplier
    end
    if lamp.glow_color_intensity then
        lamp.glow_color_intensity = lamp.glow_color_intensity * intensity_multiplier
    end
end