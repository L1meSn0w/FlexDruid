local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GIThunter

-- To Do

-- Spells
SB.PreciseShots = 260240 
SB.AimedShot = 19434 
SB.TrickShots = 257621 
SB.MultiShot = 2643 
SB.RapidFire = 257044 
SB.DoubleTap = 260402 
SB.CarefulAim = 260228 
SB.ArcaneShot = 185358 
SB.SteadyShot = 56641 
SB.Trueshot = 193526 
SB.MasterMarksman = 260309 
SB.UnerringVision = 274444 
SB.PiercingShot = 198670 
SB.AMurderofCrows = 131894 
SB.ExplosiveShot = 212431 
SB.HuntersMark = 257284 
SB.CallingtheShots = 260404 
SB.SerpentSting = 271788 
SB.Volley = 260243 
SB.SteadyFocus = 193533 
SB.Streamline = 260367 
SB.LethalShots = 260393 
SB.Barrage = 120360 
SB.LockandLoad = 194595 
SB.CounterShot = 147362

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
	local intpercentlow = dark_addon.settings.fetch('MMHunt_settings_intpercentlow',50)
	local intpercenthigh = dark_addon.settings.fetch('MMHunt_settings_intpercenthigh',65)
	local PetHealth = dark_addon.settings.fetch('MMHunt_settings_PetHealth',70)

  --Targets in range check
  --local enemyCount = enemies.around(40)

  local enemyRange = enemies.count(function (unit)
  -- this is example logic. you can write any logic for unit
  return unit.alive and unit.combat and unit.distance >= target.distance - 5 and unit.distance <= target.distance + 5 and target.distance <= 40
	end)

	--if enemyCount == 0 then enemyCount = 1 end
	if enemyRange == 0 then enemyRange = 1 end

  dark_addon.interface.status_extra('V#:' .. enemyRange .. ' D:' .. target.distance)

  -- Auto Attack
  --if target.enemy and target.alive and target.distance < 40 and not player.channeling() then
  --  auto_attack()
  --end

--Pet Management
--Pet Summon
--  if castable(SB.CallPet1) and -spell(SB.CallPet1) == 0 and not pet.exists then
--    return cast(SB.CallPet1)
--  end

--Pet Healing
--	if castable(SB.MendPet) and -spell(SB.MendPet) == 0 and pet.health.percent <= 70  then
--		return cast(SB.MendPet)
--	end

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

--Cooldowns
  if castable(SB.HuntersMark) and -spell(SB.HuntersMark) == 0 and target.debuff(SB.HuntersMark).down and player.buff(SB.Trueshot).down then
    return cast(SB.HuntersMark, 'target')
  end

--actions.cds+=/double_tap,if=cooldown.rapid_fire.remains<gcd|cooldown.rapid_fire.remains<cooldown.aimed_shot.remains|target.time_to_die<20
--actions.cds+=/trueshot,if=focus>60&(buff.precise_shots.down&cooldown.rapid_fire.remains&target.time_to_die>cooldown.trueshot.duration_guess+duration|target.health.pct<20|!talent.careful_aim.enabled)
--|target.time_to_die<15


--Single Target Rotation
--On 2 targets, do the single-target rotation.
if enemyRange <= 2 then
--Trueshot Rotation
--You should use Trueshot when it suits the fight best. Other than that, you should try to use it during Careful Aim. That means using it when the main boss is under 20% health, 
--and above 80% health. Other than that, try to use it when Aimed Shot and Rapid Fire are both on cooldown.
  if castable(SB.Trueshot) and -spell(SB.Trueshot) == 0 and (target.health.percent < 20 or target.health.percent > 80) then
    return cast(SB.Trueshot, 'target')
  end

--During Trueshot itself, your goal is to maximize your Aimed Shot, spending every Master Marksman proc and filling in with Rapid Fire when neither of those are available. 
--Thus, the Trueshot priority looks something like this:
	if player.buff(SB.Trueshot).up then

		--Double Tap should not be delayed for Trueshot, but if it comes up during it, you should still use it with Rapid Fire. With Unerring Vision, it makes sense to delay Double Tap 
		--for a late Rapid Fire cast in your Trueshot.
		  if castable(SB.DoubleTap) and -spell(SB.DoubleTap) == 0 then
		    return cast(SB.DoubleTap, 'target')
		  end

		  if castable(SB.RapidFire) and -spell(SB.RapidFire) == 0 and player.spell(SB.DoubleTap).lastcast then
		    return cast(SB.RapidFire, 'target')
		  end

		--Cast Arcane Shot when Master Marksman is up (right after Aimed Shot).
		  if castable(SB.ArcaneShot) and -spell(SB.ArcaneShot) == 0 and player.buff(SB.MasterMarksman).up and player.spell(SB.AimedShot).lastcast then
    		return cast(SB.ArcaneShot, 'target')
  		end

		--Cast Aimed Shot on cooldown.
		  if castable(SB.AimedShot) and -spell(SB.AimedShot) == 0 then
		    return cast(SB.AimedShot, 'target')
		  end

		--Cast Rapid Fire when there is nothing else to do.
		  if castable(SB.RapidFire) and -spell(SB.RapidFire) == 0 then
    		return cast(SB.RapidFire, 'target')
  		end

		--If there is nothing else you can cast, spend your Precise Shots stacks with Arcane Shot.
		  if castable(SB.ArcaneShot) and -spell(SB.ArcaneShot) == 0 and player.buff(SB.PreciseShots).up then
    		return cast(SB.ArcaneShot, 'target')
  		end

		--Cast Steady Shot.
		  if castable(SB.SteadyShot) and -spell(SB.SteadyShot) == 0 then
		    return cast(SB.SteadyShot, 'target')
		  end

	end

--Double Tap should be used on cooldown. During Careful Aim, spend it on Aimed Shot. Otherwise, spend it on Rapid Fire
  if castable(SB.DoubleTap) and -spell(SB.DoubleTap) == 0 then
    return cast(SB.DoubleTap, 'target')
  end

  if castable(SB.AimedShot) and -spell(SB.AimedShot) == 0 and player.spell(SB.DoubleTap).lastcast and (target.health.percent < 20 or target.health.percent > 80) then
    return cast(SB.AimedShot, 'target')
  end

  if castable(SB.RapidFire) and -spell(SB.RapidFire) == 0 and player.spell(SB.DoubleTap).lastcast and (target.health.percent >= 20 or target.health.percent <= 80) then
    return cast(SB.RapidFire, 'target')
  end

--Cast Aimed Shot on cooldown, but only when Precise Shots is down.
  if castable(SB.AimedShot) and -spell(SB.AimedShot) == 0 and player.buff(SB.PreciseShots).down then
    return cast(SB.AimedShot, 'target')
  end

--Cast Rapid Fire on cooldown.
  if castable(SB.RapidFire) and -spell(SB.RapidFire) == 0 then
    return cast(SB.RapidFire, 'target')
  end

--Cast Arcane Shot to spend Precise Shots stacks, and to keep yourself from Focus capping. Using it to stay at a low amount of Focus is fine.
  if castable(SB.ArcaneShot) and -spell(SB.ArcaneShot) == 0 and player.buff(SB.PreciseShots).up then
    return cast(SB.ArcaneShot, 'target')
  end

--Cast Steady Shot as a filler.
  if castable(SB.SteadyShot) and -spell(SB.SteadyShot) == 0 then
    return cast(SB.SteadyShot, 'target')
  end

end

--Multi Target Rotation
--On 3 targets, your general rotation is the same, but there are a few changes to keep in mind. These changed are summarized in the priority system below.
--actions.trickshots+=/aimed_shot,if=buff.trick_shots.up&ca_execute&buff.double_tap.up
--actions.trickshots+=/rapid_fire,if=buff.trick_shots.up&(azerite.focused_fire.enabled|azerite.in_the_rhythm.rank>1|azerite.surging_shots.enabled|talent.streamline.enabled)
--actions.trickshots+=/aimed_shot,if=buff.trick_shots.up&(buff.precise_shots.down|cooldown.aimed_shot.full_recharge_time<action.aimed_shot.cast_time|buff.trueshot.up)
--actions.trickshots+=/rapid_fire,if=buff.trick_shots.up
--actions.trickshots+=/multishot,if=buff.trick_shots.down|buff.precise_shots.up&!buff.trueshot.up|focus>70

if enemyRange > 2 then
--Ensure that Trick Shots is activated before casting Rapid Fire and Aimed Shot. There is no rush to cast it, but it has to be up for those abilities.
--Cast Aimed Shot on cooldown. Do not let it cap on 2 charges.
  if castable(SB.AimedShot) and -spell(SB.AimedShot) == 0 and player.buff(SB.TrickShots).up and (target.health.percent < 20 or target.health.percent > 80) and player.buff(SB.DoubleTap).up then
    return cast(SB.AimedShot, 'target')
  end

  if castable(SB.AimedShot) and -spell(SB.AimedShot) == 0 and player.buff(SB.TrickShots).up and (player.buff(SB.PreciseShots).down or player.buff(SB.Trueshot).up) then
    return cast(SB.AimedShot, 'target')
  end

--Cast Rapid Fire on cooldown when it will not cause Aimed Shot to cap at 2 charges.
  if castable(SB.RapidFire) and -spell(SB.RapidFire) == 0 and player.buff(SB.TrickShots).up then
    return cast(SB.RapidFire, 'target')
  end

--Cast Multi-Shot when Precise Shots is up.
  if castable(SB.MultiShot) and -spell(SB.MultiShot) == 0 and (player.buff(SB.TrickShots).down or player.buff(SB.PreciseShots).up or player.power.focus.actual > 70) then
    return cast(SB.MultiShot, 'target')
  end

-- --Cast Piercing Shot if you have chosen this talent.
-- --Cast A Murder of Crows if you have chosen this talent.
-- --Cast Explosive Shot if you have chosen this talent.
--Cast Multi-Shot to keep yourself from Focus capping. Using it to stay at a low amount of Focus is fine.
--  if castable(SB.MultiShot) and -spell(SB.MultiShot) == 0 and player.power.focus.actual < 80 then
--    return cast(SB.MultiShot, 'target')
--  end

--Cast Steady Shot as a filler.
  if castable(SB.SteadyShot) and -spell(SB.SteadyShot) == 0 then
    return cast(SB.SteadyShot, 'target')
  end

end

end
end

local function resting()

--Pet Summon
--  if castable(SB.CallPet1) and -spell(SB.CallPet1) == 0 and not pet.exists then
--    return cast(SB.CallPet1)
--  end  

--Pet Healing
--	if castable(SB.MendPet) and -spell(SB.MendPet) == 0 and pet.health.percent <= 70  then
--		return cast(SB.MendPet)
--	end  

end

local function interface()

   local settings = 
   {
    key = 'MMHunt_settings',
    title = 'Marksman Hunter',
    width = 300,
    height = 500,
    resize = true,
    show = false,
    template = 
	    {
	      { type = 'header', text = "            Rex's Marksman Hunter Settings" },
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
    spec = dark_addon.rotation.classes.hunter.marksmanship,
    name = 'RexMMHunt',
    label = 'Rex Marksman Hunter',
    combat = combat,
    resting = resting,
    interface = interface
})
