-- ui.lua

-- Main frame
RaikFrameStat = CreateFrame("Frame", "RaikFrameStat", UIParent, "BasicFrameTemplateWithInset")
RaikFrameStat:SetSize(150, 150)
RaikFrameStat:SetPoint("CENTER")
RaikFrameStat:SetMovable(true)
RaikFrameStat:EnableMouse(true)
RaikFrameStat:SetResizable(true)
RaikFrameStat:SetResizeBounds(50,50)
RaikFrameStat:SetClampedToScreen(true)

-- Dragging
RaikFrameStat:RegisterForDrag("LeftButton")
RaikFrameStat:SetScript("OnDragStart", RaikFrameStat.StartMoving)
RaikFrameStat:SetScript("OnDragStop", RaikFrameStat.StopMovingOrSizing)

-- Title (usiamo la stringa localizzata L.WINDOW_TITLE)
RaikFrameStat.TitleText:SetText(L.WINDOW_TITLE or "Raik Window")

-- Content area
text = RaikFrameStat:CreateFontString(nil, "OVERLAY", "GameFontNormal")
text:SetPoint("TOPLEFT", RaikFrameStat, "TOPLEFT", 10, -30)
text:SetJustifyH("LEFT")
text:SetFont(FONTTYPE, FONTSIZE)

-- Resize handle (angolo in basso a destra)
local resizeBtn = CreateFrame("Button", nil, RaikFrameStat)
resizeBtn:SetSize(16, 16)
resizeBtn:SetPoint("BOTTOMRIGHT", -6, 6)
resizeBtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
resizeBtn:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
resizeBtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
resizeBtn:SetScript("OnMouseDown", function() RaikFrameStat:StartSizing("BOTTOMRIGHT") end)
resizeBtn:SetScript("OnMouseUp",   function() RaikFrameStat:StopMovingOrSizing()   end)

-- Font-size buttons
local plusBtn = CreateFrame("Button", nil, RaikFrameStat, "UIPanelButtonTemplate")
plusBtn:SetSize(20, 20)
plusBtn:SetPoint("BOTTOMLEFT", 5, 5)
plusBtn:SetText("+")
plusBtn:SetScript("OnClick", function()
    FONTSIZE = FONTSIZE + 1
    text:SetFont(FONTTYPE, FONTSIZE)
    text_reload()
end)

local minusBtn = CreateFrame("Button", nil, RaikFrameStat, "UIPanelButtonTemplate")
minusBtn:SetSize(20, 20)
minusBtn:SetPoint("LEFT", plusBtn, "RIGHT", 5, 0)
minusBtn:SetText("-")
minusBtn:SetScript("OnClick", function()
    FONTSIZE = FONTSIZE - 1
    text:SetFont(FONTTYPE, FONTSIZE)
    text_reload()
end)

-- Mouse wheel for font-size
RaikFrameStat:EnableMouseWheel(true)
RaikFrameStat:SetScript("OnMouseWheel", function(_, delta)
    FONTSIZE = FONTSIZE + delta
    text:SetFont(FONTTYPE, FONTSIZE)
    text_reload()
end)

-- Right-click apre il dropdown (definito in menu.lua)
RaikFrameStat:SetScript("OnMouseDown", function(self, button)
    if button == "RightButton" and dropdown then
        ToggleDropDownMenu(1, nil, dropdown, self, 0, 0)
    end
end)

-- Aggiornamento periodico (ogni 1 secondo)
local updater = CreateFrame("Frame")
updater.elapsed = 0
updater:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = self.elapsed + elapsed
    if self.elapsed >= 1 then
        text_reload()
        self.elapsed = 0
    end
end)
