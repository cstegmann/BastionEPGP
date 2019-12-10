local addonName, bepgp = ...
local moduleName = addonName.."_bossep"
local bepgp_bossep = bepgp:NewModule(moduleName,"AceEvent-3.0","AceHook-3.0")

--Placeholder? I have absolutely no boss localisation at the moment.
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local npcCounter = 0;

--move this to bepgp.VARS.autoAwardBossEP?
local autoAwardBossEP = true;
local autoAwardMcEP = true;
local autoAwardBwlEP = true;
local autoAwardZgEP = false;
local autoAwardAq20EP = false;
local autoAwardAq40EP = true;
local autoAwardOnyEP = true;
local autoAwardNaxxEP = true;
local autoAwardWorldBossEP = false;

local onyBosses = {
  ["Onyxia"] = 80,
}

local mcBosses = {
  ["Lucifron"] = 50,
  ["Magmadar"] = 50,
  ["Gehennas"] = 50,
  ["Garr"] = 50,
  ["Baron Geddon"] = 50,
  ["Shazzrah"] = 50,
  ["Sulfuron Harbinger"] = 50,
  ["Golemagg the Incinerator"] = 50,
  ["Majordomo Executus"] = 50,
  ["Ragnaros"] = 70,
}

local bwlBosses = {
  ["Razorgore the Untamed"] = 70,
	["Vaelastrasz the Corrupt"] = 70,
	["Broodlord Lashlayer"] = 70,
	["Firemaw"] = 70,
	["Ebonroc"] = 70,
	["Flamegor"] = 70,
	["Chromaggus"] = 70,
	["Nefarian"] = 100,
}

local zgBosses = {
  ["High Priest Venoxis"] = 20,
	["High Priestess Jeklik"] = 20,
	["High Priestess Mar'li"] = 20,
	["High Priest Thekal"] = 20,
	["High Priestess Arlokk"] = 20,
	["Gri'lek"] = 20,
	["Hazza'rah"] = 20,
	["Renataki"] = 20,
	["Wushoolay"] = 20,
	["Bloodlord Mandokir"] = 20,
	["Jin'do the Hexxer"] = 20,
	["Gahz'ranka"] = 20,
	["Hakkar"] = 30,
}

local aq20Bosses = {
  ["Kurinnaxx"] = 30,
	["General Rajaxx"] = 30,
	["Moam"] = 30,
	["Buru the Gorger"] = 30,
	["Ayamiss the Hunter"] = 30,
	["Ossirian the Unscarred"] = 40,
}

local aq40Bosses = {
  ["The Prophet Skeram"] = 100,
  ["Battleguard Sartura"] = 100,
  ["Fankriss the Unyielding"] = 100,
  ["Princess Huhuran"] = 100,
  ["Princess Yauj"] = 100,
  ["Vem"] = 100,
  ["Lord Kri"] = 100,
  ["Viscidus"] = 100,
  ["Ouro"] = 100,
  ["Emperor Vek'lor"] = 100,
  ["Emperor Vek'nilash"] = 100,
  ["C'Thun"] = 120,
}

local naxxBosses = {
  ["Anub'Rekhan"] = 120,
	["Grand Widow Faerlina"] = 120,
	["Maexxna"] = 150,

	["Noth the Plaguebringer"] = 120,
	["Heigan the Unclean"] = 120,
	["Loatheb"] = 150,

	["Instructor Razuvious"] = 120,
	["Gothik the Harvester"] = 120,
	["Highlord Mograine"] = 150,
	["Thane Korth'azz"] = 150,
	["Lady Blaumeux"] = 150,
	["Sir Zeliek"] = 150,

	["Patchwerk"] = 120,
	["Grobbulus"] = 120,
	["Gluth"] = 120,
	["Thaddius"] = 150,

	["Sapphiron"] = 150,
	["Kel'Thuzad"] = 150,
}

local worldBosses = {
  ["Doom Lord Kazzak"] = 70,
	["Azuregos"] = 70,
	["Teremus the Devourer"] = 70,
	["Emeriss"] = 70,
	["Lethon"] = 70,
	["Ysondre"] = 70,
	["Taerar"] = 70,
}

bossNameIndex = {


}

function bepgp_bossep:OnEnable()
  --combat log event
  self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "combatLog")
  --NPC Emote
  self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "npcEmote")
  --NPC Yell
  self:RegisterEvent("CHAT_MSG_MONSTER_YELL", "npcYell")
  --Combat starts, PLAYER_REGEN_DISABLED means normal regen is halted going to combat regen
  self:RegisterEvent("PLAYER_REGEN_DISABLED", "combatStart")
end

--combatlog event handler
function bepgp_bossep:combatLog(event, name)
  local _, action, _, _, _, _, _, guid, name = CombatLogGetCurrentEventInfo();
  if action == "UNIT_DIED" and string.find(guid, "Creature") then
    --Ragnaros kills Majordomo in an event before the Ragnaros encounter. Skeram clones himself.
    if name == "Majordomo Executus" or name == "The Prophet Skeram" then return; end
    --Bosses with special death conditions or multi-boss encounters.
	  if name == "Flamewaker Elite" or name == "Flamewaker Healer" then
	    bepgp_bossep:handleMultiEncounter("Majordomo Executus", 1);
    elseif name == "Princess Yauj" or name == "Vem" or name == "Lord Kri" then
      bepgp_bossep:handleMultiEncounter(name, 1);
    elseif name == "Emperor Vek'lor" or name == "Emperor Vek'nilash" then
      bepgp_bossep:handleEncounterHelper(name, 1);
    --boss just dies normally
    elseif name == "Highlord Mograine" or name == "Thane Korth'azz" or name == "Lady Blaumeux" or name == "Sir Zeliek" then
      bepgp_bossep:handleMultiEncounter(name, 1)
	  elseif bepgp_bossep:isBoss(name) then
	    bepgp_bossep:awardBossEP(name);
	  end
  elseif action == "SPELL_CAST_SUCCESS" then
    local spellID, spellName;
	  _, _, _, _, name, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo();
  end
end

--boss emote event handler
function bepgp_bossep:npcEmote()

end

--npc yell event handler
function bepgp_bossep:npcYell(event, text, npc)
  if npc == "The Prophet Skeram" and text == "You only delay... the inevetable." then
    bepgp_bossep:awardBossEP("The Prophet Skeram")
  end
end

--combat starts event handler
function bepgp_bossep:combatStart()
  npcCounter = 0;
end

function bepgp_bossep:awardBossEP(name)
  local EP = 0;
  if bepgp:lootMaster() then
    if bepgp_bossep:isOnyBoss(name) and autoAwardOnyEP then
      EP = tonumber(onyBosses[name])
      bepgp:award_raid_ep(EP)
    elseif bepgp_bossep:isMcBoss(name) and autoAwardMcEP then
      EP = tonumber(mcBosses[name])
      bepgp:award_raid_ep(EP)
    elseif bepgp_bossep:isBwlBoss(name) and autoAwardBwlEP then
      EP = tonumber(bwlBosses[name])
      bepgp:award_raid_ep(EP)
    elseif bepgp_bossep:isZgBoss(name) and autoAwardZgEP then
      EP = tonumber(zgBosses[name])
      bepgp:award_raid_ep(EP)
    elseif bepgp_bossep:isAq20Boss(name) and autoAwardAq20EP then
      EP = tonumber(aq20Bosses[name])
      bepgp:award_raid_ep(EP)
    elseif bepgp_bossep:isAq40Boss(name) and autoAwardAq40EP then
      EP = tonumber(aq40Bosses[name])
      bepgp:award_raid_ep(EP)
    elseif bepgp_bossep:isNaxxBoss(name) and autoAwardNaxxEP then
      EP = tonumber(naxxBosses[name])
      bepgp:award_raid_ep(EP)
    elseif bepgp_bossep:isWorldBoss(name) and autoAwardWorldBossEP then
      EP = tonumber(worldBosses[name])
      bepgp:award_raid_ep(EP)
    end
  end
end

--more than one mob needs to die to kill a boss
function bepgp_bossep:handleMultiEncounter(name, num)
  npcCounter = npcCounter + num;
  if name == "Majordomo Executus" and npcCounter == 8 then
	  bepgp_bossep:awardBossEP("Majordomo Executus");
  elseif (name == "Princess Yauj" or name == "Vem" or name == "Lord Kri") and npcCounter == 3 then
    bepgp_bossep:awardBossEP("Lord Kri");
  elseif (name == "Emperor Vek'lor" or name == "Emperor Vek'nilash") and npcCounter == 2 then
    bepgp_bossep:awardBossEP(name);
  elseif (name == "Highlord Mograine" or name == "Thane Korth'azz" or name == "Lady Blaumeux" or name == "Sir Zeliek") and npcCounter == 4 then
    bepgp_bossep:awardBossEP(name);
  end
end




--HELPER FUNCTIONS

--work in progress, might need this for something later.
function bepgp_bossep:handleEncounterHelper(name)
  return name;
end

function bepgp_bossep:isOnyBoss(name)
  return onyBosses[name] ~= nil;
end

function bepgp_bossep:isMcBoss(name)
  return mcBosses[name] ~= nil;
end

function bepgp_bossep:isBwlBoss(name)
  return bwlBosses[name] ~= nil;
end

function bepgp_bossep:isZgBoss(name)
  return zgBosses[name] ~= nil;
end

function bepgp_bossep:isAq20Boss(name)
  return aq20Bosses[name] ~= nil;
end

function bepgp_bossep:isAq40Boss(name)
  return aq40Bosses[name] ~= nil;
end

function bepgp_bossep:isNaxxBoss(name)
  return naxxBosses[name] ~= nil;
end

function bepgp_bossep:isWorldBoss(name)
  return worldBosses[name] ~= nil;
end

function bepgp_bossep:isBoss(name)
  return (bepgp_bossep:isOnyBoss(name) or bepgp_bossep:isMcBoss(name) or bepgp_bossep:isBwlBoss(name) or bepgp_bossep:isZgBoss(name) or bepgp_bossep:isAq20Boss(name) or bepgp_bossep:isAq40Boss(name) or bepgp_bossep:isNaxxBoss(name) or bepgp_bossep:isWorldBoss(name))
end


--bepgp:suggestEPAward
--bepgp:award_raid_ep(ep)
--bepgp:givename_ep(getname,ep)
