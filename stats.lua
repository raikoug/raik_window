-- stats.lua

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

    -- Defenses
    if has_value(CHECKED_VALUES, 'Defences_Armor') then
        local _, effectiveArmor = UnitArmor('player')
        content = content .. string.format("|c%sArmor:|r %d\n", HeadColor, effectiveArmor)
    end
    if has_value(CHECKED_VALUES, 'Defences_Block') then
        local blockChance = format("%.2f%%", GetBlockChance())
        content = content .. string.format("|c%sBlock:|r %s\n", HeadColor, blockChance)
    end
    if has_value(CHECKED_VALUES, 'Defences_Dodge') then
        local dodgeChance = format("%.2f%%", GetDodgeChance())
        content = content .. string.format("|c%sDodge:|r %s\n", HeadColor, dodgeChance)
    end
    if has_value(CHECKED_VALUES, 'Defences_Parry') then
        local parryChance = format("%.2f%%", GetParryChance())
        content = content .. string.format("|c%sParry:|r %s\n", HeadColor, parryChance)
    end
    if has_value(CHECKED_VALUES, 'Defences_Defense') then
        local defense = UnitDefense('player')
        content = content .. string.format("|c%sDefense:|r %d\n", HeadColor, defense)
    end

    -- Melee stats
    if has_value(CHECKED_VALUES, 'Melee_Damage') then
        local low, high = select(1, UnitDamage('player'))
        content = content .. string.format("|c%sMelee Damage:|r %d-%d\n", HeadColor, math.floor(low), math.floor(high))
    end
    if has_value(CHECKED_VALUES, 'Melee_DPS') then
        local low, high = select(1, UnitDamage('player'))
        local speed = select(1, UnitAttackSpeed('player'))
        local avg = (low + high) / 2
        content = content .. string.format("|c%sMelee DPS:|r %.2f\n", HeadColor, avg / speed)
    end
    if has_value(CHECKED_VALUES, 'Melee_Crit Chance') then
        local crit = format("%.2f%%", GetCritChance())
        content = content .. string.format("|c%sMelee Crit:|r %s\n", HeadColor, crit)
    end
    if has_value(CHECKED_VALUES, 'Melee_Hit Rating') then
        local hit = format("%.2f%%", GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier())
        content = content .. string.format("|c%sMelee Hit Rate:|r %s\n", HeadColor, hit)
    end
    if has_value(CHECKED_VALUES, 'Melee_Power') then
        local ap = select(1, UnitAttackPower('player'))
        content = content .. string.format("|c%sMelee AP:|r %d\n", HeadColor, ap)
    end
    if has_value(CHECKED_VALUES, 'Melee_Speed') then
        local mainSpeed = select(1, UnitAttackSpeed('player'))
        content = content .. string.format("|c%sMain Hand Speed:|r %.2f\n", HeadColor, mainSpeed)
    end

    -- Ranged stats
    if has_value(CHECKED_VALUES, 'Ranged_Damage') then
        local speed, low, high = select(1, UnitRangedDamage('player'))
        if speed > 0 then
            content = content .. string.format("|c%sRanged Damage:|r %d-%d\n", HeadColor, math.floor(low), math.floor(high))
        end
    end
    if has_value(CHECKED_VALUES, 'Ranged_DPS') then
        local speed, low, high = select(1, UnitRangedDamage('player'))
        if speed > 0 then
            local avg = (low + high) / 2
            content = content .. string.format("|c%sRanged DPS:|r %.2f\n", HeadColor, avg / speed)
        end
    end
    if has_value(CHECKED_VALUES, 'Ranged_Crit Chance') then
        local crit = format("%.2f%%", GetRangedCritChance())
        content = content .. string.format("|c%sRanged Crit:|r %s\n", HeadColor, crit)
    end
    if has_value(CHECKED_VALUES, 'Ranged_Power') then
        local rap = select(1, UnitRangedAttackPower('player'))
        content = content .. string.format("|c%sRanged AP:|r %d\n", HeadColor, rap)
    end
    if has_value(CHECKED_VALUES, 'Ranged_Speed') then
        local speed = select(1, UnitRangedDamage('player'))
        content = content .. string.format("|c%sRanged Speed:|r %.2f\n", HeadColor, speed)
    end

    -- Spell stats
    if has_value(CHECKED_VALUES, 'Spell_Bonus Healing') then
        local heal = GetSpellBonusHealing()
        content = content .. string.format("|c%sHealing:|r %d\n", HeadColor, heal)
    end
    if has_value(CHECKED_VALUES, 'Spell_Hit Rating') then
        local hit = GetCombatRatingBonus(CR_HIT_SPELL) + GetSpellHitModifier()
        content = content .. string.format("|c%sSpell Hit Rate:|r %d\n", HeadColor, hit)
    end
    if has_value(CHECKED_VALUES, 'Spell_Haste Rating') then
        local haste = GetCombatRating(CR_HASTE_SPELL)
        content = content .. string.format("|c%sSpell Haste:|r %d\n", HeadColor, haste)
    end
    if has_value(CHECKED_VALUES, 'Spell_Mana Regen') then
        local base, casting = GetManaRegen()
        content = content .. string.format("|c%sMana Regen:|r %.2f\n|c%sCasting Regen:|r %.2f\n", HeadColor, base, HeadColor, casting)
    end

    -- Primary stats
    if has_value(CHECKED_VALUES, 'Stats_Strenght') then
        local _, stat = UnitStat('player', 1)
        content = content .. string.format("|c%sStrength:|r %d\n", HeadColor, stat)
    end
    if has_value(CHECKED_VALUES, 'Stats_Agility') then
        local _, stat = UnitStat('player', 2)
        content = content .. string.format("|c%sAgility:|r %d\n", HeadColor, stat)
    end
    if has_value(CHECKED_VALUES, 'Stats_Stamina') then
        local _, stat = UnitStat('player', 3)
        content = content .. string.format("|c%sStamina:|r %d\n", HeadColor, stat)
    end
    if has_value(CHECKED_VALUES, 'Stats_Intellect') then
        local _, stat = UnitStat('player', 4)
        content = content .. string.format("|c%sIntellect:|r %d\n", HeadColor, stat)
    end
    if has_value(CHECKED_VALUES, 'Stats_Spirit') then
        local _, stat = UnitStat('player', 5)
        content = content .. string.format("|c%sSpirit:|r %d\n", HeadColor, stat)
    end

    -- Update the FontString
    if text then
        text:SetText(content)
        text:SetFont(FONTTYPE, FONTSIZE)
    end
end
