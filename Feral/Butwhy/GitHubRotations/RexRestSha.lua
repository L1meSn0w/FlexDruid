local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITshaman

SB.Refreshment = 167152
SB.Drink = 274914
SB.ReplenishmentDebuff = 252753
SB.GiftOftheNaaru = 59544
SB.AncestralCall = 274738
SB.LightsJudgement = 255647
SB.HealingTideTotem = 108280
SB.SpiritLinkTotem = 98008
SB.ChainHeal = 1064
SB.EarthShield = 974
SB.PurifySpirit = 77130
SB.WindShear = 57994
SB.FlameShock = 188838
SB.LavaBurst = 51505
SB.ChainLightning = 421
SB.LightningBolt = 403
SB.AstralShift = 108271
SB.HealingRain = 73920
SB.HealingStreamTotem = 5394
SB.Riptide = 61295
SB.HealingTideTotem = 108280
SB.SpiritLinkTotem = 98008
SB.HealingSurge = 8004
SB.HealingWave = 77472
SB.TidalWaves = 53390
SB.ConcentratedFlame = 295373

--Start Dispel Function
local function dispel()

  --Nature's Cure
  local ncdelay = math.random(0.5,2)

  local unit = group.dispellable(SB.PurifySpirit)
  if unit and unit.castable(SB.PurifySpirit) then
    return cast(SB.PurifySpirit, unit)
  end


  -- --Group Dispel Disease & Magic
  -- local dispel_unit = group.removable('curse', 'magic', 'poison')
  -- C_Timer.After(ncdelay,function()
  --   if dispel_unit and castable(SB.NaturesCure) then
  --     return cast(SB.NaturesCure, dispel_unit)
  --   end
  -- end)
  
  -- --Self Dispel Disease & Magic
  -- local dispel_unit = player.removable('curse', 'magic', 'poison')
  -- C_Timer.After(ncdelay,function()
  --   if dispel_unit and castable(SB.NaturesCure) then
  --     return cast(SB.NaturesCure, dispel_unit)
  --   end
  -- end)

  --Soothe
  -- if target.castable(SB.Soothe) then
  --   for i = 1, 40 do
  --     local name, _, _, count, debuff_type, _, _, _, _, spell_id = UnitAura("target", i)
  --     if name and DS[spell_id] then
  --       print("Soothing " .. name .. " off the target.")
  --       return cast(SB.Soothe, target)
  --     end
  --   end
  -- end

end
setfenv(dispel, dark_addon.environment.env)
--End Dispel Function

--Start Interrupt Function
local function interrupt()

    -- Interrupts
    -- Define random number for interrupt
    local intpercent = math.random(35,65)
    --Wind Shear
    if
      toggle("interrupts", false) and castable(SB.WindShear, "target") and -spell(SB.WindShear) == 0 and target.interrupt(intpercent, false) and target.distance <= 30 then
      print("Wind Shear @ " .. intpercent)
      return cast(SB.WindShear, "target")
    end
  
  end
  setfenv(interrupt, dark_addon.environment.env)
  --End Interrupt Function 

--Start Racials Function
local function racials()

  --Racials
  if toggle("racial", false) then

    if race == "Orc" and castable(SB.BloodFury) then
      return cast(SB.BloodFury)
    end
    if race == "Troll" and -spell(SB.Berserking) == 0 and tank.health.percent <= 70 then
      return cast(SB.Berserking)
    end
    if race == "Mag'har Orc" and castable(SB.AncestralCall) then
      return cast(SB.AncestralCall)
    end
    if race == "LightforgedDraenei" and castable(SB.LightsJudgement) then
      return cast(SB.LightsJudgement)
    end
    if race == "Draenei" and lowest.castable(SB.GiftOftheNaaru) and lowest.health.effective >= 50 then
      return cast(SB.GiftOftheNaaru, lowest)
    end

  end

end
setfenv(racials, dark_addon.environment.env)
--End Racials Function

--Start DPS Function
local function dps()

  local useessences = dark_addon.settings.fetch('rexsha_settings_useessences', true)
  local dpsplayermana = dark_addon.settings.fetch("rexsha_settings_dpsplayermana", 65)
  local dpsgrouphealth = dark_addon.settings.fetch("rexsha_settings_dpsgrouphealth", 65)
  
  --Targets in range check
  local enemyCount = enemies.around(8)
  local enemyRange = enemies.count(function (unit)
    return unit.alive and unit.distance >= (target.distance - 5) and unit.distance <= (target.distance + 5) and unit.distance <= 40
    end)

    if enemyCount == 0 then enemyCount = 1 end
    if enemyRange == 0 then enemyRange = 1 end

  dark_addon.interface.status_extra('Rng#:' .. enemyRange .. ' Mel#:' .. enemyCount .. ' D:' .. target.distance)    

  if player.alive and not player.channeling() and player.power.mana.percent > dpsplayermana and lowest.health.percent > dpsgrouphealth and toggle("dps", false) then

    --Essences
    if useessences and castable(SB.ConcentratedFlame) and -spell(SB.ConcentratedFlame) == 0 then
      return cast(SB.ConcentratedFlame, target)
    end
    --Use  Flame Shock on each target and refresh it whenever it has 6.3 seconds or less duration left
    if castable(SB.FlameShock, 'target') and -spell(SB.FlameShock) == 0 and (target.debuff(SB.FlameShock).down or target.debuff(SB.FlameShock).remains < 6.3) then
      return cast(SB.FlameShock)
    end    
    --Cast  Lava Burst at the priority target whenever it is available
    if castable(SB.LavaBurst, 'target') and -spell(SB.LavaBurst) == 0 then
      return cast(SB.LavaBurst)
    end     
    --Cast  Chain Lightning on 2+ targets
    if castable(SB.ChainLightning, 'target') and -spell(SB.ChainLightning) == 0 and (enemyCount >= 2 or enemyRange >= 2) then
      return cast(SB.ChainLightning)
    end     
    --Cast  Lightning Bolt at the priority target
    if castable(SB.LightningBolt, 'target') and -spell(SB.LightningBolt) == 0 then
      return cast(SB.LightningBolt)
    end     
  
  end  
  
end
setfenv(dps, dark_addon.environment.env)
--End DPS Function

--Start Trinkets Function
local function trinkets()

  local usetrinkets = dark_addon.settings.fetch('rexsha_settings_usetrinkets', true)

  --Trinkets
  local Trinket13 = GetInventoryItemID("player", 13)
  local Trinket14 = GetInventoryItemID("player", 14)

  if usetrinkets then
    if GetItemCooldown(Trinket13) == 0 then
      macro('/use 13')
    end
    if GetItemCooldown(Trinket14) == 0 then
      macro('/use 14')
    end
  end

end
setfenv(trinkets, dark_addon.environment.env)
--End Trinkets Function  

--Start Defensives Function
local function defensives()

  local astralshiftpercent = dark_addon.settings.fetch("rexsha_settings_astralshiftpercent", 30)
  local usehealthstone = dark_addon.settings.fetch("rexsha_settings_healthstone.check", true)
  local healthstonepercent = dark_addon.settings.fetch("rexsha_settings_healthstone.spin", 25)  

  --Health Stone
  if usehealthstone == true and player.health.percent < healthstonepercent and GetItemCount(5512) >= 1 and GetItemCooldown(5512) == 0 then
    macro("/use Healthstone")
  end
  --Astral Shift
  if player.castable(SB.AstralShift) and player.health.percent < astralshiftpercent then
    return cast(SB.AstralShift, player)
  end

end
setfenv(defensives, dark_addon.environment.env)
--End Defensives Function

--Start Healing Function
local function healing(combat)

    --Settings
    local tankhealingsurgepercent = dark_addon.settings.fetch("rexsha_settings_tankhealingsurge", 60)
    local tankhealingwavepercent = dark_addon.settings.fetch("rexsha_settings_tankhealingwave", 80)
    local grouphealingsurgepercent = dark_addon.settings.fetch("rexsha_settings_grouphealingsurge", 60)
    local grouphealingwavepercent = dark_addon.settings.fetch("rexsha_settings_grouphealingwave", 80)      
    local chpercent = dark_addon.settings.fetch("rexsha_settings_chpercent", 70)
    local chtargets = dark_addon.settings.fetch("rexsha_settings_chtargets", 3)
    local httpercent = dark_addon.settings.fetch("rexsha_settings_httpercent", 50)
    local htttargets = dark_addon.settings.fetch("rexsha_settings_htttargets", 3)    
    local dispelooc = dark_addon.settings.fetch('rexsha_settings_dispelooc', true)

    --Healing Rain
    if modifier.shift and not lastcast(SB.HealingRain) then
      return cast(SB.HealingRain, "ground")
    end
    
    if combat == true then

      --Earth Shield on tank
      if lowest.castable(SB.EarthShield) and lowest.buff(SB.EarthShield).down and not lastcast(SB.EarthShield) then
        return cast(SB.EarthShield, lowest)
      end

      --Use Spirit Link Totem before Healing Tide Totem
      if modifier.control and lowest.castable(SB.SpiritLinkTotem) and group.under(httpercent, 30, true) >= htttargets then
        return cast(SB.SpiritLinkTotem)
      end      
      --Use Healing Tide Totem on high Group Damage
      if lowest.castable(SB.HealingTideTotem) and group.under(httpercent, 30, true) >= htttargets then
        return cast(SB.HealingTideTotem)
      end

      --Chain Heal
      if lowest.castable(SB.ChainHeal) and group.under(chpercent, 30, true) >= chtargets and not player.moving then
        return cast(SB.ChainHeal, lowest)
      end

      --Riptide
      if tank.castable(SB.Riptide) and (tank.buff(SB.Riptide).down or tank.buff(SB.Riptide).remains <= 4.5) then
        return cast(SB.Riptide, tank)
      end
      if lowest.castable(SB.Riptide) and (lowest.buff(SB.Riptide).down or lowest.buff(SB.Riptide).remains <= 4.5) then
        return cast(SB.Riptide, lowest)
      end

      --Healing Stream Totem
      if castable(SB.HealingStreamTotem) then
        return cast(SB.HealingStreamTotem)
      end

      --High Damage
      --Use Healing Surge with Riptide
      if tank.castable(SB.HealingSurge) and not player.moving and tank.health.percent <= tankhealingsurgepercent and player.buff(SB.TidalWaves).up then
        return cast(SB.HealingSurge, tank)
      end
      if lowest.castable(SB.HealingSurge) and not player.moving and lowest.health.percent <= grouphealingsurgepercent and player.buff(SB.TidalWaves).up then
        return cast(SB.HealingSurge, lowest)
      end

      --Low to Medium Damage
      --Use Healing Wave with Riptide
      if tank.castable(SB.HealingWave) and not player.moving and tank.health.percent <= tankhealingwavepercent and player.buff(SB.TidalWaves).up then
        return cast(SB.HealingWave, tank)
      end
      if lowest.castable(SB.HealingWave) and not player.moving and lowest.health.percent <= grouphealingwavepercent and player.buff(SB.TidalWaves).up then
        return cast(SB.HealingWave, lowest)
      end      

      --High Damage
      --Use Healing Surge
      if tank.castable(SB.HealingSurge) and not player.moving and tank.health.percent <= tankhealingsurgepercent then
        return cast(SB.HealingSurge, tank)
      end
      if lowest.castable(SB.HealingSurge) and not player.moving and lowest.health.percent <= grouphealingsurgepercent then
        return cast(SB.HealingSurge, lowest)
      end      
    
      --Low to Medium Damage
      --Use Healing Wave
      if tank.castable(SB.HealingWave) and not player.moving and tank.health.percent <= tankhealingwavepercent then
        return cast(SB.HealingWave, tank)
      end
      if lowest.castable(SB.HealingWave) and not player.moving and lowest.health.percent <= grouphealingwavepercent then
        return cast(SB.HealingWave, lowest)
      end 
 
  end
  
  if combat == false then
    
    --Riptide
    if lowest.castable(SB.Riptide) and lowest.health.percent <= 60 then
      return cast(SB.Riptide, lowest)
    end

  end

end
setfenv(healing, dark_addon.environment.env)
--End Healing Function

local function combat()

  --Settings
  local dispelooc = dark_addon.settings.fetch('rexsha_settings_dispelooc', true)

  if not player.alive or player.buff(SB.Refreshment).up or player.buff(SB.Drink).up or player.channeling() then
    return
  end

  --Healing
  if healing(true) then return end
  --Dispel
  --if dispelooc == false then
    if dispel() then return end
  --end
  --Interrupt
  if interrupt() then return end  
  --Racials
  if racials() then return end
  --DPS
  if dps() then return end
  --Trinkets
  if trinkets() then return end
  --Defensives
  if defensives() then return end   

end


local function resting()

  --Settings
  local dispelooc = dark_addon.settings.fetch('rexsha_settings_dispelooc', true)

  --Healing
  if healing(false) then return end
  --Dispel
  if dispelooc == true then
    if dispel() then return end
  end

end

local function interface()
  local settings = {
    key = "rexsha_settings",
    title = "Restoration Shaman Settings",
    width = 275,
    height = 825,
    resize = true,
    show = false,
    template = {
      { type = "header", text = "Rex's Restoration Shaman Settings", align = "center" },
      { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
      { type = 'text', text = 'Suggested Talents - 1 1 2 3 2 3 1' },
      { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
      { type = 'text', text = 'Toggles not used on UI - Cooldowns, Interrupts, Multi-target' },        
      { type = 'text', text = 'Hold the Shift Key to cast Healing Rain at the mouse pointer' },              
      { type = "rule" },
      { type = 'header', text = 'General Settings' },
      { key = 'useessences', type = 'checkbox', text = 'Auto Use Essences', desc = '', default = true },      
      { key = 'usetrinkets', type = 'checkbox', text = 'Auto Use Trinkets', desc = '', default = true },
      { type = "rule" },
      { type = 'header', text = 'Tank Healing' },
      { key = 'tankhealingsurge', type = 'spinner', text = 'Healing Surge', desc = 'Health Percent to cast at', default = 60, min = 1, max = 100, step = 1 },      
      { key = 'tankhealingwave', type = 'spinner', text = 'Healing Wave', desc = 'Health Percent to cast at', default = 80, min = 1, max = 100, step = 1 },    
      { type = "rule" },
      { type = 'header', text = 'Group Healing' },
      { key = 'grouphealingsurge', type = 'spinner', text = 'Healing Surge', desc = 'Health Percent to cast at', default = 60, min = 1, max = 100, step = 1 },      
      { key = 'grouphealingwave', type = 'spinner', text = 'Healing Wave', desc = 'Health Percent to cast at', default = 80, min = 1, max = 100, step = 1 },    
      { key = "chpercent", type = "spinner", text = "Chain Heal", desc = "Lowest Group Member - Health Percent to cast at", default = 70, min = 1, max = 100, step = 1 },
      { key = "chtargets", type = "spinner", text = "Chain Heal Targets", desc = "Minimum number of group targets", default = 3, min = 1, max = 40, step = 1 },
      { key = "httpercent", type = "spinner", text = "Healing Tide Totem", desc = "Lowest Group Member - Health Percent to cast at", default = 50, min = 1, max = 100, step = 1 },
      { key = "htttargets", type = "spinner", text = "Healing Tide Targets", desc = "Minimum number of group targets", default = 3, min = 1, max = 40, step = 1 },      
      { type = "rule" },
      { type = 'header', text = 'DPS Settings' },
      { key = "dpsplayermana", type = "spinner", text = "Player Mana Threshold", desc = "Minimum Player Mana - Mana Percent to allow DPS", default = 65, min = 1, max = 100, step = 1 },
      { key = "dpsgrouphealth", type = "spinner", text = "Group Health Threshold", desc = "Lowest Group Member - Health Percent to allow DPS", default = 65, min = 1, max = 100, step = 1 },
      { type = "rule" },      
      { type = "header", text = "Defensive Settings", align = "center" },
      { key = "astralshiftpercent", type = "spinner", text = "astralshift", desc = "Health Percent to cast at", default = 30, min = 1, max = 100, step = 1 },
      { key = "healthstone", type = "checkspin", text = "Healthstone", desc = "Health Percent to cast at", default_check = false, default_spin = 30, min = 5, max = 100, step = 1 },
      { type = "rule" },
      { type = "header", text = "Utility", align = "center" },
      { key = 'dispelooc', type = 'checkbox', text = 'Purify Sprit', desc = 'Use out of combat, otherwise will use in combat', default = false },     
    }
  }
  configWindow = dark_addon.interface.builder.buildGUI(settings)

  dark_addon.interface.buttons.add_toggle(
    { name = "racial", label = "Use Racials",
    on = { label = "Racials ON", color = dark_addon.interface.color.orange, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_orange, 0.7) },
    off = { label = "Racials OFF", color = dark_addon.interface.color.grey, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_grey, 0.5) }
    }
  )
  dark_addon.interface.buttons.add_toggle(
    { name = "dps", label = "Use Damage Spells",
    on = { label = "DPS ON", color = dark_addon.interface.color.orange, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_orange, 0.7) },
    off = { label = "DPS OFF", color = dark_addon.interface.color.grey, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_grey, 0.5) }
    }
  )
  dark_addon.interface.buttons.add_toggle(
    { name = "settings", label = "Rotation Settings", font = "dark_addon_icon",
    on = { label = dark_addon.interface.icon("cog"), color = dark_addon.interface.color.orange, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_orange, 0.7) },
    off = { label = dark_addon.interface.icon("cog"), color = dark_addon.interface.color.grey,  color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_grey, 0.5) },
    
    callback = function(self)
    if configWindow.parent:IsShown() then
      configWindow.parent:Hide()
    else
      configWindow.parent:Show()
    end
    end
    }
  )
end

dark_addon.rotation.register(
        {
          spec = dark_addon.rotation.classes.shaman.restoration,
          name = "RexRestSha",
          label = "Rex's Restoration Shaman",
          combat = combat,
          resting = resting,
          interface = interface
        }
)
