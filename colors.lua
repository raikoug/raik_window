function RGBtoHexa(r, g, b)
    return string.format("FF%02X%02X%02X", r * 255, g * 255, b * 255)
end

function cambiaColoreHeadRGB(r, g, b)
    HeadR, HeadG, HeadB = r, g, b
    HeadColor = RGBtoHexa(r, g, b)
    text_reload()
end

function cambiaColoreBodyRGB(r, g, b)
    BodyR, BodyG, BodyB = r, g, b
    BodyColor = RGBtoHexa(r, g, b)
    text_reload()
end

function ShowColorPicker(r, g, b, a, changedCallback)
    ColorPickerFrame.func = changedCallback
    ColorPickerFrame.opacityFunc = changedCallback
    ColorPickerFrame.cancelFunc = changedCallback

    ColorPickerFrame:SetColorRGB(r, g, b)
    ColorPickerFrame.hasOpacity = (a ~= nil)
    ColorPickerFrame.opacity = a
    ColorPickerFrame.previousValues = { r, g, b, a }

    ColorPickerFrame:Hide()
    ColorPickerFrame:Show()
end

function change_header_colore()
    local r, g, b = ColorPickerFrame:GetColorRGB()
    cambiaColoreHeadRGB(r, g, b)
end

function change_body_colore()
    local r, g, b = ColorPickerFrame:GetColorRGB()
    cambiaColoreBodyRGB(r, g, b)
end
