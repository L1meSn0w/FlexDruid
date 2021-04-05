local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITdeathknight

-- To Do

-- Spells
SB.VirulentPlague = 191587
SB.Outbreak = 77575
SB.SoulReaper = 130736
SB.DarkTransformation = 63560
SB.Apocalypse = 275699
SB.FesteringWound = 197147
SB.DeathCoil = 47541
SB.SuddenDoom = 49530
SB.DeathandDecay = 43265
SB.Pestilence = 277234
SB.Defile = 152280
SB.ScourgeStrike = 55090
SB.ClawingShadows = 207311
SB.FesteringStrike = 85948
SB.UnholyFrenzy = 207289
SB.BurstingSores = 207264
SB.InfectedClaws = 207272
SB.ArmyoftheDead = 42650
SB.Epidemic = 207317
SB.SummonGargoyle = 49206
SB.AntiMagicShell = 48707
SB.DeathPact = 48743
SB.RaiseDead = 46584
SB.Claw = 47468
SB.DeathStrike = 49998
SB.UnholyBlight = 115989


local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

    -- Reading from settings
    local intpercentlow = dark_addon.settings.fetch('unhdk_settings_intpercentlow',50)
    local intpercenthigh = dark_addon.settings.fetch('unhdk_settings_intpercenthigh',65)
    local DPHealth = dark_addon.settings.fetch('unhdk_settings_DPHealth',50)
    local DSHealth = dark_addon.settings.fetch('unhdk_settings_DSHealth',80)
    local AMSHealth = dark_addon.settings.fetch('unhdk_settings_DSHealth',40)    
    local IFHealth = dark_addon.settings.fetch('unhdk_settings_DSHealth',20)

    -- Targets in range check
    local enemyCount = enemies.around(8)
    if enemyCount == 0 then enemyCount = 1 end    
    dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

    -- Auto Attack
     if target.enemy and target.alive and target.distance < 8 then
         auto_attack()
     end

--Ghoul
    if castable(SB.RaiseDead) and -spell(SB.RaiseDead) == 0 and not pet.exists then
      return cast(SB.RaiseDead, 'target')
    end

--Interrupt
     -- Define random number for interrupt
     local intpercent = math.random(intpercentlow,intpercenthigh)

    if toggle('interrupts', false) and castable(SB.MindFreeze, 'target') and -spell(SB.MindFreeze) == 0 and target.interrupt(intpercent, false) and target.distance < 30 then
      print('Mind Freeze @ ' .. intpercent)
      return cast(SB.MindFreeze, 'target')
    end

--Healing
  if castable(SB.DeathStrike) and -spell(SB.DeathStrike) == 0 and player.power.runicpower.actual >= 35 and -player.health <= DSHealth and player.buff(SB.DarkSuccor).up then
    return cast(SB.DeathStrike, 'target')
  end

  if castable(SB.DeathPact) and -player.health <= DPHealth and talent(5,3) then
      print('Death Pact @ ' .. DPHealth)
      return cast(SB.DeathPact)
  end  

--Defensives
--Anti-Magic Shell absorbs up to 30% of your maximum health in magic damage over 5 seconds, and should be used to mitigate magic damage and generate Runic Power.
    if castable(SB.AntiMagicShell) and -player.health <= AMSHealth then
        print('Anti Magic Shell ' .. AMSHealth)
        return cast(SB.AntiMagicShell)
    end

--Icebound Fortitude reduces all damage taken by 30% for 8 seconds. It should mostly be used proactively when you anticipate taking high damage, 
--such as from specific boss abilities.
    if castable(SB.IceboundFortitude) and -player.health <= IFHealth then
        print('Icebound Fortitude @ ' .. IFHealth)
        return cast(SB.IceboundFortitude)
    end    

--Cooldowns
--Army of the Dead
    if castable(SB.ArmyoftheDead) and -spell(SB.ArmyoftheDead) == 0 and toggle('cooldowns', false) then
      return cast(SB.ArmyoftheDead, 'target')
    end      

--Ghoul Claw Attack
    if castable(SB.Claw) and -spell(SB.Claw) == 0 then
      return cast(SB.Claw, 'target')
    end    

if talent(7,3) then



end  

if enemyCount == 1 then
--Maintain Virulent Plague on the target, using Outbreak to refresh it when it is about to expire.
    if castable(SB.Outbreak) and -spell(SB.Outbreak) == 0 and (not target.debuff(SB.VirulentPlague).up or target.debuff(SB.VirulentPlague).remains < 1) then
      return cast(SB.Outbreak, 'target')
    end

--Cast Soul Reaper if you have fewer than 2 Runes.
    if castable(SB.SoulReaper) and -spell(SB.SoulReaper) == 0 and player.power.runes.count < 2 and talent(4,1) then
      return cast(SB.SoulReaper, 'target')
    end

--Cast Dark Transformation
    if castable(SB.DarkTransformation) and -spell(SB.DarkTransformation) == 0 and toggle('cooldowns', false) then
      return cast(SB.DarkTransformation, 'target')
    end    

--Cast Apocalypse when you have 4 stacks of Festering Wound
    if castable(SB.Apocalypse) and -spell(SB.Apocalypse) == 0 and target.debuff(SB.FesteringWound).count >= 4 and toggle('cooldowns', false) then
      return cast(SB.Apocalypse, 'target')
    end 

--Cast Death Coil to avoid capping Runic Power (80+ Runic Power) OR if you have a proc of Sudden Doom
    if castable(SB.DeathCoil) and -spell(SB.DeathCoil) == 0 and (player.power.runicpower.actual >= 80 or player.buff(SB.SuddenDoom).up) then
      return cast(SB.DeathCoil, 'target')
    end

--Cast Death and Decay (if you have taken the talent Pestilence) / Defile on cooldown.
  if castable(SB.DeathandDecay) and -spell(SB.DeathandDecay) == 0 and talent(6,1) and not talent(6,2) then
    return cast(SB.DeathandDecay, 'player')
  end

--Cast Death and Decay (if you have taken the talent Pestilence) / Defile on cooldown.
  if castable(SB.Defile) and -spell(SB.Defile) == 0 and talent(6,1) and talent(6,2) then
    return cast(SB.Defile, 'player')
  end

--Cast Scourge Strike (or Clawing Shadows, if you have taken this talent), if there are 1+ Festering Wound on the target.
  if castable(SB.ScourgeStrike) and -spell(SB.ScourgeStrike) == 0 and target.debuff(SB.FesteringWound).up and not talent(1,3) then
    return cast(SB.ScourgeStrike, 'target')
  end

--Cast Scourge Strike (or Clawing Shadows, if you have taken this talent), if there are 1+ Festering Wound on the target.
  if castable(SB.ClawingShadows) and -spell(SB.ClawingShadows) == 0 and target.debuff(SB.FesteringWound).up and talent(1,3) then
    return cast(SB.ClawingShadows, 'target')
  end  

--If there are 0 Festering Wound on the target, use Festering Strike
  if castable(SB.FesteringStrike) and -spell(SB.FesteringStrike) == 0 and target.debuff(SB.FesteringWound).count == 0 then
    return cast(SB.FesteringStrike, 'target')
  end 

--Cast Festering Strike. This applies 2-3 stacks of the Festering Wound debuff, which caps at 6 stacks.
    -- Do not use Festering Strike if you are at maximum stacks, and ideally avoid wasting any potential stacks unless Apocalypse or will be available shortly
    -- (so try not to cast it when you have 4 or more stacks).
    if castable(SB.FesteringStrike) and -spell(SB.FesteringStrike) == 0 and target.debuff(SB.FesteringWound).count <= 4 then
      return cast(SB.FesteringStrike, 'target')
    end                

--Unholy Frenzy. In order to maximize this talent, you should use it when you are very low on Festering Wound
    -- and have at least 2 Runes available to cast Scourge Strike after using the cooldown.
    if castable(SB.UnholyFrenzy) and -spell(SB.UnholyFrenzy) == 0 and target.debuff(SB.FesteringWound).count <= 2 and player.power.runes.count >= 2 
    and toggle('cooldowns', false) then
      return cast(SB.UnholyFrenzy, 'target')
    end

--Cast Scourge Strike during Unholy Frenzy
	if castable(SB.ScourgeStrike) and -spell(SB.ScourgeStrike) == 0 and player.buff(SB.UnholyFrenzy).up and not talent(1,3) then
	  return cast(SB.ScourgeStrike, 'target')
	end

--Cast Clawing Shadows during Unholy Frenzy
  if castable(SB.ClawingShadows) and -spell(SB.ClawingShadows) == 0 and player.buff(SB.UnholyFrenzy).up and talent(1,3) then
    return cast(SB.ClawingShadows, 'target')
  end  

--Epidemic takes priority over Death Coil when there are 2+ targets.
    if castable(SB.Epidemic) and -spell(SB.Epidemic) == 0 and enemyCount >= 2 and talent(6,3) then
      return cast(SB.Epidemic, 'target')
    end

end

if enemyCount >= 2 then

--Maintain Virulent Plague on the target, using Outbreak to refresh it when it is about to expire.
    if castable(SB.Outbreak) and -spell(SB.Outbreak) == 0 and (not target.debuff(SB.VirulentPlague).up or target.debuff(SB.VirulentPlague).remains < 1) then
      return cast(SB.Outbreak, 'target')
    end

--Cast Dark Transformation
    if castable(SB.DarkTransformation) and -spell(SB.DarkTransformation) == 0 and toggle('cooldowns') then
      return cast(SB.DarkTransformation, 'target')
    end

--Cast Death and Decay
	if castable(SB.DeathandDecay) and -spell(SB.DeathandDecay) == 0 and not talent(6,2) then
	  return cast(SB.DeathandDecay, 'player')
  end

--Cast Defile
  if castable(SB.Defile) and -spell(SB.Defile) == 0 and talent(6,2) then
    return cast(SB.Defile, 'player')
  end

--Cast Scourge Strike while standing in Death and Decay
  if castable(SB.ScourgeStrike) and -spell(SB.ScourgeStrike) == 0 and (player.buff(SB.DeathandDecay).up or player.buff(SB.Defile).up) and not talent(1,3) then
    return cast(SB.ScourgeStrike, 'target')
  end

--Cast ClawingShadows while standing in Death and Decay
  if castable(SB.ClawingShadows) and -spell(SB.ClawingShadows) == 0 and (player.buff(SB.DeathandDecay).up or player.buff(SB.Defile).up) and talent(1,3) then
    return cast(SB.ClawingShadows, 'target')
  end       

--Use Festering Strike with fewer than 3 Festering Wound on the target (fewer than 4 if using the Infected Claws)
    if castable(SB.FesteringStrike) and -spell(SB.FesteringStrike) == 0 
    and ((target.debuff(SB.FesteringWound).count < 3 and not talent(1,1)) or (target.debuff(SB.FesteringWound).count < 4 and talent(1,1))) then
      return cast(SB.FesteringStrike, 'target')
    end

--Cast Scourge Strike with at least 1 Festering Wound
	if castable(SB.ScourgeStrike) and -spell(SB.ScourgeStrike) == 0 and target.debuff(SB.FesteringWound).up and not talent(1,3) then
	  return cast(SB.ScourgeStrike, 'target')
  end

--Cast ClawingShadows with at least 1 Festering Wound
  if castable(SB.ClawingShadows) and -spell(SB.ClawingShadows) == 0 and target.debuff(SB.FesteringWound).up and talent(1,3) then
    return cast(SB.ClawingShadows, 'target')
  end  

--Epidemic takes priority over Death Coil when there are 2+ targets.
    if castable(SB.Epidemic) and -spell(SB.Epidemic) == 0 and enemyCount >= 2 and talent(6,3) then
      return cast(SB.Epidemic, 'target')
    end

--Cast Unholy Blight
    if castable(SB.UnholyBlight) and -spell(SB.UnholyBlight) == 0 and talent(2,3) then
      return cast(SB.UnholyBlight, 'target')
    end     

--Cast Death Coil
    if castable(SB.DeathCoil) and -spell(SB.DeathCoil) == 0 then
      return cast(SB.DeathCoil, 'target')
    end    

end


end
end

local function resting()

    -- Targets in range check
    local enemyCount = enemies.around(8)
    dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

--Ghoul
    if castable(SB.RaiseDead) and -spell(SB.RaiseDead) == 0 and not pet.exists and not UnitInVehicle('player') then
      return cast(SB.RaiseDead, 'target')
    end

end

local function interface()

    local settings = {
        key = 'unhdk_settings',
        title = 'Unholy Deathknight',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Unholy Deathknight Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Apocalypse, Army of the Dead, Dark Transformation, and Unholy Frenzy are all managed by the Cooldowns toggle' },
            { type = 'text', text = 'It is assumed you will use Asphyxiate and Wraith Walk manually' },                        
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'rule' },
            { type = 'text', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'text', text = 'Defensive Settings' },
            { key = 'DPHealth', type = 'spinner', text = 'Death Pact at Health %', default = '50', desc = 'cast Death Pact at', min = 0, max = 100, step = 1 },
            { key = 'DSHealth', type = 'spinner', text = 'Death Strike at Health %', default = '80', desc = 'cast Death Strike at', min = 0, max = 100, step = 1 },
            { key = 'AMSHealth', type = 'spinner', text = 'Anti Magic Shell at Health %', default = '40', desc = 'cast Anti Magic Shell at', min = 0, max = 100, step = 1 },
            { key = 'IFHealth', type = 'spinner', text = 'Icebound Fortitude at Health %', default = '20', desc = 'cast Icebound Fortitude at', min = 0, max = 100, step = 1 },                        
            { key = 'healthstone', type = 'checkspin', default = '20', text = 'Healthstone', desc = 'use Healthstone at health %', min = 1, max = 100, step = 1 },
        }
    }

    configWindow = dark_addon.interface.builder.buildGUI(settings)

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
  spec = dark_addon.rotation.classes.deathknight.unholy,
  name = 'RexUnhDK',
  label = 'Rex Unholy Deathknight',
  combat = combat,
  resting = resting,
  interface = interface
})
