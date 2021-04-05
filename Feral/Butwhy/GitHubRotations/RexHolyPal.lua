local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITpaladin

SB.Consecration = 26573
SB.Judgment = 275773
SB.GlimmerofLight = 287280

--Start Buff Function
local function buff()
end
setfenv(buff, dark_addon.environment.env)
--End Buff Function

--Start Dispel Function
local function dispel()

    --Cleanse
    local cleansedelay = math.random(0.5,2)

    local unit = group.dispellable(SB.Cleanse)
    if unit and unit.castable(SB.Cleanse) then
      return cast(SB.Cleanse, unit)
    end
  
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

    local style = dark_addon.settings.fetch("holy_style")
    local urgenthspercent = dark_addon.settings.fetch("holy_urgenthspercent", 20)
    local hspercent = dark_addon.settings.fetch("holy_hspercent", 90)
    local bfpercent = dark_addon.settings.fetch("holy_bfpercent", 70)
    local hlpercent = dark_addon.settings.fetch("holy_hlpercent", 70)
    local folpercent = dark_addon.settings.fetch("holy_folpercent", 60)
    local lohpercent = dark_addon.settings.fetch("holy_lohpercent", 10)
    local bovpercent = dark_addon.settings.fetch("holy_bovpercent", 90)
    local boppercent = dark_addon.settings.fetch("holy_boppercent", 20)
    local dppercent = dark_addon.settings.fetch("holy_dppercent", 90)
    local dspercent = dark_addon.settings.fetch("holy_dspercent", 20)    
    local glimmerbuffable = group.buffable(SB.GlimmerofLight)

    if IsInGroup() then

      if style == "glimmer" and combat == true then

        -- Targets in range check
        local enemyCount = enemies.around(8)
        if enemyCount == 0 then enemyCount = 1 end
        dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)        

        if target.enemy and target.distance <= 10 then
          auto_attack()
        end
        --Always keep  Beacon of Light on a target.
        if lowest.castable(SB.BeaconofLight) and -spell(SB.BeaconofLight) == 0 and lowest.buff(SB.BeaconofLight).down and lowest ~= player then
          return cast(SB.BeaconofLight, lowest)
        end
        --Cooldowns
        if lowest.health.percent < urgenthspercent then
          --Avenging Wrath
          if castable(SB.AvengingWrath) and -spell(SB.AvengingWrath) == 0 then
            return cast(SB.AvengingWrath, 'player')
          end
          --Holy Avenger
          if castable(SB.HolyAvenger) and -spell(SB.HolyAvenger) == 0 then
            return cast(SB.HolyAvenger, 'player')
          end          
        end
        --Use  Holy Shock on cooldown, preferably on a target that does not have the  Glimmer of Light buff.
        if -spell(SB.HolyShock) == 0 then
          if castable(SB.HolyShock) and lowest.health.percent < urgenthspercent then
            return cast(SB.HolyShock, lowest)
          end      
          if glimmerbuffable and glimmerbuffable.buff(SB.GlimmerofLight).down and lowest.health.percent < hspercent then
            return cast(SB.HolyShock, glimmerbuffable)
          end
          if castable(SB.HolyShock) and lowest.health.percent < hspercent then
            return cast(SB.HolyShock, lowest)
          end            
          if castable(SB.HolyShock) then
            return cast(SB.HolyShock, target)
          end                    
        end
        --Use  Crusader Strike as often as you can to reduce  Holy Shock's cooldown.
        if castable(SB.CrusaderStrike) and spell(SB.CrusaderStrike).charges == 2 and target.distance <= 8 then
          return cast(SB.CrusaderStrike, 'target')
        end                 
        --Use  Light of Dawn if multiple targets need healing.
        if modifier.shift and castable(SB.LightofDawn) then
          return cast(SB.LightofDawn)
        end
        --Use  Holy Light for low damage, and add  Flash of Light for higher damage as needed and as your Mana permits.
        if castable(SB.FlashofLight) and lowest.health.percent < folpercent then
          return cast(SB.FlashofLight, lowest)
        end
        if castable(SB.HolyLight) and lowest.health.percent < hlpercent then
            return cast(SB.HolyLight, lowest)
        end
        if castable(SB.Judgment) and target.enemy and target.distance < 30 then
          return cast(SB.Judgment, "target")
        end
        if castable(SB.Consecration) and enemyCount >= 2 and target.debuff(SB.Consecration).down and target.distance <= 8 then
          return cast(SB.Consecration)
        end                  

      end  

      if style == "standard" then

        --Dungeon Healing
        -- Lay on Hands on dying players
        if castable(SB.LayonHands) and -spell(SB.LayonHands) == 0 and tank.debuff(SB.Forbearance).down and tank.health.percent <= lohpercent then
          return cast(SB.LayonHands, tank)
        end
        if castable(SB.LayonHands) and -spell(SB.LayonHands) == 0 and lowest.debuff(SB.Forbearance).down and lowest.health.percent <= lohpercent then
          return cast(SB.LayonHands, lowest)
        end
        --Blessing of Protection on Non-Tank and Non-Player
        if castable(SB.BlessingofProtection) and -spell(SB.BlessingofProtection) == 0 and lowest.debuff(SB.Forbearance).down 
        and lowest ~= tank and lowest ~= player and lowest.health.percent <= boppercent then
          return cast(SB.BlessingofProtection, lowest)
        end
        --Divine Shield
        if castable(SB.DivineShield) and -spell(SB.DivineShield) == 0 and player.health.percent <= dspercent then
          return cast(SB.DivineShield, 'player')
        end
        --Dive Protection
        if castable(SB.DivineProtection) and -spell(SB.DivineProtection) == 0 and player.health.percent <= dppercent then
          return cast(SB.DivineProtection, 'player')
        end
        --Light of Dawn for 15yd Cone Group Heal
        if modifier.shift and castable(SB.LightofDawn) then
          return cast(SB.LightofDawn)
        end
        --Beacon of Virtue
        if castable(SB.BeaconofVirtue) and -spell(SB.BeaconofVirtue) == 0 and tank.buff(SB.BeaconofVirtue).down and tank.health.percent < bovpercent then
          return cast(SB.BeaconofVirtue, tank)
        end
        if castable(SB.BeaconofVirtue) and -spell(SB.BeaconofVirtue) == 0 and lowest.buff(SB.BeaconofVirtue).down and lowest.health.percent < bovpercent then
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
        if castable(SB.HolyShock) and tank.health.percent < hspercent then
            return cast(SB.HolyShock, tank)
        end
        if castable(SB.HolyShock) and lowest.health.percent < hspercent then
            return cast(SB.HolyShock, lowest)
        end
        --Use Bestow Faith on them on cooldown
        if castable(SB.BestowFaith) and tank.health.percent < bfpercent then
            return cast(SB.BestowFaith, tank)
        end
        if castable(SB.BestowFaith) and lowest.health.percent < bfpercent then
            return cast(SB.BestowFaith, lowest)
        end
        -- Use Infusion of Light procs to cast Flash of Light on any person in the raid.
        if castable(SB.FlashofLight) and player.buff(SB.InfusionofLight).exists and tank.health.percent < folpercent then
            return cast(SB.FlashofLight, tank)
        end
        if castable(SB.FlashofLight) and player.buff(SB.InfusionofLight).exists and lowest.health.percent < folpercent then
            return cast(SB.FlashofLight, lowest)
        end  
        --Flash of Light for higher damage
        if castable(SB.FlashofLight) and tank.health.percent < folpercent then
            return cast(SB.FlashofLight, tank)
        end
        if castable(SB.FlashofLight) and lowest.health.percent < folpercent then
            return cast(SB.FlashofLight, lowest)
        end    
        --Use Holy Light for low damage
        if castable(SB.HolyLight) and tank.health.percent < hlpercent then
            return cast(SB.HolyLight, tank)
        end
        if castable(SB.HolyLight) and lowest.health.percent < hlpercent then
            return cast(SB.HolyLight, lowest)
        end

      end  

  end
  
    if not IsInGroup() then
  
      --Flash of Light for higher damage
      if castable(SB.FlashofLight) and lowest.health.percent < folpercent then
          return cast(SB.FlashofLight, lowest)
      end    
      --Use Holy Light for low damage
      if castable(SB.HolyLight) and lowest.health.percent < hlpercent then
          return cast(SB.HolyLight, lowest)
      end
  
    end  
  
  end
  setfenv(healing, dark_addon.environment.env)
  --End Healing Function 

--Start DPS Function
local function dps()

  local style = dark_addon.settings.fetch("holy_style")
  local acpercent = dark_addon.settings.fetch("holy_acpercent", 40)

  -- Targets in range check
  local enemyCount = enemies.around(8)
  if enemyCount == 0 then enemyCount = 1 end

  if IsInGroup() and toggle("dps", false) and style == "standard" then

    if target.enemy and target.distance <= 30 then
      auto_attack()
    end

    --Cooldown - Avenging Crusader with Crusader Strike and Judgment
    if toggle('cooldowns', false) then
        if castable(SB.AvengingCrusader) and -spell(SB.AvengingCrusader) == 0 and tank.health.percent < acpercent then
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
    --Judgement is high priority due to Judgment of Light
    if castable(SB.Judgment) and target.enemy and target.distance < 30 then
        return cast(SB.Judgment, "target")
    end    
    if castable(SB.HolyShock) then
      return cast(SB.HolyShock, 'target')
    end

    if castable(SB.CrusaderStrike) and target.distance <= 8 then
      return cast(SB.CrusaderStrike, 'target')
    end

    if castable(SB.Consecration) and enemyCount >= 3 and target.debuff(SB.Consecration).down and target.distance <= 4 then
      return cast(SB.Consecration)
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
    if castable(SB.Consecration) and enemyCount >= 2 and target.debuff(SB.Consecration).down and target.distance <= 4 then
      return cast(SB.Consecration)
    end
  end

end
setfenv(dps, dark_addon.environment.env)
--End DPS Function


local function combat()
    
  local dispelooc = dark_addon.settings.fetch('holy_dispelooc', true)

  if player.alive and not player.channeling() and not player.buff('Drink').exists and not player.buff('Food').exists then

    --Dispel
    --if dispelooc == false then
      if dispel() then return end
    --end
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
    --if dispelooc == true then
      if dispel() then return end
    --end
    --Healing
    if healing(false) then return end

  end

end

function interface()
    local settings = {
        key = 'holy',
        title = 'Holy Paladin',
        width = 280,
        height = 660,
        resize = true,
        show = false,
        template = {
          { type = 'header', text = "           Rex's Holy Paladin Settings"},
          { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine.' },
          { type = 'text', text = 'Supported Talents: Glimmerdin 1 1 3 1 3 1 1' },
          { type = 'text', text = 'Supported Talents: Standard 2 1 3 1 1 2 3' },          
          { type = 'rule' },
          { type = 'header', text = 'Healing Style' },             
          { key = 'style', type = 'dropdown', text = 'What kind of Paladin are you?', desc = '', default = 'standard',
            list = {
              { key = 'standard', text = 'Standard' },
              { key = 'glimmer', text = 'Glimmerdin' },
            } },
          { type = 'rule' },   
          { type = 'header', text = 'General Settings' },            
          { key = 'dispelooc', type = 'checkbox', text = 'Use Cleanse', desc = 'Use out of combat, otherwise will use in combat' },             
          { type = 'rule' },   
          { type = 'header', text = 'Glimmerdin Settings' },
          { key = "urgenthspercent", type = "spinner", text = "Urgent Holy Shock", desc = "Health % of lowest in Group to Cast at", default = 20, min = 5, max = 100, step = 5},          
          { type = 'rule' },   
          { type = 'header', text = 'Standard Settings' },
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
          { type = 'rule' },     
        }
      }
    
      configWindow = dark_addon.interface.builder.buildGUI(settings)

      dark_addon.interface.buttons.add_toggle(
        { name = "dps", label = "Use Damage Spells",
        on = { label = "DPS ON", color = dark_addon.interface.color.pink, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_pink, 0.7) },
        off = { label = "DPS OFF", color = dark_addon.interface.color.grey, color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_grey, 0.5) }
        }
      )
    
      dark_addon.interface.buttons.add_toggle(
        { name = 'settings', label = 'Rotation Settings', font = 'dark_addon_icon',
        on = { label = dark_addon.interface.icon('cog'), color = dark_addon.interface.color.pink, color2 = dark_addon.interface.color.dark_pink },
        off = { label = dark_addon.interface.icon('cog'), color = dark_addon.interface.color.grey, color2 = dark_addon.interface.color.dark_grey },
        
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
    name = "RexHolyPal",
    label = "Rex's Holy Paladin",
    combat = combat,
    resting = resting,
    interface = interface
  }
)
