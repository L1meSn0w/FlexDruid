	local addon, dark_addon = ...
	local SB = dark_addon.rotation.spellbooks.rogue
	local polyhex = dark_addon.rotation.polyhex 
	local Freez = dark_addon.rotation.Freez
	local Fear = dark_addon.rotation.Fear
	local Imprison = dark_addon.rotation.Imprison
	local Intimidating = dark_addon.rotation.Intimidating
	local Psychic = dark_addon.rotation.Psychic
	local Rependance = dark_addon.rotation.Rependance
	local Blind = dark_addon.rotation.Blind
	local Gouge = dark_addon.rotation.Gouge
	local Hindrance = dark_addon.rotation.Hindrance			  
	local Mortal = dark_addon.rotation.Mortal
	local maim = dark_addon.rotation.maim
	local Chains = dark_addon.rotation.Chains
	local Trap = dark_addon.rotation.Trap
	local Nova = dark_addon.rotation.Nova
	local CC = dark_addon.rotation.CC
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
	local sgt = dark_addon.rotation.spellbooks.sgt
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
	local flashl = dark_addon.rotation.spellbooks.flashlig
	local holylight = dark_addon.rotation.spellbooks.holyli
	local repentr = dark_addon.rotation.spellbooks.repa
	local Gnaw = dark_addon.rotation.Gnaw
	local LegSweep = dark_addon.rotation.LegSweep
	local HammerofJustice = dark_addon.rotation.HammerofJustice
	local KidneyShot = dark_addon.rotation.KidneyShot
	local CheapShot = dark_addon.rotation.CheapShot
	local Shadowfury = dark_addon.rotation.Shadowfury
	local AxeToss = dark_addon.rotation.AxeToss
	local Shockwave = dark_addon.rotation.Shockwave
	local StormBolt = dark_addon.rotation.StormBolt
	local WarStomp = dark_addon.rotation.WarStomp

	SB.Trinket = 208683
	SB.Vanish = 1856
	SB.Ambush = 8676
	SB.CheapShot = 1833
	SB.PreyontheWeak = 131511
	SB.KillingSpree = 51690
	SB.BladeRush = 271877
	SB.BladeFlurry = 13877
	SB.RolltheBones = 193316
	SB.GhostlyStrike = 196937
	SB.AdrenalineRush = 13750
	SB.MarkedforDeath = 137619
	SB.BetweentheEyes = 199804
	SB.RuthlessPrecision = 193357
	SB.AceUpYourSleeve = 278676
	SB.Deadshot = 272935
	SB.Dispatch = 2098
	SB.PistolShot = 185763
	SB.Opportunity = 195627
	SB.SinisterStrike = 193315
	SB.SnakeEyes = 275846
	SB.SliceandDice = 5171
	SB.DeeperStratagem = 193531
	SB.TrueBearing = 193359
	SB.SkullandCrossbones = 199603
	SB.GrandMelee = 193358
	SB.Broadside = 193356
	SB.BuriedTreasure = 199600
	SB.LoadedDice = 256170
	SB.Vigor = 14983
	SB.CombatPotency = 61329
	SB.RestlessBlades = 79096
	SB.Bloodlust = 2825
	SB.Heroism = 32182
	SB.TimeWarp = 80353
	SB.Ruthlessness = 14161
	SB.Sprint = 2983
	SB.GrapplingHook = 195457
	SB.Feint = 1966
	SB.Elusiveness = 79008
	SB.CloakofShadows = 31224
	SB.CheatDeath = 31230
	SB.CrimsonVial = 185311
	SB.Riposte = 199754
	SB.Stealth = 1784
	SB.Kick = 1766
	SB.Gouge = 1776
	SB.Blind = 2094

	SB.AnimaofDeath1 = 294926
		SB.AnimaofDeath2 = 300002				--- Draw upon your vitality to sear your foes, dealing 10% of your maximum health in Fire damage to all nearby enemies and heal for 10% of your maximum health per enemy hit, up to 50% of your maximum health.
			SB.AnimaofDeath3 = 300003

	SB.BloodoftheEnemy1 = 297108
		SB.BloodoftheEnemy2 = 298273			--- The Heart of Azeroth erupts violently, dealing 18094 Shadow damage to enemies within 12 yds. You gain 25% critical strike chance against the targets for 10 sec, and increases your critical hit damage by 25% for 5 sec.
			SB.BloodoftheEnemy3 = 298277

	SB.ReapingFlames1 = 310690
		SB.ReapingFlames2 = 311194 --- Burn your target with a bolt of Azerite, dealing 0 Fire damage. If the target has less than 20% health or more than 80% health, the cooldown is reduced by 30 sec. If Reaping Flames kills an enemy, its cooldown is lowered to 5 sec and it will deal 100% increased damage on its next use.
			SB.ReapingFlames3 = 311195

	SB.GuardianofAzeroth1 = 295840
		SB.GuardianofAzeroth2 = 299355 --- Call upon Azeroth to summon a Guardian of Azeroth for 30 sec who impales your target with spikes of Azerite every 2.5 sec that deal [0 * (1 + Versatility) * (1.25)] Fire damage. Every 8 sec, the Guardian launches a volley of Azerite Spikes at its target, dealing 8 Fire damage to all nearby enemies. Each time the Guardian of Azeroth casts a spell, you gain 2% Haste, stacking up to 5 times. This effect ends when the Guardian of Azeroth despawns.
			SB.GuardianofAzeroth3 = 299358
	
	SB.FocusedAzeriteBeam1 = 295258
		SB.FocusedAzeriteBeam2 = 299336 --- Focus excess Azerite energy into the Heart of Azeroth, then expel that energy outward, dealing 92680 Fire damage to all enemies in front of you over 3 sec.
			SB.FocusedAzeriteBeam3 = 299338
	
	SB.MemoryofLucidDreams1 = 298357
		SB.MemoryofLucidDreams2 = 299372 --- Clear your mind and attune yourself with the Heart of Azeroth, increasing your [Mana][Energy][Maelstrom] generation rate by 100% and your Leech by 0 for 15 sec.
			SB.MemoryofLucidDreams3 = 299374
	
	SB.PurifyingBlast1 = 295337
		SB.PurifyingBlast2 = 299345 --- Call down a purifying beam upon the target area, dealing [4112 * (1 + Versatility) * 7] Fire damage over 6 sec. Has a low chance to immediately annihilate any specimen deemed unworthy by MOTHER.When an enemy dies within the beam, your damage is increased by 10% for 8 sec. Any Aberration struck by the beam is stunned for 3 sec.
			SB.PurifyingBlast3 = 299347
	
	SB.MomentofGlory1 = 311203
		SB.MomentofGlory2 = 311302 --- Release a wave of energy from your Heart of Azeroth, increasing the damage all party members within 15 yds deal with Azerite Essences by 45% and their Speed by 3 for the next 20 sec.
			SB.MomentofGlory3 = 311303
	
	SB.ConcentratedFlame1 = 295373
		SB.ConcentratedFlame2 = 299349 --- Blast your target with a ball of concentrated flame
			SB.ConcentratedFlame3 = 299353
	
	SB.TheUnboundForce1 = 298452
		SB.TheUnboundForce2 = 299376 --- Unleash the forces within the Heart of Azeroth, causing shards of Azerite to strike your target for 13017.88515 Fire damage over 2 sec. This damage is increased by 300% if it critically strikes.
			SB.TheUnboundForce3 = 299378
	
	SB.WorldveinResonance1 = 295186
		SB.WorldveinResonance2 = 298628 --- Concentrate energy into the Heart of Azeroth, immediately causing 3 Lifeblood Shards to erupt from the nearby ground for 18 sec, and incease the primary stat gained from Lifeblood Shards by 300% for 18 sec.
			SB.WorldveinResonance3 = 299334

	SB.TricksOfTheTrade = 57934

local function GroupType()
    return IsInRaid() and "raid" or IsInGroup() and "party" or "solo"
end
local group_type = GroupType()

local function findTank()
    local members = GetNumGroupMembers()
    local group_type = GroupType()

    if group_type ~= "solo" then
        for i = 1, (members - 1) do
            local unit = group_type .. i
            if (UnitGroupRolesAssigned(unit) == "TANK") and not UnitCanAttack("player", unit) and not UnitIsDeadOrGhost(unit)
            then
                return unit
            end
        end
    end
    return "player"
end
	
--Start Roll the Bones Function
local function RolltheBones()

  --Roll the Bones Buff Count
  local rtbcount, rpcount, gmcount, bscount, skcount, btcount, tbcount = 0, 0, 0, 0, 0, 0, 0
  if player.buff(SB.RuthlessPrecision).up then rpcount = 1 else rpcount = 0 end
  if player.buff(SB.GrandMelee).up then gmcount = 1 else gmcount = 0 end
  if player.buff(SB.Broadside).up then bscount = 1 else bscount = 0 end
  if player.buff(SB.SkullandCrossbones).up then skcount = 1 else skcount = 0 end
  if player.buff(SB.BuriedTreasure).up then btcount = 1 else btcount = 0 end
  if player.buff(SB.TrueBearing).up then tbcount = 1 else tbcount = 0 end
  rtbcount = rpcount + gmcount + bscount + skcount + btcount + tbcount
  local smartrtb = dark_addon.settings.fetch('outrog_settings_smartrtb', true)

  -- local function hasazeritetrait(powerid)
  --   local isSelected        
  --   for _, itemLocation in AzeriteUtil.EnumerateEquipedAzeriteEmpoweredItems() do
  --     isSelected = C_AzeriteEmpoweredItem.IsPowerSelected(itemLocation, powerid)
  --     if isSelected then return true end
  --   end
  --     return false
  --   end
  
  -- local deadshottrait = hasazeritetrait(129)
  -- local aceupyoursleevetrait = hasazeritetrait(411)

  --The basic rule to satisfy regarding  Roll the Bones is to re-cast it and fish for 2+ buffs if:
  --you have 1 buff and  Loaded Dice available OR
  --you have 1 buff and it is not  Ruthless Precision or  Grand Melee.
  --In the event that you do not have  Loaded Dice available, re-roll  Roll the Bones for 2+ buffs or  Ruthless Precision or  Grand Melee.

  --Cast 4-5 Combo Point Roll the Bones (see dedicated Roll the Bones section for details).
  if smartrtb then
    if (rtbcount < 2) and not (player.buff(SB.GrandMelee).up or player.buff(SB.RuthlessPrecision).up) then
      if castable(SB.RolltheBones) and -spell(SB.RolltheBones) == 0 and player.power.combopoints.actual >= 4 and not talent(6,3) then
        return cast(SB.RolltheBones, 'target')
      end
    end
  end
  if not smartrtb and (rtbcount == 0 or (player.buff(SB.RuthlessPrecision).up and player.buff(SB.RuthlessPrecision).remains < 4) or (player.buff(SB.GrandMelee).up and player.buff(SB.GrandMelee).remains < 4) 
  or (player.buff(SB.Broadside).up and player.buff(SB.Broadside).remains < 4) or (player.buff(SB.SkullandCrossbones).up and player.buff(SB.SkullandCrossbones).remains < 4)
  or (player.buff(SB.BuriedTreasure).up and player.buff(SB.BuriedTreasure).remains < 4) or (player.buff(SB.TrueBearing).up and player.buff(SB.TrueBearing).remains < 4)) then
    if castable(SB.RolltheBones) and -spell(SB.RolltheBones) == 0 and player.power.combopoints.actual >= 4 and not talent(6,3) then
      return cast(SB.RolltheBones, 'target')
    end
  end    

  -- if deadshottrait or aceupyoursleevetrait then
  --   --Cast 4-5 Combo Point Roll the Bones (see dedicated Roll the Bones section for details).
  --   if castable(SB.RolltheBones) and -spell(SB.RolltheBones) == 0 and player.power.combopoints.actual >= 4 and not talent(6,3) 
  --   and ((rtbcount < 2 and player.buff(SB.LoadedDice).up) or (rtbcount < 2 and player.buff(SB.RuthlessPrecision).down)) then
  --     return cast(SB.RolltheBones, 'target')
  --   end
  -- end 

end
setfenv(RolltheBones, dark_addon.environment.env)
--End Roll the Bones Function


local function combat()
  if GroupType() then  end
  if findTank() then end
  if target.alive and target.enemy and player.alive and not player.channeling() then
	local Kick0 = dark_addon.settings.fetch('KiraFeral_settings2_Kick0', true)
	local Kick1 = dark_addon.settings.fetch('KiraFeral_settings2_Kick1', true)
	local Kick2 = dark_addon.settings.fetch('KiraFeral_settings2_Kick2', true)
	local Kick3 = dark_addon.settings.fetch('KiraFeral_settings2_Kick3', true)
	local Kick4 = dark_addon.settings.fetch('KiraFeral_settings2_Kick4', true)
	local Kick5 = dark_addon.settings.fetch('KiraFeral_settings2_Kick5', true)
	local Kick6 = dark_addon.settings.fetch('KiraFeral_settings2_Kick6', true)
	local Kick7 = dark_addon.settings.fetch('KiraFeral_settings2_Kick7', true)
	local Kick8 = dark_addon.settings.fetch('KiraFeral_settings2_Kick8', true)
	local Kick9 = dark_addon.settings.fetch('KiraFeral_settings2_Kick9', true)
	local Kick10 = dark_addon.settings.fetch('KiraFeral_settings2_Kick10', true)
	local Kick11 = dark_addon.settings.fetch('KiraFeral_settings2_Kick11', true)
	local Kick12 = dark_addon.settings.fetch('KiraFeral_settings2_Kick12', true)
	local Kick13 = dark_addon.settings.fetch('KiraFeral_settings2_Kick13', true)
	local Kick14 = dark_addon.settings.fetch('KiraFeral_settings2_Kick14', true)
	local Kick15 = dark_addon.settings.fetch('KiraFeral_settings2_Kick15', true)
	local Kick16 = dark_addon.settings.fetch('KiraFeral_settings2_Kick16', true)
	local Kick17 = dark_addon.settings.fetch('KiraFeral_settings2_Kick17', true)
	local Kick18 = dark_addon.settings.fetch('KiraFeral_settings2_Kick18', true)
	local Kick19 = dark_addon.settings.fetch('KiraFeral_settings2_Kick19', true)
	local Kick20 = dark_addon.settings.fetch('KiraFeral_settings2_Kick20', true)
	local Kick21 = dark_addon.settings.fetch('KiraFeral_settings2_Kick21', true)
	local Kick22 = dark_addon.settings.fetch('KiraFeral_settings2_Kick22', true)
	local Kick23 = dark_addon.settings.fetch('KiraFeral_settings2_Kick23', true)
	local Kick24 = dark_addon.settings.fetch('KiraFeral_settings2_Kick24', true)
	local Kick25 = dark_addon.settings.fetch('KiraFeral_settings2_Kick25', true)
	local Kick26 = dark_addon.settings.fetch('KiraFeral_settings2_Kick26', true)
	local KickFocus0 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus0', true)
	local KickFocus1 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus1', true)
	local KickFocus2 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus2', true)
	local KickFocus3 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus3', true)
	local KickFocus4 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus4', true)
	local KickFocus5 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus5', true)
	local KickFocus6 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus6', true)
	local KickFocus7 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus7', true)
	local KickFocus8 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus8', true)
	local KickFocus9 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus9', true)
	local KickFocus10 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus10', true)
	local KickFocus11 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus11', true)
	local KickFocus12 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus12', true)
	local KickFocus13 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus13', true)
	local KickFocus14 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus14', true)
	local KickFocus15 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus15', true)
	local KickFocus16 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus16', true)
	local KickFocus17 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus17', true)
	local KickFocus18 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus18', true)
	local KickFocus19 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus19', true)
	local KickFocus20 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus20', true)
	local KickFocus21 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus21', true)
	local KickFocus22 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus22', true)
	local KickFocus23 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus23', true)
	local KickFocus24 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus24', true)
	local KickFocus25 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus25', true)
	local KickFocus26 = dark_addon.settings.fetch('KiraFeral_settings2_KickFocus26', true)
	local Trink1 = dark_addon.settings.fetch('KiraFeral_settings5_Trink1', true)
 	local Trink2 = dark_addon.settings.fetch('KiraFeral_settings5_Trink2', true)
 	local Trink3 = dark_addon.settings.fetch('KiraFeral_settings5_Trink3', true)
 	local Trink4 = dark_addon.settings.fetch('KiraFeral_settings5_Trink4', true)
 	local Trink5 = dark_addon.settings.fetch('KiraFeral_settings5_Trink5', true)
 	local Trink6 = dark_addon.settings.fetch('KiraFeral_settings5_Trink6', true)
 	local Trink7 = dark_addon.settings.fetch('KiraFeral_settings5_Trink7', true)
 	local Trink8 = dark_addon.settings.fetch('KiraFeral_settings5_Trink8', true)
 	local Trink9 = dark_addon.settings.fetch('KiraFeral_settings5_Trink9', true)
 	local Trink10 = dark_addon.settings.fetch('KiraFeral_settings5_Trink10', true)
 	local Trink11 = dark_addon.settings.fetch('KiraFeral_settings5_Trink11', true)
 	local Trink12 = dark_addon.settings.fetch('KiraFeral_settings5_Trink12', true)
 	local Trink13 = dark_addon.settings.fetch('KiraFeral_settings5_Trink13', true)
 	local Trink14 = dark_addon.settings.fetch('KiraFeral_settings5_Trink14', true)
 	local Trink15 = dark_addon.settings.fetch('KiraFeral_settings5_Trink15', true)
 	local Trink16 = dark_addon.settings.fetch('KiraFeral_settings5_Trink16', true)
 	local Trink17 = dark_addon.settings.fetch('KiraFeral_settings5_Trink17', true)
 	local Trink18 = dark_addon.settings.fetch('KiraFeral_settings5_Trink18', true)
 	local Trink19 = dark_addon.settings.fetch('KiraFeral_settings5_Trink19', true)
 	local Trink20 = dark_addon.settings.fetch('KiraFeral_settings5_Trink20', true)
 	local Trink21 = dark_addon.settings.fetch('KiraFeral_settings5_Trink21', true)
 	local Trink22 = dark_addon.settings.fetch('KiraFeral_settings5_Trink22', true)
 	local Trink23 = dark_addon.settings.fetch('KiraFeral_settings5_Trink23', true)
 	local Trink24 = dark_addon.settings.fetch('KiraFeral_settings5_Trink24', true)
	local Hook = dark_addon.settings.fetch("KiraFeral_settings_Hook")
	local Feint = dark_addon.settings.fetch("KiraFeral_settings_Feint", 40)
	-- local CrimsonVile = dark_addon.settings.fetch("KiraFeral_settings_CrimsonVile", 35)
	local usehealthstone = dark_addon.settings.fetch("KiraFeral_settings_healthstone.check", true)
    local healthstonepercent = dark_addon.settings.fetch("KiraFeral_settings_healthstone.spin", 25)		
	local intpercentlow = dark_addon.settings.fetch('KiraFeral_settings_intpercentlow',10)
	local intpercenthigh = dark_addon.settings.fetch('KiraFeral_settings_intpercenthigh',65)		
	local Distract = dark_addon.settings.fetch("KiraFeral_settings_Distract")		
	local usetrinkets = dark_addon.settings.fetch('KiraFeral_settings_usetrinkets', true)
    local Trinket13 = GetInventoryItemID("player", 13)
    local Trinket14 = GetInventoryItemID("player", 14)
	  local rip = dark_addon.settings.fetch('KiraFeral_settings_rip.check', true)
	  local rippercent = dark_addon.settings.fetch('KiraFeral_settings_rip.spin', 60)
	  
	  	  local Cloak = dark_addon.settings.fetch('KiraFeral_settings_Cloak.check', true)
	  local Cloakpercent = dark_addon.settings.fetch('KiraFeral_settings_Cloak.spin', 60)
	  
	  
	  local healka = dark_addon.settings.fetch('KiraFeral_settings_healka.check', true)
	  local healkapercent = dark_addon.settings.fetch('KiraFeral_settings_healka.spin', 60)
	  local enemyCount = enemies.around(8)
	  if enemyCount == 0 then enemyCount = 1 end  


  local intpercent = math.random(intpercentlow,intpercenthigh)
         
	
	if toggle("KickALL", false) and castable(SB.Kick, 'target') and -spell(SB.Kick) == 0 and target.interrupt(intpercent, false) then
    --  print('Kicked' .. intpercent)
      return cast(SB.Kick, 'target')
    end
	if toggle("KickALL", false) and castable(SB.Blind, 'target') and -spell(SB.Kick) > 0 and -spell(SB.Blind) == 0 and target.interrupt(intpercent, false) then
      --  print('Kicked' .. intpercent)
        return cast(SB.Blind, 'target')
    end

   local cloakme = player.removable("disease", "magic", "poison")
  if cloakme and -player.health <= Cloakpercent and Cloak then
    return cast(SB.CloakofShadows)
  end	
  

   if castable(SB.CrimsonVial) and -spell(SB.CrimsonVial) == 0 and -player.health <= healkapercent and healka then
    return cast(SB.CrimsonVial, 'player')
  end
  
 if castable(SB.Riposte) and -spell(SB.Riposte) == 0 and -player.health <= rippercent and rip then
    return cast(SB.Riposte, 'player')
  end
  
  if target.enemy and target.alive and target.distance < 8 then
    auto_attack()
  end

	if castable(SB.BladeFlurry) and -spell(SB.BladeFlurry) == 0 and enemyCount >= 2 then
    return cast(SB.BladeFlurry, 'target')
  end
   if RolltheBones() then return end

	  if castable(SB.GhostlyStrike) and -spell(SB.GhostlyStrike) == 0 and player.power.combopoints.actual <= 4 and talent(1,3) then
    return cast(SB.GhostlyStrike, 'target')
  end
  
    if castable(SB.BladeRush) and -spell(SB.BladeRush) == 0 and talent(7,2) and player.buff(SB.AdrenalineRush).down then
    return cast(SB.BladeRush, 'target')
  end
  
  
  if castable(SB.KillingSpree) and -spell(SB.KillingSpree) == 0 and talent(7,3) then
    return cast(SB.KillingSpree, 'target')
  end       
  
   if castable(SB.AdrenalineRush) and -spell(SB.AdrenalineRush) == 0 and toggle('cooldowns', false) then
    return cast(SB.AdrenalineRush, 'target')
  end
  if toggle('cooldowns', false) and castable(SB.MarkedforDeath) and -spell(SB.MarkedforDeath) == 0 and player.power.combopoints.actual <= 1 and talent(3,3) then
    return cast(SB.MarkedforDeath, 'target')
  end
			
  if castable(SB.BetweentheEyes) and -spell(SB.BetweentheEyes) == 0 and player.power.combopoints.actual >= 4 
  and (player.buff(SB.RuthlessPrecision).up or aceupyoursleevetrait or deadshottrait) then
    return cast(SB.BetweentheEyes, 'target')
  end
  
    if castable(SB.Dispatch) and -spell(SB.Dispatch) == 0 and player.power.combopoints.actual >= 4 then
    return cast(SB.Dispatch, 'target')
  end
  
    if castable(SB.PistolShot) and -spell(SB.PistolShot) == 0 and player.buff(SB.Opportunity).up 
  and (player.power.combopoints.actual <= 3 or (player.power.combopoints.actual <= 2 and talent(1,1))) then
    return cast(SB.PistolShot, 'target')
  end
    if castable(SB.SinisterStrike) and -spell(SB.SinisterStrike) == 0 then
    return cast(SB.SinisterStrike, 'target')
  end    

    if castable(SB.SinisterStrike) and -spell(SB.SinisterStrike) == 0 then
    return cast(SB.SinisterStrike, 'target')
  end    
  
      if dark_addon.settings.fetch('KiraFeral_settings_Tricks') == true then
        local iTarget = dark_addon.environment.conditions.unit(findTank())
        if iTarget.unitID ~= "player" and SB.TricksOfTheTrade == 0 and player.buff(SB.Stealth).up then
            print("Tricks on " .. iTarget.name)
            return cast(SB.TricksOfTheTrade, iTarget)
        end
    end


--Essence start
   	local delay = 0
   
   --burst essences

	--1

    if toggle("cooldowns", false) and castable(SB.GuardianofAzeroth1) and -spell(SB.GuardianofAzeroth1) == 0 then
    return cast(SB.GuardianofAzeroth1, 'target')
    end 
	    if toggle("cooldowns", false) and castable(SB.GuardianofAzeroth2) and -spell(SB.GuardianofAzeroth2) == 0 then
        return cast(SB.GuardianofAzeroth2, 'target')
		end 
		    if toggle("cooldowns", false) and castable(SB.GuardianofAzeroth3) and -spell(SB.GuardianofAzeroth3) == 0 then
			return cast(SB.GuardianofAzeroth3, 'target')
			end 
	
	--2
	
    if toggle("cooldowns", false) and castable(SB.MemoryofLucidDreams1) and -spell(SB.MemoryofLucidDreams1) == 0 then
    return cast(SB.MemoryofLucidDreams1, 'target')
    end 
	    if toggle("cooldowns", false) and castable(SB.MemoryofLucidDreams2) and -spell(SB.MemoryofLucidDreams2) == 0 then
        return cast(SB.MemoryofLucidDreams2, 'target')
		end 
		    if toggle("cooldowns", false) and castable(SB.MemoryofLucidDreams3) and -spell(SB.MemoryofLucidDreams3) == 0 then
			return cast(SB.MemoryofLucidDreams3, 'target')
			end 

	--3 uncomment to cast (req. 8.3.0+ patch)
		-- if delay < GetTime() then
	-- if toggle("cooldowns", false) and castable(SB.MomentofGlory1) then
    -- return cast(SB.MomentofGlory1, 'player')
    -- end 
	    -- if toggle("cooldowns", false) and castable(SB.MomentofGlory2) and -spell(SB.MomentofGlory2) == 0 then
        -- return cast(SB.MomentofGlory2, 'target')
		-- end 
		    -- if toggle("cooldowns", false) and castable(SB.MomentofGlory3) and -spell(SB.MomentofGlory3) == 0 then
			-- return cast(SB.MomentofGlory3, 'target')
			-- end 
		-- delay = GetTime() + 1.5
	-- end	
			
	--4
	
    if toggle("cooldowns", false) and castable(SB.WorldveinResonance1) and -spell(SB.WorldveinResonance1) == 0 then
    return cast(SB.WorldveinResonance1, 'target')
    end 
	    if toggle("cooldowns", false) and castable(SB.WorldveinResonance2) and -spell(SB.WorldveinResonance2) == 0 then
        return cast(SB.WorldveinResonance2, 'target')
		end 
		    if toggle("cooldowns", false) and castable(SB.WorldveinResonance3) and -spell(SB.WorldveinResonance3) == 0 then
			return cast(SB.WorldveinResonance3, 'target')
			end 

	
	
	
	--damage essences
	
	
	
	--1 
	
	 if castable(SB.AnimaofDeath1) and -spell(SB.AnimaofDeath1) == 0 then
        return cast(SB.AnimaofDeath1, 'target')
    end
			 if castable(SB.AnimaofDeath2) and -spell(SB.AnimaofDeath2) == 0 then
        return cast(SB.AnimaofDeath2, 'target')
    end
				 if castable(SB.AnimaofDeath3) and -spell(SB.AnimaofDeath3) == 0 then
        return cast(SB.AnimaofDeath3, 'target')
    end
	
	--2 
	
	 if castable(SB.BloodoftheEnemy1) and -spell(SB.BloodoftheEnemy1) == 0 then
        return cast(SB.BloodoftheEnemy1, 'target')
    end
			 if castable(SB.BloodoftheEnemy2) and -spell(SB.BloodoftheEnemy2) == 0 then
        return cast(SB.BloodoftheEnemy2, 'target')
    end
				 if castable(SB.BloodoftheEnemy3) and -spell(SB.BloodoftheEnemy3) == 0 then
        return cast(SB.BloodoftheEnemy3, 'target')
    end
	
		
	--3  uncomment to cast (req. 8.3.0+ patch)
	
	 -- if castable(SB.ReapingFlames1) and -spell(SB.ReapingFlames1) == 0 then
        -- return cast(SB.ReapingFlames1, 'target')
    -- end
			 -- if castable(SB.ReapingFlames2) and -spell(SB.ReapingFlames2) == 0 then
        -- return cast(SB.ReapingFlames2, 'target')
    -- end
				 -- if castable(SB.ReapingFlames3) and -spell(SB.ReapingFlames3) == 0 then
        -- return cast(SB.ReapingFlames3, 'target')
    -- end
	
	--4
	
	
local focused = dark_addon.settings.fetch("KiraFeral_settings_focused")
	if delay < GetTime() then	

if (focused == "shift" and modifier.shift) or (focused == "control" and modifier.control) or (focused == "alt" and modifier.alt) then 

if castable(SB.FocusedAzeriteBeam1) or castable(SB.FocusedAzeriteBeam2) or castable(SB.FocusedAzeriteBeam3) then
	return cast(SB.FocusedAzeriteBeam1, 'ground') or cast(SB.FocusedAzeriteBeam2, 'ground') or cast(SB.FocusedAzeriteBeam3, 'ground')
	end	
end	
 delay = GetTime() + 1.4
end

	-- if delay < GetTime() then
	 -- if castable(SB.FocusedAzeriteBeam1) and -spell(SB.FocusedAzeriteBeam1) == 0 then
        -- return cast(SB.FocusedAzeriteBeam1, 'target')
    -- end
			 -- if castable(SB.FocusedAzeriteBeam2) and -spell(SB.FocusedAzeriteBeam2) == 0 then
        -- return cast(SB.FocusedAzeriteBeam2, 'target')
    -- end
				 -- if castable(SB.FocusedAzeriteBeam3) and -spell(SB.FocusedAzeriteBeam3) == 0 then
        -- return cast(SB.FocusedAzeriteBeam3, 'target')
    -- end
	 -- delay = GetTime() + 1.4
-- end	
	--5
	
	 if castable(SB.PurifyingBlast1) and -spell(SB.PurifyingBlast1) == 0 then
        return cast(SB.PurifyingBlast1, 'target')
    end
			 if castable(SB.PurifyingBlast2) and -spell(SB.PurifyingBlast2) == 0 then
        return cast(SB.PurifyingBlast2, 'target')
    end
				 if castable(SB.PurifyingBlast3) and -spell(SB.PurifyingBlast3) == 0 then
        return cast(SB.PurifyingBlast3, 'target')
    end
	
	--6
	
	 if castable(SB.ConcentratedFlame1) and -spell(SB.ConcentratedFlame1) == 0 then
        return cast(SB.ConcentratedFlame1, 'target')
    end
			 if castable(SB.ConcentratedFlame2) and -spell(SB.ConcentratedFlame2) == 0 then
        return cast(SB.ConcentratedFlame2, 'target')
    end
				 if castable(SB.ConcentratedFlame3) and -spell(SB.ConcentratedFlame3) == 0 then
        return cast(SB.ConcentratedFlame3, 'target')
    end
	
	--7
			
	 if castable(SB.TheUnboundForce1) and -spell(SB.TheUnboundForce1) == 0 then
        return cast(SB.TheUnboundForce1, 'target')
    end
			 if castable(SB.TheUnboundForce2) and -spell(SB.TheUnboundForce2) == 0 then
        return cast(SB.TheUnboundForce2, 'target')
    end
				 if castable(SB.TheUnboundForce3) and -spell(SB.TheUnboundForce3) == 0 then
        return cast(SB.TheUnboundForce3, 'target')
    end
	
		
	
	-- end essences 

			  
			if talent(6, 3) and castable(SB.SliceAndDice) and -player.buff(SB.SliceAndDice).down and player.power.combopoints.actual >= 4  then
			return cast(SB.SliceAndDice)
			end

			  if usetrinkets and target.alive and target.enemy and player.alive then
				if GetItemCooldown(Trinket13) == 0 then
				  macro('/use 13')
				end
				if GetItemCooldown(Trinket14) == 0 then
				  macro('/use 14')
				end
			  end



				
-- if had target end
		
	if (Hook == "shift" and modifier.shift) or (Hook == "control" and modifier.control) or (Hook == "alt" and modifier.alt) and castable(SB.Hook) then
      return cast(SB.Hook)
	end	
	
   -- if CrimsonVile and -player.health <= CrimsonVile then
        -- return cast(SB.CrimsonVial)
      -- end
		if Feint and talent(4,3) and -player.health <= Feint then
        return cast(SB.Feint)
		end
	
	if usehealthstone == true and player.health.percent < healthstonepercent and GetItemCount(5512) >= 1 and GetItemCooldown(5512) == 0 then
		macro("/use Healthstone") -- ???????????????????? ???????????? ????????.
    end	
		
	if (Distract == "shift" and modifier.shift) or (Distract == "control" and modifier.control) or (Distract == "alt" and modifier.alt) and castable(SB.Distract)  then
      return cast(SB.Distract, 'ground')
	end	
	
        if not player.channeling() and dark_addon.settings.fetch('KiraFeral_settings_autosprint') == true and castable(SB.Sprint) then
            return cast(SB.Sprint)
        end

end -- combat end
 if toggle('interrupts', false) then
	if Kick0 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and p[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick1 == true then
	    for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and s[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Vanish, target)
            end
          end
				if -buff(SB.Vanishbuff)  then 
				return cast(SB.CheapShot, 'target')
        end
	end
	if Kick2 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and l[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick3 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and pn[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick4 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and f[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick5 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and d[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick6 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and t[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick7 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and e[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick8 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and a[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick9 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and ef[spell_id] then
              --  print("???????????? " .. name .. " ???? ????????.")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick10 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and rf[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick11 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and eb[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick12 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and c[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick13 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and h[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick14 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and cy[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick15 == true then
	    for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and sgt[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Vanish, target)
            end
          end
		if -buff(SB.Vanishbuff) then 
				return cast(SB.CheapShot, 'target')
        end
	end
	if Kick16 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and m[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick17 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and rp[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick18 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and ro[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick19 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and g[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick20 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and gp[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick21 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and ct[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick22 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and fu[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick23 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and hb[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick24 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and rot[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick25 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and v[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick26 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and holylight[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick27 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and flashl[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end
	if Kick28 == true then
        if target.castable(SB.Kick) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and repentr[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Kick, target)
            end
          end
        end
	end	

--?????? ?? ??????????
	
	if KickFocus0 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and p[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus1 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and s[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus2 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and l[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus3 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and pn[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus4 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and f[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus5 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and d[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus6 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and t[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus7 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and e[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus8 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and a[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus9 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and ef[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus10 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and rf[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus11 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and eb[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus12 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and c[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus13 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and h[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus14 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and cy[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus15 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and sgt[spell_id] and target.distance < 8 then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus16 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and m[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus17 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and rp[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus18 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and ro[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus19 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and g[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus20 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and gp[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus21 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and ct[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus22 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and fu[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus23 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and hb[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus24 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and rot[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus25 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and v[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus26 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and holylight[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus27 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and flashl[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end
	if KickFocus28 == true then
        if focus.castable(SB.Blind) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("focus", i)
            if name and repentr[spell_id] then
                --print("???????????? " .. name .. " !")
                return cast(SB.Blind, focus)
            end
          end
        end
	end		
end


 if toggle("TrinkIt", false) then


if Trink1 == true then
        if target.castable(SB.Trinket) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and polyhex[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink2 == true then
        if target.castable(SB.Trinket) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Freez[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink3 == true then
        if target.castable(SB.Trinket) then
        for i = 1, 40 do
        local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Fear[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink4 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Imprison[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink5 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Intimidating[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink6 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Psychic[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink7 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Rependance[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink8 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Blind[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink9 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Gouge[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink10 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Hindrance[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink11 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Mortal[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink12 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and maim[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink13 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Chains[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink14 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Nova[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink15 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Gnaw[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink16 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and LegSweep[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink17 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and HammerofJustice[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink18 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and KidneyShot[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink19 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and CheapShot[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink20 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Shadowfury[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink21 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and AxeToss[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink22 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and Shockwave[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink23 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and StormBolt[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end
	if Trink24 == true then
		if target.castable(SB.Trinket) then
		for i = 1, 40 do
		local name, _, _, _, endTime, _, _, _, spell_id  = UnitCastingInfo("target", i)
            if name and WarStomp[spell_id] then
                --print("???????????? " .. name .. " ???? ????????!")
                return cast(SB.Trinket, target)
            end
          end
        end
	end

end

end

local function resting()
  	local Feint = dark_addon.settings.fetch("KiraFeral_settings_Feint", 40)
	local Distract = dark_addon.settings.fetch("KiraFeral_settings_Distract")
	local Hook = dark_addon.settings.fetch("KiraFeral_settings_Hook")
	local BladeRush = dark_addon.settings.fetch("KiraFeral_settings_BladeRush")
	local enemyCount = enemies.around(8)
	

  if player.alive then 
         if not player.channeling() and dark_addon.settings.fetch('KiraFeral_settings_autosprint') == true and castable(SB.Sprint) then
            return cast(SB.Sprint)
        end
  if not -buff(SB.Stealth) and toggle('use_stealth', false) and player.moving and player.alive then 
    return cast(SB.Stealth)
  end

  if  toggle('Opener', false) and  target.distance <= 8 and castable(SB.Ambush) and -buff(SB.Stealth) and target.enemy then
    return cast(SB.Ambush, 'target')
  end
		if Feint and talent(4,3) and -player.health <= Feint then
        return cast(SB.Feint)
		end

end


		
	if (Hook == "shift" and modifier.shift) or (Hook == "control" and modifier.control) or (Hook == "alt" and modifier.alt) and castable(SB.Hook) then
	return cast(SB.Hook, 'ground')
	end	
		
	if (BladeRush == "shift" and modifier.shift) or (BladeRush == "control" and modifier.control) or (BladeRush == "alt" and modifier.alt) and castable(SB.BladeRush)  then
      return cast(SB.BladeRush, 'target')
	end	

		
	if (Distract == "shift" and modifier.shift) or (Distract == "control" and modifier.control) or (Distract == "alt" and modifier.alt) and castable(SB.Distract)  then
      return cast(SB.Distract, 'ground')
	end	
	
local axe = CreateFrame("MessageFrame",nil,UIParent)
axe:SetFrameStrata("BACKGROUND")
axe:SetWidth(64)
axe:SetHeight(64) 
local exa = axe:CreateTexture(nil,"BACKGROUND")
exa:SetTexture("Interface\\AddOns\\Feral\\Butwhy\\Core\\media\\FlexAxe")
exa:SetAllPoints(axe)
axe.texture = exa
axe:SetPoint("BOTTOMRIGHT",1,1)
axe:Show()
end



function interface()

local settings = {
        key = 'KiraFeral_settings',
        title = 'Pink Axe settings!',
        width = 350,
        height = 762,
	--	color = "3cff00",
		color = "00a2ff",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "Main Settings",		align = 'CENTER', },
			        { type = 'rule' },
            { type = 'text', text = 'Raid build: [2] - [1] - [1-2] - [2] - [3] - [2] - [1-2]',		align = 'CENTER', },
            { type = 'text', text = 'AoE\Myth+ build: [2] - [1] - [1] - [2] - [3] - [2] - [1]' ,		align = 'CENTER',},           
		   { type = 'text', text = 'Build by: icy-veins.com' ,		align = 'CENTER',},
            { type = 'text', text = 'Support all talents. Exept PvP.(willfixlater)',		align = 'CENTER', },
            { type = 'text', text = 'Support all dps Azerite Talents, exept: Ripple.',		align = 'CENTER', },
            { type = 'text', text = 'ALT =  Rush | Shift = Hook  | Ctrl = Distract.',		align = 'CENTER', },
			{ type = 'text', text = 'Configure PvP kick Target (Kick) | Focus (Blind) from settings. (!!Check interrupts enabled to work!!)',		align = 'CENTER', },
			{ type = 'text', text = 'Enable PVE kick from buttun! (*Kick everycast.)',		align = 'CENTER', },
			{ type = 'text', text = 'Configure PvP Trinket from settings. (!!Check TrinkIt enabled to work!!)',		align = 'CENTER', },
            { type = 'rule' },
            { type = 'header', text = 'Kick' ,		align = 'CENTER',},
            { key = 'intpercentlow', type = 'spinner', text = 'intpercentlow %', default = '50', desc = '', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'intpercenthigh %', default = '65', desc = '', min = 51, max = 100, step = 1 },
		    { type = 'rule' },
		    { type = 'header', text = "Usefull stuff.",		align = 'CENTER', },
            { key = 'autosprint', type = 'checkbox', text = 'Auto sprint', desc = '', default = false },
            { key = 'Tricks', type = 'checkbox', text = 'Auto Tricks', desc = '', default = false },
            { key = 'rip', type = 'checkspin', text = 'Riposte', desc = 'Health % to cast at', default_check = false, default_spin = 60, min = 5, max = 100, step = 1 },
            { key = 'Cloak', type = 'checkspin', text = 'Cloak Of Shadows', desc = 'Health % to cast at', default_check = false, default_spin = 60, min = 5, max = 100, step = 1 },
            { key = 'healka', type = 'checkspin', text = 'Crimson Vial', desc = 'Health % to cast at', default_check = false, default_spin = 60, min = 5, max = 100, step = 1 },
            { key = 'smartrtb', type = 'checkbox', text = 'Smart Roll the Bones', desc = '', default = false },
			{ key = 'usetrinkets', type = 'checkbox', text = 'Auto Trinkets', desc = 'If u had ofc.', default = false },
			{ key = 'Distract', type = 'dropdown', text = 'Distract', desc = 'Distract on mouseover.', default = 'control',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
							{ key = 'disabled', text = 'disabled' },		
					    } },
			{ key = 'focused', type = 'dropdown', text = 'Focused Azerite Beam', desc = 'On key.', default = 'control',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
							{ key = 'disabled', text = 'disabled' },		
					    } },
				
					    { type = 'rule' },
						{ type = 'header', text = "Save Ur Ass!" ,		align = 'CENTER',},
			{ key = 'Feint', type = 'spinner', text = 'Auto Feint', desc = 'On HP %', default = 40, min = 1, max = 100, step = 1 }, 
			-- { key = 'CrimsonVile', type = 'spinner', text = 'Crimson Vile', desc = 'On HP %', default = 40, min = 1, max = 100, step = 1 },
			{ key = "healthstone", type = "checkspin", text = "Warlock food", desc = "On HP %", default_check = false, default_spin = 30, min = 5, max = 100, step = 1 },
 
		    { type = 'rule' },
			{ type = 'header', text = "Move Ur Ass." ,		align = 'CENTER',},
			
			{ key = 'Hook', type = 'dropdown', text = 'Retr. Hook.', desc = '', default = 'shift',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
							{ key = 'disabled', text = 'disabled' },
					    } },
			
			{ key = 'BladeRush', type = 'dropdown', text = 'Blade Rush.', desc = 'Not in combat, from not combat state.', default = 'alt',
				list = {
							{ key = 'control', text = 'CTRL' },
							{ key = 'alt', text = 'ALT' },
							{ key = 'shift', text = 'SHIFT' },
							{ key = 'disabled', text = 'disabled' },
					    } },
		
            { type = 'text', text = 'Attention u cant bind 3 keys on same bind!!!!' },						
        }
    }
configWindow = dark_addon.interface.builder.buildGUI(settings)
	
    dark_addon.interface.buttons.add_toggle({
        name = 'settings',
        label = 'Main settings!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('cog'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('cog'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
        },
        callback = function(self)
            if configWindow.parent:IsShown() then
                configWindow.parent:Hide()
            else
                configWindow.parent:Show()
            end
        end
    })


  dark_addon.interface.buttons.add_toggle({
    name = 'Essences',
    label = 'Auto use Essences',
    font = 'dark_addon_icon',
    on = {
      label = dark_addon.interface.icon('stars'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
    },
    off = {
      label = dark_addon.interface.icon('star'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
    }
  })


  dark_addon.interface.buttons.add_toggle({
    name = 'use_stealth',
    label = 'Auto use Stealth',
    font = 'dark_addon_icon',
    on = {
      label = dark_addon.interface.icon('low-vision'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
    },
    off = {
      label = dark_addon.interface.icon('low-vision'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
    }
  })
       dark_addon.interface.buttons.add_toggle({
     name = 'Opener',
    label = 'Fight! Auto ambush Tar. if not combat.',
    font = 'dark_addon_icon',
    on = {
      label = dark_addon.interface.icon('skull'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
    },
    off = {
      label = dark_addon.interface.icon('skull'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
    }
  })
     dark_addon.interface.buttons.add_toggle({
     name = 'KickALL',
    label = 'PVE Kick, kick everything.',
    font = 'dark_addon_icon',
    on = {
      label = dark_addon.interface.icon('bow-arrow'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
    },
    off = {
      label = dark_addon.interface.icon('bow-arrow'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
    }
  })
  
  
 --TrinkIt
     dark_addon.interface.buttons.add_toggle({
     name = 'TrinkIt',
    label = 'Enable trinket!',
    font = 'dark_addon_icon',
    on = {
      label = dark_addon.interface.icon('toggle-on'),
      color = dark_addon.interface.color.blue,
      color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_blue, 0.7)
    },
    off = {
      label = dark_addon.interface.icon('toggle-off'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
    }
  })
	    local settings5 = {
        key = 'KiraFeral_settings5',
        title = 'Pink Axe settings!',
        width = 220,
        height = 494,
		color = "3cff00",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "Configure trinkIT!" ,		align = 'CENTER',},
			{ type = 'rule' },
			{ type = 'header', text = "Poly|Hex" ,		align = 'CENTER',},
			{ key = 'Trink1', type = 'checkbox', text = 'All poly|Hex effects', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Other:" ,		align = 'CENTER',},
			{ key = 'Trink2', type = 'checkbox', text = 'Freez Trap', desc = '', default = false },
			{ key = 'Trink3', type = 'checkbox', text = 'Fear', desc = '', default = false },
			{ key = 'Trink4', type = 'checkbox', text = 'Imprison', desc = '', default = false },
			{ key = 'Trink5', type = 'checkbox', text = 'Intimidating', desc = '', default = false },
			{ key = 'Trink6', type = 'checkbox', text = 'Psychic Scream', desc = '', default = false },
			{ key = 'Trink7', type = 'checkbox', text = 'Rependance', desc = '', default = false },
			{ key = 'Trink8', type = 'checkbox', text = 'Blind', desc = '', default = false },
			{ key = 'Trink9', type = 'checkbox', text = 'Gouge', desc = '', default = false },
			{ key = 'Trink10', type = 'checkbox', text = 'Hindrance', desc = '', default = false },
			{ key = 'Trink11', type = 'checkbox', text = 'Mortal coil', desc = '', default = false },
			{ key = 'Trink12', type = 'checkbox', text = 'Maim', desc = '', default = false },
			{ key = 'Trink13', type = 'checkbox', text = 'Dk Chains', desc = '', default = false },
			{ key = 'Trink14', type = 'checkbox', text = 'Frost nova', desc = '', default = false },
			{ key = 'Trink15', type = 'checkbox', text = 'Gnaw', desc = '', default = false },
			{ key = 'Trink16', type = 'checkbox', text = 'Leg Sweep', desc = '', default = false },
			{ key = 'Trink17', type = 'checkbox', text = 'Hammer of Justice', desc = '', default = false },
			{ key = 'Trink18', type = 'checkbox', text = 'Kidney Shot', desc = '', default = false },
			{ key = 'Trink19', type = 'checkbox', text = 'Cheap Shot', desc = '', default = false },
			{ key = 'Trink20', type = 'checkbox', text = 'Shadow fury', desc = '', default = false },
			{ key = 'Trink21', type = 'checkbox', text = 'Axe Toss', desc = '', default = false },
			{ key = 'Trink22', type = 'checkbox', text = 'Shockwave', desc = '', default = false },
			{ key = 'Trink23', type = 'checkbox', text = 'Storm Bolt', desc = '', default = false },
			{ key = 'Trink24', type = 'checkbox', text = 'War Stomp', desc = '', default = false },
			{ type = 'rule' },
        }
    }

	configWindow5 = dark_addon.interface.builder.buildGUI(settings5)
    dark_addon.interface.buttons.add_toggle({
        name = 'settings4',
        label = 'PvP Trinket Settings!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('book-open'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('book'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
        },
        callback = function(self)
            if configWindow5.parent:IsShown() then
                configWindow5.parent:Hide()
            else
                configWindow5.parent:Show()
            end
        end
    })

	    local settings2 = {
        key = 'KiraFeral_settings2',
        title = 'Pink Axe settings!',
        width = 320,
        height = 794,
		color = "3cff00",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "Configure target (Kick) kick!",		align = 'CENTER', },
			{ type = 'rule' },
			{ type = 'header', text = "Mage",		align = 'CENTER', },
			{ key = 'Kick0', type = 'checkbox', text = 'Sheep', desc = '', default = false },
			{ key = 'Kick20', type = 'checkbox', text = 'Glacial Spike', desc = '', default = false },
			{ key = 'Kick10', type = 'checkbox', text = 'Ray of Frost', desc = '', default = false },
			{ key = 'Kick8', type = 'checkbox', text = 'Arcane Missiles', desc = '', default = false },
			{ key = 'Kick17', type = 'checkbox', text = 'Rune of Power', desc = '', default = false },
			{ key = 'Kick18', type = 'checkbox', text = 'Ring of Frost', desc = '', default = false },
			{ key = 'Kick19', type = 'checkbox', text = 'Greater pyroblast', desc = '', default = false },
			{ key = 'Kick7', type = 'checkbox', text = 'Evocation', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Priest." ,		align = 'CENTER',},
			{ key = 'Kick3', type = 'checkbox', text = 'Penance', desc = '', default = false },
			{ key = 'Kick5', type = 'checkbox', text = 'Divine Hymn', desc = '', default = false },
			{ key = 'Kick16', type = 'checkbox', text = 'Mind control', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Druid." ,		align = 'CENTER',},
			{ key = 'Kick6', type = 'checkbox', text = 'Tranquility', desc = '', default = false },
			{ key = 'Kick23', type = 'checkbox', text = 'Hibernate', desc = '', default = false },
			{ key = 'Kick14', type = 'checkbox', text = 'Cyclone', desc = '', default = false },
			{ key = 'Kick24', type = 'checkbox', text = 'Entangling Roots', desc = '', default = false },
			--{ key = 'Kick26', type = 'checkbox', text = '????????????????????????????', desc = '', default = false },
			--{ key = 'regrowhealth', type = 'spinner', text = '?????????????? % ???? ????????', default = '30', desc = '?????? ???? ?????????????? ???? ????????????????????????????', min = 5, max = 30, step = 1 },
			{ type = 'rule' },
			{ type = 'header', text = "Monk." ,		align = 'CENTER',},
			{ key = 'Kick1', type = 'checkbox', text = 'Soothing Mist', desc = '', default = false},
			{ key = 'Kick9', type = 'checkbox', text = 'Essence Font', desc = '', default = false },
			{ key = 'Kick25', type = 'checkbox', text = 'Vivify', desc = '', default = false },
			{ key = 'Kick22', type = 'checkbox', text = 'Effuse', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Warlock." ,		align = 'CENTER',},
			{ key = 'Kick15', type = 'checkbox', text = 'Shadowfury', desc = '', default = false },			
			{ key = 'Kick4', type = 'checkbox', text = 'Fear', desc = '', default = false },			
			{ key = 'Kick12', type = 'checkbox', text = 'Chaos Bolt', desc = '', default = false },
			{ key = 'Kick21', type = 'checkbox', text = 'Cataclysm', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Shaman." ,		align = 'CENTER',},
			{ key = 'Kick13', type = 'checkbox', text = 'Hex|Frog', desc = '', default = false },
			{ key = 'Kick2', type = 'checkbox', text = 'Lightning Lasso', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Paladin." ,		align = 'CENTER',},
			{ key = 'Kick26', type = 'checkbox', text = 'Holy Light', desc = '', default = false },
			{ key = 'Kick27', type = 'checkbox', text = 'Flash of Light', desc = '', default = false },
			{ key = 'Kick28', type = 'checkbox', text = 'Repentance', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "DH." ,		align = 'CENTER',},
			{ key = 'Kick11', type = 'checkbox', text = 'Yes. Just yes. LoL. Kick Eyes.', desc = 'p.s not tested may not work.', default = false },
			{ type = 'rule' },

        }
    }

	configWindow4 = dark_addon.interface.builder.buildGUI(settings2)
    dark_addon.interface.buttons.add_toggle({
        name = 'settings2',
        label = 'PvP Kick Target!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('book-open'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('book'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
        },
        callback = function(self)
            if configWindow4.parent:IsShown() then
                configWindow4.parent:Hide()
            else
                configWindow4.parent:Show()
            end
        end
    })
		    local settings3 = {
        key = 'KiraFeral_settings3',
        title = 'Pink Axe settings!',
        width = 320,
        height = 794,
		color = "3cff00",
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "Configure focus (Blind) kick!" ,		align = 'CENTER',},
			{ type = 'rule' },
			{ type = 'header', text = "Mage" ,		align = 'CENTER',},
			{ key = 'KickFocus0', type = 'checkbox', text = 'Sheep', desc = '', default = false },
			{ key = 'KickFocus20', type = 'checkbox', text = 'Glacial Spike', desc = '', default = false },
			{ key = 'KickFocus10', type = 'checkbox', text = 'Ray of Frost', desc = '', default = false },
			{ key = 'KickFocus8', type = 'checkbox', text = 'Arcane Missiles', desc = '', default = false },
			{ key = 'KickFocus17', type = 'checkbox', text = 'Rune of Power', desc = '', default = false },
			{ key = 'KickFocus18', type = 'checkbox', text = 'Ring of Frost', desc = '', default = false },
			{ key = 'KickFocus19', type = 'checkbox', text = 'Greater pyroblast', desc = '', default = false },
			{ key = 'KickFocus7', type = 'checkbox', text = 'Evocation', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Priest." ,		align = 'CENTER',},
			{ key = 'KickFocus3', type = 'checkbox', text = 'Penance', desc = '', default = false },
			{ key = 'KickFocus5', type = 'checkbox', text = 'Divine Hymn', desc = '', default = false },
			{ key = 'KickFocus16', type = 'checkbox', text = 'Mind Control', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Druid." ,		align = 'CENTER',},
			{ key = 'KickFocus6', type = 'checkbox', text = 'Tranquility', desc = '', default = false },
			{ key = 'KickFocus23', type = 'checkbox', text = 'Hibernate', desc = '', default = false },
			{ key = 'KickFocus14', type = 'checkbox', text = 'Cyclone', desc = '', default = false },
			{ key = 'KickFocus24', type = 'checkbox', text = 'Entangling Roots', desc = '', default = false },
			--{ key = 'KickFocus26', type = 'checkbox', text = '????????????????????????????', desc = '', default = false },
			--{ key = 'regrowhealth', type = 'spinner', text = '?????????????? % ???? ????????', default = '30', desc = '?????? ???? ?????????????? ???? ????????????????????????????', min = 5, max = 30, step = 1 },
			{ type = 'rule' },
			{ type = 'header', text = "Monk.",		align = 'CENTER', },
			{ key = 'KickFocus1', type = 'checkbox', text = 'Soothing Mist', desc = '', default = false},
			{ key = 'KickFocus9', type = 'checkbox', text = 'Essence Font', desc = '', default = false },
			{ key = 'KickFocus25', type = 'checkbox', text = 'Vivify', desc = '', default = false },
			{ key = 'KickFocus22', type = 'checkbox', text = 'Effuse', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Warlock." ,		align = 'CENTER',},
			{ key = 'KickFocus15', type = 'checkbox', text = 'Shadowfury', desc = '', default = false },			
			{ key = 'KickFocus4', type = 'checkbox', text = 'Fear', desc = '', default = false },			
			{ key = 'KickFocus12', type = 'checkbox', text = 'Chaos bolt', desc = '', default = false },
			{ key = 'KickFocus21', type = 'checkbox', text = 'Cataclysm', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Shaman." ,		align = 'CENTER',},
			{ key = 'KickFocus13', type = 'checkbox', text = 'Hex|Frog', desc = '', default = false },
			{ key = 'KickFocus2', type = 'checkbox', text = 'Lightning Lasso', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "Paladin.",		align = 'CENTER', },
			{ key = 'KickFocus26', type = 'checkbox', text = 'Holy Light', desc = '', default = false },
			{ key = 'KickFocus27', type = 'checkbox', text = 'Flash of Light', desc = '', default = false },
			{ key = 'KickFocus28', type = 'checkbox', text = 'Repentance', desc = '', default = false },
			{ type = 'rule' },
			{ type = 'header', text = "DH." ,		align = 'CENTER',},
			{ key = 'KickFocus11', type = 'checkbox', text = 'Yes. Just yes. LoL. Kick Eyes.', desc = 'p.s not tested may not work.', default = false },
			{ type = 'rule' },

        }
    }

	configWindow3 = dark_addon.interface.builder.buildGUI(settings3)
    dark_addon.interface.buttons.add_toggle({
        name = 'settings3',
        label = 'PvP Kick Focus!',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('book-open'),
            color = dark_addon.interface.color.green,
            color2 = dark_addon.interface.color.green
        },
        off = {
            label = dark_addon.interface.icon('book'),
      color = dark_addon.interface.color.yellow,
      color2 = dark_addon.interface.color.orange
        },
        callback = function(self)
            if configWindow3.parent:IsShown() then
                configWindow3.parent:Hide()
            else
                configWindow3.parent:Show()
            end
        end
    })

end


dark_addon.rotation.register({
  spec = dark_addon.rotation.classes.rogue.outlaw,
  name = 'pinkaxe',
  label = 'Pink axe in ass. - FlexHub.com',
  combat = combat,
  resting = resting,
  interface = interface
})


