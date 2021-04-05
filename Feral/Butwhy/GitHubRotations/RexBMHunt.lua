local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GIThunter

-- To Do

-- Spells
SB.KillCommand = 34026
SB.BarbedShot = 217200
SB.CobraShot = 193455
SB.CallPet1 = 883
SB.MendPet = 136
SB.RevivePet = 982
SB.MultiShot = 2643
SB.BestialWrath = 19574


local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

	--Reading from settings
	local intpercentlow = dark_addon.settings.fetch('BMHunt_settings_intpercentlow',50)
	local intpercenthigh = dark_addon.settings.fetch('BMHunt_settings_intpercenthigh',65)
	local PetHealth = dark_addon.settings.fetch('BMHunt_settings_PetHealth',70)

  --Targets in range check
  local enemyCount = enemies.around(40)

  local enemyPet = enemies.count(function (unit)
  -- this is example logic. you can write any logic for unit
  return unit.alive and unit.combat and unit.distance == pet.distance
	end)

  dark_addon.interface.status_extra('V#:' .. enemyPet .. ' T#:' .. enemyCount .. ' D:' .. target.distance)

  -- Auto Attack
  if target.enemy and target.alive and target.distance < 40 then
    auto_shot()
  end

--Pet Management
--Pet Summon
  if castable(SB.CallPet1) and -spell(SB.CallPet1) == 0 and not pet.exists then
    return cast(SB.CallPet1)
  end

--Pet Healing
	if castable(SB.MendPet) and -spell(SB.MendPet) == 0 and pet.health.percent <= 70  then
		return cast(SB.MendPet)
	end

--Pet Revive
--	if castable(SB.RevivePet) and -spell(SB.RevivePet) == 0 and pet.dead then
--		return cast(SB.RevivePet)
--	end

--Interrupt
--Define random number for interrupt
  local intpercent = math.random(intpercentlow,intpercenthigh)

  if toggle('interrupts', false) and castable(SB.CounterShot, 'target') and -spell(SB.CounterShot) == 0 and target.interrupt(intpercent, false) and target.distance < 40 then
    print('Interrupt @ ' .. intpercent)
    return cast(SB.CounterShot, 'target')
  end

--Rotation
--Cast Kill Command when it comes off cooldown, and open all your fights with it to send your pet in.
  if castable(SB.KillCommand) and -spell(SB.KillCommand) == 0 then
    return cast(SB.KillCommand, 'target')
  end

--Cast Bestial Wrath on CD
  if castable(SB.BestialWrath) and -spell(SB.BestialWrath) == 0 then
    return cast(SB.BestialWrath, 'target')
  end  

--Cast Barbed Shot on cooldown, but only when Kill Command is already on cooldown.
  if castable(SB.BarbedShot) and -spell(SB.BarbedShot) == 0 and -spell(SB.KillCommand) > 0 then
    return cast(SB.BarbedShot, 'target')
  end

--Cast Cobra Shot as much as you can.
  if castable(SB.CobraShot) and -spell(SB.CobraShot) == 0 then
    return cast(SB.CobraShot, 'target')
  end

--Cast Multi-Shot when there are a lot of targets active, so you can hit them all. 
  if castable(SB.MultiShot) and -spell(SB.MultiShot) == 0 and enemyPet >=2 then
    return cast(SB.MultiShot, 'target')
  end 

end
end

local function resting()

--Pet Summon
  if castable(SB.CallPet1) and -spell(SB.CallPet1) == 0 and not pet.exists then
    return cast(SB.CallPet1)
  end  

--Pet Healing
	if castable(SB.MendPet) and -spell(SB.MendPet) == 0 and pet.health.percent <= 70  then
		return cast(SB.MendPet)
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
    name = 'RexBMHunt',
    label = 'Rex Beastmastery Hunter',
    combat = combat,
    resting = resting,
    interface = interface
})
