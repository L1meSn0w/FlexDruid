local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITmonk

-- To Do

-- Spells

SB.KegSmash = 121253
SB.BlackoutStrike = 205523
SB.BreathofFire = 115181
SB.RushingJadeWind = 116847
SB.TigerPalm = 100780
SB.SpearHandStrike = 116705
SB.IronskinBrew = 115308
SB.PurifyingBrew = 119582
SB.FortifyingBrew = 115203
SB.ZenMeditation = 115176
SB.Vivify = 116670
SB.Detox = 218164
SB.ExpelHarm = 115072
SB.ConcentratedFlame = 295373

local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

    -- Reading from settings
    local intpercentlow = dark_addon.settings.fetch('bmmonk_settings_intpercentlow',50)
    local intpercenthigh = dark_addon.settings.fetch('bmmonk_settings_intpercenthigh',65)
    local PurifyHealth = dark_addon.settings.fetch('bmmonk_settings_PurifyHealth',50)    
    --local VHealth = dark_addon.settings.fetch('bmmonk_settings_VHealth',30)
    local FBHealth = dark_addon.settings.fetch('bmmonk_settings_FBHealth',30)
    local EHHealth = dark_addon.settings.fetch('bmmonk_settings_EHHealth',25)
    local ZMHealth = dark_addon.settings.fetch('bmmonk_settings_ZMHealth',20)
    local usetrinkets = dark_addon.settings.fetch('bmmonk_settings_usetrinkets', true)
    local useessences = dark_addon.settings.fetch('bmmomk_settings_useessences', true)        
    local race = UnitRace('player')
    local dispellable_unit = player.removable('disease', 'poison')
    local orbcount = GetSpellCount(115072)
    local staggerpercent = (UnitStagger("player") / UnitHealthMax("player")*100)

    --print('Stagger Damage % = ' .. staggerpercent)
    --print('Orb Count = ' .. orbcount)

    -- Targets in range check
    local enemyCount = enemies.around(8)
    if enemyCount == 0 then enemyCount = 1 end
    dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

    --Mitigation
    --Ironskin Brew
    if castable(SB.IronskinBrew) and -spell(SB.IronskinBrew) == 0 and (player.buff(SB.IronskinBrew).down or player.buff(SB.IronskinBrew).remains < 2) then
        return cast(SB.IronskinBrew, 'player')
    end
    --Purifying Brew
    if castable(SB.PurifyingBrew) and -spell(SB.PurifyingBrew) == 0 and PurifyHealth <= staggerpercent then
        return cast(SB.PurifyingBrew, 'player')
    end

    --Defensive and Utility Abilities
    --Fortifying Brew
    if castable(SB.FortifyingBrew) and -spell(SB.FortifyingBrew) == 0 and -player.health <= FBHealth then
        print('Fortifying Brew @ ' .. FBHealth)
  		return cast(SB.FortifyingBrew)
    end

    --Zen Meditation
    if castable(SB.ZenMeditation) and -spell(SB.ZenMeditation) == 0 and -player.health <= ZMHealth then
        print('Zen Meditation @ ' .. ZMHealth)
  		return cast(SB.ZenMeditation)
  	end    

    --Healing
    --Expel Harm
    if castable(SB.ExpelHarm) and -spell(SB.ExpelHarm) == 0 and -player.health <= EHHealth and orbcount >= 3 then
        print('Expel Harm @ ' .. EHHealth)
        return cast(SB.ExpelHarm)
    end

    --Detox
    if castable(SB.Detox) and dispellable_unit and spell(SB.Detox).cooldown == 0 then
     return cast(SB.Detox, dispellable_unit)
    end
    
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

    --Rotation
    --Auto Attack
     if target.enemy and target.alive and target.distance < 8 then
         auto_attack()
     end
    --Single Target 1: Cast Blackout Strike on cooldown.
    if enemyCount == 1 and castable(SB.BlackoutStrike) and -spell(SB.BlackoutStrike) == 0 then
        return cast(SB.BlackoutStrike, 'target')
    end     
    --Cast Keg Smash on cooldown.
    if castable(SB.KegSmash) and -spell(SB.KegSmash) == 0 then
        return cast(SB.KegSmash, 'target')
    end
    --Cast Breath of Fire on cooldown, and when activated by the  Spitfire talent.
    if (enemyCount == 1 or enemyCount >= 4) and castable(SB.BreathofFire) and -spell(SB.BreathofFire) == 0 then
        return cast(SB.BreathofFire, 'target')
    end     
    --Targets 2 and 3: Cast Blackout Strike on cooldown.
    if enemyCount >= 2 and castable(SB.BlackoutStrike) and -spell(SB.BlackoutStrike) == 0 then
        return cast(SB.BlackoutStrike, 'target')
    end
    --Cast Breath of Fire on cooldown, and when activated by the  Spitfire talent.
    if (enemyCount == 2 or enemyCount == 3) and castable(SB.BreathofFire) and -spell(SB.BreathofFire) == 0 then
        return cast(SB.BreathofFire, 'target')
    end    
    --If talented, cast Rushing Jade Wind before it falls off.
    if castable(SB.RushingJadeWind) and -spell(SB.RushingJadeWind) == 0 and player.buff(SB.RushingJadeWind).remains < 2 then
        return cast(SB.RushingJadeWind, 'target')
    end     
    --Cast Tiger Palm if there is nothing else to do and you will still have enough Energy for your next Keg Smash.
    if enemyCount == 1 and castable(SB.TigerPalm) and -spell(SB.TigerPalm) == 0 and player.power.energy.actual >= 65 then
        return cast(SB.TigerPalm, 'target')
    end    
    --If talented, cast Chi Wave or Chi Burst on cooldown.
    
    --Essences
    if useessences and castable(SB.ConcentratedFlame) and -spell(SB.ConcentratedFlame) == 0 then
        return cast(SB.ConcentratedFlame, 'target')
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

    -- -- Cooldowns
    -- if toggle('cooldowns', false) then
    -- -- TouchofDeath on cooldown or for burst DPS
    --     if castable(SB.TouchofDeath) and -spell(SB.TouchofDeath) == 0 and target.time_to_die > 8 then
    --         return cast(SB.TouchofDeath)
    --     end
    
	-- -- TouchofKarma on cooldown or for burst DPS
    --     if castable(SB.TouchofKarma) and -spell(SB.TouchofKarma) == 0 then
    --         return cast(SB.TouchofKarma)
    --     end

    -- --Use Storm, Earth, and Fire to keep it on cooldown
    --     if castable(SB.StormEarthandFire) and -spell(SB.StormEarthandFire) == 0 then
    --         return cast(SB.StormEarthandFire, 'target')
    --     end    
    -- end

end
end

local function resting()

  local enemyCount = enemies.around(8)
  dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

end

local function interface()

    local settings = {
        key = 'bmmonk_settings',
        title = 'BM Monk',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Brewmaster Monk Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 1 2 1 2 1 2 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'rule' },
            { type = 'header', text = 'General Settings' },
            { key = 'useessences', type = 'checkbox', text = 'Auto Use Essences', desc = '', default = true },      
            { key = 'usetrinkets', type = 'checkbox', text = 'Auto Trinket', desc = '', default = true },          
            { type = 'rule' },
            { type = 'header', text = 'Defensive Settings' },
            { key = 'PurifyHealth', type = 'spinner', text = 'Purify at Stagger %', default = '50', desc = 'cast Purifying Brew at', min = 0, max = 100, step = 1 },
            { key = 'EHHealth', type = 'spinner', text = 'Expel Harm at Health %', default = '30', desc = 'uses 3 Orbs at', min = 0, max = 100, step = 1 }, 
            { key = 'FBHealth', type = 'spinner', text = 'Fortifying Brew at Health %', default = '20', desc = 'cast Fortifying Brew at', min = 0, max = 100, step = 1 },
            { key = 'ZMHealth', type = 'spinner', text = 'Zen Meditation at Health %', default = '10', desc = 'cast Zen Meditation at', min = 0, max = 100, step = 1 },
            { type = 'rule' },
            { type = 'header', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
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
    spec = dark_addon.rotation.classes.monk.brewmaster,
    name = 'RexBMMonk',
    label = 'Rex BM Monk',
    combat = combat,
    resting = resting,
    interface = interface
})
