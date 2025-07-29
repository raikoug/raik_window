-- presets.lua
-- Defines preset selections for CHECKED_VALUES

PresetFunctions = {}

-- Tank preset: defensive and melee DPS stats
PresetFunctions.Tank = function()
    CHECKED_VALUES = {
        "Defences_Dodge",
        "Defences_Block",
        "Defences_Parry",
        "Defences_Defense",
        "Defences_Armor",
        "Stats_Strenght",
        "Melee_DPS",
    }
    if DLAPI then
        DLAPI.DebugLog(addonName, "Applied Tank preset: " .. table.concat(CHECKED_VALUES, ", "))
    end
    text_reload()
end

-- Clean preset: clears all selections
PresetFunctions.Clean = function()
    CHECKED_VALUES = {}
    if DLAPI then
        DLAPI.DebugLog(addonName, "Applied Clean preset: cleared all values")
    end
    text_reload()
end
