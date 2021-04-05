local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITpaladin

--Start Buff Function
local function buff()
end
setfenv(buff, dark_addon.environment.env)
--End Buff Function

--Start Dispel Function
local function dispel()

    --Cleanse
    local cleansedelay = math.random(0.5,2)
  
    --Group Poison, Disease & Magic
    local dispel_unit = group.removable('poison', 'disease', 'magic')
    C_Timer.After(cleansedelay,function()
      if dispel_unit and castable(SB.Cleanse) then
        return cast(SB.Cleanse, dispel_unit)
      end
    end)
    
    --Self Dispel Disease & Magic
    local dispel_unit = player.removable('poison', 'disease', 'magic')
    C_Timer.After(cleansedelay,function()
      if dispel_unit and castable(SB.Cleanse) then
        return cast(SB.Cleanse, dispel_unit)
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
    --Hammer of Justice
    if
      toggle("interrupts", false) and castable(SB.HammerofJustice, "target") and -spell(SB.HammerofJustice) == 0 and target.interrupt(intpercent, false) and target.distance <= 8 then
      print("Hammer of Justice @ " .. intpercent)
      return cast(SB.HammerofJustice, "target")
    end
  
end
setfenv(interrupt, dark_addon.environment.env)
--End Interrupt Function

--Start Healing Function
local function healing(combat)

    local hspercent = dark_addon.settings.fetch("holy_bolpercent", 90)
    local bfpercent = dark_addon.settings.fetch("holy_bfpercent", 70)
    local hlpercent = dark_addon.settings.fetch("holy_hlpercent", 70)
    local folpercent = dark_addon.settings.fetch("holy_folpercent", 60)
    local acpercent = dark_addon.settings.fetch("holy_acpercent", 40)
    local lohpercent = dark_addon.settings.fetch("holy_lohpercent", 10)
    local bovpercent = dark_addon.settings.fetch("holy_bovpercent", 90)
    local boppercent = dark_addon.settings.fetch("holy_boppercent", 20)
    local dppercent = dark_addon.settings.fetch("holy_dppercent", 90)
    local dspercent = dark_addon.settings.fetch("holy_dspercent", 20)    
    --local rejuvcheck = group.buffable(SB.Rejuvenation)

    if IsInGroup() then

        if target.enemy and target.distance <= 30 then
            auto_attack()
        end

        --Dungeon Healing
        -- Lay on Hands on dying players
        if castable(SB.LayonHands) and -spell(SB.LayonHands) == 0 and tank.debuff(SB.Forbearance).down and tank.health.effective <= lohpercent then
          return cast(SB.LayonHands, tank)
        end
        if castable(SB.LayonHands) and -spell(SB.LayonHands) == 0 and lowest.debuff(SB.Forbearance).down and lowest.health.effective <= lohpercent then
          return cast(SB.LayonHands, lowest)
        end
        --Blessing of Protection on Non-Tank and Non-Player
        if castable(SB.BlessingofProtection) and -spell(SB.BlessingofProtection) == 0 and lowest.debuff(SB.Forbearance).down 
        and lowest ~= tank and lowest ~= player and lowest.health.effective <= boppercent then
          return cast(SB.BlessingofProtection, lowest)
        end
        --Divine Shield
        if castable(SB.DivineShield) and -spell(SB.DivineShield) == 0 and player.health.effective <= dspercent then
          return cast(SB.DivineShield, 'player')
        end
        --Dive Protection
        if castable(SB.DivineProtection) and -spell(SB.DivineProtection) == 0 and player.health.effective <= dppercent then
          return cast(SB.DivineProtection, 'player')
        end
        --Cooldown - Avenging Crusader with Crusader Strike and Judgment
        if toggle('cooldowns', false) then
          if castable(SB.AvengingCrusader) and -spell(SB.AvengingCrusader) == 0 and tank.health.effective < acpercent then
            return cast(SB.AvengingCrusader, 'player')
          end
        end
        if player.buff(SB.AvengingCrusader).exists and target.enemy then
          if castable(SB.CrusaderStrike) and -spell(SB.CrusaderStrike) == 0 and target.distance <= 8 then
            return cast(SB.CrusaderStrike, 'target')
          end
          if castable(SB.Judgment) and -spell(SB.Judgment) == 0 and target.distance < 30 then
            return cast(SB.Judgment, 'target')
          end
        end
        --Light of Dawn for 15yd Cone Group Heal
        if modifier.shift and castable(SB.LightofDawn) then
          return cast(SB.LightofDawn)
        end
        --Judgement is high priority due to Judgment of Light
        if castable(SB.Judgment) and target.enemy and target.distance < 30 then
            return cast(SB.Judgment, "target")
        end
        --Beacon of Virtue
        if castable(SB.BeaconofVirtue) and -spell(SB.BeaconofVirtue) == 0 and tank.buff(SB.BeaconofVirtue).down and tank.health.effective < bovpercent then
          return cast(SB.BeaconofVirtue, tank)
        end
        if castable(SB.BeaconofVirtue) and -spell(SB.BeaconofVirtue) == 0 and lowest.buff(SB.BeaconofVirtue).down and lowest.health.effective < bovpercent then
          return cast(SB.BeaconofVirtue, lowest)
        end
        --Always keep Beacon of Light on the target
        --if tank.castable(SB.BeaconofLight) and -spell(SB.BeaconofLight) == 0 and tank.buff(SB.BeaconofLight).down and tank ~= player then
        --  return cast(SB.BeaconofLight, tank)
        --end
        --Beacon of Faith on extra target
        --if lowest.castable(SB.BeaconofFaith) and -spell(SB.BeaconofFaith) == 0 and lowest.buff(SB.BeaconofFaith).down and lowest ~= tank then
        --  return cast(SB.BeaconofFaith, lowest)
        --end
        --Use Holy Shock on them on cooldown
        if castable(SB.HolyShock) and tank.health.effective < hspercent then
            return cast(SB.HolyShock, tank)
        end
        if castable(SB.HolyShock) and lowest.health.effective < hspercent then
            return cast(SB.HolyShock, lowest)
        end
        --Use Bestow Faith on them on cooldown
        if castable(SB.BestowFaith) and tank.health.effective < bfpercent then
            return cast(SB.BestowFaith, tank)
        end
        if castable(SB.BestowFaith) and lowest.health.effective < bfpercent then
            return cast(SB.BestowFaith, lowest)
        end
        -- Use Clearcasting procs to cast Regrowth on any person in the raid.
        if castable(SB.FlashofLight) and player.buff(SB.InfusionofLight).exists and tank.health.effective < folpercent then
            return cast(SB.FlashofLight, tank)
        end
        if castable(SB.FlashofLight) and player.buff(SB.InfusionofLight).exists and lowest.health.effective < folpercent then
            return cast(SB.FlashofLight, lowest)
        end  
        --Flash of Light for higher damage
        if castable(SB.FlashofLight) and tank.health.effective < folpercent then
            return cast(SB.FlashofLight, tank)
        end
        if castable(SB.FlashofLight) and lowest.health.effective < folpercent then
            return cast(SB.FlashofLight, lowest)
        end    
        --Use Holy Light for low damage
        if castable(SB.HolyLight) and tank.health.effective < hlpercent then
            return cast(SB.HolyLight, tank)
        end
        if castable(SB.HolyLight) and lowest.health.effective < hlpercent then
            return cast(SB.HolyLight, lowest)
        end

  end
  
    if not IsInGroup() then
  
      --Flash of Light for higher damage
      if castable(SB.FlashofLight) and lowest.health.effective < folpercent then
          return cast(SB.FlashofLight, lowest)
      end    
      --Use Holy Light for low damage
      if castable(SB.HolyLight) and lowest.health.effective < hlpercent then
          return cast(SB.HolyLight, lowest)
      end
  
    end  
  
  end
  setfenv(healing, dark_addon.environment.env)
  --End Healing Function 

--Start DPS Function
local function dps()

if target.enemy and target.distance <= 30 then
    auto_attack()
end

  -- Targets in range check
  local enemyCount = enemies.around(8)
  if enemyCount == 0 then
    enemyCount = 1
  end

  if IsInGroup() and lowest.health.effective >= 95 and tank.health.effective >= 95 then
    if castable(SB.HolyShock) then
      return cast(SB.HolyShock, 'target')
    end

    if castable(SB.CrusaderStrike) and target.distance <= 8 then
      return cast(SB.CrusaderStrike, 'target')
    end

    if castable(SB.ConsecrationProt) and enemyCount >= 3 and target.debuff(SB.ConsecrationProt).down and target.distance <= 4 then
      return cast(SB.ConsecrationProt)
    end
  end

  if not IsInGroup() then
    if castable(SB.Judgment) and target.distance < 30 then
      return cast(SB.Judgment, 'target')
    end
    if castable(SB.HolyShock) then
      return cast(SB.HolyShock, 'target')
    end
    if castable(SB.CrusaderStrike) and target.distance <= 8 then
      return cast(SB.CrusaderStrike, 'target')
    end
    if castable(SB.ConsecrationProt) and enemyCount >= 2 and target.debuff(SB.ConsecrationProt).down and target.distance <= 4 then
      return cast(SB.ConsecrationProt)
    end
  end

end
setfenv(dps, dark_addon.environment.env)
--End DPS Function


local function combat()
    
  local dispelooc = dark_addon.settings.fetch('holy_dispelooc', true)

  if player.alive and not player.channeling() and not player.buff('Drink').exists and not player.buff('Food').exists then

    --Dispel
    if dispelooc == false then
      if dispel() then return end
    end
    --Healing
    if healing(true) then return end
    --DPS
    if dps() then return end
    --Interrupt
    if interrupt() then return end

  end

end

local function resting()

  local dispelooc = dark_addon.settings.fetch('holy_dispelooc', true)

  if player.alive and not player.channeling() and not player.buff('Drink').exists and not player.buff('Food').exists then

    --Buff
    if buff() then return end
    --Dispel
    if dispelooc == true then
      if dispel() then return end
    end
    --Healing
    if healing(false) then return end

  end

end

function interface()
    local settings = {
        key = 'holy',
        title = 'Holy Paladin',
        width = 250,
        height = 500,
        resize = true,
        show = false,
        template = {
          { type = 'header', text = "           Rex's Holy Paladin Settings"},
          { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine.' },
          { type = 'rule' },   
          { type = 'text', text = 'General Settings' },
          --{ key = 'callpet', type = 'checkbox', text = 'Call Pet', desc = 'Always call Mindbender or Shadowfiend' },
          { key = 'dispelooc', type = 'checkbox', text = 'Use Cleanse', desc = 'Use out of combat, otherwise will use in combat' },
          { key = "bovpercent", type = "spinner", text = "Beacon of Virtue", desc = "Health % of lowest in Group to Cast at", default = 90, min = 5, max = 100, step = 5},          
          { key = "hspercent", type = "spinner", text = "Holy Shock", desc = "Health % of lowest in Group to Cast at", default = 90, min = 5, max = 100, step = 5},
          { key = "bfpercent", type = "spinner", text = "Bestow Faith", desc = "Health % of lowest in Group to Cast at", default = 70, min = 5, max = 100, step = 5},
          { key = "folpercent", type = "spinner", text = "Flash of Light", desc = "Health % of lowest in Group to Cast at", default = 70, min = 5, max = 100, step = 5},
          { key = "hlpercent", type = "spinner", text = "Holy Light", desc = "Health % of lowest in Group to Cast at", default = 60, min = 5, max = 100, step = 5},            
          { key = "acpercent", type = "spinner", text = "Avenging Crusader", desc = "Health % of lowest in Group to Cast at", default = 50, min = 5, max = 100, step = 5},
          { key = "boppercent", type = "spinner", text = "Blessing of Protection", desc = "Health % of lowest non-Tank in Group to Cast at", default = 40, min = 5, max = 100, step = 5},
          { key = "lohpercent", type = "spinner", text = "Lay on Hands", desc = "Health % of lowest in Group to Cast at", default = 40, min = 5, max = 100, step = 5},
          { key = "dspercent", type = "spinner", text = "Divine Shield", desc = "Health % of Player to Cast at", default = 15, min = 5, max = 100, step = 5},
          { key = "dppercent", type = "spinner", text = "Divine Protection", desc = "Health % of Player to Cast at", default = 20, min = 5, max = 100, step = 5},          
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

dark_addon.rotation.register(
  {
    spec = dark_addon.rotation.classes.paladin.holy,
    name = "holy",
    label = "Rex's Holy Paladin",
    combat = combat,
    resting = resting,
    interface = interface
  }
)
