RaikFonts = {}

local fontList = {
    "2002.ttf", "2002B.ttf", "ARHei.ttf", "ARIALN.TTF", "ARKai_C.ttf", "ARKai_T.ttf",
    "bHEI00M.ttf", "bHEI01B.ttf", "bKAI00M.ttf", "bLEI00D.ttf",
    "FRIZQT__.TTF", "FRIZQT___CYR.TTF", "K_Damage.TTF", "K_Pagetext.TTF",
    "MORPHEUS.TTF", "MORPHEUS_CYR.TTF", "NIM_____.ttf", "SKURRI.TTF", "SKURRI_CYR.TTF"
}

for _, fontName in ipairs(fontList) do
    local name = fontName:gsub("[%.]", "") -- remove dots for valid object name
    local obj = CreateFont(name)
    obj:SetFont("Fonts\\" .. fontName, FONTSIZE)
    obj:SetFontObject("GameFontNormal")
    RaikFonts[fontName] = obj
end

function change_font(font)
    local fontPath = "Fonts\\" .. font
    if RaikFrameStat then
        RaikFrameStat:SetFont(fontPath, FONTSIZE)
    end
    if text then
        text:SetFont(fontPath, FONTSIZE)
    end
    FONTTYPE = fontPath
    text_reload()
end
