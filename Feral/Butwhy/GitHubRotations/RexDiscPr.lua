local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITpriest

-- To Do

-- Spells

SB.Adaptation = 214027
SB.Atonement = 81749
SB.Castigation = 193134
SB.DesperatePrayer = 19236
SB.DispelMagic = 528
SB.Dispersion = 47585
SB.DivineStar = 110744
SB.DriventoMadness = 199259
SB.Fade = 586
SB.FlashHeal = 2061
SB.FocusedWill = 45243
SB.GladiatorsMedallion = 208683
SB.Hallucinations = 280752
SB.Halo = 120517
SB.HolyNova = 132157
SB.LeapofFaith = 73325
SB.Lenience = 238063
SB.Levitate = 1706
SB.MassDispel = 32375
SB.MasteryMadness = 77486
SB.MindBlast = 8092
SB.MindControl = 605
SB.MindFlay = 15407
SB.MindSear = 48045
SB.MindVision = 2096
SB.Penance = 47540
SB.PoweroftheDarkSide = 198068
SB.PowerWordFortitude = 21562
SB.PowerWordShield = 17
SB.PowerWordSolace = 129250
SB.PsychicLink = 199484
SB.PsychicScream = 8122
SB.PsychicVoice = 196704
SB.Psyfiend = 211522
SB.Purify = 527
SB.PurifyDisease = 213634
SB.Relentless = 196029
SB.Resurrection = 2006
SB.Schism = 214621
SB.ShackleUndead = 9484
SB.Shadowfiend = 34433
SB.Shadowform = 232698
SB.ShadowMend = 186263
SB.ShadowWordPain = 589
SB.ShadowyApparitions = 78203
SB.Silence = 15487
SB.SinsoftheMany = 280391
SB.Smite = 585
SB.VampiricEmbrace = 15286
SB.VampiricTouch = 34914
SB.VoidBolt = 228266
SB.VoidEruption = 228260
SB.Voidform = 228264
SB.VoidOrigins = 228630
SB.WeakenedSoul = 6788


local function combat()
if target.alive and target.enemy and player.alive and not player.channeling() then

    -- Reading from settings
    local intpercentlow = dark_addon.settings.fetch('discpr_settings_intpercentlow',50)
    local intpercenthigh = dark_addon.settings.fetch('discpr_settings_intpercenthigh',65)
	local DPHealth = dark_addon.settings.fetch('discpr_settings_DPHealth',30)
    local race = UnitRace('player')
	local dispellable_unit = player.removable('disease', 'magic')

-- Targets in range check
local enemiesatrange = enemies.count(function (unit)
    return unit.alive and unit.combat and unit.distance == target.distance
end)
local enemiesinmelee = enemies.count(function (unit)
    return unit.alive and unit.combat and unit.distance <= 8
end)
if enemiesatrange == 0 then enemiesatrange = 1 end
if enemiesinmelee == 0 then enemiesinmelee = 1 end
dark_addon.interface.status_extra('TM#:' .. enemiesinmelee  .. '  TR#:' .. enemiesatrange .. '  D:' .. target.distance)

    -- Auto Attack
     if target.enemy and target.alive and target.distance < 8 then
         auto_attack()
     end

    -- Interrupts
        -- Define random number for interrupt
        local intpercent = math.random(intpercentlow,intpercenthigh)

        -- Pummel
        --if toggle('interrupts', false) and castable(SB.Rebuke, 'target') and -spell(SB.Rebuke) == 0 and target.interrupt(intpercent, false) and target.distance < 8 then
        -- print('Rebuke @ ' .. intpercent)
        --  return cast(SB.Rebuke, 'target')
        --end

    -- Cooldowns

    --Defensive and Utility Abilities
    --Desperate Prayer
    if castable(SB.DesperatePrayer) and -spell(SB.DesperatePrayer) == 0 and -player.health <= DPHealth then
        print('DesperatePrayer @ ' .. DPHealth)
  		return cast(SB.DesperatePrayer, 'player')
  	end

    -- Healing
    if UnitLevel("player") < 28 and castable(SB.FlashHeal) and -spell(SB.FlashHeal) == 0 and -player.health <= 75 then
        print('FlashHeal @ ' .. -player.health)
        return cast(SB.FlashHeal, 'player')
    end

    if UnitLevel("player") >= 28 and castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and -player.health <= 75 then
        print('ShadowMend @ ' .. -player.health)
        return cast(SB.ShadowMend, 'player')
    end

    if castable(SB.Purify) and dispellable_unit and spell(SB.Purify).cooldown == 0 then
     return cast(SB.Purify, dispellable_unit)
    end


--Cast Power Word Shield
        if castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and player.buff(SB.PowerWordShield).down and player.debuff(SB.WeakenedSoul).down then
            return cast(SB.PowerWordShield, 'player')
        end

--Cast Shadow Word Pain.
        if castable(SB.ShadowWordPain) and -spell(SB.ShadowWordPain) == 0 and target.debuff(SB.ShadowWordPain).down then
            return cast(SB.ShadowWordPain, 'target')
        end

--Halo
        -- if castable(SB.Halo) and -spell(SB.Halo) == 0 then
        --     return cast(SB.Halo, 'target')
        -- end 

--At 4 or more targets cast Holy Nova
        if castable(SB.HolyNova) and -spell(SB.HolyNova) == 0 and (enemiesinmelee > 4 or enemiesatrange > 4) then
            return cast(SB.HolyNova, 'target')
        end 

--Schism
        if castable(SB.Schism) and -spell(SB.Schism) == 0 then
            return cast(SB.Schism, 'target')
        end 

--Power Word Solace
        if castable(SB.PowerWordSolace) and -spell(SB.PowerWordSolace) == 0 then
            return cast(SB.PowerWordSolace, 'target')
        end 

--Penance
        if castable(SB.Penance) and -spell(SB.Penance) == 0 then
            return cast(SB.Penance, 'target')
        end

--Shadowfiend
    if toggle('cooldowns', false) then
    -- Shadow Fiend on cooldown or for burst DPS
        if castable(SB.Shadowfiend) and -spell(SB.Shadowfiend) == 0 then
            return cast(SB.Shadowfiend)
        end
    end        

--Smite as filler
        if castable(SB.Smite) and -spell(SB.Smite) == 0 then
            return cast(SB.Smite, 'target')
        end

end
end

local function resting()

--Power Word Fortitude
        if castable(SB.PowerWordFortitude) and -spell(SB.PowerWordFortitude) == 0 and player.buff(SB.PowerWordFortitude).down then
            return cast(SB.PowerWordFortitude, 'player')
        end

if target.alive and target.enemy and player.alive and not player.channeling() then
--Cast Shadow Word Pain.
        if castable(SB.ShadowWordPain) and -spell(SB.ShadowWordPain) == 0 and target.debuff(SB.ShadowWordPain).down then
            return cast(SB.ShadowWordPain)
        end
end

end

local function interface()

    local settings = {
        key = 'discpr_settings',
        title = 'Disc Priest',
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
            { key = 'DPHealth', type = 'spinner', text = 'Desperate Prayer at Health %', default = '30', desc = 'cast Desperate Prayer at', min = 0, max = 100, step = 1 },
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
    spec = dark_addon.rotation.classes.priest.discipline,
    name = 'RexDiscPr',
    label = 'Rex Disc Priest',
    combat = combat,
    resting = resting,
    interface = interface
})
