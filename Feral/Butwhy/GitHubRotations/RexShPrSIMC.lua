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


local function combat()
if target.alive and target.enemy and player.alive then --and not player.channeling()

-- Reading from settings
local intpercentlow = dark_addon.settings.fetch('shpr_settings_intpercentlow',50)
local intpercenthigh = dark_addon.settings.fetch('shpr_settings_intpercenthigh',65)
local DHealth = dark_addon.settings.fetch('shpr_settings_DHealth',30)
local SMHealth = dark_addon.settings.fetch('shpr_settings_SMHealth',50)
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
local enemiesatrange = enemies.count(function (unit)
    return unit.alive and unit.combat and unit.distance == target.distance
end)
local enemiesinmelee = enemies.count(function (unit)
    return unit.alive and unit.combat and unit.distance <= 8
end)
if enemiesatrange == 0 then enemiesatrange = 1 end
if enemiesinmelee == 0 then enemiesinmelee = 1 end
dark_addon.interface.status_extra('TM#:' .. enemiesinmelee  .. 'TR#:' .. enemiesatrange .. 'D:' .. target.distance)

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
if castable(SB.PowerWordShield) and -spell(SB.PowerWordShield) == 0 and player.buff(SB.PowerWordShield).down then
    return cast(SB.PowerWordShield, 'player')
end

--Rotation

--actions.precombat+=/variable,name=mind_blast_targets,op=set,value=floor((4.5+azerite.whispers_of_the_damned.rank)%(1+0.27*azerite.searing_dialogue.rank))
local mind_blast_targets = 0

--actions.precombat+=/variable,name=swp_trait_ranks_check,op=set,value=(1-0.07*azerite.death_throes.rank+0.2*azerite.thought_harvester.rank)*(1-0.09*azerite.thought_harvester.rank*azerite.searing_dialogue.rank)
local swp_trait_ranks_check = 0

--actions.precombat+=/variable,name=vt_trait_ranks_check,op=set,value=(1-0.04*azerite.thought_harvester.rank-0.05*azerite.spiteful_apparitions.rank)
local vt_trait_ranks_check = 0

--actions.precombat+=/variable,name=vt_mis_trait_ranks_check,op=set,value=(1-0.07*azerite.death_throes.rank-0.03*azerite.thought_harvester.rank-0.055*azerite.spiteful_apparitions.rank)*(1-0.027*azerite.thought_harvester.rank*azerite.searing_dialogue.rank)
local vt_mis_trait_ranks_check = 0

--actions.precombat+=/variable,name=vt_mis_sd_check,op=set,value=1-0.014*azerite.searing_dialogue.rank
local vt_mis_sd_check = 0

--# Executed every time the actor is available.
--actions=use_item,slot=trinket2
--actions+=/potion,if=buff.bloodlust.react|target.time_to_die<=80|target.health.pct<35
--actions+=/variable,name=dots_up,op=set,value=dot.shadow_word_pain.ticking&dot.vampiric_touch.ticking
local dots_up = target.debuff(SB.ShadowWordPain).up and target.debuff(SB.VampiricTouch).up

--actions+=/berserking
--actions+=/run_action_list,name=cleave,if=active_enemies>1
--actions+=/run_action_list,name=single,if=active_enemies=1

if (enemiesinmelee > 1 or enemiesatrange > 1 or toggle('multitarget')) then

    --actions.cleave=void_eruption
    --actions.cleave+=/dark_ascension,if=buff.voidform.down
    --actions.cleave+=/vampiric_touch,if=!ticking&azerite.thought_harvester.rank>=1
    --actions.cleave+=/mind_sear,if=buff.harvested_thoughts.up
    --actions.cleave+=/void_bolt
    --actions.cleave+=/shadow_word_death,target_if=target.time_to_die<3|buff.voidform.down
    --actions.cleave+=/surrender_to_madness,if=buff.voidform.stack>10+(10*buff.bloodlust.up)
    --actions.cleave+=/dark_void,if=raid_event.adds.in>10&(dot.shadow_word_pain.refreshable|target.time_to_die>30)
    --actions.cleave+=/mindbender
    if toggle('cooldowns', false) then
        if castable(SB.Mindbender) and -spell(SB.Mindbender) == 0 then
            return cast(SB.Mindbender, 'target')
        end
    end


    --actions.cleave+=/mind_blast,target_if=spell_targets.mind_sear<variable.mind_blast_targets
    --actions.cleave+=/shadow_crash,if=(raid_event.adds.in>5&raid_event.adds.duration<2)|raid_event.adds.duration>2
    --actions.cleave+=/shadow_word_pain,target_if=refreshable&target.time_to_die>((-1.2+3.3*spell_targets.mind_sear)*variable.swp_trait_ranks_check*(1-0.012*azerite.searing_dialogue.rank*spell_targets.mind_sear)),if=!talent.misery.enabled
    --actions.cleave+=/vampiric_touch,target_if=refreshable,if=target.time_to_die>((1+3.3*spell_targets.mind_sear)*variable.vt_trait_ranks_check*(1+0.10*azerite.searing_dialogue.rank*spell_targets.mind_sear))
    --actions.cleave+=/vampiric_touch,target_if=dot.shadow_word_pain.refreshable,if=(talent.misery.enabled&target.time_to_die>((1.0+2.0*spell_targets.mind_sear)*variable.vt_mis_trait_ranks_check*(variable.vt_mis_sd_check*spell_targets.mind_sear)))
    --actions.cleave+=/void_torrent,if=buff.voidform.up
    --actions.cleave+=/mind_sear,target_if=spell_targets.mind_sear>1,chain=1,interrupt_immediate=1,interrupt_if=ticks>=2
    --actions.cleave+=/mind_flay,chain=1,interrupt_immediate=1,interrupt_if=ticks>=2&(cooldown.void_bolt.up|cooldown.mind_blast.up)
    --actions.cleave+=/shadow_word_pain

end

if (enemiesinmelee == 1 or enemiesatrange == 1 or not toggle('multitarget')) then

    --actions.single=void_eruption
    if castable(SB.VoidEruption) and -spell(SB.VoidEruption) == 0 and player.power.insanity.actual > 90 then
        return cast(SB.VoidEruption, 'target')
    end
    --actions.single+=/dark_ascension,if=buff.voidform.down
    if castable(SB.DarkAscension) and -spell(SB.DarkAscension) == 0 and player.buff(SB.Voidform).down and talent(7,2) then
        return cast(SB.DarkAscension, 'target')
    end

    --actions.single+=/void_bolt
    if castable(SB.VoidBolt) and -spell(SB.VoidBolt) == 0 and player.buff(SB.Voidform).up then
        return cast(SB.VoidBolt, 'target')
    end

    --actions.single+=/mind_sear,if=buff.harvested_thoughts.up&cooldown.void_bolt.remains>=1.5&azerite.searing_dialogue.rank>=1
    if castable(SB.MindSear) and -spell(SB.MindSear) == 0 and player.buff(SB.HarvestedThoughts).up and -spell(SB.VoidBolt) >= 1.5 and searingdialoguetrait >= 1 then
        return cast(SB.MindSear, 'target')
    end

    --actions.single+=/shadow_word_death,if=target.time_to_die<3|cooldown.shadow_word_death.charges=2|(cooldown.shadow_word_death.charges=1&cooldown.shadow_word_death.remains<gcd.max)
    if castable(SB.ShadowWordDeath) and -spell(SB.ShadowWordDeath) == 0 and (target.time_to_die < 3 or spell(SB.ShadowWordDeath).charges == 2) and talent(5,2) then
        return cast(SB.ShadowWordPain, 'target')
    end

    --actions.single+=/surrender_to_madness,if=buff.voidform.stack>10+(10*buff.bloodlust.up)
    if castable(SB.SurrenderToMadness) and -spell(SB.SurrenderToMadness) == 0 and (player.buff(SB.Voidform).count > 10 or (player.buff(SB.Voidform).count > 20 and player.buff(SB.Bloodlust).up))
    and talent(7,3) then
        return cast(SB.SurrenderToMadness, 'target')
    end

    --actions.single+=/dark_void,if=raid_event.adds.in>10
    if castable(SB.DarkVoid) and -spell(SB.DarkVoid) == 0 and talent(3,3) then
        return cast(SB.DarkVoid, 'target')
    end

    --actions.single+=/mindbender,if=talent.mindbender.enabled|(buff.voidform.stack>18|target.time_to_die<15)
    if toggle('cooldowns', false) then
        if castable(SB.Mindbender) and -spell(SB.Mindbender) == 0 and talent(6,2) then
            return cast(SB.Mindbender, 'target')
        end
    end

    --actions.single+=/shadowfiend
    if toggle('cooldowns', false) then
        if castable(SB.Shadowfiend) and -spell(SB.Shadowfiend) == 0 and not talent(6,2) then
            return cast(SB.Shadowfiend, 'target')
        end
    end    

    --actions.single+=/shadow_word_death,if=!buff.voidform.up|(cooldown.shadow_word_death.charges=2&buff.voidform.stack<15)
    if castable(SB.ShadowWordDeath) and -spell(SB.ShadowWordDeath) == 0 and (player.buff(SB.Voidform).down or (spell(SB.ShadowWordDeath).charges == 2 and player.buff(SB.Voidform).count < 15))
    and talent(5,2) then
        return cast(SB.ShadowWordDeath, 'target')
    end

    --actions.single+=/shadow_crash,if=raid_event.adds.in>5&raid_event.adds.duration<20
    if castable(SB.ShadowCrash) and -spell(SB.ShadowCrash) == 0 and talent(5,3) then
        return cast(SB.ShadowCrash, 'target')
    end

    --actions.single+=/mind_blast
    if castable(SB.MindBlast) and -spell(SB.MindBlast) == 0 and dots_up and not talent(1,3) then
        return cast(SB.MindBlast, 'target')
    end

    --actions.single+=/shadow word void
    if castable(SB.ShadowWordVoid) and -spell(SB.ShadowWordVoid) == 0 and dots_up and talent(1,3) then
        return cast(SB.ShadowWordVoid, 'target')
    end    

    --actions.single+=/void_torrent,if=dot.shadow_word_pain.remains>4&dot.vampiric_touch.remains>4&buff.voidform.up
    if castable(SB.VoidTorrent) and -spell(SB.VoidTorrent) == 0 and target.debuff(SB.ShadowWordPain).remains > 4 and target.debuff(SB.VampiricTouch).remains > 4 
    and player.buff(SB.Voidform).up and talent(6,3) then
        return cast(SB.VoidTorrent, 'target')
    end

    --actions.single+=/shadow_word_pain,if=refreshable&target.time_to_die>4&!talent.misery.enabled&!talent.dark_void.enabled
    if castable(SB.ShadowWordPain) and -spell(SB.ShadowWordPain) == 0 and target.debuff(SB.ShadowWordPain).down and target.time_to_die > 4 
    and not talent(3,2) and not talent(3,3) then
        return cast(SB.ShadowWordPain, 'target')
    end

    --actions.single+=/vampiric_touch,if=refreshable&target.time_to_die>6|(talent.misery.enabled&dot.shadow_word_pain.refreshable)
    if castable(SB.VampiricTouch) and -spell(SB.VampiricTouch) == 0 and target.debuff(SB.VampiricTouch).down and target.time_to_die > 6 or (talent(3,2) and target.debuff(SB.ShadowWordPain).down) then
        return cast(SB.VampiricTouch, 'target')
    end

    --actions.single+=/mind_flay,chain=1,interrupt_immediate=1,interrupt_if=ticks>=2&(cooldown.void_bolt.up|cooldown.mind_blast.up)
    if player.spell(SB.MindFlay).current and (-spell(SB.VoidBolt) == 0 or -spell(SB.MindBlast) == 0 or -spell(SB.ShadowWordVoid) == 0) then
       stopcast()
    end

    if castable(SB.MindFlay) and -spell(SB.MindFlay) == 0 then
        return cast(SB.MindFlay, 'target')
    end    

end        

end
end

local function resting()

--actions.precombat+=/shadowform,if=!buff.shadowform.up
if castable(SB.Shadowform) and -spell(SB.Shadowform) == 0 and player.buff(SB.Shadowform).down then
    return cast(SB.Shadowform, 'player')
end    

--Power Word Fortitude
if castable(SB.PowerWordFortitude) and -spell(SB.PowerWordFortitude) == 0 and player.buff(SB.PowerWordFortitude).down then
    return cast(SB.PowerWordFortitude, 'player')
end

if target.alive and target.enemy and player.alive and not player.channeling() then
--actions.precombat+=/mind_blast,if=spell_targets.mind_sear<2|azerite.thought_harvester.rank=0
--actions.precombat+=/vampiric_touch    
--Cast Shadow Word Pain.
    if castable(SB.ShadowWordPain) and -spell(SB.ShadowWordPain) == 0 and target.debuff(SB.ShadowWordPain).down then
        return cast(SB.ShadowWordPain)
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
            { type = 'text', text = 'Suggested Talents - 1 3 1 1 2 1 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
            { type = 'text', text = 'Shift Modifier used for Heroic Leap' },
            { type = 'rule' },
            { type = 'text', text = 'Interrupt Settings' },
            { key = 'intpercentlow', type = 'spinner', text = 'Interrupt Low %', default = '50', desc = 'low% cast time to interrupt at', min = 5, max = 50, step = 1 },
            { key = 'intpercenthigh', type = 'spinner', text = 'Interrupt High %', default = '65', desc = 'high% cast time to interrupt at', min = 51, max = 100, step = 1 },
            { type = 'text', text = 'Defensive Settings' },
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
    

end

-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register({
    spec = dark_addon.rotation.classes.priest.shadow,
    name = 'RexShPr',
    label = 'Rex Shadow Priest',
    combat = combat,
    resting = resting,
    interface = interface
})
