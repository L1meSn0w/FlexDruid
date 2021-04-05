-- Brewmaster Monk for 8.1 by Nikopol - 12/2018
-- Talents: 
-- Left Control - Leg Sweep
-- Left Alt - Tiger's Lust
-- Left Shift - Vivify self
local dark_addon = dark_interface
local SB = m2jue4dgc56acfzz

local function gcd()
  if not player.alive then return end
  
  if GetItemCooldown(5512) == 0 and player.health.effective < 30 then
    macro('/use Healthstone')
  end
  
  if castable(SB.HealingElixir) and player.health.effective < 30 then
    cast(SB.HealingElixir)
  end
  
  if castable(SB.FortBrew) and player.health.effective < 20 then
    cast(SB.FortBrew)
  end
  
  if castable(SB.BlackOxBrew) and spell(SB.PurifyingBrew).charges == 0 then
    cast(SB.BlackOxBrew)
  end
  
  if castable(SB.PurifyingBrew) 
    and player.debuff(SB.HeavyStagger).up 
    and (spell(SB.PurifyingBrew).charges > 1 or (spell(SB.PurifyingBrew).charges == 1 and player.buff(SB.IronskinBrew).remains > 14))
    and player.buff(SB.IronskinBrew).up then
    cast(SB.PurifyingBrew)
  end
  
  if castable(SB.IronskinBrew)
    and (player.buff(SB.IronskinBrew).down or player.buff(SB.IronskinBrew).remains <= 14) then
    cast(SB.IronskinBrew)
  end
  
  if target.enemy and target.alive and target.distance <= 5 and toggle('interrupts', false) and target.interrupt(70) then
    if castable(SB.SpearHandStrike) then
      cast(SB.SpearHandStrike, target)
    end
  end
end

local function combat()
  if not player.alive then return end
  
  if GetCVar("nameplateShowEnemies") == '0' then
    SetCVar("nameplateShowEnemies", 1)
  end
  
  macro('/cqs')
  
  if modifier.lcontrol and castable(SB.LegSweep) then
    return cast(SB.LegSweep)
  end
  
  if modifier.lshift and castable(SB.Vivify) then
    return cast(SB.Vivify, player)
  end
  
  if modifier.lalt and castable(SB.TigersLust) then
    return cast(SB.TigersLust, player)
  end
  
  if GetItemCooldown(5512) == 0 and player.health.effective < 30 then
    macro('/use Healthstone')
  end
  
  if castable(SB.HealingElixir) and player.health.effective < 30 then
    cast(SB.HealingElixir)
  end
  
  if castable(SB.FortBrew) and player.health.effective < 20 then
    cast(SB.FortBrew)
  end
  
  if castable(SB.BlackOxBrew) and spell(SB.PurifyingBrew).charges == 0 then
    cast(SB.BlackOxBrew)
  end
  
  if castable(SB.PurifyingBrew) 
    and player.debuff(SB.HeavyStagger).up 
    and (spell(SB.PurifyingBrew).charges > 1 or (spell(SB.PurifyingBrew).charges == 1 and player.buff(SB.IronskinBrew).remains > 14))
    and player.buff(SB.IronskinBrew).up then
    cast(SB.PurifyingBrew)
  end
  
  if castable(SB.IronskinBrew)
    and (player.buff(SB.IronskinBrew).down or player.buff(SB.IronskinBrew).remains <= 14) then
    cast(SB.IronskinBrew)
  end
  
  if toggle('dispell', false) and castable(SB.DetoxDPS) and player.dispellable(SB.DetoxDPS) then
    return cast(SB.DetoxDPS, player)
  end
  
  if toggle('auto_target', false) then
    local nearest_target = enemies.match(function (unit)
      return unit.alive and unit.combat and unit.distance <= 5
    end)
    
    if (not target.exists or target.distance > 5) and nearest_target and nearest_target.name then
      macro('/target ' .. nearest_target.name)
    end
  end
  
  if target.enemy and target.alive then
    auto_attack()
    
    if toggle('cooldowns', false) and target.distance <= 5 then
      if castable(SB.Berserking) then
        cast(SB.Berserking)
      end
    end
    
    if toggle('interrupts', false) and target.interrupt(70) then
      if target.castable(SB.SpearHandStrike) then
        return cast(SB.SpearHandStrike, target)
      end
      
      if castable(SB.LegSweep) and target.distance <= 7 then
        return cast(SB.LegSweep)
      end

      if spell(SB.LegSweep).cooldown > 0 and target.castable(SB.Paralysis) then
        return cast(SB.Paralysis, target)
      end
    end
        
    if enemies.around(5) < 3 or not toggle('multitarget', false) then
      if player.buff(SB.BlackoutCombo).up and target.castable(SB.TigerPalm) then
        return cast(SB.TigerPalm, target)
      end
      
      if castable(SB.BlackoutStrike) and target.distance <= 5 then
        return cast(SB.BlackoutStrike, target)
      end
      
      if target.castable(SB.KegSmash) then
        return cast(SB.KegSmash, target)
      end
      
      if castable(SB.BreathofFire) and target.distance <= 12 then
        return cast(SB.BreathofFire)
      end
      
      if target.castable(SB.TigerPalm) and player.power.energy.actual > 90 then
        return cast(SB.TigerPalm, target)
      end
      
      if castable(SB.RushingJadeWind) and player.buff(SB.RushingJadeWind).remains < 1 and target.distance <= 8 then
        return cast(SB.RushingJadeWind)
      end
      
      if not player.moving and castable(SB.ChiBurst) and target.distance <= 40 then
        return cast(SB.ChiBurst)
      end
      
      if castable(SB.ChiWave) and target.distance <= 25 then
        return cast(SB.ChiWave)
      end
      
      if target.castable(SB.TigerPalm) and player.power.energy.actual > 55 then
        return cast(SB.TigerPalm, target)
      end
      
      if castable(SB.RushingJadeWind) and target.distance <= 8 then
        return cast(SB.RushingJadeWind)
      end
    end
    
    if toggle('multitarget', false) and enemies.around(5) >= 3 then
      if target.castable(SB.KegSmash) then
        return cast(SB.KegSmash, target)
      end
      
      if castable(SB.BreathofFire) and target.distance <= 12 then
        return cast(SB.BreathofFire)
      end
      
      if castable(SB.RushingJadeWind) and player.buff(SB.RushingJadeWind).remains < 1 and target.distance <= 8 then
        return cast(SB.RushingJadeWind)
      end
      
      if not player.moving and castable(SB.ChiBurst) and target.distance <= 40 then
        return cast(SB.ChiBurst)
      end
      
      if castable(SB.BlackoutStrike) and target.distance <= 5 then
        return cast(SB.BlackoutStrike, target)
      end
      
      if player.buff(SB.BlackoutCombo).up and target.castable(SB.TigerPalm) then
        return cast(SB.TigerPalm, target)
      end
      
      if castable(SB.ChiWave) and target.distance <= 25 then
        return cast(SB.ChiWave)
      end
      
      if target.castable(SB.TigerPalm) and player.power.energy.actual > 55 then
        return cast(SB.TigerPalm, target)
      end
      
      if castable(SB.RushingJadeWind) and target.distance <= 8 then
        return cast(SB.RushingJadeWind)
      end
    end
  end
end

local function resting()
  if not player.alive then return end
  
  if modifier.lshift and castable(SB.Vivify) then
    return cast(SB.Vivify, player)
  end
  
  if player.health.effective < 50 and castable(SB.Vivify) and not player.moving then
    return cast(SB.Vivify, player)
  end

  if toggle('dispell', false) and castable(SB.DetoxDPS) and player.dispellable(SB.DetoxDPS) then
    return cast(SB.DetoxDPS, player)
  end
end

function interface()
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
    name = 'auto_target',
    label = 'Auto Target',
    on = {
      label = 'AT',
      color = dark_addon.interface.color.green,
      color2 = dark_addon.interface.color.green
    },
    off = {
      label = 'at',
      color = dark_addon.interface.color.grey,
      color2 = dark_addon.interface.color.dark_grey
    }
  })
end

dark_addon.rotation.register({
  spec = dark_addon.rotation.classes.monk.brewmaster,
  name = 'br_nikopol',
  label = 'Brewmaster by Nikopol',
  gcd = gcd,
  combat = combat,
  resting = resting,
  interface = interface
})
