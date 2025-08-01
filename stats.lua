-- stats.lua

local addonName, ns = ...
local text = ns.text  

-- Utility to check if a value is in a table
local function has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then return true end
    end
    return false
end

-- Main function to gather and display selected stats
function text_reload()
    local content = ""
    local head = HeadColor
    local body = BodyColor

    -- Defences
    if has_value(CHECKED_VALUES, 'Defences_Armor') then
        local _, effectiveArmor = UnitArmor('player')
        content = content .. string.format("|c%sArmor:|r %d\n", head, effectiveArmor)
    end
    if has_value(CHECKED_VALUES, 'Defences_Block') then
        local blockChance = format("%.2f%%", GetBlockChance())
        content = content .. string.format("|c%sBlock:|r %s\n", head, blockChance)
    end
    if has_value(CHECKED_VALUES, 'Defences_Dodge') then
        local dodgeChance = format("%.2f%%", GetDodgeChance())
        content = content .. string.format("|c%sDodge:|r %s\n", head, dodgeChance)
    end
    if has_value(CHECKED_VALUES, 'Defences_Parry') then
        local parryChance = format("%.2f%%", GetParryChance())
        content = content .. string.format("|c%sParry:|r %s\n", head, parryChance)
    end
    if has_value(CHECKED_VALUES, 'Defences_Defense') then
        local defense = select(2, UnitDefense('player')) or 0
        content = content .. string.format("|c%sDefense:|r %d\n", head, defense)
    end

    -- Melee stats: Power, Damage, Speed, DPS, Crit, Hit
    if has_value(CHECKED_VALUES, 'Melee_Power') then
        local ap, posBuff, negBuff = UnitAttackPower('player')
        local totalAP = ap + posBuff + negBuff
        content = content .. string.format("|c%sMelee AP:|r %d\n", head, totalAP)
    end
    if has_value(CHECKED_VALUES, 'Melee_Damage') then
        local lowDmg, hiDmg, offLow, offHi = UnitDamage('player')
        content = content .. string.format("|c%sMelee Damage:|r %d-%d\n", head, math.floor(lowDmg), math.floor(hiDmg))
        if offLow and offHi then
            content = content .. string.format("|c%sOffhand Damage:|r %d-%d\n", head, math.floor(offLow), math.floor(offHi))
        end
    end
    if has_value(CHECKED_VALUES, 'Melee_Speed') then
        local mainSpeed, offSpeed = UnitAttackSpeed('player')
        content = content .. string.format("|c%sMain Hand Speed:|r %.2f\n", head, mainSpeed)
        if offSpeed then
            content = content .. string.format("|c%sOffhand Speed:|r %.2f\n", head, offSpeed)
        end
    end
    if has_value(CHECKED_VALUES, 'Melee_DPS') then
        local lowDmg, hiDmg, offLow, offHi = UnitDamage('player')
        local mainSpeed, offSpeed = UnitAttackSpeed('player')
        local avgMain = (lowDmg + hiDmg) / 2
        content = content .. string.format("|c%sMain Hand DPS:|r %.2f\n", head, avgMain / mainSpeed)
        if offSpeed and offLow and offHi then
            local avgOff = (offLow + offHi) / 2
            content = content .. string.format("|c%sOffhand DPS:|r %.2f\n", head, avgOff / offSpeed)
        end
    end
    if has_value(CHECKED_VALUES, 'Melee_Crit Chance') then
        local crit = format("%.2f%%", GetCritChance())
        content = content .. string.format("|c%sMelee Crit:|r %s\n", head, crit)
    end
    if has_value(CHECKED_VALUES, 'Melee_Hit Rating') then
        local hit = format("%.2f%%", GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier())
        content = content .. string.format("|c%sMelee Hit Rate:|r %s\n", head, hit)
    end

    -- Ranged stats: Power, Damage, Speed, DPS, Crit, Hit
    if has_value(CHECKED_VALUES, 'Ranged_Power') then
        local rap, posB, negB = UnitRangedAttackPower('player')
        local totalRAP = rap + posB + negB
        content = content .. string.format("|c%sRanged AP:|r %d\n", head, totalRAP)
    end
    if has_value(CHECKED_VALUES, 'Ranged_Damage') then
        local speed, low, high = UnitRangedDamage('player')
        if speed > 0 then
            content = content .. string.format("|c%sRanged Damage:|r %d-%d\n", head, math.floor(low), math.floor(high))
        end
    end
    if has_value(CHECKED_VALUES, 'Ranged_Speed') then
        local speed = select(1, UnitRangedDamage('player'))
        content = content .. string.format("|c%sRanged Speed:|r %.2f\n", head, speed)
    end
    if has_value(CHECKED_VALUES, 'Ranged_DPS') then
        local speed, low, high = UnitRangedDamage('player')
        if speed > 0 then
            local avg = (low + high) / 2
            content = content .. string.format("|c%sRanged DPS:|r %.2f\n", head, avg / speed)
        end
    end
    if has_value(CHECKED_VALUES, 'Ranged_Crit Chance') then
        local crit = format("%.2f%%", GetRangedCritChance())
        content = content .. string.format("|c%sRanged Crit:|r %s\n", head, crit)
    end
    if has_value(CHECKED_VALUES, 'Ranged_Hit Rating') then
        local hit = format("%.2f%%", GetCombatRatingBonus(CR_HIT_RANGED) + GetHitModifier())
        content = content .. string.format("|c%sRanged Hit Rate:|r %s\n", head, hit)
    end

    -- Spell stats: Bonus Healing, Hit, Haste, Mana Regen, Schools
    if has_value(CHECKED_VALUES, 'Spell_Bonus Healing') then
        local heal = GetSpellBonusHealing()
        content = content .. string.format("|c%sHealing:|r %d\n", head, heal)
    end
    if has_value(CHECKED_VALUES, 'Spell_Hit Rating') then
        local hit = GetCombatRatingBonus(CR_HIT_SPELL) + GetSpellHitModifier()
        content = content .. string.format("|c%sSpell Hit Rate:|r %.2f%%\n", head, hit)
    end
    if has_value(CHECKED_VALUES, 'Spell_Haste Rating') then
        local haste = GetCombatRatingBonus(CR_HASTE_SPELL)
        content = content .. string.format("|c%sSpell Haste:|r %.2f%%\n", head, haste)
    end
    if has_value(CHECKED_VALUES, 'Spell_Mana Regen') then
        local baseRegen, castRegen = GetManaRegen()
        content = content .. string.format("|c%sMana Regen:|r %.2f\n|c%sCast Regen:|r %.2f\n", head, baseRegen, head, castRegen)
    end
    if has_value(CHECKED_VALUES, 'Spell_Holy') then
        local school, bDmg, crit = 2, GetSpellBonusDamage(2), format("%.2f%%", GetSpellCritChance(2))
        content = content .. string.format("|c%sHoly Power:|r %d |c%sCrit:|r %s\n", head, bDmg, head, crit)
    end
    -- Similarly for Fire, Nature, Frost, Shadow, Arcane
    for _, schoolInfo in ipairs({ {3,'Fire'}, {4,'Nature'}, {5,'Frost'}, {6,'Shadow'}, {7,'Arcane'} }) do
        local schoolID, name = schoolInfo[1], schoolInfo[2]
        if has_value(CHECKED_VALUES, 'Spell_'..name) then
            local bonus = GetSpellBonusDamage(schoolID)
            local crit = format("%.2f%%", GetSpellCritChance(schoolID))
            content = content .. string.format("|c%s%s Power:|r %d |c%sCrit:|r %s\n", head, name, bonus, head, crit)
        end
    end

    -- Primary stats: Strength, Agility, Stamina, Intellect, Spirit
    local statNames = { 'Strenght', 'Agility', 'Stamina', 'Intellect', 'Spirit' }
    for idx, statKey in ipairs(statNames) do
        if has_value(CHECKED_VALUES, 'Stats_'..statKey) then
            local _, stat = UnitStat('player', idx)
            content = content .. string.format("|c%s%s:|r %d\n", head, statKey, stat)
        end
    end

    -- Update the FontString
    if text and type(text.SetText) == "function" then
        text:SetText(content)
        text:SetFont(FONTTYPE, FONTSIZE)
    end
end
