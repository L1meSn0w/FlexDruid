local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITmonk

-- To Do

-- Spells

SB.FistsofFury = 113656
SB.ChiWave = 115098
SB.FistoftheWhiteTiger = 261947
SB.GoodKarma = 280195
SB.DampenHarm = 122278
SB.RushingJadeWind = 116847
SB.WhirlingDragonPunch = 152175
SB.InvokeXuen = 123904
SB.StormEarthandFire = 138130
SB.TigerPalm = 100780
SB.BlackoutKick = 100784
SB.TouchofDeath = 115080
SB.SpinningCraneKick = 107270
SB.RisingSunKick = 107428
SB.Provoke = 115546
SB.Resuscitate = 115178
SB.ZenPilgrimage = 126892
SB.Disable = 116095
SB.CracklingJadeLightning = 117952
SB.Detox = 218164
SB.Afterlife = 116092
SB.SpearHandStrike = 116705
SB.Windwalking = 157411
SB.FlyingSerpentKick = 101545
SB.TouchofKarma = 122470
SB.ComboBreaker = 137384
SB.Vivify = 116670
SB.ChiBurst = 123986
SB.LegSweep = 119381
SB.Paralysis = 115078


local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

    -- Reading from settings
    local intpercentlow = dark_addon.settings.fetch('wwmonk_settings_intpercentlow',50)
    local intpercenthigh = dark_addon.settings.fetch('wwmonk_settings_intpercenthigh',65)
    local VHealth = dark_addon.settings.fetch('wwmonk_settings_VHealth',30)
    local DHHealth = dark_addon.settings.fetch('wwmonk_settings_DHHealth',30)
    local race = UnitRace('player')
	local dispellable_unit = player.removable('disease', 'poison')

    -- Targets in range check
    local enemyCount = enemies.around(8)
    if enemyCount == 0 then enemyCount = 1 end
    dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

    -- Auto Attack
     if target.enemy and target.alive and target.distance < 8 then
         auto_attack()
     end

    -- Interrupts
        -- Define random number for interrupt
        local intpercent = math.random(intpercentlow,intpercenthigh)

        -- Spear Hand Strike
        if toggle('interrupts', false) and castable(SB.SpearHandStrike, 'target') and -spell(SB.SpearHandStrike) == 0 and target.interrupt(intpercent, false) and target.distance < 8 then
         print('Spear Hand Strike @ ' .. intpercent)
          return cast(SB.SpearHandStrike, 'target')
        end

        --Leg Sweep
        if toggle('interrupts', false) and castable(SB.LegSweep, 'target') and -spell(SB.LegSweep) == 0 and -spell(SB.SpearHandStrike) > 0 and target.interrupt(intpercent, false) 
        and target.distance < 5 then
            print('Leg Sweep @ ' .. intpercent)
             return cast(SB.LegSweep, 'target')
           end

        --Paralysis
        if toggle('interrupts', false) and castable(SB.Paralysis, 'target') and -spell(SB.Paralysis) == 0 and -spell(SB.LegSweep) > 0 and -spell(SB.SpearHandStrike) > 0 
        and target.interrupt(intpercent, false) and target.distance < 20 then
            print('Paralysis @ ' .. intpercent)
             return cast(SB.Paralysis, 'target')
           end        

    -- Cooldowns
    if toggle('cooldowns', false) then
    -- TouchofDeath on cooldown or for burst DPS
        if castable(SB.TouchofDeath) and -spell(SB.TouchofDeath) == 0 and target.time_to_die > 8 then
            return cast(SB.TouchofDeath)
        end
    
	-- TouchofKarma on cooldown or for burst DPS
        if castable(SB.TouchofKarma) and -spell(SB.TouchofKarma) == 0 then
            return cast(SB.TouchofKarma)
        end

    --Use Storm, Earth, and Fire to keep it on cooldown
        if castable(SB.StormEarthandFire) and -spell(SB.StormEarthandFire) == 0 then
            return cast(SB.StormEarthandFire, 'target')
        end    

    end

    --Defensive and Utility Abilities
    --Desperate Prayer
    if castable(SB.DampenHarm) and -spell(SB.DampenHarm) == 0 and -player.health <= DHHealth then
        print('Dampen Harm @ ' .. DHHealth)
  		return cast(SB.DampenHarm)
  	end

    -- Healing
    if castable(SB.Vivify) and -spell(SB.Vivify) == 0 and -player.health <= VHealth then
        print('Vivify @ ' .. -player.health)
        return cast(SB.Vivify)
    end

    if castable(SB.Detox) and dispellable_unit and spell(SB.Detox).cooldown == 0 then
     return cast(SB.Detox, dispellable_unit)
    end

if enemyCount == 1 then    
    -- Use Fist of the White Tiger if under 3 Chi and about to cap Energy
    if castable(SB.FistoftheWhiteTiger) and -spell(SB.FistoftheWhiteTiger) == 0 and player.power.chi.actual < 3 and player.power.energy.actual >= 90 then
        return cast(SB.FistoftheWhiteTiger, 'target')
    end

    -- Use Tiger Palm if under 4 Chi and about to cap Energy
    if castable(SB.TigerPalm) and -spell(SB.TigerPalm) == 0 and player.power.chi.actual < 4 and player.power.energy.actual >= 90 then
        return cast(SB.TigerPalm, 'target')
    end

    -- Use Whirling Dragon Punch
    if castable(SB.WhirlingDragonPunch) and -spell(SB.WhirlingDragonPunch) == 0 then
        return cast(SB.WhirlingDragonPunch, 'target')
    end

    -- Use Rising Sun Kick
    if castable(SB.RisingSunKick) and -spell(SB.RisingSunKick) == 0 and player.power.chi.actual >= 2 then
        return cast(SB.RisingSunKick, 'target')
    end

    -- Use Fists of Fury
    if castable(SB.FistsofFury) and -spell(SB.FistsofFury) == 0 and player.power.chi.actual >= 3 then
        return cast(SB.FistsofFury, 'target')
    end

    -- Use Chi Burst if talented and under maximum Chi.
    if castable(SB.ChiBurst) and -spell(SB.ChiBurst) == 0 and player.power.chi.actual <= 3 then
        return cast(SB.ChiBurst, 'target')
    end

    -- Use Fist of the White Tiger if talented and under 3 Chi.
    if castable(SB.FistoftheWhiteTiger) and -spell(SB.FistoftheWhiteTiger) == 0 and player.power.chi.actual < 3 then
        return cast(SB.FistoftheWhiteTiger, 'target')
    end

    -- Use Blackout Kick
    -- Keep in mind that Tiger Palm has a chance to cause the next Blackout Kick not to cost any Chi.
    -- It is important to use Blackout Kick before you use Tiger Palm again, to ensure that the proc is not overwritten; 
    -- that said, any abilities with a cooldown should be used before Blackout Kick.
    if castable(SB.BlackoutKick) and -spell(SB.BlackoutKick) == 0 and not spell(SB.BlackoutKick).lastcast then
        return cast(SB.BlackoutKick, 'target')
    end

    -- Use Chi Wave if talented.

    -- Use Tiger Palm
    if castable(SB.TigerPalm) and -spell(SB.TigerPalm) == 0 then
        return cast(SB.TigerPalm, 'target')
    end

end

if enemyCount >= 2 then
    -- Keep Rushing Jade Wind up (if talented).
    -- Use Whirling Dragon Punch
    if castable(SB.WhirlingDragonPunch) and -spell(SB.WhirlingDragonPunch) == 0 then
        return cast(SB.WhirlingDragonPunch, 'target')
    end

    -- Use Fists of Fury
    if castable(SB.FistsofFury) and -spell(SB.FistsofFury) == 0 and player.power.chi.actual >= 3 then
        return cast(SB.FistsofFury, 'target')
    end

    -- Use Rising Sun Kick if Whirling Dragon Punch is coming off cooldown.
    if castable(SB.RisingSunKick) and -spell(SB.RisingSunKick) == 0 and player.power.chi.actual >= 2 then
        return cast(SB.RisingSunKick, 'target')
    end

    -- Use Chi Burst if talented and under max Chi.
    if castable(SB.ChiBurst) and -spell(SB.ChiBurst) == 0 and player.power.chi.actual <= 3 then
        return cast(SB.ChiBurst, 'target')
    end

    -- Use Spinning Crane Kick on 3 or more targets.
    if enemyCount >= 3 and castable(SB.SpinningCraneKick) and -spell(SB.SpinningCraneKick) == 0 then
        return cast(SB.SpinningCraneKick, 'target')
    end

    -- Use Rising Sun Kick
    if castable(SB.RisingSunKick) and -spell(SB.RisingSunKick) == 0 and player.power.chi.actual >= 2 then
        return cast(SB.RisingSunKick, 'target')
    end

    -- Use Blackout Kick
    if castable(SB.BlackoutKick) and -spell(SB.BlackoutKick) == 0 and not spell(SB.BlackoutKick).lastcast then
        return cast(SB.BlackoutKick, 'target')
    end

    -- Use Fist of the White Tiger
    if castable(SB.FistoftheWhiteTiger) and -spell(SB.FistoftheWhiteTiger) == 0 and player.power.chi.actual < 3 then
        return cast(SB.FistoftheWhiteTiger, 'target')
    end

    -- Use Chi Wave if talented.
    -- Use Tiger Palm
    if castable(SB.TigerPalm) and -spell(SB.TigerPalm) == 0 then
        return cast(SB.TigerPalm, 'target')
    end

end

end
end

local function resting()

  local enemyCount = enemies.around(8)
  dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

end

local function interface()

    local settings = {
        key = 'wwmonk_settings',
        title = 'WW Monk',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Disc Priest Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 1 3 1 1 2 1 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'text', text = 'Shift Modifier used for Heroic Leap' },
            { type = 'rule' },
            { type = 'text', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'text', text = 'Defensive Settings' },
            { key = 'VHealth', type = 'spinner', text = 'Vivify at Health %', default = '30', desc = 'cast Vivify at', min = 0, max = 100, step = 1 },
            { key = 'DHHealth', type = 'spinner', text = 'Dampen Harm at Health %', default = '30', desc = 'cast Dampen Harm at', min = 0, max = 100, step = 1 },
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
    spec = dark_addon.rotation.classes.monk.windwalker,
    name = 'RexWWMonk',
    label = 'Rex WW Monk',
    combat = combat,
    resting = resting,
    interface = interface
})
