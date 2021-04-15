local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.warrior
local p = dark_addon.rotation.spellbooks.p
local s = dark_addon.rotation.spellbooks.s
local l = dark_addon.rotation.spellbooks.l
local pn = dark_addon.rotation.spellbooks.pn
local f = dark_addon.rotation.spellbooks.f
local d = dark_addon.rotation.spellbooks.d
local t = dark_addon.rotation.spellbooks.t
local e = dark_addon.rotation.spellbooks.e
local a = dark_addon.rotation.spellbooks.a
local ef = dark_addon.rotation.spellbooks.ef
local rf = dark_addon.rotation.spellbooks.rf
local eb = dark_addon.rotation.spellbooks.eb
local c = dark_addon.rotation.spellbooks.c
local h = dark_addon.rotation.spellbooks.h
local cy = dark_addon.rotation.spellbooks.cy
local s = dark_addon.rotation.spellbooks.s
local m = dark_addon.rotation.spellbooks.m
local rp = dark_addon.rotation.spellbooks.rp
local ro = dark_addon.rotation.spellbooks.ro
local g = dark_addon.rotation.spellbooks.g
local gp = dark_addon.rotation.spellbooks.gp
local ct = dark_addon.rotation.spellbooks.ct
local rp = dark_addon.rotation.spellbooks.rp
local hb = dark_addon.rotation.spellbooks.hb
local rot = dark_addon.rotation.spellbooks.rot
local v = dark_addon.rotation.spellbooks.v
local fu = dark_addon.rotation.spellbooks.fu
local hogg = dark_addon.rotation.spellbooks.hogg
local soot = dark_addon.rotation.dispellbooks.soothe
local stund = dark_addon.rotation.CC
local flashl = dark_addon.rotation.spellbooks.flashlig
local holylight = dark_addon.rotation.spellbooks.holyli
local repentr = dark_addon.rotation.spellbooks.repa
local AZ = dark_addon.rotation.spellbooks.azerite
-- To Do

-- Spells

SB.FuriousSlash = 100130
SB.Rampage = 184367
SB.Enrage = 184361
SB.Recklessness = 1719
SB.Siegebreaker = 280772
SB.ExecuteFury = 5308
SB.Bloodthirst = 23881
SB.RagingBlow = 85288
SB.DragonRoar = 118000
SB.Bladestorm = 46924
SB.WhirlwindFury = 190411
SB.Massacre = 206315
SB.SuddenDeath = 280721
SB.Charge = 100
SB.RecklessAbandon = 202751
SB.AngerManagement = 152278
SB.PulverizingBlows = 275632
SB.SimmeringRage = 278757
SB.RecklessFlurry = 278758
SB.UnbridledFerocity = 288056
SB.WarMachine = 262231
SB.EndlessRage = 202296
SB.Carnage = 202922
SB.HeroicLeap = 6544
SB.DoubleTime = 103827
SB.BoundingStride = 202163
SB.EnragedRegeneration = 184364
SB.VictoryRush = 34428
SB.RallyingCry = 97462
SB.BattleShout = 6673
SB.Pummel = 6552
SB.StormBolt = 107570
SB.ImpendingVictory = 202168
SB.VictoryRushBuff = 32216
SB.AncestralCall = 274738
SB.Berserking = 26297
SB.BloodFury = 33697
SB.GiftoftheNaaru = 121093
SB.LightsJudgement = 255647


local function kick()
local IntimidatingShoutInt = dark_addon.settings.fetch("armswar_settings_IntimidatingShoutInt", true)
local intpercentlow = dark_addon.settings.fetch("armswar_settings_intpercentlow", 50)
local intpercenthigh = dark_addon.settings.fetch("armswar_settings_intpercenthigh", 65)
local StormBoltInt = dark_addon.settings.fetch("armswar_settings_StormBoltInt", true)
    -- Pummel
if toggle("pveKick", false) then
if target.alive and target.enemy and player.alive and not player.channeling() then
	
	local intpercent = math.random(intpercentlow, intpercenthigh)
	
    if castable(SB.Pummel, "target") and target.interrupt(intpercent, false) and target.distance < 8 then
      print("Pummel Interrupt @ " .. intpercent)
      return cast(SB.Pummel, "target")
    end

    -- Storm Bolt
    if castable(SB.StormBolt, "target") and target.interrupt(intpercent, false) and StormBoltInt and target.distance < 20 and talent(2, 3) then
      
      return cast(SB.StormBolt, "target")
	  
    end
	
	
	    --ss
    if talent(2, 3) and not castable(SB.StormBolt) and not castable(SB.Pummel) and target.interrupt(intpercent, false) and IntimidatingShoutInt and target.distance < 8 
	or  not castable(SB.Pummel) and target.interrupt(intpercent, false) and IntimidatingShoutInt and target.distance < 8 then
      return cast(SB.IntimidatingShout, "target")
    end
	
end
end

end
setfenv(kick, dark_addon.environment.env)



local function combat()
if kick() then return end

  if target.alive and target.enemy and player.alive and not player.channeling() then
  
  if GetCVar("nameplateShowEnemies") == '0' then
    SetCVar("nameplateShowEnemies", 1)
  end
  
  macro('/cqs')
  if target.alive and target.enemy and player.alive and not player.channeling() then
    -- Reading from settings
    local intpercentlow = dark_addon.settings.fetch("furywar_settings_intpercentlow", 50)
    local intpercenthigh = dark_addon.settings.fetch("furywar_settings_intpercenthigh", 65)
    local ERHealth = dark_addon.settings.fetch("furywar_settings_ERHealth", 60)
    local VRHealth = dark_addon.settings.fetch("furywar_settings_VRHealth", 80)
    local GiftHealth = dark_addon.settings.fetch("furywar_settings_GiftHealth", 20)
    local Hstonecheck = dark_addon.settings.fetch("furywar_settings_healthstone.check", true)
    local Hstonepercent = dark_addon.settings.fetch("furywar_settings_healthstone.spin", 20)
    local race = UnitRace("player")

local Charge = dark_addon.settings.fetch("furywar_settings_Charge") 
local HeroicLeap = dark_addon.settings.fetch("furywar_settings_HeroicLeap")
local RallyingCry = dark_addon.settings.fetch("furywar_settings_RallyingCry")
local Azerite = dark_addon.settings.fetch("furywar_settings_Azerite")

	if (HeroicLeap == "shift" and modifier.shift) or (HeroicLeap == "control" and modifier.control) or (HeroicLeap == "alt" and modifier.alt) and -spell(SB.HeroicLeap) == 0 then
      return cast(SB.HeroicLeap, "ground")
    end

	if (Charge == "shift" and modifier.shift) or (Charge == "control" and modifier.control) or (Charge == "alt" and modifier.alt) and -spell(SB.Charge) == 0 then
      return cast(SB.Charge, "target")
    end
	
	if (RallyingCry == "shift" and modifier.shift) or (RallyingCry == "control" and modifier.control) or (RallyingCry == "alt" and modifier.alt) and -spell(SB.RallyingCry) == 0 then
      return cast(SB.RallyingCry, "target")
    end	
	
	

if (Azerite == "shift" and modifier.shift) or (Azerite == "control" and modifier.control) or (Azerite == "alt" and modifier.alt) then
	
   --Essence start
   	local delay = 0
   
   --burst essences

	--1

    if castable(AZ.GuardianofAzeroth1) and -spell(AZ.GuardianofAzeroth1) == 0 then
    return cast(AZ.GuardianofAzeroth1, 'target')
    end 
	    if castable(AZ.GuardianofAzeroth2) and -spell(AZ.GuardianofAzeroth2) == 0 then
        return cast(AZ.GuardianofAzeroth2, 'target')
		end 
		    if castable(AZ.GuardianofAzeroth3) and -spell(AZ.GuardianofAzeroth3) == 0 then
			return cast(AZ.GuardianofAzeroth3, 'target')
			end 
	
	--2
	
    if castable(AZ.MemoryofLucidDreams1) and -spell(AZ.MemoryofLucidDreams1) == 0 then
    return cast(AZ.MemoryofLucidDreams1, 'target')
    end 
	    if castable(AZ.MemoryofLucidDreams2) and -spell(AZ.MemoryofLucidDreams2) == 0 then
        return cast(AZ.MemoryofLucidDreams2, 'target')
		end 
		    if castable(AZ.MemoryofLucidDreams3) and -spell(AZ.MemoryofLucidDreams3) == 0 then
			return cast(AZ.MemoryofLucidDreams3, 'target')
			end 

	--3 uncomment to cast (req. 8.3.0+ patch)
		if delay < GetTime() then
	if castable(AZ.MomentofGlory1) then
    return cast(AZ.MomentofGlory1, 'player')
    end 
	    if castable(AZ.MomentofGlory2) and -spell(AZ.MomentofGlory2) == 0 then
        return cast(AZ.MomentofGlory2, 'target')
		end 
		    if castable(AZ.MomentofGlory3) and -spell(AZ.MomentofGlory3) == 0 then
			return cast(AZ.MomentofGlory3, 'target')
			end 
		delay = GetTime() + 1.5
	end	
			
	--4
	
    if castable(AZ.WorldveinResonance1) and -spell(AZ.WorldveinResonance1) == 0 then
    return cast(AZ.WorldveinResonance1, 'target')
    end 
	    if castable(AZ.WorldveinResonance2) and -spell(AZ.WorldveinResonance2) == 0 then
        return cast(AZ.WorldveinResonance2, 'target')
		end 
		    if castable(AZ.WorldveinResonance3) and -spell(AZ.WorldveinResonance3) == 0 then
			return cast(AZ.WorldveinResonance3, 'target')
			end 

	
	
	
	--damage essences
	
	
	
	--1 
	
	 if castable(AZ.AnimaofDeath1) and -spell(AZ.AnimaofDeath1) == 0 then
        return cast(AZ.AnimaofDeath1, 'target')
    end
			 if castable(AZ.AnimaofDeath2) and -spell(AZ.AnimaofDeath2) == 0 then
        return cast(AZ.AnimaofDeath2, 'target')
    end
				 if castable(AZ.AnimaofDeath3) and -spell(AZ.AnimaofDeath3) == 0 then
        return cast(AZ.AnimaofDeath3, 'target')
    end
	
	--2 
	
	 if castable(AZ.BloodoftheEnemy1) and -spell(AZ.BloodoftheEnemy1) == 0 then
        return cast(AZ.BloodoftheEnemy1, 'target')
    end
			 if castable(AZ.BloodoftheEnemy2) and -spell(AZ.BloodoftheEnemy2) == 0 then
        return cast(AZ.BloodoftheEnemy2, 'target')
    end
				 if castable(AZ.BloodoftheEnemy3) and -spell(AZ.BloodoftheEnemy3) == 0 then
        return cast(AZ.BloodoftheEnemy3, 'target')
    end
	
		
	--3  uncomment to cast (req. 8.3.0+ patch)
	
	 if castable(AZ.ReapingFlames1) and -spell(AZ.ReapingFlames1) == 0 then
        return cast(AZ.ReapingFlames1, 'target')
    end
			 if castable(AZ.ReapingFlames2) and -spell(AZ.ReapingFlames2) == 0 then
        return cast(AZ.ReapingFlames2, 'target')
    end
				 if castable(AZ.ReapingFlames3) and -spell(AZ.ReapingFlames3) == 0 then
        return cast(AZ.ReapingFlames3, 'target')
    end
	
	--4
	if delay < GetTime() then
	 if castable(AZ.FocusedAzeriteBeam1) and -spell(AZ.FocusedAzeriteBeam1) == 0 then
        return cast(AZ.FocusedAzeriteBeam1, 'target')
    end
			 if castable(AZ.FocusedAzeriteBeam2) and -spell(AZ.FocusedAzeriteBeam2) == 0 then
        return cast(AZ.FocusedAzeriteBeam2, 'target')
    end
				 if castable(AZ.FocusedAzeriteBeam3) and -spell(AZ.FocusedAzeriteBeam3) == 0 then
        return cast(AZ.FocusedAzeriteBeam3, 'target')
    end
	 delay = GetTime() + 1.4
end	
	--5
	
	 if castable(AZ.PurifyingBlast1) and -spell(AZ.PurifyingBlast1) == 0 then
        return cast(AZ.PurifyingBlast1, 'target')
    end
			 if castable(AZ.PurifyingBlast2) and -spell(AZ.PurifyingBlast2) == 0 then
        return cast(AZ.PurifyingBlast2, 'target')
    end
				 if castable(AZ.PurifyingBlast3) and -spell(AZ.PurifyingBlast3) == 0 then
        return cast(AZ.PurifyingBlast3, 'target')
    end
	
	--6
	
	 if castable(AZ.ConcentratedFlame1) and -spell(AZ.ConcentratedFlame1) == 0 then
        return cast(AZ.ConcentratedFlame1, 'target')
    end
			 if castable(AZ.ConcentratedFlame2) and -spell(AZ.ConcentratedFlame2) == 0 then
        return cast(AZ.ConcentratedFlame2, 'target')
    end
				 if castable(AZ.ConcentratedFlame3) and -spell(AZ.ConcentratedFlame3) == 0 then
        return cast(AZ.ConcentratedFlame3, 'target')
    end
	
	--7
			
	 if castable(AZ.TheUnboundForce1) and -spell(AZ.TheUnboundForce1) == 0 then
        return cast(AZ.TheUnboundForce1, 'target')
    end
			 if castable(AZ.TheUnboundForce2) and -spell(AZ.TheUnboundForce2) == 0 then
        return cast(AZ.TheUnboundForce2, 'target')
    end
				 if castable(AZ.TheUnboundForce3) and -spell(AZ.TheUnboundForce3) == 0 then
        return cast(AZ.TheUnboundForce3, 'target')
    end
	
end
	
	-- end essences 

if (Azerite == "auto") and toggle("cooldowns", false) then
	
   --Essence start
   	local delay = 0
   
   --burst essences

	--1

    if castable(AZ.GuardianofAzeroth1) and -spell(AZ.GuardianofAzeroth1) == 0 then
    return cast(AZ.GuardianofAzeroth1, 'target')
    end 
	    if castable(AZ.GuardianofAzeroth2) and -spell(AZ.GuardianofAzeroth2) == 0 then
        return cast(AZ.GuardianofAzeroth2, 'target')
		end 
		    if castable(AZ.GuardianofAzeroth3) and -spell(AZ.GuardianofAzeroth3) == 0 then
			return cast(AZ.GuardianofAzeroth3, 'target')
			end 
	
	--2
	
    if castable(AZ.MemoryofLucidDreams1) and -spell(AZ.MemoryofLucidDreams1) == 0 then
    return cast(AZ.MemoryofLucidDreams1, 'target')
    end 
	    if castable(AZ.MemoryofLucidDreams2) and -spell(AZ.MemoryofLucidDreams2) == 0 then
        return cast(AZ.MemoryofLucidDreams2, 'target')
		end 
		    if castable(AZ.MemoryofLucidDreams3) and -spell(AZ.MemoryofLucidDreams3) == 0 then
			return cast(AZ.MemoryofLucidDreams3, 'target')
			end 

	--3 uncomment to cast (req. 8.3.0+ patch)
		if delay < GetTime() then
	if castable(AZ.MomentofGlory1) then
    return cast(AZ.MomentofGlory1, 'player')
    end 
	    if castable(AZ.MomentofGlory2) and -spell(AZ.MomentofGlory2) == 0 then
        return cast(AZ.MomentofGlory2, 'target')
		end 
		    if castable(AZ.MomentofGlory3) and -spell(AZ.MomentofGlory3) == 0 then
			return cast(AZ.MomentofGlory3, 'target')
			end 
		delay = GetTime() + 1.5
	end	
			
	--4
	
    if castable(AZ.WorldveinResonance1) and -spell(AZ.WorldveinResonance1) == 0 then
    return cast(AZ.WorldveinResonance1, 'target')
    end 
	    if castable(AZ.WorldveinResonance2) and -spell(AZ.WorldveinResonance2) == 0 then
        return cast(AZ.WorldveinResonance2, 'target')
		end 
		    if castable(AZ.WorldveinResonance3) and -spell(AZ.WorldveinResonance3) == 0 then
			return cast(AZ.WorldveinResonance3, 'target')
			end 

	
	
	
	--damage essences
	
	
	
	--1 
	
	 if castable(AZ.AnimaofDeath1) and -spell(AZ.AnimaofDeath1) == 0 then
        return cast(AZ.AnimaofDeath1, 'target')
    end
			 if castable(AZ.AnimaofDeath2) and -spell(AZ.AnimaofDeath2) == 0 then
        return cast(AZ.AnimaofDeath2, 'target')
    end
				 if castable(AZ.AnimaofDeath3) and -spell(AZ.AnimaofDeath3) == 0 then
        return cast(AZ.AnimaofDeath3, 'target')
    end
	
	--2 
	
	 if castable(AZ.BloodoftheEnemy1) and -spell(AZ.BloodoftheEnemy1) == 0 then
        return cast(AZ.BloodoftheEnemy1, 'target')
    end
			 if castable(AZ.BloodoftheEnemy2) and -spell(AZ.BloodoftheEnemy2) == 0 then
        return cast(AZ.BloodoftheEnemy2, 'target')
    end
				 if castable(AZ.BloodoftheEnemy3) and -spell(AZ.BloodoftheEnemy3) == 0 then
        return cast(AZ.BloodoftheEnemy3, 'target')
    end
	
		
	--3  uncomment to cast (req. 8.3.0+ patch)
	
	 if castable(AZ.ReapingFlames1) and -spell(AZ.ReapingFlames1) == 0 then
        return cast(AZ.ReapingFlames1, 'target')
    end
			 if castable(AZ.ReapingFlames2) and -spell(AZ.ReapingFlames2) == 0 then
        return cast(AZ.ReapingFlames2, 'target')
    end
				 if castable(AZ.ReapingFlames3) and -spell(AZ.ReapingFlames3) == 0 then
        return cast(AZ.ReapingFlames3, 'target')
    end
	
	--4
	if delay < GetTime() then
	 if castable(AZ.FocusedAzeriteBeam1) and -spell(AZ.FocusedAzeriteBeam1) == 0 then
        return cast(AZ.FocusedAzeriteBeam1, 'target')
    end
			 if castable(AZ.FocusedAzeriteBeam2) and -spell(AZ.FocusedAzeriteBeam2) == 0 then
        return cast(AZ.FocusedAzeriteBeam2, 'target')
    end
				 if castable(AZ.FocusedAzeriteBeam3) and -spell(AZ.FocusedAzeriteBeam3) == 0 then
        return cast(AZ.FocusedAzeriteBeam3, 'target')
    end
	 delay = GetTime() + 1.4
end	
	--5
	
	 if castable(AZ.PurifyingBlast1) and -spell(AZ.PurifyingBlast1) == 0 then
        return cast(AZ.PurifyingBlast1, 'target')
    end
			 if castable(AZ.PurifyingBlast2) and -spell(AZ.PurifyingBlast2) == 0 then
        return cast(AZ.PurifyingBlast2, 'target')
    end
				 if castable(AZ.PurifyingBlast3) and -spell(AZ.PurifyingBlast3) == 0 then
        return cast(AZ.PurifyingBlast3, 'target')
    end
	
	--6
	
	 if castable(AZ.ConcentratedFlame1) and -spell(AZ.ConcentratedFlame1) == 0 then
        return cast(AZ.ConcentratedFlame1, 'target')
    end
			 if castable(AZ.ConcentratedFlame2) and -spell(AZ.ConcentratedFlame2) == 0 then
        return cast(AZ.ConcentratedFlame2, 'target')
    end
				 if castable(AZ.ConcentratedFlame3) and -spell(AZ.ConcentratedFlame3) == 0 then
        return cast(AZ.ConcentratedFlame3, 'target')
    end
	
	--7
			
	 if castable(AZ.TheUnboundForce1) and -spell(AZ.TheUnboundForce1) == 0 then
        return cast(AZ.TheUnboundForce1, 'target')
    end
			 if castable(AZ.TheUnboundForce2) and -spell(AZ.TheUnboundForce2) == 0 then
        return cast(AZ.TheUnboundForce2, 'target')
    end
				 if castable(AZ.TheUnboundForce3) and -spell(AZ.TheUnboundForce3) == 0 then
        return cast(AZ.TheUnboundForce3, 'target')
    end
	
end





	
	
	
	
    -- Targets in range check
    local enemyCount = enemies.around(8)
    if enemyCount == 0 then
      enemyCount = 1
    end
    dark_addon.interface.status_extra("T#:" .. enemyCount .. " D:" .. target.distance)

    -- Use Racials
    if toggle("useracials", false) then
      if race == "Orc" and castable(SB.BloodFury) then
        return cast(SB.BloodFury)
      end
      if race == "Troll" and castabe(SB.Berserking) then
        return cast(SB.Berserking)
      end
      if castable(SB.AncestralCall) then
        return cast(SB.AncestralCall)
      end
      if race == "LightforgedDraenei" and castable(SB.LightsJudgement) then
        return cast(SB.LightsJudgement)
      end
      if race == "Draenei" and -player.health <= GiftHealth then
        return cast(SB.GiftoftheNaaru)
      end
    end

    -- Auto Attack
    if target.enemy and target.alive and target.distance < 8 then
      auto_attack()
    end
	

    -- Interrupts
    -- Define random number for interrupt
    local intpercent = math.random(intpercentlow, intpercenthigh)

    -- Pummel
    if
      toggle("interrupts", false) and castable(SB.Pummel, "target") and -spell(SB.Pummel) == 0 and
        target.interrupt(intpercent, false) and
        target.distance < 8
     then
      return cast(SB.Pummel, "target")
    end
	
	--StormBolt
    if
      toggle("interrupts", false) and castable(SB.StormBolt, "target") and -spell(SB.StormBolt) == 0 and
        target.interrupt(intpercent, false) and
        target.distance < 8
     then
      return cast(SB.StormBolt, "target")
    end
	
    -- Cooldowns
    if toggle("cooldowns", false) then
      -- Recklessness on cooldown or for burst DPS
      if castable(SB.Recklessness) and -spell(SB.Recklessness) == 0 then
        return cast(SB.Recklessness)
      end
    end

    --Defensive and Utility Abilities
    -- Enraged Regeneration is Fury's only personal cooldown, good for mitigating damage and healing it back up with Bloodthirst. Note that the buff is not consumed by Bloodthirst, meaning it can be used multiple times during the 8-second duration for increased healing.
    if castable(SB.EnragedRegeneration) and -spell(SB.EnragedRegeneration) == 0 and -player.health <= ERHealth then
      print("EnragedRegeneration @ " .. ERHealth)
      return cast(SB.EnragedRegeneration)
    end

    -- Rallying Cry is one of the few group/raid wide cooldowns, good for both mitigating large attacks and granting a buffer when players are already close to death. Use primarily when large, group-wide damage is incoming.
    -- Piercing Howl is Fury's snare; good for kiting targets and proccing  Furious Charge heals.
    -- Intimidating Shout is also good for kiting, but keep in mind that feared targets can aggro other hostile enemies.
    -- Taunt is a generic taunt, though due to Fury's lack of Die by the Sword, it's not recommended to use unless in an effort to save the group from a wipe.

    -- Healing
    if castable(SB.VictoryRush) and -buff(SB.VictoryRushBuff) and -player.health <= VRHealth then
      print("Heal @ " .. -player.health)
      return cast(SB.VictoryRush)
    end

    if castable(SB.ImpendingVictory) and -player.health <= VRHealth and talent(2, 2) then
      print("Heal @ " .. -player.health)
      return cast(SB.ImpendingVictory)
    end

    -- Healthstone
    if Hstonecheck == true and -player.health < Hstonepercent and GetItemCount(5512) >= 1 and GetItemCooldown(5512) == 0 then
      macro("/use Healthstone")
    end

    --Multi-target
    --WhirlwindFury allows Fury to cleave its normal single target rotation on up to 4 additional targets, although some setup is done to ensure larger Bladestorm burst on intermittent waves of adds.

    --For general multitarget cleave
    if enemyCount >= 2 or toggle("multitarget", false) and target.distance <= 8 then
      -- WhirlwindFury to apply  WhirlwindFury whenever the buff is not up
      if castable(SB.WhirlwindFury) and -spell(SB.WhirlwindFury) == 0 and player.buff(SB.WhirlwindFury).down then
        return cast(SB.WhirlwindFury)
      end
    --Continue the single target rotation, and WhirlwindFury should be kept up naturally
    --An example sequence might look like this:  WhirlwindFury -  Rampage -  Raging Blow -  WhirlwindFury -   Bloodthirst -  Raging Blow -  WhirlwindFury -  Bloodthirst -  Rampage -  WhirlwindFury...
    end

    -- Single Target
    if enemyCount >= 1 and target.distance <= 8 then
      -- Top talents: Endless Rage, Furious Slash, Carnage, Dragon Roar, Siegebreaker
      -- Furious Slash until 3 stacks, or to keep the buff from falling
      if
        castable(SB.FuriousSlash) and -spell(SB.FuriousSlash) == 0 and player.buff(SB.FuriousSlash).count < 3 or player.buff(SB.FuriousSlash).remains <= 4 and
          talent(3, 3)
       then
        return cast(SB.FuriousSlash)
      end

      -- Rampage when not Enraged or above 75rage (Talent5,1)
      if castable(SB.Rampage) and -spell(SB.Rampage) == 0 and talent(5, 1) and -power.rage > 75 then
        return cast(SB.Rampage)
      end

      -- Rampage when not Enraged or above 85rage (Talent5,2)
      if castable(SB.Rampage) and -spell(SB.Rampage) == 0 and talent(5, 2) and -power.rage > 85 then
        return cast(SB.Rampage)
      end
	  
	        -- Rampage when not Enraged or above 95rage (Talent5,3)
      if castable(SB.Rampage) and -spell(SB.Rampage) == 0 and talent(5, 3) and -power.rage > 95 then
        return cast(SB.Rampage)
      end
	  
      -- Siegebreaker during Recklessness, or between its cooldown (you should get two casts between each Recklessness)
      if castable(SB.Siegebreaker) and -spell(SB.Siegebreaker) == 0 and talent(7, 3) then
        return cast(SB.Siegebreaker)
      end

      -- ExecuteFury while Enraged
      if castable(SB.ExecuteFury) and -spell(SB.ExecuteFury) == 0 and player.buff(SB.Enrage).up then
        return cast(SB.ExecuteFury)
      end

      -- Raging Blow at 2 charges and Enraged
      if
        castable(SB.RagingBlow) and -spell(SB.RagingBlow) == 0 and spell(SB.RagingBlow).charges == 2 and
          player.buff(SB.Enrage).up
       then
        return cast(SB.RagingBlow)
      end

      -- Bloodthirst
      if castable(SB.Bloodthirst) and -spell(SB.Bloodthirst) == 0 then
        return cast(SB.Bloodthirst)
      end

      -- Dragon Roar while Enraged
      if castable(SB.DragonRoar) and -spell(SB.DragonRoar) == 0 and player.buff(SB.Enrage).up and talent(6, 2) then
        return cast(SB.DragonRoar)
      end

      -- Bladestorm while Enraged
      if castable(SB.Bladestorm) and -spell(SB.Bladestorm) == 0 and player.buff(SB.Enrage).up and talent(6, 3) then
        return cast(SB.Bladestorm)
      end

      -- Raging Blow
      if castable(SB.RagingBlow) and -spell(SB.RagingBlow) == 0 then
        return cast(SB.RagingBlow)
      end

      -- Furious Slash if talented
      -- if castable(SB.FuriousSlash) and -spell(SB.FuriousSlash) == 0 and talent(3, 3) then
        -- return cast(SB.FuriousSlash)
      -- end

      -- WhirlwindFury
      if castable(SB.WhirlwindFury) then
        return cast(SB.WhirlwindFury)
      end

    --An example sequence with talents might look like this:  Siegebreaker -  Rampage -  Raging Blow -  Bloodthirst -  Dragon Roar -  Furious Slash -  Bloodthirst -  Rampage -  Raging Blow...
    --An example sequence without talents might look like this:  Rampage -  Raging Blow - Bloodthirst -  Raging Blow -  WhirlwindFury -  Bloodthirst -  Rampage -  WhirlwindFury...
    end
  end
end
end

local function resting()
  local enemyCount = enemies.around(8)
  dark_addon.interface.status_extra("T#:" .. enemyCount .. " D:" .. target.distance)


local Charge = dark_addon.settings.fetch("furywar_settings_Charge") 
local HeroicLeap = dark_addon.settings.fetch("furywar_settings_HeroicLeap")


	if (HeroicLeap == "shift" and modifier.shift) or (HeroicLeap == "control" and modifier.control) or (HeroicLeap == "alt" and modifier.alt) and -spell(SB.HeroicLeap) == 0 then
      return cast(SB.HeroicLeap, "ground")
    end

	if (Charge == "shift" and modifier.shift) or (Charge == "control" and modifier.control) or (Charge == "alt" and modifier.alt) and -spell(SB.Charge) == 0 then
      return cast(SB.Charge, "target")
    end

end


local function interface()
  local settings = {
    key = "furywar_settings",
    title = "Fury Warrior",
    width = 300,
    height = 500,
    resize = true,
    show = false,
    template = {
      {type = "header", text = "Fury Warrior Settings",  align = 'CENTER'},
     
	  { type = 'header', text = "Modifiers",align = 'CENTER'},
			
			{ key = 'Charge', type = 'dropdown', text = 'Charge', desc = '', default = 'shift',
				list = {
						    { key = 'Empty', text = 'Unbinded' },
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
			
			{ key = 'HeroicLeap', type = 'dropdown', text = 'Heroic Leap', desc = '', default = 'alt',
				list = {
							{ key = 'empty', text = 'Unbinded' },
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
			{ key = 'RallyingCry', type = 'dropdown', text = 'Rallying Cry', desc = '', default = 'control',
				list = {
							{ key = 'Empty', text = 'Unbinded' },
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
					    } },
		{ key = 'Azerite', type = 'dropdown', text = 'Azerite Talent Key', desc = 'AutoCast when Cooldowns are ON.', default = 'control',
				list = {
							{ key = 'Empty', text = 'Unbinded' },
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
							{ key = 'auto', text = 'AutoCast' },
					    } },
	
	      {type = "rule"},
      {type = "header", text = "PvE Kick Settings", align = 'CENTER'},
	  
      {
        key = "intpercentlow",
        type = "spinner",
        text = "Interrupt Low %",
        default = "50",
        desc = "low% cast time to interrupt at",
        min = 5,
        max = 50,
        step = 1
      },
      {
        key = "intpercenthigh",
        type = "spinner",
        text = "Interrupt High %",
        default = "65",
        desc = "high% cast time to interrupt at",
        min = 51,
        max = 100,
        step = 1
      },
      {key = "StormBoltInt", type = "checkbox", text = "Storm Bolt as an interrupt", desc = "", default = true},
	        {key = "IntimidatingShoutInt", type = "checkbox", text = "Intimidating Shout as an interrupt", desc = "", default = true},
	  
	  
	  			{ type = 'rule' },
	  
      {type = "rule"},

      {type = "header", text = "Defensive Settings", align = 'CENTER'},
      {
        key = "ERHealth",
        type = "spinner",
        text = "Enraged Regeneration at Health %",
        default = "60",
        desc = "cast Enraged Regeneration at",
        min = 0,
        max = 100,
        step = 1
      },
      {
        key = "VRHealth",
        type = "spinner",
        text = "Victory Rush/Imp Victory at Health %",
        default = "80",
        desc = "cast Victory Rush/Imp Victory at",
        min = 0,
        max = 100,
        step = 1
      },
      {
        key = "healthstone",
        type = "checkspin",
        default = "20",
        text = "Healthstone",
        desc = "use Healthstone at health %",
        min = 1,
        max = 100,
        step = 1
      },
      {
        key = "GiftHealth",
        type = "spinner",
        text = "Gift of the Naaru at Health %",
        default = "20",
        desc = "cast Gift of the Naaru at",
        min = 0,
        max = 100,
        step = 1
      }
    }
  }

  configWindow = dark_addon.interface.builder.buildGUI(settings)

  dark_addon.interface.buttons.add_toggle(
    {
      name = "settings",
      label = "Rotation Settings",
      font = "dark_addon_icon",
      on = {
        label = dark_addon.interface.icon("cog"),
        color = dark_addon.interface.color.cyan,
        color2 = dark_addon.interface.color.dark_cyan
      },
      off = {
        label = dark_addon.interface.icon("cog"),
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
    }
  )
  dark_addon.interface.buttons.add_toggle(
    {
      name = "useracials",
      label = "Use Racials",
      font = "dark_addon_icon",
      on = {
        label = dark_addon.interface.icon("toggle-on"),
        color = dark_addon.interface.color.warrior_brown,
        color2 = dark_addon.interface.color.warrior_brown
      },
      off = {
        label = dark_addon.interface.icon("toggle-off"),
        color = dark_addon.interface.color.grey,
        color2 = dark_addon.interface.color.dark_grey
      }
    }
  )
  
    
    dark_addon.interface.buttons.add_toggle(
    {
      name = "pveKick",
      label = "Pve Kick",
      font = "dark_addon_icon",
      on = {
        label = dark_addon.interface.icon("toggle-on"),
        color = dark_addon.interface.color.warrior_brown,
        color2 = dark_addon.interface.color.warrior_brown
      },
      off = {
        label = dark_addon.interface.icon("toggle-off"),
        color = dark_addon.interface.color.grey,
        color2 = dark_addon.interface.color.dark_grey
      }
    }
  )
end


-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register(
  {
    spec = dark_addon.rotation.classes.warrior.fury,
    name = "Fury",
    label = "Azrael-Fury Warrior",
    combat = combat,
    resting = resting,
    interface = interface
  }
)
