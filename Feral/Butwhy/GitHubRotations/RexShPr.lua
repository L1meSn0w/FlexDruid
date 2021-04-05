local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITpriest

-- To Do
-- Add a checkbox for PowerWord Shield

-- Spells

SB.FortressoftheMind = 193195
SB.BodyandSoul = 64129
SB.DarkVoid = 263346
SB.PsychicHorror = 64044
SB.ShadowCrash = 205385
SB.Mindbender = 200174
SB.DarkAscension = 280711
SB.Smite = 585
SB.VoidEruption = 228260
SB.Voidform = 194249
SB.Shadowfiend = 34433
SB.VoidBolt = 205448
SB.VampiricTouch = 34914
SB.ShadowWordPain = 589
SB.ShadowWordDeath = 32379
SB.ShadowWordVoid = 205351
SB.MindBlast = 8092
SB.MindFlay = 15407
SB.MindSear = 48045
SB.FlashHeal = 2061
SB.PowerWordShield = 17
SB.Shadowform = 232698
SB.MindVision = 2096
SB.Resurrection = 2006
SB.PsychicScream = 8122
SB.PowerWordFortitude = 21562
SB.PurifyDisease = 213634
SB.ShadowMend = 186263
SB.VampiricEmbrace = 15286
SB.Levitate = 1706
SB.ShackleUndead = 9484
SB.ShadowyApparitions = 78203
SB.FocusedWill = 45243
SB.MindControl = 605
SB.Fade = 586
SB.Dispersion = 47585
SB.Silence = 15487
SB.DispelMagic = 528
SB.Hallucinations = 280752
SB.MassDispel = 32375
SB.LeapofFaith = 73325
SB.MasteryMadness = 77486
SB.SurrenderToMadness = 9999
SB.VoidTorrent = 263165
SB.Bloodlust = 2825
SB.HarvestedThoughts = 99999
SB.WeakenedSoul = 6788

local function combat()
if target.alive and target.enemy and player.alive then --and not player.channeling()

-- Reading from settings
local intpercentlow = dark_addon.settings.fetch('shpr_settings_intpercentlow',50)
local intpercenthigh = dark_addon.settings.fetch('shpr_settings_intpercenthigh',65)
local DHealth = dark_addon.settings.fetch('shpr_settings_DHealth',30)
local SMHealth = dark_addon.settings.fetch('shpr_settings_SMHealth',50)
local swvopener = dark_addon.settings.fetch('shpr_settings_swvopener', true)
local race = UnitRace('player')
local dispellable_unit = player.removable('disease')

-- Azerite Traits Check
  local function hasazeritetrait(powerid)
  local count = 0
    for _, itemLocation in AzeriteUtil.EnumerateEquipedAzeriteEmpoweredItems() do
      if C_AzeriteEmpoweredItem.IsPowerSelected(itemLocation, powerid) then
            count = count + 1
      end
    end
    return count
  end

local searingdialoguetrait = hasazeritetrait(115)

-- Targets in range check
-- local enemiesatrange = enemies.count(function (unit)
--     return unit.alive and unit.combat and unit.distance >= target.distance - 5 and unit.distance <= target.distance + 5 and target.distance <= 40
-- end)
local enemiesinmelee = enemies.around(8)

local enemiesatrange = enemies.count(function (unit)
    -- this is example logic. you can write any logic for unit
    --return unit.alive and unit.combat and unit.distance >= target.distance - 8 and unit.distance <= target.distance + 8 and target.distance <= 40
    --return unit.alive and unit.combat and unit.distance >= pet.distance - 8 and unit.distance <= pet.distance + 8 and unit.distance <= 40
    --return unit.alive and unit.combat and unit.distance == pet.distance
    return unit.alive and unit.distance >= (target.distance - 5) and unit.distance <= (target.distance + 5) and target.distance <= 40
    --return unit.alive and unit.distance == pet.distance
    end)


if enemiesatrange == 0 then enemiesatrange = 1 end
if enemiesinmelee == 0 then enemiesinmelee = 1 end
dark_addon.interface.status_extra('TM#:' .. enemiesinmelee  .. ' TR#:' .. enemiesatrange .. ' D:' .. target.distance)

-- Auto Attack
if target.enemy and target.alive and target.distance < 30 then
    auto_attack()
end

-- Interrupts
-- Define random number for interrupt
local intpercent = math.random(intpercentlow,intpercenthigh)

-- Silence
if toggle('interrupts', false) and castable(SB.Silence, 'target') and -spell(SB.Silence) == 0 and target.interrupt(intpercent, false) and target.distance < 30 then
    print('Silence @ ' .. intpercent)
    return cast(SB.Silence, 'target')
end

-- Psychic Horror
if toggle('interrupts', false) and castable(SB.PsychicHorror, 'target') and -spell(SB.PsychicHorror) == 0 and -spell(SB.Silence) > 1 and target.interrupt(intpercent, false) 
and target.distance < 30 and not player.spell(SB.Silence).lastcast then
    print('Psychic Horror @ ' .. intpercent)
    return cast(SB.PsychicHorror, 'target')
end

--Defensive and Utility Abilities
--Dispersion
if castable(SB.Dispersion) and -spell(SB.Dispersion) == 0 and -player.health <= DHealth then
    print('Dispersion @ ' .. DHealth)
	return cast(SB.Dispersion, 'player')
end

-- Healing
if castable(SB.ShadowMend) and -spell(SB.ShadowMend) == 0 and -player.health <= SMHealth then
    print('ShadowMend @ ' .. SMHealth)
    return cast(SB.ShadowMend, 'player')
end

if castable(SB.PurifyDisease) and dispellable_unit and spell(SB.PurifyDisease).cooldown == 0 then
    return cast(SB.PurifyDisease, dispellable_unit)
end

--Cast Power Word Shield
-- if castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and player.buff(SB.PowerWordShield).down and player.debuff(SB.WeakenedSoul).down then
--     return cast(SB.PowerWordShield, 'player')
-- end

--Rotation
-- Use  Shadowfiend whenever available, preferably when you have as much Haste as possible.
if castable(SB.Shadowfiend) and -spell(SB.Shadowfiend) == 0 and not talent(6,2) and toggle('cooldowns', false) then
    return cast(SB.Shadowfiend, 'target')
end

-- Only use  Vampiric Touch to apply and maintain both DoTs, only refreshing them when they are about to fall off.
if talent(3,2) and castable(SB.VampiricTouch) and -spell(SB.VampiricTouch) == 0 and (target.debuff(SB.ShadowWordPain).down or target.debuff(SB.ShadowWordPain).remains <= 2) and not lastcast(SB.VampiricTouch) then
    return cast(SB.VampiricTouch, 'target')
end

--Maintain Focus Target
if focus.alive and focus.enemy then
    if toggle('auto_dot', false) and (focus.debuff(SB.ShadowWordPain).down or focus.debuff(SB.ShadowWordPain).remains <= 2) then
        return cast(SB.VampiricTouch, 'focus')
    end
end

-- Cast  Void Eruption whenever possible in order to enter  Voidform.
if castable(SB.VoidEruption) and -spell(SB.VoidEruption) == 0 and player.power.insanity.actual > 90 then
    return cast(SB.VoidEruption, 'target')
end

-- Cast  Void Bolt on cooldown when in Voidform.
if castable(SB.VoidBolt) and -spell(SB.VoidBolt) == 0 and player.buff(SB.Voidform).up then
    return cast(SB.VoidBolt, 'target')
end 

-- Cast  Mind Blast (or  Shadow Word: Void if you have taken this talent) on cooldown, inside or outside of Voidform. Note: you do not need to use both charges at the same time, just make sure to not stay at 2 charges if possible.
if castable(SB.ShadowWordVoid) and -spell(SB.ShadowWordVoid) == 0 and talent(1,3) then
    return cast(SB.ShadowWordVoid, 'target')
end

-- --Multi-Dot Function
-- if toggle('auto_dot', false) then
--     if autodot() then return end
-- end

-- Cast  Shadow Crash on cooldown.
--if castable(SB.ShadowCrash) and -spell(SB.ShadowCrash) == 0 and talent(5,3) then
--    return cast(SB.ShadowCrash, 'target')
--end

-- Cast  Void Torrent on cooldown.
--if castable(SB.VoidTorrent) and -spell(SB.VoidTorrent) == 0 and talent(6,3) then
--    return cast(SB.VoidTorrent, 'target')
--end

-- Cast  Mind Flay as a filler when all of the above spells can not be cast or do not have to be cast, interrupting it whenever a higher priority spell becomes available.
if castable(SB.MindFlay) and -spell(SB.MindFlay) == 0 and enemiesatrange == 1 then
    return cast(SB.MindFlay, 'target')
end

-- Use  Mind Sear to fill, or instead of  Mind Blast/ Shadow Word: Void at 4 or more targets.
if castable(SB.MindSear) and -spell(SB.MindSear) == 0 and enemiesatrange >= 3 then
    return cast(SB.MindSear, 'target')
end     

end
end

local function gcd()
    local autodotadds = dark_addon.settings.fetch('shpr_settings_autodot', 3)

	if player.combat then
        local dotVT = toggle('auto_dot', false)
        local printdebuffcount = toggle('print_debuff_count', false)
        local index = 0
        local notMain = true
        local mainTarget = UnitGUID("target")
        --local dotcount = 0
        local debuffcount = enemies.count(function(unit) 
            return unit.exists and unit.alive and unit.debuff(SB.ShadowWordPain).up
            end)
        if printdebuffcount == true then    
            print(debuffcount)
        end    

        TargetNearestEnemy()
        --macro('/targetenemy')

        while(notMain) do
            local VTDuration
            local unitsensecheck = enemies.match(function(unit) 
                return unit.exists and unit.alive and unit.in_range("Vampiric Touch") and 
                unit.distance >= (target.distance - 5) and unit.distance <= (target.distance + 5) 
                end)
            --print(unitsensecheck)

            for i = 1, 40 do
            dotname, a, b, c, d, dotduration = UnitDebuff("target", i, "PLAYER")
                if (dotname == "Shadow Word: Pain") then
                VTDuration = dotduration 
                --dotcount = dotcount + 1
                --print(dotcount)    
                end
            end

            if dotVT and (VTDuration == nil or VTDuration-5 < GetTime()) and target.alive and debuffcount < autodotadds then
                --cast(SB.VampiricTouch, 'target')
                CastSpellByName("Vampiric Touch")
            end

            TargetNearestEnemy()
            --macro('/targetenemy')
            --Check Stuff
            if (mainTarget == UnitGUID("target") or index == 30) then
                notMain = false
            end
            index = index + 1
        end
        --print("Done, back to main '" .. UnitName("target") .. "' " .. index);
	end
end


local function resting()

local autopwf = dark_addon.settings.fetch('shpr_settings_autopwf', true)    

--actions.precombat+=/shadowform,if=!buff.shadowform.up
if castable(SB.Shadowform) and -spell(SB.Shadowform) == 0 and player.buff(SB.Shadowform).down then
    return cast(SB.Shadowform, 'player')
end    

--Power Word Fortitude
if autopwf and castable(SB.PowerWordFortitude) and -spell(SB.PowerWordFortitude) == 0 and player.buff(SB.PowerWordFortitude).down then
    return cast(SB.PowerWordFortitude, 'player')
end

if target.alive and target.enemy and player.alive and not player.channeling() then   
    --Cast Shadow Word Void
    if castable(SB.ShadowWordVoid) and -spell(SB.ShadowWordVoid) == 0 and talent(1,3) and swvopener then
        return cast(SB.ShadowWordVoid, 'target')
    end
end

end

local function interface()

    local settings = {
        key = 'shpr_settings',
        title = 'Shadow Priest',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Shadow Priest Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 3 1 2 1 1 1 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'rule' },
            { type = 'header', text = 'General Settings' },
            { key = 'autopwf', type = 'checkbox', text = 'Auto Buff Power Word: Fortitude', desc = '', default = true },
            { key = 'swvopener', type = 'checkbox', text = 'Open Combat with Shadow Word: Void', desc = '', default = true },
            { key = 'autodotadds', type = 'spinner', text = 'Auto DOT Management', default = '3', desc = 'Max number of adds to maintain DOTs on', min = 1, max = 10, step = 1 },
            { type = 'rule' },
            { type = 'header', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'header', text = 'Defensive Settings' },
            { key = 'DHealth', type = 'spinner', text = 'Dispersion at Health %', default = '30', desc = 'cast Dispersion at', min = 0, max = 100, step = 1 },
            { key = 'SMHealth', type = 'spinner', text = 'Shadow Mend at Health %', default = '50', desc = 'cast Shadow Mend at', min = 0, max = 100, step = 1 },
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
		name = 'auto_dot',
		label = 'Maintain DOTs on Units in Range',
		on = {
		  label = 'DOTs',
		  color = dark_addon.interface.color.cyan,
		  color2 = dark_addon.interface.color.dark_cyan
		},
		off = {
		  label = 'DOTs',
		  color = dark_addon.interface.color.grey,
		  color2 = dark_addon.interface.color.dark_grey
		}
    })
    dark_addon.interface.buttons.add_toggle({
		name = 'print_debuff_count',
		label = 'Prints debuff count to chat log',
		on = {
		  label = 'Count',
		  color = dark_addon.interface.color.cyan,
		  color2 = dark_addon.interface.color.dark_cyan
		},
		off = {
		  label = 'Count',
		  color = dark_addon.interface.color.grey,
		  color2 = dark_addon.interface.color.dark_grey
		}
    })
    

end

-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register({
    spec = dark_addon.rotation.classes.priest.shadow,
    name = 'RexShPr',
    label = 'Rex Shadow Priest',
    combat = combat,
    resting = resting,
    interface = interface,
    gcd = gcd
})
