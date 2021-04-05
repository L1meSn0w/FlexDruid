local dark_addon = dark_interface
local SB = dark_addon.rotation.spellbooks.GITwarlock

-- To Do

-- Spells

SB.Deathbolt = 264106
SB.AbsoluteCorruption = 196103
SB.BurningRush = 111400
SB.PhantomSingularity = 205179
SB.MortalCoil = 6789
SB.Haunt = 48181
SB.CreepingDeath = 264000
SB.ShadowBolt = 232670
SB.UnstableAffliction = 30108
SB.Agony = 980
SB.SeedofCorruption = 27243
SB.Corruption = 172
SB.SummonDarkglare = 205180
SB.DrainLife = 234153
SB.HealthFunnel = 755
SB.SummonImp = 688
SB.Fear = 5782
SB.CreateHealthstone = 6201
SB.SummonVoidwalker = 697
SB.EyeofKilrogg = 126
SB.UnendingBreath = 5697
SB.SummonSuccubus = 712
SB.Banish = 710
SB.SoulLeech = 108366
SB.SummonFelhunter = 691
SB.CommandDemon = 119898
SB.RitualofSummoning = 698
SB.Soulstone = 20707
SB.UnendingResolve = 104773
SB.EnslaveDemon = 1098
SB.Shadowfury = 30283
SB.CreateSoulwell = 29893
SB.MasteryPotentAfflictions = 77215
SB.DemonicGateway = 111771
SB.Relentless = 196029
SB.GladiatorsMedallion = 208683
SB.Adaptation = 214027
SB.RotandDecay = 212371
SB.EssenceDrain = 221711
SB.CurseofShadows = 234877
SB.CurseofFragility = 199954
SB.CurseofTongues = 199890
SB.CurseofWeakness = 199892
SB.NetherWard = 212295
SB.EndlessAffliction = 213400
SB.Soulshatter = 212356


local function combat()
  if target.alive and target.enemy and player.alive and not player.channeling() then
    local useagony = true

  --Apply Agony to targets to generate Soul Shards and deal damage. Agony is instant cast, so you can deal with multiple targets while on the move.
      if castable(SB.Agony) and -spell(SB.Agony) == 0 and (not -target.debuff(SB.Agony) or target.debuff(SB.Agony).remains <= 5.4) then
        return cast(SB.Agony, 'target')
      end

  	-- maintain focus dots while multi targetting
  	if focus.alive and focus.enemy then
			if useagony and not focus.debuff(SB.Agony) or focus.debuff(SB.Agony).remains <= 5 then
			  return cast(SB.Agony, 'focus')
			end
    end
    
    --Cast Shadow Bolt to deal damage.
    if castable(SB.ShadowBolt) and -spell(SB.ShadowBolt) == 0 then
      return cast(SB.ShadowBolt, 'target')
    end
  

  end
end

-- local function gcd()
-- 	if player.combat then
-- 			local useagony = true --dark_addon.settings.fetch('furrylock_agony_dot')
-- 		   local index = 0
-- 		   local NotMain = true
-- 		   local MainTarget = UnitGUID("target")
-- 		   TargetNearestEnemy()
-- 		   while(NotMain)
-- 		   do
-- 			  -- check bug Agony & Corruption
-- 			  --local HasAgony = false
-- 			  --local HasCorruption = false
-- 			  local AgonyDur

-- 			  for i = 1, 40 do
-- 				 name, a, b, c, d, dur = UnitDebuff("target", i, "PLAYER")
-- 				 if (name == "Agony") then
-- 					--HasAgony = true  
-- 					AgonyDur = dur     
-- 				 end
-- 			  end

-- 			  -- update buffs
-- 			  if useagony and (AgonyDur == nil or AgonyDur-5 < GetTime()) and target.alive then
-- 				CastSpellByName("Agony")
-- 			  end

-- 			  --Check for next
-- 			  TargetNearestEnemy()

-- 			  --Check Stuff
-- 			  if(MainTarget == UnitGUID("target") or index == 30) then
-- 				 NotMain = false
-- 			  end
-- 			  index = index + 1
-- 		   end
-- 		--print("Done, back to main '" .. UnitName("target") .. "' " .. index);
-- 	end

-- end

local function resting()

end


local function interface()

    local settings = {
        key = 'afflo_settings',
        title = 'Affliction Warlock',
        width = 300,
        height = 500,
        resize = true,
        show = false,
        template = {
            { type = 'header', text = "            Rex's Affliction Warlock Settings" },
            { type = 'text', text = 'Everything on the screen is LIVE.  As you make changes, they are being fed to the engine' },
            { type = 'text', text = 'Suggested Talents - 1 3 1 1 2 1 1' },
            { type = 'text', text = 'If you want automatic AOE then please remember to turn on EnemyNamePlates in WoW (V key)' },
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
	dark_addon.interface.buttons.add_toggle({
		name = 'auto_dot',
		label = 'Apply Dot to All Units (set in settings)',
		on = {
		  label = 'Dot',
		  color = dark_addon.interface.color.dark_blue,
		  color2 = dark_addon.interface.color.ratio(dark_addon.interface.color.dark_blue, 0.7)
		},
		off = {
		  label = 'Dot',
		  color = dark_addon.interface.color.grey,
		  color2 = dark_addon.interface.color.dark_grey
		}
    })
    
end

-- This is what actually tells DR about your custom rotation
dark_addon.rotation.register({
    spec = dark_addon.rotation.classes.warlock.destruction,
    name = 'RexDestLock',
    label = 'Rex Destruction Warlock',
    combat = combat,
    resting = resting,
    interface = interface,
    gcd = gcd
})
