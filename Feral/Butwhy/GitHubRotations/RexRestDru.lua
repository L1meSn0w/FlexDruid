local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITdruid

SB.Refreshment = 167152
SB.Drink = 274914
SB.ReplenishmentDebuff = 252753
SB.Regrowth = 8936
SB.SolarWrathResto = 5176
SB.GiftOftheNaaru = 59544
SB.AncestralCall = 274738
SB.LightsJudgement = 255647
SB.ConcentratedFlame = 295373

SB.Barkskin = 22812
SB.BearForm = 5487
SB.CatForm = 768
SB.CenarionWard = 102351
SB.Clearcasting = 16870
SB.Efflorescence = 145205
SB.EntanglingRoots = 339
SB.FerociousBite = 22568
SB.Flourish = 197721
SB.Growl = 6795
SB.Hibernate = 2637
SB.IncarnationTreeofLife = 33891
SB.Innervate = 29166
SB.Ironbark = 102342
SB.Lifebloom = 33763
SB.LunarEmpowerment = 164547
SB.LunarStrike = 197628
SB.Mangle = 33917
SB.MassEntanglement = 102359
SB.MightyBash = 5211
SB.Moonfire = 8921
SB.MoonkinForm = 197625
SB.NaturesCure = 88423
SB.Prowl = 5215
SB.Rake = 1822
SB.Rebirth = 20484
SB.Regrowth = 8936
SB.Rejuvenation = 774
SB.Renewal = 108238
SB.Revitalize = 212040
SB.Revive = 50769
SB.Rip = 1079
SB.Shred = 5221
SB.SolarEmpowerment = 164545
SB.SolarWrath = 5176
SB.Soothe = 2908
SB.Starsurge = 197626
SB.Sunfire = 93402
SB.Swiftmend = 18562
SB.Swipe = 213764
SB.TigerDash = 252216
SB.Tranquility = 740
SB.TravelForm = 783
SB.Typhoon = 132469
SB.UrsolsVortex = 102793
SB.WildCharge = 102401
SB.WildGrowth = 48438

SB.Refreshment = 167152
SB.Drink = 274914
SB.ReplenishmentDebuff = 252753
SB.GiftOftheNaaru = 59544
SB.AncestralCall = 274738
SB.LightsJudgement = 255647

SB.ConcentratedFlame = 295373
SB.OverchargeMana = 296072

--Start Dispel Function
local function dispel()

  --Nature's Cure
  local ncdelay = math.random(0.5,2)

  if toggle("dispel", false) then
    local unit = group.dispellable(SB.NaturesCure)
    if unit and unit.castable(SB.NaturesCure) then
        return cast(SB.NaturesCure, unit)
    end
  end
  
  if toggle("dispel", false) then
    local unit2 = target.dispellable(SB.Soothe)
    if unit2 and unit2.castable(SB.Soothe) then
        return cast(SB.Soothe, unit2)
    end
  end 

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

local intpercentlow = dark_addon.settings.fetch('rexdru_settings2_intpercentlow',50)
local intpercenthigh = dark_addon.settings.fetch('rexdru_settings2_intpercenthigh',65)
local typhoonint = dark_addon.settings.fetch('rexdru_settings2_typhoonint', true)
local mightybashint = dark_addon.settings.fetch('rexdru_settings2_mightybashint', true)

    -- Interrupts
    -- Define random number for interrupt
    local intpercent = math.random(intpercentlow,intpercenthigh)
    --Typhoon
    if toggle("interrupts", false) and talent(4,3) and typhoonint and castable(SB.Typhoon, "target") and -spell(SB.Typhoon) == 0 and target.interrupt(intpercent, false) and target.distance <= 20 then
      print("Typhoon @ " .. intpercent)
      return cast(SB.Typhoon, "target")
    end
    --Mighty Bash
    if toggle("interrupts", false) and talent(4,1) and mightybashint and castable(SB.MightyBash, "target") and -spell(SB.MightyBash) == 0 and target.interrupt(intpercent, false) and target.distance <= 8 then
        print("Mighty Bash @ " .. intpercent)
        return cast(SB.MightyBash, "target")
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

--Start Trinkets Function
local function trinkets()

    local usetrinkets = dark_addon.settings.fetch('rexdru_settings2_usetrinkets', true)
  
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

    local barkskinpercent = dark_addon.settings.fetch("rexdru_settings2_barkskinpercent", 60)
    local usehealthstone = dark_addon.settings.fetch("rexdru_settings2_healthstone.check", true)
    local healthstonepercent = dark_addon.settings.fetch("rexdru_settings2_healthstone.spin", 25)
    local usepotion = dark_addon.settings.fetch("rexdru_settings2_potion.check", true)
    local potionpercent = dark_addon.settings.fetch("rexdru_settings2_potion.spin", 25)  
  
    --Health Stone
    if usehealthstone == true and player.health.percent < healthstonepercent and GetItemCount(5512) >= 1 and GetItemCooldown(5512) == 0 then
      macro("/use Healthstone")
    end
    --Potion
    if usepotion == true and player.health.percent < potionpercent and GetItemCount(169451) >= 1 and GetItemCooldown(169451) == 0 then
      macro('/use Abyssal Healing Potion')
    end
    --Barkskin
    if player.castable(SB.Barkskin) and player.health.percent < barkskinpercent then
      return cast(SB.Barkskin, player)
    end
  
end
setfenv(defensives, dark_addon.environment.env)
--End Defensives Function

--Start DPS Function
local function dps()

  local useconcflame = dark_addon.settings.fetch('rexdru_settings2_useconcflame', true)
  local dpsplayermana = dark_addon.settings.fetch("rexdru_settings2_dpsplayermana", 65)
  local dpsgrouphealth = dark_addon.settings.fetch("rexdru_settings2_dpsgrouphealth", 65)
  local affinity = dark_addon.settings.fetch("rexdru_settings2_affinity")
  -- Targets in range check
  local enemyCount = enemies.around(8)
  if enemyCount == 0 then enemyCount = 1 end
  dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)    

  if player.alive and not player.channeling() and player.power.mana.percent > dpsplayermana and lowest.health.percent > dpsgrouphealth and toggle("dps", false) then

  -- Auto Attack
  if target.enemy and target.alive then
    auto_attack()
  end

    --Essences - Concentrated Flame
    if useconcflame and castable(SB.ConcentratedFlame) and -spell(SB.ConcentratedFlame) == 0 then
      return cast(SB.ConcentratedFlame, target)
    end

    if affinity == "balance" then

      --Caster Form to refresh Moonfire and Sunfire
      if -buff(SB.CatForm) then
        macro('/cancelform')
      end
      if not -buff(SB.MoonkinForm) then
        return cast(SB.MoonkinForm)
      end
      --Moonfire  
      if target.castable(SB.Moonfire) and target.debuff(SB.Moonfire).down then
        return cast(SB.Moonfire, target)
      end
      --Sunfire
      if target.castable(SB.Sunfire) and target.debuff(SB.Sunfire).down then
        return cast(SB.Sunfire, target)
      end      
      --Starsurge to proc Lunar Empowerment and Solar Empowerment
      if target.castable(SB.Starsurge) and not player.moving then
        return cast(SB.Starsurge, target)
      end
      --Lunar Strike
      if target.castable(SB.LunarStrike) and player.buff(SB.LunarEmpowerment).up and not player.moving then
        return cast(SB.LunarStrike, target)
      end
      --Solar Wrath
      if target.castable(SB.SolarWrath) and player.buff(SB.SolarEmpowerment).up and not player.moving then
        return cast(SB.SolarWrath, target)
      end
      if target.castable(SB.SolarWrath) and not player.moving then
        return cast(SB.SolarWrath, target)
      end      
      --Moonfire
      if target.castable(SB.Moonfire) and player.moving then
        return cast(SB.Moonfire, target)
      end

    end
    
    if affinity == "feral" then

      --Caster Form to refresh Moonfire and Sunfire
      if target.debuff(SB.Moonfire).down and target.debuff(SB.Sunfire).down and -buff(SB.CatForm) and target.distance > 10 then
        macro('/cancelform')
      end
      --Maintain Moonfire
      if target.castable(SB.Moonfire) and target.debuff(SB.Moonfire).down and not -buff(SB.CatForm) then
        return cast(SB.Moonfire, target)
      end
      --Maintain Sunfire
      if target.castable(SB.Sunfire) and target.debuff(SB.Sunfire).down and not -buff(SB.CatForm) then
        return cast(SB.Sunfire, target)
      end

      -- Apply Prowl
      if castable(SB.Prowl) and not -buff(SB.Prowl) and -buff(SB.CatForm) and target.distance <= 10 then
  		  return cast(SB.Prowl, 'player')
      end
      -- Apply Rake to any nearby targets.
      if castable(SB.Rake, 'target') and -spell(SB.Rake) == 0 and not -target.debuff(SB.Rake) and target.distance < 8 and -buff(SB.Prowl) then
        return cast(SB.Rake)
      end
      
      --Cat Form for Kitty Weaving
      if target.debuff(SB.Moonfire).up and target.debuff(SB.Sunfire).up and not -buff(SB.CatForm) and target.distance <= 10 then
        cast(SB.CatForm, 'player')
      end         
      --Apply Rip
      if castable(SB.Rip, 'target') and -spell(SB.Rip) == 0 and player.power.combopoints.actual >= 5 
      and (target.debuff(SB.Rip).down and target.time_to_die > 20) then
        return cast(SB.Rip)
      end
      --Cast Ferocious Bite if at 5 Combo Points and Rip does not need refreshing within 10 sec.
      if castable(SB.FerociousBite, 'target') and -spell(SB.FerociousBite) == 0 and player.power.combopoints.actual >= 5 and player.power.energy.actual <= 50 then
        return cast(SB.FerociousBite)
      end            
      --Maintain Rake
      if castable(SB.Rake, 'target') and target.debuff(SB.Rake).down then
        return cast(SB.Rake)
      end
      --Cast Swipe to build Combo Points at 2+ targets
      if castable(SB.Swipe, 'target') and -spell(SB.Swipe) == 0 and player.power.combopoints.actual <= 4 and enemyCount >= 2 then
        return cast(SB.Swipe)
      end       
      --Cast Shred to build Combo Points.
      if castable(SB.Shred, 'target') and -spell(SB.Shred) == 0 and player.power.combopoints.actual <= 4 then
        return cast(SB.Shred)
      end

    end
  
  end  
  
end
setfenv(dps, dark_addon.environment.env)
--End DPS Function

--Start Healing Function
local function healing(combat)

    --Settings
    local tankrejuvepercent = dark_addon.settings.fetch("rexdru_settings_tankrejuve", 90)
    local tankregrowthpercent = dark_addon.settings.fetch("rexdru_settings_tankregrowth", 90)
    local grouprejuvepercent = dark_addon.settings.fetch("rexdru_settings_grouprejuve", 90)
    local groupregrowthpercent = dark_addon.settings.fetch("rexdru_settings_groupregrowth", 90)   
    local swiftmendpercent = dark_addon.settings.fetch("rexdru_settings_swiftmend", 50)           
    local wgpercent = dark_addon.settings.fetch("rexdru_settings_wgpercent", 70)
    local wgtargets = dark_addon.settings.fetch("rexdru_settings_wgtargets", 3)
    local tranqpercent = dark_addon.settings.fetch("rexdru_settings_tranqpercent", 50)
    local tranqtargets = dark_addon.settings.fetch("rexdru_settings_tranqtargets", 3)    
    local dispelooc = dark_addon.settings.fetch('rexdru_settings_dispelooc', true)
    local useironbark = dark_addon.settings.fetch("rexdru_settings_ironbark.check", true)
    local ironbarkpercent = dark_addon.settings.fetch("rexdru_settings_ironbark.spin", 30)
    local useinnervate = dark_addon.settings.fetch("rexdru_settings_innervate.check", true)
    local innervatepercent = dark_addon.settings.fetch("rexdru_settings_innervate.spin", 90)
    local dpsplayermana = dark_addon.settings.fetch("rexdru_settings2_dpsplayermana", 65)
    local dpsgrouphealth = dark_addon.settings.fetch("rexdru_settings2_dpsgrouphealth", 65)
    local effkey = dark_addon.settings.fetch("rexdru_settings_effkey")
    local ohshitkey = dark_addon.settings.fetch("rexdru_settings_ohshitkey")
    local lifebloom = dark_addon.settings.fetch("rexdru_settings_lifebloom")
    local lbplayerpercent = dark_addon.settings.fetch("rexdru_settings_lbplayerpercent", 50)
    local overmana = dark_addon.settings.fetch('rexdru_settings_useovermana', true)

    --Efflorescence
    if (effkey == "shift" and modifier.shift) or (effkey == "control" and modifier.control) or (effkey == "alt" and modifier.alt) and not lastcast(SB.Efflorescence) then
      return cast(SB.Efflorescence, "ground")
    end
    
    if player.power.mana.percent > dpsplayermana and lowest.health.percent > dpsgrouphealth and toggle("dps", false) then 
      return 
    end

    if combat == true then

      --Ramp Up for Incoming Damage
      if (ohshitkey == "shift" and modifier.shift) or (ohshitkey == "control" and modifier.control) or (ohshitkey == "alt" and modifier.alt) then
        --Essences - Overcharge Mana
        if useovermana == "rampup" and castable(SB.OverchargeMana) and -spell(SB.OverchargeMana) == 0 then
          return cast(SB.OverchargeMana, player)
        end
        rejuvbuffable = group.buffable(SB.Rejuvenation)
        if rejuvbuffable and (rejuvbuffable.buff(SB.Rejuvenation).down or rejuvbuffable.buff(SB.Rejuvenation).remains <= 6) then
          return cast(SB.Rejuvenation, rejuvbuffable)
        end
        if lowest.castable(SB.WildGrowth) and lowest.buff(SB.Rejuvenation).up and not player.moving then
          return cast(SB.WildGrowth, lowest)
        end          
      end

      --Essences - Overcharge Mana
      if useovermana == "cooldown" and castable(SB.OverchargeMana) and -spell(SB.OverchargeMana) == 0 then
        return cast(SB.OverchargeMana, player)
      end

      --Ironbark
      if useironbark and lowest.castable(SB.Ironbark) and lowest.health.percent < ironbarkpercent then
          return cast(SB.Ironbark, lowest)
      end

      --Lifebloom on player with Photosynthesis
      if talent(7,1) and player.castable(SB.Lifebloom) and (player.buff(SB.Lifebloom).down or player.buff(SB.Lifebloom).remains <= 4.5) and lowest.health.percent <= lbplayerpercent then
        return cast(SB.Lifebloom, player)
      end
      --Lifebloom
      if lifebloom == "tank" and tank.castable(SB.Lifebloom) and (tank.buff(SB.Lifebloom).down or tank.buff(SB.Lifebloom).remains <= 4.5) then
          return cast(SB.Lifebloom, tank)
      end
      if lifebloom == "lowest" and lowest.castable(SB.Lifebloom) and (lowest.buff(SB.Lifebloom).down or lowest.buff(SB.Lifebloom).remains <= 4.5) then
          return cast(SB.Lifebloom, lowest)
      end        

      --Tranquility
      if lowest.castable(SB.Tranquility) and group.under(tranqpercent, 30, true) >= tranqtargets and not player.moving then
        return cast(SB.Tranquility, lowest)
      end

      --Wild Growth
      if lowest.castable(SB.WildGrowth) and group.under(wgpercent, 30, true) >= wgtargets and not player.moving then
        return cast(SB.WildGrowth, lowest)
      end

      --Rejuvenation
      if tank.castable(SB.Rejuvenation) and (tank.buff(SB.Rejuvenation).down or tank.buff(SB.Rejuvenation).remains <= 2) and tank.health.percent <= tankrejuvepercent then
        return cast(SB.Rejuvenation, tank)
      end
      if lowest.castable(SB.Rejuvenation) and (lowest.buff(SB.Rejuvenation).down or lowest.buff(SB.Rejuvenation).remains <= 2) and lowest.health.percent <= grouprejuvepercent then
        return cast(SB.Rejuvenation, lowest)
      end

      --Innervate should be used as many times during the fight as possible. Refresh Efflorescence, cast Wild Growth, and spam Rejuvenation during Innervate.
      if useinnervate and player.castable(SB.Innervate) and player.power.mana.percent < innervatepercent then
        return cast(SB.Innervate, player)
      end
    
      --Use Clearcasting procs to cast Regrowth on any person in the raid.
      if player.buff(SB.Clearcasting).up and not player.moving then
        return cast(SB.Regrowth, lowest)
      end

      --Use Swiftmend on a player that just took heavy damage. If not in immediate danger, use Rejuvenation first.
      if lowest.castable(SB.Swiftmend) and lowest.health.percent <= swiftmendpercent then
        return cast(SB.Swiftmend, lowest)
      end
    
      --Use Regrowth as an emergency heal.
      if tank.castable(SB.Regrowth) and not player.moving and tank.health.percent <= tankregrowthpercent then
        return cast(SB.Regrowth, tank)
      end
      if lowest.castable(SB.Regrowth) and not player.moving and lowest.health.percent <= groupregrowthpercent then
        return cast(SB.Regrowth, lowest)
      end
 
  end
  
  if combat == false then

    --Ramp Up for Incoming Damage
    if (ohshitkey == "shift" and modifier.shift) or (ohshitkey == "control" and modifier.control) or (ohshitkey == "alt" and modifier.alt) then
      --Essences - Overcharge Mana
      if useovermana == "rampup" and castable(SB.OverchargeMana) and -spell(SB.OverchargeMana) == 0 then
        return cast(SB.OverchargeMana, player)
      end
      rejuvbuffable = group.buffable(SB.Rejuvenation)
      if rejuvbuffable and (rejuvbuffable.buff(SB.Rejuvenation).down or rejuvbuffable.buff(SB.Rejuvenation).remains <= 6) then
        return cast(SB.Rejuvenation, rejuvbuffable)
      end
      if lowest.castable(SB.WildGrowth) and lowest.buff(SB.Rejuvenation).up and not player.moving then
        return cast(SB.WildGrowth, lowest)
      end          
    end
    
    --Regrowth
    if lowest.castable(SB.Regrowth) and not player.moving and lowest.health.percent <= 60 then
      return cast(SB.Regrowth, lowest)
    end

  end

end
setfenv(healing, dark_addon.environment.env)
--End Healing Function

local function combat()

  if not player.alive or player.buff(SB.TravelForm).exists or player.buff(SB.Refreshment).up or player.buff(SB.Drink).up or player.channeling() then
    return
  end

  --Healing
  if healing(true) then return end

  --Dispel
  if dispel() then return end

            -- --Racials
            -- if racials() then return end
  --DPS
  if dps() then return end

  --Trinkets
  if trinkets() then return end

  --Defensives
  if defensives() then return end

  --Interrupts
  if interrupt() then return end    

end


local function resting()

  --Healing
  if healing(false) then return end

  --Dispel
  if dispel() then return end


end

local function interface()
  local settings = {
    key = "rexdru_settings",
    title = "НастройОЧКА",
    width = 275,
    height = 700,
    color = "ef6c00",
    resize = true,
    show = false,
    template = {
      { type = "header", text = "Кирасака перевёл.", align = "center" },
      { type = 'text', text = 'Все изменения применяется сразу!', align = "center" },
      { type = 'text', text = 'Таланты: 1 1 1 3 2 3 1', align = "center" },
      { type = 'text', text = 'Юзлесс кнопки - БУРСТ, АОЕ', align = "center" },                      
      { type = "rule" },
      { type = 'header', text = 'Хилим Дауна-Танка', align = "center" },
      { key = 'tankrejuve', type = 'spinner', text = 'Обновление', desc = 'Минимум % хп для каста', default = 90, min = 1, max = 100, step = 1 },      
      { key = 'tankregrowth', type = 'spinner', text = 'Восстановление', desc = 'Минимум % хп для каста', default = 80, min = 1, max = 100, step = 1 },    
      { type = "rule" },
      { type = 'header', text = 'Лечим 4х долбоёбов помимо танка', align = "center" },
      { key = 'effkey', type = 'dropdown', text = 'Кнопочка что бы обоссаца лужой.', desc = '', default = 'control',
      list = {
        { key = 'control', text = 'CTRL' },
        { key = 'alt', text = 'ALT' },
        { key = 'shift', text = 'SHIFT' },
      } },
      { key = 'lifebloom', type = 'dropdown', text = 'Жизнецвет приоритет цель', desc = '', default = 'tank',
      list = {
        { key = 'tank', text = 'Даун-Танк' },
        { key = 'lowest', text = 'Лоу хп игрок' },
      } },
      { key = "lbplayerpercent", type = "spinner", text = "Фотосинтез Жизнецвет", desc = "Перекинуть на себя на % хп", default = 50, min = 1, max = 100, step = 1 },    
      { key = 'grouprejuve', type = 'spinner', text = 'Обновление', desc = 'Минимум % хп для каста', default = 90, min = 1, max = 100, step = 1 },      
      { key = 'groupregrowth', type = 'spinner', text = 'Восстановление', desc = 'Минимум % хп для каста', default = 80, min = 1, max = 100, step = 1 },                     
      { key = "ironbark", type = "checkspin", text = "Железная кора", desc = "Минимум хп челика для каста", default_check = true, default_spin = 30, min = 1, max = 100, step = 1 },
      { key = "swiftmend", type = "spinner", text = "Быстрое восстановление", desc = "Минимум % хп для каста", default = 50, min = 1, max = 100, step = 1 },      
      { key = "wgpercent", type = "spinner", text = "Буйный Рост", desc = "Минимум % хп для каста", default = 70, min = 1, max = 100, step = 1 },
      { key = "wgtargets", type = "spinner", text = "Буйный Рост кол-в целей", desc = "Минимум целей", default = 3, min = 1, max = 40, step = 1 },
      { key = "tranqpercent", type = "spinner", text = "Транквила", desc = "Минимум % хп целей", default = 50, min = 1, max = 100, step = 1 },
      { key = "tranqtargets", type = "spinner", text = "Транквила кол-в целей", desc = "Минимум целей", default = 3, min = 1, max = 40, step = 1 },
      { key = "innervate", type = "checkspin", text = "Озарение", desc = "На % маны кастануть", default_check = true, default_spin = 90, min = 1, max = 100, step = 1 }, 
      { type = "rule" },
      { type = "header", text = "Настакать для входящего урона", align = "center" },
      { key = 'useovermana', type = 'dropdown', text = 'Мейн эссенция: Перегрузка маны', desc = '', default = 'cooldown',
      list = {
        { key = 'cooldown', text = 'на перезарядке' },
        { key = 'rampup', text = 'с Настакиванием' },
      } },
      { key = 'ohshitkey', type = 'dropdown', text = 'Настакиваем ', desc = 'Спамим Обновление и Буйный Рост на пати', default = 'alt',
      list = {
        { key = 'control', text = 'CTRL' },
        { key = 'alt', text = 'ALT' },
        { key = 'shift', text = 'SHIFT' },
      } },         
    }
  }
  configWindow = dark_addon.interface.builder.buildGUI(settings)

  local settings2 = {
    key = "rexdru_settings2",
    title = "НастройОЧКА ДПСА | ЛИЧных сейвов",
    width = 275,
    height = 700,
    color = "ef6c00",
    resize = true,
    show = false,
    template = {
      { type = "header", text = "Кирасака перевёл.", align = "center" },
      { type = 'text', text = 'Все изменения применяется сразу!', align = "center" },
      { type = 'text', text = 'Таланты: 1 1 1 3 2 3 1', align = "center" },
      { type = 'text', text = 'Юзлесс кнопки - БУРСТ, АОЕ', align = "center" },                           
      { type = "rule" },
      { type = 'header', text = 'НАСТРОЙКИ ДПС', align = "center" },
      { key = 'affinity', type = 'dropdown', text = 'Какое родство юзается', desc = '', default = 'balance',
      list = {
        { key = 'balance', text = 'Балонка' },
        { key = 'feral', text = 'Фекал' },
      } },
      { key = 'useconcflame', type = 'checkbox', text = 'Авто юзать эсенцию Сосредоточенный огонь', desc = '', default = true },
      { key = "dpsplayermana", type = "spinner", text = "Кол-в маны в %", desc = "Минимум маны для ДПС мода", default = 65, min = 1, max = 100, step = 1 },
      { key = "dpsgrouphealth", type = "spinner", text = "Минимальный % хп уч. группы", desc = "Минимальный % хп челика в пати для ДПС мода", default = 65, min = 1, max = 100, step = 1 },                  
      { type = "rule" },
      { type = 'header', text = 'Основные Настройки', align = "center" },      
      { key = 'usetrinkets', type = 'checkbox', text = 'Авто юзать триньки', desc = '', default = true },
      { type = "rule" },      
      { type = "header", text = "Собственные сейвы", align = "center" },
      { key = "barkskinpercent", type = "spinner", text = "Дубовая кожа", desc = "На сколько % хп кастовать", default = 60, min = 1, max = 100, step = 1 },
      { key = "healthstone", type = "checkspin", text = "Огурцы лока", desc = "На сколько % хп кастовать", default_check = false, default_spin = 30, min = 5, max = 100, step = 1 },
      { key = "potion", type = "checkspin", text = "Глубоководное лечебное зелье", desc = "На сколько % хп кастовать", default_check = false, default_spin = 30, min = 5, max = 100, step = 1 },      
      { type = "rule" },
      { type = 'header', text = 'Кикай касты ака гладиатор', align = "center" },
      { key = 'intpercentlow', type = 'spinner', text = 'Минимум % каста', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
      { key = 'intpercenthigh', type = 'spinner', text = 'Максимум % каста', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
      { key = 'typhoonint', type = 'checkbox', text = 'Тайфун', desc = 'Юзать тайфун для кика каста', default = false },
      { key = 'mightybashint', type = 'checkbox', text = 'Мощное оглушение', desc = 'Мощное оглушение для кика каста', default = false },      
    }
  }
  configWindow2 = dark_addon.interface.builder.buildGUI(settings2)

--   dark_addon.interface.buttons.add_toggle(
--     { name = "racial", label = "Use Racials",
--     on = { label = "Racials ON", color = dark_addon.interface.color.orange, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_orange, 0.7) },
--     off = { label = "Racials OFF", color = dark_addon.interface.color.grey, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_grey, 0.5) }
--     }
--   )

  dark_addon.interface.buttons.add_toggle(
    { name = "dispel", label = "Диспелим ебать. (вкл|выкл)",
    on = { label = "ДИСП ВКЛ", color = dark_addon.interface.color.orange, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_orange, 0.7) },
    off = { label = "ДИСП ВЫКЛ", color = dark_addon.interface.color.grey, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_grey, 0.5) }
    }
  )

  dark_addon.interface.buttons.add_toggle(
    { name = "dps", label = "Ебашим палкой его. (Дпс мод вкл|выкл)",
    on = { label = "ДПС ВКЛ", color = dark_addon.interface.color.orange, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_orange, 0.7) },
    off = { label = "ДПС ВЫКЛ", color = dark_addon.interface.color.grey, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_grey, 0.5) }
    }
  )

  dark_addon.interface.buttons.add_toggle(
    { name = "settings", label = "Настройки хила", font = "dark_addon_icon",
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

  dark_addon.interface.buttons.add_toggle(
    { name = "settings2", label = "Настроечки ДПС модаm, Кик кастов, и Сейвов Личных.", font = "dark_addon_icon",
    on = { label = dark_addon.interface.icon("cog"), color = dark_addon.interface.color.orange, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_orange, 0.7) },
    off = { label = dark_addon.interface.icon("cog"), color = dark_addon.interface.color.grey,  color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_grey, 0.5) },
    
    callback = function(self)
    if configWindow2.parent:IsShown() then
      configWindow2.parent:Hide()
    else
      configWindow2.parent:Show()
    end
    end
    }
  )

end
dark_addon.rotation.register(
        {
          spec = dark_addon.rotation.classes.druid.restoration,
          name = "Healer",
          label = "Rex RU restoration dru.",
          combat = combat,
          resting = resting,
          interface = interface
        }
)
