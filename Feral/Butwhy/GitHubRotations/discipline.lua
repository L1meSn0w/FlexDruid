local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITpriest

--Spells
SB.MassDispel = 32375
SB.Mindbender = 123040
SB.Penance = 47540
SB.PowerWordBarrier = 62618
SB.PowerWordFortitude = 21562
SB.PowerWordSolace = 129250
SB.PsychicScream = 8122
SB.Purify = 527
SB.Schism = 214621
SB.Shadowfiend = 34433
SB.ShadowWordPain = 589
SB.Smite = 585
SB.WeakenedSoul = 6788
SB.ConcentratedFlame = 295373

--Start Buff Function
local function buff()

  --Power Word Fortitude
  local pwfdelay = math.random(1,3)

  C_Timer.After(pwfdelay,function()
    if IsInGroup() then
      local group_without_pwf = group.count(function(unit) return unit.alive and unit.distance < 40 and unit.buff(SB.PowerWordFortitude).down end)
      if castable(SB.PowerWordFortitude) and -spell(SB.PowerWordFortitude) == 0 and group_without_pwf > 2 then
        --C_Timer.After(pwfdelay,function()
          return cast(SB.PowerWordFortitude, 'player')
        --end)
      end
    end
  end)

  C_Timer.After(pwfdelay,function()
    if not IsInGroup() then
      if castable(SB.PowerWordFortitude) and -spell(SB.PowerWordFortitude) == 0 and player.buff(SB.PowerWordFortitude).down and not player.spell(SB.PowerWordFortitude).lastcast then
        C_Timer.After(pwfdelay,function()
          return cast(SB.PowerWordFortitude, 'player')
        end)
      end
    end
  end)
end
setfenv(buff, dark_addon.environment.env)
--End Buff Function

--Start Dispel Function
local function dispel()

  --Purify
  local purifydelay = math.random(0.5,2)

  --Group Dispel Disease & Magic
  local dispel_unit = group.removable('disease', 'magic')
  C_Timer.After(purifydelay,function()
    if dispel_unit and castable('Purify') then
      return cast('Purify', dispel_unit)
    end
  end)
  
  --Self Dispel Disease & Magic
  local dispel_unit = player.removable('disease', 'magic')
  C_Timer.After(purifydelay,function()
    if dispel_unit and castable('Purify') then
      return cast('Purify', dispel_unit)
    end
  end)

end
setfenv(dispel, dark_addon.environment.env)
--End Dispel Function

--Start Interrupt Function
local function interrupt()

  -- Interrupts
  -- Define random number for interrupt
  local intpercent = math.random(35,65)
  --Psychic Scream
  if
    toggle("interrupts", false) and castable(SB.PsychicScream, "target") and -spell(SB.PsychicScream) == 0 and target.interrupt(intpercent, false) and target.distance <= 8 then
    print("Psychic Scream @ " .. intpercent)
    return cast(SB.PsychicScream, "target")
  end

end
setfenv(interrupt, dark_addon.environment.env)
--End Interrupt Function  

--Start Healing Function
local function healing(combat)

  local pwspercent = dark_addon.settings.fetch("disc_pwspercent", 90)
  local smpercent = dark_addon.settings.fetch("disc_smpercent", 70)
  local penpercent = dark_addon.settings.fetch("disc_penpercent", 70)
  local halopercent = dark_addon.settings.fetch("disc_halopercent", 60)
  local pwrpercent = dark_addon.settings.fetch("disc_pwrpercent", 50)
  local dppercent = dark_addon.settings.fetch("disc_dppercent", 40)
  local pspercent = dark_addon.settings.fetch("disc_pspercent", 30)
  local atonementcheck = group.buffable(SB.Atonement)  

  if IsInGroup() then
    --Dungeon Healing

    if atonementcheck then
      --Shadow Mend
      if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and atonementcheck.health.percent <= smpercent then 
        return cast(SB.ShadowMend, atonementcheck)
      end
      --if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and lowest.health.percent <= smpercent and lowest.buff(SB.Atonement).down then 
      --  return cast(SB.ShadowMend, lowest)
      --end
      --Power Word: Shield
      if castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and atonementcheck.health.percent <= pwspercent and combat == true then
        return cast(SB.PowerWordShield, atonementcheck)
      end    
      --if castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and lowest.health.percent <= pwspercent then
      --  return cast(SB.PowerWordShield, lowest)
      --end
    end

    --Purify
    local purifydelay = math.random(0.25,1)

    --Group Dispel Disease & Magic
    local dispel_unit = group.removable('disease', 'magic')
    C_Timer.After(purifydelay,function()
      if dispel_unit and castable(SB.Purify) then
        return cast(SB.Purify, dispel_unit)
      end
    end)
  
    --Self Dispel Disease & Magic
    --local dispel_unit = player.removable('disease', 'magic')
    --C_Timer.After(purifydelay,function()
    --  if dispel_unit and castable('Purify') then
    --    return cast('Purify', dispel_unit)
    --  end
    --end)

    --Power Word: Barrier
    if castable(SB.PowerWordBarrier) and modifier.shift then
      --macro("/cast [@cursor] Power Word: Barrier")
      return cast(SB.PowerWordBarrier, 'ground')
    end
    
    --Mass Dispel
    if castable(SB.MassDispel) and modifier.control then
      --macro("/cast [@cursor] Mass Dispel")      
      return cast(SB.MassDispel, 'ground')
    end

    --Pain Suppression
    if castable(SB.PainSuppression) and -spell(SB.PainSuppression) == 0 and tank.health.percent <= pspercent then
      return cast(SB.PainSuppression, tank)
    end

    --Desperate Prayer
    if castable(SB.DesperatePrayer) and -spell(SB.DesperatePrayer) == 0 and player.health.percent <= dppercent then
      return cast(SB.DesperatePrayer, player)
    end

    --Power Word: Radiance
    if castable(SB.PowerWordRadiance) and -spell(SB.PowerWordRadiance) == 0 and tank.health.percent <= pwrpercent and spell(SB.PowerWordRadiance).charges >= 1 
    and group.under(pwrpercent, 40, true) >= 2 and not player.spell(SB.PowerWordRadiance).lastcast then
      return cast(SB.PowerWordRadiance, tank)
    end    
    if castable(SB.PowerWordRadiance) and -spell(SB.PowerWordRadiance) == 0 and lowest.health.percent <= pwrpercent and spell(SB.PowerWordRadiance).charges >= 1 
    and group.under(pwrpercent, 40, true) >= 2 and not player.spell(SB.PowerWordRadiance).lastcast then
      return cast(SB.PowerWordRadiance, lowest)
    end

    --Halo
    if castable(SB.Halo) and -spell(SB.Halo) == 0 and group.under(halopercent, 40, true) >= 2 then 
      return cast(SB.Halo)
    end

    --Penance
    if castable(SB.Penance) and -spell(SB.Penance) == 0 and tank.health.percent <= penpercent then
      return cast(SB.Penance, tank)
    end    
    if castable(SB.Penance) and -spell(SB.Penance) == 0 and lowest.health.percent <= penpercent then
      return cast(SB.Penance, lowest)
    end

    --Shadow Mend
    if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and tank.health.percent <= smpercent then 
      return cast(SB.ShadowMend, tank)
    end     
    if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and lowest.health.percent <= smpercent then 
      return cast(SB.ShadowMend, lowest)
    end    

  end

  if not IsInGroup() then

    if UnitLevel("player") < 20 and castable(SB.FlashHeal) and -spell(SB.FlashHeal) == 0 and player.health.percent <= smpercent and player.buff(SB.Atonement).down then
      return cast(SB.FlashHeal, player)
    end

    if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and player.health.percent <= smpercent and player.buff(SB.Atonement).down then 
      return cast(SB.ShadowMend, player)
    end

    if UnitLevel("player") >= 20 and castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and player.health.percent <= pwspercent 
    and (player.buff(SB.Atonement).remains <= 2 or player.buff(SB.Atonement).down) then
      return cast(SB.PowerWordShield, player)
    end

  end  

end
setfenv(healing, dark_addon.environment.env)
--End Healing Function   

--Start DPS Function
local function dps()

if player.alive and not player.channeling() then  

  --Cast Mindbender on cooldown (bear in mind this replaces Shadowfiend in your spellbook).
  if toggle('cooldowns', false) then
    if castable(SB.Mindbender) and -spell(SB.Mindbender) == 0 and talent(3,2) then
      return cast(SB.Mindbender, 'target')
    end
  end
  if toggle('cooldowns', false) then
    if castable(SB.Shadowfiend) and -spell(SB.Shadowfiend) == 0 and not talent(3,2) then
      return cast(SB.Shadowfiend, 'target')
      end
  end
  --Shadow Word: Pain
  if castable(SB.ShadowWordPain) and -spell(SB.ShadowWordPain) == 0 and (target.debuff(SB.ShadowWordPain).down or target.debuff(SB.ShadowWordPain).remains <= 2.0) then
    return cast(SB.ShadowWordPain, 'target')
  end
  --Schism
  if castable(SB.Schism) and -spell(SB.Schism) == 0 then
    return cast(SB.Schism, 'target')
  end
    --Essences
    if castable(SB.ConcentratedFlame) and -spell(SB.ConcentratedFlame) == 0 then
      return cast(SB.ConcentratedFlame, 'target')
    end  
  --Power Word: Solace
  if castable(SB.PowerWordSolace) and -spell(SB.PowerWordSolace) == 0 then
    return cast(SB.PowerWordSolace, 'target')
  end
  --Penance
  if castable(SB.Penance) and -spell(SB.Penance) == 0 then
    return cast(SB.Penance, 'target')
  end
  --Smite
  if castable(SB.Smite) and -spell(SB.Smite) == 0 then
    return cast(SB.Smite, 'target')
  end

end  

end
setfenv(dps, dark_addon.environment.env)
--End DPS Function  

local function combat()

  local dispelooc = dark_addon.settings.fetch('disc_dispelooc', true)

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

  local dispelooc = dark_addon.settings.fetch('disc_dispelooc', true)

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
    if UnitLevel("player") < 3 and castable(SB.Smite) and -spell(SB.Smite) == 0 then
      return cast(SB.Smite)
    end
    if castable(SB.ShadowWordPain) and -spell(SB.ShadowWordPain) == 0 and target.debuff(SB.ShadowWordPain).down then
      return cast(SB.ShadowWordPain)
    end
  end

end


function interface()
local settings = {
    key = 'disc',
    title = 'Discipline Priest',
    width = 250,
    height = 350,
    resize = true,
    show = false,
    template = {
      { type = 'header', text = "           Rex's Discipline Priest Settings"},
      { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine.' },
      { type = 'rule' },   
      { type = 'text', text = 'General Settings' },
      { key = 'callpet', type = 'checkbox', text = 'Call Pet', desc = 'Always call Mindbender or Shadowfiend' },
      { key = 'dispelooc', type = 'checkbox', text = 'Use Purify', desc = 'Use out of combat, otherwise will use in combat' },
      { key = "pwspercent", type = "spinner", text = "Power Word: Shield", desc = "Health % of lowest in Group to Cast at", default = 90, min = 5, max = 100, step = 5},
      { key = "smpercent", type = "spinner", text = "Shadow Mend", desc = "Health % of lowest in Group to Cast at", default = 70, min = 5, max = 100, step = 5},
      { key = "penpercent", type = "spinner", text = "Penance", desc = "Health % of lowest in Group to Cast at", default = 70, min = 5, max = 100, step = 5},
      { key = "halopercent", type = "spinner", text = "Halo", desc = "Health % of lowest in Group to Cast at", default = 60, min = 5, max = 100, step = 5},            
      { key = "pwrpercent", type = "spinner", text = "Power Word: Radiance", desc = "Health % of lowest in Group to Cast at", default = 50, min = 5, max = 100, step = 5},
      { key = "dppercent", type = "spinner", text = "Desperate Prayer", desc = "Health % of Player to Cast at", default = 40, min = 5, max = 100, step = 5},
      { key = "pspercent", type = "spinner", text = "Pain Suppression", desc = "Health % of Tank to Cast at", default = 30, min = 5, max = 100, step = 5},      
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
  spec = dark_addon.rotation.classes.priest.discipline,
  name = 'disc',
  label = 'Rex Discipline Priest',
  combat = combat,
  resting = resting,
  interface = interface
})