local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITdemonhunter

-- To Do

-- Spells

SB.DemonsBite = 162243
SB.DemonBlades = 203555
SB.ChaosStrike = 162794
SB.VengefulRetreat = 198793
SB.FelRush = 195072
SB.FelBarrage = 258925
SB.DarkSlash = 258860
SB.EyeBeam = 198013
SB.Nemesis = 206491
SB.Metamorphosis = 191427
SB.Momentum = 208628
SB.BladeDance = 188499
SB.DeathSweep = 210152
SB.ImmolationAura = 258920
SB.Felblade = 232893
SB.Annihilation = 201427
SB.ThrowGlaive = 185123
SB.FirstBlood = 206416
SB.Demonic = 213410
SB.BlindFury = 203550
SB.ChaoticTransformation = 288754
SB.TrailofRuin = 258881
SB.DemonicAppetite = 206478
SB.InsatiableHunger = 258876
SB.CycleofHatred = 258887
SB.FelMastery = 192939
SB.Disrupt = 183752
SB.ConsumeMagic = 278326
SB.Netherwalk = 196555
SB.Blur = 198589
SB.Darkness = 196718
SB.ChaosNova = 179057

local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

-- Reading from settings
local intpercentlow = dark_addon.settings.fetch('havdh_settings_intpercentlow',50)
local intpercenthigh = dark_addon.settings.fetch('havdh_settings_intpercenthigh',65)
local NWHealth = dark_addon.settings.fetch('havdh_settings_NWHealth',60)
local BHealth = dark_addon.settings.fetch('havdh_settings_BHealth',60)
local DHealth = dark_addon.settings.fetch('havdh_settings_DHealth',60)
local GiftHealth = dark_addon.settings.fetch('havdh_settings_GiftHealth',20)
local Hstonecheck = dark_addon.settings.fetch('havdh_settings_healthstone.check',true)
local Hstonepercent = dark_addon.settings.fetch('havdh_settings_healthstone.spin',20)
local usefelrush = dark_addon.settings.fetch('havdh_settings_usefelrush', true)

-- Targets in range function
local enemyCount = enemies.around(8)
if enemyCount == 0 then enemyCount = 1 end
dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

-- Define random number for interrupt
local intpercent = math.random(intpercentlow,intpercenthigh)

if toggle('interrupts', false) and castable(SB.Disrupt, 'target') and -spell(SB.Disrupt) == 0 and target.interrupt(intpercent, false) then
    print('Disrupt @' .. intpercent)
    return cast(SB.Disrupt, 'target')
end
if toggle('interrupts', false) and castable(SB.ChaosNova, 'target') and -spell(SB.ChaosNova) == 0 and -spell(SB.Disrupt) > 1 and target.interrupt(intpercent, false) then
    print('Chaos Nova @' .. intpercent)
    return cast(SB.ChaosNova, 'target')
end

-- Healing
-- Healthstone
if Hstonecheck == true and -player.health < Hstonepercent and GetItemCount(5512) >= 1 and GetItemCooldown(5512) == 0 then
    macro('/use Healthstone')
end

if castable(SB.Blur) and -spell(SB.Blur) == 0 and -player.health <= BHealth then
    print('Blur @' .. BHealth)
    return cast(SB.Blur)
end    

--Rotation
--Auto Attack
if target.enemy and target.alive and target.distance < 8 then
    auto_attack()
end
--Throw Glaive
if target.enemy and target.alive and castable(SB.ThrowGlaive) and -spell(SB.ThrowGlaive) == 0 and (target.distance >= 8 and target.distance <= 30) then
    return cast(SB.ThrowGlaive, 'target')
end

--Fel Rush
if usefelrush and castable(SB.FelRush) and -spell(SB.FelRush) == 0 and target.distance > 15 and spell(SB.FelRush).charges == 2 then
    return cast(SB.FelRush, 'target')
end

if enemyCount == 1 then
    --Single Target
    -- Cast  Metamorphosis if available and not active.
    if toggle('cooldowns', false) and castable(SB.Metamorphosis) and -spell(SB.Metamorphosis) == 0 and not player.buff(SB.Metamorphosis).up then
        return cast(SB.Metamorphosis, 'player')
    end

    -- Cast  Immolation Aura.
    if castable(SB.ImmolationAura) and -spell(SB.ImmolationAura) == 0 then
        return cast(SB.ImmolationAura, 'player')
    end

    -- Cast  Blade Dance /  Death Sweep.
    if castable(SB.BladeDance) and -spell(SB.BladeDance) == 0 and target.distance <= 8 then
        return cast(SB.BladeDance, 'target')
    end
    if castable(SB.DeathSweep) and -spell(SB.DeathSweep) == 0 and target.distance <= 8 then
        return cast(SB.DeathSweep, 'target')
    end

    -- Cast  Eye Beam.
    if modifier.shift and castable(SB.EyeBeam) and -spell(SB.EyeBeam) == 0 then
        return cast(SB.EyeBeam, 'target')
    end

    -- Cast  Chaos Strike /  Annihilation.
    if castable(SB.ChaosStrike) and -spell(SB.ChaosStrike) == 0 then
        return cast(SB.ChaosStrike, 'target')
    end
    if castable(SB.Annihilation) and -spell(SB.Annihilation) == 0 then
        return cast(SB.Annihilation, 'target')
    end

    -- Cast  Demon's Bite to generate Fury.
    if castable(SB.DemonsBite) and -spell(SB.DemonsBite) == 0 then
        return cast(SB.DemonsBite, 'target')
    end
end    

if enemyCount >= 2 then
    --Multiple Targets
    -- Cast  Eye Beam on as many targets as possible.
    if modifier.shift and castable(SB.EyeBeam) and -spell(SB.EyeBeam) == 0 then
        return cast(SB.EyeBeam, 'target')
    end

    -- Cast  Metamorphosis if available and not active.
    if toggle('cooldowns', false) and castable(SB.Metamorphosis) and -spell(SB.Metamorphosis) == 0 and not player.buff(SB.Metamorphosis).up then
        return cast(SB.Metamorphosis, 'player')
    end

    if enemyCount >= 3 then
        -- Cast  Blade Dance /  Death Sweep at 3 or above targets.
        if castable(SB.BladeDance) and -spell(SB.BladeDance) == 0 then
            return cast(SB.BladeDance, 'target')
        end
        if castable(SB.DeathSweep) and -spell(SB.DeathSweep) == 0 then
            return cast(SB.DeathSweep, 'target')
        end
    end    

    -- Cast  Immolation Aura.
    if castable(SB.ImmolationAura) and -spell(SB.ImmolationAura) == 0 then
        return cast(SB.ImmolationAura, 'player')
    end

    -- Cast  Blade Dance /  Death Sweep.
    if castable(SB.BladeDance) and -spell(SB.BladeDance) == 0 and target.distance <= 8 then
        return cast(SB.BladeDance, 'target')
    end
    if castable(SB.DeathSweep) and -spell(SB.DeathSweep) == 0 and target.distance <= 8 then
        return cast(SB.DeathSweep, 'target')
    end

    -- Cast  Chaos Strike /  Annihilation.
    if castable(SB.ChaosStrike) and -spell(SB.ChaosStrike) == 0 then
        return cast(SB.ChaosStrike, 'target')
    end
    if castable(SB.Annihilation) and -spell(SB.Annihilation) == 0 then
        return cast(SB.Annihilation, 'target')
    end

    -- Cast  Demon's Bite to generate Fury.
    if castable(SB.DemonsBite) and -spell(SB.DemonsBite) == 0 then
        return cast(SB.DemonsBite, 'target')
    end
end    

end
end

local function resting()

  local enemyCount = enemies.around(8)
  dark_addon.interface.status_extra('T#:' .. enemyCount .. ' D:' .. target.distance)

    --Auto Attack
    if target.enemy and target.alive and target.distance < 8 then
        auto_attack()
    end
    --Throw Glaive
    if target.enemy and target.alive and castable(SB.ThrowGlaive) and -spell(SB.ThrowGlaive) == 0 and (target.distance >= 8 and target.distance <= 30) then
        return cast(SB.ThrowGlaive, 'target')
    end

end

local function interface()

    local settings = {
        key = 'havdh_settings',
        title = 'Havoc Demon Hunter',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Havoc Demon Hunter Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 1 3 1 1 2 1 1' },
            { type = 'text', text = 'If you want AOE DPS then please remember to turn on Multitarget on the interface' },
            { type = 'text', text = 'Metamorphosis is controlled by the Cooldowns toggle on the interface' },
            { type = 'rule' },
            { type = 'header', text = 'General Settings' },
            { key = 'usefelrush', type = 'checkbox', text = 'Auto Use Fel Rush', desc = '', default = true },
            { type = 'rule' },
            { type = 'header', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'header', text = 'Defensive Settings' },
            --{ key = 'NWHealth', type = 'spinner', text = 'Netherwalker at Health %', default = '60', desc = 'cast Netherwalker at', min = 0, max = 100, step = 1 },
            { key = 'BHealth', type = 'spinner', text = 'Blur at Health %', default = '60', desc = 'cast Blur at', min = 0, max = 100, step = 1 },
            { key = 'DHealth', type = 'spinner', text = 'Darkness at Health %', default = '60', desc = 'cast Darkness at', min = 0, max = 100, step = 1 },
            --{ key = 'healthstone', type = 'checkspin', default = '20', text = 'Healthstone', desc = 'use Healthstone at health %', min = 1, max = 100, step = 1 },
            --{ key = 'GiftHealth', type = 'spinner', text = 'Gift of the Naaru at Health %', default = '20', desc = 'cast Gift of the Naaru at', min = 0, max = 100, step = 1 },
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
    spec = dark_addon.rotation.classes.demonhunter.havoc,
    name = 'RexHavDH',
    label = 'Rex Havoc Demon Hunter',
    combat = combat,
    resting = resting,
    interface = interface
})
