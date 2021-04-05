-- Mistweaver Monk for 8.1 by Nikopol - 12/2018
-- Talents not in rotation are 1.3, 2.1, 2.2, 2.3, 3.3, 4.2, 4.3, 5.1, 5.2, 5.3, 6.1, 6.3.
-- Left Shift - Spinning Crane Kick
-- Left Control - Revival
-- Left Alt - Essence Font
local dark_addon = dark_interface
local SB = m2jue4dgc56acfzz
dark_addon.environment.virtual.exclude_tanks = false

local soothed_unit
local lowest_unit
local tank_unit

local function gcd()
  if not player.alive then return end
  
  local vivify = dark_addon.settings.fetch('mw_nikopol_vivify', 70)
  lowest_unit = lowest
  tank_unit = tank
  
  if player.channeling(SB.SoothingMist) then
    soothed_unit = group.match(function (unit)
      return unit.alive and unit.buff(SB.SoothingMist).up
    end)
  else
    soothed_unit = nil
  end

  if GetItemCooldown(5512) == 0 and player.health.effective < 30 then
    macro('/use Healthstone')
  end

  if player.channeling(SB.SoothingMist) and soothed_unit and soothed_unit.health.effective > vivify + 5 then
    stopcast()
    soothed_unit = nil
  end

  if not modifier.lshift and player.channeling(SB.SpinningCrane) then
    stopcast()
  end

  if castable(SB.ThunderFocus)
  and (
    (talent(7, 3) 
      and player.combat 
      and target.castable(SB.RisingSunKick) 
      and spell(SB.EssenceFont).cooldown > 0 and spell(SB.EssenceFont).cooldown < 9 
      and (not talent(3, 2) or (talent(3, 2) and buff(SB.TeachingsoftheMonastery).count < 2)))
    or (player.channeling(SB.SoothingMist) and soothed_unit and soothed_unit.health.effective < vivify)
    ) then
    cast(SB.ThunderFocus)
  end

  if toggle('cooldowns', false) then
    if player.health.effective <= 30 
    and castable(SB.LifeCocoon) then
      cast(SB.LifeCocoon, player)
    end

    if lowest_unit.health.effective <= 30 
    and lowest_unit.castable(SB.LifeCocoon) then
      cast(SB.LifeCocoon, lowest_unit)
    end
  end
end

local function combat()
  if not player.alive then return end
  
  local envelope_mist = dark_addon.settings.fetch('mw_nikopol_envelope_mist', 50)
  local vivify = dark_addon.settings.fetch('mw_nikopol_vivify', 70)
  local renewing_mist = dark_addon.settings.fetch('mw_nikopol_renewing_mist', 90)
  local essence_font = dark_addon.settings.fetch('mw_nikopol_essence_font', 70)
  local rising_sun_kick = dark_addon.settings.fetch('mw_nikopol_rising_sun_kick', false)
  local crackling_jade_lightning = dark_addon.settings.fetch('mw_nikopol_crackling_jade_lightning', false)
  lowest_unit = lowest
  tank_unit = tank
  
  if player.channeling(SB.SoothingMist) then
    soothed_unit = group.match(function (unit)
      return unit.alive and unit.buff(SB.SoothingMist).up
    end)
  else
    soothed_unit = nil
  end
  
  macro('/cqs')

  if GetItemCooldown(5512) == 0 and player.health.effective < 30 then
    macro('/use Healthstone')
  end

  if player.channeling(SB.SoothingMist) and soothed_unit and soothed_unit.health.effective > vivify + 5 then
    stopcast()
    soothed_unit = nil
  end

  if not modifier.lshift and player.channeling(SB.SpinningCrane) then
    stopcast()
  end

  if castable(SB.ThunderFocus)
  and (
    (talent(7, 3) 
      and player.combat 
      and target.castable(SB.RisingSunKick) 
      and spell(SB.EssenceFont).cooldown > 0 and spell(SB.EssenceFont).cooldown < 9 
      and (not talent(3, 2) or (talent(3, 2) and buff(SB.TeachingsoftheMonastery).count < 2)))
    or (player.channeling(SB.SoothingMist) and soothed_unit and soothed_unit.health.effective < vivify)
    ) then
    cast(SB.ThunderFocus)
  end

  if toggle('cooldowns', false) then
    if player.health.effective <= 30 
    and castable(SB.LifeCocoon) then
      cast(SB.LifeCocoon, player)
    end

    if lowest_unit.health.effective <= 30 
    and lowest_unit.castable(SB.LifeCocoon) then
      cast(SB.LifeCocoon, lowest_unit)
    end
  end

  if modifier.lshift and castable(SB.SpinningCrane) then
    return cast(SB.SpinningCrane)
  end

  if modifier.lalt and castable(SB.EssenceFont) then
    return cast(SB.EssenceFont)
  end

  if modifier.lcontrol and castable(SB.Revival) then
    return cast(SB.Revival)
  end

  if player.channeling(SB.EssenceFont) then return end
  
  if player.channeling(SB.SoothingMist) and soothed_unit then
    if soothed_unit and tank_unit 
    and soothed_unit.name and tank_unit.name
    and soothed_unit.name ~= tank_unit.name
    and soothed_unit.health.effective > tank_unit.health.effective
    and tank_unit.health.effective < envelope_mist 
    and tank_unit.castable(SB.EnvelopeMist) 
    and tank_unit.buff(SB.EnvelopeMist).down then
      return cast(SB.SoothingMist, tank_unit)
    end

    if soothed_unit and tank_unit 
    and soothed_unit.name and lowest_unit.name
    and soothed_unit.name ~= lowest_unit.name
    and soothed_unit.health.effective > lowest_unit.health.effective
    and lowest_unit.health.effective < envelope_mist 
    and lowest_unit.castable(SB.EnvelopeMist) 
    and lowest_unit.buff(SB.EnvelopeMist).down then
      return cast(SB.SoothingMist, lowest_unit)
    end

    if soothed_unit.castable(SB.EnvelopeMist) 
    and soothed_unit.buff(SB.EnvelopeMist).down 
    and soothed_unit.health.effective < envelope_mist then
      return cast(SB.EnvelopeMist, soothed_unit)
    end
    if soothed_unit.castable(SB.Vivify) 
    and soothed_unit.health.effective < vivify then
      return cast(SB.Vivify, soothed_unit)
    end
  end
  
  if not player.moving and not player.channeling(SB.SoothingMist) then
    if ((player.health.effective < envelope_mist and castable(SB.EnvelopeMist) and player.buff(SB.EnvelopeMist).down)
      or (player.health.effective < vivify and castable(SB.Vivify))
      ) then
      if toggle('cooldowns', false) and castable(SB.Berserking) then
        cast(SB.Berserking)
      end
      return cast(SB.SoothingMist, player)
    end

    if ((tank_unit.health.effective < envelope_mist and tank_unit.castable(SB.EnvelopeMist) and tank_unit.buff(SB.EnvelopeMist).down)
      or (tank_unit.health.effective < vivify and tank_unit.castable(SB.Vivify))
      ) then
      if toggle('cooldowns', false) and castable(SB.Berserking) then
        cast(SB.Berserking)
      end
      return cast(SB.SoothingMist, tank_unit)
    end

    if ((lowest_unit.health.effective < envelope_mist and lowest_unit.castable(SB.EnvelopeMist) and lowest_unit.buff(SB.EnvelopeMist).down)
      or (lowest_unit.health.effective < vivify and lowest_unit.castable(SB.Vivify))
      ) then
      if toggle('cooldowns', false) and castable(SB.Berserking) then
        cast(SB.Berserking)
      end
      return cast(SB.SoothingMist, lowest_unit)
    end
  end

  if talent(7, 3) 
  and target.castable(SB.RisingSunKick) 
  and spell(SB.EssenceFont).cooldown > 0 and spell(SB.EssenceFont).cooldown < 9 then
    return cast(SB.RisingSunKick, target)
  end	

  if castable(SB.EssenceFont) and group.under(essence_font, 30, true) >= 5 then
    if toggle('cooldowns', false) and castable(SB.Berserking) then
      cast(SB.Berserking)
    end
    return cast(SB.EssenceFont)
  end

  if castable(SB.RefreshingJadeWind) and group.under(70, 10, true) >= 5 and player.buff(SB.RefreshingJadeWind).down then
    return cast(SB.RefreshingJadeWind)
  end

  if toggle('dispell', false) then
    local debuff, count, duration, expires, caster = UnitDebuff(tank.unitID, 288388, 'any')
    if debuff then
      if count >= 10 and tank.castable(SB.Detox) then
        return cast(SB.Detox, tank)
      else
        return
      end
    end
    
    if castable(SB.Detox) and player.dispellable(SB.Detox) then
      return cast(SB.Detox, player)
    end

    local unit = group.dispellable(SB.Detox)
    if unit and unit.castable(SB.Detox) then
      return cast(SB.Detox, unit)
    end
  end

  if castable(SB.RenewingMist) 
  and player.health.effective < renewing_mist 
  and player.buff(SB.RenewingMist).down then
    return cast(SB.RenewingMist, player)
  end

  if lowest_unit.castable(SB.RenewingMist) 
  and lowest_unit.health.effective < renewing_mist 
  and lowest_unit.buff(SB.RenewingMist).down then
    return cast(SB.RenewingMist, lowest_unit)
  end

  local ally_without_renewing_mist = group.match(function (unit)
    return unit.alive and unit.health.effective < renewing_mist and unit.castable(SB.RenewingMist) and unit.buff(SB.RenewingMist).down
  end)

  if ally_without_renewing_mist then
    return cast(SB.RenewingMist, ally_without_renewing_mist)
  end

  if target.enemy and target.alive then
    auto_attack()

    if toggle('interrupts', false) and target.interrupt(70) then
      if castable(SB.LegSweep) and target.distance <= 7 then
        return cast(SB.LegSweep)
      end

      if spell(SB.LegSweep).cooldown > 0 and target.castable(SB.Paralysis) then
        return cast(SB.Paralysis, target)
      end
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

local function resting()
  if not player.alive then return end
  
  local envelope_mist = dark_addon.settings.fetch('mw_nikopol_envelope_mist', 50)
  local vivify = dark_addon.settings.fetch('mw_nikopol_vivify', 70)
  local renewing_mist = dark_addon.settings.fetch('mw_nikopol_renewing_mist', 90)
  local essence_font = dark_addon.settings.fetch('mw_nikopol_essence_font', 70)
  lowest_unit = lowest
  tank_unit = tank
  
  if player.channeling(SB.SoothingMist) then
    soothed_unit = group.match(function (unit)
    return unit.alive and unit.buff(SB.SoothingMist).up
    end)
  else
    soothed_unit = nil
  end
  
  macro('/cqs')
  
  if GetItemCooldown(5512) == 0 and player.health.effective < 30 then
    macro('/use Healthstone')
  end

  if player.channeling(SB.SoothingMist) and soothed_unit and soothed_unit.health.effective > vivify + 5 then
    stopcast()
    soothed_unit = nil
  end

  if castable(SB.ThunderFocus)
  and (
    (talent(7, 3) 
      and player.combat 
      and target.castable(SB.RisingSunKick) 
      and spell(SB.EssenceFont).cooldown > 0 and spell(SB.EssenceFont).cooldown < 9 
      and (not talent(3, 2) or (talent(3, 2) and buff(SB.TeachingsoftheMonastery).count < 2)))
    or (player.channeling(SB.SoothingMist) and soothed_unit and soothed_unit.health.effective < vivify)
    ) then
    cast(SB.ThunderFocus)
  end

  if modifier.lalt and castable(SB.EssenceFont) then
    return cast(SB.EssenceFont)
  end

  if player.channeling(SB.EssenceFont) then return end
  
  if player.channeling(SB.SoothingMist) and soothed_unit then
    if soothed_unit and tank_unit 
    and soothed_unit.name and tank_unit.name
    and soothed_unit.name ~= tank_unit.name
    and soothed_unit.health.effective > tank_unit.health.effective
    and tank_unit.health.effective < envelope_mist 
    and tank_unit.castable(SB.EnvelopeMist) 
    and tank_unit.buff(SB.EnvelopeMist).down then
      return cast(SB.SoothingMist, tank_unit)
    end

    if soothed_unit and tank_unit 
    and soothed_unit.name and lowest_unit.name
    and soothed_unit.name ~= lowest_unit.name
    and soothed_unit.health.effective > lowest_unit.health.effective
    and lowest_unit.health.effective < envelope_mist 
    and lowest_unit.castable(SB.EnvelopeMist) 
    and lowest_unit.buff(SB.EnvelopeMist).down then
      return cast(SB.SoothingMist, lowest_unit)
    end

    if soothed_unit.castable(SB.EnvelopeMist) 
    and soothed_unit.buff(SB.EnvelopeMist).down 
    and soothed_unit.health.effective < envelope_mist then
      return cast(SB.EnvelopeMist, soothed_unit)
    end
    if soothed_unit.castable(SB.Vivify) 
    and soothed_unit.health.effective < vivify then
      return cast(SB.Vivify, soothed_unit)
    end
  end
  
  if not player.moving and not player.channeling(SB.SoothingMist) then
    if ((player.health.effective < envelope_mist and castable(SB.EnvelopeMist) and player.buff(SB.EnvelopeMist).down)
      or (player.health.effective < vivify and castable(SB.Vivify))
      ) then
      if toggle('cooldowns', false) and castable(SB.Berserking) then
        cast(SB.Berserking)
      end
      return cast(SB.SoothingMist, player)
    end

    if ((tank_unit.health.effective < envelope_mist and tank_unit.castable(SB.EnvelopeMist) and tank_unit.buff(SB.EnvelopeMist).down)
      or (tank_unit.health.effective < vivify and tank_unit.castable(SB.Vivify))
      ) then
      if toggle('cooldowns', false) and castable(SB.Berserking) then
        cast(SB.Berserking)
      end
      return cast(SB.SoothingMist, tank_unit)
    end

    if ((lowest_unit.health.effective < envelope_mist and lowest_unit.castable(SB.EnvelopeMist) and lowest_unit.buff(SB.EnvelopeMist).down)
      or (lowest_unit.health.effective < vivify and lowest_unit.castable(SB.Vivify))
      ) then
      if toggle('cooldowns', false) and castable(SB.Berserking) then
        cast(SB.Berserking)
      end
      return cast(SB.SoothingMist, lowest_unit)
    end
  end

  if castable(SB.EssenceFont) and group.under(essence_font, 30, true) >= 5 then
    if toggle('cooldowns', false) and castable(SB.Berserking) then
      cast(SB.Berserking)
    end
    return cast(SB.EssenceFont)
  end

  if castable(SB.RefreshingJadeWind) and group.under(70, 10, true) >= 5 and player.buff(SB.RefreshingJadeWind).down then
    return cast(SB.RefreshingJadeWind)
  end

  if toggle('dispell', false) then
    if castable(SB.Detox) and player.dispellable(SB.Detox) then
      return cast(SB.Detox, player)
    end

    local unit = group.dispellable(SB.Detox)
    if unit and unit.castable(SB.Detox) then
      return cast(SB.Detox, unit)
    end
  end

  if castable(SB.RenewingMist) 
  and player.health.effective < renewing_mist 
  and player.buff(SB.RenewingMist).down then
    return cast(SB.RenewingMist, player)
  end

  if lowest_unit.castable(SB.RenewingMist) 
  and lowest_unit.health.effective < renewing_mist 
  and lowest_unit.buff(SB.RenewingMist).down then
    return cast(SB.RenewingMist, lowest_unit)
  end

  local ally_without_renewing_mist = group.match(function (unit)
    return unit.alive and unit.health.effective < renewing_mist and unit.castable(SB.RenewingMist) and unit.buff(SB.RenewingMist).down
  end)

  if ally_without_renewing_mist then
    return cast(SB.RenewingMist, ally_without_renewing_mist)
  end
end

function interface()
  local mw_gui = {
    key = 'mw_nikopol',
    title = 'Mistweaver by Nikopol',
    width = 250,
    height = 320,
    resize = true,
    show = false,
    template = {
      { type = 'header', text = 'Mistweaver Settings' },
      { type = 'rule' },   
      { type = 'text', text = 'Healing Settings' },
      { key = 'envelope_mist', type = 'spinner', text = 'Envelope Mist', desc = 'Cast Envelope Mist on target below % health', min = 30, max = 80, step = 5, default = 55 },
      { key = 'vivify', type = 'spinner', text = 'Vivify', desc = 'Cast Vivify on target below % health', min = 50, max = 90, step = 5, default = 85 },
      { key = 'renewing_mist', type = 'spinner', text = 'Renewing Mist', desc = 'Cast Renewing Mist on target below % health', min = 70, max = 100, step = 5, default = 95 },
      { key = 'essence_font', type = 'spinner', text = 'Essence Font', desc = 'Cast Essence Font on targets below % health', min = 50, max = 95, step = 5, default = 70 },
      { type = 'rule' },
      { type = 'text', text = 'DPS Settings' },
      { key = 'rising_sun_kick', type = 'checkbox', text = 'Rising Sun Kick', desc = 'Cast Rising Sun Kick on cd.', default = false },
      { key = 'crackling_jade_lightning', type = 'checkbox', text = 'Crackling Jade Lightning', desc = 'Cast Crackling Jade Lightning on target.', default = false },
    }
  }

  configWindow = dark_addon.interface.builder.buildGUI(mw_gui)

  dark_addon.interface.buttons.add_toggle({
    name = 'dispell',
    label = 'Auto Dispell',
    on = {
      label = 'DSP',
      color = dark_addon.interface.color.green,
      color2 = dark_addon.interface.color.green
    },
    off = {
      label = 'dsp',
      color = dark_addon.interface.color.grey,
      color2 = dark_addon.interface.color.dark_grey
    }
  })
  dark_addon.interface.buttons.add_toggle({
    name = 'settings',
    label = 'Rotation Settings',
    font = 'dark_addon_icon',
    on = {
      label = dark_addon.interface.icon('cog'),
      color = dark_addon.interface.color.cyan,
      color2 = dark_addon.interface.color.dark_cyan
    },
    off = {
      label = dark_addon.interface.icon('cog'),
      color = dark_addon.interface.color.grey,
      color2 = dark_addon.interface.color.dark_grey
    },
    callback = function(self)
      if configWindow.parent:IsShown() then
        configWindow.parent:Hide()
      else
        configWindow.parent:Show()
      end
    end
  })
end

dark_addon.rotation.register({
  spec = dark_addon.rotation.classes.monk.mistweaver,
  name = 'mw_nikopol',
  label = 'Mistweaver by Nikopol',
  gcd = gcd,
  combat = combat,
  resting = resting,
  interface = interface
})
