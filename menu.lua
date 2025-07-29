-- menu.lua
-- Dropdown menu for selecting stats, presets, fonts, colors

-- Ordered iteration helper
local function __genOrderedIndex(t)
    local ordered = {}
    for k in pairs(t) do table.insert(ordered, k) end
    table.sort(ordered)
    return ordered
end

local function orderedNext(t, state)
    t.__orderedIndex = t.__orderedIndex or __genOrderedIndex(t)
    local idx
    if state == nil then
        idx = 1
    else
        for i, key in ipairs(t.__orderedIndex) do
            if key == state then idx = i + 1; break end
        end
    end
    local key = t.__orderedIndex[idx]
    if key then
        return key, t[key]
    else
        t.__orderedIndex = nil
    end
end

local function orderedPairs(t)
    return orderedNext, t, nil
end

-- Utility: check if value is selected
local function has_value(tab, val)
    for _, v in ipairs(tab) do if v == val then return true end end
    return false
end

-- Handle clicking a stat/value
local function ValueClicked(value)
    if has_value(CHECKED_VALUES, value) then
        for i = #CHECKED_VALUES, 1, -1 do
            if CHECKED_VALUES[i] == value then table.remove(CHECKED_VALUES, i) end
        end
    else
        table.insert(CHECKED_VALUES, value)
    end
    text_reload()
end

-- Dropdown data: sections with items
local Test1_Data = {
    Stats = { "Strength", "Agility", "Stamina", "Intellect", "Spirit" },
    Melee = { "Damage", "DPS", "Speed", "Power", "Hit Rating", "Crit Chance" },
    Ranged = { "Damage", "DPS", "Speed", "Power", "Hit Rating", "Crit Chance" },
    Spell = { "Bonus Healing", "Hit Rating", "Haste Rating", "Mana Regen", "Holy", "Fire", "Nature", "Frost", "Shadow", "Arcane" },
    Defences = { "Armor", "Dodge", "Parry", "Block", "Defense" },
    Presets = { "Tank", "Clean" },
    Font = {} ,
    Colors = { "Header", "Body" }
}
-- Populate Font section from RaikFonts
for fontName,_ in pairs(RaikFonts) do table.insert(Test1_Data.Font, fontName) end

-- Dropdown initializer
local function Test1_DropDown_Initialize(self, level)
    level = level or 1
    if level == 1 then
        for section, items in orderedPairs(Test1_Data) do
            local info = UIDropDownMenu_CreateInfo()
            info.hasArrow = true
            info.notCheckable = (section ~= 'Stats' and section ~= 'Melee' and section ~= 'Ranged' and section ~= 'Spell' and section ~= 'Defences')
            info.text = section
            info.value = section
            UIDropDownMenu_AddButton(info, level)
        end
    elseif level == 2 then
        local section = UIDROPDOWNMENU_MENU_VALUE
        for _, name in ipairs(Test1_Data[section]) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = name
            info.keepShownOnClick = true
            if section == 'Font' then
                info.func = function() change_font(name) end
                info.fontObject = RaikFonts[name]
            elseif section == 'Colors' then
                if name == 'Header' then
                    info.func = function()
                        ShowColorPicker(HeadR, HeadG, HeadB, nil, change_header_colore)
                    end
                else
                    info.func = function()
                        ShowColorPicker(BodyR, BodyG, BodyB, nil, change_body_colore)
                    end
                end
            elseif section == 'Presets' then
                info.func = function() PresetFunctions[name]() end
            else
                local key = section .. '_' .. name
                info.func = function() ValueClicked(key) end
                info.checked = has_value(CHECKED_VALUES, key)
                info.isNotRadio = true
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end
end

-- Create the dropdown frame
dropdown = CreateFrame("Frame", "RaikWindowDropdown", UIParent, "UIDropDownMenuTemplate")
UIDropDownMenu_Initialize(dropdown, Test1_DropDown_Initialize, "MENU")
