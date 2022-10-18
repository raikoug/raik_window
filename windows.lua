local RaikFrameStat = CreateFrame("SimpleHTML", "DragFrame2", UIParent, "BasicFrameTemplate")
RaikFrameStat:SetMovable(true)
RaikFrameStat:EnableMouse(true)
RaikFrameStat:SetResizable(true)
RaikFrameStat:SetMinResize(50, 50)

RaikFrameStat:RegisterForDrag("LeftButton")
RaikFrameStat:SetScript("OnDragStart", RaikFrameStat.StartMoving)
RaikFrameStat:SetScript("OnDragStop", RaikFrameStat.StopMovingOrSizing)

RaikFrameStat:SetPoint("CENTER");

RaikFrameStat:SetWidth(150);
RaikFrameStat:SetHeight(150);

text = RaikFrameStat:CreateFontString("TheContent","OVERLAY","GameFontNormal");--    Our text area
text:SetPoint("TOP", 0,-10);

RaikFrameStat.TitleText:SetText("Raik Window")

addonName = "RaikWindow"


if CHECKED_VALUES == nil then
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init CHECKED_VALUES")
    --end
    CHECKED_VALUES = {}
end
if FONTSIZE == nil then
    FONTSIZE = 11
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init FONTSIZE")
    --end
end

if FONTTYPE == nil then
    FONTTYPE = 'Fonts\\FRIZQT__.TTF'
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init FONTTYPE")
    --end
end

if HeadColor == nil then
    HeadColor = "ffee4400"
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init HeadColor")
    --end
end

if BodyColor == nil then
    BodyColor = "FF0000FF"
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init BodyColor")
    --end
end

if HeadR == nil then
    HeadR = 1
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init HeadR")
    --end
end

if HeadG == nil then
    HeadG = 0.3
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init HeadG")
    --end
end

if HeadB == nil then
    HeadB = 0.0
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init HeadB")
    --end
end

if BodyR == nil then
    BodyR = 0
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init BodyR")
    --end
end

if BodyG == nil then
    BodyG = 0
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init BodyG")
    --end
end

if BodyB == nil then
    BodyB = 1
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "Init BodyB")
    --end
end

function RGBtoHexa(r, g, b)
    R = string.format("%x", r * 255)
    if #R == 1 then
        R = '0' .. R
    end
    G = string.format("%x", g * 255)
    if #G == 1 then
        G = '0' .. G
    end
    B = string.format("%x", b * 255)
    if #B == 1 then
        B = '0' .. B
    end

    res = 'FF' .. R .. G .. B
    return res
end


function cambiaColoreHeadRGB(HeadRF, HeadGF, HeadBF)

    HeadR = HeadRF
    HeadG = HeadGF
    HeadB = HeadBF
    hexstr = RGBtoHexa(HeadRF, HeadGF, HeadBF)
    HeadColor = hexstr
    text_relaod()

end

function cambiaColoreBodyRGB(BodyRF, BodyGF, BodyBF)

    BodyR = BodyRF
    BodyG = BodyGF
    BodyB = BodyBF

    hexstr = RGBtoHexa(BodyRF, BodyGF, BodyBF)
    BodyColor = hexstr
    text_relaod()
end

critChance = tostring(GetCritChance())
critChance = string.sub(critChance, 1, 5)
AP, posBuff, negBuff = UnitAttackPower("player");
AP = tostring(AP)

local RaikFrameStatResizeButton = CreateFrame("Button", nil, RaikFrameStat)
RaikFrameStatResizeButton:SetPoint("BOTTOMRIGHT", -6, 7)
RaikFrameStatResizeButton:SetSize(16, 16)
RaikFrameStatResizeButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
RaikFrameStatResizeButton:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
RaikFrameStatResizeButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")

RaikFrameStatResizeButton:SetScript("OnMouseDown", function()
    RaikFrameStat:StartSizing("BOTTOMRIGHT")
end)
RaikFrameStatResizeButton:SetScript("OnMouseUp", function()
    RaikFrameStat:StopMovingOrSizing()
end)

local RaikFrameStatPlusSize = CreateFrame("Button", nil, RaikFrameStat)
RaikFrameStatPlusSize:SetPoint("BOTTOMLEFT", 0, 0)
RaikFrameStatPlusSize:SetSize(16, 16)
RaikFrameStatPlusSize:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up.PNG")
RaikFrameStatPlusSize:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight.PNG")
RaikFrameStatPlusSize:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down.PNG")

RaikFrameStatPlusSize:SetScript("OnMouseDown", function()
    FONTSIZE = FONTSIZE + 1
    RaikFrameStat:SetFont(FONTTYPE, FONTSIZE);
end)

local RaikFrameStatMinusSize = CreateFrame("Button", nil, RaikFrameStat)
RaikFrameStatMinusSize:SetPoint("BOTTOMLEFT", 14, 0)
RaikFrameStatMinusSize:SetSize(16, 16)
RaikFrameStatMinusSize:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up.PNG")
RaikFrameStatMinusSize:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight.PNG")
RaikFrameStatMinusSize:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Down.PNG")

RaikFrameStatMinusSize:SetScript("OnMouseDown", function()
    FONTSIZE = FONTSIZE - 1
    RaikFrameStat:SetFont(FONTTYPE, FONTSIZE);
end)

RaikFrameStat:EnableMouseWheel(1)
RaikFrameStat:SetScript("OnMouseWheel", function(self, arg1)
    FONTSIZE = FONTSIZE + arg1
    RaikFrameStat:SetFont(FONTTYPE, FONTSIZE);
end)


RaikFrameStat:SetText('\
<html>\
    <body>\
    </body>\
</html>');

RaikFrameStat:SetFont(FONTTYPE, FONTSIZE);

-- creating test data structure
local Test1_Data = {
    ["01_Stats"] = {
        [1] = {
            ["name"] = "Strenght"
        },
        [2] = {
            ["name"] = "Agility"
        },
        [3] = {
            ["name"] = "Stamina"
        },
        [4] = {
            ["name"] = "Intellect"
        },
        [5] = {
            ["name"] = "Spirit"
        }
    },
    ["02_Melee"] = {
        [1] = {
            ["name"] = "Damage"
        },
        [2] = {
            ["name"] = "DPS"
        },
        [3] = {
            ["name"] = "Speed"
        },
        [4] = {
            ["name"] = "Power"
        },
        [5] = {
            ["name"] = "Hit Rating"
        },
        [6] = {
            ["name"] = "Crit Chance"
        }
    },
    ["03_Ranged"] = {
        [1] = {
            ["name"] = "Damage"
        },
        [2] = {
            ["name"] = "DPS"
        },
        [3] = {
            ["name"] = "Speed"
        },
        [4] = {
            ["name"] = "Power"
        },
        [5] = {
            ["name"] = "Hit Rating"
        },
        [6] = {
            ["name"] = "Crit Chance"
        }
    },
    ["04_Spell"] = {
        [1] = {
            ["name"] = "Bonus Healing"
        },
        [2] = {
            ["name"] = "Hit Rating"
        },
        [3] = {
            ["name"] = "Haste Rating"
        },
        [4] = {
            ["name"] = "Mana Regen"
        },
        [5] = {
            ["name"] = "Holy"
        },
        [6] = {
            ["name"] = "Fire"
        },
        [7] = {
            ["name"] = "Nature"
        },
        [8] = {
            ["name"] = "Frost"
        },
        [9] = {
            ["name"] = "Shadow"
        },
        [10] = {
            ["name"] = "Arcane"
        }
    },
    ["05_Defences"] = {
        [1] = {
            ["name"] = "Armor"
        },
        [2] = {
            ["name"] = "Dodge"
        },
        [3] = {
            ["name"] = "Parry"
        },
        [4] = {
            ["name"] = "Block"
        },
        [5] = {
            ["name"] = "Defense"
        },
        
    },
    ['06_Presets'] = {
        [1] = {
            ["name"] = "Tank"
        },
        [2] = {
            ["name"] = "Clean"
        }
    },
    ["07_Font"] = {
        [1] = {
            ["name"] = "2002.ttf"
        },
        [2] = {
            ["name"] = "2002B.ttf"
        },
        [3] = {
            ["name"] = "ARHei.ttf"
        },
        [4] = {
            ["name"] = "ARIALN.TTF"
        },
        [5] = {
            ["name"] = "ARKai_C.ttf"
        },
        [6] = {
            ["name"] = "ARKai_T.ttf"
        },
        [7] = {
            ["name"] = "bHEI00M.ttf"
        },
        [8] = {
            ["name"] = "bHEI01B.ttf"
        },
        [9] = {
            ["name"] = "bKAI00M.ttf"
        },
        [10] = {
            ["name"] = "bLEI00D.ttf"
        },
        [11] = {
            ["name"] = "FRIZQT__.TTF"
        },
        [12] = {
            ["name"] = "FRIZQT___CYR.TTF"
        },
        [13] = {
            ["name"] = "K_Damage.TTF"
        },
        [14] = {
            ["name"] = "K_Pagetext.TTF"
        },
        [15] = {
            ["name"] = "MORPHEUS.TTF"
        },
        [16] = {
            ["name"] = "MORPHEUS_CYR.TTF"
        },
        [17] = {
            ["name"] = "NIM_____.ttf"
        },
        [18] = {
            ["name"] = "SKURRI.TTF"
        },
        [19] = {
            ["name"] = "SKURRI_CYR.TTF"
        }
    },
    ["08_Colors"] = {
        [1] = {
            ["name"] = "titolo"
        },
        [2] = {
            ["name"] = "stat"
        }
    }
}

-- font objects
two = CreateFont('two')
two:SetFontObject("GameFontNormal");
two:SetFont("Fonts\\2002.ttf", 11)
twoB = CreateFont('twoB')
twoB:SetFont("Fonts\\2002B.ttf", 11)
twoB:SetFontObject("GameFontNormal");
ARHei = CreateFont('ARHei')
ARHei:SetFont("Fonts\\ARHei.ttf", 11)
ARHei:SetFontObject("GameFontNormal");
ARIALN = CreateFont('ARIALN')
ARIALN:SetFont("Fonts\\ARIALN.TTF", 11)
ARIALN:SetFontObject("GameFontNormal");
ARKaiC = CreateFont('ARKaiC')
ARKaiC:SetFont("Fonts\\ARKai_C.ttf", 11)
ARKaiC:SetFontObject("GameFontNormal");
ARKaiT = CreateFont('ARKaiT')
ARKaiT:SetFont("Fonts\\ARKai_T.ttf", 11)
ARKaiT:SetFontObject("GameFontNormal");
bHEI00M = CreateFont('bHEI00M')
bHEI00M:SetFont("Fonts\\bHEI00M.ttf", 11)
bHEI00M:SetFontObject("GameFontNormal");
bHEI01B = CreateFont('bHEI01B')
bHEI01B:SetFont("Fonts\\bHEI01B.ttf", 11)
bHEI01B:SetFontObject("GameFontNormal");
bKAI00M = CreateFont('bKAI00M')
bKAI00M:SetFont("Fonts\\bKAI00M.ttf", 11)
bKAI00M:SetFontObject("GameFontNormal");
bLEI00D = CreateFont('bLEI00D')
bLEI00D:SetFont("Fonts\\bLEI00D.ttf", 11)
bLEI00D:SetFontObject("GameFontNormal");
FRIZQT = CreateFont('FRIZQT')
FRIZQT:SetFont("Fonts\\FRIZQT__.TTF", 11)
FRIZQT:SetFontObject("GameFontNormal");
FRIZQTCYR = CreateFont('FRIZQTCYR')
FRIZQTCYR:SetFont("Fonts\\FRIZQT___CYR.TTF", 11)
FRIZQTCYR:SetFontObject("GameFontNormal");
KDamage = CreateFont('KDamage')
KDamage:SetFont("Fonts\\K_Damage.TTF", 11)
KDamage:SetFontObject("GameFontNormal");
KPagetext = CreateFont('KPagetext')
KPagetext:SetFont("Fonts\\K_Pagetext.TTF", 11)
KPagetext:SetFontObject("GameFontNormal");
MORPHEUS = CreateFont('MORPHEUS')
MORPHEUS:SetFont("Fonts\\MORPHEUS.TTF", 11)
MORPHEUS:SetFontObject("GameFontNormal");
MORPHEUSCYR = CreateFont('MORPHEUSCYR')
MORPHEUSCYR:SetFont("Fonts\\MORPHEUS_CYR.TTF", 11)
MORPHEUSCYR:SetFontObject("GameFontNormal");
NIM = CreateFont('NIM')
NIM:SetFont("Fonts\\NIM_____.ttf", 11)
NIM:SetFontObject("GameFontNormal");
SKURRI = CreateFont('SKURRI')
SKURRI:SetFont("Fonts\\SKURRI.TTF", 11)
SKURRI:SetFontObject("GameFontNormal");
SKURRICYR = CreateFont('SKURRICYR')
SKURRICYR:SetFont("Fonts\\SKURRI_CYR.TTF", 11)
SKURRICYR:SetFontObject("GameFontNormal");

function ShowColorPicker(r, g, b, a, changedCallback)
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, "r: " .. r .. ", g: " .. g .. ", b: " .. b)
    --end
    ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = changedCallback, changedCallback,
        changedCallback;

    ColorPickerFrame:SetColorRGB(r, g, b);
    ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = (a ~= nil), a;
    ColorPickerFrame.previousValues = {r, g, b, a};
    ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
    ColorPickerFrame:Show();

end



function change_header_colore()
    local newR, newG, newB, newA;
    if restore then
        newR, newG, newB, newA = unpack(restore);
    else
        newR, newG, newB = ColorPickerFrame:GetColorRGB();
    end
    cambiaColoreHeadRGB(newR, newG, newB)

end

function change_body_colore()
    local newR, newG, newB, newA;
    if restore then
        newR, newG, newB, newA = unpack(restore);
    else
        newR, newG, newB = ColorPickerFrame:GetColorRGB();
    end
    cambiaColoreBodyRGB(newR, newG, newB)
end

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function ValueClicked(value)
    func = 'ValueClicked - '
    --if DLAPI then
    --    DLAPI.DebugLog(addonName, func .. 'called')
    --end
    if has_value(CHECKED_VALUES, value) then
    -- value cheked, deseleziono, tolgo da array
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, func .. value)
        --end
        
        for i=#CHECKED_VALUES,1,-1 do
            if value == CHECKED_VALUES[i] then
                table.remove(CHECKED_VALUES, i)
            end
        end
    else
    -- value non checked, seleziono, aggiungo
        table.insert(CHECKED_VALUES, value)
    end

    if DLAPI then
        DLAPI.DebugLog(addonName, table.concat(CHECKED_VALUES,", "))
    end
    text_relaod()
end

function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

function orderedNext(t, state)
    -- Equivalent of the next function, but returns the keys in the alphabetic
    -- order. We use a temporary ordered key table that is stored in the
    -- table being iterated.

    local key = nil
    if state == nil then
        -- the first time, generate the index
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        -- fetch the next value
        for i = 1,table.getn(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end

    if key then
        return key, t[key]
    end

    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function orderedPairs(t)
    -- Equivalent of the pairs() function on tables. Allows to iterate
    -- in order
    return orderedNext, t, nil
end


-- menu create function
function Test1_DropDown_Initialize(self, level)
    level = level or 1;
    if (level == 1) then
        for key, subarray in orderedPairs(Test1_Data) do
            local info = UIDropDownMenu_CreateInfo();
            info.hasArrow = true; -- creates submenu
            info.notCheckable = true;
            info.text = strsub(key, 4)
            info.keepShownOnClick = false
            info.value = {
                ["Level1_Key"] = key
            };
            UIDropDownMenu_AddButton(info, level);
        end -- for key, subarray
    end -- if level 1
    
    


    if (level == 2) then
    -- getting values of first menu
        local Level1_Key = UIDROPDOWNMENU_MENU_VALUE["Level1_Key"];
        subarray = Test1_Data[Level1_Key];
        for key, subsubarray in pairs(subarray) do
            local info = UIDropDownMenu_CreateInfo();
            info.hasArrow = false; -- no submenues this time
            info.notCheckable = true;
            info.text = subsubarray["name"];
            info.keepShownOnClick = false
        -- use info.func to set a function to be called at "click"

            info.value = {
                ["Level1_Key"] = Level1_Key,
                ["Sublevel_Key"] = key
            };

            if Level1_Key == '07_Font' then
            -- fontObject
                if subsubarray["name"] == "2002.ttf" then
                    info.fontObject = two
                elseif subsubarray["name"] == "2002B.ttf" then
                    info.fontObject = twoB
                elseif subsubarray["name"] == "ARHei.ttf" then
                    info.fontObject = ARHei
                elseif subsubarray["name"] == "ARIALN.TTF" then
                    info.fontObject = ARIALN
                elseif subsubarray["name"] == "ARKai_C.ttf" then
                    info.fontObject = ARKaiC
                elseif subsubarray["name"] == "ARKai_T.ttf" then
                    info.fontObject = ARKaiT
                elseif subsubarray["name"] == "bHEI00M.ttf" then
                    info.fontObject = bHEI00M
                elseif subsubarray["name"] == "bHEI01B.ttf" then
                    info.fontObject = bHEI01B
                elseif subsubarray["name"] == "bKAI00M.ttf" then
                    info.fontObject = bKAI00M
                elseif subsubarray["name"] == "bLEI00D.ttf" then
                    info.fontObject = bLEI00D
                elseif subsubarray["name"] == "FRIZQT__.TTF" then
                    info.fontObject = FRIZQT
                elseif subsubarray["name"] == "FRIZQT___CYR.TTF" then
                    info.fontObject = FRIZQTCYR
                elseif subsubarray["name"] == "K_Damage.TTF" then
                    info.fontObject = KDamage
                elseif subsubarray["name"] == "K_Pagetext.TTF" then
                    info.fontObject = KPagetext
                elseif subsubarray["name"] == "MORPHEUS.TTF" then
                    info.fontObject = MORPHEUS
                elseif subsubarray["name"] == "MORPHEUS_CYR.TTF" then
                    info.fontObject = MORPHEUSCYR
                elseif subsubarray["name"] == "NIM_____.ttf" then
                    info.fontObject = NIM
                elseif subsubarray["name"] == "SKURRI.TTF" then
                    info.fontObject = SKURRI
                elseif subsubarray["name"] == "SKURRI_CYR.TTF" then
                    info.fontObject = SKURRICYR
                end
                info.func = function()
                    change_font(subsubarray["name"]);
                    dropdown:Hide()
                end;

            elseif has_value({'01_Stats', '02_Melee', '03_Ranged', '04_Spell', '05_Defences'}, Level1_Key) then
                info.text, info.checked, info.notCheckable, info.isNotRadio = subsubarray["name"], has_value(
                    CHECKED_VALUES, strsub(Level1_Key, 4) .. '_' .. subsubarray["name"]), false, true
                info.func = function()
                    ValueClicked(strsub(Level1_Key, 4) .. '_' .. subsubarray["name"]);
                    dropdown:Hide()
                end;

            elseif Level1_Key == '08_Colors' then

                if subsubarray["name"] == "titolo" then
                    info.func = function()
                        ShowColorPicker(HeadR, HeadG, HeadB, nil, change_header_colore);
                        dropdown:Hide()
                    end;
                elseif subsubarray["name"] == "stat" then
                    info.func = function()
                        ShowColorPicker(BodyR, BodyG, BodyB, nil, change_body_colore);
                        dropdown:Hide()
                    end;
                end
            elseif Level1_Key == '06_Presets' then
                info.func = function()
                    PresetFunctions[subsubarray["name"]]();
                    dropdown:Hide()
                end;
                -- if subsubarray["name"] == 'Tank' then
                --     info.func = function() 
                --         TankPreset();
                --         dropdown:Hide()
                --     end;
                -- elseif subsubarray['name'] == 'Clean' then
                --     info.func = function() 
                --         CleanPreset();
                --         dropdown:Hide()
                --     end;
                -- end
            else
                info.func = function()
                    dropdown:Hide()
                end;
            end
            UIDropDownMenu_AddButton(info, level);
        end -- for key,subsubarray
    end -- if level 2
end -- function Test1_DropDown_Initialize

dropdown = CreateFrame("Frame", "Test_DropDown", UIParent, "UIDropDownMenuTemplate");
UIDropDownMenu_Initialize(dropdown, Test1_DropDown_Initialize, "MENU");

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function change_font(font)
    RaikFrameStat:SetFont('Fonts\\' .. font, FONTSIZE);
    FONTTYPE = 'Fonts\\' .. font
    text_relaod()
end

RaikFrameStat:SetAttribute("*type2", nil)
RaikFrameStat:SetScript("OnMouseDown", function(self, button)
    if button == "RightButton" then
        ToggleDropDownMenu(1, nil, dropdown, RaikFrameStat, 0, 0)
        dropdown:Show()
    end
end)

PresetFunctions = {
    Tank = function() TankPreset() end,
    Clean = function() CleanPreset() end
}

function TankPreset()

    CHECKED_VALUES = {
        "Defences_Dodge", -- [1]
        "Defences_Block", -- [2]
        "Defences_Parry", -- [3]
        "Defences_Defense", -- [4]
        "Defences_Armor", -- [5]
        "Stats_Strenght", -- [6]
        "Melee_DPS", -- [7]
    }
    if DLAPI then
        DLAPI.DebugLog(addonName, 'Tank preset ' .. table.concat(CHECKED_VALUES))
    end
    text_relaod()

end

function CleanPreset()
    CHECKED_VALUES = {}
    if DLAPI then
        DLAPI.DebugLog(addonName, 'Tank preset ' .. table.concat(CHECKED_VALUES))
    end
    text_relaod()
end


function text_relaod()

    content = '\n'
    -- POSSIBLE VALUES
    -- Defences_Armor
    if has_value(CHECKED_VALUES, 'Defences_Armor') then
        baseArmor, effectiveArmor, armor, posBuff, negBuff = UnitArmor("player")
        ArmorValue = tostring(effectiveArmor)
        ARMORstringa = '|c' .. HeadColor .. 'Armor:|r|c' .. BodyColor .. ' ' .. ArmorValue .. '|r\n'
        content = content .. ARMORstringa
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Armore value ' .. ArmorValue)
        --end
    end
    -- Defences_Block
    if has_value(CHECKED_VALUES, 'Defences_Block') then
        BlockChance = format("%.2f%%", GetBlockChance())
        BLOCKSTringa = '|c' .. HeadColor .. 'Block:|r|c' .. BodyColor .. ' ' .. BlockChance .. '|r\n'
        content = content .. BLOCKSTringa
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Block value ' .. BlockChance)
        --end
    end
    -- Defences_Dodge
    if has_value(CHECKED_VALUES, 'Defences_Dodge') then
        DodgeChance = format("%.2f%%", GetDodgeChance())
        DODGESTringa = '|c' .. HeadColor .. 'Dodge:|r|c' .. BodyColor .. ' ' .. DodgeChance .. '|r\n'
        content = content .. DODGESTringa
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Defences_Dodge ' .. DodgeChance)
        --end
    end
    -- Defences_Parry
    if has_value(CHECKED_VALUES, 'Defences_Parry') then
        ParryChance = format("%.2f%%", GetParryChance())
        PARRYTringa = '|c' .. HeadColor .. 'Parry:|r|c' .. BodyColor .. ' ' .. ParryChance .. '|r\n'
        content = content .. PARRYTringa
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Defences_Parry ' .. ParryChance)
        --end
    end
    -- Melee_Crit Chance
    if has_value(CHECKED_VALUES, 'Melee_Crit Chance') then
        MeleecritChance = tostring(GetCritChance())
        MeleecritChance = string.sub(MeleecritChance, 1, 5) .. '%'
        MeleeCritString = '|c' .. HeadColor .. 'Melee Crit:|r|c' .. BodyColor .. ' ' .. MeleecritChance .. '|r\n'
        content = content .. MeleeCritString
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Melee_Crit Chance ' .. MeleecritChance)
        -- end
    end
    -- Melee_Damage
    if has_value(CHECKED_VALUES, 'Melee_Damage') then
        lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff, negBuff, percentmod = UnitDamage('player')
        MeleeDMGString = '|c' .. HeadColor .. 'Melee Damage:|r|c' .. BodyColor .. ' ' .. tostring(math.floor(lowDmg)) .. '-' .. tostring(math.floor(hiDmg)) .. '|r\n'
        content = content .. MeleeDMGString
        if offlowDmg == nil then
            a=1
        else
            MeleeOFFDMGString = '|c' .. HeadColor .. 'Melee Damage Offhand:|r|c' .. BodyColor .. ' ' .. tostring(math.floor(offlowDmg)) .. '-' .. tostring(math.floor(offhiDmg)) .. '|r\n'
            content = content .. MeleeOFFDMGString
        end
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Melee_Damage ' .. tostring(math.floor(lowDmg)) .. '-' .. tostring(math.floor(hiDmg)))
        --end

    end
    -- Melee_Hit Rating
    if has_value(CHECKED_VALUES, 'Melee_Hit Rating') then
        MeleeHitRate = format("%.2f%%", GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier())
        MeleeHitRateString = '|c' .. HeadColor .. 'Melee HitRate:|r|c' .. BodyColor .. ' ' .. MeleeHitRate .. '|r\n'
        content = content .. MeleeHitRateString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Melee_Hit Rating ' .. MeleeHitRate)
        --end
    end
    -- Melee_Power
    if has_value(CHECKED_VALUES, 'Melee_Power') then
        MeleeAP, MeleeposBuff, MeleenegBuff = UnitAttackPower("player");
        MeleeAPVal = tostring(MeleeAP + MeleeposBuff + MeleenegBuff)
        MeleeApString = '|c' .. HeadColor .. 'Melee AP:|r|c' .. BodyColor .. ' ' .. MeleeAPVal .. '|r\n'
        content = content .. MeleeApString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Melee_Power ' .. MeleeAP)
        --end
    end
    -- Melee_Speed
    if has_value(CHECKED_VALUES, 'Melee_Speed') then
        MeleeMainSpeed, MeleeOffSpeed = UnitAttackSpeed("player")
        MeleeMainSpeedString = '|c' .. HeadColor .. 'Main Hand Speed:|r|c' .. BodyColor .. ' ' .. string.format("%.2f",MeleeMainSpeed) .. '|r\n'
        content = content .. MeleeMainSpeedString
        if MeleeOffSpeed == nil then
            a=1
        else
            MeleeOffSpeedString = '|c' .. HeadColor .. 'Off Hand Speed:|r|c' .. BodyColor .. ' ' .. string.format("%.2f",MeleeOffSpeed) .. '|r\n'
            content = content .. MeleeOffSpeedString
        end

        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Melee_Speed ')
        --end

    end
    -- Melee_DPS
    if has_value(CHECKED_VALUES, 'Melee_DPS') then
        lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff, negBuff, percentmod = UnitDamage('player')
        MeleeMainSpeed, MeleeOffSpeed = UnitAttackSpeed("player")
        avgMain = (lowDmg + hiDmg)/2
        DPSMain = avgMain/MeleeMainSpeed
        MeleeMainSpeedString = '|c' .. HeadColor .. 'Main Hand DPS:|r|c' .. BodyColor .. ' ' .. string.format("%.2f",DPSMain) .. '|r\n'
        content = content .. MeleeMainSpeedString

        if MeleeOffSpeed == nil then
            a=1
        else
            avgOFF = (offlowDmg + offhiDmg)/2
            DPSOFF = avgOFF/MeleeOffSpeed
            MeleeMainSpeedString = '|c' .. HeadColor .. 'Off Hand DPS:|r|c' .. BodyColor .. ' ' .. string.format("%.2f",DPSOFF) .. '|r\n'
            content = content .. MeleeOFFDMGString
        end

    end
    -- Ranged_Crit Chance
    if has_value(CHECKED_VALUES, 'Ranged_Crit Chance') then
        RangedCritChance = format("%.2f%%", GetRangedCritChance());
        RangedCritString = '|c' .. HeadColor .. 'Ranged Crit:|r|c' .. BodyColor .. ' ' .. RangedCritChance .. '|r\n'
        content = content .. RangedCritString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Ranged_Crit Chance' .. RangedCritChance)
        --end
    end
    -- Ranged_Damage
    if has_value(CHECKED_VALUES, 'Ranged_Damage') then
        RangedSpeed, RangedLowDmg, RangedHiDmg, RangedPosBuff, RangedNegBuff, RangedPercent = UnitRangedDamage("player")
        if RangedSpeed == 0 then
            MeleeDMGString = '|c' .. HeadColor .. 'Ranged Damage:|r|c' .. BodyColor .. ' NA |r\n'
        else
            MeleeDMGString = '|c' .. HeadColor .. 'Ranged Damage:|r|c' .. BodyColor .. ' ' .. tostring(math.floor(RangedLowDmg)) .. '-' .. tostring(math.floor(RangedHiDmg)) .. '|r\n'
        end
        content = content .. MeleeDMGString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Ranged_Damage')
        --end

    end
    -- Ranged_Hit Rating
    if has_value(CHECKED_VALUES, 'Ranged_Hit Rating') then
        RangedSpeed, RangedLowDmg, RangedHiDmg, RangedPosBuff, RangedNegBuff, RangedPercent = UnitRangedDamage("player")
        if RangedSpeed == 0 then
            RangedHITString = '|c' .. HeadColor .. 'Ranged HIT:|r|c' .. BodyColor .. ' N/A |r\n'
        else
            RangedHit = string.format(GetCombatRatingBonus(7))
            RangedHITString = '|c' .. HeadColor .. 'Ranged HIT:|r|c' .. BodyColor .. ' ' .. RangedHit .. '|r\n'
        end
        content = content .. RangedHITString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Ranged_Hit Rating')
        --end
    
    end
    -- Ranged_DPS
    if has_value(CHECKED_VALUES, 'Ranged_DPS') then
        RangedSpeed, RangedLowDmg, RangedHiDmg, RangedPosBuff, RangedNegBuff, RangedPercent = UnitRangedDamage("player")
        if RangedSpeed == 0 then
            RangedDMGString = '|c' .. HeadColor .. 'Ranged DPS:|r|c' .. BodyColor .. ' N/A |r\n'
        else
            RangedAVG = (RangedLowDmg + RangedHiDmg)/2
            RangedDPS = RangedAVG/RangedSpeed
            RangedDMGString = '|c' .. HeadColor .. 'Ranged DPS:|r|c' .. BodyColor .. ' ' .. string.format("%.2f",RangedDPS) .. '|r\n'
        end
        content = content .. RangedDMGString

        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Ranged_DPS')
        -- end

    end
    -- Ranged_Power
    if has_value(CHECKED_VALUES, 'Ranged_Power') then
        RangedAP, RangedposBuff, RangednegBuff = UnitRangedAttackPower("player");
        RangedAPValue = tostring(RangedAP + RangedposBuff + RangednegBuff)
        RangedAPString = '|c' .. HeadColor .. 'Ranged AP:|r|c' .. BodyColor .. ' ' .. RangedAPValue .. '|r\n'
        content = content .. RangedAPString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Ranged_Crit Chance' .. )
        --end
    end
    -- Ranged_Speed
    if has_value(CHECKED_VALUES, 'Ranged_Speed') then
        RangedSpeed, RangedLowDmg, RangedHiDmg, RangedPosBuff, RangedNegBuff, RangedPercent = UnitRangedDamage("player")
        if RangedSpeed == 0 then
            RangedSpeedString = '|c' .. HeadColor .. 'Ranged Speed:|r|c' .. BodyColor .. ' N/A |r\n'
        else
            RangedSpeedString = '|c' .. HeadColor .. 'Ranged Speed:|r|c' .. BodyColor .. ' ' .. string.format("%.2f",RangedSpeed) .. '|r\n'
        end
        content = content .. RangedSpeedString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Ranged_Speed ' .. string.format("%.2f",RangedSpeed))
        --end

    end
    -- Spell_Bonus Healing
    if has_value(CHECKED_VALUES, 'Spell_Bonus Healing') then
        HealBonus = tostring(GetSpellBonusHealing())
        HealingBonusString = '|c' .. HeadColor .. 'Healing:|r|c' .. BodyColor .. ' ' .. HealBonus .. '|r \n'
        content = content .. HealingBonusString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Spell_Bonus Healing ' .. HealBonus)
        --end
    end
    -- Spell_Haste Rating
    if has_value(CHECKED_VALUES, 'Spell_Haste Rating') then
        SpellHaste = GetCombatRating(20)
        SpellHasteString = '|c' .. HeadColor .. 'SpellHaste:|r|c' .. BodyColor .. ' ' .. tostring(SpellHaste) .. '|r \n'
        content = content .. SpellHasteString

        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Spell_Haste Rating ')
        --end

    end
    -- Spell_Hit Rating
    if has_value(CHECKED_VALUES, 'Spell_Hit Rating') then
        SpellHit = GetCombatRatingBonus(CR_HIT_SPELL) + GetSpellHitModifier()
        SpellHitString = '|c' .. HeadColor .. 'Spell Hit Rate:|r|c' .. BodyColor .. ' ' .. tostring(SpellHit) .. '|r \n'
        content = content .. SpellHitString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Spell_Hit Rating ')
        --end

    end
    -- Spell_Mana Regen
    if has_value(CHECKED_VALUES, 'Spell_Mana Regen') then
        SpellRegenBase, SpellRegenCasting = GetManaRegen()
        SpellRegenBaseVal = string.format("%.2f",SpellRegenBase)
        SpellRegenCastingVal = string.format("%.2f",SpellRegenCasting)
        SpellHitString = '|c' .. HeadColor .. 'Mana Regen:|r|c' .. BodyColor .. ' ' .. SpellRegenBaseVal .. '|r \n'
        SpellHitString = '|c' .. HeadColor .. 'Mana Regen Casting:|r|c' .. BodyColor .. ' ' .. SpellRegenCastingVal .. '|r \n'
        content = content .. SpellHitString .. SpellHitString
        --if DLAPI then
        --    DLAPI.DebugLog(addonName, 'Spell_Mana Regen ')
        --end

    end
    -- Spell_Holy
    if has_value(CHECKED_VALUES, 'Spell_Holy') then
        school = 2
        SpellAP = GetSpellBonusDamage(school);
        SpellAPVal = tostring(AP)
        SpellcritChance = format("%.2f%%", GetSpellCritChance(school));
        SpellAPString = '|c' .. HeadColor .. 'Holy Power:|r|c' .. BodyColor .. ' ' .. SpellAPVal .. '|r\n'
        SpellcritChanceString = '|c' .. HeadColor .. 'Holy Crit:|r|c' .. BodyColor .. ' ' .. SpellcritChance .. '|r\n'
        content = content .. SpellAPString .. SpellcritChanceString
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Spell_Holy ' .. SpellAPVal)
        --     DLAPI.DebugLog(addonName, 'Spell_Holy crit ' .. SpellcritChance)
        -- end
    end
    -- Spell_Fire
    if has_value(CHECKED_VALUES, 'Spell_Fire') then
        school = 3
        SpellAP = GetSpellBonusDamage(school);
        SpellAPVal = tostring(AP)
        SpellcritChance = format("%.2f%%", GetSpellCritChance(school));
        SpellAPString = '|c' .. HeadColor .. 'Fire Power:|r|c' .. BodyColor .. ' ' .. SpellAPVal .. '|r\n'
        SpellcritChanceString = '|c' .. HeadColor .. 'Fire Crit:|r|c' .. BodyColor .. ' ' .. SpellcritChance .. '|r\n'
        content = content .. SpellAPString .. SpellcritChanceString
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Spell_Fire ' .. SpellAPVal)
        --     DLAPI.DebugLog(addonName, 'Spell_Fire crit ' .. SpellcritChance)
        -- end
    end
    -- Spell_Nature
    if has_value(CHECKED_VALUES, 'Spell_Nature') then
        school = 4
        SpellAP = GetSpellBonusDamage(school);
        SpellAPVal = tostring(AP)
        SpellcritChance = format("%.2f%%", GetSpellCritChance(school));
        SpellAPString = '|c' .. HeadColor .. 'Nature Power:|r|c' .. BodyColor .. ' ' .. SpellAPVal .. '|r\n'
        SpellcritChanceString = '|c' .. HeadColor .. 'Nature Crit:|r|c' .. BodyColor .. ' ' .. SpellcritChance .. '|r\n'
        content = content .. SpellAPString .. SpellcritChanceString
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Spell_Nature ' .. SpellAPVal)
        --     DLAPI.DebugLog(addonName, 'Spell_Nature crit ' .. SpellcritChance)
        -- end
    end
    -- Spell_Frost
    if has_value(CHECKED_VALUES, 'Spell_Frost') then
        school = 5
        SpellAP = GetSpellBonusDamage(school);
        SpellAPVal = tostring(AP)
        SpellcritChance = format("%.2f%%", GetSpellCritChance(school));
        SpellAPString = '|c' .. HeadColor .. 'Frost Power:|r|c' .. BodyColor .. ' ' .. SpellAPVal .. '|r\n'
        SpellcritChanceString = '|c' .. HeadColor .. 'Frost Crit:|r|c' .. BodyColor .. ' ' .. SpellcritChance .. '|r\n'
        content = content .. SpellAPString .. SpellcritChanceString
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Spell_Frost ' .. SpellAPVal)
        --     DLAPI.DebugLog(addonName, 'Spell_Frost crit ' .. SpellcritChance)
        -- end
    end
    -- Spell_Shadow
    if has_value(CHECKED_VALUES, 'Spell_Shadow') then
        school = 6
        SpellAP = GetSpellBonusDamage(school);
        SpellAPVal = tostring(AP)
        SpellcritChance = format("%.2f%%", GetSpellCritChance(school));
        SpellAPString = '|c' .. HeadColor .. 'Shadow Power:|r|c' .. BodyColor .. ' ' .. SpellAPVal .. '|r\n'
        SpellcritChanceString = '|c' .. HeadColor .. 'Shadow Crit:|r|c' .. BodyColor .. ' ' .. SpellcritChance .. '|r\n'
        content = content .. SpellAPString .. SpellcritChanceString
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Spell_Shadow ' .. SpellAPVal)
        --     DLAPI.DebugLog(addonName, 'Spell_Shadow crit ' .. SpellcritChance)
        -- end
    end
    -- Spell_Arcane
    if has_value(CHECKED_VALUES, 'Spell_Arcane') then
        school = 7
        SpellAP = GetSpellBonusDamage(school);
        SpellAPVal = tostring(AP)
        SpellcritChance = format("%.2f%%", GetSpellCritChance(school));
        SpellAPString = '|c' .. HeadColor .. 'Holy Power:|r|c' .. BodyColor .. ' ' .. SpellAPVal .. '|r\n'
        SpellcritChanceString = '|c' .. HeadColor .. 'Holy Crit:|r|c' .. BodyColor .. ' ' .. SpellcritChance .. '|r\n'
        content = content .. SpellAPString .. SpellcritChanceString
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Spell_Arcane ' .. SpellAPVal)
        --     DLAPI.DebugLog(addonName, 'Spell_Arcane crit ' .. SpellcritChance)
        -- end
    end
    -- Stats_Agility
    if has_value(CHECKED_VALUES, 'Stats_Agility') then
        AGIbase, AGIstat, AGIposBuff, AGInegBuff = UnitStat("player", 2);
        AGIstringa = '|c' .. HeadColor .. 'Agility:|r|c' .. BodyColor .. ' ' .. tostring(AGIstat) .. '|r\n'
        content = content .. AGIstringa
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Stats_Agility ' .. tostring(AGIstat))
        -- end
    end
    -- Stats_Intellect
    if has_value(CHECKED_VALUES, 'Stats_Intellect') then
        INTbase, INTstat, INTposBuff, INTnegBuff = UnitStat("player", 4);
        INTstringa = '|c' .. HeadColor .. 'Intelligence:|r|c' .. BodyColor .. ' ' .. tostring(INTstat) .. '|r\n'
        content = content .. INTstringa
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Stats_Intellect ' .. tostring(INTstat))
        -- end
    end
    -- Stats_Spirit
    if has_value(CHECKED_VALUES, 'Stats_Spirit') then
        SPIbase, SPIstat, SPIposBuff, SPInegBuff = UnitStat("player", 5);
        SPIstringa = '|c' .. HeadColor .. 'Spirit:|r|c' .. BodyColor .. ' ' .. tostring(SPIstat) .. '|r\n'
        content = content .. SPIstringa
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Stats_Spirit ' .. tostring(SPIstat))
        -- end
    end
    -- Stats_Stamina
    if has_value(CHECKED_VALUES, 'Stats_Stamina') then
        STAbase, STAstat, STAposBuff, STAnegBuff = UnitStat("player", 3);
        STAstringa = '|c' .. HeadColor .. 'Stamina:|r|c' .. BodyColor .. ' ' .. tostring(STAstat) .. '|r\n'
        content = content .. STAstringa
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Stats_Stamina ' .. tostring(STAstat))
        -- end
    end
    -- Stats_Strenght
    if has_value(CHECKED_VALUES, 'Stats_Strenght') then
        STRbase, STRstat, STRposBuff, STRnegBuff = UnitStat("player", 1);
        STRstringa = '|c' .. HeadColor .. 'Strenght:|r|c' .. BodyColor .. ' ' .. tostring(STRstat) .. '|r\n'
        content = content .. STRstringa
        -- if DLAPI then
        --     DLAPI.DebugLog(addonName, 'Stats_Strenght ' .. tostring(STRstat))
        -- end
    end

    for i = 1, GetNumSkillLines() do 
        
        skillName, header, isExpanded, skillRan, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType, skillDescription = GetSkillLineInfo(i)
        
        -- here I find Defense
        if skillName == 'Defense' then
            if has_value(CHECKED_VALUES, 'Defences_Defense') then
                DefenseString = '|c' .. HeadColor .. 'Defense:|r|c' .. BodyColor .. ' ' .. tostring(skillRan) .. '|r\n'
                content = content .. DefenseString
            end
        end

    
    end 

    
    text:SetText(content);
    -- text:SetTextHeight(FONTSIZE);
    text:SetFont(FONTTYPE, FONTSIZE);

    -- RaikFrameStat:SetText('\
    -- <html>\
    -- <body> \
    --         ' .. content .. '\
    --     </body>\
    -- </html>');

    -- RaikFrameStat:SetFont(FONTTYPE, FONTSIZE);
end

SLASH_SHOWRAIKWINDOW1 = "/ShowRaikWindow"
SlashCmdList["SHOWRAIKWINDOW"] = function()
    RaikFrameStat:Show()
end

SLASH_HIDERAIKWINDOW1 = "/HideRaikWindow"
SlashCmdList["HIDERAIKWINDOW"] = function()
    RaikFrameStat:Hide()
end

SLASH_RAIKRELOAD1 = "/RaikReload"
SlashCmdList["RAIKRELOAD"] = function(msg)
    text_relaod()
end

SLASH_RAIKFONT1 = "/RaikFont"
SlashCmdList["RAIKFONT"] = function(msg)
    change_font(msg)
end

local f = CreateFrame("Frame");
function f:onUpdate(sinceLastUpdate)
    self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate;
    if (self.sinceLastUpdate >= 1) then -- in seconds
        text_relaod()
        self.sinceLastUpdate = 0;
    end
end
f:SetScript("OnUpdate", f.onUpdate)
