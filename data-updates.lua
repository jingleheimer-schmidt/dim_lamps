
require ("util")

local intensity_multiplier = tonumber(settings.startup["brightness_multiplier"].value)

for _, lamp in pairs(data.raw.lamp) do
    lamp.light.intensity = lamp.light.intensity * intensity_multiplier
    lamp.glow_color_intensity = lamp.glow_color_intensity * intensity_multiplier
end