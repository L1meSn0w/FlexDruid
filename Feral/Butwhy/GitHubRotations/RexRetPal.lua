local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITpaladin

-- To Do

-- Spells

SB.WakeofAshes = 255937
SB.Cavalier = 230332
SB.SelflessHealer = 85804
SB.DivinePurpose = 223817
SB.CrusaderStrike = 35395
SB.AvengingWrath = 31884
SB.TemplarsVerdict = 85256
SB.BladeofJustice = 184575
SB.Judgment = 275779
SB.ArtofWar = 267344
SB.DivineStorm = 53385
SB.FlashofLight = 19750
SB.HammerofJustice = 853
SB.HandofReckoning = 62124
SB.Redemption = 7328
SB.DivineShield = 642
SB.CleanseToxins = 213644
SB.HandofHindrance = 183218
SB.DivineSteed = 190784
SB.ShieldofVengeance = 184662
SB.Rebuke = 96231
SB.BlessingofFreedom = 1044
SB.HeartoftheCrusader = 32223
SB.BlessingofProtection = 1022
SB.LayonHands = 633
SB.CleanseToxins = 213644
SB.GreaterBlessingofKings = 203538
SB.ConcentratedFlame = 295373

--Start Trinkets Function
local function trinkets()

    local usetrinkets = dark_addon.settings.fetch('retpal_settings_usetrinkets', true)
  
    --Trinkets
    local Trinket13 = GetInventoryItemID("player", 13)
    local Trinket14 = GetInventoryItemID("player", 14)
  
    if usetrinkets then
      if GetItemCooldown(Trinket13) == 0 then
        macro('/use 13')
      end
      if GetItemCooldown(Trinket14) == 0 then
        macro('/use 14')
      end
    end
  
  end
  setfenv(trinkets, dark_addon.environment.env)
  --End Trinkets Function


local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

    -- Reading from settings
    local intpercentlow = dark_addon.settings.fetch('retpal_settings_intpercentlow',50)
    local intpercenthigh = dark_addon.settings.fetch('retpal_settings_intpercenthigh',65)
	local SoVHealth = dark_addon.settings.fetch('retpal_settings_SoVHealth',30)
    local race = UnitRace('player')
    local useessences = dark_addon.settings.fetch('retpal_settings_useessences', true)

    -- Targets in range check
    local enemyCount = enemies.around(8)
    if enemyCount == 0 then enemyCount = 1 end
    dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

    -- Auto Attack
     if target.enemy and target.alive and target.distance < 8 then
         auto_attack()
     end

    --Essences
    if useessences and castable(SB.ConcentratedFlame) and -spell(SB.ConcentratedFlame) == 0 then
        return cast(SB.ConcentratedFlame, target)
      end
      
      local unit = group.dispellable(SB.CleanseToxins)
      if unit and unit.castable(SB.CleanseToxins) then
        return cast(SB.CleanseToxins, unit)
      end      

  --Trinkets
  if trinkets() then return end     

    -- Interrupts
        -- Define random number for interrupt
        local intpercent = math.random(intpercentlow,intpercenthigh)

        -- Rebuke
        if toggle('interrupts', false) and castable(SB.Rebuke, 'target') and -spell(SB.Rebuke) == 0 and target.interrupt(intpercent, false) and target.distance < 8 then
          print('Rebuke @ ' .. intpercent)
          return cast(SB.Rebuke, 'target')
        end
        -- Hammer of Justice
        if toggle('interrupts', false) and castable(SB.HammerofJustice, 'target') and -spell(SB.HammerofJustice) == 0 and -spell(SB.Rebuke) > 0 and target.interrupt(intpercent, false) and target.distance < 8 then
            print('Hammer of Justice @ ' .. intpercent)
            return cast(SB.HammerofJustice, 'target')
        end

    -- Cooldowns
    if toggle('cooldowns', false) then
        -- AvengingWrath on cooldown or for burst DPS
        if castable(SB.AvengingWrath) and -spell(SB.AvengingWrath) == 0 then
            return cast(SB.AvengingWrath)
        end
    end

    --Defensive and Utility Abilities
    -- Enraged Regeneration is Fury's only personal cooldown, good for mitigating damage and healing it back up with Bloodthirst. Note that the buff is not consumed by Bloodthirst, meaning it can be used multiple times during the 8-second duration for increased healing.
    if castable(SB.ShieldofVengeance) and -spell(SB.ShieldofVengeance) == 0 and -player.health <= SoVHealth then
        print('ShieldofVengeance @ ' .. SoVHealth)
  		return cast(SB.ShieldofVengeance)
  	end

    -- Healing
    if castable(SB.FlashofLight) and -spell(SB.FlashofLight) == 0 and -player.health <= 75 and player.buff(SB.SelflessHealer).count == 4 then
        print('Flash of Light @ ' .. -player.health)
        return cast(SB.FlashofLight)
    end

    if castable(SB.DivineShield) and -spell(SB.DivineShield) == 0 and -player.health <= 15 then
        print('Divine Shield @ ' .. -player.health)
        return cast(SB.DivineShield)
    end

--Cast Templar's Verdict as often as possible to spend your Holy Power.
        if castable(SB.TemplarsVerdict) and -spell(SB.TemplarsVerdict) == 0 and -power.holypower >= 3 and enemyCount == 1 then
            return cast(SB.TemplarsVerdict)
        end

--At Level 40, you unlock Divine Storm. This is a Holy Power spender that you use to replace Templar's Verdict in your rotation against 2 or more enemies.
        if castable(SB.DivineStorm) and -spell(SB.DivineStorm) == 0 and -power.holypower >= 3 and enemyCount >= 2 then
            return cast(SB.DivineStorm)
        end        

--Wake of Ashes is our recommended Level 60 talent. It deals massive damage in a frontal cone. Use it as often as possible against as many enemies as possible.
        if castable(SB.WakeofAshes) and -spell(SB.WakeofAshes) == 0 and -power.holypower == 0 and enemyCount >=2 then
            return cast(SB.WakeofAshes)
        end        

--Cast Blade of Justice when it comes off cooldown, and open all fights with it.
        if castable(SB.BladeofJustice) and -spell(SB.BladeofJustice) == 0 then
            return cast(SB.BladeofJustice)
        end  
        
--Cast Judgment when it comes off cooldown.
        if castable(SB.Judgment) and -spell(SB.Judgment) == 0 then
            return cast(SB.Judgment)
        end              

--Cast Crusader Strike as often as possible.
        if castable(SB.CrusaderStrike) and -spell(SB.CrusaderStrike) == 0 then
            return cast(SB.CrusaderStrike)
        end

end
end

local function resting()

  local enemyCount = enemies.around(8)
  dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

    -- Apply Greater BoK
    if castable(SB.GreaterBlessingofKings) and player.buff(SB.GreaterBlessingofKings).down then
        return cast(SB.GreaterBlessingofKings, 'player')
    end

    --Pull from resting
  if target.exists and target.enemy and target.alive and target.distance < 12 then
    if castable(SB.BladeofJustice) and -spell(SB.BladeofJustice) == 0 then
      return cast(SB.BladeofJustice)
    end
  end

end

local function interface()

    local settings = {
        key = 'retpal_settings',
        title = 'Retribution Paladin',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Retribution Paladin Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 1 3 1 1 2 1 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'text', text = 'Shift Modifier used for Heroic Leap' },
            { type = 'rule' },
            { type = 'header', text = 'General Settings' },
            { key = 'useessences', type = 'checkbox', text = 'Auto Use Essences', desc = '', default = true },      
            { key = 'usetrinkets', type = 'checkbox', text = 'Auto Use Trinkets', desc = '', default = true },
            { type = "rule" },            
            { type = 'text', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'text', text = 'Defensive Settings' },
            { key = 'SoVHealth', type = 'spinner', text = 'Shield of Vengeance at Health %', default = '30', desc = 'cast Shield of Vengeance at', min = 0, max = 100, step = 1 },
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

-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register({
    spec = dark_addon.rotation.classes.paladin.retribution,
    name = 'RexRetPal',
    label = 'Rex Ret Paladin',
    combat = combat,
    resting = resting,
    interface = interface
})
