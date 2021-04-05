local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITdruid

--Spells
SB.CelestialAlignment = 194223
SB.ForceofNature = 205636
SB.LunarEmpowermentBuff = 164547
SB.TigerDashBuff = 252216

--Start Buff Function
local function buff()

  if castable(SB.MoonkinForm) and UnitLevel("player") >= 20 and not player.spell(SB.MoonkinForm).lastcast and player.buff(SB.TigerDashBuff).down and
      GetShapeshiftForm() ~= 4 then
    return cast(SB.MoonkinForm, 'player')
  end	

end
setfenv(buff, dark_addon.environment.env)
--End Buff Function

--Start Dispel Function
local function dispel()

  -- --Purify
  -- local purifydelay = math.random(0.5,2)

  -- --Group Dispel Disease & Magic
  -- local dispel_unit = group.removable('disease', 'magic')
  -- C_Timer.After(purifydelay,function()
  --   if dispel_unit and castable('Purify') then
  --     return cast('Purify', dispel_unit)
  --   end
  -- end)
  
  -- --Self Dispel Disease & Magic
  -- local dispel_unit = player.removable('disease', 'magic')
  -- C_Timer.After(purifydelay,function()
  --   if dispel_unit and castable('Purify') then
  --     return cast('Purify', dispel_unit)
  --   end
  -- end)

end
setfenv(dispel, dark_addon.environment.env)
--End Dispel Function

--Start Interrupt Function
local function interrupt()

  -- Interrupts
  -- Define random number for interrupt
  local intpercent = math.random(35,65)
  --Solar Beam
  if
    toggle("interrupts", false) and castable(SB.SolarBeam, "target") and -spell(SB.SolarBeam) == 0 and target.interrupt(intpercent, false) and target.distance <= 45 then
    print("Solar Beam @ " .. intpercent)
    return cast(SB.SolarBeam, "target")
  end

end
setfenv(interrupt, dark_addon.environment.env)
--End Interrupt Function  

--Start Healing Function
local function healing(combat)

  -- local pwspercent = dark_addon.settings.fetch("disc_pwspercent", 90)
  local rgpercent = dark_addon.settings.fetch("bal_rgpercent", 70)
  -- local penpercent = dark_addon.settings.fetch("disc_penpercent", 70)
  -- local halopercent = dark_addon.settings.fetch("disc_halopercent", 60)
  -- local pwrpercent = dark_addon.settings.fetch("disc_pwrpercent", 50)
  -- local dppercent = dark_addon.settings.fetch("disc_dppercent", 40)
  -- local pspercent = dark_addon.settings.fetch("disc_pspercent", 30)
  -- local atonementcheck = group.buffable(SB.Atonement)  

  -- if IsInGroup() then
  --   --Dungeon Healing

  --   if atonementcheck then
  --     --Shadow Mend
  --     if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and atonementcheck.health.percent <= smpercent then 
  --       return cast(SB.ShadowMend, atonementcheck)
  --     end
  --     --if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and lowest.health.percent <= smpercent and lowest.buff(SB.Atonement).down then 
  --     --  return cast(SB.ShadowMend, lowest)
  --     --end
  --     --Power Word: Shield
  --     if castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and atonementcheck.health.percent <= pwspercent and combat == true then
  --       return cast(SB.PowerWordShield, atonementcheck)
  --     end    
  --     --if castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and lowest.health.percent <= pwspercent then
  --     --  return cast(SB.PowerWordShield, lowest)
  --     --end
  --   end

  --   --Purify
  --   local purifydelay = math.random(0.25,1)

  --   --Group Dispel Disease & Magic
  --   local dispel_unit = group.removable('disease', 'magic')
  --   C_Timer.After(purifydelay,function()
  --     if dispel_unit and castable(SB.Purify) then
  --       return cast(SB.Purify, dispel_unit)
  --     end
  --   end)
  
    --Self Dispel Disease & Magic
    --local dispel_unit = player.removable('disease', 'magic')
    --C_Timer.After(purifydelay,function()
    --  if dispel_unit and castable('Purify') then
    --    return cast('Purify', dispel_unit)
    --  end
    --end)

  --   --Power Word: Barrier
  --   if castable(SB.PowerWordBarrier) and modifier.shift then
  --     --macro("/cast [@cursor] Power Word: Barrier")
  --     return cast(SB.PowerWordBarrier, 'ground')
  --   end
    
  --   --Mass Dispel
  --   if castable(SB.MassDispel) and modifier.control then
  --     --macro("/cast [@cursor] Mass Dispel")      
  --     return cast(SB.MassDispel, 'ground')
  --   end

  --   --Pain Suppression
  --   if castable(SB.PainSuppression) and -spell(SB.PainSuppression) == 0 and tank.health.percent <= pspercent then
  --     return cast(SB.PainSuppression, tank)
  --   end

  --   --Desperate Prayer
  --   if castable(SB.DesperatePrayer) and -spell(SB.DesperatePrayer) == 0 and player.health.percent <= dppercent then
  --     return cast(SB.DesperatePrayer, player)
  --   end

  --   --Power Word: Radiance
  --   if castable(SB.PowerWordRadiance) and -spell(SB.PowerWordRadiance) == 0 and tank.health.percent <= pwrpercent and spell(SB.PowerWordRadiance).charges >= 1 
  --   and group.under(pwrpercent, 40, true) >= 2 and not player.spell(SB.PowerWordRadiance).lastcast then
  --     return cast(SB.PowerWordRadiance, tank)
  --   end    
  --   if castable(SB.PowerWordRadiance) and -spell(SB.PowerWordRadiance) == 0 and lowest.health.percent <= pwrpercent and spell(SB.PowerWordRadiance).charges >= 1 
  --   and group.under(pwrpercent, 40, true) >= 2 and not player.spell(SB.PowerWordRadiance).lastcast then
  --     return cast(SB.PowerWordRadiance, lowest)
  --   end

  --   --Halo
  --   if castable(SB.Halo) and -spell(SB.Halo) == 0 and group.under(halopercent, 40, true) >= 2 then 
  --     return cast(SB.Halo)
  --   end

  --   --Penance
  --   if castable(SB.Penance) and -spell(SB.Penance) == 0 and tank.health.percent <= penpercent then
  --     return cast(SB.Penance, tank)
  --   end    
  --   if castable(SB.Penance) and -spell(SB.Penance) == 0 and lowest.health.percent <= penpercent then
  --     return cast(SB.Penance, lowest)
  --   end

  --   --Shadow Mend
  --   if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and tank.health.percent <= smpercent then 
  --     return cast(SB.ShadowMend, tank)
  --   end     
  --   if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and lowest.health.percent <= smpercent then 
  --     return cast(SB.ShadowMend, lowest)
  --   end    

  -- end

  if not IsInGroup() then

    if castable(SB.Regrowth) and -spell(SB.Regrowth) == 0 and player.health.percent <= rgpercent and player.buff(SB.Regrowth).down then 
      return cast(SB.Regrowth, 'player')
    end

    -- if castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and player.health.percent <= pwspercent 
    -- and (player.buff(SB.Atonement).remains <= 2 or player.buff(SB.Atonement).down) then
    --   return cast(SB.PowerWordShield, player)
    -- end

  end  

end
setfenv(healing, dark_addon.environment.env)
--End Healing Function   

--Start DPS Function
local function dps()

if player.alive and not player.channeling() then

	--At Level 20, you can enter Moonkin Form. Any time you are dealing damage, be in Moonkin Form

	-- for i=1,40 do
 --    local name, icon, _, _, _, etime, source, isStealable, nameplateShowPersonal, spellId = UnitAura("player",i, "HELPFUL")
	--     if spellId == 164547 then
	-- 		print(name, spellId)
	-- 			if castable(SB.LunarStrike) and spell(SB.LunarStrike) == 0 then
	-- 				return cast(SB.LunarStrike, "target")
	-- 			end
	--     end
	-- end

	--Cast Moonfire and maintain it on the targets
	  if castable(SB.Moonfire) and -spell(SB.Moonfire) == 0 and (target.debuff(SB.Moonfire).down or target.debuff(SB.Moonfire).remains <= 6.0) then
	    return cast(SB.Moonfire, 'target')
	  end

	--Cast Sunfire and maintain it on all targets. Sunfire has an 8-yard splash radius, so hit as many targets as possible
	  if castable(SB.Sunfire) and -spell(SB.Sunfire) == 0 and (target.debuff(SB.Sunfire).down or target.debuff(SB.Sunfire).remains <= 5.4) then
	    return cast(SB.Sunfire, 'target')
	  end

	--Cast Celestial Alignment when available. You can also save this for bosses or rare mobs
	  if toggle('cooldowns', false) then
	    if castable(SB.CelestialAlignment) and -spell(SB.CelestialAlignment) == 0 then
	      return cast(SB.CelestialAlignment, 'target')
	    end
	  end

	--Cast Force of Nature on cooldown. You can also save these to taunt a group of mobs off the tank or yourself
	  if toggle('cooldowns', false) then
	    if castable(SB.ForceofNature) and -spell(SB.ForceofNature) == 0 then
	      return cast(SB.ForceofNature, 'ground')
	    end
	  end

	--Cast Fury of Elune on cooldown but try to save to cleave on 3+ targets


	--Cast Lunar Strike when you have a charge of Lunar Empowerment or when you can hit more than one target
	if castable(SB.LunarStrike) and player.buff(SB.LunarEmpowerment).exists then
		return cast(SB.LunarStrike, "target")
	end

	--If there are more than two targets, spend your Astral Power on Starfall
	if modifier.shift and castable(SB.Starfall) and player.power.astral.actual >= 40 then
	  return cast(SB.Starfall, "ground")
	end

	--Cast Starsurge when you have 40 Astral Power
	if castable(SB.Starsurge) and -spell(SB.Starsurge) == 0 and player.power.astral.actual >= 40 then
	   return cast(SB.Starsurge, 'target')
	end

	--Cast Solar Wrath and build up Astral Power or when you have a stack of Solar Empowerment
	  if castable(SB.SolarWrath) and -spell(SB.SolarWrath) == 0 then
	    return cast(SB.SolarWrath, 'target')
	  end

end  

end
setfenv(dps, dark_addon.environment.env)
--End DPS Function  

local function combat()

  --local dispelooc = dark_addon.settings.fetch('disc_dispelooc', true)

  --Buff
  if buff() then return end
  --Dispel
  --if dispelooc == false then
  --  if dispel() then return end
  --end
  --Healing
  if healing(true) then return end
  --DPS
  if dps() then return end
  --Interrupt
  if interrupt() then return end

end

local function resting()

  --local dispelooc = dark_addon.settings.fetch('disc_dispelooc', true)

  --Buff
  if buff() then return end
  --Dispel
  --if dispelooc == true then
  --  if dispel() then return end
  --end
  --Healing
  if healing(false) then return end

  --Pull from resting
  if target.exists and target.enemy and target.alive and target.distance < 40 then
	  if castable(SB.Moonfire) and -spell(SB.Moonfire) == 0 and (target.debuff(SB.Moonfire).down or target.debuff(SB.Moonfire).remains <= 6.0) then
	    return cast(SB.Moonfire, 'target')
	  end  	
  end

end


function interface()
local settings = {
    key = 'bal',
    title = 'Balance Druid',
    width = 250,
    height = 350,
    resize = true,
    show = false,
    template = {
      { type = 'header', text = "           Rex's Balance Druid Settings"},
      { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine.' },
      { type = 'rule' },   
      { type = 'text', text = 'General Settings' },
      --{ key = 'callpet', type = 'checkbox', text = 'Call Pet', desc = 'Always call Mindbender or Shadowfiend' },
      --{ key = 'dispelooc', type = 'checkbox', text = 'Use Purify', desc = 'Use out of combat, otherwise will use in combat' },
      --{ key = "pwspercent", type = "spinner", text = "Power Word: Shield", desc = "Health % of lowest in Group to Cast at", default = 90, min = 5, max = 100, step = 5},
      { key = "rgpercent", type = "spinner", text = "Regrowth", desc = "Health % of lowest in Group to Cast at", default = 70, min = 5, max = 100, step = 5},
      --{ key = "penpercent", type = "spinner", text = "Penance", desc = "Health % of lowest in Group to Cast at", default = 70, min = 5, max = 100, step = 5},
      --{ key = "halopercent", type = "spinner", text = "Halo", desc = "Health % of lowest in Group to Cast at", default = 60, min = 5, max = 100, step = 5},            
      --{ key = "pwrpercent", type = "spinner", text = "Power Word: Radiance", desc = "Health % of lowest in Group to Cast at", default = 50, min = 5, max = 100, step = 5},
      --{ key = "dppercent", type = "spinner", text = "Desperate Prayer", desc = "Health % of Player to Cast at", default = 40, min = 5, max = 100, step = 5},
      --{ key = "pspercent", type = "spinner", text = "Pain Suppression", desc = "Health % of Tank to Cast at", default = 30, min = 5, max = 100, step = 5},      
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
  spec = dark_addon.rotation.classes.druid.balance,
  name = 'balance',
  label = 'Rex Balance Druid',
  combat = combat,
  resting = resting,
  interface = interface
})
