local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITshaman

-- Talents
-- Only supports 1 3 2 2 1 3 2

local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then
  
  -- Auto Attack
  if target.enemy and target.alive and target.distance < 8 then
    auto_attack()
  end
  
  -- Define random number for interrupt
    local intpercent = math.random(65,80)
  
  -- Defensive Spells
    if castable(SB.EarthShield) and not -buff(SB.EarthShield) then
  		return cast(SB.EarthShield)
  	end
  
  -- Healing
    if castable(SB.HealingSurge) and -player.health <= 30 then
      print('Heal @' .. -player.health)
  		return cast(SB.HealingSurge)
  	end
  
  -- Interrupts
    if castable(SB.WindShear, 'target') and -spell(SB.WindShear) == 0 and target.interrupt(intpercent, false) then
      print('Interrupt @' .. intpercent)
      return cast(SB.WindShear, 'target')
    end
    
    if not toggle('multitarget') then
      
    --Cast Totem Mastery if any of the following are true. It is absent. You are out of range of a previous set of totems.
      if castable(SB.TotemMastery, 'target') and -spell(SB.TotemMastery) == 0 and not -buff(SB.StormTotem) then
        return cast(SB.TotemMastery)
      end     
    
    --Apply Flame Shock if any of the following are true. It is absent. It will expire in 6 seconds or less. You have no more than 13 stacks of Wind Gust
      if castable(SB.FlameShock, 'target') and -spell(SB.FlameShock) == 0 and (not -target.debuff(SB.FlameShock) or target.debuff(SB.FlameShock).remains <= 6) then
        return cast(SB.FlameShock)
      end    
    
    --Cast Fire Elemental (or Storm Elemental if talented) if it is off cooldown. Always pair your elemental with Haste buffs (e.g. Bloodlust/Heroism) if possible, but do not sacrifice an extra usage by delaying your elemental.
      if toggle('cooldowns') and castable(SB.StormElemental, 'target') and -spell(SB.StormElemental) == 0 and not pet.exists then
        return cast(SB.StormElemental)
      end    
    
    --Cast Earth Elemental if it is off cooldown and you either are not using Primal Elementalist or your Fire Elemental is not currently active. You cannot have 2 Primal Elementals active at the same time.
      if toggle('cooldowns') and castable(SB.EarthElemental, 'target') and -spell(SB.EarthElemental) == 0 and not pet.exists then
        return cast(SB.EarthElemental)
      end    
    
    --Cast Stormkeeper whenever available. Delay the usage if 3+ targets will be present within the span of its cooldown.
      if castable(SB.Stormkeeper, 'target') and -spell(SB.Stormkeeper) == 0 then
        return cast(SB.Stormkeeper)
      end    
    
    --Cast Lightning Bolt empowered by Stormkeeper if Surge of Power is active, or if Master of the Elements is active and you are not using Surge of Power as a talent.
    --Cast Earth Shock if you have 90 or more Maelstrom. If you are using Surge of Power or Master of the Elements, read the paragraphs below.
      if castable(SB.EarthShock, 'target') and -spell(SB.EarthShock) == 0 and -power.maelstrom >= 90 then
        return cast(SB.EarthShock)
      end     
    
    --Cast Lightning Bolt if Storm Elemental is active.
    --Cast Frost Shock if both the Icefury and Master of the Elements buffs are active.
    --Cast Lava Burst whenever available.
      if castable(SB.LavaBurst, 'target') and -spell(SB.LavaBurst) == 0 then
        return cast(SB.LavaBurst)
      end
    
    --Cast Frost Shock if any Icefury buff is active
      if castable(SB.FrostShock, 'target') and -spell(SB.FrostShock) == 0 and -buff(SB.Icefury) then
        return cast(SB.FrostShock)
      end    
        
    --Cast Icefury
      if castable(SB.Icefury, 'target') and -spell(SB.Icefury) == 0 then
        return cast(SB.Icefury)
      end    
    
    --Cast Totem Mastery if it has 9 seconds remaining or less.
      if castable(SB.TotemMastery, 'target') and -spell(SB.TotemMastery) == 0 and -buff(SB.StormTotem).remains <= 9 then
        return cast(SB.TotemMastery)
      end
      
    --Cast Earth Shock if Maelstrom is 60 or greater and Lava Surge is not available.
      if castable(SB.EarthShock, 'target') and -spell(SB.EarthShock) == 0 and -power.maelstrom >= 60 and not -buff(SB.LavaSurge) then
        return cast(SB.EarthShock)
      end     
    
    --Cast Lightning Bolt as a filler on a single target.
      if castable(SB.LightningBolt, 'target') and -spell(SB.LightningBolt) == 0 then
        return cast(SB.LightningBolt)
      end
    
    --Cast Frost Shock as a filler while moving.
      if player.moving and castable(SB.FrostShock, 'target') and -spell(SB.FrostShock) == 0 then
        return cast(SB.FrostShock)
      end
    
  end
  
  if toggle('multitarget') then
    
    --Preferably have Totem Mastery up (unless the targets will not live for more than 30 seconds).
      if castable(SB.TotemMastery, 'target') and -spell(SB.TotemMastery) == 0 and not -buff(SB.StormTotem) then
        return cast(SB.TotemMastery)
      end    
    
    --Cast Stormkeeper on cooldown.
      if castable(SB.Stormkeeper, 'target') and -spell(SB.Stormkeeper) == 0 then
        return cast(SB.Stormkeeper)
      end    
    
    --Maintain Flame Shock on 3* (read below) targets.
      if castable(SB.FlameShock, 'target') and -spell(SB.FlameShock) == 0 and (not -target.debuff(SB.FlameShock) or target.debuff(SB.FlameShock).remains <= 6) then
        return cast(SB.FlameShock)
      end    
    
    --Spend all Maelstrom on Earthquake. If possible, buff them with Master of the Elements
      if castable(SB.Earthquake, 'ground') and -spell(SB.Earthquake) == 0 and -power.maelstrom >= 60 then
        return cast(SB.Earthquake)
      end    
    
    --If using both Storm Elemental and Primal Elementalist make sure you use Eye of the Storm (but not before casting one Call Lightning).
    --Cast Chain Lightning to generate Maelstrom.
      if castable(SB.ChainLightning, 'target') and -spell(SB.ChainLightning) == 0 then
        return cast(SB.ChainLightning)
      end    
    
  end  

end
end

local function resting()
  -- your resting rotation here!
end

-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register({
  spec = dark_addon.rotation.classes.shaman.elemental,
  name = 'RexBasicElemental',
  label = 'Rex Basic Elemental Shaman',
  combat = combat,
  resting = resting,
})
