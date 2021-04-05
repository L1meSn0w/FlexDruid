local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITmonk

SB.Refreshment = 167152
SB.Drink = 274914
SB.ReplenishmentDebuff = 252753
SB.GiftOftheNaaru = 59544
SB.AncestralCall = 274738
SB.LightsJudgement = 255647
SB.ConcentratedFlame = 295373
SB.Berserking = 26297
SB.BlackoutCombo = 196736
SB.BlackoutKick = 100784
SB.BlackoutKickBuff = 116768
SB.BlackoutStrike = 205523
SB.BlackOxBrew = 115399
SB.BreathofFire = 115181
SB.ChiTorpedo = 109132
SB.CracklingJade = 117952
SB.ChiBurst = 123986
SB.ChiWave = 115098
SB.DanceofChiJi = 286587
SB.Dampen = 122278
SB.Detox = 115450
SB.DetoxDPS = 218164
SB.DiffuseMagic = 122783
SB.EnvelopingMist = 124682
SB.EnergizingElixir = 115288
SB.EssenceFont = 191837
SB.FistofFury = 113656
SB.FistoftheWhiteTiger = 261947
SB.FlyingSerpentKick = 101545
SB.FortBrew = 243435
SB.HealingElixir = 122281
SB.HeavyStagger = 124273
SB.InvokeXuen = 123904
SB.IronskinBrew = 115308
SB.KegSmash = 121253
SB.LegSweep = 119381
SB.LifeCocoon = 116849
SB.MarkoftheCrane = 228287
SB.ModerateStagger = 124274
SB.Paralysis = 115078
SB.PurifyingBrew = 119582
SB.RedCrane = 198664
SB.RefreshingJadeWind = 196725
SB.RenewingMist = 115151
SB.RenewingMistBuff = 119611
SB.Revival = 115310
SB.RingofPeace = 175697
SB.RisingSunKick = 107428
SB.RushingJadeWind = 261715
SB.Serenity = 152173
SB.SoothingMist = 115175
SB.SpinningCrane = 101546
SB.SpearHandStrike = 116705
SB.StormEarthFire = 137639
SB.SummonJade = 115313
SB.TeachingsoftheMonastery = 116645
SB.TigersLust = 116841
SB.TigerPalm = 100780
SB.ThunderFocus = 116680
SB.TouchofKarma = 122470
SB.TouchofDeath = 115080
SB.Transcendence = 101643
SB.TranscendenceReturn = 119996
SB.Vivify = 116670
SB.WhirlingDragonPunch = 152175

--Start Dispel Function
local function dispel()

  --Detox
  local ncdelay = math.random(0.5,2)

  local unit = group.dispellable(SB.Detox)
  if unit and unit.castable(SB.Detox) then
    return cast(SB.Detox, unit)
  end

end
setfenv(dispel, dark_addon.environment.env)
--End Dispel Function

--Start Interrupts Function
local function interrupts()

    local intpercentlow = dark_addon.settings.fetch('mw_settings_intpercentlow',50)
    local intpercenthigh = dark_addon.settings.fetch('mw_settings_intpercenthigh',65)

    local intpercent = math.random(intpercentlow,intpercenthigh)

    --Leg Sweep
    if toggle('interrupts', false) and castable(SB.LegSweep, 'target') and -spell(SB.LegSweep) == 0 and target.interrupt(intpercent, false) 
    and target.distance < 5 then
        print('Leg Sweep @ ' .. intpercent)
        return cast(SB.LegSweep, 'target')
    end

    --Paralysis
    if toggle('interrupts', false) and castable(SB.Paralysis, 'target') and -spell(SB.Paralysis) == 0 and -spell(SB.LegSweep) > 0  
    and target.interrupt(intpercent, false) and target.distance < 20 then
        print('Paralysis @ ' .. intpercent)
        return cast(SB.Paralysis, 'target')
    end 
  
end
setfenv(interrupts, dark_addon.environment.env)
--End Interrupts Function

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

  local useessences = dark_addon.settings.fetch('mw_settings_useessences', true)

  if player.alive and not player.channeling() then  

    if player.power.mana.percent > 55 and lowest.health.percent > 55 and tank.health.percent > 55 and toggle("dps", false) then
      --Essences
      if useessences and castable(SB.ConcentratedFlame) and -spell(SB.ConcentratedFlame) == 0 then
        return cast(SB.ConcentratedFlame, target)
      end
      if rising_sun_kick and target.castable(SB.RisingSunKick) then
        return cast(SB.RisingSunKick, target)
      end	
  
      if target.castable(SB.BlackoutKick) and buff(SB.TeachingsoftheMonastery).count == 3 then
        return cast(SB.BlackoutKick, target)
      end
  
      if castable(SB.ChiWave) then
        return cast(SB.ChiWave)
      end
  
      if target.castable(SB.TigerPalm) and buff(SB.TeachingsoftheMonastery).count < 3 then
        return cast(SB.TigerPalm, target)
      end
      
      if crackling_jade_lightning and not player.moving and target.combat and target.castable(SB.CracklingJade) and not player.channeling(SB.CracklingJade) then
        return cast(SB.CracklingJade, target)
      end
    end
  
  end  
  
end
setfenv(dps, dark_addon.environment.env)
--End DPS Function

--Start Trinkets Function
local function trinkets()

  local usetrinkets = dark_addon.settings.fetch('mw_settings_usetrinkets', true)

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

  local fortbrewpercent = dark_addon.settings.fetch("mw_settings_fortbrewpercent", 60)
  local usehealthstone = dark_addon.settings.fetch("mw_settings_healthstone.check", true)
  local healthstonepercent = dark_addon.settings.fetch("mw_settings_healthstone.spin", 25)  

  --Health Stone
  if usehealthstone == true and player.health.percent < healthstonepercent and GetItemCount(5512) >= 1 and GetItemCooldown(5512) == 0 then
    macro("/use Healthstone")
  end
  --Fortifying Brew
  if player.castable(SB.FortBrew) and player.health.percent < fortbrewpercent then
    return cast(SB.FortBrew, player)
  end

end
setfenv(defensives, dark_addon.environment.env)
--End Defensives Function

--Start Healing Function
local function healing(combat)

    --Settings
    local simultaneousrejuvenations = dark_addon.settings.fetch("mw_settings_simultaneousrejuvenations", 10)
    local wildgrowthpercent = dark_addon.settings.fetch("mw_settings_wildgrowthpercent", 80)
    local wildgrowthnumber = dark_addon.settings.fetch("mw_settings_wildgrowthnumber", 3)
    local flourishpercent = dark_addon.settings.fetch("mw_settings_flourishpercent", 75)
    local dispelooc = dark_addon.settings.fetch('mw_settings_dispelooc', true)
    local uselifecocoon = dark_addon.settings.fetch("mw_settings_lifecocoon.check", true)
    local lifecocoonpercent = dark_addon.settings.fetch("mw_settings_lifecocoon.spin", 66)

    if combat == true then

    --Dungeon Healing
    --Summon Jade Serpent Statue (if talented) should be placed within range of the group so none of its potential healing is lost, 
    --and should be channeling on someone taking damage as much as possible.

    --Mystic Touch should always be active on any target that is being damaged. If you're the only Monk in the group, it is your 
    --role to damage them as fast as possible to get the debuff's effect active.

    --Renewing Mist should be used as often as possible to ensure future casts of  Vivify will be as strong as possible.

    --Using  Thunder Focus Tea on  Renewing Mist is the default choice because  Vivify healing is vital to your group's survival. 
    --You should be pooling charges (i.e. not casting it so all charges are able to use in quick succession) for when  Thunder Focus Tea 
    --is about to come off cooldown. The more  Renewing Mists there are active, the less you have to worry about different players' health stabilizing at different rates.

    --If you have the Azerite Trait  Secret Infusion you can change your  Thunder Focus Tea spell priority, based on any stat increases 
    --you think would be useful for the upcoming situation. You can want to increase your Mastery (using  Thunder Focus Tea on  Vivify) 
    --for a large single target healing situation or Versatility (using  Thunder Focus Tea on  Rising Sun Kick) for additional flat healing and damage reduction.

    --Cast  Vivify on the player with the lowest health whenever the group needs healing.  Vivify acts as both Mistweaver's quick 
    --single target heal as well as its small group heal thanks to it healing allies with your  Renewing Mist active.

    --You can  Invoke Chi-Ji, the Red Crane (if talented) whenever more group healing is needed over an extended period of time to help take some of the pressure off of  Vivify.

    --If the group doesn't need immediate healing, use some GCDs to do damage to the mobs your groups is currently engaged with. 
    --Doing damage is generally how you want to spend any downtime where healing is not needed. You could also channel  Soothing Mist 
    --onto someone taking damage, typically the tank, to help stabilize their health. If incoming damage starts to ramp up, you're 
    --now in a perfect position to cast a  Vivify or an  Enveloping Mist quickly through this channel.

    --Enveloping Mist should only be cast on a target already being healed via  Soothing Mist. This is to maximize the healing bonus granted 
    --through the secondary effect of the  Enveloping Mist HoT.

    --Essence Font is in a weird spot in small group content. Because of how it is designed, it looks for injured targets that have not been 
    --hit by the last 5 bolts, meaning you can, at most, send out 15 bolts in a dungeon. This weakened version of the spell, plus the lengthy 
    --channel time you must dedicate to it, throw a full channel of it into question. It is more beneficial to cast this as long as it takes 
    --to get the HoT effect onto players with low health. Using it this way turns  Essence Font into a single target burst cooldown thanks to the double  Gust of Mists healing it does.

    --Enveloping Mist, Soothing Mist, Thunder Focus Tea

    if player.channeling(SB.SoothingMist) then
        soothed_unit = group.match(function (unit)
          return unit.alive and unit.buff(SB.SoothingMist).up
        end)
      else
        soothed_unit = nil
    end

      --Life Cocoon
      if uselifecocoon and lowest.castable(SB.LifeCocoon) and lowest.health.percent < lifecocoonpercent then
        return cast(SB.LifeCocoon, lowest)
      end

      --Revival
      if lowest.castable(SB.Revival) and group.under(30, 30, true) >= 3 then
        return cast(SB.Revival, lowest)
      end
      
      --Refreshing Jade Wind
      if lowest.castable(SB.RefreshingJadeWind) and group.under(60, 10, true) >= 3 and lowest.buff(SB.RefreshingJadeWind).down then
        return cast(SB.RefreshingJadeWind, lowest)
      end

      --Essence Font
      if lowest.castable(SB.EssenceFont) and group.under(70, 30, true) >= 3 and not player.moving then
        return cast(SB.EssenceFont, lowest)
      end

      --Enveloping Mist
      if player.channeling(SB.SoothingMist) and soothed_unit.castable(SB.EnvelopingMist) and soothed_unit.buff(SB.EnvelopingMist).down 
      and soothed_unit.health.percent < 60 then
        return cast(SB.EnvelopingMist, soothed_unit)
      end

      --Soothing Mist
       if lowest.castable(SB.SoothingMist) and lowest.buff(SB.SoothingMist).down and lowest.health.percent <= 70 then --or tank.buff(SB.Lifebloom).remains <= 4.5)
         return cast(SB.SoothingMist, lowest)
       end

      --Renewing Mist
      if tank.castable(SB.RenewingMist) and (tank.buff(SB.RenewingMist).down or tank.buff(SB.RenewingMist).remains <= 2) and tank.health.percent <= 90 then
        return cast(SB.RenewingMist, tank)
      end
      if lowest.castable(SB.RenewingMist) and (lowest.buff(SB.RenewingMist).down or lowest.buff(SB.RenewingMist).remains <= 2) and lowest.health.percent <= 90 then
        return cast(SB.RenewingMist, lowest)
      end
    
      -- Use Vivify as an emergency heal.
      if tank.castable(SB.Vivify) and not player.moving and tank.health.percent <= 80 then
        return cast(SB.Vivify, tank)
      end
      if lowest.castable(SB.Vivify) and not player.moving and lowest.health.percent <= 80 then
        return cast(SB.Vivify, lowest)
      end
 
  end
  
  if combat == false then
    --Vivify
    if lowest.castable(SB.Vivify) and not player.moving and lowest.health.percent <= 80 then
      return cast(SB.Vivify, lowest)
    end

  end

end
setfenv(healing, dark_addon.environment.env)
--End Healing Function

local function combat()

  --Settings
  local dispelooc = dark_addon.settings.fetch('mw_settings_dispelooc', true)

  if not player.alive or player.buff(SB.Refreshment).up or player.buff(SB.Drink).up or player.channeling() then
    return
  end

  --Healing
  if healing(true) then return end
  --Dispel
  --if dispelooc == false then
    if dispel() then return end
  --end
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
  local dispelooc = dark_addon.settings.fetch('mw_settings_dispelooc', true)

  --Healing
  if healing(false) then return end
  --Dispel
  if dispelooc == true then
    if dispel() then return end
  end

end

local function interface()
  local settings = {
    key = "mw_settings",
    title = "Mistweaver - Settings",
    width = 250,
    height = 750,
    resize = true,
    show = false,
    template = {
      { type = "header", text = "Rex's Mistweaver Monk Settings", align = "center" },
      { type = "rule" },
      { type = "header", text = "Class Settings", align = "center" },
      { key = "lifecocoon", type = "checkspin", text = "Life Cocoon", desc = "Health Percent to Cast At", default = 66, min = 1, max = 100, step = 1 },
      { type = "rule" },
      { type = 'header', text = 'General Settings' },
      { key = 'useessences', type = 'checkbox', text = 'Auto Use Essences', desc = '', default = true },      
      { key = 'usetrinkets', type = 'checkbox', text = 'Auto Trinket', desc = '', default = true },      
      { type = "rule" },
      { type = "header", text = "Defensives", align = "center" },
      { key = "fortbrewpercent", type = "spinner", text = "Fortifying Brew", desc = "Health Percent to Cast At", default = 60, min = 1, max = 100, step = 5 },
      { key = "healthstone", type = "checkspin", text = "Healthstone", desc = "Auto use Healthstone at health %", default = 30, min = 5, max = 100, step = 5 },
      { type = 'rule' },
      { type = 'header', text = 'Interrupt Settings' },
      { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
      { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
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
          spec = dark_addon.rotation.classes.monk.mistweaver,
          name = "RexMWMonk",
          label = "Rex's Mistweaver Monk",
          combat = combat,
          gcd = gcd,
          resting = resting,
          interface = interface
        }
)
