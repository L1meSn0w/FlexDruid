-- Protection Warrior for 8.1 by Rex
-- version 1.4 - 2nd Mar 2019
-- Holding Shift = Heroic Leap to cursor

local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITwarrior

-- To Do

-- Spells

SB.HeroicLeap = 6544
SB.VictoryRush = 34428
SB.BattleShout = 6673
SB.Pummel = 6552
SB.VictoryRushBuff = 32216
SB.AncestralCall = 274738
SB.Berserking = 26297
SB.BloodFury = 33697
SB.GiftoftheNaaru = 121093
SB.LightsJudgement = 255647
SB.Intercept = 198304
SB.Avatar = 107574
SB.DemoralizingShout = 1160
SB.ShieldSlam = 23922
SB.ThunderClap = 6343
SB.Revenge = 6572
SB.Devastate = 20243
SB.ShieldBlock = 2565
SB.IgnorePain = 190456
SB.LastStand = 12975
SB.Shockwave = 46968
SB.IntimidatingShout = 5246
SB.ShieldWall = 871


local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

    -- Reading from settings
    local intpercentlow = dark_addon.settings.fetch('protwar_settings_intpercentlow',50)
    local intpercenthigh = dark_addon.settings.fetch('protwar_settings_intpercenthigh',65)
    local SBHealth = dark_addon.settings.fetch('protwar_settings_SBHealth',90)
    local LSHealth = dark_addon.settings.fetch('protwar_settings_LSHealth',90)
    local IPHealth = dark_addon.settings.fetch('protwar_settings_IPHealth',50)
    local SWHealth = dark_addon.settings.fetch('protwar_settings_SWHealth',30)
    local VRHealth = dark_addon.settings.fetch('protwar_settings_VRHealth',80)
    local GiftHealth = dark_addon.settings.fetch('protwar_settings_GiftHealth',20)
    local Hstonecheck = dark_addon.settings.fetch('protwar_settings_healthstone.check',true)
    local Hstonepercent = dark_addon.settings.fetch('protwar_settings_healthstone.spin',20)
    local race = UnitRace('player')

    -- Targets in range check
    local enemyCount = enemies.around(8)
    if enemyCount == 0 then enemyCount = 1 end
    dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

  -- Use Racials
    if toggle('useracials', false) then
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

    -- Heroic Leap IC
    if modifier.shift and castable(SB.HeroicLeap) then
        return cast(SB.HeroicLeap, 'ground')
    end

    -- Interrupts
        -- Define random number for interrupt
        local intpercent = math.random(intpercentlow,intpercenthigh)

        -- Pummel
        if toggle('interrupts', false) and castable(SB.Pummel, 'target') and -spell(SB.Pummel) == 0 and target.interrupt(intpercent, false) and target.distance < 8 then
          print('Pummel @ ' .. intpercent)
          return cast(SB.Pummel, 'target')
        end

        --Shockwave
        if toggle('interrupts', false) and castable(SB.Shockwave, 'target') and -spell(SB.Shockwave) == 0 and -spell(SB.Pummel) > 0 and target.interrupt(intpercent, false) and target.distance < 8 then
          print('Shockwave @ ' .. intpercent)
          return cast(SB.Shockwave, 'target')
        end

        --Intimidating Shout
        if toggle('interrupts', false) and castable(SB.IntimidatingShout, 'target') and -spell(SB.IntimidatingShout) == 0 and -spell(SB.Shockwave) > 0 and -spell(SB.Pummel) > 0 and target.interrupt(intpercent, false) and target.distance < 8 then
          print('Intimidating Shout @ ' .. intpercent)
          return cast(SB.IntimidatingShout, 'target')
        end

    -- Cooldowns
    if toggle('cooldowns', false) then
        -- Avatar on cooldown
        if castable(SB.Avatar) and -spell(SB.Avatar) == 0 then
            return cast(SB.Avatar)
        end
    end

    if toggle('cooldowns', false) then
        -- Demoralizing Shout on cooldown
        if castable(SB.DemoralizingShout) and -spell(SB.DemoralizingShout) == 0 then
            return cast(SB.DemoralizingShout)
        end
    end    

    --Defensive and Utility Abilities
    --Shield Block is Fury's only personal cooldown, good for mitigating damage and healing it back up with Bloodthirst. Note that the buff is not consumed by Bloodthirst, meaning it can be used multiple times during the 8-second duration for increased healing.
    if castable(SB.ShieldBlock) and -spell(SB.ShieldBlock) == 0 and player.buff(SB.ShieldBlock).down and player.buff(SB.LastStand).down and -player.health <= SBHealth then
  		return cast(SB.ShieldBlock)
  	end

    --Last Stand
    --Shield Block is Fury's only personal cooldown, good for mitigating damage and healing it back up with Bloodthirst. Note that the buff is not consumed by Bloodthirst, meaning it can be used multiple times during the 8-second duration for increased healing.
    if castable(SB.LastStand) and -spell(SB.LastStand) == 0 and player.buff(SB.ShieldBlock).down and spell(SB.ShieldBlock).charges == 0 and -player.health <= LSHealth then
  		return cast(SB.LastStand)
  	end

    --Ignore Pain 
    if castable(SB.IgnorePain) and -spell(SB.IgnorePain) == 0 and -player.health <= IPHealth then
        print('IgnorePain @ ' .. IPHealth)
  		return cast(SB.IgnorePain)
  	end

    --Shield Wall 
    if castable(SB.ShieldWall) and -spell(SB.ShieldWall) == 0 and -player.health <= SWHealth then
        print('ShieldWall @ ' .. SWHealth)
  		return cast(SB.ShieldWall)
  	end

    --Berserking
    if castable(SB.Berserking) and -spell(SB.Berserking) == 0 and not HasFullControl() then
        return cast(SB.Berserking)
    end

    -- Healing
    if castable(SB.VictoryRush) and -buff(SB.VictoryRushBuff) and -player.health <= VRHealth  then
        print('Heal @ ' .. -player.health)
        return cast(SB.VictoryRush)
    end

    if castable(SB.ImpendingVictory) and -player.health <= VRHealth and talent(2,2) then
        print('Heal @ ' .. -player.health)
        return cast(SB.ImpendingVictory)
    end

    -- Healthstone
    if Hstonecheck == true and -player.health < Hstonepercent and GetItemCount(5512) >= 1 and GetItemCooldown(5512) == 0 then
        macro('/use Healthstone')
    end

        --Rotation
--Missing Dragon Roar, Storm Bolt, Ravager

        --Cast Intercept to initiate combat whenever possible.
        --Victory Rush activates whenever an enemy is killed. Use it to heal yourself.
        --Cast Avatar to generate a bit of Rage and greatly increase your damage.
        --Cast Demoralizing Shout to reduce the damage you take, and increase the damage you deal (when using the Booming Voice talent).

        --Cast Shield Slam to generate Rage and deal damage.
        if castable(SB.ShieldSlam) and -spell(SB.ShieldSlam) == 0 then
            return cast(SB.ShieldSlam)
        end

        --Cast Thunder Clap to generate Rage and deal damage, particularly during Avatar with Unstoppable Force talented.
        if castable(SB.ThunderClap) and -spell(SB.ThunderClap) == 0 then
            return cast(SB.ThunderClap)
        end

        --Spend Rage on Revenge to damage multiple targets if you do not need to spend it on your active mitigation to survive.
        if castable(SB.Revenge) and -spell(SB.Revenge) == 0 then
            return cast(SB.Revenge)
        end

        --Cast Devastate to fill empty global cooldowns, and reset the cooldown of Shield Slam
        if castable(SB.Devastate) and -spell(SB.Devastate) == 0 then
            return cast(SB.Devastate)
        end   

end
end

local function resting()

  local enemyCount = enemies.around(8)
  dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

  -- Infernal Strike OOC
  if modifier.shift and castable(SB.HeroicLeap) then
      return cast(SB.HeroicLeap, 'ground')
  end

end

local function interface()

    local settings = {
        key = 'protwar_settings',
        title = 'Prot Warrior',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Prot Warrior Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 1 3 1 1 2 1 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'text', text = 'Shift Modifier used for Heroic Leap' },
            { type = 'rule' },
            { type = 'text', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'text', text = 'Defensive Settings' },
            { key = 'SBHealth', type = 'spinner', text = 'Shield Block at Health %', default = '90', desc = 'cast Shield Block at', min = 0, max = 100, step = 1 },
            { key = 'LSHealth', type = 'spinner', text = 'Last Stand at Health %', default = '90', desc = 'cast Last Stand at', min = 0, max = 100, step = 1 },
            { key = 'IPHealth', type = 'spinner', text = 'Ignore Pain at Health %', default = '50', desc = 'cast Ignore Pain at', min = 0, max = 100, step = 1 },
            { key = 'SWHealth', type = 'spinner', text = 'Shield Wall at Health %', default = '30', desc = 'cast Shield Wall at', min = 0, max = 100, step = 1 },
            { key = 'VRHealth', type = 'spinner', text = 'Victory Rush/Imp Victory at Health %', default = '80', desc = 'cast Victory Rush/Imp Victory at', min = 0, max = 100, step = 1 },
            { key = 'healthstone', type = 'checkspin', default = '20', text = 'Healthstone', desc = 'use Healthstone at health %', min = 1, max = 100, step = 1 },
            { key = 'GiftHealth', type = 'spinner', text = 'Gift of the Naaru at Health %', default = '20', desc = 'cast Gift of the Naaru at', min = 0, max = 100, step = 1 },
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
    dark_addon.interface.buttons.add_toggle({
        name = 'useracials',
        label = 'Use Racials',
        font = 'dark_addon_icon',
        on = {
            label = dark_addon.interface.icon('toggle-on'),
            color = dark_addon.interface.color.cyan,
            color2 = dark_addon.interface.color.dark_cyan
        },
        off = {
            label = dark_addon.interface.icon('toggle-off'),
            color = dark_addon.interface.color.grey,
            color2 = dark_addon.interface.color.dark_grey
        }
    })

end

-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register({
    spec = dark_addon.rotation.classes.warrior.protection,
    name = 'RexProtWar',
    label = 'Rex Protection Warrior',
    combat = combat,
    resting = resting,
    interface = interface
})
