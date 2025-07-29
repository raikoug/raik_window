-- Localization.lua
-- Centralized strings for easy translation

local addonName, ns = ...
local L = {}
ns.L = L

-- Window title
L.WINDOW_TITLE = "Raik Window"

-- Section names for dropdown menu
L.SECTIONS = {
    Stats    = "Stats",
    Melee    = "Melee",
    Ranged   = "Ranged",
    Spell    = "Spell",
    Defences = "Defences",
    Presets  = "Presets",
    Font     = "Font",
    Colors   = "Colors",
}

return L
