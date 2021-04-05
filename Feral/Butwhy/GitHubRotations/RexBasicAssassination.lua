local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITrogue

-- Talents
-- Only supports 2 2 1 2 3 2 1

local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then
  
  -- Auto Attack
  if target.enemy and target.alive and target.distance < 8 then
    auto_attack()
  end  
  
  -- Targets in range function
  local inRange = 0
    for i = 1, 40 do
      if UnitExists('nameplate' .. i) and IsSpellInRange('Kick', 'nameplate' .. i) == 1 and UnitAffectingCombat('nameplate' .. i) then
        inRange = inRange + 1
      end
    end
  
  -- Define random number for interrupt
    local intpercent = math.random(65,80)
  
  -- Defensive Spells
  -- Feint reduces AoE damage taken by 40% for 5 seconds for only 35 Energy.
    if castable(SB.Feint) and -spell(SB.Feint) == 0 and -player.health <= 30 and player.power.energy.actual >= 35 then
  		return cast(SB.Feint)
  	end
    
  -- Evasion increases your Dodge chance by 100% for 10 seconds. This can be useful if you have to tank some adds or the boss for a few seconds.
    if castable(SB.Evasion) and -spell(SB.Evasion) == 0 and -player.health <= 20 then
  		return cast(SB.Evasion)
  	end
    
  -- Healing
  -- Crimson Vial provides a respectable amount of healing on a very short cooldown
    if castable(SB.CrimsonVial) and -spell(SB.CrimsonVial) == 0 and -player.health <= 70 then
      print('Heal @' .. -player.health)
  		return cast(SB.CrimsonVial)
  	end  
  
  -- Interrupts
    if castable(SB.Kick, 'target') and -spell(SB.Kick) == 0 and target.interrupt(intpercent, false) then
      print('Interrupt @' .. intpercent)
      return cast(SB.Kick, 'target')
    end
    
    if (inRange == 1 or not toggle('multitarget')) then
      
      --Single Target
      --Maintain Rupture (4+ Combo Points).
        if castable(SB.Rupture, 'target') and -spell(SB.Rupture) == 0 and (not -target.debuff(SB.Rupture) or target.debuff(SB.Rupture).remains <= 6) and player.power.combopoints.actual >= 4 and player.power.energy.actual >= 25 then
          return cast(SB.Rupture)
        end
      
      --Activate Vendetta when available.
        if toggle('cooldowns') and castable(SB.Vendetta, 'target') and -spell(SB.Vendetta) == 0 then
          return cast(SB.Vendetta)
        end      
      
      --Activate Vanish on cooldown if using Subterfuge or with 5 Combo Points in order to facilitate Nightstalker -empowered Rupture
        if toggle('cooldowns') and castable(SB.Vanish, 'target') and -spell(SB.Vanish) == 0 and -spell(SB.Garrote) == 0 and player.power.energy.actual >= 45 then
          return cast(SB.Vanish)
        end
        
      --Maintain Garrote
        if castable(SB.Garrote, 'target') and -spell(SB.Garrote) == 0 and (not -target.debuff(SB.Garrote) or target.debuff(SB.Garrote).remains <= 5.4) and player.power.energy.actual >= 45 then
          return cast(SB.Garrote)
        end
        
      --Cast Toxic Blade when available, if you have chosen this talent.
        if castable(SB.ToxicBlade, 'target') and -spell(SB.ToxicBlade) == 0 and player.power.energy.actual >= 20 then
          return cast(SB.ToxicBlade)
        end
        
      --Cast Exsanguinate on cooldown, if your Rupture has more than 20 seconds remaining, and Garrote is above 50% of its duration.
      --Cast Envenom with 4-5 Combo Points (5-6 with Deeper Stratagem).
        if castable(SB.Envenom, 'target') and -spell(SB.Envenom) == 0 and player.power.combopoints.actual >= 4 and player.power.energy.actual >= 35 then
          return cast(SB.Envenom)
        end      
      
      --Cast Poisoned Knife when Sharpened Blades is above 29 stacks.
      --Cast Fan of Knives when Hidden Blades is above 19 stacks.
      --Cast Blindside when available, if you have chosen this talent.
      --Cast Mutilate to generate Combo Points (do not use it if Blindside is available).
        if castable(SB.Mutilate, 'target') and -spell(SB.Mutilate) == 0 and player.power.combopoints.actual <= 3 and player.power.energy.actual >= 50 then
          return cast(SB.Mutilate)
        end      
    end
    
    if (inRange >= 2 or toggle('multitarget')) then
      
      --Multi-Target
      --Maintain Rupture on up to 3 targets.
        if castable(SB.Rupture, 'target') and -spell(SB.Rupture) == 0 and (not -target.debuff(SB.Rupture) or target.debuff(SB.Rupture).remains <= 6) and player.power.combopoints.actual >= 4 and player.power.energy.actual >= 25 then
          return cast(SB.Rupture)
        end      
      
      --Activate Vendetta when available.
        if toggle('cooldowns') and castable(SB.Vendetta, 'target') and -spell(SB.Vendetta) == 0 then
          return cast(SB.Vendetta)
        end      
      
      --Activate Vanish and apply Garrote empowered by Subterfuge to as many targets as possible.
        if toggle('cooldowns') and castable(SB.Vanish, 'target') and -spell(SB.Vanish) == 0 and -spell(SB.Garrote) == 0 and player.power.energy.actual >= 45 then
          return cast(SB.Vanish)
        end
        
      --Maintain Garrote on up to 3 targets (try to not overwrite empowered ones).
        if castable(SB.Garrote, 'target') and -spell(SB.Garrote) == 0 and (not -target.debuff(SB.Garrote) or target.debuff(SB.Garrote).remains <= 5.4) and player.power.energy.actual >= 45 then
          return cast(SB.Garrote)
        end      
      
      --Cast Crimson Tempest with 4-5 Combo Points.
      --Cast Envenom with 4-5 Combo Points (do not use it if you have Crimson Tempest talented).
        if castable(SB.Envenom, 'target') and -spell(SB.Envenom) == 0 and player.power.combopoints.actual >= 4 and player.power.energy.actual >= 35 then
          return cast(SB.Envenom)
        end      
      
      --Cast Poisoned Knife when Sharpened Blades is above 29 stacks.
      
      --Cast Fan of Knives when 2+ targets are within range to generate Combo Points.
        if castable(SB.FanOfKnives, 'target') and -spell(SB.FanOfKnives) == 0 and player.power.combopoints.actual <= 3 and player.power.energy.actual >= 35 then
          return cast(SB.FanOfKnives)
        end
    end    

end
end

local function resting()
  
  -- Apply Deadly Poison
    if castable(SB.DeadlyPoison) and not -buff(SB.DeadlyPoison) then
  		return cast(SB.DeadlyPoison)
  	end
    
    if castable(SB.Garrote, 'target') and player.spell(SB.Vanish).lastcast then
      return cast(SB.Garrote)
    end     
  
end

-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register({
  spec = dark_addon.rotation.classes.rogue.assassination,
  name = 'RexBasicAssassination',
  label = 'Rex Basic Assassination Rogue',
  combat = combat,
  resting = resting,
})
