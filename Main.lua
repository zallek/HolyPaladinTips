local _, tbl = ...; 

local Loc = LibStub("AceLocale-3.0"):GetLocale ("HolyPaladinTips")

local spellsByLevel = {
	[1] = {{id = 465, cost = 10}},
	[4] = {{id = 19740, cost = 100}, {id = 20271, cost = 100}},
	[6] = {{id = 498, cost = 100}, {id = 639, cost = 100, requiredIds = {635}}, {id = 21082, cost = 100}},
	[8] = {{id = 853, cost = 100}, {id = 3127, cost = 100}, {id = 1152, cost = 100}},
	[10] = {
		{id = 1022, cost = 300},
		{id = 10290, cost = 300, requiredIds = {465}},
		{id = 633, cost = 300},
		{id = 20287, cost = 300, requiredIds = {21084}}
	},
	[12] = {{id = 19834, cost = 1000, requiredIds = {19740}}, {id = 20162, cost = 1000, requiredIds = {21082}}},
	[14] = {{id = 19742, cost = 2000}, {id = 647, cost = 2000, requiredIds = {639}}},
	[16] = {{id = 7294, cost = 3000}, {id = 25780, cost = 3000}},
	[18] = {
		{id = 1044, cost = 3500},
		{id = 5573, cost = 3500, requiredIds = {498}},
		{id = 20288, cost = 3500, requiredIds = {20287}}
	},
	[20] = {{id = 643, cost = 4000, requiredIds = {10290}}, {id = 879, cost = 4000}, {id = 19750, cost = 4000}},
	[22] = {
		{id = 19835, cost = 4000, requiredIds = {19834}},
		{id = 19746, cost = 4000},
		{id = 1026, cost = 4000, requiredIds = {647}},
		{id = 20164, cost = 4000},
		{id = 20305, cost = 4000, requiredIds = {20162}}
	},
	[24] = {
		{id = 5599, cost = 5000, requiredIds = {1022}},
		{id = 19850, cost = 5000, requiredIds = {19742}},
		{id = 5588, cost = 5000, requiredIds = {853}},
		{id = 10322, cost = 5000},
		{id = 2878, cost = 5000}
	},
	[26] = {
		{id = 1038, cost = 6000},
		{id = 19939, cost = 6000, requiredIds = {19750}},
		{id = 10298, cost = 6000, requiredIds = {7294}},
		{id = 20289, cost = 6000, requiredIds = {20288}}
	},
	[28] = {{id = 5614, cost = 9000, requiredIds = {879}}, {id = 19876, cost = 9000}},
	[30] = {
		{id = 20116, cost = 200, requiredTalentId = 26573},
		{id = 10291, cost = 11000, requiredIds = {643}},
		{id = 19752, cost = 11000},
		{id = 1042, cost = 11000, requiredIds = {1026}},
		{id = 2800, cost = 11000, requiredIds = {633}},
		{id = 20915, cost = 200, requiredTalentId = 20375},
		{id = 20165, cost = 11000}
	},
	[32] = {
		{id = 19836, cost = 12000, requiredIds = {19835}},
		{id = 19888, cost = 12000},
		{id = 20306, cost = 12000, requiredIds = {20305}}
	},
	[34] = {
		{id = 19852, cost = 13000, requiredIds = {19850}},
		{id = 642, cost = 13000},
		{id = 19940, cost = 13000, requiredIds = {19939}},
		{id = 20290, cost = 13000, requiredIds = {20289}}
	},
	[36] = {
		{id = 5615, cost = 14000, requiredIds = {5614}},
		{id = 19891, cost = 14000},
		{id = 10324, cost = 14000, requiredIds = {10322}},
		{id = 10299, cost = 14000, requiredIds = {10298}}
	},
	[38] = {
		{id = 10278, cost = 16000, requiredIds = {5599}},
		{id = 3472, cost = 16000, requiredIds = {1042}},
		{id = 20166, cost = 16000},
		{id = 5627, cost = 16000, requiredIds = {2878}}
	},
	[40] = {
		{id = 19977, cost = 20000},
		{id = 20912, cost = 900, requiredTalentId = 20911},
		{id = 20922, cost = 1000, requiredIds = {20116}, requiredTalentId = 26573},
		{id = 1032, cost = 20000, requiredIds = {10291}},
		{id = 5589, cost = 20000, requiredIds = {5588}},
		--{id = 750, cost = 20000},
		{id = 20918, cost = 1000, requiredIds = {20915}, requiredTalentId = 20375},
		{id = 20347, cost = 20000, requiredIds = {20165}},
		{id = 19895, cost = 20000, requiredIds = {19876}}
	},
	[42] = {
		{id = 19837, cost = 21000, requiredIds = {19836}},
		{id = 4987, cost = 21000},
		{id = 19941, cost = 21000, requiredIds = {19940}},
		{id = 20291, cost = 21000, requiredIds = {20290}},
		{id = 20307, cost = 21000, requiredIds = {20306}}
	},
	[44] = {
		{id = 19853, cost = 22000, requiredIds = {19852}},
		{id = 10312, cost = 22000, requiredIds = {5615}},
		{id = 19897, cost = 22000, requiredIds = {19888}},
		{id = 24275, cost = 22000}
	},
	[46] = {
		{id = 6940, cost = 24000},
		{id = 10328, cost = 24000, requiredIds = {3472}},
		{id = 10300, cost = 24000, requiredIds = {10299}}
	},
	[48] = {
		{id = 19899, cost = 26000, requiredIds = {19891}},
		{id = 20929, cost = 1170, requiredTalentId = 20473},
		{id = 20772, cost = 26000, requiredIds = {10324}},
		{id = 20356, cost = 26000, requiredIds = {20166}}
	},
	[50] = {
		{id = 19978, cost = 28000, requiredIds = {19977}},
		{id = 20913, cost = 1260, requiredIds = {20912}, requiredTalentId = 20911},
		{id = 20923, cost = 1400, requiredIds = {20922}, requiredTalentId = 26573},
		{id = 10292, cost = 28000, requiredIds = {1032}},
		{id = 1020, cost = 28000, requiredIds = {642}},
		{id = 19942, cost = 28000, requiredIds = {19941}},
		{id = 20927, cost = 1260, requiredTalentId = 20925},
		{id = 2812, cost = 28000},
		{id = 10310, cost = 28000, requiredIds = {2800}},
		{id = 20919, cost = 1260, requiredIds = {20918}, requiredTalentId = 20375},
		{id = 20348, cost = 28000, requiredIds = {20347}},
		{id = 20292, cost = 28000, requiredIds = {20291}}
	},
	[52] = {
		{id = 19838, cost = 34000, requiredIds = {19837}},
		{id = 10313, cost = 34000, requiredIds = {10312}},
		{id = 25782, cost = 46000, requiredIds = {19838}},
		{id = 24274, cost = 34000, requiredIds = {24275}},
		{id = 20308, cost = 34000, requiredIds = {20307}},
		{id = 19896, cost = 34000, requiredIds = {19895}},
		{id = 10326, cost = 34000, requiredIds = {5627}}
	},
	[54] = {
		{id = 20729, cost = 40000, requiredIds = {6940}},
		{id = 19854, cost = 40000, requiredIds = {19853}},
		{id = 25894, cost = 40000, requiredIds = {19854}},
		{id = 10308, cost = 40000, requiredIds = {5589}},
		{id = 10329, cost = 40000, requiredIds = {10328}}
	},
	[56] = {
		{id = 19898, cost = 42000, requiredIds = {19897}},
		{id = 20930, cost = 2100, requiredIds = {20929}, requiredTalentId = 20473},
		{id = 10301, cost = 42000, requiredIds = {10300}}
	},
	[58] = {
		{id = 19943, cost = 44000, requiredIds = {19942}},
		{id = 20293, cost = 44000, requiredIds = {20292}},
		{id = 20357, cost = 44000, requiredIds = {20356}}
	},
	[60] = {
		{id = 19979, cost = 46000, requiredIds = {19978}},
		{id = 20914, cost = 2070, requiredIds = {20913}, requiredTalentId = 20911},
		{id = 20924, cost = 2300, requiredIds = {20923}, requiredTalentId = 26573},
		{id = 10293, cost = 46000, requiredIds = {10292}},
		{id = 10314, cost = 46000, requiredIds = {10313}},
		{id = 19900, cost = 46000, requiredIds = {19899}},
		{id = 25898, cost = 2070, requiredTalentId = 20217},
		{id = 25890, cost = 46000, requiredIds = {19979}},
		{id = 25916, cost = 41400},
		{id = 25895, cost = 46000, requiredIds = {1038}},
		{id = 25899, cost = 2070, requiredIds = {20914}, requiredTalentId = 20911},
		{id = 25918, cost = 46000},
		{id = 24239, cost = 46000, requiredIds = {24274}},
		{id = 20928, cost = 2070, requiredIds = {20927}, requiredTalentId = 20925},
		{id = 10318, cost = 46000, requiredIds = {2812}},
		{id = 20773, cost = 46000, requiredIds = {20772}},
		{id = 20920, cost = 2070, requiredIds = {20919}, requiredTalentId = 20375},
		{id = 20349, cost = 46000, requiredIds = {20348}}
	}
}

function round2(num)    
    mult = 10^(2);
    return math.floor(num * mult + 0.5) / mult;
end

function starts_with(str, start)
    return str:sub(1, #start) == start
end

function isLowLevelSpell(spellId)
    for lvl, spells in pairs(spellsByLevel) do
        for _, spell in pairs(spells) do
            if spell.id == spellId then
                return lvl <= 20
            end
        end
    end
    return true
end

function getSpellLevel(spellId)
    for lvl, spells in pairs(spellsByLevel) do
        for _, spell in pairs(spells) do
            if spell.id == spellId then
                return lvl
            end
        end
    end
    return 1
end

function isSupportedSpell(spellId)
	if spellId == nil then
		return false
	end
    local name = GetSpellInfo(spellId)
    if (name == Loc["CAPACITY_FLASH_OF_LIGHT"] or name == Loc["CAPACITY_HOLY_LIGHT"]) then
        return true
    end
    return false
end

local mp5 = 0

function getSpellValues(spellId)
    if not ExtTip then
        CreateFrame("GameTooltip","ExtTip",UIParent,"GameTooltipTemplate")
        ExtTip:SetOwner(UIParent,"ANCHOR_NONE")
    end
    ExtTip:SetSpellByID(spellId)
    local values = { id = spellId, min = 0, max = 0, castTime = 0, cost = 0, avg = 0, hps = 0 }
    local idx = 0
    local texts = { ExtTipTextLeft1:GetText(), ExtTipTextLeft2:GetText(), ExtTipTextLeft3:GetText(), ExtTipTextLeft4:GetText(), ExtTipTextLeft5:GetText(), ExtTipTextLeft6:GetText(), ExtTipTextLeft7:GetText(), ExtTipTextLeft8:GetText() }
    local text = ""
    for _,v in pairs(texts) do
        if starts_with(v, Loc["CAPACITY_HEALING_DESCRIPTION_START"]) then
            text = v
          break
        end
      end
    for value in string.gmatch(text, "%d+") do
        if idx == 0 then
            values.min = tonumber(value)
        elseif idx == 1 then
            values.max = tonumber(value)
        end
        idx = idx + 1
    end
    
    local name, rank, icon, castTime = GetSpellInfo(spellId)
    values.castTime = castTime / 1000

    -- calculate the contribution from +healing power
    local levelPenalty = 1
    if isLowLevelSpell(spellId) then
        levelPenalty = 1 - ((20 - getSpellLevel(spellId)) * 0.0375)
    end
    local bonusHealing = GetSpellBonusHealing() * (math.max(1.5, values.castTime) / 3.5) * levelPenalty
    values.min = math.floor(values.min + bonusHealing)
    values.max = math.floor(values.max + bonusHealing)
    values.avg = (values.min + values.max) / 2

    local costs = GetSpellPowerCost(spellId)
    values.cost = costs[1].cost
    values.hps = values.avg / math.max(1, values.castTime)
    local regen = GetPowerRegen();
    if regen > 1 then
        mp5 = regen
    end
    values.regen = manaRegen
    values.critChance = GetSpellCritChance(2) / 100
    values.cost = values.cost * (1 - values.critChance)
    values.mps = values.cost / math.max(1, values.castTime) - (mp5 / 5)

	if values.mps <= 0 then
		values.oomFull = "never"
		values.oom = "never"
	else
		local mana = UnitPower("player");
		local maxMana = UnitPowerMax("player");
		values.oomFull = maxMana / values.mps / 60
		values.oom = mana / values.mps / 60
	end

    return values
end

function isPaladin()
	localizedClass, englishClass, classIndex = UnitClass("player");
	return classIndex == 2
end

function numberToTime(num)
	if tonumber(num) == nil then
		return num
	end
	local mins = math.floor(num)
    local secs = math.floor((num % 1) / 1 * 60)
    if secs < 10 then
        secs = "0"..secs
	end
	return mins.. ":"..secs
end

function extToolTip(spellId)
    local spell = getSpellValues(spellId)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine(Loc["TOOLTIP_HEALING"])
    GameTooltip:AddDoubleLine(Loc["TOOLTIP_HEALING_PER_CAST"], spell.min.." to "..spell.max, 1, 1, 1, 0, 1, 0)
    GameTooltip:AddDoubleLine(Loc["TOOLTIP_HEALING_PER_SECOND"], math.floor(spell.hps), 1, 1, 1, 0, 1, 0)
    GameTooltip:AddDoubleLine(Loc["TOOLTIP_HEALING_PER_MANA"], round2(spell.avg / spell.cost), 1, 1, 1, 0, 1, 0)
    GameTooltip:AddLine(Loc["TOOLTIP_OOM"])
    GameTooltip:AddDoubleLine(Loc["TOOLTIP_OOM_FROM_FULL"],numberToTime(spell.oomFull), 1, 1, 1, 0, 1, 0)
    GameTooltip:AddDoubleLine(Loc["TOOLTIP_OOM_FROM_NOW"], numberToTime(spell.oom), 1, 1, 1, 0, 1, 0)
    GameTooltip:Show()
end

local SetItem = {
	SetSpellBookItem = function(tt, spellBookId, bookType)
        local skillType, id = GetSpellBookItemInfo(spellBookId, bookType)
        if isPaladin() and skillType == "SPELL" and isSupportedSpell(id) then
            --DEFAULT_CHAT_FRAME:AddMessage("spellId"..id)
            extToolTip(id)
        end
	end,
    SetAction = function(tt, slot)
		local actionType, id, subType = GetActionInfo(slot)
        if isPaladin() and actionType == "spell" and isSupportedSpell(id) then
			extToolTip(id)
		elseif isPaladin() and actionType == "macro" and isSupportedSpell(GetMacroSpell(id)) then
			extToolTip(GetMacroSpell(id))
		end
	end,
}

for method, func in pairs(SetItem) do
	hooksecurefunc(GameTooltip, method, func)
end