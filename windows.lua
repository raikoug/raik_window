local RaikFrameStat = CreateFrame("SimpleHTML", "DragFrame2", UIParent)
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

RaikFrameStat.texture = RaikFrameStat:CreateTexture();
RaikFrameStat.texture:SetAllPoints(RaikFrameStat);

addonName = "RaikWindow"


if TIPOUPDATE == nil then
    if DLAPI then DLAPI.DebugLog(addonName, "Init TIPOUPDATE" ) end
    TIPOUPDATE = 'melee'
end
if FONTSIZE == nil then 
    FONTSIZE = 11
    if DLAPI then DLAPI.DebugLog(addonName, "Init FONTSIZE" ) end
end

if FONTTYPE == nil then 
    FONTTYPE = 'Fonts\\FRIZQT__.TTF'
    if DLAPI then DLAPI.DebugLog(addonName, "Init FONTTYPE" ) end
end

if SfondoR == nil then 
    SfondoR = 0.5
    if DLAPI then DLAPI.DebugLog(addonName, "Init SfondoR" ) end
end

if SfondoG == nil then 
    SfondoG = 0.5
    if DLAPI then DLAPI.DebugLog(addonName, "Init SfondoG" ) end
end

if SfondoB == nil then 
    SfondoB = 0.5
    if DLAPI then DLAPI.DebugLog(addonName, "Init SfondoB" ) end
end

if SfondoA == nil then 
    SfondoA = 0.5
    if DLAPI then DLAPI.DebugLog(addonName, "Init SfondoA" ) end
end

if HeadColor == nil then 
    HeadColor = "ffee4400"
    if DLAPI then DLAPI.DebugLog(addonName, "Init HeadColor" ) end
end

if BodyColor == nil then 
    BodyColor = "FF0000FF"
    if DLAPI then DLAPI.DebugLog(addonName, "Init BodyColor" ) end
end

if HeadR == nil then 
    HeadR = 1
    if DLAPI then DLAPI.DebugLog(addonName, "Init HeadR" ) end
end

if HeadG == nil then 
    HeadG = 0.3
    if DLAPI then DLAPI.DebugLog(addonName, "Init HeadG" ) end
end

if HeadB == nil then 
    HeadB = 0.0
    if DLAPI then DLAPI.DebugLog(addonName, "Init HeadB" ) end
end

if BodyR == nil then 
    BodyR = 0
    if DLAPI then DLAPI.DebugLog(addonName, "Init BodyR" ) end
end

if BodyG == nil then 
    BodyG = 0
    if DLAPI then DLAPI.DebugLog(addonName, "Init BodyG" ) end
end

if BodyB == nil then 
    BodyB = 1
    if DLAPI then DLAPI.DebugLog(addonName, "Init BodyB" ) end
end



function RGBtoHexa(r,g,b)
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

    res = 'FF'.. R .. G .. B
    return res
end

RaikFrameStat.texture:SetColorTexture(SfondoR, SfondoG, SfondoB); 
RaikFrameStat.texture:SetAlpha(SfondoA);


function cambiaColoreSfondoRGBA(SfondoRF, SfondoGF, SfondoBF, SfondoAF)
    SfondoR = SfondoRF
    SfondoG = SfondoGF
    SfondoB = SfondoBF
    SfondoA = SfondoAF
    RaikFrameStat.texture:SetColorTexture(SfondoR, SfondoG, SfondoB); 
    RaikFrameStat.texture:SetAlpha(SfondoA);
end

function cambiaColoreHeadRGB(HeadRF, HeadGF, HeadBF)
      
    HeadR = HeadRF
    HeadG = HeadGF
    HeadB = HeadBF
    hexstr = RGBtoHexa(HeadRF, HeadGF, HeadBF)
    HeadColor = hexstr
    text_relaod(TIPOUPDATE)
    
end

function cambiaColoreBodyRGB(BodyRF, BodyGF, BodyBF)
        
    BodyR = BodyRF
    BodyG = BodyGF
    BodyB = BodyBF

    hexstr = RGBtoHexa(BodyRF, BodyGF, BodyBF)
    BodyColor = hexstr
    text_relaod(TIPOUPDATE)
end




critChance = tostring(GetCritChance())
critChance = string.sub(critChance,1,5)
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

-- Buttons/UI-PlusButton-Up.PNG
-- Buttons/UI-PlusButton-Down.PNG
-- Buttons/UI-PlusButton-Hilight.PNG
-- Buttons/UI-MinusButton-Up.PNG
-- Buttons/UI-MinusButton-Down.PNG 

RaikFrameStat:SetText('\
<html>\
    <body>\
        <h1>RaikStatistics</h1>\
        <p align="center">|cffee4400AP:|r|cFF0000FF 0|r (|cFF00FF00+0|r |cFFFF0000-0|r)</p>\
        <p align="center">|cffee4400Crit:|r|cFF0000FF 0|r</p>\
    </body>\
</html>');

RaikFrameStat:SetFont(FONTTYPE, FONTSIZE);

-- local button = CreateFrame("button","MyAddonButton", RaikFrameStat, "UIPanelButtonTemplate")
-- button:SetHeight(24)
-- button:SetWidth(60)
-- button:SetPoint("BOTTOM", RaikFrameStat, "BOTTOM", 0, 10)
-- button:SetText("Close")
-- button:SetScript("OnClick", function(self) PlaySound("igMainMenuOption") self:GetParent():Hide() end)

-- creating test data structure
local Test1_Data = {
    ["Fisici"] = {
      [1] = { ["name"] = "melee"; },
      [2] = { ["name"] = "ranged"; },
      [2] = { ["name"] = "aggroman"; },
    },
    ["Magici"] = {
        [1] = { ["name"] = "spell physical"; },
        [2] = {	["name"] = "spell holy"; },
        [3] = {	["name"] = "spell fire"; },
        [4] = {	["name"] = "spell nature"; },
        [5] = {	["name"] = "spell frost"; },
        [6] = {	["name"] = "spell shadow"; },
        [7] = {	["name"] = "spell arcane"; },

      },
      ["Font"] ={
        [1] = { ["name"] = "2002.ttf"; },
        [2] = { ["name"] = "2002B.ttf"; },
        [3] = { ["name"] = "ARHei.ttf"; },
        [4] = { ["name"] = "ARIALN.TTF"; },
        [5] = { ["name"] = "ARKai_C.ttf"; },
        [6] = { ["name"] = "ARKai_T.ttf"; },
        [7] = { ["name"] = "bHEI00M.ttf"; },
        [8] = { ["name"] = "bHEI01B.ttf"; },
        [9] = { ["name"] = "bKAI00M.ttf"; },
        [10] = { ["name"] = "bLEI00D.ttf"; },
        [11] = { ["name"] = "FRIZQT__.TTF"; },
        [12] = { ["name"] = "FRIZQT___CYR.TTF"; },
        [13] = { ["name"] = "K_Damage.TTF"; },
        [14] = { ["name"] = "K_Pagetext.TTF"; },
        [15] = { ["name"] = "MORPHEUS.TTF"; },
        [16] = { ["name"] = "MORPHEUS_CYR.TTF"; },
        [17] = { ["name"] = "NIM_____.ttf"; },
        [18] = { ["name"] = "SKURRI.TTF"; },
        [19] = { ["name"] = "SKURRI_CYR.TTF";},
      },
      ["colori"] = {
        [1] = { ["name"] = "sfondo"; },
        [2] = { ["name"] = "titolo"; },
        [3] = { ["name"] = "stat"; }
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
    if DLAPI then DLAPI.DebugLog(addonName, "r: " .. r .. ", g: " .. g .. ", b: " .. b) end
    ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = 
     changedCallback, changedCallback, changedCallback;

    ColorPickerFrame:SetColorRGB(r,g,b);
    ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = (a ~= nil), a;
    ColorPickerFrame.previousValues = {r,g,b,a};
    ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
    ColorPickerFrame:Show();
    
end



function change_sfondo_colore(restore)
    local newR, newG, newB, newA;
    if restore then
     newR, newG, newB, newA = unpack(restore);
    else
     newA, newR, newG, newB = OpacitySliderFrame:GetValue(), ColorPickerFrame:GetColorRGB();
    end
    cambiaColoreSfondoRGBA(newR, newG, newB, newA)
end


function change_header_colore()
    local newR, newG, newB, newA;
    if restore then
        newR, newG, newB, newA = unpack(restore);
    else
        newR, newG, newB =  ColorPickerFrame:GetColorRGB();
    end
    cambiaColoreHeadRGB(newR, newG, newB)

end

function change_body_colore()
    local newR, newG, newB, newA;
    if restore then
        newR, newG, newB, newA = unpack(restore);
    else
        newR, newG, newB =  ColorPickerFrame:GetColorRGB();
    end
    cambiaColoreBodyRGB(newR, newG, newB)
end

 -- menu create function
function Test1_DropDown_Initialize(self,level)
   level = level or 1;
   if (level == 1) then
     for key, subarray in pairs(Test1_Data) do
       local info = UIDropDownMenu_CreateInfo();
       info.hasArrow = true; -- creates submenu
       info.notCheckable = true;
       info.text = key;
       info.keepShownOnClick = false
       info.value = {
         ["Level1_Key"] = key;
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
         ["Level1_Key"] = Level1_Key;
         ["Sublevel_Key"] = key;
       };

       if subsubarray["name"] == 'melee' then
        info.icon = ("Interface\\ICONS\\Ability_MeleeDamage.PNG")
       elseif subsubarray["name"] == 'ranged' then
        info.icon = ("Interface\\ICONS\\INV_Weapon_Bow_03.PNG")
       elseif subsubarray["name"] == 'aggroman' then
        info.icon = ("Interface\\ICONS\\Ability_MeleeDamage.PNG")
       elseif subsubarray["name"] == "spell physical" then
        info.icon = ("Interface\\ICONS\\Ability_Physical_Taunt.PNG")
       elseif subsubarray["name"] == "spell holy" then
        info.icon = ("Interface\\ICONS\\Spell_Holy_HealingAura.PNG")
       elseif subsubarray["name"] == "spell fire" then
        info.icon = ("Interface\\ICONS\\Spell_Fire_Fire.PNG")
       elseif subsubarray["name"] == "spell nature" then
        info.icon = ("Interface\\ICONS\\Spell_Nature_Thorns.PNG")
       elseif subsubarray["name"] == "spell frost" then
        info.icon = ("Interface\\ICONS\\Spell_Frost_Frost.PNG")
       elseif subsubarray["name"] == "spell shadow" then
        info.icon = ("Interface\\ICONS\\Spell_Shadow_ShadowBolt.PNG")
       elseif subsubarray["name"] == "spell arcane" then
        info.icon = ("Interface\\ICONS\\Spell_Arcane_ArcaneTorrent.PNG")
       end
       
       if Level1_Key == 'Font' then
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
          info.func = function() change_font(subsubarray["name"]); dropdown:Hide() end;
        elseif subsubarray["name"] == "sfondo" then
            info.func = function() ShowColorPicker(SfondoR, SfondoG, SfondoB, SfondoA, change_sfondo_colore); dropdown:Hide() end;
        elseif subsubarray["name"] == "titolo" then
            info.func = function() ShowColorPicker(HeadR, HeadG, HeadB, nil, change_header_colore); dropdown:Hide() end;
        elseif subsubarray["name"] == "stat" then
            info.func = function() ShowColorPicker(BodyR, BodyG, BodyB, nil, change_body_colore); dropdown:Hide() end;
        else
          info.func = function() changeTipoUpdate(subsubarray["name"]); dropdown:Hide() end;
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
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

function changeTipoUpdate(msg)
    TIPOUPDATE = msg
    text_relaod(TIPOUPDATE)
end

function change_font(font)
    RaikFrameStat:SetFont('Fonts\\'.. font, FONTSIZE);
    FONTTYPE = 'Fonts\\'.. font
end

RaikFrameStat:SetAttribute("*type2", nil)
RaikFrameStat:SetScript("OnMouseDown", function(self, button)
	if button == "RightButton" then
		ToggleDropDownMenu(1, nil, dropdown, RaikFrameStat, 0, 0)
        dropdown:Show()
	end
end)


function text_relaod(TipoAttacco)

    HealingBonus = ''
    stat1 = ''
    stat2 = ''

    -- base, stat, posBuff, negBuff = UnitStat("player", 1);
    -- 1 Strength
    -- 2 Agility
    -- 3 Stamina
    -- 4 Intellect
    -- 5 Spirit
    STRbase, STRstat, STRposBuff, STRnegBuff = UnitStat("player", 1);
    STRstringa = '<h1 align="center">|c' .. HeadColor ..'Strenth:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. tostring(STRstat)  .. '|r</p>'
    AGIbase, AGIstat, AGIposBuff, AGInegBuff = UnitStat("player", 2);
    AGIstringa = '<h1 align="center">|c' .. HeadColor ..'Agility:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. tostring(AGIstat)  .. '|r</p>'
    STAbase, STAstat, STAposBuff, STAnegBuff = UnitStat("player", 3);
    STAstringa = '<h1 align="center">|c' .. HeadColor ..'Stamina:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. tostring(STAstat)  .. '|r</p>'
    INTbase, INTstat, INTposBuff, INTnegBuff = UnitStat("player", 4);
    INTstringa = '<h1 align="center">|c' .. HeadColor ..'Intelligence:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. tostring(INTstat)  .. '|r</p>'
    SPIbase, SPIstat, SPIposBuff, SPInegBuff = UnitStat("player", 5);
    SPIstringa = '<h1 align="center">|c' .. HeadColor ..'Spirit:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. tostring(SPIstat)  .. '|r</p>'

    
    if TipoAttacco == 'melee' then
        critChance = tostring(GetCritChance())
        critChance = string.sub(critChance,1,5) .. '%'
        AP, posBuff, negBuff = UnitAttackPower("player");
        AP = tostring(AP + posBuff + negBuff)
        AtkString = "Melee"
        posBuff = tostring(posBuff)
        negBuff = tostring(negBuff)
        stat1 = STRstringa
        stat2 = AGIstringa

        content = stat1 .. stat2

    elseif TipoAttacco == 'ranged' then
        critChance = format("%.2f%%", GetRangedCritChance());
        AP, posBuff, negBuff = UnitRangedAttackPower("player");
        AP = tostring(AP + posBuff + negBuff)
        AtkString = "Ranged"
        posBuff = tostring(posBuff)
        negBuff = tostring(negBuff)
        stat1 = STRstringa
        stat2 = AGIstringa

        content = stat1 .. stat2

    elseif TipoAttacco == 'aggroman' then
        critChance = format("%.2f%%", GetRangedCritChance());
        AP, posBuff, negBuff = UnitRangedAttackPower("player");
        AP = tostring(AP + posBuff + negBuff)
        AtkString = "Aggroman"
        posBuff = tostring(posBuff)
        negBuff = tostring(negBuff)

        baseArmor , effectiveArmor, armor, posBuff, negBuff = UnitArmor("player")
        ArmorValue = tostring(effectiveArmor)
        ARMORstringa = '<h1 align="center">|c' .. HeadColor ..'Armor:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. ArmorValue  .. '|r</p>'

        if DLAPI then DLAPI.DebugLog(addonName, "Base armor presa" ) end
        

        baseDefense, armorDefense = UnitDefense("player");
        DefenseValue = tostring(baseDefense)
        DEFStringa = '<h1 align="center">|c' .. HeadColor ..'Defense:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. DefenseValue  .. '|r</p>'

        -- /console scriptErrors 1
        if DLAPI then DLAPI.DebugLog(addonName, "Defense presa" ) end

        DodgeChance = format("%.2f%%", GetDodgeChance())
        DODGESTringa = '<h1 align="center">|c' .. HeadColor ..'Dodge:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. DodgeChance  .. '|r</p>'
        
        if DLAPI then DLAPI.DebugLog(addonName, "Dodge presa" ) end

        ParryChance = format("%.2f%%", GetParryChance())
        PARRYTringa = '<h1 align="center">|c' .. HeadColor ..'Parry:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. ParryChance  .. '|r</p>'
        
        if DLAPI then DLAPI.DebugLog(addonName, "Parry presa" ) end

        BlockChance = format("%.2f%%", GetBlockChance())
        BLOCKSTringa = '<h1 align="center">|c' .. HeadColor ..'Block:|r</h1><p align="center">|c' .. BodyColor .. ' ' .. BlockChance  .. '|r</p>'
        
        if DLAPI then DLAPI.DebugLog(addonName, "Block presa" ) end

        
        content = ARMORstringa .. DEFStringa .. DODGESTringa .. PARRYTringa .. BLOCKSTringa .. STRstringa .. AGIstringa

        if DLAPI then DLAPI.DebugLog(addonName, "Content creato" ) end

    elseif string.find(TipoAttacco, "spell") then
        school = 1
        
        stat1 = INTstringa
        stat2 = SPIstringa

        content = stat1 .. stat2

        if string.find(TipoAttacco, "physical") then
            school = 1
            AtkString = 'Physical'
        elseif string.find(TipoAttacco, "holy") then
            school = 2
            AtkString = 'Holy'
            HealBonus = tostring(GetSpellBonusHealing())
            HealingBonus = '<p align="center">|c' .. HeadColor ..'Healing:|r</p><p align="center">|c' .. BodyColor .. ' ' .. HealBonus .. '|r </p>'
        elseif string.find(TipoAttacco, "fire") then
            school = 3
            AtkString = 'Fire'
        elseif string.find(TipoAttacco, "nature") then
            school = 4
            AtkString = 'Nature'
        elseif string.find(TipoAttacco, "frost") then
            school = 5
            AtkString = 'Frost'
        elseif string.find(TipoAttacco, "shadow") then
            school = 6
            AtkString = 'Shadow'
        elseif string.find(TipoAttacco, "arcane") then
            school = 7
            AtkString = 'Arcane'
        else
            school = 2
            AtkString = 'Holy'
        end

        critChance = format("%.2f%%", GetSpellCritChance(school));
        AP = GetSpellBonusDamage(school);
        AP = tostring(AP)

        posBuff = '0'
        negBuff = '0'
    else
        critChance = 'err%'
        AP = 'err'
        posBuff = 'err'
        negBuff = 'err'
        AtkString = 'err'
        content = 'err'
    end

    RaikFrameStat:SetText('\
    <html>\
    <body>\
        <h1 align="center">RaikStatistics</h1>\
        <p align="center">|c' .. HeadColor ..'' .. AtkString .. 'AP:|r</p><p align="center">|c' .. BodyColor .. ' ' .. AP .. '|r</p>\
        <p align="center">|c' .. HeadColor ..'' .. AtkString .. 'Crit:|r</p><p align="center">|c' .. BodyColor .. ' ' .. critChance .. '|r</p>\
        ' .. HealingBonus .. '\
        ' .. content .. '\
    </body>\
</html>');
    RaikFrameStat:SetFont(FONTTYPE, FONTSIZE);
    RaikFrameStat.texture:SetColorTexture(SfondoR, SfondoG, SfondoB); 
    RaikFrameStat.texture:SetAlpha(SfondoA);
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
    TIPOUPDATE = msg
    text_relaod(msg)
end

SLASH_RAIKFONT1 = "/RaikFont"
SlashCmdList["RAIKFONT"] = function(msg)
    change_font(msg)
end


local f = CreateFrame("Frame");
function f:onUpdate(sinceLastUpdate)
	self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate;
	if ( self.sinceLastUpdate >= 1 ) then -- in seconds
		text_relaod(TIPOUPDATE)
		self.sinceLastUpdate = 0;
	end
end
f:SetScript("OnUpdate",f.onUpdate)
