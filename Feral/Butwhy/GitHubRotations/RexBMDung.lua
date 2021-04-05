local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GIThunter

-- To Do

-- Spells
SB.KillCommand = 34026
SB.BarbedShot = 217200
SB.CobraShot = 193455
SB.CallPet1 = 883
SB.CallPet2 = 83242
SB.CallPet3 = 83243
SB.CallPet4 = 83244
SB.CallPet5 = 83245
SB.MendPet = 136
SB.RevivePet = 982
SB.MultiShot = 2643
SB.BestialWrath = 19574
SB.CounterShot = 147362
SB.AspectOfTheWild = 193530
SB.Frenzy = 272790
SB.BeastCleave = 268877
SB.Exhilaration = 109304
SB.FeignDeath = 5384
SB.Misdirection = 34477
SB.Intimidation = 19577

local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

--Reading from settings
local intpercentlow = dark_addon.settings.fetch('BMHunt_settings_intpercentlow',50)
local intpercenthigh = dark_addon.settings.fetch('BMHunt_settings_intpercenthigh',65)
local PetHealth = dark_addon.settings.fetch('BMHunt_settings_PetHealth',70)

  --Targets in range check
  local enemyCount = enemies.around(8)

  local enemyPet = enemies.count(function (unit)
    -- this is example logic. you can write any logic for unit
    --return unit.alive and unit.combat and unit.distance >= target.distance - 8 and unit.distance <= target.distance + 8 and target.distance <= 40
    --return unit.alive and unit.combat and unit.distance >= pet.distance - 8 and unit.distance <= pet.distance + 8 and unit.distance <= 40
    --return unit.alive and unit.combat and unit.distance == pet.distance
    return unit.alive and unit.distance >= (pet.distance - 5) and unit.distance <= (pet.distance + 5) and unit.distance <= 40
    --return unit.alive and unit.distance == pet.distance
    end)

    if enemyCount == 0 then enemyCount = 1 end
    if enemyPet == 0 then enemyPet = 1 end

  dark_addon.interface.status_extra('Rng#:' .. enemyPet .. ' Mel#:' .. enemyCount .. ' D:' .. target.distance)

  -- Auto Attack
  if target.enemy and target.alive and target.distance < 40 then
    auto_shot()
  end

--Pet Management
--Pet Summon
--  if castable(SB.CallPet1) and -spell(SB.CallPet1) == 0 and not pet.exists then
--    return cast(SB.CallPet1)
--  end

--Pet Healing
if castable(SB.MendPet) and -spell(SB.MendPet) == 0 and pet.health.percent <= 70  then
    return cast(SB.MendPet)
end
if castable(SB.Exhilaration) and -spell(SB.Exhilaration) == 0 and pet.health.percent <= 20  then
    return cast(SB.Exhilaration)
end

--Pet Revive
if castable(SB.RevivePet) and -spell(SB.RevivePet) == 0 and pet.dead then
    return cast(SB.RevivePet)
end

--Feign Death
if castable(SB.FeignDeath) and -spell(SB.FeignDeath) == 0 and player.health.percent <= 20  then
    return cast(SB.FeignDeath)
end

--Interrupt
--Define random number for interrupt
  local intpercent = math.random(intpercentlow,intpercenthigh)

  if toggle('interrupts', false) and castable(SB.CounterShot, 'target') and -spell(SB.CounterShot) == 0 and target.interrupt(intpercent, false) and target.distance < 40 then
    print('Counter Shot @ ' .. intpercent)
    return cast(SB.CounterShot, 'target')
  end
  if toggle('interrupts', false) and castable(SB.Intimidation, 'target') and -spell(SB.Intimidation) > 1 and target.interrupt(intpercent, false) and target.distance < 40 then
    print('Intimidation @ ' .. intpercent)
    return cast(SB.Intimidation, 'target')
  end
--Rotation
--Essences
if useessences and castable(SB.ConcentratedFlame) and -spell(SB.ConcentratedFlame) == 0 then
  return cast(SB.ConcentratedFlame, 'target')
end
--Cast Misdirection on pet
if castable(SB.Misdirection) and -spell(SB.Misdirection) == 0 and pet.exists then
  return cast(SB.Misdirection, 'pet')
end
--When fighting 2 targets or above, you should try to keep up  Beast Cleave with 100% uptime, ideally never letting it drop
-- for any reason other than Essence and Trinket casts that take more than 3 seconds to perform.
--Cast Multi-Shot when there are a lot of targets active, so you can hit them all. 
if toggle("multitarget", false) and castable(SB.MultiShot) and -spell(SB.MultiShot) == 0 and enemyPet >= 2 and player.buff(SB.BeastCleave).remains <= 1 then
    return cast(SB.MultiShot, 'target')
end
--Use  Worldvein Resonance on cooldown. If you can delay it for a few seconds to line up with  Aspect of the Wild, then you should do so.
--Cast  Barbed Shot when the  Frenzy buff on your pet is about to expire or when you are close to 2 charges of Barbed Shot, refreshing Frenzy as late as possible
--without dropping it. This is a higher priority than not wasting  Bestial Wrath cooldown reduction.
if castable(SB.BarbedShot) and -spell(SB.BarbedShot) == 0 and spell(SB.BarbedShot).fractionalcharges >= 1 and pet.buff(SB.Frenzy).remains <= 1.75 then
    return cast(SB.BarbedShot, "target")
end
--Cast  Bestial Wrath on cooldown. If  Aspect of the Wild is coming up within 15 seconds, delay it to sync them up.
if toggle("cooldowns", false) and castable(SB.BestialWrath) and -spell(SB.BestialWrath) == 0 and (-spell(SB.AspectOfTheWild) > 20 or target.time_to_die < 15) then
    return cast(SB.BestialWrath)
end
--Cast  Aspect of the Wild on cooldown. Spend all of your  Barbed Shot charges before using it if you have Primal Instincts.
if toggle("cooldowns", false) and castable(SB.AspectOfTheWild) and -spell(SB.AspectOfTheWild) == 0 then
    return cast(SB.AspectOfTheWild)
end
--Cast  Barbed Shot under the following conditions (aside from refreshing  Frenzy):
--if you have over 40% Crit, you have 2 or more  Dance of Death Traits, and  Dance of Death is not up;
--If you are about to cast  Aspect of the Wild, you should cast all of your Barbed Shots so that you have 0 charges left.
--if castable(SB.BarbedShot) and -(SB.BarbedShot) == 0 and spell(SB.BarbedShot).charges >= 1 and pet.buff(SB.PetFrenzy).remains <= 1.75 and castable(SB.BarbedShot) then
--    return cast(SB.BarbedShot, "target")
--end
--Cast  Kill Command on cooldown.
if castable(SB.KillCommand) and -spell(SB.KillCommand) == 0 then
    return cast(SB.KillCommand, 'target')
end
--Cast  Barbed Shot when it has over ~1.5 charges. This means casting it whenever the second charge is halfway to being off cooldown.
if castable(SB.BarbedShot) and -spell(SB.BarbedShot) == 0 and spell(SB.BarbedShot).fractionalcharges >= 1.6 then
    return cast(SB.BarbedShot, "target")
end
--Cast  Cobra Shot when you have a lot of Focus to burn, and when  Kill Command is not coming off cooldown within 2.5 seconds.
if castable(SB.CobraShot) and -spell(SB.CobraShot) == 0 and -power.focus >= 80 and -spell(SB.KillCommand) >= 2.5 then
    return cast(SB.CobraShot, "target")
end
--Cast  Barbed Shot as a filler if it will reach 2 charges before your  Frenzy buff expires.
if castable(SB.BarbedShot) and -spell(SB.BarbedShot) == 0 and spell(SB.BarbedShot).charges == 2 then
    return cast(SB.BarbedShot, "target")
end

end
end

local function resting()

  local pettocall = dark_addon.settings.fetch('BMHunt_settings_pet')  

--Pet Summon
  if castable(SB.CallPet1) and -spell(SB.CallPet1) == 0 and not pet.exists and pettocall == "pet1" then
    return cast(SB.CallPet1)
  end
  if castable(SB.CallPet2) and -spell(SB.CallPet2) == 0 and not pet.exists and pettocall == "pet2" then
    return cast(SB.CallPet2)
  end
  if castable(SB.CallPet3) and -spell(SB.CallPet3) == 0 and not pet.exists and pettocall == "pet3" then
    return cast(SB.CallPet3)
  end
  if castable(SB.CallPet4) and -spell(SB.CallPet4) == 0 and not pet.exists and pettocall == "pet4" then
    return cast(SB.CallPet4)
  end
  if castable(SB.CallPet5) and -spell(SB.CallPet5) == 0 and not pet.exists and pettocall == "pet5" then
    return cast(SB.CallPet5)
  end
  

--Pet Healing
	if castable(SB.MendPet) and -spell(SB.MendPet) == 0 and pet.health.percent <= 70  then
		return cast(SB.MendPet)
  end
  
  if target.alive and target.enemy and player.alive and not player.channeling() and target.distance < 40 then      
    --Open with Kill Command or AutoAttack
    if castable(SB.KillCommand) and -spell(SB.KillCommand) == 0 then
      return cast(SB.KillCommand, 'target')
    end
    if target.enemy and target.alive and target.distance < 40 then
      auto_shot()
    end
  end  

end

local function interface()

   local settings = 
   {
    key = 'BMHunt_settings',
    title = 'Beastmastery Hunter',
    width = 300,
    height = 500,
    resize = true,
    show = false,
    template = 
	    {
	      { type = 'header', text = "            Rex's Beastmastery Hunter Settings" },
	      { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
	      { type = 'rule' },
	      { type = 'text', text = 'Interrupt Settings' },
	      { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
	      { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
	      { type = 'text', text = 'Defensive Settings' },
        { key = 'PetHealth', type = 'spinner', text = 'Mend Pet at Health %', default = '70', desc = 'cast Mend Pet at', min = 0, max = 100, step = 1 },
        { type = 'rule' },
        { key = 'pet', type = 'dropdown', text = 'Pet to use', desc = '', default = 'Pet 1',
        list = {
          { key = 'pet1', text = 'Pet 1' },
          { key = 'pet2', text = 'Pet 2' },
          { key = 'pet3', text = 'Pet 3' },
          { key = 'pet4', text = 'Pet 4' },
          { key = 'pet5', text = 'Pet 5' },
        }
      },
	    }
    }

    configWindow = dark_addon.interface.builder.buildGUI(settings)

    dark_addon.interface.buttons.add_toggle({
	    name = 'settings',
	    label = 'Rotation Settings',
	    font = 'dark_addon_icon',
	    on = 
	    {
	    	label = dark_addon.interface.icon('cog'),
	      color = dark_addon.interface.color.cyan,
	      color2 = dark_addon.interface.color.dark_cyan
	    },
	    off = 
	    {
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
    spec = dark_addon.rotation.classes.hunter.beastmastery,
    name = 'RexBMDung',
    label = 'Rex Beastmastery Hunter',
    combat = combat,
    resting = resting,
    interface = interface
})
