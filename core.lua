addonName = "RaikWindow"

-- SavedVariables init
CHECKED_VALUES = CHECKED_VALUES or {}
FONTSIZE = FONTSIZE or 11
FONTTYPE = FONTTYPE or 'Fonts\\FRIZQT__.TTF'
HeadColor = HeadColor or "ffee4400"
BodyColor = BodyColor or "FF0000FF"
HeadR = HeadR or 1
HeadG = HeadG or 0.3
HeadB = HeadB or 0
BodyR = BodyR or 0
BodyG = BodyG or 0
BodyB = BodyB or 1

if DLAPI then
    DLAPI.DebugLog(addonName, "Addon Loaded")
end

-- slash commands
SLASH_SHOWRAIKWINDOW1 = "/ShowRaikWindow"
SlashCmdList["SHOWRAIKWINDOW"] = function() RaikFrameStat:Show() end

SLASH_HIDERAIKWINDOW1 = "/HideRaikWindow"
SlashCmdList["HIDERAIKWINDOW"] = function() RaikFrameStat:Hide() end

SLASH_RAIKRELOAD1 = "/RaikReload"
SlashCmdList["RAIKRELOAD"] = function() text_reload() end

SLASH_RAIKFONT1 = "/RaikFont"
SlashCmdList["RAIKFONT"] = function(msg) change_font(msg) end
